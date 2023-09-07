package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javachip.service.AddressService;
import com.javachip.service.CartService;
import com.javachip.service.HelpService;
import com.javachip.service.MileageService;
import com.javachip.service.Order_DetailService;
import com.javachip.service.Order_Service;
import com.javachip.service.PattachService;
import com.javachip.service.ProductService;
import com.javachip.service.ReviewService;
import com.javachip.service.UserService;
import com.javachip.vo.AddressVO;
import com.javachip.vo.CartVO;
import com.javachip.vo.MileageVO;
import com.javachip.vo.Order_DetailVO;
import com.javachip.vo.Order_VO;
import com.javachip.vo.PageMaker;
import com.javachip.vo.PattachVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.ReviewVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/shop")
public class ShopController {
	
	@Autowired
	private UserService us;
	@Autowired
	private CartService cs;
	@Autowired
	private Order_Service os;
	@Autowired
	private Order_DetailService ods;
	@Autowired
	private MileageService ms;
	@Autowired
	private ProductService ps;
	@Autowired
	private PattachService pas;
	@Autowired
	private ReviewService rs;
	@Autowired
	private PageMaker pm;
	@Autowired
	private AddressService as;
	@Autowired
	private HelpService hs;
	
	@RequestMapping(value="/grid.do")
	public String grid(
			HttpServletRequest req
		,	Model model
		,	SearchVO searchVO
		) {
		// 사업자 도매 - 관리자와 사업자
		if(searchVO.getSearchType() != null && searchVO.getSearchValue() != null) {
			if(searchVO.getSearchType().equals("pType") && searchVO.getSearchValue().equals("E")) {
				HttpSession session = req.getSession();
				UserVO loginVO = (UserVO)session.getAttribute("login");
				if(loginVO==null) {
					return "redirect:/member/login.do";
				}// 유저 선택 필요
				if(!loginVO.getuStatus().equals("B")) {
					if(!loginVO.getuStatus().equals("A")) {
						return "redirect:wholesale.do";
					}
				}
			}
		}
		if(searchVO.getSearchType() == null) {
			searchVO.setSearchType("grid");
		}
		int cnt = ps.totalProduct(searchVO); // 총 상품 개수
		searchVO.setPerPageNum(12);			 // 페이지 당 상품 개수
		searchVO.calcStart();				 // 쿼리용 계산함수
		if(searchVO.getSort() == null || searchVO.getSort().equals("")) {
			searchVO.setSort("new");
		}
		pm.setSearchVO(searchVO);
		pm.setTotalCount(cnt);
		List<ProductVO> productList = ps.selectAllProduct(searchVO);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pm", pm);
		
		return "shop/grid";
	}
	
	@RequestMapping(value="/wholesale.do")
	public void wholesale(
			HttpServletRequest req
		,	HttpServletResponse res
		,	Model model
			) throws IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			pw.append("<script>alert('사업자 회원 계정으로 로그인이 필요한 서비스입니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
			pw.flush();
			return;
		} // 유저 선택 필요
		if(!loginVO.getuStatus().equals("B")) {
			if(!loginVO.getuStatus().equals("A")) {
				String str = "<script>"
						+ "alert('사업자 회원 전용 상품입니다.');"
						+ "location.href='grid.do';"
						+ "</script>";
				pw.append(str);
				pw.flush();
				return;
			}
		}else {
			String str = "<script>"
					+ "location.href='grid.do?searchType=pType&searchValue=E';"
					+ "</script>";
			pw.append(str);
			pw.flush();
			return;
		}
		
	}
	
	@RequestMapping(value="/details.do")
	public String details(
			HttpServletRequest req
		,	Model model
		,	int pNo
			) {
		ProductVO pv = ps.selectOneProduct(pNo);
		System.out.println(pv);
		
		// 도매 상품은 사업자만
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(pv.getpType().equals("E")) {
			if(loginVO == null || !loginVO.getuStatus().equals("B")) {
				return "redirect:wholesale.do";
			}
		}
		
		// searchVO 설정 고정
		SearchVO searchVO = new SearchVO();
		searchVO.setSearchType("pNo");
		searchVO.setSearchValue(String.valueOf(pNo));
		
		// 리뷰 조회 + 작성 가능한지
		List<ReviewVO> reviewList = rs.selectReview(searchVO);
		
		boolean canReview = false;
		if(loginVO!=null) {
			int uNo = loginVO.getuNo();
			List<Order_VO> orderList = os.selectUserOrder(uNo);
			for(Order_VO items : orderList) {
				List<Order_DetailVO> odList = ods.selectOrderDetail(items.getoNo());
				for(Order_DetailVO dItems : odList) {
					if(dItems.getpNo() == pNo) {
						canReview = true;
					}
				}
			}
		}
		
		// QnA 조회
		List<QnaVO> qnaList = hs.selectQnaList(searchVO);
		
		
		model.addAttribute("pv", pv);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("canReview", canReview);
		
		model.addAttribute("qnaList",qnaList);
		return "shop/details";
	}
	
	@RequestMapping(value="/reviewWrite.do")
	@ResponseBody
	public int reviewWrite(
				HttpServletRequest req
			,	int pNo
			,	String rContents
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return -1;
		}
		
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		System.out.println("rContents::"+rContents);
		
		ReviewVO rv = new ReviewVO();
		rv.setuNo(uNo);
		rv.setpNo(pNo);
		rv.setrContents(rContents);
		
		int result = rs.insertReview(rv);
		if(result != 1) {
			return 2;
		}
		return 1;
	}
	
	@RequestMapping(value="deleteReview.do")
	@ResponseBody
	public int deleteReview(
			int rNo
			) {
		int result = rs.deleteOneReview(rNo);
		return result;
	}
	
	@RequestMapping(value="updateReview.do")
	@ResponseBody
	public int updateReview(
			ReviewVO rv
			) {
		System.out.println(rv);
		int result = rs.updateReview(rv);
		return result;
	}
	
	@RequestMapping(value="/addCart.do")
	@ResponseBody
	public int addCart(
			HttpServletRequest req
			,	int pNo
			,	int cCount
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return -1;
		}
		
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		System.out.println("pNo::"+pNo);
		System.out.println("cCount::"+cCount);
		
				
		CartVO cv = new CartVO();
		cv.setuNo(uNo);
		cv.setpNo(pNo);
		cv.setcCount(cCount);
		
		int checkCart = cs.checkDupCart(cv);
		if(checkCart > 0) {
			// 중복
			return 2;
		}
		int result = cs.addCart(cv);
		if(result != 1) {
			// 오류
			System.out.println(result);
			return 0;
		}
		return result;
	}
	
	@RequestMapping(value="/buyNow.do")
	public void buyNow(
			HttpServletRequest req
			,	Model model
			,	int pNo
			,	int cCount
			,	HttpServletResponse res
			,	RedirectAttributes rttr
			) throws IOException {
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			pw.append("<script>alert('로그인이 필요한 서비스입니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
			pw.flush();
			return;
		}
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		
		// 장바구니에 존재하는 지 검사
		List<CartVO> cart = cs.selectCartByUno(uNo);
		for(CartVO items : cart) {
			
			// 정기배송 상품은 비우기
			cs.deleteRegCart(uNo);
			
			if(items.getpNo() == pNo) {
				pw.append("<script>alert('이미 장바구니에 있는 상품입니다.');location.href='"+req.getContextPath()+"/mypage/cart.do';</script>");
				pw.flush();
				return;
			}
		}
		
		CartVO cv = new CartVO();
		cv.setuNo(uNo);
		cv.setpNo(pNo);
		cv.setcCount(cCount);
		int result = cs.addCart(cv);
		if(result <= 0) {
			pw.append("<script>alert('오류가 발생했습니다.');location.href='details.do?pNo='"+pNo+";</script>");
			pw.flush();
			return;
		}
		int cNo = cv.getcNo();
		
		pw.append("<form id='buyNow' method='get' action='checkout.do'>"
				+ "<input type='hidden' name='selCartList' value='"+cNo+"'>"
				+ "</form>"
				+ "<script>window.onload=function(){document.getElementById('buyNow').submit();}</script>");
		pw.flush();
	}
	
	@RequestMapping(value="/checkout.do", method=RequestMethod.GET)
	public String checkout(
			HttpServletRequest req
		,	Model model
		,	String[] selCartList
		,	SearchVO searchVO
		
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		System.out.println(selCartList);
		
		// 주소 목록 출력
		AddressVO addvo = as.addressSelect(uNo);
		System.out.println(addvo);
		
		//1.리스트 중에서 하나 꺼내 출력
		
		//2. sql 나눠서 onclick으로 두개 나눠 ajax
		
		// 마일리지 조회
		int totalMileage = 0;
		if(ms.selectTotalMileage(uNo) != 0) {
			totalMileage = ms.selectTotalMileage(uNo);
		}
		System.out.println("totalMileage::"+totalMileage);
		
		// 선택한 장바구니 모두 조회
		List<CartVO> orderList = new ArrayList<CartVO>();
		for(String items : selCartList) {
			System.out.println(items);
			int cNo = Integer.parseInt(items);
			System.out.println(cNo);
			CartVO order = cs.selectCartForOrder(cNo);
			System.out.println(order);
			orderList.add(order);
		}
		
		// 모델로 전달
		model.addAttribute("totalMileage", totalMileage);
		model.addAttribute("orderList", orderList);
		model.addAttribute("addvo", addvo);
		
		return "shop/checkout";
	}
	@RequestMapping(value="/checkout.do", method=RequestMethod.POST)
	public String checkout(
			HttpServletRequest req
		,	String point
		,	String total
		,	String[] cNo
		,	String addNo
		,	Model model
		,	AddressVO addressVO
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		System.out.println("uNo::"+uNo);
		
		System.out.println("total::"+total);
		int totalPrice = Integer.parseInt(total);
		int oAdd = Integer.parseInt(addNo);
		
		Order_VO ov = new Order_VO();
		ov.setuNo(uNo);
		ov.setoTotalPrice(totalPrice);
		ov.setoPay("C");
		ov.setoStatus("O");
		ov.setAddNo(oAdd);
		System.out.println(ov);
		
		int result = os.insertOrder(ov);
		int oNo = ov.getoNo();
		
		if(result == 1) {
			
			// 구매한 장바구니를 주문 상세로
			for(String items : cNo) {
				int cartNo = Integer.parseInt(items);
				CartVO cv = cs.selectCartForOrder(cartNo);
				Order_DetailVO odvo = new Order_DetailVO();
				
				odvo.setoNo(oNo);
				odvo.setpNo(cv.getpNo());
				odvo.setdCount(cv.getcCount());
				
				ods.insertOrderDetail(odvo);
				
				cs.deleteOneCart(cartNo);
			}
			
			// 사용할 적립금(마일리지)
			int usePoint = Integer.parseInt(point);
			System.out.println("point::"+point);
			if(usePoint != 0) {
				session.setAttribute("point", point);
				if(usePoint > ms.selectTotalMileage(uNo))
				{
					System.out.println("using point error");
					return "redirect:/";
				}
				MileageVO mv = new MileageVO();
				mv.setuNo(uNo);
				mv.setmMinus(usePoint);
				mv.setmNote("상품 결제");
				ms.minusMileage(mv);
				System.out.println("using point::"+point);
			}
			
			// 적립될 마일리지
			MileageVO insertMV = new MileageVO();
			insertMV.setuNo(uNo);
			double addMileage = totalPrice*0.05;
			insertMV.setmPlus((int)addMileage);
			insertMV.setmNote("상품 결제를 통한 적립");
			ms.plusMileage(insertMV);
			System.out.println("주문 성공");
		}else {
			System.out.println("주문 에러");
			return "shop/checkout";
		}
		
		//배송시 전달사항 업데이트
		int comment = as.updateComment(addressVO);
		return "redirect:/";
	}
	
	// 배송지 팝업
	@RequestMapping(value="/addressPopup.do", method=RequestMethod.GET)
    public String addressPopup(Model model, AddressVO addressVO, HttpServletRequest req)
	{
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		
		int uNo = loginVO.getuNo();
	    AddressVO addvo = as.addressSelect(uNo);
	    model.addAttribute("addvo", addvo);
		
		return "shop/addressPopup";
	}
	
	//배송지 팝업
	@ResponseBody
	@RequestMapping(value="/addressPopup.do", method=RequestMethod.POST)
	public int addressPopup(AddressVO addressVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		int uNo = loginVO.getuNo();
		
		int result = as.updateAddress(addressVO);
		
		return result;
	}
	@ResponseBody
	@RequestMapping(value="/addressAddPopup.do", method=RequestMethod.POST)
	public int addressAddPopup(AddressVO addressVO, HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		int result = 0;
		int uNo = loginVO.getuNo();
		
		if(as.countAdd(uNo) == 0) {
			addressVO.setaStatus("A");
			result = as.insertAddress(addressVO);
		}else if(as.countAdd(uNo) == 1) {
			addressVO.setaStatus("B");
			result = as.insertAddress(addressVO);
		}else {
			result = 0;
		}
		return result;
	}
	
	//체크박스 시 주문자 정보와 동일한 기능
	@ResponseBody
	@RequestMapping(value = "/same.do", method = RequestMethod.POST)
	public ResponseEntity<Map<String, Object>> same(@RequestParam int uNo, HttpServletRequest req) {
	    HttpSession session = req.getSession();
	    UserVO loginVO = (UserVO) session.getAttribute("login");

	    UserVO userVO = new UserVO();
	    userVO.setuNo(loginVO.getuNo());
	    userVO.setuAdd1(loginVO.getuAdd1());
	    userVO.setuAdd2(loginVO.getuAdd2());
	    userVO.setuAdd3(loginVO.getuAdd3());
	    userVO.setuMail(loginVO.getuMail());
	    userVO.setuName(loginVO.getuName());
	    userVO.setuPhone(loginVO.getuPhone());

	    as.SamePerson(uNo);

	    Map<String, Object> responseData = new HashMap<>();
	    responseData.put("aName", userVO.getuName());
	    responseData.put("addr1", userVO.getuAdd1());
	    responseData.put("addr2", userVO.getuAdd2());
	    responseData.put("addr3", userVO.getuAdd3());
	    responseData.put("aPhone", userVO.getuPhone());
	    responseData.put("aMail", userVO.getuMail());

	    return ResponseEntity.ok(responseData);
	}
	
	//기본페이지 불러오기
	@ResponseBody
	@RequestMapping(value="/selectAddress.do")
	public ResponseEntity<?> selectAddress(@RequestParam("selectedSort") String selectedSort,
			@RequestParam int uNo)
	{
		
		AddressVO addvo;
		System.out.println(uNo);
		
		if (selectedSort.equals("main")) {
			addvo = as.addressSelect(uNo);
		} else {
			addvo = as.addressSelectSub(uNo);
		}
		
		return ResponseEntity.ok(addvo);
	}
}

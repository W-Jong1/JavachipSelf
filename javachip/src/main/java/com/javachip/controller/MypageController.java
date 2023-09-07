package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javachip.service.CartService;
import com.javachip.service.HelpService;
import com.javachip.service.MileageService;
import com.javachip.service.Order_DetailService;
import com.javachip.service.Order_Service;
import com.javachip.service.ReviewService;
import com.javachip.service.UserService;
import com.javachip.vo.CartVO;
import com.javachip.vo.MileageVO;
import com.javachip.vo.Order_DetailVO;
import com.javachip.vo.Order_VO;
import com.javachip.vo.PageMaker;
import com.javachip.vo.QnaVO;
import com.javachip.vo.ReviewVO;
import com.javachip.vo.SearchVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Autowired
	private CartService cs;
	@Autowired
	private MileageService ms;
	@Autowired
	private UserService us;
	@Autowired
	private Order_Service os;
	@Autowired
	private Order_DetailService ods;
	@Autowired
	private HelpService hs;
	@Autowired
	private ReviewService rs;
	@Autowired
	private PageMaker pm;
	@Autowired
	BCryptPasswordEncoder pe;
	
	@RequestMapping(value="/cart.do", method=RequestMethod.GET)
	public String cart(HttpServletRequest req, Model model) {
		HttpSession session = req.getSession();
		// 로그인 여부 확인
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		System.out.println("loginVO::"+loginVO);
		
		// 정기배송 장바구니 삭제
		cs.deleteRegCart(uNo);
		
		// 장바구니 조회
		System.out.println("uNo::"+uNo);
		List<CartVO> cartList = cs.selectCartByUno(uNo);
		System.out.println(cartList);
		
		
		// 모델로 전달
		model.addAttribute("cartList", cartList);
		model.addAttribute("uNo", uNo);
		return "mypage/cart";
	}
	
	@RequestMapping(value="/cart.do", method=RequestMethod.POST)
	public String cart(
			HttpServletRequest req
		,	RedirectAttributes rttr
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		String[] selCartList = req.getParameterValues("chkCart");
		for(String items : selCartList) {
			System.out.println("selCart::"+items);
		}
		rttr.addAttribute("selCartList", selCartList);
		return "redirect:/shop/checkout.do";
	}
	
	// ajax start
	@RequestMapping(value="/updateCount.do", method=RequestMethod.POST)
	@ResponseBody
	public int updateCount(int cNo, int cCount) {
		System.out.println("cNo::"+cNo);
		System.out.println("cCount::"+cCount);
		CartVO cv = new CartVO();
		cv.setcNo(cNo);
		cv.setcCount(cCount);
		return cs.updateCart(cv);
	}
	
	@RequestMapping(value="/deleteCart.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteCart(int cNo) {
		return cs.deleteOneCart(cNo);
	}
	
	@RequestMapping(value="/deleteAllCart.do", method=RequestMethod.POST)
	@ResponseBody
	public int deleteAllCart(int uNo) {
		return cs.deleteAllCart(uNo);
	}
	// ajax end
	
	@RequestMapping(value="/goodbye.do", method=RequestMethod.GET)
	public String goodbye(HttpServletRequest req, Model model) {

		HttpSession session = req.getSession();
		// 로그인 여부 확인
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		System.out.println("loginVO::"+loginVO);
		
		return "mypage/goodbye";
	}
	
	@RequestMapping(value="/goodbye.do", method=RequestMethod.POST)
	public String goodbye(HttpServletRequest req, Model model,
			UserVO userVO, RedirectAttributes ra, HttpServletResponse res) throws Exception{
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		HttpSession session = req.getSession();
		// 로그인 여부 확인
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		int uNo = loginVO.getuNo();
		userVO.setuNo(uNo);
//		System.out.println("userVO:"+userVO);
		UserVO uv = us.infoCheck(uNo);
		String oldPass = uv.getuPw();
		String newPass = userVO.getuPw();
		if(true == pe.matches(newPass, oldPass)) {
			us.goodbye(uNo);
			ra.addFlashAttribute("result", "removeOK");
			session.invalidate();
			return "redirect:/";
		}else {
			ra.addFlashAttribute("result", "removeFalse");
			return "redirect:/mypage/goodbye.do";
		}
	}
	
	@RequestMapping(value="/history.do")
	public String history(
			HttpServletRequest req,
			Model model,
			SearchVO searchVO
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		
		List<Order_VO> orderList = os.selectUserOrder(uNo);
		int cnt = os.countUserOrder(uNo);
		System.out.println("uNo::"+uNo);
		System.out.println("cnt::"+cnt);
		searchVO.calcStart();
		pm.setSearchVO(searchVO);
		pm.setTotalCount(cnt);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("pm", pm);
		
		return "mypage/history";
	}
	
	@RequestMapping(value="/hdetail.do")
	public String hdetail(
			int oNo,
			HttpServletRequest req,
			Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		
		// 주문 조회
		List<Order_VO> orderList = os.selectUserOrder(uNo);
		int chkDup = 0;
		Order_VO thisOrder = null;
		for(Order_VO items : orderList) {
			if(items.getoNo() == oNo) {
				chkDup += 1;
				thisOrder = items;
			}
		}
		if(chkDup != 1) {
			// 해당 주문이 없거나 오류
			return "mypage/history";
		}
		
		List<Order_DetailVO> orderDetail = ods.selectOrderDetail(oNo);
		model.addAttribute("orderDetail", orderDetail);
		model.addAttribute("thisOrder", thisOrder);
		
		return "mypage/hdetail";
	}
	
	
	@RequestMapping(value="/main.do")
	public String main(
			HttpServletRequest req,
			Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		int mileage = ms.selectTotalMileage(uNo);
		int cart = cs.countUserCart(uNo);
		
		model.addAttribute("mileage", mileage);
		model.addAttribute("cart", cart);
		return "mypage/main";
	}
	
	@RequestMapping(value="/mileage.do")
	public String mileage(
			HttpServletRequest req
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		if(ms.selectAllMileage(uNo) != null) {
			List<MileageVO> mileageList = ms.selectAllMileage(uNo);
			model.addAttribute("mileageList", mileageList);
		}
		
		
		return "mypage/mileage";
	}
	
	@RequestMapping(value="/myinfo.do")
	public String myinfo(HttpServletRequest req,Model model){
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		return "mypage/myinfo";
	}
	
	@RequestMapping(value="/myinfoUpdate.do")
	public String myinfoUpdate(HttpServletRequest req,UserVO vo) throws Exception{
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		vo.setuNo(uNo);
		System.out.println(vo);
		us.infoUpdate(vo);
		return "redirect:myinfo.do";
	}

		
	@RequestMapping(value="/pwUpdate.do", method=RequestMethod.GET)
	public String pwUpdate(){
		return "mypage/pwUpdate";
	}
	
	@RequestMapping(value="/pwUpdate.do", method=RequestMethod.POST)
	public void pwUpdate(HttpServletRequest req, UserVO vo, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		
		int uNo = loginVO.getuNo();
		vo.setuNo(uNo);
		
		String uPw = "";
		String encodePw = "";
		
		uPw = vo.getuPw();
		encodePw = pe.encode(uPw);
		
		vo.setuPw(encodePw);
		

		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		us.pwUpdate(vo);
		
		pw.append("<script>alert('비밀번호가 변경되었습니다!');window.close();</script>");
	}
	
	@RequestMapping(value="/myboard.do")
	public String myboard(
			HttpServletRequest req
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		SearchVO sv = new SearchVO();
		sv.setPerPageNum(5);
		sv.setSearchType("uNo");
		sv.setSearchValue(String.valueOf(uNo));
		List<QnaVO> qnaList = hs.selectQnaList(sv);
		List<ReviewVO> reviewList = rs.selectReview(sv);
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("reviewList", reviewList);
		return "mypage/myboard";
	}
	
	@RequestMapping(value="/myqna.do")
	public String myqna(
			HttpServletRequest req
		,	SearchVO searchVO
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		searchVO.setSearchType("uNo");
		searchVO.setSearchValue(String.valueOf(uNo));
		
		List<QnaVO> qnaList = hs.selectQnaList(searchVO);
		int cnt = hs.totalQna(searchVO);
		pm.setSearchVO(searchVO);
		pm.setTotalCount(cnt);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pm", pm);
		return "mypage/myqna";
	}
	
	@RequestMapping(value="/myreview.do")
	public String myreview(
			HttpServletRequest req
		,	SearchVO searchVO
		,	Model model
		) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		searchVO.setSearchType("uNo");
		searchVO.setSearchValue(String.valueOf(uNo));
		searchVO.calcStart();
		
		List<ReviewVO> reviewList = rs.selectReview(searchVO);
		int cnt = rs.countReview(searchVO);
		pm.setSearchVO(searchVO);
		pm.setTotalCount(cnt);
		
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("pm", pm);
		return "mypage/myreview";
	}
	
	@RequestMapping(value="/regular.do")
	public String regular(
			HttpServletRequest req
		,	Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return "redirect:/member/login.do";
		}
		int uNo = loginVO.getuNo();
		
		List<Order_DetailVO> odvo = ods.selectUserRegularProduct(uNo);
		
		model.addAttribute("regularList", odvo);
		return "mypage/regular";
	}
	
	@RequestMapping(value="/cancelRegular.do")
	@ResponseBody
	public int cancelRegular(
			int oNo
		,	HttpServletRequest req
		,	Model model
			) {
		HttpSession session = req.getSession();
		UserVO loginVO = (UserVO)session.getAttribute("login");
		if(loginVO==null) {
			return 0;
		}
		Order_VO ov = os.selectUserRegularOrder(oNo);
		ov.setoStatus("X");
		int result = os.updateOrderStatus(ov);
		return result;
	}
	
	// 매월 첫째 주 수요일 9시 실행
	@Scheduled(cron="0 0 9 1-7 * WED")
	public void regularOrder() {
		List<Order_DetailVO> rOrderDetail = ods.selectAllUserRegularProduct();
		for(Order_DetailVO items : rOrderDetail) {
			Order_VO ov = os.selectUserRegularOrder(items.getoNo());
			ov.setoStatus("W");
			os.insertOrder(ov);
			items.setoNo(ov.getoNo());
			ods.insertOrderDetail(items);
		}
		System.out.println("Scheduled Complete!");
	}
}

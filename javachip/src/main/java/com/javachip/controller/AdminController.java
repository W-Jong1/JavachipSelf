package com.javachip.controller;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.javachip.service.HelpService;
import com.javachip.service.Order_Service;
import com.javachip.service.PattachService;
import com.javachip.service.ProductService;
import com.javachip.service.RefundService;
import com.javachip.service.UserService;
import com.javachip.vo.AdminPageMaker;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.Order_VO;
import com.javachip.vo.PattachVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.RefundVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/admin")
public class AdminController 
{	
	@Autowired
	private UserService us;
	
	@Autowired
	private AdminPageMaker pm;
	
	@Autowired
	private HelpService hs;
	
	@Autowired
	private Order_Service os;
	
	@Autowired
	private ProductService ps;
	
	@Autowired
	private PattachService pas;
	
	@Autowired
	private RefundService rs;
	
	@RequestMapping(value="/qnaList.do")
	public String qnaList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = hs.QnATotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<QnaVO> qlist = hs.selectQnAByAdminFromQna(AdminSearchVO);
		model.addAttribute("list", qlist);
		model.addAttribute("pm", pm);
		
		return "admin/qnaList";
	}
	
	@RequestMapping(value="/boardList.do")
	public String boardList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = hs.NoticeTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<NoticeVO> nlist = hs.selectNoticeByAdminFromNotice(AdminSearchVO);

		model.addAttribute("list", nlist);
		model.addAttribute("pm", pm);
		
		return "admin/boardList";
	}
	
	@RequestMapping(value="/deliveryList.do")
	public String deliveryList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = os.OrderTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<Order_VO> olist = os.list(AdminSearchVO);
		System.out.println(olist);
		model.addAttribute("list", olist);
		model.addAttribute("pm", pm);
		
		return "admin/deliveryList";
	}
	
	@RequestMapping(value="/main.do")
	public String main(Model model, AdminSearchVO AdminSearchVO)
	{
		int qcnt = hs.QnATotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setqTotalCount(qcnt);
		
		int pcnt = ps.productTotal(AdminSearchVO);
		AdminPageMaker ppm = new AdminPageMaker();
		ppm.setAdminSearchVO(AdminSearchVO);
		ppm.setpTotalCount(pcnt);
		
		int ncnt = hs.NoticeTotal(AdminSearchVO);
		AdminPageMaker npm = new AdminPageMaker();
		npm.setAdminSearchVO(AdminSearchVO);
		npm.setnTotalCount(ncnt);
		
		AdminSearchVO.setPerPageNum(3);
		
		if(AdminSearchVO.getqPage() > 0)
		{
			AdminSearchVO.setqPage((AdminSearchVO.getqPage() - 1) * AdminSearchVO.getPerPageNum());
		} 
		if(AdminSearchVO.getpPage() > 0)
		{
			AdminSearchVO.setpPage((AdminSearchVO.getpPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		if(AdminSearchVO.getnPage() > 0)
		{
			AdminSearchVO.setnPage((AdminSearchVO.getnPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<QnaVO> qlist = hs.selectQnAByAdmin(AdminSearchVO);
		List<ProductVO> plist = ps.List(AdminSearchVO);
		List<NoticeVO> nlist = hs.selectNoticeByAdmin(AdminSearchVO);
		
		AdminSearchVO pa = new AdminSearchVO();
		pa.setnPage(AdminSearchVO.getnPage());
		pa.setpPage(AdminSearchVO.getpPage());
		pa.setqPage(AdminSearchVO.getqPage());
		
		System.out.println(AdminSearchVO.getnPage());
		System.out.println(AdminSearchVO.getpPage());
		System.out.println(AdminSearchVO.getqPage());
		System.out.println(AdminSearchVO.getPerPageNum());
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("plist", plist);
		model.addAttribute("nlist", nlist);
		model.addAttribute("qpm", pm);
		model.addAttribute("ppm", ppm);
		model.addAttribute("npm", npm);
		model.addAttribute("pa", pa);
	
		return "admin/main";
	}

	@RequestMapping(value="/memberList.do")
	public String memberList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.UserTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
//		System.out.println("test===");
//		System.out.println(AdminSearchVO.getPage());
//		System.out.println("sNum : "+AdminSearchVO.getsNum());
//		System.out.println("perPageNum : "+AdminSearchVO.getPerPageNum());
//		System.out.println(pm.getTotalCount());
		
		// 다음 페이지인 경우
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
//		System.out.println("after sNum : "+AdminSearchVO.getsNum());
		List<UserVO> list = us.list(AdminSearchVO);
		model.addAttribute("list", list);
		model.addAttribute("pm", pm);
		return "admin/memberList";
	}
	
	@RequestMapping(value="/memberDetail.do")
	public String memberDetail(int uNo, Model model, AdminSearchVO adminSearchVO)
	{
		UserVO vo = us.selectUserOneByuNoByAdmin(uNo);
		model.addAttribute("vo", vo);
		
		int cnt = rs.RefundTotal(adminSearchVO);
		pm.setAdminSearchVO(adminSearchVO);
		pm.setnTotalCount(cnt);
		
		if(adminSearchVO.getPage() > 1) 
		{
			adminSearchVO.setsNum((adminSearchVO.getPage() - 1) * adminSearchVO.getPerPageNum());
		}
		
		List<RefundVO> reflist = rs.selectRefund(adminSearchVO);
		model.addAttribute("reflist", reflist);
		model.addAttribute("pm", pm);
		
		
		return "admin/memberDetail";
	}
	
	@RequestMapping(value="/bizmemberList.do")
	public String bizmemberList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.BizUserTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		List<UserVO> Bizlist = us.BizList(AdminSearchVO);
		model.addAttribute("list", Bizlist);
		model.addAttribute("pm", pm);
		
		return "admin/bizmemberList";
	}
	
	@RequestMapping(value="/bizmemberDetail.do")
	public String bizmemberDetail(int uNo, Model model, AdminSearchVO adminSearchVO)
	{
		UserVO bisvo = us.selectBizUserOneByuNoByAdmin(uNo);
		model.addAttribute("vo", bisvo);
		System.out.println(bisvo);
		
		int cnt = rs.RefundTotal(adminSearchVO);
		pm.setAdminSearchVO(adminSearchVO);
		pm.setnTotalCount(cnt);
		
		if(adminSearchVO.getPage() > 1) 
		{
			adminSearchVO.setsNum((adminSearchVO.getPage() - 1) * adminSearchVO.getPerPageNum());
		}
		
		List<RefundVO> reflist = rs.selectRefund(adminSearchVO);
		model.addAttribute("reflist", reflist);
		model.addAttribute("pm", pm);
		
		return "admin/bizmemberDetail";
	}
	
	@RequestMapping(value="/blackList.do")
	public String blackList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = us.blacklistTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		List<UserVO> blacklist = us.blacklist(AdminSearchVO);
		model.addAttribute("list", blacklist);
		model.addAttribute("pm", pm);
		
		return "admin/blackList";
	}
	
	@RequestMapping(value="/blacklistDetail.do")
	public String blacklistDetail(int uNo, Model model, AdminSearchVO adminSearchVO)
	{
		UserVO blacklist = us.selectBlacklistOneByuNoByAdmin(uNo);
		model.addAttribute("vo", blacklist);
		
		int cnt = rs.RefundTotal(adminSearchVO);
		pm.setAdminSearchVO(adminSearchVO);
		pm.setnTotalCount(cnt);
		
		if(adminSearchVO.getPage() > 1) 
		{
			adminSearchVO.setsNum((adminSearchVO.getPage() - 1) * adminSearchVO.getPerPageNum());
		}
		
		List<RefundVO> reflist = rs.selectRefund(adminSearchVO);
		model.addAttribute("reflist", reflist);
		model.addAttribute("pm", pm);
		
		return "admin/blacklistDetail";
	}
	
	//회원 경고
	@ResponseBody
	@RequestMapping(value="/AlertUser.do")
	public String AlertUser(int uNo)
	{
		int result = 0;
		result = us.AlertUser(uNo);
		return result+"";
	}
	
	//회원 정지
	@ResponseBody
	@RequestMapping(value="/StopUser.do")
	public String StopUser(int uNo)
	{
		int result=0;
		result = us.stopUser(uNo);
		return result+"";
	}
	//회원 정지 해제
	@ResponseBody
	@RequestMapping(value="/NonStopUser.do")
	public String NonStopUser(int uNo)
	{
		int result=0;
		result = us.NonStopUser(uNo);
		return result+"";
	}
	
	//사업자 가입대기 해제
	@ResponseBody
	@RequestMapping(value="/cancleWait.do")
	public String cancleWait(int uNo)
	{
		int result=0;
		result = us.cancleWait(uNo);
		return result+"";
	}
	//상품삭제
	@ResponseBody
	@RequestMapping(value="/productDelete.do", method = RequestMethod.POST)
	public int productDelete(int pNo) {
		int result = 0;
		result = ps.productDelete(pNo);
		return result;
	}
	
	//공지사항선택삭제
	@ResponseBody
	@RequestMapping(value="/boardDelete.do")
	public String boardDelete(HttpServletRequest request)
	{

		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size = ajaxMsg.length;
			
			for(int i = 0; i < size; i++) {
				hs.deleteNoticeByAdmin(ajaxMsg[i]);
			}

		return "redirect:"+request.getContextPath()+"/admin/boardList.do";
	}
	
	//QnA선택삭제
	@ResponseBody
	@RequestMapping(value="/qnaDelete.do")
	public String qnaDelete(HttpServletRequest request)
	{
		String[] ajaxMsg = request.getParameterValues("valueArr");
		
		int size = ajaxMsg.length;
		
		for(int i = 0; i < size; i++)
		{
			hs.deleteQnaByAdmin(ajaxMsg[i]);
		}
		return "redirect:"+request.getContextPath()+"/admin/qnaList.do";
	}
	
	//주문 선택삭제
	@ResponseBody
	@RequestMapping(value="/deleteProduct.do")
	public String deleteProduct(HttpServletRequest request)
	{
		String[] ajaxMsg = request.getParameterValues("valueArr");
	
		
		int size = ajaxMsg.length;
		System.out.println(request.getContextPath());
		for(int i = 0; i < size; i++)
		{
			os.deleteProduct(ajaxMsg[i]);
		}
		return "redirect:deliveryList.do";
	}
	
	@RequestMapping(value="/productList.do")
	public String productList(Model model, AdminSearchVO AdminSearchVO)
	{
		int cnt = ps.productTotal(AdminSearchVO);
		pm.setAdminSearchVO(AdminSearchVO);
		pm.setTotalCount(cnt);
		
		if(AdminSearchVO.getPage() > 1) 
		{
			AdminSearchVO.setsNum((AdminSearchVO.getPage() - 1) * AdminSearchVO.getPerPageNum());
		}
		
		List<ProductVO> plist = ps.selectByAdminFromProduct(AdminSearchVO);
		model.addAttribute("list", plist);
		model.addAttribute("pm", pm);
		return "admin/productList";
	}
	
	@RequestMapping(value="/productDetail.do", method=RequestMethod.GET)
	public String productDetail(int pNo, Model model)
	{
		ProductVO product = ps.selectOneProductByAdmin(pNo);
		PattachVO pavo = pas.selectPattach(pNo);
		model.addAttribute("vo", product);
		model.addAttribute("pavo", pavo);
		
		System.out.println(product);
		System.out.println(pavo);
		return "admin/productDetail";
	}
	
	@RequestMapping(value = "/productDetail.do", method = RequestMethod.POST)
	public String productDetail(ProductVO productVO, MultipartFile uploadFile,
			RedirectAttributes rttr, HttpServletRequest req, PattachVO pattachVO) throws Exception {
		
		int result = ps.productUpdateByAdmin(productVO);
		if(result > 0) {
			int newProductNo = productVO.getpNo();
			
			String realPath = req.getSession().getServletContext().getRealPath("/resources/upload");
			

			File dir = new File(realPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String fileNM = uploadFile.getOriginalFilename();
				String fileNMArray[] = fileNM.split("\\.");
				String etc =  fileNMArray[fileNMArray.length-1];

				long timeMilis = System.currentTimeMillis();

				String newFileNM = fileNM.substring(0, fileNM.length() - etc.length() - 1) + timeMilis + "." + etc;

				uploadFile.transferTo(new File(realPath, newFileNM));
				
				pattachVO.setpNo(newProductNo);
				pattachVO.setaOriginName(uploadFile.getOriginalFilename());
				pattachVO.setaChangeName(newFileNM);
				
				int result2 = ps.pattchUpdateByAdmin(pattachVO);
				int aNo = pattachVO.getaNo();
				if (result2 >= 0) {
					return "redirect:/admin/productDetail.do?pNo="+productVO.getpNo();
				}
			}
		}
		return "redirect:/admin/productDetail.do?pNo="+productVO.getpNo();
	}
	
	@RequestMapping(value="/productOrder.do" , method=RequestMethod.GET)
	public String productOrder()
	{
		return "admin/productOrder";
	}
	
	@RequestMapping(value="/productOrder.do", method=RequestMethod.POST)
	public String productOrder(ProductVO productVO, MultipartFile uploadFile, PattachVO pattachVO,
			HttpServletRequest req, RedirectAttributes rttr) throws Exception {
		
		int result = ps.insertProductByAdmin(productVO);
		System.out.println(productVO);
		if (result > 0) {
			
			int newProductNo = productVO.getpNo(); 

			String realPath = req.getSession().getServletContext().getRealPath("/resources/upload");
			System.out.println(realPath);
			

			File dir = new File(realPath);
			if (!dir.exists()) {
				dir.mkdirs();
			}

			if (!uploadFile.getOriginalFilename().isEmpty()) {
				String fileNM = uploadFile.getOriginalFilename();
				String fileNMArray[] = fileNM.split("\\.");
				String etc =  fileNMArray[fileNMArray.length-1];

				long timeMilis = System.currentTimeMillis();

				String newFileNM = fileNM.substring(0, fileNM.length() - etc.length() - 1) + timeMilis + "." + etc;

				uploadFile.transferTo(new File(realPath, newFileNM));

				pattachVO.setpNo(newProductNo);
				pattachVO.setaOriginName(uploadFile.getOriginalFilename());
				pattachVO.setaChangeName(newFileNM);

				
				int result2 = ps.insertAttach(pattachVO);
				int aNo = pattachVO.getaNo();
//				System.out.println(pattachVO);
				rttr.addAttribute("pNo", newProductNo);
				
				if (result2 > 0) {
					return "redirect:/admin/productDetail.do";
				} else {
					return "admin/productOrder";
				}
			}
		}
		return "redirect:/admin/productList.do";
	}
}

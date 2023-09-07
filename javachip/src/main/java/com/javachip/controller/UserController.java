package com.javachip.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javachip.service.MileageService;
import com.javachip.service.UserService;
import com.javachip.vo.MileageVO;
import com.javachip.vo.UserVO;

@Controller
@RequestMapping(value="/member")
public class UserController {
	
	@Autowired
	private UserService us;
	@Autowired
	private MileageService ms;
	@Autowired
	BCryptPasswordEncoder pe; // BCrypt 암호화
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}
	
	// 로그인 컨트롤
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public void login(UserVO vo,HttpServletRequest req, HttpServletResponse res) throws IOException {
		String encodePw = "";
		
		HttpSession session = req.getSession();
		
		UserVO loginVO = us.selectUserByLogin(vo);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		if(loginVO != null) {
			encodePw = loginVO.getuPw();
			//login할 회원이 데이터베이스에 존재
			System.out.println("입력한 번호 : " + vo.getuPw());
			if(true == pe.matches(vo.getuPw(), encodePw)) {
				System.out.println("회원존재");
				
				loginVO.setuPw("");  
				session.setAttribute("login", loginVO);
				String uStatus = loginVO.getuStatus();
				
				if(uStatus.equals("W")) {
					System.out.println("가입 대기 회원");
					session.invalidate();
					pw.append("<script>alert('가입 대기 중인 회원입니다.\\n가입 승인 후 로그인 가능합니다."
							+ "\\n(승인 기간 : 가입일에서 최대 1주일)\\n\\n"
							+ "문의사항은 javachip0703@gmail.com으로 보내주세요.');location.href='"
							+req.getContextPath()+"/member/login.do';</script>");
				}else if(uStatus.equals("Y")) {
					System.out.println("정지 회원");
					session.invalidate();
					pw.append("<script>alert('정지된 계정입니다.\\n "
							+ "자세한 정보는 javachip0703@gmail.com으로 문의해주세요.');location.href='"
							+req.getContextPath()+"/member/login.do';</script>");
				}else{
				pw.append("<script>alert('로그인에 성공했습니다.\\n\\n회원 이름 : " + loginVO.getuName()
						+ "\\n경고 횟수 : "+ loginVO.getuAlertNum() + "');location.href='"+req.getContextPath()+"/';</script>");
				}
			}else if(loginVO.getuPw().equals(vo.getuPw())) {
				System.out.println(loginVO.getuPw());
				System.out.println("임시 비밀번호 로그인");
				session.setAttribute("login", loginVO);
				pw.append("<script>alert('임시 비밀번호로 로그인 하셨습니다.\\n회원 정보 수정 페이지에서 비밀번호를 변경해주세요.');location.href='"+req.getContextPath()+"/mypage/myinfo.do';</script>");
			}else {
				System.out.println("회원존재 X_A");
				pw.append("<script>alert('존재하지 않는 아이디나 비밀번호입니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
			}
		}else{
			//login할 회원이 데이터베이스에 존재 X
			System.out.println(vo.getuPw());
			System.out.println("회원존재 X");
			pw.append("<script>alert('존재하지 않는 아이디나 비밀번호입니다.');location.href='"+req.getContextPath()+"/member/login.do';</script>");
		}
		
		pw.flush();
	}
	
	// 로그아웃 컨트롤
	@RequestMapping(value="/logout.do")
	public void logout(HttpServletRequest req, HttpServletResponse res) throws IOException {
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		try {
			HttpSession session = req.getSession();
			session.invalidate();
			pw.append("<script>alert('로그아웃 되었습니다.');"
						+"location.href='"
					    +req.getContextPath()+"/';</script>");
			
		}catch(Exception e) {
			e.printStackTrace();
			pw.append("<script>alert('로그아웃시 예외가 발생했습니다.');"
					+"location.href='"
				    +req.getContextPath()+"/';</script>");
		}
		
		pw.flush();
		
	}
	
	// 일반/사업자 회원가입 선택
	@RequestMapping(value="/joinSelect.do")
	public String joinSelect() {
		return "member/joinSelect";
	}
	
	
	// 일반 회원가입
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public String join(UserVO vo) {
		String uPw = "";
		String encodePw = "";
		
		uPw = vo.getuPw();
		encodePw = pe.encode(uPw);
		vo.setuPw(encodePw);
		int result = us.insert(vo);
		if(result>0) {
			System.out.println("회원가입 성공");
			
			// 신규 가입 적립금
			int uNo = vo.getuNo();
			MileageVO mv = new MileageVO();
			mv.setuNo(uNo);
			mv.setmPlus(1000);
			mv.setmNote("신규 회원 가입");
			ms.plusMileage(mv);
			
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}
	
	// 사업자 회원가입
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.GET)
	public String joinBiz() {
		return "member/joinBiz";
	}
	
	@RequestMapping(value="/joinBiz.do",method=RequestMethod.POST)
	public String joinBiz(UserVO vo) {
		String uPw = "";
		String encodePw = "";
		
		uPw = vo.getuPw();
		encodePw = pe.encode(uPw);
		vo.setuPw(encodePw);
		int result = us.insertBiz(vo);
		if(result>0) {
			System.out.println("회원가입 성공");
			
			// 신규 가입 적립금
			int uNo = vo.getuNo();
			MileageVO mv = new MileageVO();
			mv.setuNo(uNo);
			mv.setmPlus(1000);
			mv.setmNote("신규 회원 가입");
			ms.plusMileage(mv);
			
		}else {
			System.out.println("회원가입 실패");
		}
		
		return "redirect:login.do";
	}
	
	// 아이디 중복 체크
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCntById(String uId) {
		int result = us.selectCntById(uId);
		
		return result+"";
	}
	
	// 아이디 찾기
	@RequestMapping(value="/idFind.do",method=RequestMethod.GET)
	public String idFind() {
		return "member/idFind";
	}
	
	@RequestMapping(value="/idFind.do",method=RequestMethod.POST)
	public String idFind(UserVO vo,Model model) throws IOException {
		
		UserVO user = us.idFind(vo);
		
		if(user != null) { 
			model.addAttribute("check", 0);
			model.addAttribute("uId", user.getuId());
			System.out.println("아이디 확인 O");
		} else { 
			model.addAttribute("check", 1);
			System.out.println("아이디 확인 X");
		}
		
		return "member/idFind";
	}
	
	// 비밀번호 찾기
	@RequestMapping(value="/pwFind.do",method=RequestMethod.GET)
	public String pwFind() throws Exception {
		return "member/pwFind";
	}
	
	@RequestMapping(value="/pwFind.do", method=RequestMethod.POST)
	public void pwFind(@ModelAttribute UserVO vo, HttpServletResponse res) throws Exception {
		us.pwFind(res, vo);
	}
}

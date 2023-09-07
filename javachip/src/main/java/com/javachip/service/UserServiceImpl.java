package com.javachip.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.javachip.dao.UserDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Repository
public class UserServiceImpl implements UserService {

	// member 페이지
	@Autowired
	private UserDAO userDAO;
	// BCrypt 암호화
	@Autowired
	BCryptPasswordEncoder pe;
	
	@Override
	public UserVO selectUserByLogin(UserVO vo) {
		
		return userDAO.selectMemberByLogin(vo);
	}

	@Override
	public int selectCntById(String uId) {
		return userDAO.selectCntById(uId);
	}

	@Override
	public int insert(UserVO vo) {
		return userDAO.insert(vo);
	}
	
	@Override
	public int insertBiz(UserVO vo) {
		return userDAO.insertBiz(vo);
	}

	@Override
	public UserVO idFind(UserVO vo) {
		
		return userDAO.idFind(vo);
	}
	
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(UserVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "javachip0703@gmail.com";
		String hostSMTPpwd = "jhpkaywwesxzehgn";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "javachip0703@gmail.coom";
		String fromName = "자바칩프라페";
		String subject = "";
		String msg = "";

		if(div.equals("pwFind")) {
			subject = "자바칩프라페 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getuId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getuPw() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getuMail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void pwFind(HttpServletResponse res, UserVO vo) throws Exception {
		res.setContentType("text/html;charset=utf-8");
		UserVO ck = userDAO.idCheck(vo.getuId());
		PrintWriter out = res.getWriter();
		// 가입된 아이디가 없으면
		if(userDAO.idCheck(vo.getuId()) == null) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getuMail().equals(ck.getuMail())) {
			out.print("등록되지 않은 이메일입니다.");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setuPw(pw);
			// 비밀번호 변경
			userDAO.pwFind(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "pwFind");

			out.print("이메일로 임시 비밀번호를 발송하였습니다."+ '\n' +"로그인 후 비밀번호를 꼭 변경해주세요.");
			out.close();
		}
	}
	
	// mypage 관련
	@Override
	public UserVO infoCheck(int uNo){
		return userDAO.infoCheck(uNo);
	}
	
	@Override
	public int infoUpdate(UserVO vo){
		return userDAO.infoUpdate(vo);
	}
	
	@Override
	public int pwUpdate(UserVO vo){
		return userDAO.pwUpdate(vo);
	}

	@Override
	public int goodbye(int uNo){
		return userDAO.goodbye(uNo);
	}
	
	
	//admin용========================================================
	@Override
	public List<UserVO> list(AdminSearchVO AdminSearchVO) 	//관리자 전체 회원 목록(검색기능추가)
	{
		return userDAO.list(AdminSearchVO);
	}

	@Override
	public UserVO selectUserOneByuNoByAdmin(int uNo)		//관리자 세부 회원 목록
	{
		return userDAO.selectUserOneByuNoByAdmin(uNo);
	}

	@Override
	public int UserTotal(AdminSearchVO AdminSearchVO)		//관리자 전체 회원수 (페이징 기능)
	{
		
		return userDAO.UserTotal(AdminSearchVO);
	}

	@Override
	public List<UserVO> BizList(AdminSearchVO AdminSearchVO)		//관리자 전체 사업자 목록(검색기능추가)
	{
		return userDAO.Bizlist(AdminSearchVO);
	}

	@Override
	public int BizUserTotal(AdminSearchVO AdminSearchVO) 		//관리자 전체 사업자유저 회원수(페이징기능)
	{
		return userDAO.BizUserTotal(AdminSearchVO);
	}

	@Override
	public UserVO selectBizUserOneByuNoByAdmin(int uNo) 		//관리자 사업자회원 세부 목록
	{
		return userDAO.selectBizUserOneByuNoByAdmin(uNo);
	}

	@Override
	public List<UserVO> blacklist(AdminSearchVO AdminSearchVO) 		//관리자 블랙리스트 전체 목록(검색기능추가)
	{
		return userDAO.blacklist(AdminSearchVO);
	}

	@Override
	public int blacklistTotal(AdminSearchVO AdminSearchVO) 		//블랙리스트 총 수(페이징)
	{
		return userDAO.blacklistTotal(AdminSearchVO);
	}

	@Override
	public UserVO selectBlacklistOneByuNoByAdmin(int uNo) 		//블랙리스트 회원 세부 관리
	{
		return userDAO.selectBlacklistOneByuNoByAdmin(uNo);
	}

	@Override
	public int AlertUser(int uNo) 
	{
		return userDAO.AlertUser(uNo);
	}

	@Override
	public int stopUser(int uNo) {
		// TODO Auto-generated method stub
		return userDAO.stopUser(uNo);
	}

	@Override
	public int NonStopUser(int uNo) {
		// TODO Auto-generated method stub
		return userDAO.NonStopUser(uNo);
	}

	@Override
	public int cancleWait(int uNo) {
		// TODO Auto-generated method stub
		return userDAO.cancleWait(uNo);
	}


}

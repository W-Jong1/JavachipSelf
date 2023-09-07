package com.javachip.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.UserVO;

@Service
public interface UserService {
	// member 페이지
	UserVO selectUserByLogin(UserVO vo);
	int selectCntById(String uId);
	int insert(UserVO vo);
	int insertBiz(UserVO vo);
	UserVO idFind(UserVO vo);
	public void sendEmail(UserVO vo, String div) throws Exception;	//이메일발송
	public void pwFind(HttpServletResponse res, UserVO vo) throws Exception;	//비밀번호찾기
	
	// mypage 관련
	UserVO infoCheck(int uNo);
	int infoUpdate(UserVO vo);
	int pwUpdate(UserVO vo);
	public int goodbye(int uNo);
	
	//admin용========================================================
	List<UserVO>list(AdminSearchVO AdminSearchVO);	//관리자 전체 회원 목록(검색기능추가)
	UserVO selectUserOneByuNoByAdmin(int uNo);		//관리자 세부 회원 목록
	int UserTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 회원수 (페이징 기능)
	List<UserVO> BizList(AdminSearchVO AdminSearchVO);	//관리자 전체 사업자 목록(검색기능추가)
	int BizUserTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 사업자유저 회원수(페이징기능)
	UserVO selectBizUserOneByuNoByAdmin(int uNo);		//관리자 사업자유저 세부목록
	List<UserVO> blacklist(AdminSearchVO AdminSearchVO);	//관리자 블랙리스트 전체 목록 정지당한횟수 많은순으로 정렬(검색기능추가)
	int blacklistTotal(AdminSearchVO AdminSearchVO);		//블랙리스트 전체 회원수(페이징기능)
	UserVO selectBlacklistOneByuNoByAdmin(int uNo);			//블랙리스트 세부 페이지
	int AlertUser(int uNo);		//회원 경고횟수 +1
	int stopUser(int uNo);		//회원 정지
	int NonStopUser(int uNo);	//회원 정지 해제
	int cancleWait(int uNo); //사업자 대기 해제
}

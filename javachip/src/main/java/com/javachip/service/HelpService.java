package com.javachip.service;

import java.util.List;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

public interface HelpService {
	
	int insertNotice(NoticeVO noticeVO);

	List<NoticeVO> selectNoticeList(SearchVO searchVO);
	
	NoticeVO selectOneByNno(int nNo);
	
	List<NoticeVO> selectNearNno(int nNo);
	
	int deleteNotice(int nNo);
	
	int modifyNotice(NoticeVO noticeVO);
	
	int totalNotice(SearchVO searchVO);
	
	int insertQna(QnaVO qnaVO);
	
	List<ProductVO> selectProductList(SearchVO searchVO);
	
	List<QnaVO> selectQnaList(SearchVO searchVO);
	
	QnaVO selectOneByQno(int qNo);
	
	List<QnaVO> selectNearQno(int qNo);
	
	int deleteQna(int qNo);
	
	int totalQna(SearchVO searchVO);
	
	int AnswerQna(QnaVO qnaVO);
	
	int totalProduct(SearchVO searchVO);
	//====================================관리자 메소드====================================
	//관리자용 공지사항 페이징 구현을 위한 메소드(메인)
	List<NoticeVO> selectNoticeByAdmin(AdminSearchVO AdminSearchVO);
	//관리자용 공지사항 페이징 구현을 위한 메소드(공지사항)
	List<NoticeVO> selectNoticeByAdminFromNotice(AdminSearchVO AdminSearchVO);
	//관리자용 공지사항 페이징 구현을 위한 메소드(qna)
	List<QnaVO>selectQnAByAdminFromQna(AdminSearchVO AdminSearchVO);
	int NoticeTotal(AdminSearchVO AdminSearchVO);		//관리자 전체 공지사항수(페이징기능)
	//관리자용 QnA 검색/페이징 전체 리스트를 위한 메소드(메인)
	List<QnaVO> selectQnAByAdmin(AdminSearchVO AdminSearchVO);
	//관리자용 전체 Qna수(페이징기능)
	int QnATotal(AdminSearchVO AdminSearchVO);
	//관리자 공지사항 선택삭제
	public void deleteNoticeByAdmin(String nNo);
	//관리자 QnA 선택삭제
	public void deleteQnaByAdmin(String qNo);
}

package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javachip.dao.HelpDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

@Service
public class HelpServiceImpl implements HelpService {
	
	@Autowired
	private HelpDAO helpDAO;
	
	@Override
	public int insertNotice(NoticeVO vo) {
		
		return helpDAO.insertNotice(vo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(SearchVO searchVO) {
		
		searchVO.setStartNum( (searchVO.getPage()-1)*searchVO.getPerPageNum() );	// 이전번호의 게시글 만큼 건너뜀.
		
		return helpDAO.selectNoticeList(searchVO);
	}
	
	@Override
	public NoticeVO selectOneByNno(int nNo) {
		
		return helpDAO.selectOneByNno(nNo);
	}
	
	@Override
	public List<NoticeVO> selectNearNno(int nNo) {
		
		return helpDAO.selectNearNno(nNo);
	}
	
	@Override
	public int deleteNotice(int nNo) {
		
		return helpDAO.deleteNotice(nNo);
	}
	
	@Override
	public int modifyNotice(NoticeVO noticeVO) {
		
		return helpDAO.modifyNotice(noticeVO);
	}
	
	@Override
	public int totalNotice(SearchVO searchVO) {
		
		return helpDAO.totalNotice(searchVO);
	}
	
	@Override
	public int insertQna(QnaVO qnaVO) {
		
		return helpDAO.insertQna(qnaVO);
	}
	
	@Override
	public List<ProductVO> selectProductList(SearchVO searchVO) {
		
		searchVO.setStartNum( (searchVO.getPage()-1)*searchVO.getPerPageNum() );
		
		return helpDAO.selectProductList(searchVO);
	}
	
	@Override
	public List<QnaVO> selectQnaList(SearchVO searchVO) {
		
		searchVO.setStartNum( (searchVO.getPage()-1)*searchVO.getPerPageNum() );	// 이전번호의 게시글 만큼 건너뜀.
		
		return helpDAO.selectQnaList(searchVO);
	}

	@Override
	public QnaVO selectOneByQno(int qNo) {
		
		return helpDAO.selectOneByQno(qNo);
	}

	@Override
	public List<QnaVO> selectNearQno(int qNo) {
		
		return helpDAO.selectNearQno(qNo);
	}
	
	@Override
	public int deleteQna(int qNo) {
		
		return helpDAO.deleteQna(qNo);
	}
	
	@Override
	public int totalQna(SearchVO searchVO) {
		
		return helpDAO.totalQna(searchVO);
	}
	
	@Override
	public int totalProduct(SearchVO searchVO) {
		
		return helpDAO.totalProduct(searchVO);
	}
	
	@Override
	public int AnswerQna(QnaVO qnaVO) {
		
		return helpDAO.AnswerQna(qnaVO);
	}
	
	
	//====================================관리자 메소드====================================
	//관리자용 notice 페이징을 위한 메소드(메인)
	@Override
	public List<NoticeVO> selectNoticeByAdmin(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.selectNoticeByAdmin(AdminSearchVO);
	}

	//관리자 전체공지사항 수(페이징)
	@Override
	public int NoticeTotal(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.NoticeTotal(AdminSearchVO);
	}
	
	//관리자용 QnA 검색/페이징 전체 리스트를 위한 메소드(메인)
	@Override
	public List<QnaVO> selectQnAByAdmin(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.selectQnAByAdmin(AdminSearchVO);
	}

	//관리자용 전체 Qna수(페이징기능)
	@Override
	public int QnATotal(AdminSearchVO AdminSearchVO) 
	{
		return helpDAO.QnATotal(AdminSearchVO);
	}
	
	//관리자 공지사항 선택삭제
	@Override
	public void deleteNoticeByAdmin(String nNo) 
	{
		helpDAO.deleteNoticeByAdmin(nNo);
	}

	//관리자 Qna 선택삭제
	@Override
	public void deleteQnaByAdmin(String qNo) 
	{
		helpDAO.deleteQnaByAdmin(qNo);
	}

	//관리자용 notice 페이징을 위한 메소드(공지사항)
	@Override
	public List<NoticeVO> selectNoticeByAdminFromNotice(AdminSearchVO AdminSearchVO) {
		return helpDAO.selectNoticeByAdminFromNotice(AdminSearchVO);
	}
	//관리자용 notice 페이징을 위한 메소드(Qna)
	@Override
	public List<QnaVO> selectQnAByAdminFromQna(AdminSearchVO AdminSearchVO) {
		// TODO Auto-generated method stub
		return helpDAO.selectQnAByAdminFromQna(AdminSearchVO);
	}

}

package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.NoticeVO;
import com.javachip.vo.ProductVO;
import com.javachip.vo.QnaVO;
import com.javachip.vo.SearchVO;

@Repository
public class HelpDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertNotice(NoticeVO noticeVO) {
		return sqlSession.insert("com.javachip.mapper.helpMapper.insertNotice", noticeVO);
	}
	
	public List<NoticeVO> selectNoticeList (SearchVO searchVO) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNoticeAll",searchVO);
	}
	
	public NoticeVO selectOneByNno(int nNo) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.selectOneByNno", nNo);
	}
	
	public List<NoticeVO> selectNearNno (int nNo) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNearNno", nNo);
	}
	
	public int deleteNotice(int nNo) {
		return sqlSession.update("com.javachip.mapper.helpMapper.deleteNotice", nNo);
	}
	
	public int modifyNotice(NoticeVO noticeVO) {
		return sqlSession.update("com.javachip.mapper.helpMapper.modifyNotice",noticeVO);
	}
	public int totalNotice(SearchVO searchVO) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.totalNotice", searchVO);
	}
	
	public int insertQna(QnaVO qnaVO) {
		
		return sqlSession.insert("com.javachip.mapper.helpMapper.insertQna", qnaVO);
	}
	
	public List<ProductVO> selectProductList (SearchVO searchVO) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectProductAll",searchVO);
	}
	
	public List<QnaVO> selectQnaList (SearchVO searchVO) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectQnaAll",searchVO);
	}
	
	public QnaVO selectOneByQno(int qNo) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.selectOneByQno", qNo);
	}
	
	public List<QnaVO> selectNearQno (int qNo) {
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNearQno", qNo);
	}
	
	public int deleteQna(int qNo) {
		return sqlSession.update("com.javachip.mapper.helpMapper.deleteQna", qNo);
	}
	
	public int totalQna(SearchVO searchVO) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.totalQna", searchVO);
	}
	public int totalProduct(SearchVO searchVO) {
		return sqlSession.selectOne("com.javachip.mapper.helpMapper.totalProduct", searchVO);
	}
	
	public int AnswerQna(QnaVO qnaVO) {
		return sqlSession.insert("com.javachip.mapper.helpMapper.answerQna", qnaVO);
	}
	
	//====================================관리자 메소드====================================
	//관리자용 공지사항 검색/페이징 전체 리스트를 위한 메소드(메인)
	public List<NoticeVO> selectNoticeByAdmin (AdminSearchVO AdminSearchVO) 
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNoticeByAdmin",AdminSearchVO);
	}
	//관리자용 공지사항 페이징 구현을 위한 메소드(전체 공지사항 수)
	public int NoticeTotal(AdminSearchVO AdminSearchVO)		
	{
		int value = 0;
		value = sqlSession.selectOne("com.javachip.mapper.helpMapper.NoticeTotal", AdminSearchVO);
		return value;
	}
	//관리자용 공지사항 검색/페이징 전체 리스트를 위한 메소드(공지사항)
	public List<NoticeVO> selectNoticeByAdminFromNotice(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectNoticeByAdminFromNotice",AdminSearchVO);
	}
	//관리자용 공지사항 검색/페이징 전체 리스트를 위한 메소드(qna)
	public List<QnaVO> selectQnAByAdminFromQna(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectQnAByAdminFromQna",AdminSearchVO);
	}
	//관리자용 QnA 검색/페이징 전체 리스트를 위한 메소드(메인)
	public List<QnaVO> selectQnAByAdmin(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList("com.javachip.mapper.helpMapper.selectQnAByAdmin", AdminSearchVO);
	}
	
	//관리자용 QnA 페이징 구현을 위한 메소드(전체 QnA수)
	public int QnATotal(AdminSearchVO AdminSearchVO)
	{
		int value = 0;
		value = sqlSession.selectOne("com.javachip.mapper.helpMapper.QnATotal", AdminSearchVO);
		return value;
	}
	
	//관리자용 공지사항 선택삭제
	public void deleteNoticeByAdmin(String nNo) {
		sqlSession.update("com.javachip.mapper.helpMapper.deleteNoticeByAdmin", nNo);
	}
	
	//관리자 Qna 선택삭제
	public void deleteQnaByAdmin(String qNo)
	{
		sqlSession.update("com.javachip.mapper.helpMapper.deleteQnaByAdmin", qNo);
	}
}

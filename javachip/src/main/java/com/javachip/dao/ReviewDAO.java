package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.ReviewVO;
import com.javachip.vo.SearchVO;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.reviewMapper";
	
	public List<ReviewVO> selectAllReview() {
		return sqlSession.selectList(namespace+".selectAllReview");
	}
	public List<ReviewVO> selectReview(SearchVO searchVO) {
		return sqlSession.selectList(namespace+".selectReview", searchVO);
	}
	public int countReview(SearchVO searchVO) {
		return sqlSession.selectOne(namespace+".countReview", searchVO);
	}
	public int insertReview(ReviewVO reviewVO) {
		return sqlSession.insert(namespace+".insertReview", reviewVO);
	}
	public int updateReview(ReviewVO reviewVO) {
		return sqlSession.update(namespace+".updateReview", reviewVO);
	}
	public int deleteReview(ReviewVO reviewVO) {
		return sqlSession.update(namespace+".deleteReview", reviewVO);
	}
	public int deleteOneReview(int rNo) {
		return sqlSession.update(namespace+".deleteOneReview", rNo);
	}
}

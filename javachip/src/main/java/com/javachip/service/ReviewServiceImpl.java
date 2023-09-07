package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.ReviewDAO;
import com.javachip.vo.ReviewVO;
import com.javachip.vo.SearchVO;

@Repository
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDAO reviewDAO;

	@Override
	public List<ReviewVO> selectAllReview() {
		return reviewDAO.selectAllReview();
	}
	@Override
	public List<ReviewVO> selectReview(SearchVO searchVO) {
		return reviewDAO.selectReview(searchVO);
	}
	@Override
	public int countReview(SearchVO searchVO) {
		return reviewDAO.countReview(searchVO);
	}
	@Override
	public int insertReview(ReviewVO reviewVO) {
		return reviewDAO.insertReview(reviewVO);
	}
	@Override
	public int updateReview(ReviewVO reviewVO) {
		return reviewDAO.updateReview(reviewVO);
	}
	@Override
	public int deleteReview(ReviewVO reviewVO) {
		return reviewDAO.deleteReview(reviewVO);
	}
	@Override
	public int deleteOneReview(int rNo) {
		return reviewDAO.deleteOneReview(rNo);
	}
}

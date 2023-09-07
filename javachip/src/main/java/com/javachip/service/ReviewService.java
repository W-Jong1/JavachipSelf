package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.ReviewVO;
import com.javachip.vo.SearchVO;

@Service
public interface ReviewService {
	List<ReviewVO> selectAllReview();
	List<ReviewVO> selectReview(SearchVO searchVO);
	int countReview(SearchVO searchVO);
	int insertReview(ReviewVO reviewVO);
	int updateReview(ReviewVO reviewVO);
	int deleteReview(ReviewVO reviewVO);
	int deleteOneReview(int rNo);
}

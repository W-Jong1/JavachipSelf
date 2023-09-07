package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.RefundVO;

@Service
public interface RefundService {

	//환불 전체 리스트
	List<RefundVO> selectRefund(AdminSearchVO adminSearchVO);
	//페이징 위한 환불 전체 목록 갯수
	int RefundTotal(AdminSearchVO adminSearchVO);
}

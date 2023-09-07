package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.RefundDAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.RefundVO;

@Repository
public class RefundServiceImpl implements RefundService{

	@Autowired
	private RefundDAO refundDAO;

	//환불 리스트
	@Override
	public List<RefundVO> selectRefund(AdminSearchVO adminSearchVO) {
		return refundDAO.selectRefund(adminSearchVO);
	}

	//페이징 위한 환불 전체 목록 갯수
	@Override
	public int RefundTotal(AdminSearchVO adminSearchVO) {
		return refundDAO.RefundTotal(adminSearchVO);
	}
}

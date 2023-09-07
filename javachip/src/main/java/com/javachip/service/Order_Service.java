package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.Order_VO;

@Service
public interface Order_Service {
	// 사용자
	List<Order_VO> selectUserOrder(int uNo);
	int countUserOrder(int uNo);
	int insertOrder(Order_VO order_VO);
	int updateOrderReceiver(Order_VO order_VO);
	Order_VO selectUserRegularOrder(int oNo);
	
	// 관리자
	List<Order_VO> selectOrderForAdmin();
	int updateOrderStatus(Order_VO order_VO);
	
	
	//관리자용 메소드
	//검색, 페이징 포함한 주문내역 전체 리스트
	List<Order_VO> list(AdminSearchVO AdminSearchVO);
	//페이징 위한 주문 전체 목록 개수
	int OrderTotal(AdminSearchVO AdminSearchVO);
	//주문 선택삭제
	public void deleteProduct(String oNo);
}

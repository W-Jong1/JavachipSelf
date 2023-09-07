package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.Order_DAO;
import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.Order_VO;

@Repository
public class Order_ServiceImpl implements Order_Service {
	
	@Autowired
	private Order_DAO order_DAO;
	
	@Override
	public List<Order_VO> selectUserOrder(int uNo) {
		return order_DAO.selectUserOrder(uNo);
	}

	@Override
	public int countUserOrder(int uNo) {
		return order_DAO.countUserOrder(uNo);
	}
	
	@Override
	public int insertOrder(Order_VO order_VO) {
		return order_DAO.insertOrder(order_VO);
	}

	@Override
	public int updateOrderReceiver(Order_VO order_VO) {
		return order_DAO.updateOrderReceiver(order_VO);
	}

	@Override
	public List<Order_VO> selectOrderForAdmin() {
		return order_DAO.selectOrderForAdmin();
	}

	@Override
	public int updateOrderStatus(Order_VO order_VO) {
		return order_DAO.updateOrderStatus(order_VO);
	}

	@Override
	public Order_VO selectUserRegularOrder(int oNo) {
		return order_DAO.selectUserRegularOrder(oNo);
	}
	
	//==========================관리자용 메소드
	//검색, 페이징 포함한 주문내역 전체 리스트
	@Override
	public List<Order_VO> list(AdminSearchVO AdminSearchVO) {
		return order_DAO.list(AdminSearchVO);
	}

	//페이징 위한 주문 전체 목록 갯수
	@Override
	public int OrderTotal(AdminSearchVO AdminSearchVO)
	{
		return order_DAO.OrderTotal(AdminSearchVO);
	}

	//주문 선택삭제
	@Override
	public void deleteProduct(String oNo) {
		order_DAO.deleteProduct(oNo);
		
	}

}

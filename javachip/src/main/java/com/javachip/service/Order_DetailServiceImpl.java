package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.Order_DetailDAO;
import com.javachip.vo.Order_DetailVO;

@Repository
public class Order_DetailServiceImpl implements Order_DetailService {
	
	@Autowired
	private Order_DetailDAO order_detailDAO;
	
	@Override
	public List<Order_DetailVO> selectOrderDetail(int oNo) {
		return order_detailDAO.selectOrderDetail(oNo);
	}
	@Override
	public int insertOrderDetail(Order_DetailVO order_detailVO) {
		return order_detailDAO.insertOrderDetail(order_detailVO);
	}
	@Override
	public List<Order_DetailVO> selectUserRegularProduct(int uNo) {
		return order_detailDAO.selectUserRegularProduct(uNo);
	}
	@Override
	public List<Order_DetailVO> selectAllUserRegularProduct() {
		return order_detailDAO.selectAllUserRegularProduct();
	}

}

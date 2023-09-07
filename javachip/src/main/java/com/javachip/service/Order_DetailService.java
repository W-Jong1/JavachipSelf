package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.Order_DetailVO;

@Service
public interface Order_DetailService {
	List<Order_DetailVO> selectOrderDetail(int oNo);
	int insertOrderDetail(Order_DetailVO order_detailVO);
	List<Order_DetailVO> selectUserRegularProduct(int uNo);
	List<Order_DetailVO> selectAllUserRegularProduct();
}

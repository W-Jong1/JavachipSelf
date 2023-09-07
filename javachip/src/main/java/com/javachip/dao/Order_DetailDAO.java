package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.Order_DetailVO;

@Repository
public class Order_DetailDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.order_detailMapper";
	
	public List<Order_DetailVO> selectOrderDetail(int oNo) {
		return sqlSession.selectList(namespace+".selectOrderDetail", oNo);
	}
	public int insertOrderDetail(Order_DetailVO order_detailVO) {
		return sqlSession.insert(namespace+".insertOrderDetail", order_detailVO);
	}
	public List<Order_DetailVO> selectUserRegularProduct(int uNo) {
		return sqlSession.selectList(namespace+".selectUserRegularProduct", uNo);
	}
	public List<Order_DetailVO> selectAllUserRegularProduct() {
		return sqlSession.selectList(namespace+".selectAllUserRegularProduct");
	}
}

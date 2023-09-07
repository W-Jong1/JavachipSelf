package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.AdminSearchVO;
import com.javachip.vo.Order_VO;

@Repository
public class Order_DAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.order_Mapper";
	
	public List<Order_VO> selectUserOrder(int uNo) {
		return sqlSession.selectList(namespace+".selectUserOrder", uNo);
	}
	public int countUserOrder(int uNo) {
		return sqlSession.selectOne(namespace+".countUserOrder", uNo);
	}
	public int insertOrder(Order_VO order_VO) {
		return sqlSession.insert(namespace+".insertOrder", order_VO);
	}
	public int updateOrderReceiver(Order_VO order_VO) {
		return sqlSession.update(namespace+".updateOrderReceiver", order_VO);
	}
	public List<Order_VO> selectOrderForAdmin() {
		return sqlSession.selectList(namespace+".selectOrderForAdmin");
	}
	public int updateOrderStatus(Order_VO order_VO) {
		return sqlSession.update(namespace+".updateOrderStatus", order_VO);
	}
	public Order_VO selectUserRegularOrder(int oNo) {
		return sqlSession.selectOne(namespace+".selectUserRegularOrder", oNo);
	}
	
	//관리자용 메소드
	//검색, 페이징 포함한 주문내역 전체 리스트
	public List<Order_VO> list(AdminSearchVO AdminSearchVO)
	{
		return sqlSession.selectList("com.javachip.mapper.order_Mapper.selectByAdmin", AdminSearchVO);
	}
	//페이징 위한 order 총 목록 갯수
	public int OrderTotal(AdminSearchVO AdminSearchVO)
	{
		int value = 0;
		value = sqlSession.selectOne("com.javachip.mapper.order_Mapper.OrderTotal", AdminSearchVO);
		return value;
	}
	
	//주문삭제
	public void deleteProduct(String oNo) {
		sqlSession.update(namespace+".deleteProduct", oNo);
	}
}

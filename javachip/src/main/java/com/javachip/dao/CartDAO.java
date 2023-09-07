package com.javachip.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.vo.CartVO;

@Repository
public class CartDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String namespace = "com.javachip.mapper.cartMapper";
	
	public List<CartVO> selectCartByUno(int uNo) {
		return sqlSession.selectList(namespace+".selectCartByUno", uNo);
	}
	public int countUserCart(int uNo) {
		return sqlSession.selectOne(namespace+".countUserCart", uNo);
	}
	public int totalPrice(int uNo) {
		return sqlSession.selectOne(namespace+".totalPrice", uNo);
	}
	public int addCart(CartVO cartVO) {
		return sqlSession.insert(namespace+".addCart", cartVO);
	}
	public int deleteOneCart(int cNo) {
		return sqlSession.delete(namespace+".deleteOneCart", cNo);
	}
	public int deleteAllCart(int uNo) {
		return sqlSession.delete(namespace+".deleteAllCart", uNo);
	}
	public int updateCart(CartVO cartVO) {
		return sqlSession.update(namespace+".updateCart", cartVO);
	}
	public int checkDupCart(CartVO cartVO) {
		return sqlSession.selectOne(namespace+".checkDupCart", cartVO);
	}
	public CartVO selectCartForOrder(int cNo) {
		return sqlSession.selectOne(namespace+".selectCartForOrder", cNo);
	}
	public int deleteRegCart(int uNo) {
		return sqlSession.delete(namespace+".deleteRegCart", uNo);
	}
}

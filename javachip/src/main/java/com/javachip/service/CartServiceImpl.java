package com.javachip.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javachip.dao.CartDAO;
import com.javachip.vo.CartVO;

@Repository
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartDAO cartDAO;

	@Override
	public List<CartVO> selectCartByUno(int uNo) {
		return cartDAO.selectCartByUno(uNo);
	}
	@Override
	public int totalPrice(int uNo) {
		return cartDAO.totalPrice(uNo);
	}
	@Override
	public int addCart(CartVO cartVO) {
		return cartDAO.addCart(cartVO);
	}
	@Override
	public int deleteOneCart(int cNo) {
		return cartDAO.deleteOneCart(cNo);
	}
	@Override
	public int deleteAllCart(int uNo) {
		return cartDAO.deleteAllCart(uNo);
	}
	@Override
	public int updateCart(CartVO cartVO) {
		return cartDAO.updateCart(cartVO);
	}
	@Override
	public int checkDupCart(CartVO cartVO) {
		return cartDAO.checkDupCart(cartVO);
	}
	@Override
	public CartVO selectCartForOrder(int cNo) {
		return cartDAO.selectCartForOrder(cNo);
	}
	@Override
	public int countUserCart(int uNo) {
		return cartDAO.countUserCart(uNo);
	}
	@Override
	public int deleteRegCart(int uNo) {
		return cartDAO.deleteRegCart(uNo);
	}
}

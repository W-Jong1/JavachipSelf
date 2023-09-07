package com.javachip.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.javachip.vo.CartVO;

@Service
public interface CartService {
	List<CartVO> selectCartByUno(int uNo);
	int countUserCart(int uNo);
	int totalPrice(int uNo);
	int addCart(CartVO cartVO);
	int deleteOneCart(int cNo);
	int deleteAllCart(int uNo);
	int updateCart(CartVO cartVO);
	int checkDupCart(CartVO cartVO);
	CartVO selectCartForOrder(int cNo);
	int deleteRegCart(int uNo);
}

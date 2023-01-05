package com.project.service;

import java.util.List;

import com.project.domain.CartDTO;

public interface CartService {
	
	// 장바구니 추가
	public int addCart(CartDTO cDto);
	
	// 장바구니 리스트
	public List<CartDTO> getCartList(CartDTO cDto);
	
	// 장바구니 상품 수량 수정
	public int cartModify(CartDTO cDto);
	
	// 장바구니 삭제
	public int cartRemove(int prod_no);
}

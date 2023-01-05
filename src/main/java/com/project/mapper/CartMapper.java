package com.project.mapper;

import java.util.List;

import com.project.domain.CartDTO;

public interface CartMapper {
	
	// 장바구니 추가
	public int addCart(CartDTO cDto) throws Exception;
	
	// 장바구니 리스트
	public List<CartDTO> getCartList(CartDTO cDto);
	
	// 장바구니 수량 수정
	public int modifyCount(CartDTO cDto);
	
	// 장바구니 삭제
	public int deleteCart(int cart_no);
	
	// 장바구니 확인
	public CartDTO checkCart(CartDTO cart);
}

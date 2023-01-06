package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CartDTO;
import com.project.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {
	
	@Autowired
	private CartMapper cartMapper;

	@Override
	public int addCart(CartDTO cDto) {
		
		// 0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요
		
		// 장바구니 데이터 체크
		CartDTO checkCart = cartMapper.checkCart(cDto);
		
		if(checkCart != null) {
			System.out.println("2번 : 장바구니에 이미 있는 상품");
			return 2;
		}
		try {
			// 장바구니 추가 시 1반환
			System.out.println("1번 : 장바구니 추가 완료");
//			int result = cartMapper.addCart(cDto);
//			System.out.println("result : "+result);
			return cartMapper.addCart(cDto);
			
		}catch(Exception e) {
			// 장바구니 추가 실패 시 0반환
			System.out.println("0번 : 장바구니 추가 실패");
			return 0;
		}
		
	}

	@Override
	public List<CartDTO> getCartList(CartDTO cDto) {
		return cartMapper.getCartList(cDto);
	}

	@Override
	public int cartModify(CartDTO cDto) {

		return 0;
	}

	@Override
	public int cartRemove(int prod_no) {

		return 0;
	}
	
	
}

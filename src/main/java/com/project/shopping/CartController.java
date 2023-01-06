package com.project.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.domain.CartDTO;
import com.project.domain.ProductDTO;
import com.project.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	// 장바구니 페이지 이동
	@RequestMapping("cart_list")
	public String cartList(CartDTO cDto, Model model) {
		List<CartDTO> cartList = cartService.getCartList(cDto);
		
		model.addAttribute("cartList",cartList);
		
		return "customer/cart_list";
	}

	@ResponseBody
	@RequestMapping("cartAdd")
	public String cartAdd(CartDTO cDto) {
		
		System.out.println(cDto.getProdCount());
		int result = cartService.addCart(cDto);
		
		return result + "";
	}
	
	
	
	

}

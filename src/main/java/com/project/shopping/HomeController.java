package com.project.shopping;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.ProductDTO;
import com.project.service.ProductService;

@Controller
public class HomeController {
	
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping("ad_login")
	public String ad_login() {
		return "admin/ad_login";
	}
	
	@RequestMapping("user_list")
	public String user_list() {
		return "admin/user_list";
	}
	
	@RequestMapping("user_login")
	public String user_login() {
		return "customer/user_login";
	}
	
	@RequestMapping("user_join")
	public String user_join() {
		return "customer/user_join";
	}
	
	@RequestMapping("secTest")
	public void st() {
		// 암호화 전 비밀번호
		String pw = "test1234";
		String pw2 = "test1212";
		
		String cipherPW1 = pwEncoder.encode(pw);
		String cipherPW2 = pwEncoder.encode(pw);
		
		// 암호화 후 비밀번호
		System.out.println("암호화된 pw1: " + cipherPW1);
		System.out.println("암호화된 pw2: " + cipherPW2);
		
		// matches(암호화 전 비밀번호, 암호화 후 비밀번호) : 두 매개변수가 일치하면 True, 그렇지 않으면 False
		boolean b1 = pwEncoder.matches(pw, cipherPW1);
		boolean b2 = pwEncoder.matches(pw2, cipherPW2);
		
		System.out.println("b1: " + b1);
		System.out.println("b2: " + b2);
	}
}
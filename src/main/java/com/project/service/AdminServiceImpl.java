package com.project.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.AdminDTO;
import com.project.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	private AdminMapper mapper;
	
	@Autowired
	public AdminServiceImpl(AdminMapper mapper) {
		this.mapper = mapper;
	}

	@Override
	public void ad_Login(AdminDTO dto, HttpServletRequest request) {
		String adminName = mapper.adminLogin(dto);
		
		HttpSession session = request.getSession();
		if(adminName != null) {
			session.setAttribute("adminName", adminName);
		}	
	}
}

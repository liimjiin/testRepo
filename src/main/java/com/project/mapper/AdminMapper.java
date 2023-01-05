package com.project.mapper;

import com.project.domain.AdminDTO;

public interface AdminMapper {
	public String adminLogin(AdminDTO dto);
	public int adminInsert(AdminDTO dto);
}
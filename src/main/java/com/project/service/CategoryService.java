package com.project.service;

import java.util.List;

import com.project.domain.CategoryDTO;

public interface CategoryService {
	public List<CategoryDTO> catList();
	public void catInsert(CategoryDTO dto);
	public CategoryDTO catInfo(int catNo);
	public int catUpdate(CategoryDTO dto);
	public int catDelete(int catNo);
}

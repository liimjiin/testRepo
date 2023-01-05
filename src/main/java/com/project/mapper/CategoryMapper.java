package com.project.mapper;

import java.util.List;

import com.project.domain.CategoryDTO;

public interface CategoryMapper {
	public List<CategoryDTO> categoryList();
	public void categoryInsert(CategoryDTO dto);
	public CategoryDTO categoryInfo(int catNo);
	public int categoryUpdate(CategoryDTO dto);
	public int categoryDelete(int catNo);
}
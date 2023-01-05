package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.domain.CategoryDTO;
import com.project.mapper.CategoryMapper;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryMapper mapper;
	
	@Override
	public List<CategoryDTO> catList() {
		return mapper.categoryList();
	}

	@Override
	public void catInsert(CategoryDTO dto) {
		mapper.categoryInsert(dto);
	}

	@Override
	public CategoryDTO catInfo(int catNo) {
		return mapper.categoryInfo(catNo);
	}

	@Override
	public int catUpdate(CategoryDTO dto) {
		return mapper.categoryUpdate(dto);
	}

	@Override
	public int catDelete(int catNo) {
		return mapper.categoryDelete(catNo);
	}

}

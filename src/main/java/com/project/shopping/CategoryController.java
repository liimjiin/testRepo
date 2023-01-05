package com.project.shopping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.CategoryDTO;
import com.project.service.CategoryService;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryService categoryService;
	
	@RequestMapping("cat_list")
	public String categoryList(Model model) {
		List<CategoryDTO> categoryList = categoryService.catList();
		
		model.addAttribute("list", categoryList);
		return "admin/cat_list";
	}
	
	@RequestMapping("/cat_input")
	public String categoryInput() {
		return "admin/cat_input";
	}
	
	@RequestMapping("cat_insert")
	public String categoryInsert(CategoryDTO dto) {
		categoryService.catInsert(dto);
		return "redirect:/cat_list";
	}
	
	@RequestMapping("cat_info")
	public String categoryInfo(int catNo, Model model) {
		CategoryDTO dto = categoryService.catInfo(catNo);
		model.addAttribute("dto", dto);
		
		return "admin/cat_info";
	}
	
	@RequestMapping("cat_update")
	public String categoryUpdate(CategoryDTO dto) {
		int cnt = categoryService.catUpdate(dto);
		return "redirect:/cat_list";
	}
	
	@RequestMapping("cat_delete")
	public String categoryDelete(int catNo) {
		categoryService.catDelete(catNo);
		return "redirect:/cat_list";
	}
}
package com.project.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.domain.ProductDTO;

public interface ProductService {
	public List<ProductDTO> prodList();
	public Map prodInsert(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception;
	public ProductDTO prodInfo(int pNo);
	public Map prodUpdate(MultipartHttpServletRequest mhr, HttpServletRequest request) throws Exception;
	public int prodDelete(int pNo);
	public List<ProductDTO> getProdBySpec(String pSpec);
	public ProductDTO prodView(int pNo);
}
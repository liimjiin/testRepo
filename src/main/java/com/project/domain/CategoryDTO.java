package com.project.domain;

public class CategoryDTO {
	private int catNo;
	private String catMajor;
	private String catMinor;
		
	// 기본생성자
	public CategoryDTO() {}
	
	// DB에서 조회한 결과를 이용할 때 catNo 필요
	public CategoryDTO(int catNo, String catMajor, String catMinor) {
		super();
		this.catNo = catNo;
		this.catMajor = catMajor;
		this.catMinor = catMinor;
	}

	// DB에 데이터 입력시 catNo 필요 없음
	public CategoryDTO(String catMajor, String catMinor) {
		super();
		this.catMajor = catMajor;
		this.catMinor = catMinor;
	}
	
	public int getCatNo() {
		return catNo;
	}
	public void setCatNo(int catNo) {
		this.catNo = catNo;
	}
	public String getcatMajor() {
		return catMajor;
	}
	public void setcatMajor(String catMajor) {
		this.catMajor = catMajor;
	}
	public String getcatMinor() {
		return catMinor;
	}
	public void setcatMinor(String catMinor) {
		this.catMinor = catMinor;
	}
	
	@Override
	public String toString() {
		return "CategoryDTO [catNo=" + catNo + ", catMajor=" + catMajor + ", catMinor=" + catMinor + "]";
	}
}

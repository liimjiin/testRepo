package com.project.domain;

public class AdminDTO {
	private String adminId;
	private String adminPw;
	private String adminName;
	private String adminEmail;
	
	public AdminDTO() {}

	public AdminDTO(String adminId, String adminPw, String adminName, String adminEmail) {
		super();
		this.adminId = adminId;
		this.adminPw = adminPw;
		this.adminName = adminName;
		this.adminEmail = adminEmail;
	}

	public String getAdminId() {
		return adminId;
	}

	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}

	public String getAdminPw() {
		return adminPw;
	}

	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminEmail() {
		return adminEmail;
	}

	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}

	@Override
	public String toString() {
		return "AdminDTO [adminId=" + adminId + ", adminPw=" + adminPw + ", adminName=" + adminName + ", adminEmail="
				+ adminEmail + "]";
	}
	
}

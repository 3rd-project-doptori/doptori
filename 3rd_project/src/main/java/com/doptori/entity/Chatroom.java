package com.doptori.entity;

public class Chatroom {

	private	int cr_num;
	private	String cr_name;
	private	String cr_date;
	private	int cr_mb_num;
	private	int cr_limit;
	
	// getter, setter 만들기
	public int getCr_num() {
		return cr_num;
	}
	public void setCr_num(int cr_num) {
		this.cr_num = cr_num;
	}
	public String getCr_name() {
		return cr_name;
	}
	public void setCr_name(String cr_name) {
		this.cr_name = cr_name;
	}
	public String getCr_date() {
		return cr_date;
	}
	public void setCr_date(String cr_date) {
		this.cr_date = cr_date;
	}
	public int getCr_mb_num() {
		return cr_mb_num;
	}
	public void setCr_mb_num(int cr_mb_num) {
		this.cr_mb_num = cr_mb_num;
	}
	public int getCr_limit() {
		return cr_limit;
	}
	public void setCr_limit(int cr_limit) {
		this.cr_limit = cr_limit;
	}
	

}

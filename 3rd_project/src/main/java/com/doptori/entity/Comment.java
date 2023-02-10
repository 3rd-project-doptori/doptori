package com.doptori.entity;

public class Comment {

	private	int co_num;
	private int co_bd_num;
	private	int co_mb_num;
	private	String co_cont;
	private	String co_date;
	
	// getter, setter 만들기
	public int getCo_num() {
		return co_num;
	}
	public void setCo_num(int co_num) {
		this.co_num = co_num;
	}
	public int getCo_bd_num() {
		return co_bd_num;
	}
	public void setCo_bd_num(int co_bd_num) {
		this.co_bd_num = co_bd_num;
	}
	public int getCo_mb_num() {
		return co_mb_num;
	}
	public void setCo_mb_num(int co_mb_num) {
		this.co_mb_num = co_mb_num;
	}
	public String getCo_date() {
		return co_date;
	}
	public void setCo_date(String co_date) {
		this.co_date = co_date;
	}
	public String getCo_cont() {
		return co_cont;
	}
	public void setCo_cont(String co_cont) {
		this.co_cont = co_cont;
	}
	
	
}

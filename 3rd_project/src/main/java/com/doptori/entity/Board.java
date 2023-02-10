package com.doptori.entity;

public class Board {
	
	private	int bd_num;
	private	int bd_type;
	private	int bd_mb_num;
	private	String bd_date;
	private	String bd_title;
	private	String bd_cont;
	private	String bd_pic;
	private	int bd_cnt;
	private	int bd_re_num;
	// 답글
	private	int bd_group; // 게시글 그룹 번호
	private	int bd_seq; // 게시글 글의 순서
	private	int bd_level; // 게시글 글의 깊이
	
	private	int bd_delete; // 삭제유무

	
	// getter, setter 만들기
	
	public int getBd_num() {
		return bd_num;
	}
	public int getBd_re_num() {
		return bd_re_num;
	}
	public void setBd_re_num(int bd_re_num) {
		this.bd_re_num = bd_re_num;
	}
	public int getBd_group() {
		return bd_group;
	}
	public void setBd_group(int bd_group) {
		this.bd_group = bd_group;
	}
	public int getBd_seq() {
		return bd_seq;
	}
	public void setBd_seq(int bd_seq) {
		this.bd_seq = bd_seq;
	}
	public int getBd_level() {
		return bd_level;
	}
	public void setBd_level(int bd_level) {
		this.bd_level = bd_level;
	}
	public void setBd_num(int bd_num) {
		this.bd_num = bd_num;
	}
	public int getBd_type() {
		return bd_type;
	}
	public void setBd_type(int bd_type) {
		this.bd_type = bd_type;
	}
	public int getBd_mb_num() {
		return bd_mb_num;
	}
	public void setBd_mb_num(int bd_mb_num) {
		this.bd_mb_num = bd_mb_num;
	}
	public String getBd_date() {
		return bd_date;
	}
	public void setBd_date(String bd_date) {
		this.bd_date = bd_date;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getBd_cont() {
		return bd_cont;
	}
	public void setBd_cont(String bd_cont) {
		this.bd_cont = bd_cont;
	}
	public String getBd_pic() {
		return bd_pic;
	}
	public void setBd_pic(String bd_pic) {
		this.bd_pic = bd_pic;
	}
	public int getBd_cnt() {
		return bd_cnt;
	}
	public void setBd_cnt(int bd_cnt) {
		this.bd_cnt = bd_cnt;
	}
	public int getBd_delete() {
		return bd_delete;
	}
	public void setBd_delete(int bd_delete) {
		this.bd_delete = bd_delete;
	}
	
	public void add(String memberNum2Name) {
		// TODO Auto-generated method stub
		
	}
	

}

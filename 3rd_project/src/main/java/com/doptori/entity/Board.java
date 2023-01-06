package com.doptori.entity;

public class Board {
	
	private	int bd_num;
	private	int bd_type;
	private	int bd_state;
	private	String bd_title;
	private	String bd_content;
	private	String bd_time;
	private	String bd_writer;
	

	// getter, setter 만들기
	
	public int getBd_num() {
		return bd_num;
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
	public int getBd_state() {
		return bd_state;
	}
	public void setBd_state(int bd_state) {
		this.bd_state = bd_state;
	}
	public String getBd_title() {
		return bd_title;
	}
	public void setBd_title(String bd_title) {
		this.bd_title = bd_title;
	}
	public String getBd_content() {
		return bd_content;
	}
	public void setBd_content(String bd_content) {
		this.bd_content = bd_content;
	}
	public String getBd_time() {
		return bd_time;
	}
	public void setBd_time(String bd_time) {
		this.bd_time = bd_time;
	}
	public String getBd_writer() {
		return bd_writer;
	}
	public void setBd_writer(String bd_writer) {
		this.bd_writer = bd_writer;
	}

}

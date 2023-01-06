package com.doptori.entity;

public class Log {
	
	private	int lg_num;
	private	int lg_rm_num;
	private	int lg_mb_num;
	private	int lg_correct;
	private	String lg_content;
	private	String lg_time;

	// getter, setter 만들기
	
	public int getLg_num() {
		return lg_num;
	}
	public void setLg_num(int lg_num) {
		this.lg_num = lg_num;
	}
	public int getLg_rm_num() {
		return lg_rm_num;
	}
	public void setLg_rm_num(int lg_rm_num) {
		this.lg_rm_num = lg_rm_num;
	}
	public int getLg_mb_num() {
		return lg_mb_num;
	}
	public void setLg_mb_num(int lg_mb_num) {
		this.lg_mb_num = lg_mb_num;
	}
	public int getLg_correct() {
		return lg_correct;
	}
	public void setLg_correct(int lg_correct) {
		this.lg_correct = lg_correct;
	}
	public String getLg_content() {
		return lg_content;
	}
	public void setLg_content(String lg_content) {
		this.lg_content = lg_content;
	}
	public String getLg_time() {
		return lg_time;
	}
	public void setLg_time(String lg_time) {
		this.lg_time = lg_time;
	}

}

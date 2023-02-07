package com.doptori.entity;

public class Diary {
	
	private	int di_num;
	private	int di_mb_num;
	private	int di_fm_num;
	private	String di_date;
	private	String di_cont;
	private	String di_note;
	private	String di_pic;
	private	double di_tem;
	private	double di_hum;
	
	// getter, setter 만들기
	public int getDi_num() {
		return di_num;
	}
	public void setDi_num(int di_num) {
		this.di_num = di_num;
	}
	public int getDi_mb_num() {
		return di_mb_num;
	}
	public void setDi_mb_num(int di_mb_num) {
		this.di_mb_num = di_mb_num;
	}
	public int getDi_fm_num() {
		return di_fm_num;
	}
	public void setDi_fm_num(int di_fm_num) {
		this.di_fm_num = di_fm_num;
	}
	public String getDi_date() {
		return di_date;
	}
	public void setDi_date(String di_date) {
		this.di_date = di_date;
	}
	public String getDi_cont() {
		return di_cont;
	}
	public void setDi_cont(String di_cont) {
		this.di_cont = di_cont;
	}
	public String getDi_note() {
		return di_note;
	}
	public void setDi_note(String di_note) {
		this.di_note = di_note;
	}
	public String getDi_pic() {
		return di_pic;
	}
	public void setDi_pic(String di_pic) {
		this.di_pic = di_pic;
	}
	public double getDi_tem() {
		return di_tem;
	}
	public void setDi_tem(double di_tem) {
		this.di_tem = di_tem;
	}
	public double getDi_hum() {
		return di_hum;
	}
	public void setDi_hum(double di_hum) {
		this.di_hum = di_hum;
	}
	
	@Override
	public String toString() {
		return "Diary [di_num=" + di_num + ", di_mb_num=" + di_mb_num + ", di_fm_num=" + di_fm_num + ", di_date="
				+ di_date + ", di_cont=" + di_cont + ", di_note=" + di_note + ", di_pic=" + di_pic + ", di_tem="
				+ di_tem + ", di_hum=" + di_hum + "]";
	}
	
	
}

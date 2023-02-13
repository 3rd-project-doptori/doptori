package com.doptori.entity;

public class Analysis {

	private	int an_num;
	private	String an_pic;
	private	String an_result_pest;
	private	String an_result_grow;
	
	
	public int getAn_num() {
		return an_num;
	}
	public void setAn_num(int an_num) {
		this.an_num = an_num;
	}
	public String getAn_pic() {
		return an_pic;
	}
	public void setAn_pic(String an_pic) {
		this.an_pic = an_pic;
	}
	public String getAn_result_pest() {
		return an_result_pest;
	}
	public void setAn_result_pest(String an_result_pest) {
		this.an_result_pest = an_result_pest;
	}
	public String getAn_result_grow() {
		return an_result_grow;
	}
	public void setAn_result_grow(String an_result_grow) {
		this.an_result_grow = an_result_grow;
	}
	
	
	@Override
	public String toString() {
		return "Analysis [an_num=" + an_num + ", an_pic=" + an_pic + ", an_result_pest=" + an_result_pest
				+ ", an_result_grow=" + an_result_grow + "]";
	}

	
	
}

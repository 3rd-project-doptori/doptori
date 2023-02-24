package com.doptori.entity;

import org.springframework.web.multipart.MultipartFile;

public class Analysis {

	private	int an_num;
	private	String an_pic_pest;
	private	String an_pic_grow;
	private	String an_result_pest;
	private	String an_result_grow;
	private	String an_date;
	
	private MultipartFile uploadFile; // 파일 업로드
    private String realName;
    private long size;
	
	
	public String getAn_pic_pest() {
		return an_pic_pest;
	}
	public void setAn_pic_pest(String an_pic_pest) {
		this.an_pic_pest = an_pic_pest;
	}
	public String getAn_pic_grow() {
		return an_pic_grow;
	}
	public void setAn_pic_grow(String an_pic_grow) {
		this.an_pic_grow = an_pic_grow;
	}
	public String getAn_date() {
		return an_date;
	}
	public void setAn_date(String an_date) {
		this.an_date = an_date;
	}
	public int getAn_num() {
		return an_num;
	}
	public void setAn_num(int an_num) {
		this.an_num = an_num;
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
	
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public long getSize() {
		return size;
	}
	public void setSize(long size) {
		this.size = size;
	}
	
	@Override
	public String toString() {
		return "Analysis [an_num=" + an_num + ", an_pic_pest=" + an_pic_pest + ", an_pic_grow=" + an_pic_grow
				+ ", an_result_pest=" + an_result_pest + ", an_result_grow=" + an_result_grow + ", an_date=" + an_date
				+ ", uploadFile=" + uploadFile + ", realName=" + realName + ", size=" + size + "]";
	}
	
	

	
	
	

	
	
}

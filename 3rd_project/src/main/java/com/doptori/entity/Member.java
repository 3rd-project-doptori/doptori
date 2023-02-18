package com.doptori.entity;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	private	int mb_num;
	private	int mb_type;
	private	String mb_id;
	private	String mb_pw;
	private	String mb_nick;
	private	String mb_fm_num;
	private	String mb_chatlist;
	private	String mb_pic;
	private	String mb_file;
	private	String mb_re_num;
	private	String mb_date;
	
	private List<Board> userBoardList;
	
	private MultipartFile uploadFile; // 파일 업로드
    private String realName;
    private long size;
	
	// getter, setter 만들기
	public int getMb_num() {
		return mb_num;
	}
	public void setMb_num(int mb_num) {
		this.mb_num = mb_num;
	}
	public int getMb_type() {
		return mb_type;
	}
	public void setMb_type(int mb_type) {
		this.mb_type = mb_type;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getMb_pw() {
		return mb_pw;
	}
	public void setMb_pw(String mb_pw) {
		this.mb_pw = mb_pw;
	}
	public String getMb_nick() {
		return mb_nick;
	}
	public void setMb_nick(String mb_nick) {
		this.mb_nick = mb_nick;
	}
	public String getMb_fm_num() {
		return mb_fm_num;
	}
	public void setMb_fm_num(String mb_fm_num) {
		this.mb_fm_num = mb_fm_num;
	}
	public String getMb_chatlist() {
		return mb_chatlist;
	}
	public void setMb_chatlist(String mb_chatlist) {
		this.mb_chatlist = mb_chatlist;
	}
	public String getMb_pic() {
		return mb_pic;
	}
	public void setMb_pic(String mb_pic) {
		this.mb_pic = mb_pic;
	}
	public String getMb_file() {
		return mb_file;
	}
	public void setMb_file(String mb_file) {
		this.mb_file = mb_file;
	}
	public String getMb_re_num() {
		return mb_re_num;
	}
	public void setMb_re_num(String mb_re_num) {
		this.mb_re_num = mb_re_num;
	}
	public String getMb_date() {
		return mb_date;
	}
	public void setMb_date(String mb_date) {
		this.mb_date = mb_date;
	}
	public List<Board> getUserBoardList() {
		return userBoardList;
	}
	public void setUserBoardList(List<Board> userBoardList) {
		this.userBoardList = userBoardList;
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
		return "Member [mb_num=" + mb_num + ", mb_type=" + mb_type + ", mb_id=" + mb_id + ", mb_pw=" + mb_pw
				+ ", mb_nick=" + mb_nick + ", mb_fm_num=" + mb_fm_num + ", mb_chatlist=" + mb_chatlist + ", mb_pic="
				+ mb_pic + ", mb_file=" + mb_file + ", mb_re_num=" + mb_re_num + ", mb_date=" + mb_date
				+ ", userBoardList=" + userBoardList + ", uploadFile=" + uploadFile + ", realName=" + realName
				+ ", size=" + size + "]";
	}
	
	
}

package com.doptori.entity;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class farmdiary {

	private int fd_num;
	private int fd_mb_num;
	private double fd_start;
	private String fd_end;
	private String fd_address;
	private String fd_item;
	private String fd_kind;
	private String fd_step;
	private String fd_cont;
	private String fd_pesticide;
	private double fd_pesticide_amount;
	private String fd_fertilizer;
	private double fd_fertilizer_amount;
	private String fd_man_name;
	private String fd_worktime;
	private String fd_weather;
	private double fd_low_temp;
	private double fd_high_temp;
	private double fd_precipitation;
	private double fd_humid;
	private String fd_picture1;
	private String fd_picture2;
	private String fd_picture3;
	private int fd_open;
	
	
	public int getFd_num() {
		return fd_num;
	}
	public void setFd_num(int fd_num) {
		this.fd_num = fd_num;
	}
	public int getFd_mb_num() {
		return fd_mb_num;
	}
	public void setFd_mb_num(int fd_mb_num) {
		this.fd_mb_num = fd_mb_num;
	}
	public double getFd_start() {
		return fd_start;
	}
	public void setFd_start(double fd_start) {
		this.fd_start = fd_start;
	}
	public String getFd_end() {
		return fd_end;
	}
	public void setFd_end(String fd_end) {
		this.fd_end = fd_end;
	}
	public String getFd_address() {
		return fd_address;
	}
	public void setFd_address(String fd_address) {
		this.fd_address = fd_address;
	}
	public String getFd_item() {
		return fd_item;
	}
	public void setFd_item(String fd_item) {
		this.fd_item = fd_item;
	}
	public String getFd_kind() {
		return fd_kind;
	}
	public void setFd_kind(String fd_kind) {
		this.fd_kind = fd_kind;
	}
	public String getFd_step() {
		return fd_step;
	}
	public void setFd_step(String fd_step) {
		this.fd_step = fd_step;
	}
	public String getFd_cont() {
		return fd_cont;
	}
	public void setFd_cont(String fd_cont) {
		this.fd_cont = fd_cont;
	}
	public String getFd_pesticide() {
		return fd_pesticide;
	}
	public void setFd_pesticide(String fd_pesticide) {
		this.fd_pesticide = fd_pesticide;
	}
	public double getFd_pesticide_amount() {
		return fd_pesticide_amount;
	}
	public void setFd_pesticide_amount(double fd_pesticide_amount) {
		this.fd_pesticide_amount = fd_pesticide_amount;
	}
	public String getFd_fertilizer() {
		return fd_fertilizer;
	}
	public void setFd_fertilizer(String fd_fertilizer) {
		this.fd_fertilizer = fd_fertilizer;
	}
	public double getFd_fertilizer_amount() {
		return fd_fertilizer_amount;
	}
	public void setFd_fertilizer_amount(double fd_fertilizer_amount) {
		this.fd_fertilizer_amount = fd_fertilizer_amount;
	}
	public String getFd_man_name() {
		return fd_man_name;
	}
	public void setFd_man_name(String fd_man_name) {
		this.fd_man_name = fd_man_name;
	}
	public String getFd_worktime() {
		return fd_worktime;
	}
	public void setFd_worktime(String fd_worktime) {
		this.fd_worktime = fd_worktime;
	}
	public String getFd_weather() {
		return fd_weather;
	}
	public void setFd_weather(String fd_weather) {
		this.fd_weather = fd_weather;
	}
	public double getFd_low_temp() {
		return fd_low_temp;
	}
	public void setFd_low_temp(double fd_low_temp) {
		this.fd_low_temp = fd_low_temp;
	}
	public double getFd_high_temp() {
		return fd_high_temp;
	}
	public void setFd_high_temp(double fd_high_temp) {
		this.fd_high_temp = fd_high_temp;
	}
	public double getFd_precipitation() {
		return fd_precipitation;
	}
	public void setFd_precipitation(double fd_precipitation) {
		this.fd_precipitation = fd_precipitation;
	}
	public double getFd_humid() {
		return fd_humid;
	}
	public void setFd_humid(double fd_humid) {
		this.fd_humid = fd_humid;
	}
	public String getFd_picture1() {
		return fd_picture1;
	}
	public void setFd_picture1(String fd_picture1) {
		this.fd_picture1 = fd_picture1;
	}
	public String getFd_picture2() {
		return fd_picture2;
	}
	public void setFd_picture2(String fd_picture2) {
		this.fd_picture2 = fd_picture2;
	}
	public String getFd_picture3() {
		return fd_picture3;
	}
	public void setFd_picture3(String fd_picture3) {
		this.fd_picture3 = fd_picture3;
	}
	public int getFd_open() {
		return fd_open;
	}
	public void setFd_open(int fd_open) {
		this.fd_open = fd_open;
	}
	
	
	@Override
	public String toString() {
		return "farmdiary [fd_num=" + fd_num + ", fd_mb_num=" + fd_mb_num + ", fd_start=" + fd_start + ", fd_end="
				+ fd_end + ", fd_address=" + fd_address + ", fd_item=" + fd_item + ", fd_kind=" + fd_kind + ", fd_step="
				+ fd_step + ", fd_cont=" + fd_cont + ", fd_pesticide=" + fd_pesticide + ", fd_pesticide_amount="
				+ fd_pesticide_amount + ", fd_fertilizer=" + fd_fertilizer + ", fd_fertilizer_amount="
				+ fd_fertilizer_amount + ", fd_man_name=" + fd_man_name + ", fd_worktime=" + fd_worktime
				+ ", fd_weather=" + fd_weather + ", fd_low_temp=" + fd_low_temp + ", fd_high_temp=" + fd_high_temp
				+ ", fd_precipitation=" + fd_precipitation + ", fd_humid=" + fd_humid + ", fd_picture1=" + fd_picture1
				+ ", fd_picture2=" + fd_picture2 + ", fd_picture3=" + fd_picture3 + ", fd_open=" + fd_open + "]";
	}
	
	
	
	
	
}

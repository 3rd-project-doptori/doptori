package com.doptori.entity;

public class Step {
	
	private	int step_num;
	private	String step_name;
	
	
	public int getStep_num() {
		return step_num;
	}
	public void setStep_num(int step_num) {
		this.step_num = step_num;
	}
	public String getStep_name() {
		return step_name;
	}
	public void setStep_name(String step_name) {
		this.step_name = step_name;
	}
	
	@Override
	public String toString() {
		return "Step [step_num=" + step_num + ", step_name=" + step_name + "]";
	}
	
	
	
}

package com.vti.finalexam.entity;

public class Manager extends User {

	private int expInYear;

	public Manager(int id, String fullName, String email, String password) {
		super(id, fullName, email, password);
		// TODO Auto-generated constructor stub
	}

	public int getExpInYear() {
		return expInYear;
	}

	public void setExpInYear(int expInYear) {
		this.expInYear = expInYear;
	}

}

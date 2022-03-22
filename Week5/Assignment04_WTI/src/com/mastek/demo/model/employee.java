package com.mastek.demo.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class employee {

	private String fname;
	private String lname;
	
	public employee() {
		super();
		// TODO Auto-generated constructor stub
	}
	public employee(String fname, String lname) {
		super();
		this.fname = fname;
		this.lname = lname;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public employee getRandomElement(List<employee> emp) {
		Random rand = new Random();
        return emp.get(rand.nextInt(emp.size()));
	}
	
	
	
	

}

package com.mastek.bankapp.model;

public abstract class BankAccount {

	private int AccNo;
	private String AccName;
	private double Balance;
	private static int counter = 1001;
	
	public BankAccount() {
		this.AccNo = counter++;
	}

	public BankAccount(int accNo, String accName, double balance) {
		super();
		AccNo = accNo;
		AccName = accName;
		Balance = balance;
	}

	public BankAccount(String accName, double balance) {
		this();
		AccName = accName;
		Balance = balance;
	}

	public int getAccNo() {
		return AccNo;
	}

	public void setAccNo(int accNo) {
		AccNo = accNo;
	}

	public String getAccName() {
		return AccName;
	}

	public void setAccName(String accName) {
		AccName = accName;
	}

	public double getBalance() {
		return Balance;
	}

	public void setBalance(double balance) {
		Balance = balance;
	}
	
	public abstract String withdraw(double amount);
	
	
	
	
}

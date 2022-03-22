package com.mastek.bankapp.model;

public class SavingAccount extends BankAccount{
	
	static double MIN_AMOUNT = 500;
	
	public SavingAccount() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SavingAccount(int accNo, String accName, double balance) {
		super(accNo, accName, balance);
		// TODO Auto-generated constructor stub
	}

	public SavingAccount(String accName, double balance) {
		super(accName, balance);
		// TODO Auto-generated constructor stub
	}

	public String deposit(double amount) {
		
		this.setBalance(amount + getBalance());
		
		return amount+" credited to Your Account "+getAccNo()+"\nCurrent Balance is "+getBalance();
	}

	@Override
	public String withdraw(double amount) {
		
		double newBal = getBalance() - amount;
		
		if(newBal < MIN_AMOUNT)
		{
			return "Balance could not be below 500.0 Rs. Try Another Amount";
		}else
		{
			this.setBalance(amount - getBalance());
			
			return amount+" debited from Your Account "+getAccNo()+"\nCurrent Balance is "+getBalance();
		}
		
	}

	

}

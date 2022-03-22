package com.mastek.bankapp;
import java.util.Scanner;
import com.mastek.bankapp.model.BankAccount;
import com.mastek.bankapp.model.SalaryAccount;
import com.mastek.bankapp.model.SavingAccount;

public class BankApp {

	public static SavingAccount savAccounts[] = new SavingAccount[10];
	public static SalaryAccount salAccounts[] = new SalaryAccount[10];
	
	static Scanner sc = new Scanner(System.in);
	
	public static void main(String[] args) {
		
		boolean test = true;
		
		String choice;
		
		while(true)
		{
			System.out.println();
			System.out.println("1. Open Saving Account");
			System.out.println("2. Open Salary Account");
			System.out.println("3. Deposite Amount");
			System.out.println("4. Withdraw Amount");
			System.out.println("5. Show All Accounts");
			System.out.println("6. Remove Account");
			System.out.println();
			
			System.out.println("Enter Your Choice : ");
			
			choice = sc.nextLine();
			
			switch(choice) {
			
			case "1" :
				openSavingAccount();
				break;
				
			case "2" :
				openSalaryAccount();
				break;
				
			case "3" :
				depositAmount();
				break;
				
			case "4" :
				withdrawAmount();
				break;
				
			case "5" : 
				showAllAccounts();
				break;
				
			case "6" :
				removeAccount();
				break;
				
			default:
				System.out.println("Invalid Choice");
				break;
			
			}
			
			System.out.println("Do You want to Continue ?     y/n?");
			choice = sc.nextLine();
			
			if(choice.equalsIgnoreCase("n"))
			{
				test = false;
				System.out.println("Thank You !!!!");
				break;
			}		
		}		
	}
	
	
	private static String showMenu() {
		
		System.out.println("");
		System.out.println("1. Saving Account");
		System.out.println("2. Salary Account");
		
		System.out.println("Select Your Type Of Account");
		String Choice = sc.nextLine();
		
		return Choice;
	}
	

	private static void showAllAccounts() {
		
		for(BankAccount b : savAccounts)
		{
			if(b != null)
			{
				System.out.println("Account Number:" + b.getAccNo() +" || " + "Account Name:" + b.getAccName() + " || " + "Account Balance:" + b.getBalance());
			}
		}
		
		for(BankAccount b : salAccounts)
		{
			if(b != null)
			{
				System.out.println("Account Number:" + b.getAccNo() +" || " + "Account Name:" + b.getAccName() + " || " + "Account Balance:" + b.getBalance());
			}
		}
		
	}


	private static void removeAccount() {
		
		String Choice = showMenu();
		System.out.println("Enter Account Number : ");
		int accNo = Integer.parseInt(sc.nextLine());
		
		
		switch (Choice) {
		case "1":
			
			for (int i = 0; i < savAccounts.length; i++) {
			       if (savAccounts[i] != null && (savAccounts[i].getAccNo() == accNo))
			       {
			    	   savAccounts[i] = null;
			    	   
			         break; 
			       }
			           
			       System.out.println("That requested account is removed !!");	       
			
				}
			break;
			
		
		case "2":
			for (int i = 0; i < salAccounts.length; i++) {
			       if (salAccounts[i] != null && (salAccounts[i].getAccNo() == accNo))
			       {
			    	   salAccounts[i] = null;
			    	   
			         break; 
			       }
			           
			       System.out.println("That requested account is removed !!");	       
			
				}
			break;

		default:
			System.out.println("Invalid Choice");
			break;
		}	
		}
	
	

	private static void withdrawAmount() {
		String Choice = showMenu();
		
		System.out.println("Enter Account Number : ");
		int accNo = Integer.parseInt(sc.nextLine());
		
		System.out.println("Enter Amount to Withdraw");
		double amount = Double.parseDouble(sc.nextLine());
		
		switch (Choice) {
		case "1":
			
			for(SavingAccount i : savAccounts)
			{
				
				if(i == null)
				{
					System.out.println("Account Not Found!!");
				}
				else if( i.getAccNo() == accNo)
				{
					System.out.println(i.withdraw(amount));
					break;
				}
			}
			break;
			
		
		case "2":
			for(SalaryAccount i : salAccounts)
			{
				
				if(i == null)
				{
					System.out.println("Account Not Found!!");
				}
				else if( i.getAccNo() == accNo)
				{
					System.out.println(i.withdraw(amount));
					break;
				}
			}
			break;

		default:
			System.out.println("Invalid Choice");
			break;
		}	
	}

	
	
	
	private static void depositAmount() {
		
		String Choice = showMenu();
		
		System.out.println("Enter Account Number : ");
		int accNo = Integer.parseInt(sc.nextLine());
		
		System.out.println("Enter Amount to Deposit");
		double amount = Double.parseDouble(sc.nextLine());
		
		switch (Choice) {
		case "1":
			
			
			for(SavingAccount i : savAccounts)
			{
				
				if(i == null)
				{
					System.out.println("Account Not Found!!");
					break;
				}
				else if( i.getAccNo() == accNo)
				{
					System.out.println(i.deposit(amount));
					break;
				}
			}
			break;
			
		
		case "2":
			for(SalaryAccount i : salAccounts)
			{
				
				if(i == null)
				{
					System.out.println("Account Not Found!!");
					break;
				}
				else if( i.getAccNo() == accNo)
				{
					System.out.println(i.deposit(amount));
					break;
				}
			}
			break;

		default:
			System.out.println("Invalid Choice");
			break;
		}
		
		
		
		
		
		
		
	}

	private static void openSalaryAccount() {
		
		System.out.println("Enter Accounter Holder Name:");
		String accName = sc.nextLine();
		System.out.println("Enter Balance");
		double balance = Double.parseDouble(sc.nextLine());
		
		SalaryAccount salaryacc = new SalaryAccount(accName, balance);
		
		for (int i = 0; i < salAccounts.length; i++) {
			if( salAccounts[i] == null)
			{
				salAccounts[i] = salaryacc;
				break;
			}
			
		}
		
		System.out.println("*****New Account Details*****");
		System.out.println("Account No : "+salaryacc.getAccNo());
		System.out.println("Account Name : "+salaryacc.getAccName());
		System.out.println("Balance : "+salaryacc.getBalance());
		
	}

	private static void openSavingAccount() {
		
		System.out.println("Enter Accounter Holder Name:");
		String accName = sc.nextLine();
		System.out.println("Enter Balance");
		double balance = Double.parseDouble(sc.nextLine());
		
		SavingAccount savingacc = new SavingAccount(accName, balance);
		
		for (int i = 0; i < savAccounts.length; i++) {
			if( savAccounts[i] == null)
			{
				savAccounts[i] = savingacc;
				break;
			}
			
		}
		
		System.out.println("*****New Account Details*****");
		System.out.println("Account No : "+savingacc.getAccNo());
		System.out.println("Account Name : "+savingacc.getAccName());
		System.out.println("Balance : "+savingacc.getBalance());
	
	}

}

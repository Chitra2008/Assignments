package com.mastek.bankapp;

import com.mastek.bankapp.model.BankAccount;
import com.mastek.bankapp.model.SalaryAccount;
import com.mastek.bankapp.model.SavingAccount;
import java.util.HashMap;
import java.util.Scanner;

public class hashset {
	
	static Scanner sc = new Scanner(System.in);
	static HashMap<Integer, Double> savingaccount = new HashMap<>();

	public static void main(String[] args) {
		// TODO Auto-generated method stub

				
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
				}		
			}		
		}
		
		
		private static void openSalaryAccount() {
		// TODO Auto-generated method stub
		
	}


		private static void withdrawAmount() {
		// TODO Auto-generated method stub
		
	}


		private static void showAllAccounts() {
		// TODO Auto-generated method stub
		
	}


		private static void removeAccount() {
		// TODO Auto-generated method stub
		
	}


		private static void openSavingAccount() {
			
			System.out.println("Enter Accounter Holder Name:");
			String accName = sc.nextLine();
			System.out.println("Enter Balance");
			double balance = Double.parseDouble(sc.nextLine());
			
			SavingAccount savingacc = new SavingAccount(accName, balance);
			
			savingaccount.put(savingacc.getAccNo(), savingacc.getBalance());
			
			System.out.println("*****New Account Details*****");
			System.out.println("Account No : "+savingacc.getAccNo());
			System.out.println("Account Name : "+savingacc.getAccName());
			System.out.println("Balance : "+savingacc.getBalance());
		
		}
		
		private static void depositAmount() {
			
			System.out.println("Enter Account Number : ");
			int accNo = Integer.parseInt(sc.nextLine());
			
			System.out.println("Enter Amount to Deposit");
			double amount = Double.parseDouble(sc.nextLine());
			
			SavingAccount savingacc = new SavingAccount();
			
			if(savingaccount.containsKey(accNo))
			{
				savingaccount.put(accNo, (amount + savingacc.getBalance()));
			}
			
			System.out.println(accNo+" "+savingaccount.get(accNo));
			
//			
//			
//			
//			for(SavingAccount i : savAccounts)
//			{
//				
//				if(i == null)
//				{
//					System.out.println("Account Not Found!!");
//					break;
//				}
//				else if( i.getAccNo() == accNo)
//				{
//					System.out.println(i.deposit(amount));
//					break;
//				}
//			}
//			
//			for(SalaryAccount i : salAccounts)
//			{
//				
//				if(i == null)
//				{
//					System.out.println("Account Not Found!!");
//					break;
//				}
//				else if( i.getAccNo() == accNo)
//				{
//					System.out.println(i.deposit(amount));
//					break;
//				}
//			}
			
			
		}
	}



package com.mastek.demo;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.mastek.demo.model.employee;

public class App {

	public static void main(String[] args) {
		
		List <employee> emp = new ArrayList<employee>();
		
		emp.add(new employee("Renu", "xxx"));
		emp.add(new employee("Bitti", "yyy"));
		emp.add(new employee("Diu", "zzz"));
		emp.add(new employee("Teju", "www"));
		emp.add(new employee("Om", "mmm"));
		
//		employee obj = new employee();
//        System.out.println(obj.getRandomElement(emp));
        
        Iterator itr = emp.iterator();  
        Set<String> set = new HashSet<String>();
        //traverse elements of ArrayList object  
        while(itr.hasNext()){  
            employee uniqueValues=(employee)itr.next();  
            set.add(uniqueValues.getFname()); 
        }  
        
        HashMap<String,Integer> map=new HashMap<String,Integer>();
        
        map.put(null, null)

	}

}

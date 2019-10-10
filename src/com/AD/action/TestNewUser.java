/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.AD.action;
import javax.naming.NamingException;


public class TestNewUser {

	/**
	 * @param args
	 * @throws NamingException 
	 */
	public static void main(String[] args) throws NamingException {
		// TODO Auto-generated method stub
		NewUser nu = new NewUser("kamal123", "kamal", "kannan", "dB123EAP", "SharePoint");
		boolean status = nu.addUser();
		//boolean status = nu.deleteUser("kamal123");
		//nu.assignUser("kamal123", "JavaSample");
		if (status == true){
			System.out.println("user created succcessfully");
		}

	}

}

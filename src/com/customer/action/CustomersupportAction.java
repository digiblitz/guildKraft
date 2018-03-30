/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
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
package com.customer.action;

import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.login.action.KlgLoginAction;

public class CustomersupportAction implements Controller {
static Logger log = Logger.getLogger(CustomersupportAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws  ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
		try{
			GeneralDBAction db=new GeneralDBAction();
			 HttpSession session = request.getSession();
			  String cmd = request.getParameter("cmd");
			  //String customerProcess=request.getParameter("customerProcess");
			  if(cmd.equalsIgnoreCase("customer")){
				  request.setAttribute("cmd", cmd);
				  return new ModelAndView("customersupport");   	  
			  }
			  else if(cmd != null && cmd.equals("customerDetails")){
			  
			
	          String customerid=request.getParameter("customerid");
	          
	          ArrayList customerprofile=db.getcustomerDetails(customerid);
	         
	          
	          	        	  	String customer_id=null;
	          	        	  	
	        	  	 Iterator cus_det=customerprofile.iterator();
	        	  	 
		        	 while(cus_det.hasNext()){
		        		 String customerdetails[]=(String[]) cus_det.next();
			        		/*String  first_name = customerdetails[0];
			        		String   last_name = customerdetails[1];;
			        		String  e_mail =customerdetails[2];
			        		String   mobile = customerdetails[3];
			        		String  institution_name = customerdetails[4];;
			        		String  country = customerdetails[5];
			        		String  state = customerdetails[6];
			        		String  city = customerdetails[7];
			        		String  credit_card_type = customerdetails[8];
			        		String  credit_card_no =customerdetails[9];
			        		String cvv_no = customerdetails[10];
			        		String  name_on_card = customerdetails[11];
			        		String expiry_date =customerdetails[12];
			        		String registration_id = customerdetails[13]; 
			        		String  user_id = customerdetails[14];
			        		String  product_price = customerdetails[15];
			        		String  subscription_id = customerdetails[16];
			        		String  order_id = customerdetails[17];
			        		String  reg_date = customerdetails[18];
			        		String  Productplan = customerdetails[19];
			                  String   subscription_plan = customerdetails[20];
			                  String  amount =customerdetails[21];*/
		        		  customer_id =customerdetails[22];
		        		  log.info("=======customer id check==="+customer_id);
		        	 
		        	 if(customer_id!=null){
		        		  request.setAttribute("customerdetails", customerprofile);
		        		 return new ModelAndView("customerDetails");
		        		 
		        	 }
		        		 
		        	}  
	        	
	        	
	        
		        	 /*  log.info("customerid ::::"+customerid);
	         
	          
	          
	          log.info("first_name ::::"+first_name);
	          log.info("last_name ::::"+last_name);
	          log.info("e_mail ::::"+e_mail);
	          log.info("mobile ::::"+mobile);
	          log.info("institution_name ::::"+institution_name);
	          log.info("country ::::"+country);
	          log.info("state ::::"+state);
	          log.info("city ::::"+city);
	          log.info("credit_card_type ::::"+credit_card_type);
	          log.info("credit_card_no ::::"+credit_card_no);
	          log.info("cvv_no ::::"+cvv_no);
	          log.info("name_on_card ::::"+name_on_card);
	          log.info("expiry_date ::::"+expiry_date);
	          log.info("registration_id ::::"+registration_id);
	          log.info("user_id ::::"+user_id);
	          log.info("product_price ::::"+product_price);
	          log.info("subscription_id ::::"+subscription_id);
	          log.info("order_id ::::"+order_id);
	          //log.info("customer_id ::::"+customer_id);
	          log.info("reg_date ::::"+reg_date);
	          log.info("Product_plan ::::"+Productplan);
	          log.info("subscription_plan ::::"+subscription_plan);
	          log.info("amount ::::"+amount);

	   
	           log.info("inside customerdetails :::::::::");*/
	          
		      
	        	 
	        	 String idstatus="Invalid Customer ID";
	        	 
	        	 log.info("=====Details status====="+idstatus);
	        	 request.setAttribute("idstatus",idstatus);
	        	 
	        	 return new ModelAndView("customersupport");
		        }
		    
	         
		}
			
	catch(Exception e){
		e.printStackTrace();
		
	}
	
		
		return new ModelAndView("dashboard");
	}

}

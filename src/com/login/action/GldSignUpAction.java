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
package com.login.action;

import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.xmlrpc.XmlRpcException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.infusionejb.session.InfusionSessionBean;

public class GldSignUpAction implements Controller{
	GeneralDBAction db = new GeneralDBAction();
static Logger log = Logger.getLogger(KlgLoginAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
		
		HttpSession session=request.getSession(true);
		InfusionSessionBean emails=new InfusionSessionBean();
		String signUpProcess = request.getParameter("signUpProcess");
		
		if(signUpProcess.equalsIgnoreCase("getStarted"))
        { 
			return new ModelAndView("pricing"); 
        }
		
		if(signUpProcess.equalsIgnoreCase("pricingDetails"))
        { 
			String  fromTryNowSignUp = request.getParameter("fromTryNowSignUp");
			String  price = (String)request.getParameter("getProductPrice");
			String  amount = request.getParameter("amount");
			String Productplan=request.getParameter("Productplan");
			String onetimecost=request.getParameter("onetime");
			String offer=request.getParameter("offer");
		    String purchase = "try_now";
			Calendar c = Calendar.getInstance();
	        Calendar p = Calendar.getInstance();
	        c.add(Calendar.DATE, 30);
	        Date d = c.getTime();
	        Date s = p.getTime();
	        log.info("Today  date is: " + s);
	        log.info("30 days after today is: " + d);
	        SimpleDateFormat formatter=new SimpleDateFormat();
	        String end_date=formatter.format(d);
	        request.setAttribute("end_date", end_date);
	    	Date d1 = null;
	    	Date d2 = null;
	    	
	    	log.info("price ---> "+price);
	    	 
	    			try {
	    				
	    	 
	    				//in milliseconds
	    				long diff = s.getTime() - d.getTime();
	    	 
	    				long diffSeconds = Math.abs(diff / 1000 % 60);
	    				long diffMinutes = Math.abs(diff / (60 * 1000) % 60);
	    				long diffHours = Math.abs(diff / (60 * 60 * 1000) % 24);
	    				long diffDays = Math.abs(diff / (24 * 60 * 60 * 1000));
	    	 
	    				String sec=Long.toString(diffSeconds);
	    				String min=Long.toString(diffMinutes);
	    				String hour=Long.toString(diffHours);
	    				String day=Long.toString(diffDays);
	    	            String days=day+"days"+hour+"hours"+min+"minutes";
	    	            log.info("days" + days);
	    	            request.setAttribute("days" , days);
	    			} catch (Exception e) {
	    				e.printStackTrace();
	    			}
			     
	    			String productPrice = null;
			if(price!=null){
				purchase = "buy_now";
			//Double temp = Double.valueOf(price);
				productPrice = price;
			log.info("Product Price :::: "+productPrice);
			//double productPrice = temp;
			request.setAttribute("productPrice", productPrice);
			request.setAttribute("purchase", purchase);
			request.setAttribute("Productplan",Productplan);
			request.setAttribute("onetimecost",onetimecost);
			return new ModelAndView("onlineEdition"); 
			}else{
				productPrice = amount;
				request.setAttribute("productPrice", productPrice);
			}
			log.info("productPrice ---> "+productPrice);
			request.setAttribute("purchase", purchase);
			request.setAttribute("offer",offer);
			request.setAttribute("fromTryNowSignUp",fromTryNowSignUp);
			return new ModelAndView("onlineEdition"); 
        }
		
		
		 if(signUpProcess.equalsIgnoreCase("signup"))
         {  
			 String status=null;
			 String monthYear=null;
	          String firstname=request.getParameter("firstname");
	          String lastname=request.getParameter("lastname");
	          String e_mail=request.getParameter("email");
	          String mobileno=request.getParameter("mobileno");
	          String institutionName=request.getParameter("institutionName");
	          String country=request.getParameter("country");
	          String state=request.getParameter("state");
	          String city=request.getParameter("city");
	          String productPrice = (String) request.getParameter("productPrice");
	          String credit_card_type=request.getParameter("credit_card_type");
	          String credit_card_no=request.getParameter("credit_card_no");
	          String cvv_no=request.getParameter("cvv_no");
	          String name_on_card=request.getParameter("name_on_card");
	          String expiry_month=request.getParameter("expiry_month");
	          String expiry_year=request.getParameter("expiry_year");
	          String expiry_date = expiry_month+"/"+expiry_year;
	          String Productplan=request.getParameter("Productplan");
	          String plan=request.getParameter("plan");
	          String fee=request.getParameter("total_amount");
	          String addrline1=request.getParameter("addrline1");
	          String addrline2=request.getParameter("addrline2");
	          String total_amount=request.getParameter("total_amount");
	          String offer=request.getParameter("offer");
	          String fromTryNowSignUp=request.getParameter("fromTryNowSignUp");
	          
	          log.info("fromTryNowSignUp ::::"+fromTryNowSignUp);
	          log.info("productPrice ::::"+productPrice);
	          log.info("firstname ::::"+firstname);
	          log.info("lastname ::::"+lastname);
	          log.info("e_mail ::::"+e_mail);
	          log.info("mobileno ::::"+mobileno);
	          log.info("institutionName ::::"+institutionName);
	          log.info("country ::::"+country);
	          log.info("state ::::"+state);
	          log.info("city ::::"+city);
	          log.info("credit_card_type ::::"+credit_card_type);
	          log.info("credit_card_no ::::"+credit_card_no);
	          log.info("cvv_no ::::"+cvv_no);
	          log.info("name_on_card ::::"+name_on_card);
	          log.info("expiry_date ::::"+expiry_date);
	          log.info("Productplan ::::"+Productplan);
	          log.info("plan ::::"+plan);
	          log.info("fee ::::"+fee);
	          log.info("addrline1 ::::"+addrline1);
	          log.info("addrline2 ::::"+addrline2);
	          log.info("total_amount ::::"+total_amount);
	          log.info("offer ::::"+offer);
			 String payOption = (String)request.getParameter("payOption");
			
			 log.info("payOption ::::"+payOption);
			 
			 if(payOption.equalsIgnoreCase("try_now"))
			 
			 {
				 
				 if(fromTryNowSignUp != null && fromTryNowSignUp.equals("fromTryNowSignUp")){
					 
					 String pay_firstname=request.getParameter("firstname");
					 log.info("PAY_FIRSTNAME IN GUILD ACTION ::::::::::::::::::::::"+pay_firstname);
			          String pay_lastname=request.getParameter("lastname");
			          String pay_e_mail=request.getParameter("email");
			          String pay_mobileno=request.getParameter("mobileno");
			          String pay_institutionName=request.getParameter("institutionName");
			          String pay_country=request.getParameter("country");
			          String pay_state=request.getParameter("state");
			          String pay_city=request.getParameter("city");
			          String pay_productPrice = (String) request.getParameter("productPrice");
			          String pay_credit_card_type=request.getParameter("credit_card_type");
			          String pay_credit_card_no=request.getParameter("credit_card_no");
			          String pay_cvv_no=request.getParameter("cvv_no");
			          String pay_name_on_card=request.getParameter("name_on_card");
			          String pay_expiry_month=request.getParameter("expiry_month");
			          String pay_expiry_year=request.getParameter("expiry_year");
			          String pay_expiry_date = pay_expiry_month+"/"+pay_expiry_year;
			          String pay_addrline1=request.getParameter("addrline1");
			          String pay_addrline2=request.getParameter("addrline2");
			          String pay_total_amount=request.getParameter("total_amount");
			          String pay_zip=request.getParameter("zip");
			          
			          
			          
					 
						
					  int CcExpMonth = 0;
				        int CcExpYear = 0;
				        int CcCvvid =0;
				        double amount =0;
				        long CcNumber = 0;
				        long checkNumber=0;
				        String reqIp=request.getRemoteAddr();
					 //String paymenttype=request.getParameter("paytype");  
					  float total=0;
					
					   //String coupan_no=request.getParameter("coupan_no");
					   // log.info("user_id"+user_id);
					     
					    if(request.getParameter("expiry_month")==null){
				                CcExpMonth =0;
				            } else {
				                CcExpMonth=Integer.parseInt(request.getParameter("expiry_month"));
				            }
				            
				            if(request.getParameter("expiry_year")==null){
				                CcExpYear =0;
				            } else{
				                CcExpYear = Integer.parseInt(request.getParameter("expiry_year"));
				            }
				            
				            if(request.getParameter("cvv_no")==null && request.getParameter("cvv_no").trim().length()==0){
				                CcCvvid =0;
				            } else if(!request.getParameter("cvv_no").equals("") && request.getParameter("cvv_no").trim().length()!=0){
				                CcCvvid = Integer.parseInt(request.getParameter("cvv_no"));
				            } else {
				                CcCvvid =0;
				            }
				            
				            if(request.getParameter("credit_card_no")==null){
				                CcNumber =0;
				            } else{
				                CcNumber = Long.parseLong(request.getParameter("credit_card_no"));
				            }
				            
				            if(request.getParameter("total_amount")!=null && request.getParameter("total_amount").trim().length()!=0) {
				                amount = Double.valueOf(request.getParameter("total_amount")).doubleValue();
				            } else {
				                amount = 0.00;
				            }
				            
				            // Setting Parent member id in session after creating a member for payment rollback
				             int intVId = 0;
				            String inVoiceId1="1";
				            if (inVoiceId1.equalsIgnoreCase("0")) {
				                intVId = 1;
				            } else {
				                intVId = 1;
				            }
				             String expYear = request.getParameter("expiry_year");

				            String expDate = request.getParameter("expiry_month") + expYear;
				           // session.setAttribute("parentId",parentId);
				              session.setAttribute("sessionInvoiceId","1");
				            request.setAttribute("AMT", request.getParameter("total_amount"));
				            request.setAttribute("PAYMENTACTION", "Authorization");
				            request.setAttribute("CREDITCARDTYPE", request.getParameter("credit_card_type"));
				            request.setAttribute("ACCT", request.getParameter("credit_card_no"));
				            request.setAttribute("EXPDATE", expDate);
				            request.setAttribute("IPADDRESS", reqIp);
				            request.setAttribute("FIRSTNAME", request.getParameter("firstname"));
				            request.setAttribute("LASTNAME", request.getParameter("lastname"));
				            request.setAttribute("CVVNo", request.getParameter("cvv_no"));
				            request.setAttribute("STREET", request.getParameter("addrline1"));
				            request.setAttribute("CITY", request.getParameter("city"));
				            request.setAttribute("STATE", request.getParameter("state"));
				            request.setAttribute("ZIP", request.getParameter("zip"));
				            request.setAttribute("COUNTRYCODE", request.getParameter("country"));
				            request.setAttribute("EMAIL", request.getParameter("email"));
				            request.setAttribute("INSTITUTIONNAME", request.getParameter("institutionName"));
				            String instituteId = db.selectInstitutionId(request.getParameter("email"));
				            request.setAttribute("INSTITUTIONID", instituteId);
				            //session.setAttribute("objPayment", objPayment);//no need
				           // session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
				            
				            Calendar now = Calendar.getInstance();
				          	SimpleDateFormat formatyear = new SimpleDateFormat("yy");
				          	Date date=now.getTime();
				          	String year = formatyear.format(date);
				          	log.info(year);
				          	
				          	
				          	SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
				          	Date dateMonth=now.getTime();
				          	String month=formatmonth.format(dateMonth);
				          	log.info(month);
				          	
				          	 monthYear=year+month+"GK";
				          	log.info(monthYear);
				            
				            
				            request.setAttribute("pay_firstname", pay_firstname);
					          request.setAttribute("pay_lastname", pay_lastname);
					          request.setAttribute("pay_e_mail", pay_e_mail);
					          request.setAttribute("pay_mobileno", pay_mobileno);
					          request.setAttribute("pay_institutionName", pay_institutionName);
					          request.setAttribute("pay_country", pay_country);
					          request.setAttribute("pay_state", pay_state);
					          request.setAttribute("pay_city", pay_city);
					          request.setAttribute("pay_productPrice", pay_productPrice);
					          request.setAttribute("pay_credit_card_type", pay_credit_card_type);
					          request.setAttribute("pay_credit_card_no", pay_credit_card_no);
					          request.setAttribute("pay_cvv_no", pay_cvv_no);
					          request.setAttribute("pay_name_on_card", pay_name_on_card);
					          request.setAttribute("pay_expiry_month", pay_expiry_month);
					          request.setAttribute("pay_expiry_year", pay_expiry_year);
					          request.setAttribute("pay_expiry_date", pay_expiry_date);
					          request.setAttribute("monthYear", monthYear);
					          request.setAttribute("pay_addrline1", pay_addrline1);
					          request.setAttribute("pay_addrline2", pay_addrline2);
					          request.setAttribute("pay_total_amount", total_amount);
					          request.setAttribute("pay_zip", pay_zip);
					          
					          
					          
					          log.info("pay_firstname::::::::::::::::::"+pay_firstname);
					          log.info("pay_lastname::::::::::::::::::"+pay_lastname);
					          log.info("pay_e_mail::::::::::::::::::"+pay_e_mail);
					          log.info("pay_mobileno::::::::::::::::::"+pay_mobileno);
					          log.info("pay_institutionName::::::::::::::::::"+pay_institutionName);
					          log.info("pay_country::::::::::::::::::"+pay_country);
					          log.info("pay_state::::::::::::::::::"+pay_state);
					          log.info("pay_city::::::::::::::::::"+pay_city);
					          log.info("pay_productPrice::::::::::::::::::"+pay_productPrice);
					          log.info("pay_credit_card_type::::::::::::::::::"+pay_credit_card_type);
					          log.info("pay_credit_card_no::::::::::::::::::"+pay_credit_card_no);
					          log.info("pay_cvv_no::::::::::::::::::"+pay_cvv_no);
					          log.info("pay_name_on_card::::::::::::::::::"+pay_name_on_card);
					          log.info("pay_expiry_month::::::::::::::::::"+pay_expiry_month);
					          log.info("pay_expiry_year::::::::::::::::::"+pay_expiry_year);
					          log.info("pay_expiry_date::::::::::::::::::"+pay_expiry_date);
					          log.info("pay_addrline1::::::::::::::::::"+pay_addrline1);
					          log.info("pay_addrline2::::::::::::::::::"+pay_addrline2);
					          log.info("pay_total_amount::::::::::::::::::"+pay_total_amount);
					          
					          productPrice=payOption;
				            
				               request.setAttribute("intVId", String.valueOf(intVId));
				            log.info("intVId in servlet&&&&&&&" + intVId);
				            request.setAttribute("purpose", "memberregistration");
				            request.setAttribute("Productplan", Productplan);
				            request.setAttribute("plan", plan);
				            request.setAttribute("fee", fee);
				            request.setAttribute("typename", productPrice);
				            
				            return new ModelAndView("testpaypal"); 
				 }
				 log.info("inside try_now :::::::::");
      	   
				 productPrice=payOption;
        
				 // double 
          
			          log.info("firstname :::"+firstname);
			          log.info("e_mail :::"+e_mail);
			          log.info("institutionName :::"+institutionName);
			          Calendar now = Calendar.getInstance();
			      	SimpleDateFormat formatyear = new SimpleDateFormat("yy");
			      	Date date=now.getTime();
			      	String year = formatyear.format(date);
			      	log.info(year);
			      	
      	
			      	SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
			      	Date dateMonth=now.getTime();
			      	String month=formatmonth.format(dateMonth);
			      	log.info(month);
			      	
			      	 monthYear=year+month+"GK";
			      	log.info(monthYear);
			           String userid=db.getuseridbyemail(e_mail);
			           log.info("Print User ID In code"+userid);
			           String transactionid=null;
			          if(userid != null){
			           status=db.updateusersignup(firstname,lastname,e_mail,mobileno,institutionName,country,state, city, credit_card_type, credit_card_no, cvv_no, name_on_card, expiry_date, productPrice, monthYear,Productplan,plan,fee,addrline1,addrline2,total_amount,offer,transactionid); 
			         
			          }else{
			            status=db.insertsignup(firstname,lastname,e_mail,mobileno,institutionName,country,state, city, credit_card_type, credit_card_no, cvv_no, name_on_card, expiry_date, productPrice, monthYear,Productplan,plan,fee,addrline1,addrline2,total_amount,offer,transactionid);
			            
			            
			          
			          }
			    	  log.info("Sign up status====>"+status);
			          if(status != null){
			        
			        	  
			             request.setAttribute("firstname", firstname);
			            
			             request.setAttribute("lastname", lastname);
			             request.setAttribute("e_mail", e_mail);
			             request.setAttribute("instituteName", institutionName);
			             String instituteId = db.selectInstitutionId(e_mail);
			             request.setAttribute("instituteID", instituteId);
			            // String subscription_id = db.selectsubscription_id(e_mail);
			            //request.setAttribute("subscription_id", subscription_id);
			             String userdetail=db.getuserandpass(e_mail);
			             String username=null;
			             String password=null;
			             String[] parts = userdetail.split("/");
			             username = parts[0];
			             password = parts[1]; 
			            
			             String subs_id = db.selectsubscription_id(e_mail);
			             request.setAttribute("subs_id", subs_id);
			             String ord_id = db.selectorder_id(e_mail);
			             request.setAttribute("ord_id", ord_id);
			             String cus_id = db.selectcustomer_id(e_mail);
			             request.setAttribute("cus_id", cus_id);
			             request.setAttribute("offer", offer);
			             request.setAttribute("payoption",payOption);
			             log.info("Offer value inside  the if loop"+ offer);
			             
			             request.setAttribute("username", username);
			             request.setAttribute("password", password);
			             
			             String fromAddress="info@guildkraft.com";
                		  String toAddress=e_mail;
                          String ccAddresses=""; String bccAddresses="";  String contentType="HTML/TEXT"; 
                          String subject="Sign-up Success"; String textBody="";
                          String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                        			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                        			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"../../images/logo_footer.png\" alt=\"Logo\"/></a></td>" +
                        			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                        			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                        			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                        					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Congratulations User!</h4><p style=\"   font-size: 19px;" +
                        					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">You have finished setting up your account.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                        					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login to Your Account</span></a></td>" +
                        					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                        					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                        					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                        					"<strong>User Name</strong><br />"+username+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                        					"<strong>Password</strong><br />"+password+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                        					"<strong>Institution ID</strong><br /> "+instituteId+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                        					"<strong>Subscription ID </strong><br /> "+subs_id+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                        					"<strong>Order ID</strong><br /> "+ord_id+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                        					"<strong>Customer ID</strong><br /> "+cus_id+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                        					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                          try {
                        	  
                        	//emails.createContactInfusion(fname, lname, email1);
								int infusionUserId = emails.createAndCheckDuplicateContact(firstname, lastname, e_mail);
						log.info("emailId "+infusionUserId);
								
						InfusionSessionBean.optin_outEmail(e_mail);
         				
							boolean emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
         				} catch (XmlRpcException e) {
         					// TODO Auto-generated catch block
         					e.printStackTrace();
         				}
			             
          }
      	   
          return new ModelAndView("signUpDetails");  
			 }
			 else if(payOption.equalsIgnoreCase("buy_now")){
				 
				 String pay_firstname=request.getParameter("firstname");
				 log.info("PAY_FIRSTNAME IN GUILD ACTION ::::::::::::::::::::::"+pay_firstname);
		          String pay_lastname=request.getParameter("lastname");
		          String pay_e_mail=request.getParameter("email");
		          String pay_mobileno=request.getParameter("mobileno");
		          String pay_institutionName=request.getParameter("institutionName");
		          String pay_country=request.getParameter("country");
		          String pay_state=request.getParameter("state");
		          String pay_city=request.getParameter("city");
		          String pay_productPrice = (String) request.getParameter("productPrice");
		          String pay_credit_card_type=request.getParameter("credit_card_type");
		          String pay_credit_card_no=request.getParameter("credit_card_no");
		          String pay_cvv_no=request.getParameter("cvv_no");
		          String pay_name_on_card=request.getParameter("name_on_card");
		          String pay_expiry_month=request.getParameter("expiry_month");
		          String pay_expiry_year=request.getParameter("expiry_year");
		          String pay_expiry_date = pay_expiry_month+"/"+pay_expiry_year;
		          String pay_addrline1=request.getParameter("addrline1");
		          String pay_addrline2=request.getParameter("addrline2");
		          String pay_total_amount=request.getParameter("total_amount");
		          String pay_zip=request.getParameter("zip");
		          
		          
		          
				 
					
				  int CcExpMonth = 0;
			        int CcExpYear = 0;
			        int CcCvvid =0;
			        double amount =0;
			        long CcNumber = 0;
			        long checkNumber=0;
			        String reqIp=request.getRemoteAddr();
				 //String paymenttype=request.getParameter("paytype");  
				  float total=0;
				
				   //String coupan_no=request.getParameter("coupan_no");
				   // log.info("user_id"+user_id);
				     
				    if(request.getParameter("expiry_month")==null){
			                CcExpMonth =0;
			            } else {
			                CcExpMonth=Integer.parseInt(request.getParameter("expiry_month"));
			            }
			            
			            if(request.getParameter("expiry_year")==null){
			                CcExpYear =0;
			            } else{
			                CcExpYear = Integer.parseInt(request.getParameter("expiry_year"));
			            }
			            
			            if(request.getParameter("cvv_no")==null && request.getParameter("cvv_no").trim().length()==0){
			                CcCvvid =0;
			            } else if(!request.getParameter("cvv_no").equals("") && request.getParameter("cvv_no").trim().length()!=0){
			                CcCvvid = Integer.parseInt(request.getParameter("cvv_no"));
			            } else {
			                CcCvvid =0;
			            }
			            
			            if(request.getParameter("credit_card_no")==null){
			                CcNumber =0;
			            } else{
			                CcNumber = Long.parseLong(request.getParameter("credit_card_no"));
			            }
			            
			            if(request.getParameter("total_amount")!=null && request.getParameter("total_amount").trim().length()!=0) {
			                amount = Double.valueOf(request.getParameter("total_amount")).doubleValue();
			            } else {
			                amount = 0.00;
			            }
			            
			            // Setting Parent member id in session after creating a member for payment rollback
			             int intVId = 0;
			            String inVoiceId1="1";
			            if (inVoiceId1.equalsIgnoreCase("0")) {
			                intVId = 1;
			            } else {
			                intVId = 1;
			            }
			             String expYear = request.getParameter("expiry_year");

			            String expDate = request.getParameter("expiry_month") + expYear;
			           // session.setAttribute("parentId",parentId);
			              session.setAttribute("sessionInvoiceId","1");
			            request.setAttribute("AMT", request.getParameter("total_amount"));
			            request.setAttribute("PAYMENTACTION", "Authorization");
			            request.setAttribute("CREDITCARDTYPE", request.getParameter("credit_card_type"));
			            request.setAttribute("ACCT", request.getParameter("credit_card_no"));
			            request.setAttribute("EXPDATE", expDate);
			            request.setAttribute("IPADDRESS", reqIp);
			            request.setAttribute("FIRSTNAME", request.getParameter("firstname"));
			            request.setAttribute("LASTNAME", request.getParameter("lastname"));
			            request.setAttribute("CVVNo", request.getParameter("cvv_no"));
			            request.setAttribute("STREET", request.getParameter("addrline1"));
			            request.setAttribute("CITY", request.getParameter("city"));
			            request.setAttribute("STATE", request.getParameter("state"));
			            request.setAttribute("ZIP", request.getParameter("zip"));
			            request.setAttribute("COUNTRYCODE", request.getParameter("country"));
			            request.setAttribute("EMAIL", request.getParameter("email"));
			            request.setAttribute("INSTITUTIONNAME", request.getParameter("institutionName"));
			            String instituteId = db.selectInstitutionId(request.getParameter("email"));
			            request.setAttribute("INSTITUTIONID", instituteId);
			            //session.setAttribute("objPayment", objPayment);//no need
			           // session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
			            
			            Calendar now = Calendar.getInstance();
			          	SimpleDateFormat formatyear = new SimpleDateFormat("yy");
			          	Date date=now.getTime();
			          	String year = formatyear.format(date);
			          	log.info(year);
			          	
			          	
			          	SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
			          	Date dateMonth=now.getTime();
			          	String month=formatmonth.format(dateMonth);
			          	log.info(month);
			          	
			          	 monthYear=year+month+"GK";
			          	log.info(monthYear);
			            
			            
			            request.setAttribute("pay_firstname", pay_firstname);
				          request.setAttribute("pay_lastname", pay_lastname);
				          request.setAttribute("pay_e_mail", pay_e_mail);
				          request.setAttribute("pay_mobileno", pay_mobileno);
				          request.setAttribute("pay_institutionName", pay_institutionName);
				          request.setAttribute("pay_country", pay_country);
				          request.setAttribute("pay_state", pay_state);
				          request.setAttribute("pay_city", pay_city);
				          request.setAttribute("pay_productPrice", pay_productPrice);
				          request.setAttribute("pay_credit_card_type", pay_credit_card_type);
				          request.setAttribute("pay_credit_card_no", pay_credit_card_no);
				          request.setAttribute("pay_cvv_no", pay_cvv_no);
				          request.setAttribute("pay_name_on_card", pay_name_on_card);
				          request.setAttribute("pay_expiry_month", pay_expiry_month);
				          request.setAttribute("pay_expiry_year", pay_expiry_year);
				          request.setAttribute("pay_expiry_date", pay_expiry_date);
				          request.setAttribute("monthYear", monthYear);
				          request.setAttribute("pay_addrline1", pay_addrline1);
				          request.setAttribute("pay_addrline2", pay_addrline2);
				          request.setAttribute("pay_total_amount", total_amount);
				          request.setAttribute("pay_zip", pay_zip);
				          
				          
				          
				          log.info("pay_firstname::::::::::::::::::"+pay_firstname);
				          log.info("pay_lastname::::::::::::::::::"+pay_lastname);
				          log.info("pay_e_mail::::::::::::::::::"+pay_e_mail);
				          log.info("pay_mobileno::::::::::::::::::"+pay_mobileno);
				          log.info("pay_institutionName::::::::::::::::::"+pay_institutionName);
				          log.info("pay_country::::::::::::::::::"+pay_country);
				          log.info("pay_state::::::::::::::::::"+pay_state);
				          log.info("pay_city::::::::::::::::::"+pay_city);
				          log.info("pay_productPrice::::::::::::::::::"+pay_productPrice);
				          log.info("pay_credit_card_type::::::::::::::::::"+pay_credit_card_type);
				          log.info("pay_credit_card_no::::::::::::::::::"+pay_credit_card_no);
				          log.info("pay_cvv_no::::::::::::::::::"+pay_cvv_no);
				          log.info("pay_name_on_card::::::::::::::::::"+pay_name_on_card);
				          log.info("pay_expiry_month::::::::::::::::::"+pay_expiry_month);
				          log.info("pay_expiry_year::::::::::::::::::"+pay_expiry_year);
				          log.info("pay_expiry_date::::::::::::::::::"+pay_expiry_date);
				          log.info("pay_addrline1::::::::::::::::::"+pay_addrline1);
				          log.info("pay_addrline2::::::::::::::::::"+pay_addrline2);
				          log.info("pay_total_amount::::::::::::::::::"+pay_total_amount);
				          
				          productPrice=payOption;
			            
			               request.setAttribute("intVId", String.valueOf(intVId));
			            log.info("intVId in servlet&&&&&&&" + intVId);
			            request.setAttribute("purpose", "memberregistration");
			            request.setAttribute("Productplan", Productplan);
			            request.setAttribute("plan", plan);
			            request.setAttribute("fee", fee);
			            request.setAttribute("typename", productPrice);
			            
			            return new ModelAndView("testpaypal"); 
				 
			 
				 
			 }/*else {
				 request.setAttribute("firstname", firstname);
	             log.info("=====First name in code===="+firstname);
	             request.setAttribute("lastname", lastname);
	             request.setAttribute("e_mail", e_mail);
	             request.setAttribute("payoption",payOption);
				 status=db.insertsignup(firstname,lastname,e_mail,mobileno,institutionName,country,state, city, credit_card_type, credit_card_no, cvv_no, name_on_card, expiry_date, productPrice, monthYear,Productplan,plan,fee,addrline1,addrline2,total_amount,offer);
				 
			 return new ModelAndView("signUpDetails");
			 
			 }*/
         }
		 
		 else if(signUpProcess!=null && signUpProcess.equalsIgnoreCase("payPalPreAction")){}
          
         else if(signUpProcess!=null && signUpProcess.equalsIgnoreCase("getcompanydetails")){
      	    String user_id=request.getParameter("user_id");
      	  
      	    String city=null;
      	    String state=null;
      	    String country=null;
      	   
      	    String phone=null;
      	   
      	  
      	    String urllink=null;
      	    String suges=null;
      	    String agree=null;
      	    String date=null;
      	    String month=null;
      	    String year=null;
      	    
      	     try {
      	     
      	   
      	     }catch(Exception e){
      	      e.printStackTrace();
      	     }
      	    
      	        return new ModelAndView("optionindex"); 
      	       }









		
		  return new ModelAndView("frmHome");
	}

}

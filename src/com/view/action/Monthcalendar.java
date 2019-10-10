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
package com.view.action;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;

public class Monthcalendar  implements Controller{
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
			String cmd=request.getParameter("cmd");
			System.out.println("cmd value outer"+cmd);
			HttpSession session=request.getSession(true); 
			GeneralDBAction db =new GeneralDBAction();
			
			 DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd ");
			    Date date1 = new Date();
			    
			    String todaydate= dateFormat.format(date1);
			    
			   System.out.println("====Today's date===="+todaydate);
			
		try{
			
			if(cmd.equalsIgnoreCase("viewcalendar")){
				
				ArrayList eventdetails = db.getcaleventDetails(todaydate);
				System.out.println("Getting data successfull");
				request.setAttribute("eventdetails",eventdetails);	
				request.setAttribute("curdate", todaydate);
				return new ModelAndView("themegreen");
			}
			
			else if(cmd.equalsIgnoreCase("eventreg")){
				
				String user_id=(String)session.getAttribute("userId");
				String event_id=request.getParameter("event_id");
				String sdate=request.getParameter("sdate");
				String edate=request.getParameter("edate");
				String title=request.getParameter("title");
				System.out.println("====event_id==="+event_id);
				
				String event_amount=db.geteventamount(event_id);
				System.out.println("event_amount------>"+ event_amount);
				
				request.setAttribute("sdate", sdate);
				request.setAttribute("edate", edate);
				request.setAttribute("title", title);
				request.setAttribute("user_id", user_id);
				request.setAttribute("amount", event_amount);
				System.out.println("====title==="+title);
				
				return new ModelAndView("frmeventregister");
			}
			else if(cmd.equalsIgnoreCase("usreventdet")){
				String sessionuserid=(String)session.getAttribute("userId");
				System.out.println("sessionuserid in java"+sessionuserid);
				System.out.println("cmd value inner"+cmd);
				
				System.out.println("Get user deatils from jsp");
				String user_id=request.getParameter("user_id");
				String event_title=request.getParameter("event_title");
				String start_date=request.getParameter("startdate");
				String end_date=request.getParameter("enddate");
				String amount=request.getParameter("amount");
				String firstname=request.getParameter("fname");
				String lastname=request.getParameter("lname");
				String email=request.getParameter("email");
				String city=request.getParameter("city");
				String state=request.getParameter("state");
				String country=request.getParameter("country");
				
				
				request.setAttribute("sessionuserid", sessionuserid);
				request.setAttribute("user_id", user_id);
				request.setAttribute("event_title", event_title);
				request.setAttribute("start_date", start_date);
				request.setAttribute("end_date", end_date);
				request.setAttribute("amount", amount);
				request.setAttribute("firstname", firstname);
				request.setAttribute("lastname", lastname);
				request.setAttribute("email", email);
				request.setAttribute("city", city);
				request.setAttribute("country", country);
				request.setAttribute("state", state);
				
				
				//String usreventdets=db.insertusereventdetails(event_title,start_date,end_date,firstname,lastname,email,city,state,country);
				//System.out.println("=====db check==="+usreventdets);
				return new ModelAndView("frmeventpayment");
				}
			else if(cmd.equalsIgnoreCase("couponoffer")){
				 int total=0;
				String user_id=request.getParameter("user_id");
				String event_title=request.getParameter("event_title");
				String start_date=request.getParameter("start_date");
				String end_date=request.getParameter("end_date");
				String amount=request.getParameter("amount");
				String firstname=request.getParameter("firstname");
				String lastname=request.getParameter("lastname");
				String email=request.getParameter("email");
				String institutename=request.getParameter("institutename");
				String country=request.getParameter("country");
				String state=request.getParameter("state");
				String city=request.getParameter("city");
				String coupon=request.getParameter("coupon");
				
				String couponcode = null;
				couponcode =db.getcouponcodedetailbycouponName(coupon);
				
				if(couponcode == ""){
					
					request.setAttribute("status", "Invalid coupon code");
					request.setAttribute("user_id", user_id);
					request.setAttribute("event_title", event_title);
					request.setAttribute("start_date", start_date);
					request.setAttribute("end_date", end_date);
					request.setAttribute("firstname", firstname);
					request.setAttribute("lastname", lastname);
					request.setAttribute("email", email);
					request.setAttribute("institutename", institutename);
					request.setAttribute("country", country);
					request.setAttribute("state", state);
					request.setAttribute("city", city);
					request.setAttribute("amount", amount);
					
					return new ModelAndView("frmeventpayment");
				}
				else if(couponcode != null){
					
					String offer= db.getcouponoffer(coupon);
					 System.out.println(" offer ------->: "+offer);
					 System.out.println(" couponcode ------->: "+couponcode);
					 float s = Float.parseFloat(amount);
					 int p = (int) s;
					 //float c = Float.parseFloat(offer);
					//int p = Integer.parseInt(amount);
					 int c = Integer.parseInt(offer);
					 int t=p*c/100;
					total=p-t;
					if(total > 0){
						String price = Integer.toString(total);
						
						if(offer != null ){
							request.setAttribute("coupon", coupon);	
							
						}
						request.setAttribute("amount", price);
						request.setAttribute("user_id", user_id);
						request.setAttribute("event_title", event_title);
						request.setAttribute("start_date", start_date);
						request.setAttribute("end_date", end_date);
						request.setAttribute("firstname", firstname);
						request.setAttribute("lastname", lastname);
						request.setAttribute("email", email);
						request.setAttribute("institutename", institutename);
						request.setAttribute("country", country);
						request.setAttribute("state", state);
						request.setAttribute("city", city);
						
						return new ModelAndView("frmeventpaymentoffer");	
					}else if(total == 0 ){
						
						  if(offer != null){
								request.setAttribute("coupon", coupon);	
								
							}
			        	
						boolean regiStatus = false;
			        	regiStatus = db.insertPreMemRegi(event_title,user_id,start_date,end_date);	
			        	request.setAttribute("event_title", event_title);
			        	request.setAttribute("start_date", start_date);
			        	request.setAttribute("end_date", end_date);
			        	request.setAttribute("user_id", user_id);
			        	
			        	 return new ModelAndView("EventregConf");
					}
					}
				
				
			}
			else if (cmd.equalsIgnoreCase("eventpaydet")){
				
				String user_id=request.getParameter("user_id");
				String event_title=request.getParameter("event_title");
				String start_date=request.getParameter("start_date");
				String end_date=request.getParameter("end_date");
				
				 String pay_firstname=request.getParameter("firstname");
				 System.out.println("PAY_FIRSTNAME IN GUILD ACTION ::::::::::::::::::::::"+pay_firstname);
		          String pay_lastname=request.getParameter("lastname");
		          String pay_e_mail=request.getParameter("email");
		          
		          String pay_mobileno=request.getParameter("mobileno");
		          
		          String pay_institutionName=request.getParameter("institutename");
		          String pay_country=request.getParameter("country");
		          String pay_state=request.getParameter("state");
		          String pay_city=request.getParameter("city");
		          
		          String pay_productPrice = (String) request.getParameter("amount");
		          String pay_credit_card_type=request.getParameter("card_type");
		          String pay_credit_card_no=request.getParameter("card_no");
		          String pay_cvv_no=request.getParameter("cvv_no");
		          String pay_name_on_card=request.getParameter("card_name");
		          String pay_expiry_month=request.getParameter("expiry_month");
		          String pay_expiry_year=request.getParameter("expiry_year");
		          String pay_expiry_date = pay_expiry_month+"/"+pay_expiry_year;
		          String pay_addrline1=request.getParameter("addrline1");
		          String pay_addrline2=request.getParameter("addrline2");
		          String pay_total_amount=request.getParameter("amount");
		          
		          
		          
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
					   // System.out.println("user_id"+user_id);
					     
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
				            
				            if(request.getParameter("card_no")==null){
				                CcNumber =0;
				            } else{
				                CcNumber = Long.parseLong(request.getParameter("card_no"));
				            }
				            
				            if(request.getParameter("amount")!=null && request.getParameter("amount").trim().length()!=0) {
				                amount = Double.valueOf(request.getParameter("amount")).doubleValue();
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
				            request.setAttribute("AMT", request.getParameter("amount"));
				            request.setAttribute("PAYMENTACTION", "Authorization");
				            request.setAttribute("CREDITCARDTYPE", request.getParameter("card_type"));
				            request.setAttribute("ACCT", request.getParameter("card_no"));
				            request.setAttribute("EXPDATE", expDate);
				            request.setAttribute("IPADDRESS", reqIp);
				            request.setAttribute("FIRSTNAME", request.getParameter("card_name"));
				            request.setAttribute("LASTNAME", request.getParameter("card_name"));
				            request.setAttribute("CVVNo", request.getParameter("cvv_no"));
				            request.setAttribute("STREET", "1 Main St");
				            request.setAttribute("CITY", request.getParameter("city"));
				            request.setAttribute("STATE", request.getParameter("state"));
				            request.setAttribute("ZIP", "95131");
				            request.setAttribute("COUNTRYCODE", pay_country);
				            request.setAttribute("EMAIL", request.getParameter("email"));
				            
				            request.setAttribute("event_title", event_title);
				           // String instituteId = db.selectInstitutionId(request.getParameter("email"));
				           request.setAttribute("start_date", start_date);
				           request.setAttribute("end_date", end_date);
				           request.setAttribute("userId1", request.getParameter("user_id"));
				            
				            Calendar now = Calendar.getInstance();
				          	SimpleDateFormat formatyear = new SimpleDateFormat("yy");
				          	Date date=now.getTime();
				          	String year = formatyear.format(date);
				          	System.out.println(year);
				          	
				          	
				          	SimpleDateFormat formatmonth = new SimpleDateFormat("MM");
				          	Date dateMonth=now.getTime();
				          	String month=formatmonth.format(dateMonth);
				          	System.out.println(month);
				          	
				          	String monthYear=year+month+"GK";
				          	System.out.println(monthYear);
				            
				            
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
					          request.setAttribute("pay_total_amount", pay_total_amount);
					          
					          request.setAttribute("pay_event_title", event_title);
					           // String instituteId = db.selectInstitutionId(request.getParameter("email"));
					          request.setAttribute("pay_start_date", start_date);
					          request.setAttribute("pay_end_date", end_date);
					          request.setAttribute("pay_userId1", request.getParameter("user_id"));
					          
					          
					          
					          System.out.println("pay_firstname::::::::::::::::::"+pay_firstname); 
					          System.out.println("pay_lastname::::::::::::::::::"+pay_lastname); 
					          System.out.println("pay_e_mail::::::::::::::::::"+pay_e_mail); 
					          System.out.println("pay_mobileno::::::::::::::::::"+pay_mobileno); 
					          System.out.println("pay_institutionName::::::::::::::::::"+pay_institutionName); 
					          System.out.println("pay_country::::::::::::::::::"+pay_country); 
					          System.out.println("pay_state::::::::::::::::::"+pay_state); 
					          System.out.println("pay_city::::::::::::::::::"+pay_city); 
					          System.out.println("pay_productPrice::::::::::::::::::"+pay_productPrice); 
					          System.out.println("pay_credit_card_type::::::::::::::::::"+pay_credit_card_type); 
					          System.out.println("pay_credit_card_no::::::::::::::::::"+pay_credit_card_no); 
					          System.out.println("pay_cvv_no::::::::::::::::::"+pay_cvv_no);
					          
					          System.out.println("pay_name_on_card::::::::::::::::::"+pay_name_on_card); 
					          System.out.println("pay_expiry_month::::::::::::::::::"+pay_expiry_month); 
					          System.out.println("pay_expiry_year::::::::::::::::::"+pay_expiry_year); 
					          System.out.println("pay_expiry_date::::::::::::::::::"+pay_expiry_date); 
					          System.out.println("pay_institutionName::::::::::::::::::"+pay_institutionName); 
					          System.out.println("pay_addrline1::::::::::::::::::"+pay_addrline1); 
					          System.out.println("pay_addrline2::::::::::::::::::"+pay_addrline2); 
					          System.out.println("pay_total_amount::::::::::::::::::"+pay_total_amount); 
					          System.out.println("pay_event_title::::::::::::::::::"+event_title); 
					          System.out.println("pay_start_date::::::::::::::::::"+start_date); 
					          System.out.println("pay_end_date::::::::::::::::::"+end_date); 
					          System.out.println("pay_userId1::::::::::::::::::"+user_id); 
					          
					          //productPrice=payOption;
				            
				               request.setAttribute("intVId", String.valueOf(intVId));
				               System.out.println("intVId in servlet&&&&&&&" + intVId); 
				           
				            request.setAttribute("purpose", "memberregistration");
			            /*request.setAttribute("Productplan", Productplan);
			            request.setAttribute("plan", plan);
			            request.setAttribute("fee", fee);
			            request.setAttribute("typename", productPrice);
			            */
			            return new ModelAndView("testpaypal"); 
				 
			 
				 
			 }
			else if(cmd.equalsIgnoreCase("listevedet")){
				
				 ArrayList eventregdetails=db.geteventregdetails();
				 
				request.setAttribute("eventregdetails", eventregdetails);
				 return new ModelAndView("showeventlist");
			}
			
			else if(cmd.equalsIgnoreCase("editEvedetail")){
				
				String eventid=request.getParameter("event_id");
	        	 
	        	 ArrayList geteventditdet=db.geteventditdet(eventid);
	        	 request.setAttribute("geteventditdet", geteventditdet);
				 return new ModelAndView("editeventlist");
			}
			
			else if(cmd.equalsIgnoreCase("updateevedet")){
				 String event_id=request.getParameter("event_id");
	        	 String event_name=request.getParameter("event_name");
	        	 String event_amount=request.getParameter("event_amount");
	        	 System.out.println("event_amount in java--->"+event_amount);
	        	 
	        	 boolean getupdateeventdet=db.getupdateeventdet(event_id,event_name,event_amount);
	        	 
	        	 request.setAttribute("getupdateeventdet", getupdateeventdet);
	        	 ArrayList geteventditdet=db.geteventditdet(event_id);
	        	 request.setAttribute("geteventditdet", geteventditdet);
	        	 return new ModelAndView("editeventlist");
			}
			
			
				
				//String eventpay = db.inserteventpaydetails(amount,card_type,card_no,cvv,card_name);
		
            
		}catch(Exception e){
            e.printStackTrace();
        }
	
				return new ModelAndView("dashboard");
	
	}
}

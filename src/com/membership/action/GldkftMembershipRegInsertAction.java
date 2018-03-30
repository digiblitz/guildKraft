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
package com.membership.action;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.ejb.FinderException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCMemberHistoryDetail;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcform.util.HLCUserMaster;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlckavery.stateless.HLCkaveryStatelessBean;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import com.db.GeneralDBAction;

public class GldkftMembershipRegInsertAction implements Controller {
	
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
	
		HLCKaveryMembershipTypeSessionBean membTypeBean=new HLCKaveryMembershipTypeSessionBean();
		HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
		HLCMahanadhiSessionBean acctBean=new HLCMahanadhiSessionBean();
		HLCkaverySessionBeanStatlessBean hrsBean= new HLCkaverySessionBeanStatlessBean();
		HLCKaverySessionStatefulBean hrsStBean= new HLCKaverySessionStatefulBean();
		HLCkaveryStatelessBean mrmAdminBean=new HLCkaveryStatelessBean();
		HLCKaverySessionBeanStatfulBean frmRegBean=new HLCKaverySessionBeanStatfulBean();
		
		 HLCMemberDetails objMember = new HLCMemberDetails();
	        HLCPaymentDetails objPayment = new HLCPaymentDetails();
	        HLCUserMaster objUserMaster=new HLCUserMaster();
	        HLCContactDetails objContactDetail=new HLCContactDetails();
	        GeneralDBAction db=new GeneralDBAction();	
		
		
		 HttpSession session=request.getSession(true); 
		 //----------------prabhu here--------------------//
		 String preMembProc=request.getParameter("preMembProc");
		 
		String process=request.getParameter("process");
		String userId=(String)session.getAttribute("userId");
        String membId=(String)session.getAttribute("memberId");
        String reqIp=request.getRemoteAddr();
        Debug.print(" Request IP :"+reqIp);
        String fwd="";
        String actStat=null;
        Date act_date_card = new Date();
        
        
        
 
        
        if(preMembProc.equalsIgnoreCase("preMembProc")){
        	String mem_type_id=null;
        	String userId1=(String)session.getAttribute("userId");
        	System.out.println("user id in servlet : "+userId1);
        	String memberId = db.selectMemberId();
        	System.out.println("memTypeId in servlet : "+memberId);
        	String mem_type=request.getParameter("selDisp");
        	try {
				 mem_type_id = db.getmember_typeid(mem_type);
			} catch (FinderException e) {
				
				e.printStackTrace();
			}
        	boolean regiStatus = false;boolean upStatus = false;
        	System.out.println("mem_type parsu in servlet : "+mem_type);
        	if(mem_type.equalsIgnoreCase("Free Membership") ){
        		regiStatus = db.insertPreMemRegi(memberId, userId1,mem_type_id);
        		
            	request.setAttribute("membId", memberId);
        		if(regiStatus == true){
        			upStatus = db.updateusercode(memberId, userId1);
                 	return new ModelAndView("preMembRegiCnf");
                	}
        	}else if(mem_type.equalsIgnoreCase("Full Membership")){
        		request.setAttribute("memfee", "99");
        		return new ModelAndView("frmMemberPricing");
        	}
        	/*if(regiStatus == true){
         	return new ModelAndView("preMembRegiCnf");
        	}*/
        }
        
        if(preMembProc.equalsIgnoreCase("signup"))
        {  
			 String status=null;
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
	          
	          System.out.println("productPrice ::::"+productPrice);
	          System.out.println("firstname ::::"+firstname);
	          System.out.println("lastname ::::"+lastname);
	          System.out.println("e_mail ::::"+e_mail);
	          System.out.println("mobileno ::::"+mobileno);
	          System.out.println("institutionName ::::"+institutionName);
	          System.out.println("country ::::"+country);
	          System.out.println("state ::::"+state);
	          System.out.println("city ::::"+city);
	          System.out.println("credit_card_type ::::"+credit_card_type);
	          System.out.println("credit_card_no ::::"+credit_card_no);
	          System.out.println("cvv_no ::::"+cvv_no);
	          System.out.println("name_on_card ::::"+name_on_card);
	          System.out.println("expiry_date ::::"+expiry_date);
	          System.out.println("Productplan ::::"+Productplan);
	          System.out.println("plan ::::"+plan);
	          System.out.println("fee ::::"+fee);
	          System.out.println("addrline1 ::::"+addrline1);
	          System.out.println("addrline2 ::::"+addrline2);
	          System.out.println("total_amount ::::"+total_amount);
	          
			 
				 
				 String pay_firstname=request.getParameter("firstname");
				 System.out.println("PAY_FIRSTNAME IN GUILD ACTION ::::::::::::::::::::::"+pay_firstname);
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
		          
		          
		          
				 
					
				  int CcExpMonth = 0;
			        int CcExpYear = 0;
			        int CcCvvid =0;
			        double amount =0;
			        long CcNumber = 0;
			        long checkNumber=0;
			       // String reqIp=request.getRemoteAddr();
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
			            request.setAttribute("STREET", "1 Main St");
			            request.setAttribute("CITY", request.getParameter("city"));
			            request.setAttribute("STATE", request.getParameter("state"));
			            request.setAttribute("ZIP", "95131");
			            request.setAttribute("COUNTRYCODE", request.getParameter("country"));
			            request.setAttribute("EMAIL", request.getParameter("email"));
			            request.setAttribute("INSTITUTIONNAME", institutionName);
			            String instituteId = db.selectInstitutionId(request.getParameter("email"));
			            request.setAttribute("INSTITUTIONID", instituteId);
			            //session.setAttribute("objPayment", objPayment);//no need
			           // session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
			            
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
				          request.setAttribute("pay_total_amount", total_amount);
				          
				          
				          
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
				          System.out.println("pay_addrline1::::::::::::::::::"+pay_addrline1);
				          System.out.println("pay_addrline2::::::::::::::::::"+pay_addrline2);
				          System.out.println("pay_total_amount::::::::::::::::::"+pay_total_amount);
				          
				       
			            
			               request.setAttribute("intVId", String.valueOf(intVId));
			            System.out.println("intVId in servlet&&&&&&&" + intVId);
			            request.setAttribute("purpose", "memberregistration");
			            request.setAttribute("Productplan", Productplan);
			            request.setAttribute("plan", plan);
			            request.setAttribute("fee", fee);
			            request.setAttribute("typename", productPrice);
			            
			            return new ModelAndView("testpaypal"); 
				 
			 
				 
			 
        }
           
            
            return null;//new ModelAndView("desc-membership-status");
           
       
        
	}
	
}

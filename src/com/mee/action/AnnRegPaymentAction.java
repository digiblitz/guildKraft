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
package com.mee.action;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;

import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemote;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemoteHome;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.util.HLCAnnualUserVO;
import com.mee.actionform.AnnRegPaymentForm;
import com.hlcmee.ann.HLCAnnualMeetingStore;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.*;
import org.apache.struts.util.MessageResources;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlcpayment.HLCPaymentSessionBean;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import javax.naming.InitialContext;
import javax.naming.Context;
import com.hlcspnr.sponsor.*;
import java.util.*;
import java.text.*;
import com.hlccommon.util.Debug;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcform.util.HLCPaymentDetails;


	public class AnnRegPaymentAction implements Controller {
     
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
         try{

        	 HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
        StringBuffer reqURL = request.getRequestURL();
        int lastIndex = reqURL.lastIndexOf("/") ;
        String url ="";
        if(lastIndex!=-1){
            url = reqURL.substring(0,lastIndex+1);
        }
        String tmpNova = "annualPaymentcard.html";
        String nova = url + tmpNova;
        Debug.print("Nova Value: "+nova);
           
        HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();
        HLCKaveryMembershipTypeSessionBean membTypBean=new HLCKaveryMembershipTypeSessionBean();        
// Refund Feasibility        

        String reqIp=request.getRemoteAddr();
        Debug.print(" Request IP :"+reqIp);        
        
      String annProcess = request.getParameter("annProcess"); 
      SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
      HttpSession session = request.getSession();
      
      String staff_user_id= (String) session.getAttribute("staff_user_id");
      String ipAddr = request.getRemoteAddr();      
      Debug.print("ipAddr :"+ipAddr);
      
      //==========================================redirects to payment page
      HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
      HLCVaigaiSessionBean vaigaiMeetingBean  = new HLCVaigaiSessionBean();
        String sesUserId ="";
        String ticket="0";
        boolean tickStatus =false;
        int  CcExpMonth = 0;
        int CcExpYear = 0;
        int CcCvvid =0;
        double totalAmount =0;
        String CcNumber ="0";
        String checkNumber="0";
        Date check_date = null;
        Date comp_date = null;
        String ccType=null;
        String ccName=null;
        String nameoncheck = null;
        String bankname = null;
      if(annProcess.equals("saveAnnualDetail")){
            String inVoiceId1 = "1";
                 System.out.println("inVoiceId1 in servlet********" + inVoiceId1);
        
         // VaigaiSessionRemote vaigaiMeetingBean  = initializeVaigaiEJB(request);
        ticket="0";
        tickStatus =false;
      String rself =request.getParameter("rself");
     // String activityLength = request.getParameter("actSize");
     
      
      String actSize = request.getParameter("actSize");
      ArrayList addTktList = null;
      
      
      String addTktRegistrarName = request.getParameter("addTktRegistrarName");
        Debug.print("actSize:" + actSize);
        String actAddTkt = "";
        try{
            if(actSize!=null){
                int arrayLength = Integer.parseInt(actSize);
                 addTktList = new ArrayList();
                for(int pId =0 ;pId <arrayLength;pId++){
                    String cnt = String.valueOf(pId+1);
                   // Debug.print("priceIdLen:" + priceIdLen);
                    String param = "actCheckBox" + cnt; // activityId
                    String param1 = "actVal" + cnt; //activityName
                    String param2 = "noofticket" + cnt; //no of tickets
                    String param5 = "calculAmt"+cnt; //TotalAmount
                    String param4 = "priceId" + cnt; //no of tickets
                    
                    Debug.print("param" + param);
                    Debug.print("param1" + param1);
                    Debug.print("param2" + param2);
                    Debug.print("param4" + param4);
                    Debug.print("param5" + param5);
                    
                    String actCheckBox = request.getParameter(param);
                    String actVal = request.getParameter(param1);
                    String actTkt = request.getParameter(param2);
                    String priceId = request.getParameter(param4);
                    String totTktAmt = request.getParameter(param5);                    
                    
                    
                    Debug.print("actCheckBox:" + actCheckBox);
                    Debug.print("actVal:" + actVal);
                    Debug.print("actTkt:" + actTkt);
                    Debug.print("totTktAmt" + totTktAmt);
                    Debug.print("priceId" + priceId);
                    
                    if(addTktRegistrarName!=null && addTktRegistrarName.trim().length()!=0 &&
                            priceId!=null && priceId.trim().length()!=0 && actTkt!=null 
                            && !actTkt.equals("0") && actTkt.trim().length()!=0){
                        
                        String tempAddTkt[] = {priceId, actTkt, totTktAmt};
                        addTktList.add(tempAddTkt);
                    }
                    
                    String ConcatString = actVal +"#"+actTkt;
                    actAddTkt = actAddTkt + ConcatString +",";
                }
            }
        }
        
        catch(Exception e){
            Debug.print("Ecxception while getting No of tickets:" + e.getMessage());
        }
                    
      if(rself.equals("yes")){
            ticket = actAddTkt;
            tickStatus =true;
       }
      else{
          ticket="";
          tickStatus =false;
      }
      
        
      sesUserId = (String)session.getAttribute("userId");
      String emailId = (String)session.getAttribute("emailId");
      Debug.print("Servlet rself:" + rself );
      Debug.print("Servlet User ID:" + sesUserId );
      Debug.print("Servlet userName :" + ticket);
      Debug.print("Servlet tickStatus :" + tickStatus);
         String chckAmount1 = request.getParameter("chkAmt");
         String totalAmt= request.getParameter("totalAmount");
         
         float checkAmount1 = 0;
         if(chckAmount1==null || chckAmount1==""){
                        checkAmount1=0; 
               }
                        else{
                        checkAmount1 = Float.parseFloat(chckAmount1);
                        }   
         
               AnnRegPaymentForm endForm=new AnnRegPaymentForm(); 
               
               HLCPaymentDetailVO objPayDet1 = new HLCPaymentDetailVO();
               HLCPaymentDetails objPayment = new HLCPaymentDetails();
                   if(endForm.getTotalAmount()==null || endForm.getTotalAmount()==""){
                    totalAmount=0; 
                }
                else{
                    totalAmount = Double.parseDouble(endForm.getTotalAmount());
                } 
             Debug.print("totalAmount in AnnRegPaymentAction:" +totalAmount);            
               String  r11 = endForm.getR11();
               System.out.print("Check Status :" + r11);
               
                if(r11.equals("card")){
                    if(endForm.getCcNumber()==null || endForm.getCcNumber().equals("")){
                        CcNumber = "0";
                    }
                    else {
                        CcNumber = endForm.getCcNumber();
                    }
                    if(endForm.getCcName()==null || endForm.getCcName().equals("")){
                        ccName ="";
                    }
                    else {
                        ccName=endForm.getCcName();
                    }
                    if(!(endForm.getCcType().equals("")) && endForm.getCcType()!=null){
                        ccType = endForm.getCcType();  
                    }
                    if(endForm.getCcExpMonth()==null || endForm.getCcExpMonth().equals("")){
                        CcExpMonth =0;
                    }
                    else {
                        CcExpMonth=Integer.parseInt(endForm.getCcExpMonth());
                    }
                    if(endForm.getCcExpYear()==null || endForm.getCcExpYear().equals("")){
                        CcExpYear =0;
                    }
                    else{
                        CcExpYear = Integer.parseInt(endForm.getCcExpYear());
                    }
                    if(endForm.getCcCvvid()==null || endForm.getCcCvvid().equals("")){
                        CcCvvid =0;
                    }
                    else{
                        CcCvvid = Integer.parseInt(endForm.getCcCvvid());
                    }
                    check_date= null;
                    objPayment.setPaymentStatus("Credit Card");
                    
                    objPayment.setIpAddress(ipAddr);
                    
               objPayment.setUserId(sesUserId);
            objPayment.setCcName(ccName);
            objPayment.setCcType(ccType);
            objPayment.setCcNumber(CcNumber);
            objPayment.setCcExpMonth(CcExpMonth);
            objPayment.setCcExpYear(CcExpYear);
            objPayment.setCcCvvid(CcCvvid);
          //  if(bankname!=null){
                bankname =endForm.getBankName();
           // }
           //  if(nameoncheck!=null){
               nameoncheck =endForm.getNameCheck();
         //   }
            objPayment.setBankName(bankname);
            objPayment.setCheckName(nameoncheck);
            objPayment.setCheckDate(check_date);
            objPayment.setCheckNumber(checkNumber);
            objPayment.setAmount(totalAmount);
            objPayment.setPaymentDate(new Date());     
                    
                }
                
                if(r11.equals("check")){
                    if(endForm.getCheckNumber()==null || endForm.getCheckNumber().equals("")){
                    checkNumber="0";
                    }
                    else{
                    checkNumber= endForm.getCheckNumber();
                    }
                    if(endForm.getCheckDate().equals("")){
                    check_date= null;
                    }
                    else{
                    check_date =(Date)sdf.parse(endForm.getCheckDate());
                    }
                    objPayDet1.setPaymentStatus("Check");
                    
           objPayDet1.setUserId(sesUserId);
            objPayDet1.setCcName(ccName);
            objPayDet1.setCcType(ccType);
            objPayDet1.setCcNumber(CcNumber);
            objPayDet1.setCcExpMonth(CcExpMonth);
            objPayDet1.setCcExpYear(CcExpYear);
            objPayDet1.setCcCvvid(CcCvvid);
          //  if(bankname!=null){
                bankname =endForm.getBankName();
           // }
           //  if(nameoncheck!=null){
               nameoncheck =endForm.getNameCheck();
         //   }
            objPayDet1.setBankName(bankname);
            objPayDet1.setCheckName(nameoncheck);
            objPayDet1.setCheckDate(check_date);
            objPayDet1.setCheckNumber(checkNumber);
            objPayDet1.setAmount(totalAmount);
            objPayDet1.setPaymentDate(new Date());         
            objPayDet1.setIpAddress(ipAddr);       
                    
                }
                 
             
            
                
          
           if(r11.equals("card")){
                Debug.print("Sucessfully Redirect to NoVa:");
             
             
            
              String paymentId = vaigaiMeetingBean.getNextId();
              Debug.print("paymentId in check:" + paymentId);
                 
              String expMon = String.valueOf(CcExpMonth);
              String expYear = String.valueOf(CcExpYear); 
              
              String expDate = expMon + expYear;
              
           int intVId = 0;
            if (inVoiceId1.equalsIgnoreCase("0")) {
                intVId = 1;
            } else {
                intVId = 1;
            }       
             if(paymentId!=null && paymentId.trim().length()!=0){
                 objPayment.setPaymentId(paymentId);
             }else{
                 objPayment.setPaymentId(null); 
             }
             if(reqIp!=null && reqIp.trim().length()!=0){
                 objPayment.setIpAddress(reqIp);
             }else{
                 objPayment.setIpAddress(null); 
             }    
           Debug.print("objPayDet.getPaymentId() in ActionEventOrgRenewal&&&&&&"+objPayment.getPaymentId());
             
            request.setAttribute("AMT", request.getParameter("totalAmount"));
            request.setAttribute("PAYMENTACTION", "Authorization");
            request.setAttribute("CREDITCARDTYPE", request.getParameter("ccType"));
            request.setAttribute("ACCT", request.getParameter("ccNumber"));
            request.setAttribute("EXPDATE", expDate);
            request.setAttribute("IPADDRESS", reqIp);
            request.setAttribute("FIRSTNAME", request.getParameter("ccName"));
            request.setAttribute("CVVNo", request.getParameter("ccCvvid"));
            request.setAttribute("STREET", "1 Main St");
            request.setAttribute("CITY", "San Jose");
            request.setAttribute("STATE", "CA");
            request.setAttribute("ZIP", "95131");
            request.setAttribute("COUNTRYCODE", "US");
            request.setAttribute("EMAIL", emailId);
            session.setAttribute("URLPATH", "annConRegInsert.do?annProcess=payment");
            session.setAttribute("cardselect",request.getParameter("ccType"));
            session.setAttribute("addTktRegistrarName", addTktRegistrarName);
            session.setAttribute("ticket", ticket);
            session.setAttribute("totAmount", String.valueOf(totalAmount));
            session.setAttribute("addTktList", addTktList);
            session.setAttribute("objPayment", objPayment);  
            session.setAttribute("checkAmount1", String.valueOf(checkAmount1));  
            //intVId++; 
            request.setAttribute("intVId", String.valueOf(intVId));
            System.out.println("intVId in servlet&&&&&&&" + intVId);
            request.setAttribute("purpose", "annualmeetingreg"); 
            session.setAttribute("paymentId",paymentId);
            session.setAttribute("sessionInvoiceId", "1");
            
               
                
                
            return new ModelAndView("testpaypal");     
            }
           else{
                String res[]={sesUserId,ticket,String.valueOf(totalAmount),"Pending"};
                HLCAnnualMeetingStore regList = (HLCAnnualMeetingStore)session.getAttribute("regList");
              
              boolean result =false;
                String meetId=null;
                if(regList!=null){
                Enumeration e = regList.getEnumeration();
                //String[] priceDet ={};
                  String paymentId = vaigaiMeetingBean.getNextId();
                  Debug.print("paymentId in check:" + paymentId);
                 meetId = vaigaiMeetingBean.registerAnnualMeeting(res, e, paymentId, addTktRegistrarName, addTktList);
                   String registraterId=vaigaiMeetingBean.getAnnualRegistraterId(meetId);
                 ArrayList priceList= vaigaiMeetingBean.getAnnualPriceDetailsByAnnualId(registraterId);
                 
                 Debug.print("meetId***********"+meetId);
                 Debug.print("registraterId *******"+registraterId);
                 
                  Debug.print("priceList (((((((("+priceList.size());
                 objPayDet1.setPaymentId(paymentId);
                 Debug.print("Activity Organizer INserted Sucessfully:"+result);

                 boolean result1  = paymentBean.createPayment(objPayDet1);
                 Debug.print("Result  Payment Bean" + result1);
                 Debug.print("succsssullll Created.........::");
              if(result1 == true && result == true){        
                 
                 String toMailIds[] = {emailId};

                EmailContent email=new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("info@digiblitz.com");
                email.setSubject("Annual Meeting & Convention Registration");

             String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
              " <tr>" +
              " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
              " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                    "<tr>" +
                    "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                    " </tr>"+
                    "  <tr>"+
                    "<td valign=\"top\">"+
                    "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                   "<tr>"+
                   "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                   "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                   "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                   "</tr>"+
                   "<tr>"+
                   "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                    "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                    "<span class=\"boldTxt\">Dear User</span>,<br /><br />"+
                   "<p>Dear User,"+

"You have successfully registered with HLC for all "+
"the Annual Convention Registration that are to be held! Your application would be verified and processed within"+
"24 hours."+
"Thank you for using this service.<p>"+
                   
                     "Thank You <br />"+
                    "------------------ <br />"+
                    "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                    "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                    "</tr>"+
                    "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                    "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                    "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                     "</tr>"+
                     " </table>"+
                    "</td></tr>"+
                      "+<tr>"+
                            "<td valign=\"top\" style=\"padding:10px;\">"+
                            "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />"+
                            "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                            "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                            "<ul>"+
                              "<li>Unlimited shopping online.</li>"+
                              "<li>Place advertisements online and/or on-site.</li>"+
                              "<li>Sponsor competitions held by HLC.</li>"+
                            "</ul>"+


                            "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                            "per your �Role� assigned:"+

                            "<ul>"+
                              "<li>Compete in Equestrian Events held by HLC.</li>"+
                              "<li>Take part in other events like; Annual Meetings, Educational events,"+
                                    "Activity Meetings held by HLC etc.</li>"+
                              "<li>Send Messages to other members.</li>"+
                              "<li>Create your own Distribution Lists.</li>"+
                              "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                             " <li>Unlimited Shopping online.</li>"+
                             " <li>Place advertisements online and/or on-site.</li>"+
                             " <li>Sponsor competitions held by HLC.</li>"+
                            "</ul>"+

                            "and much more..."+
                            "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                      "</tr>"+
                     " <tr>"+
                            "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                      "</tr>"+
                       "</table>";

                            email.setBody(content);
                            //email.setAttachments();
                            EmailEngine emailEngine = new EmailEngine();
                            boolean emailFlag = emailEngine.sendMimeEmail(email);
                            //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                            Debug.print("Email sent sucessfully :"+emailFlag);
                }
                 
//// Horse Member type Entry             /*   
          double otherAmount = 0.0;
          String otherStrAmt = "";          
	  String specTransId = (String) session.getAttribute("specTransId");
          Debug.print("Spec Trans Id is ::::::::::::::::"+specTransId);
	    if(specTransId!=null || specTransId.trim().length()!=0){

	    
		HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(specTransId);
		HLCAccTransactionVO regiVO = new HLCAccTransactionVO();

		String accNo =  accTxnDet.getAccount_no();
		String className = accTxnDet.getClass_name();
		String itemNo = accTxnDet.getItem_no();
		String subAccNo = accTxnDet.getSub_account_no();
		String transName = accTxnDet.getTransaction_name();
		String transType = accTxnDet.getTransaction_type();

		if(r11.equalsIgnoreCase("check")){
		       regiVO.setPayment_mode("check");
		       regiVO.setActive_status(false);
		}  
 
                double regAmount = 0.0;
                String regStrAmt = "";
                double tempregAmount = 0.0;
                double tempOtherAmount = 0.0;                
                Debug.print("Before Renumeration");
                Enumeration new_Enum = regList.getEnumeration();
                Debug.print("After Renumeration");
                while(new_Enum.hasMoreElements()){
                        Debug.print("Inisde While Loop");
                        HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO) new_Enum.nextElement();

                        regAmount = tempObjAnnualUser.getRegAmount();
                        otherAmount = tempObjAnnualUser.getOtherActAmount();

                        tempregAmount = tempregAmount + regAmount;
                        tempOtherAmount = tempOtherAmount + otherAmount;

                        Debug.print(" tempregAmount "+tempregAmount);
                        Debug.print(" tempOtherAmount "+tempOtherAmount);
                }
                
                regStrAmt = Double.toString(tempregAmount);
                
		regiVO.setAmount(Float.parseFloat(regStrAmt));
		regiVO.setDescription(transName);
		regiVO.setClass_Typ(className);
		regiVO.setAccount_no(accNo);
		regiVO.setAccount_type("Income");
		
		regiVO.setItem_no(itemNo);
		regiVO.setSub_account_no(subAccNo);
		regiVO.setPayment_id(paymentId);
                
                String logBy ="user";
                // Setting staff user_id and ip_address 
                if(session.getAttribute("loggedBy")!=null){
                    String loggedBy="";
                    loggedBy=(String)session.getAttribute("loggedBy");
                    logBy=loggedBy;

                        String userId = (String) session.getAttribute("userId");                        
                        regiVO.setStaff_user_id(staff_user_id);
                        regiVO.setStaff_ip_address(reqIp);
                }
                //End Setting staff_user_id and ip_address
                boolean insert_status = mahanadhiBean.insertAccountTxnDetails(regiVO);
                Debug.print("Insert Status "+insert_status);                            
	    }

//// Ended the registration Trans Entry          
          
//// For Activity Trans Entry
          
          
	  String activityId = (String) session.getAttribute("activityId");
          Debug.print("Activity Type Id is ::::::::::::::::"+activityId);
	    if(activityId!=null || activityId.trim().length()!=0){

	    
		HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(activityId);
		HLCAccTransactionVO regiVO = new HLCAccTransactionVO();

		String accNo =  accTxnDet.getAccount_no();
		String className = accTxnDet.getClass_name();
		String itemNo = accTxnDet.getItem_no();
		String subAccNo = accTxnDet.getSub_account_no();
		String transName = accTxnDet.getTransaction_name();
		String transType = accTxnDet.getTransaction_type();

		if(r11.equalsIgnoreCase("check")){
		       regiVO.setPayment_mode("check");
		       regiVO.setActive_status(false);
		}

                double regAmount = 0.0;
                String regStrAmt = "";
                double tempregAmount = 0.0;
                double tempOtherAmount = 0.0;          
                Debug.print("Before Renumeration");
                Enumeration new_Enum = regList.getEnumeration();
                Debug.print("After Renumeration");
                while(new_Enum.hasMoreElements()){
                        Debug.print("Inisde While Loop");
                        HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO) new_Enum.nextElement();

                        regAmount = tempObjAnnualUser.getRegAmount();
                        otherAmount = tempObjAnnualUser.getOtherActAmount();

                        tempregAmount = tempregAmount + regAmount;
                        tempOtherAmount = tempOtherAmount + otherAmount;

                        Debug.print(" tempregAmount "+tempregAmount);
                        Debug.print(" tempOtherAmount "+tempOtherAmount);
                }
                Iterator itr = addTktList.iterator();
                double otherTktAmt = 0.0;
                while(itr.hasNext()){
                    String tempAddTkt[] = (String[])itr.next();
                    otherTktAmt = otherTktAmt + Double.parseDouble(tempAddTkt[2]);
                }
                Debug.print("Additional Tkt amt is "+otherTktAmt);
                Debug.print("Main Activ Tkt amt is "+tempOtherAmount);
                tempOtherAmount = tempOtherAmount + otherTktAmt;      
                Debug.print("Sum of amt is "+tempOtherAmount);
                regStrAmt = Double.toString(tempOtherAmount);
                
		regiVO.setAmount(Float.parseFloat(regStrAmt));
		regiVO.setDescription(transName);
		regiVO.setClass_Typ(className);
		regiVO.setAccount_no(accNo);
		regiVO.setAccount_type("Income");
		//horseMem.setUser_id(userId);
		//horseMem.setIp_address(reqIp);
		regiVO.setItem_no(itemNo);
		regiVO.setSub_account_no(subAccNo);
		regiVO.setPayment_id(paymentId);
                String logBy ="user";
                // Setting staff user_id and ip_address 
                if(session.getAttribute("loggedBy")!=null){
                    String loggedBy="";
                    loggedBy=(String)session.getAttribute("loggedBy");
                    logBy=loggedBy;

                        regiVO.setStaff_user_id(staff_user_id);
                        regiVO.setStaff_ip_address(reqIp);
                }
                //End Setting staff_user_id and ip_address
                boolean insert_status = mahanadhiBean.insertAccountTxnDetails(regiVO);
                Debug.print("Insert Status "+insert_status);                            
		 
	    }
          /// End Transac Entry 
          String logBy="user";
          Debug.print("session.getAttribute(\"loggedBy\") is "+session.getAttribute("loggedBy"));
// OverPayment Transaction Entry
                if(session.getAttribute("loggedBy")!=null)
                {
                    String loggedBy="";
                    loggedBy=(String)session.getAttribute("loggedBy");
                    logBy=loggedBy;

                        // Making the active Status and reconcile status as true on full payment

                        //Setting the reconcile & active Status TRUE
                            String chckAmount = request.getParameter("chkAmt");
                            String totAmt1 = request.getParameter("totalAmount");
                            Debug.print("chckAmount is "+chckAmount);
                            Debug.print("totAmt1 is "+totAmt1);
                            if(chckAmount!=null && totAmt1!=null){
                                if(chckAmount.trim().length()!=0 && totAmt1.trim().length()!=0){
                                    double chkAmt = Double.parseDouble(chckAmount);
                                    double totAmt = Double.parseDouble(totAmt1);
                                    float float_chkAmt = Float.parseFloat(chckAmount);
                                    double extraAmt = chkAmt - totAmt;

                                    if(extraAmt > 0){
                                        boolean update_refund = educationBean.updatePendingAmount(sesUserId,paymentId,float_chkAmt);
                                        Debug.print("update_refund is "+update_refund);
                                        
                                        String StrextraAmt = String.valueOf(extraAmt);
                                        HLCAccTxnTypeDetailVO overpayDet = mahanadhiBean.getOverPayAccTransactionTypeDetail();
                                        HLCAccTransactionVO overpayfinalDet = new HLCAccTransactionVO();
                                        
                                        String accNo = overpayDet.getAccount_no();
                                        String accClassname = overpayDet.getClass_name();
                                        String accItemNo = overpayDet.getItem_no();
                                        String accAccNo = overpayDet.getSub_account_no();
                                        String accTranName = overpayDet.getTransaction_name();
                                        String accTyped = overpayDet.getTransaction_type();
                                        String accTypeId = overpayDet.getTransaction_type_id();
                                        String description = overpayDet.getTransaction_name();
                                        Debug.print("While getting"+ overpayDet.toString());
                                        
                                        overpayfinalDet.setAccount_no(accNo);
                                        overpayfinalDet.setAccount_type("Income");
                                        overpayfinalDet.setAccount_no(accNo);
                                        overpayfinalDet.setClass_Typ(accClassname);
                                        overpayfinalDet.setPayment_id(paymentId);
                                        overpayfinalDet.setSub_account_no(accAccNo);
                                        overpayfinalDet.setItem_no(accItemNo);
                                        overpayfinalDet.setAmount(Float.parseFloat(StrextraAmt));
                                        overpayfinalDet.setTransaction_id(accTypeId);
                                        overpayfinalDet.setDescription(description);
                                        
                                        String userId = (String) session.getAttribute("userId");
                                        overpayfinalDet.setStaff_user_id(staff_user_id);
                                        overpayfinalDet.setStaff_ip_address(reqIp);
                                        
                                        String pay_mode=request.getParameter("r11");
                                        
                                        if(pay_mode!=null && pay_mode.trim().length()>0){
                                            if(pay_mode.equalsIgnoreCase("check")){    
                                                overpayfinalDet.setPayment_mode("check");
                                                overpayfinalDet.setActive_status(false);
                                            }
                                        }
                                        Debug.print("B4 insert "+ overpayfinalDet.toString());
                                        boolean extraPay = mahanadhiBean.insertAccountTxnDetails(overpayfinalDet);
                                    }
                                    
                                    if(chkAmt>=totAmt){
                                        if(paymentId!=null || paymentId.trim().length()!=0){
                                            boolean Update_Status = mahanadhiBean.updateRecouncilActiveStatusAccTxnDetails(paymentId);
                                            Debug.print("Update Status "+Update_Status);
                                        }
                                    }

                                }
                        // End Of Status change
                    }
                }
// End Over Payment Transaction Entry
                 
              request.setAttribute("amount",String.valueOf(totalAmount)); 
              session.removeAttribute("regList");
              return new ModelAndView("frmMeeAnnualSuccess");
                }
           }
        
           }
        
         }
            catch(Exception exp){
                exp.printStackTrace();
                Debug.print("Exception while getting JNDI for Payment Bean" + exp);
            }
             return null;
       }
    
   

    
}

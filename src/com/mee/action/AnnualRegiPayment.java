/*
 * Program Name     :   AnnualRegiPayment.java
 * Created Date     :   June 13, 2007, 11:20 AM
 * Author           :   Hari
 * Copy Right       :   digiBlitz Technologies Inc /  digiBlitz Technologies (P) Ltd
 * Version          :   1.2
 * CopyRightInformation:
 *  (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
 *  916 W. Broad Street Suite 205, FallsChurch, VA 22046.
 *  This document is protected by copyright. No part of this document may be reproduced in any form by any means without
 *  prior written authorization of Sun and its licensors. if any.
 *  The information described in this document may be protected by one or more U.S.patents.foreign patents,or
 *  pending applications.
 */
package com.mee.action;

import com.hlcaccounts.util.Debug;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcform.util.HLCPaymentDetails;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemote;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemoteHome;
import com.hlcreg.util.HLCPaymentVO;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.HLCAnnualDetVO;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.mrm.actionform.FormHorseUpgrade;
import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


	public class AnnualRegiPayment implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
			HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
			HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();
        String execute = request.getParameter("execute");
        HttpSession session = request.getSession();
        HLCKaveryMembershipTypeSessionBean membTypBean =new HLCKaveryMembershipTypeSessionBean();
        HLCKaverySessionBeanStatfulBean kaveryStatfulBean=new HLCKaverySessionBeanStatfulBean();
        if(execute!=null && execute.trim().length()!=0){
            Debug.print("execute is "+execute);
            
            if(execute.trim().equalsIgnoreCase("listDetails")){
                String pay_id = request.getParameter("pa_id");
                String regi_id = request.getParameter("registr_id");
                String meet_id = request.getParameter("meet_id");
                Debug.print("pay_id "+ pay_id);
                Debug.print("regi_id "+ regi_id);
                Debug.print("meet_id "+meet_id);
                
                ArrayList pendIndo = vaigaiMeetingBean.getAnnualPendingListDetails(regi_id,pay_id,meet_id);
                
                request.setAttribute("pendInfo",pendIndo);
                return new ModelAndView("frmAnnualDetailDisp");
            }
            
            if(execute.trim().equalsIgnoreCase("payProceed")){
                String amt = request.getParameter("amt");
                String pa_id = request.getParameter("pa_id");
                String meet_id = request.getParameter("meet_id");
                String badge_name = request.getParameter("badgeName");
                
                session.setAttribute("amount",amt);
                session.setAttribute("payId",pa_id);
                session.setAttribute("bdgeNme",badge_name);
                session.setAttribute("meetId",meet_id);
                Debug.print("Session values set "+ session.getAttribute("amount"));
                Debug.print("Session values set "+ session.getAttribute("payId"));
                Debug.print("Session values set "+ session.getAttribute("bdgeNme"));
                Debug.print("Session values set "+ session.getAttribute("meetId"));
                return new ModelAndView("frmAnnMeetFailPay");
            }
            
            if(execute.trim().equalsIgnoreCase("retryPayProceed")){
                Debug.print("retryPayProceed is executed "+execute);
                
                String paymentId = (String) session.getAttribute("paymentId");
                String amount = (String) session.getAttribute("amount");
                String userId = (String) session.getAttribute("userId");
                Debug.print("Payment Id "+paymentId);
                Debug.print("amount  "+amount);
                Debug.print("userId  "+userId);
                
                if(paymentId!=null && userId!=null){
                ArrayList det = vaigaiMeetingBean.getAnnualMeetingDetails(userId,paymentId);
                Iterator itr = det.iterator();
                while(itr.hasNext()){
                    HLCAnnualDetVO detailVO = (HLCAnnualDetVO) itr.next();
                    
                    String badge_name =  detailVO.getBadge_name();
                    String days_applied = detailVO.getDays_applied();
                    String meetId =  detailVO.getMeetId();
                    String pay_id=  detailVO.getPayment_id();
                    String registrat_id =  detailVO.getRegistrat_id();
                    String remarks = detailVO.getRemarks();
                    String request_status = detailVO.getRequest_status();
                    float total_amount = detailVO.getTotal_amount();
                    
                    session.setAttribute("amount",String.valueOf(total_amount));
                    //session.setAttribute("payId",pay_id);
                    session.setAttribute("bdgeNme",badge_name);
                    session.setAttribute("meetId",meetId);
                }
                
                Debug.print("Session values set "+ session.getAttribute("amount"));
                Debug.print("Session values set "+ session.getAttribute("payId"));
                Debug.print("Session values set "+ session.getAttribute("bdgeNme"));
                Debug.print("Session values set "+ session.getAttribute("meetId"));
                return new ModelAndView("frmAnnMeetFailPay");
                }
                else{
                	return new ModelAndView("login");
                }
            }      
            
        // Payment Process
            
            if(execute.trim().equalsIgnoreCase("payment")){
                
                FormHorseUpgrade fbean=new FormHorseUpgrade();
                System.out.println("FormHorseUpgrade ="+ fbean);
                
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                HLCPaymentVO objPayment = new HLCPaymentVO();
                HLCPaymentDetailVO payDetVO = new HLCPaymentDetailVO();
                HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                 HLCAccTransactionVO regiVO = new HLCAccTransactionVO();
                String sesUserId =(String)session.getAttribute("userId");
                String payment_id = (String) session.getAttribute("paymentId");
                
                Debug.print("Session values set "+ session.getAttribute("amount"));
                Debug.print("Session values set "+ session.getAttribute("payId"));
                Debug.print("Session values set "+ session.getAttribute("bdgeNme"));
                Debug.print("Session values set "+ session.getAttribute("meetId"));                
                // Get client's IP address
                String addr = request.getRemoteAddr(); // 123.123.123.123
                Debug.print("Port Value:" + addr);
                
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
                float checkAmount = 0;
                String  r11 = fbean.getR11();
                String tempAmount = "";
                
                System.out.print("Check Status :" + r11);
                
                if(r11.equals("card")){
                    if(fbean.getCcNumber()==null || fbean.getCcNumber().equals("")){
                        CcNumber = "0";
                    } else{
                        CcNumber = fbean.getCcNumber();
                    }
                    if(fbean.getCcName()==null || fbean.getCcName().equals("")){
                        ccName ="";
                    } else {
                        ccName=fbean.getCcName();
                    }
                    if(!(fbean.getCcType().equals("")) && fbean.getCcType()!=null){
                        ccType = fbean.getCcType();
                    }
                    if(fbean.getCcExpMonth()==null || fbean.getCcExpMonth().equals("")){
                        CcExpMonth =0;
                    } else {
                        CcExpMonth=Integer.parseInt(fbean.getCcExpMonth());
                    }
                    if(fbean.getCcExpYear()==null || fbean.getCcExpYear().equals("")){
                        CcExpYear =0;
                    } else{
                        CcExpYear = Integer.parseInt(fbean.getCcExpYear());
                    }
                    if(fbean.getCcCvvid()==null || fbean.getCcCvvid().equals("")){
                        CcCvvid =0;
                    } else{
                        CcCvvid = Integer.parseInt(fbean.getCcCvvid());
                    }
                    check_date= null;
                    objPayment.setPaymentStatus("Card");
                }
                
                if(r11.equals("check")){
                    if(fbean.getCheckNumber()==null || fbean.getCheckNumber().equals("")){
                        checkNumber="0";
                    } else{
                        checkNumber= fbean.getCheckNumber();
                    }
                    if(fbean.getCheckDate().equals("")){
                        check_date= null;
                    } else{
                        try {
							check_date =(Date)sdf.parse(fbean.getCheckDate());
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                    }
                    tempAmount = fbean.getTotalAmount();
                    Debug.print("Inside check "+tempAmount);
                    objPayment.setPaymentStatus("Check");
                    
                }
                tempAmount = request.getParameter("tempAmount");
                System.out.println("tempAmount1" + tempAmount);
                if(tempAmount==null || tempAmount==""){
                    totalAmount=0;
                } else{
                    totalAmount = Double.parseDouble(tempAmount);
                }
                
                
                objPayment1.setUserId(sesUserId);
                objPayment1.setCcName(ccName);
                objPayment1.setCcType(ccType);
                objPayment1.setCcNumber(CcNumber);
                objPayment1.setCcExpMonth(CcExpMonth);
                objPayment1.setCcExpYear(CcExpYear);
                objPayment1.setCcCvvid(CcCvvid);
                objPayment1.setPaymentId(payment_id);
                 objPayment1.setAmount(totalAmount);
                System.out.println("tempAmount1" + tempAmount);
                bankname =fbean.getBankName();
                nameoncheck =fbean.getNameCheck();
                 
                payDetVO.setUserId(sesUserId);
                payDetVO.setCcName(ccName);
                payDetVO.setCcType(ccType);
                payDetVO.setCcNumber(CcNumber);
                payDetVO.setCcExpMonth(CcExpMonth);
                payDetVO.setCcExpYear(CcExpYear);
                payDetVO.setCcCvvid(CcCvvid);
                payDetVO.setBankName(bankname);
                payDetVO.setCheckName(nameoncheck);
                payDetVO.setCheckDate(check_date);
                payDetVO.setCheckNumber(checkNumber);
                //objPayment.getCheckAmount();
                payDetVO.setAmount(totalAmount);
                payDetVO.setPaymentDate(new java.util.Date());
                payDetVO.setPaymentId(payment_id);
                //IP Address
                payDetVO.setIpAddress(addr);
                boolean updBal = false;
                String tempCheckAmount = request.getParameter("chkBalAmt");
                if(tempCheckAmount!=null && tempCheckAmount.trim().length()!=0){
                    checkAmount = Float.parseFloat(tempCheckAmount);
                } else{
                    checkAmount=0;
                }
                
                 if(checkAmount!=0){
     boolean update_refund = educationBean.updatePendingAmount(sesUserId,payment_id,checkAmount);
                }
                
                if(r11.equalsIgnoreCase("check")){
                    Debug.print("Check Payment Invoked");
                    boolean update_stat = kaveryStatfulBean.updatePaymentStatus(objPayment);
                    if(update_stat == true){
                        session.setAttribute("paymode","CheckPay");
                        return new ModelAndView("frmAnnualPayCnf");
                    }
                    else{
                        session.setAttribute("paymode","CardPay");                        
                        return new ModelAndView("index");
                    }
                }
                else{
                    Debug.print("Card Payment Invoked");
                    Debug.print("Sucessfully Payment objPaymentList:" + objPayment.toString());
                    String emailId = (String)session.getAttribute("emailId");
                    //=======================================
                    request.setAttribute("email",emailId);
                    request.setAttribute("cardNo",String.valueOf(CcNumber));
                    String expMon = String.valueOf(CcExpMonth);
                    String expYear = String.valueOf(CcExpYear);
                    if(expMon.trim().length()==1) {
                         expMon = "0" + expMon;
                    }
                   // if(expYear.trim().length()==1) {
                    Debug.print("expYear:" + expYear);
                    //expYear = expYear.substring(2);
                    //
                    Debug.print("expMon:" + expMon);
                    Debug.print("expYear:" + expYear);

                    String expDate = expMon + expYear;
                    request.setAttribute("expDate",expDate);
                    request.setAttribute("amount",String.valueOf(totalAmount));
                    request.setAttribute("chkDigit",String.valueOf(CcCvvid));                    
                    
                    session.setAttribute("objPay",objPayment);
                    String url ="";
                    StringBuffer reqURL = request.getRequestURL();
                    int lastIndex = reqURL.lastIndexOf("/") ;
                    if(lastIndex!=-1){
                        url = reqURL.substring(0,lastIndex+1);
                    }                    
                    String tmpNova ="AnnualCardPaymnt.html";
                    String nova = url + tmpNova;
                    Debug.print("Nova Value: "+nova); 
                      request.setAttribute("nova",nova);
             String inVId = request.getParameter("inVoiceId");
             request.setAttribute("AMT",String.valueOf(totalAmount));
             request.setAttribute("PAYMENTACTION", "Authorization");
             request.setAttribute("CREDITCARDTYPE",request.getParameter("ccType"));
             request.setAttribute("ACCT",String.valueOf(payDetVO.getCcNumber()));
             request.setAttribute("EXPDATE",expDate);
             request.setAttribute("CVVNo",(String)request.getParameter("ccCvvid"));
             request.setAttribute("IPADDRESS", addr);
             request.setAttribute("FIRSTNAME", request.getParameter("ccName"));
             request.setAttribute("STREET", "1 Main St");
             request.setAttribute("CITY", "San Jose");
             request.setAttribute("STATE", "CA");
             request.setAttribute("ZIP", "95131");
             request.setAttribute("COUNTRYCODE", "US");
             request.setAttribute("EMAIL",emailId);
             request.setAttribute("intVId","1");
             session.setAttribute("objPayment",objPayment1);
             System.out.println("invoiceid in the retry servlet..........."+inVId);
             session.setAttribute("sessionInvoiceId","1");
             String purposeOfPayment=(String)session.getAttribute("purpose");
            if(purposeOfPayment.equalsIgnoreCase("purchasingTickets"))
             {
             request.setAttribute("purpose","purchasingTickets");  
             }else{
               request.setAttribute("purpose",purposeOfPayment);  
             }
                   session.setAttribute("objPaymentVO",payDetVO);
                   session.setAttribute("objPay",objPayment);
                  //  session.setAttribute("pendAmount",pendAmount);
                   // Debug.print("pendAmount in AnnualRegiPayment: "+pendAmount); 
                    //regiVO=(AccTransactionVO)session.getAttribute("activityValue");
                   // regiVO.setPayment_mode(ccType1);
                  //  session.setAttribute("activityValue", regiVO); 
                    String sessionInvoiceId = "1";
                       session.setAttribute("sessionInvoiceId",sessionInvoiceId);
                       return new ModelAndView("testpaypal");                    
                }
            }
        }
        return null;
    }
    
    
}
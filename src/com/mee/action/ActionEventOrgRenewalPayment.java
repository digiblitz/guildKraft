/*
 * ActionEventOrgRenewalPayment.java
 *
 * Created on October 13, 2006, 1:45 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mee.action;

/**
 *
 * @author suresh
 */
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.mee.actionform.FormEventOrgRenewal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.naming.InitialContext;
import javax.naming.Context;
import com.hlcmro.util.*;
import com.hlcmro.display.HLCVaigaiStatelessBean;
import com.hlcmro.org.*;

import java.util.Properties;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import com.hlccommon.util.Debug;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCPaymentResultVO;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmro.renewal.*;
import com.hlcpayment.HLCPaymentSessionBean;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;


	public class ActionEventOrgRenewalPayment implements Controller {

		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        try {
        	 HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();
            
        	 HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
            
            HttpSession session = request.getSession(false);
            
            HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();

            HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
            HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
            HLCVaigaiStatelessBean vaigaiBean1=new HLCVaigaiStatelessBean();         
                   HLCAccTxnTypeDetailVO transTxnDet = new HLCAccTxnTypeDetailVO();
            
            FormEventOrgRenewal endForm = new FormEventOrgRenewal();
            HLCRenewalOrganizerDetails objRenewalDet = new HLCRenewalOrganizerDetails();
            HLCPaymentDetails objPayDet = new HLCPaymentDetails();

            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

            Debug.print("Return from Paypal");
            HLCAccTransactionVO PhaccTxnVO = new HLCAccTransactionVO();
                objRenewalDet = (HLCRenewalOrganizerDetails) session.getAttribute("objRenewalDet");
                //objPayDet = (PaymentDetails) session.getAttribute("objPaymentList");
                //String eveTitle= String.valueOf(objRenewalDet.getCompetitionName());

                Debug.print("Sucessfully return from NOVA UserId:" + (String)session.getAttribute("userId"));
                Debug.print("Sucessfully return from Nova objActDet:Size" + objRenewalDet.getCompetitionName());
                //Debug.print("Sucessfully return from Nova objPayDet:" + objPayDet);

  
            HLCPaymentResultVO payRes = (HLCPaymentResultVO) session.getAttribute("payRes");
            HLCPaymentDetailVO objPaypal = (HLCPaymentDetailVO) session.getAttribute("objPayDet");
            String[] results = (String[]) session.getAttribute("results");
            String statusId3 = (String) session.getAttribute("statusId3");
            String statusId = (String) session.getAttribute("statusId");
            System.out.println("payRes in card servlet: " + payRes);
            System.out.println("results in card servlet: " + results);
            System.out.println("statusId3 in card servlet: " + statusId3);
            //System.out.println("statusId in card servlet: " + statusId);
              if (statusId3 == null || statusId3.equalsIgnoreCase("Failure")) {
                String errorCd = payRes.getErrorCd();
                String lngMsg = payRes.getLngMsg();

                String emailId = (String)session.getAttribute("emailId");
                    String toMailIds[] = {"payments@useventing.com"};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dashboard@useventing.com");
                email.setSubject("Event Registration Decline");
                //System.out.println("toMailIds: " + toMailIds);
                String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                        " <tr>" +
                        " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                        " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                        "<tr>" +
                        "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"USEA Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                        " </tr>" +
                        "  <tr>" +
                        "<td valign=\"top\">" +
                        "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                        "<tr>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                        "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                        "</tr>" +
                        "<tr>" +
                        "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" bgcolor=\"#FBF2F2\">" +
                        "<p>Payment has been declined and the details are as follows:<p>" +
                        "<span class=\"boldTxt\">Declined Details:</span>.</p>" +
                        "TIMESTAMP:" + payRes.getTmStmp() + " <br/>" +
                        "L_ERRORCODE0:" + payRes.getErrorCd() + "<br/>" +
                        "L_LONGMESSAGE0:" + payRes.getLngMsg() + "<br/>" +
                        "AMT:" + payRes.getAmount() + "<br/>" +
                       // "AVSCODE: " + payRes.getSslAvsResponse() + "<br/>" +
                       // "CVV2MATCH:" + payRes.getSslCvv2Response() + "<br/>" +
                        "Corrective action:" + payRes.getFinalCorecAction() + "<br/></p>" +
                        "<span class=\"boldRedTxt\">USEA Team</span></td>" +
                        "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>" +
                        "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>" +
                        "</tr>" +
                        " </table>" +
                        "</td></tr>" +
                        "+<tr>" +
                        "<td valign=\"top\" style=\"padding:10px;\">" +
                        "</td>" +
                        "</tr>" +
                        " <tr>" +
                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                        "</tr>" +
                        "</table>";

                email.setBody(content);
                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                Debug.print("Email sent sucessfully :" + emailFlag);

                HLCPaymentDetailVO objPay = new HLCPaymentDetailVO();
                
                objPay.setAmount(objPayDet.getAmount());
                
                session.setAttribute("objPayDet",objPay);
                
                String amount1 = (String) session.getAttribute("amount");
                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);
                request.setAttribute("price",amount1);
                request.setAttribute("eventId",(String)session.getAttribute("EventID"));
                request.setAttribute("eveTitle",(String)session.getAttribute("EventTitle"));
                return new ModelAndView("frmMeeRenewalSuccess");
            }

            String sslResult = objPaypal.getSslResult();
                String sslResultMessage = objPaypal.getSslResultMessage();
                String sslTxnId = objPaypal.getSslTxnId();
                String sslApprovalCode = request.getParameter("ssl_approval_code");
                String sslCvv2Response = objPaypal.getSslCvv2Response();
                String sslAvsResponse = objPaypal.getSslAvsResponse();
                String sslTransactionType = objPaypal.getSslTransactionType();
                String sslInvoiceNo = objPaypal.getSslInvoiceNo();
                String sslEmail = objPaypal.getSslEmail();

            Debug.print("Sucessfully return from Nova sslResult:" + sslResult);
            Debug.print("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
            Debug.print("Sucessfully return from Nova sslTxnId:" + sslTxnId);
            Debug.print("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
            Debug.print("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
            Debug.print("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
            Debug.print("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
            Debug.print("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
            Debug.print("Sucessfully return from Nova sslEmail:" + sslEmail);    
            
            Debug.print("Sucessfully Return objPaymentList:" + objPayDet.toString());
            Debug.print("paymentId in Paypal servlet :"+objPayDet.getPaymentId());

            if(sslResult.equals("0")){
                    if(objRenewalDet!=null && objPayDet!=null){
                        objPayDet.setSslResult(sslResult);
                        objPayDet.setSslResultMessage(sslResultMessage);
                        objPayDet.setSslTxnId(sslTxnId);
                        objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(sslEmail);
                        Debug.print("Activity Organizer  Sucessfully Getting Started:");
                        if(sslResult.equals("0")){
                          objRenewalDet.setRequestStat("Approved");  
                        }else{
                          objRenewalDet.setRequestStat("Pending");  
                        }
                        
                        //remote.addRenewal(objRenewalDet,objPayDet);
                        //String paymentId=null;
                        
                     String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");
                        boolean idExist = humanMemb.isInvoiceIdExist(sessionInvoiceId);
                        Debug.print("idExist value is:" + idExist);
                          if (!idExist) {
                        boolean insertResult=false;
                        boolean payResult=paymentBean.createPayment(objPaypal);
                        Debug.print("paymentId in servlet"+objPaypal.getPaymentId());
                       
                        if(payResult==true && objPaypal.getPaymentId()!=null && objPaypal.getPaymentId().trim().length()!=0){
                        insertResult=vaigaiBean.insertEndorseRenDetails(objRenewalDet,objPaypal.getPaymentId());    
                        }
                        Debug.print("Sucessfully Inserted................"+insertResult);
                          }
                  
                   String transacTypId1 = (String)session.getAttribute("transacTypId1");
                   String transacTypId2 = (String)session.getAttribute("transacTypId2");
                   String transacTypId3 = (String)session.getAttribute("transacTypId3");
                   
                   String evePrice1 = (String)session.getAttribute("evePrice1");
                   String evePrice2 = (String)session.getAttribute("evePrice2");
                   String evePrice3 = (String)session.getAttribute("evePrice3");
                   
                  if(transacTypId1!=null){                                                             
                 transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId1);
                 //transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId2);                         
                //transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId3);
              
               String accNo = transTxnDet.getAccount_no();
                String accClassname = transTxnDet.getClass_name();
                String accItemNo = transTxnDet.getItem_no();
                String accAccNo = transTxnDet.getSub_account_no();
                String accTranName = transTxnDet.getTransaction_name();
                String accTyped = transTxnDet.getTransaction_type();
                String accTypeId = transTxnDet.getTransaction_type_id();
                
                Debug.print("Inside Phone Account No "+accNo);
                Debug.print("Inside Phone Family Class Name "+accClassname);
                Debug.print("Inside Phone Item No "+accItemNo);
                Debug.print("Inside Phone Sub-Account No "+accAccNo);
                Debug.print("Inside Phone Transaction Name "+accTranName);
                Debug.print("Inside Phone Transaction Type "+accTyped);
                Debug.print("Inside Phone Transaction Type Id "+accTypeId);
                               
               
                    String cardselect = (String)session.getAttribute("cardselect");                  
                    PhaccTxnVO.setPayment_mode(cardselect);
                    //PhaccTxnVO.setActive_status(false);
                
                PhaccTxnVO.setSub_account_no(accAccNo);
                PhaccTxnVO.setPayment_id(objPaypal.getPaymentId());
                PhaccTxnVO.setAccount_type("Events Income");
                PhaccTxnVO.setClass_Typ(accClassname);
                
                PhaccTxnVO.setAccount_no(accNo);
                PhaccTxnVO.setItem_no(accItemNo);               
                PhaccTxnVO.setDescription(accTranName);
                PhaccTxnVO.setAmount(Float.parseFloat(evePrice1));
                
                if(sslResult.equals("0")){
                  if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(true);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO); 
                        Debug.print("mahanadhiBean.insertAccountTxnDetails(phoneVO) for Phone Service :"+status);
                        boolean Update_Status = mahanadhiBean.updateRecouncilActiveStatusAccTxnDetails(objPaypal.getPaymentId());           
                        Debug.print("mahanadhiBean.insertAccountTxnDetails(phoneVO) for Phone Service :"+Update_Status);
                        }           
                }
                /*
                else if(sslResult.equals("1")){
                     if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(false);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO);                                  
                        }    
                }  */             
                  } 
                  if(transacTypId2!=null){
                 
                      transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId2);                                        
                //transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId3);
              
               String accNo = transTxnDet.getAccount_no();
                String accClassname = transTxnDet.getClass_name();
                String accItemNo = transTxnDet.getItem_no();
                String accAccNo = transTxnDet.getSub_account_no();
                String accTranName = transTxnDet.getTransaction_name();
                String accTyped = transTxnDet.getTransaction_type();
                String accTypeId = transTxnDet.getTransaction_type_id();
                
                Debug.print("Inside Phone Account No "+accNo);
                Debug.print("Inside Phone Family Class Name "+accClassname);
                Debug.print("Inside Phone Item No "+accItemNo);
                Debug.print("Inside Phone Sub-Account No "+accAccNo);
                Debug.print("Inside Phone Transaction Name "+accTranName);
                Debug.print("Inside Phone Transaction Type "+accTyped);
                Debug.print("Inside Phone Transaction Type Id "+accTypeId);
                               
               
                    String cardselect = (String)session.getAttribute("cardselect");                 
                    PhaccTxnVO.setPayment_mode(cardselect);
                    //PhaccTxnVO.setActive_status(false);
                
                PhaccTxnVO.setSub_account_no(accAccNo);
                PhaccTxnVO.setPayment_id(objPaypal.getPaymentId());
                PhaccTxnVO.setAccount_type("Events Income");
                PhaccTxnVO.setClass_Typ(accClassname);
                
                PhaccTxnVO.setAccount_no(accNo);
                PhaccTxnVO.setItem_no(accItemNo);               
                PhaccTxnVO.setDescription(accTranName);
                PhaccTxnVO.setAmount(Float.parseFloat(evePrice2));
                
                if(sslResult.equals("0")){
                  if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(true);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO);            
                        boolean Update_Status = mahanadhiBean.updateRecouncilActiveStatusAccTxnDetails(objPaypal.getPaymentId());           
                        Debug.print("mahanadhiBean.insertAccountTxnDetails(phoneVO) for Phone Service :"+status);
                        }           
                }
                /*else if(sslResult.equals("1")){
                     if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(false);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO);                                  
                        }    
                }  */  
       
                  }
               if(transacTypId3!=null){
                 
                      transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId3);                                        
                //transTxnDet = mahanadhiBean.getAccTransacTypDetsForEveOrgEndorsed(transacTypId3);
              
               String accNo = transTxnDet.getAccount_no();
                String accClassname = transTxnDet.getClass_name();
                String accItemNo = transTxnDet.getItem_no();
                String accAccNo = transTxnDet.getSub_account_no();
                String accTranName = transTxnDet.getTransaction_name();
                String accTyped = transTxnDet.getTransaction_type();
                String accTypeId = transTxnDet.getTransaction_type_id();
                
                Debug.print("Inside Phone Account No "+accNo);
                Debug.print("Inside Phone Family Class Name "+accClassname);
                Debug.print("Inside Phone Item No "+accItemNo);
                Debug.print("Inside Phone Sub-Account No "+accAccNo);
                Debug.print("Inside Phone Transaction Name "+accTranName);
                Debug.print("Inside Phone Transaction Type "+accTyped);
                Debug.print("Inside Phone Transaction Type Id "+accTypeId);
                               
               
                    String cardselect = (String)session.getAttribute("cardselect");                 
                    PhaccTxnVO.setPayment_mode(cardselect);
                    //PhaccTxnVO.setActive_status(false);
                
                PhaccTxnVO.setSub_account_no(accAccNo);
                PhaccTxnVO.setPayment_id(objPaypal.getPaymentId());
                PhaccTxnVO.setAccount_type("Events Income");
                PhaccTxnVO.setClass_Typ(accClassname);
                
                PhaccTxnVO.setAccount_no(accNo);
                PhaccTxnVO.setItem_no(accItemNo);               
                PhaccTxnVO.setDescription(accTranName);
                PhaccTxnVO.setAmount(Float.parseFloat(evePrice3));
                
                if(sslResult.equals("0")){
                  if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(true);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO);            
                        boolean Update_Status = mahanadhiBean.updateRecouncilActiveStatusAccTxnDetails(objPaypal.getPaymentId());           
                        Debug.print("mahanadhiBean.insertAccountTxnDetails(phoneVO) for Phone Service :"+status);
                        }           
                }
                /*else if(sslResult.equals("1")){
                     if(PhaccTxnVO!=null){
                        PhaccTxnVO.setActive_status(false);
                        boolean status = mahanadhiBean.insertAccountTxnDetails(PhaccTxnVO);                                  
                        }    
                }    */
       
                  }    
 
                        //for updating the paymentid in history table
                    String issueId="";
                    String compYear="";
                    int year=0;
                    
                    ArrayList seasonDetails = new ArrayList();
                    seasonDetails=vaigaiBean.getIssueIdBasedOnEventId(String.valueOf(objRenewalDet.getEventId()));
                    if(seasonDetails!=null && seasonDetails.size()!=0){
                        Iterator it=seasonDetails.iterator();
                        while(it.hasNext()){
                        String[] tempDet= (String[])it.next();
                        issueId=tempDet[0];
                        compYear=tempDet[1];
                        }
                    }
                    if(compYear!=null && compYear.trim().length()!=0){
                    year=Integer.parseInt(compYear);    
                    }
                    boolean updatePaymentId=false;
                    if(objPaypal.getPaymentId()!=null && objPaypal.getPaymentId().trim().length()!=0){
                    updatePaymentId=vaigaiBean.updatePaymentIdInHist(String.valueOf(objRenewalDet.getEventId()),year,objPaypal.getPaymentId());
                    }
                    Debug.print("Updating paymentId in History Table :"+updatePaymentId);
                    //For Email
                        String toMailId = (String)session.getAttribute("emailId");
                        String toMailIds[] = {toMailId};
                        EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@usea.com");
                        email.setSubject("Event Registration Application confirmation.");
            
                        String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                        " <tr>" +
                        " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                        " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                        "<tr>" +
                        "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"USEA Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
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
                        "<p>Dear Organizer,"+

                        "You have successfully sent an Event Registration application to United States Eventing Association for all  "+
                        "the events and competitions that are to be held! Your application would be verified and processed within"+
                        "24 hours."+
                        "Thank you for using this service.<p>"+
                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                        "Thank You <br />"+
                        "------------------ <br />"+
                        "<span class=\"boldRedTxt\">USEA Team</span></td>"+
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
                        "<p>The easiest way to access your day to day USEA activities online or offline where ever you are and when ever you want."+
                        "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                        "<ul>"+
                        "<li>Unlimited shopping online.</li>"+
                        "<li>Place advertisements online and/or on-site.</li>"+
                        "<li>Sponsor competitions held by USEA.</li>"+
                        "</ul>"+


                        "Also, REGISTER NOW! and become a member of USEA to access and 	enjoy the following privileges as per your Membership Type and as "+
                        "per your �Role� assigned:"+

                        "<ul>"+
                        "<li>Compete in Equestrian Events held by USEA.</li>"+
                        "<li>Take part in other events like; Annual Meetings, Educational events,"+
                        "Activity Meetings held by USEA etc.</li>"+
                        "<li>Send Messages to other members.</li>"+
                        "<li>Create your own Distribution Lists.</li>"+
                        "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                        " <li>Unlimited Shopping online.</li>"+
                        " <li>Place advertisements online and/or on-site.</li>"+
                        " <li>Sponsor competitions held by USEA.</li>"+
                        "</ul>"+

                        "and much more..."+
                        "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                        "</tr>"+
                        " <tr>"+
                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                        "</tr>"+
                        "</table>";

                        email.setBody(content);
                        EmailEngine emailEngine = new EmailEngine();
                        boolean emailFlag = emailEngine.sendMimeEmail(email);
                        Debug.print("Email sent sucessfully :"+emailFlag);
                        session.setAttribute("objRenewalDet",null);
                        session.setAttribute("objPaymentList",null);
                        session.setAttribute("transacTypId1",null);
                        session.setAttribute("transacTypId2",null);
                        session.setAttribute("transacTypId3",null);
                        session.setAttribute("evePrice1",null);
                        session.setAttribute("evePrice2",null);
                        session.setAttribute("evePrice3",null);
                        request.setAttribute("eventId",String.valueOf(objRenewalDet.getEventId()));
                                           
                        request.setAttribute("eveTitle",String.valueOf(objRenewalDet.getCompetitionName()));
                        request.setAttribute("eventId",String.valueOf(objRenewalDet.getEventId()));
                        request.setAttribute("paymentMode","card"); 
                        request.setAttribute("amount",String.valueOf(objPaypal.getAmount()));
                        
                        

                        System.out.println("Inside Organizer Reg form Action..........");
                        
                        Vector getAllMapRuleSubRule= new Vector();
                        
                        Vector distanceSpeedVect = new Vector();
                        Vector dressageHorseTrialsVect = new Vector();
                        ArrayList arenaSizeVect = new ArrayList();
                        ArrayList jdDet=new ArrayList();
                        
                      
                        getAllMapRuleSubRule=vaigaiBean1.getAllMapRuleSubRule();
                        jdDet=vaigaiBean1.selectJudgesDetails();
                        System.out.println("jdDet size in servlet :"+jdDet.size());
                        
                        dressageHorseTrialsVect = vaigaiBean1.selectDressageHorseTrials();
                        arenaSizeVect = vaigaiBean1.getAreaPriceMaster();//selectArenaSize();
                        
                        //request.setAttribute("allTypesVect", allTypesVect);
                        request.setAttribute("distanceSpeedVect",distanceSpeedVect);
                        request.setAttribute("getAllMapRuleSubRule",getAllMapRuleSubRule);
                        request.setAttribute("dressageHorseTrialsVect",dressageHorseTrialsVect);
                        request.setAttribute("arenaSizeVect",arenaSizeVect);
                        request.setAttribute("jdDet",jdDet);
                        
                    //for event title, event type and event level.
                    String eventId1="";
                    eventId1 = (String)request.getAttribute("eventId");//"10026";
                    Debug.print("eventId from getAttribute:"+eventId1);
                    String paramValue=request.getParameter("fromList");
                    Debug.print("paramValue :"+paramValue);
                    if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                    eventId1=request.getParameter("eventId");    
                    }
                    Debug.print("eventId from getParameter:"+eventId1);
                    String type = request.getParameter("type");
                    HLCEventRequestVO eventReqVO = new HLCEventRequestVO();
                    ArrayList areaDetails = new ArrayList();
                    if(eventId1!= null && eventId1.trim().length()!=0){
                        eventReqVO = vaigaiBean.getEventRequestDetails(eventId1);
                        areaDetails = vaigaiBean.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                    }
                    Debug.print("EventReqVO returned:"+eventReqVO.toString());
                    ArrayList stateDetails = new ArrayList();
                    Vector allTypesVect = new Vector();
                    stateDetails = vaigaiBean.getAllStates();
                    allTypesVect = vaigaiBean1.getAllMapTyLe();
                    Vector eventTypeDetails = new Vector();
                    HashMap hm = new HashMap();
                    HashMap eventTypeMap = new HashMap();
                    ArrayList subLevel = new ArrayList();
                    if(allTypesVect!=null ){
                        Enumeration e = allTypesVect.elements();
                        while(e.hasMoreElements()){
                            String[] typeDetails = (String[])e.nextElement();
                            String mapId = typeDetails[0];
                            String typeId = typeDetails[1];
                            String levelId = typeDetails[2];
                            String typeName = typeDetails[3];
                            String levelCode = typeDetails[4];
                            String levelName = typeDetails[5];
                            if(hm.containsKey(typeId)){
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }else{
                                subLevel = new ArrayList();
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }
                            hm.put(typeId,typeName);
                        }
                        Set set = hm.keySet();
                        Iterator itr = set.iterator();
                        while(itr.hasNext()){
                            String keyId = (String)itr.next();
                            String valueName = (String)hm.get(keyId);
                            String[] eventTypeDet = {keyId,valueName};
                            eventTypeDetails.add(eventTypeDet);
                        }
                    }
                    if(areaDetails!=null && areaDetails.size()!=0){
                    Iterator arItr = areaDetails.iterator();
                    if(arItr.hasNext()){
                        String[] areaDet = (String[])arItr.next();
                        request.setAttribute("AREA_DETAILS",areaDet);
                    }
                    }
                    request.setAttribute("EVENT_REQUEST_VO",eventReqVO);
                    request.setAttribute("stateDetails",stateDetails);
                    request.setAttribute("eventTypeDetails",eventTypeDetails);
                    request.setAttribute("eventTypeMap",eventTypeMap);
                    //==============================================================
                    
                    String payMode=(String)request.getAttribute("paymentMode");
                    String amt=(String)request.getAttribute("amount");
                    request.setAttribute("amount",amt);
                    request.setAttribute("paymentMode",payMode);
                    String noPay="";
                    noPay=(String)request.getAttribute("noPayment");
                    if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                    noPay=request.getParameter("noPayment");    
                    }
                    Debug.print("noPay from getAttribute:"+noPay);
                    Debug.print("noPay from getParameter:"+noPay);
                    request.setAttribute("noPayment",noPay);
                    String eventID=request.getParameter("eventId");
                    Debug.print("eventID :"+eventID);
                    String secId=vaigaiBean.isOrgMainEventRegExist(eventID);
                    Debug.print("secId :"+secId);
                    String memberId=(String)session.getAttribute("memberId");
                        if(memberId != null && secId==null || secId=="") {
                        	return new ModelAndView("frmEventOrgUpdate");
                        } else if(memberId == null){
                        	return new ModelAndView("event-Org-Reg-Eligibility");
                        } else if(secId!= null){
                            request.setAttribute("alreadyExists","alreadyExists");
                            return new ModelAndView("event-Org-Reg-Eligibility");
                        
                        }  
                  
                     }
                }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}

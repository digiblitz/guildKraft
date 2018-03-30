/*
 * ActionAnnualPayment.java
 *
 * Created on November 6, 2006, 5:28 PM
 */

package com.mee.action;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.session.HLCMahanadhiSessionRemote;
import com.hlcaccounts.session.HLCMahanadhiSessionRemoteHome;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCPaymentResultVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcmee.ann.HLCAnnualMeetingStore;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.hlcmeeting.util.HLCAnnualUserVO;
import com.hlcpayment.HLCPaymentSessionBean;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.login.action.KlgLoginAction;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.text.*;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import java.text.SimpleDateFormat;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.util.email.EmailContent;
import com.util.email.EmailEngine;
/**
 *
 * @author punitha
 * @version
 */


	public class ActionAnnualPayment implements Controller {
		static Logger log = Logger.getLogger(ActionAnnualPayment.class.getName());
		
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
        try{
        	
        	 HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
        	 HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();
	    	
        	 HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
        	 HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
        	
        
         
            HttpSession session = request.getSession(true);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
           
           
            
            String sessUserId = (String)session.getAttribute("userId");
            
            log.info("Sucessfully return from NOVA UserId:" + sessUserId);
             HLCPaymentResultVO payRes = (HLCPaymentResultVO) session.getAttribute("payRes");
            HLCPaymentDetailVO objPaypal = (HLCPaymentDetailVO) session.getAttribute("objPayDet");
            HLCPaymentDetails objPayment = (HLCPaymentDetails) session.getAttribute("objPayment");
            String[] results = (String[]) session.getAttribute("results");
            String statusId3 = (String) session.getAttribute("statusId3");
            String statusId = (String) session.getAttribute("statusId");
            String payId=(String)session.getAttribute("payId");
            log.info("payRes in card servlet: " + payRes);
            log.info("results in card servlet: " + results);
            log.info("statusId3 in card servlet: " + statusId3);
            log.info("statusId in card servlet: " + statusId);
            log.info("payId in card servlet: " + payId);
            
       if (statusId3 == null || statusId3.equalsIgnoreCase("Failure") ) {
                String errorCd = payRes.getErrorCd();
                String lngMsg = payRes.getLngMsg();

                String emailId = (String)session.getAttribute("emailId");
                    String toMailIds[] = {emailId};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("info@digiblitz.com");
                email.setSubject("Horse Registration Decline");
                //log.info("toMailIds: " + toMailIds);
                String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                        " <tr>" +
                        " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                        " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                        "<tr>" +
                        "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
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
                        "<span class=\"boldRedTxt\">HLC Team</span></td>" +
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
                log.info("Email sent sucessfully :" + emailFlag);

                HLCPaymentDetailVO objPay = new HLCPaymentDetailVO();
                
                objPay.setAmount(objPayment.getAmount());
                log.info("Amount  in Failure  "+objPayment.getAmount());
                
                session.setAttribute("objPayDet",objPay);
               
                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);

                return new ModelAndView("frmMeeAnnualConvRegPaymentNovaDecline");
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
                String ppAuthorizationID = objPaypal.getPpAuthorizationID();
                String ppPaymentType = objPaypal.getPpPaymentType();
                double ppFeeAmt = objPaypal.getPpFeeAmt();
                double ppSettleAmt = objPaypal.getPpSettleAmt();
                double ppTaxAmt = objPaypal.getPpTaxAmt();
                String ppExchangeRate = objPaypal.getPpExchangeRate();
                String ppPaymentStatus = objPaypal.getPpPaymentStatus();
                String ppPendingReason = objPaypal.getPpPendingReason();
                String ppCorrelationID = objPaypal.getPpCorrelationID();
                String ppParentTransactionID = objPaypal.getPpParentTransactionID();
                String ppReasonCode = objPaypal.getPpReasonCode();
                String inVoiceId3 = objPaypal.getInVoiceID();

            log.info("Sucessfully return from Nova sslResult:" + sslResult);
            log.info("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
            log.info("Sucessfully return from Nova sslTxnId:" + sslTxnId);
            log.info("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
            log.info("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
            log.info("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
            log.info("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
            log.info("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
            log.info("Sucessfully return from Nova sslEmail:" + sslEmail);  
            
            String paymentId=(String)session.getAttribute("paymentId");
            String amount =(String)session.getAttribute("amount");
            
       
            
               if(sslResult.equals("0")){
                  HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
              if(objPaypal!=null){
                  log.info("Sucessfully Return objPaymentList:" + objPayment.getPaymentId());
                    objPayDet.setUserId(sessUserId);
                     objPayDet.setSslResult(sslResult);
                     objPayDet.setPaymentId(objPayment.getPaymentId());
                     log.info("Payment ID in servlet "+objPayDet.getPaymentId());
                        objPayDet.setSslResultMessage(sslResultMessage);
                        objPayDet.setSslTxnId(sslTxnId);
                        objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(sslEmail);
                       // objPayDet.setPaymentId(paymentId);
                        objPayDet.setPpAuthorizationID(ppAuthorizationID);
                        objPayDet.setPpPaymentType(ppPaymentType);
                        objPayDet.setPpFeeAmt(ppFeeAmt);
                        objPayDet.setPpSettleAmt(ppSettleAmt);
                        objPayDet.setPpTaxAmt(ppTaxAmt);
                        objPayDet.setPpExchangeRate(ppExchangeRate);
                        objPayDet.setPpPaymentStatus(ppPaymentStatus);
                        objPayDet.setPpPendingReason(ppPendingReason);
                        objPayDet.setPpCorrelationID(ppCorrelationID);
                        objPayDet.setPpParentTransactionID(ppParentTransactionID);
                        objPayDet.setPpReasonCode(ppReasonCode);
                        objPayDet.setInVoiceID(inVoiceId3);
                        objPayDet.setCcName(objPayment.getCcName());
                        objPayDet.setCcType(objPayment.getCcType());
                        objPayDet.setCcExpMonth(objPayment.getCcExpMonth());
                        objPayDet.setCcExpYear(objPayment.getCcExpYear());
                        objPayDet.setCcCvvid(objPayment.getCcCvvid());
                        objPayDet.setBankName(objPayment.getBankName());
                        objPayDet.setAmount(objPayment.getAmount());
                        objPayDet.setPaymentStatus(objPayment.getPaymentStatus());
                        objPayDet.setCcNumber(objPayment.getCcNumber());
                        objPayDet.setIpAddress(objPayment.getIpAddress());
                        objPayDet.setPaymentDate(objPayment.getPaymentDate());
                        objPayDet.setCheckDate(null);
                        objPayDet.setCheckNumber("0");
                        objPayDet.setCheckName(null);
                        objPayDet.setCheckAmount(0);
                        
                  HLCAnnualMeetingStore regList = (HLCAnnualMeetingStore)session.getAttribute("regList"); 
                  String ticket = (String)session.getAttribute("ticket"); 
                  String totAmount = (String)session.getAttribute("totAmount");
                  String addTktRegistrarName = (String)session.getAttribute("addTktRegistrarName");
                  ArrayList addTktList = (ArrayList)session.getAttribute("addTktList");
                  String checkAmount1 = (String)session.getAttribute("checkAmount1");
                 float checkAmount = 0;
                   ArrayList priceList =new ArrayList();
         if(checkAmount1==null || checkAmount1==""){
                        checkAmount=0; 
               }
                        else{
                        checkAmount = Float.parseFloat(checkAmount1);
                        }   
                   boolean result =false;
                   String meetingId=null;
                   String res[]={sessUserId,ticket,String.valueOf(totAmount),"Pending"};
                    //String paymentId1 = vaigaiBean.getNextId();
                      String paymentId1=objPayDet.getPaymentId();
                 if(regList!=null){
                Enumeration e = regList.getEnumeration();
                //String[] priceDet ={};
                
                 log.info("paymentId1 in check:" + paymentId1);
                String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");
                        boolean idExist = humanMemb.isInvoiceIdExist(sessionInvoiceId);
                        log.info("idExist value is:" + idExist);
                      
                          if (!idExist) {  
                 meetingId = vaigaiBean.registerAnnualMeeting(res, e, paymentId1, addTktRegistrarName, addTktList);
                 
                  String registraterId=vaigaiBean.getAnnualRegistraterId(meetingId);
                  priceList= vaigaiBean.getAnnualPriceDetailsByAnnualId(registraterId);
                 
                 objPaypal.setPaymentId(paymentId1);
                 log.info("Activity Organizer INserted Sucessfully for credit card:"+result);

                 boolean result1  = paymentBean.createPayment(objPayDet);
                 log.info("Result  Payment Bean" + result1);
                 log.info("succsssullll Created for credit card........::");
                          }
                 session.setAttribute("paymentId",paymentId1);
                 session.setAttribute("amount",String.valueOf(totAmount));
                    //// Horse Member type Entry             /*   
                              double otherAmount = 0.0;
                              String otherStrAmt = "";
                              double tempregAmount = 0.0;
                              double tempOtherAmount = 0.0;
                              
                     float tempTotAmt = Float.parseFloat(totAmount);
                     float pendingAmount=0;
                     if(checkAmount!=0){
                     pendingAmount = tempTotAmt - checkAmount;
                     }else{
                         pendingAmount=0;
                     }
                    log.info(" pendingAmount after calculation in bean :"+pendingAmount);
                    
                   session.setAttribute("pendAmt",String.valueOf(pendingAmount));
                              
                              String specTransId = (String) session.getAttribute("specTransId");
                              log.info("Specification Trans Id is ::::::::::::::::"+specTransId);
                                if(specTransId!=null || specTransId.trim().length()!=0){


                                    HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(specTransId);
                                    HLCAccTransactionVO regiVO = new HLCAccTransactionVO();

                                    String accNo =  accTxnDet.getAccount_no();
                                    String className = accTxnDet.getClass_name();
                                    String itemNo = accTxnDet.getItem_no();
                                    String subAccNo = accTxnDet.getSub_account_no();
                                    String transName = accTxnDet.getTransaction_name();
                                    String transType = accTxnDet.getTransaction_type();

                                    String cardselect = (String)session.getAttribute("cardselect");
                                    regiVO.setPayment_mode(cardselect);
                                    regiVO.setActive_status(false);

                                    double regAmount = 0.0;
                                    String regStrAmt = "";

                                    log.info("Before Renumeration");
                                    Enumeration new_Enum = regList.getEnumeration();
                                    log.info("After Renumeration");
                                    while(new_Enum.hasMoreElements()){
                                            log.info("Inisde While Loop");
                                            HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO) new_Enum.nextElement();
                                            
                                            regAmount = tempObjAnnualUser.getRegAmount();
                                            otherAmount = tempObjAnnualUser.getOtherActAmount();
                                            
                                            tempregAmount = tempregAmount + regAmount;
                                            tempOtherAmount = tempOtherAmount + otherAmount;
                                                    
                                            log.info(" tempregAmount "+tempregAmount);
                                            log.info(" tempOtherAmount "+tempOtherAmount);
                                    }
                                    
                                    regStrAmt = Double.toString(tempregAmount);
                                    otherStrAmt = Double.toString(tempOtherAmount);
                                    
                                    regiVO.setAmount(Float.parseFloat(regStrAmt));
                                    regiVO.setDescription(transName);
                                    regiVO.setClass_Typ(className);
                                    regiVO.setAccount_no(accNo);
                                    regiVO.setAccount_type("Income");

                                    regiVO.setItem_no(itemNo);
                                    regiVO.setSub_account_no(subAccNo);
                                    regiVO.setPayment_id(paymentId1);
                                    
                                    log.info("Setting the attribute regiVO");
                                    session.setAttribute("regiVO",regiVO);
                                }

                    //// Ended the registration Trans Entry          
                        log.info("tempOtherAmount is "+tempOtherAmount);
                        log.info("tempregAmount is "+tempregAmount);
                    //// For Activity Trans Entry
                              tempOtherAmount = 0.0;
                              tempregAmount = 0.0;
                              String activityId = (String) session.getAttribute("activityId");
                              log.info("Activity Trans Id is ::::::::::::::::"+activityId);
                                if(activityId!=null || activityId.trim().length()!=0){


                                    HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(activityId);
                                    HLCAccTransactionVO regiVO = new HLCAccTransactionVO();

                                    String accNo =  accTxnDet.getAccount_no();
                                    String className = accTxnDet.getClass_name();
                                    String itemNo = accTxnDet.getItem_no();
                                    String subAccNo = accTxnDet.getSub_account_no();
                                    String transName = accTxnDet.getTransaction_name();
                                    String transType = accTxnDet.getTransaction_type();

                                   
                                String cardselect = (String)session.getAttribute("cardselect");
                                         regiVO.setPayment_mode(cardselect);
                                         regiVO.setActive_status(false);
                                   

                                    double regAmount = 0.0;
                                    String regStrAmt = "";
                                    log.info("Before Renumeration");
                                    Enumeration new_Enum = regList.getEnumeration();
                                    log.info("After Renumeration");
                                    while(new_Enum.hasMoreElements()){
                                            log.info("Inisde While Loop");
                                            HLCAnnualUserVO tempObjAnnualUser = (HLCAnnualUserVO) new_Enum.nextElement();
                                            
                                            regAmount = tempObjAnnualUser.getRegAmount();
                                            otherAmount = tempObjAnnualUser.getOtherActAmount();
                                            
                                            tempregAmount = tempregAmount + regAmount;
                                            tempOtherAmount = tempOtherAmount + otherAmount;
                                                    
                                            log.info(" tempregAmount "+tempregAmount);
                                            log.info(" tempOtherAmount "+tempOtherAmount);
                                    }
                                    Iterator itr = addTktList.iterator();
                                    double otherTktAmt = 0.0;
                                    while(itr.hasNext()){
                                        String tempAddTkt[] = (String[])itr.next();
                                        otherTktAmt = otherTktAmt + Double.parseDouble(tempAddTkt[2]);
                                    }
                                    
                                    log.info("Additional Tkt amt is "+otherTktAmt);
                                    log.info("Main Activ Tkt amt is "+tempOtherAmount);
                                    tempOtherAmount = tempOtherAmount + otherTktAmt; 
                                    
                                    log.info("Sum of amt is "+tempOtherAmount);
                                    otherStrAmt = Double.toString(tempOtherAmount);

                                    regiVO.setAmount(Float.parseFloat(otherStrAmt));
                                    regiVO.setDescription(transName);
                                    regiVO.setClass_Typ(className);
                                    regiVO.setAccount_no(accNo);
                                    regiVO.setAccount_type("Income");
                                    //horseMem.setUser_id(userId);
                                    //horseMem.setIp_address(reqIp);
                                    regiVO.setItem_no(itemNo);
                                    regiVO.setSub_account_no(subAccNo);
                                    regiVO.setPayment_id(paymentId1);

                                    log.info("Setting the attribute activity VO");
                                    session.setAttribute("activityVO",regiVO);
                                }          

                              /// End Transac Entry                
                } 
                  
                       
                       /* String meetingId = vaigaiBean.getMeetingId(paymentId);
                        if(meetingId!=null&&meetingId.trim().length()!=0){
                            boolean annualResult = vaigaiBean.updateAnnualStatus(meetingId, "Registered", "");
                            log.info("        AnnualResult:" + annualResult);
                        }*/
      String emailId = (String)session.getAttribute("emailId");
      
    String fffff=""; 
    String content="";
 String loopContent="";
 String finalContent="";
 String content1="";
 String subContent="";
  String toMailIds[] = {emailId};

                EmailContent email=new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("info@usea.com");
                email.setSubject("Annual Meeting & Convention Registration");

                         
              content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +             
                      "+<tr>"+
                            "<td valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\"> "+                                                                       
                            "<strong>"+
                            "2009 Annual Meeting and Convention Registration Confirmation"+
                            "</strong>"+   							
				"<p>"+
"Thank you for your registration. The United States Eventing "+
"Association is looking forward to seeing you in Reston, Virginia on "+
"December 2-6, 2009 for the Annual Meeting and Convention as "+
"we celebrate the USEA's 50th Anniversary and honor the "+  
"inductees into the 2009 Eventing Hall of Fame."+       

 "<hr size=\"4\" noshade=\"noshade\"/>"+
                     
      "<p><a href='http://reports.useventing.com/ReportServer?/Public/AMC_Receipt&rs:Command=Render&rs:format=PDF&PAYID="+meetingId+"'>Click to view your Annual Meeting payment details</a> "+
                            "</p>"+	                                           			                        						
			"</td>"+
                      "</tr>";                   
                       
             
           loopContent= content;  

 content1=" <tr>" +
              " <td valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                            
       "<hr size=\"3\" noshade=\"noshade\"/>"+                        
                            "<p>Please visit <a href='http://useventing.com/aboutus.php?section=convention'>http://useventing.com/aboutus.php?section=convention</a> "+
                            "</p>"+			  
					 "<p>Not a USEA Member? Join today at <a href='http://dashboard.useventing.com/'>http://dashboard.useventing.com/</a> "+
                            "</p>"+ 
					 "<p>USEA Meeting Services"+
                            "</p>"+
                         "</td>"+
                      "</tr>"+                   
                       "</table>";    
                            
  
    
    finalContent=loopContent+" "+content1;
    
    //log.info("finalContent"+finalContent);
    if(finalContent!=null && !(finalContent.equalsIgnoreCase(""))){
             email.setBody(finalContent);
                            //email.setAttachments();
                            EmailEngine emailEngine = new EmailEngine();
                            boolean emailFlag = emailEngine.sendMimeEmail(email);
                            //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                             log.info("Email sent sucessfully :"+emailFlag);
    }
                           
                        
                                                                                    
                    //(String)request.getAttribute("amount");
                        log.info("amount in card:" + String.valueOf(totAmount));
                        request.setAttribute("amount",String.valueOf(totAmount));
                       // session.setAttribute("regList",null);
                   // session.setAttribute("objPaymentList",null);
                        session.removeAttribute("regList");
                        session.removeAttribute("payRes");
                        session.removeAttribute("objPaypal");
                        session.removeAttribute("ticket");
                        session.removeAttribute("totAmount");
                        session.removeAttribute("addTktRegistrarName");
                        session.removeAttribute("addTktList");
                        session.removeAttribute("checkAmount1");

                        log.info("Activity VO");
                        if(session.getAttribute("activityVO")!=null){
                            HLCAccTransactionVO activityVO = (HLCAccTransactionVO) session.getAttribute("activityVO");
                            if(activityVO.getPayment_id()!=null){
                                boolean insert_status = mahanadhiBean.insertAccountTxnDetails(activityVO);
                                log.info("Activity VO Insert Status "+insert_status);                            
                            }
                            else{
                                log.info("Activity VO Not inserted in the card page");
                            }
                        }
                        
                        log.info("Registration VO");
                        if(session.getAttribute("regiVO")!=null){
                            HLCAccTransactionVO regiVO = (HLCAccTransactionVO) session.getAttribute("regiVO");
                            if(regiVO.getPayment_id()!=null){
                                boolean insert_status = mahanadhiBean.insertAccountTxnDetails(regiVO);
                                log.info("Registration VO Insert Status "+insert_status);                                                        
                            }
                            else{
                                 log.info("Registration VO Not inserted in the card page");
                            }
                        }

                      //update Payment Status
                        if(paymentId1!=null || paymentId1.trim().length()!=0){
                            boolean update_payStat = mahanadhiBean.updatePaymentStatusAccTxnDetails(paymentId1);
                            log.info("Update Status "+update_payStat);
                        }                        
                      /*
                       *Redirects to -frmMeeCardSuccess.jsp
                       */
                      return new ModelAndView("frmMeeCardSuccess");
              }    
                
            }
            
        }
      catch(Exception e){
          log.info("Exception occurs in payment" +e.getMessage());
          
      }
        return null;
    }

   
}

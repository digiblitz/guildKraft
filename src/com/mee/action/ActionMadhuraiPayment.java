/*
 * ActionMadhuraiPayment.java
 *
 * Created on October 13, 2006, 1:02 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;

import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.Debug;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlcpayment.HLCPaymentSessionBean;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

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
import com.hlccommon.util.*;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;

/**
 *
 * @author suresh
 */

	public class ActionMadhuraiPayment implements Controller {

		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
     Debug.print("Return from Nova");
        try{
            
          
            /*
             * Educational session bean
             */
        	HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();
            /*
             * Payment Session bean
             */
        	 HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();

             HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
            Debug.print("Return from Nova");
            HttpSession session = request.getSession(true);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            
            HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
            HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
            Vector publication = new Vector();
            
            Debug.print("Return from Nova");
            HLCPaymentResultVO payRes = (HLCPaymentResultVO) session.getAttribute("payRes");
            HLCPaymentDetailVO objPaypal = (HLCPaymentDetailVO) session.getAttribute("objPayDet");
            String[] results = (String[]) session.getAttribute("results");
            String statusId3 = (String) session.getAttribute("statusId3");
            System.out.println("payRes in card servlet: " + payRes);
            System.out.println("results in card servlet: " + results);
            System.out.println("statusId3 in card servlet: " + statusId3);
            String emailId = (String)session.getAttribute("emailId");
            String amount=(String)session.getAttribute("amount");

            if (statusId3 == null || statusId3.equalsIgnoreCase("Failure")) {
                String errorCd = payRes.getErrorCd();
                String lngMsg = payRes.getLngMsg();

                String toMailIds[] = {emailId};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dashboard@useventing.com");
                email.setSubject("Education Registration Decline");
                System.out.println("toMailIds: " + toMailIds);
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
                
                request.setAttribute("amount",amount);

                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);

                return new ModelAndView("decline");
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

            Debug.print("Sucessfully return from Nova sslResult:" + sslResult);
            Debug.print("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
            Debug.print("Sucessfully return from Nova sslTxnId:" + sslTxnId);
            Debug.print("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
            Debug.print("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
            Debug.print("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
            Debug.print("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
            Debug.print("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
            Debug.print("Sucessfully return from Nova sslEmail:" + sslEmail);
            
            objActDet = (HLCActivityOrganizerVO) session.getAttribute("objActivityOrganizer");
            publication = (Vector) session.getAttribute("objPublicationList");
            objPayDet = (HLCPaymentDetailVO)session.getAttribute("objPaymentList");

            Debug.print("Sucessfully return from NOVA UserId:" + (String)session.getAttribute("userId"));
            Debug.print("Sucessfully return from Nova objActDet:" + objActDet);
            Debug.print("Sucessfully return from Nova publication:" + publication);
            //Debug.print("Sucessfully return from Nova objPayDet:" + objPayDet);
            
            Debug.print("amount:" + amount);
            if(sslResult.equals("0")){
                if(objActDet!=null && publication!=null && objPayDet!=null){
                    objPayDet.setSslResult(sslResult);
                    objPayDet.setSslResultMessage(sslResultMessage);
                    objPayDet.setSslTxnId(sslTxnId);
                    objPayDet.setSslApprovalCode(sslApprovalCode);
                    objPayDet.setSslCvv2Response(sslCvv2Response);
                    objPayDet.setSslAvsResponse(sslAvsResponse);
                    objPayDet.setSslTransactionType(sslTransactionType);
                    objPayDet.setSslInvoiceNo(sslInvoiceNo);
                    objPayDet.setSslEmail(sslEmail);
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
                    
                    String paymentId = educationBean.getNextId();
                    Debug.print("  ActionMadhurai.paymentId:" + paymentId);
                    objActDet.setPaymentId(paymentId);
                    objPayDet.setPaymentId(paymentId);
        
                    Debug.print("Activity Organizer  Sucessfully Getting Started:");
                    
                    
                    String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");
                        boolean idExist = humanMemb.isInvoiceIdExist(sessionInvoiceId);
                        Debug.print("idExist value is:" + idExist);

//======================INSERT ENTRIES INTO PAYMENTDETAILS TABLE==========================================
                        boolean result = false;
                        boolean dimFlag = false;
                        if (!idExist) {
                            result  = paymentBean.createPayment(objPayDet);
                    Debug.print("Result  Payment Bean" + result);
                    Debug.print("succsssullll Created.........::");
                    dimFlag = educationBean.createActivityOrganizer(objActDet,publication) ;
                    Debug.print("Activity Organizer INserted Sucessfully:"+dimFlag);
                            session.setAttribute("sessionResultPay", "true");
                        }

                    
                    
                    String sessionResultPay = (String) session.getAttribute("sessionResultPay");
                        if (sessionResultPay.equalsIgnoreCase("true") && dimFlag == true){
                        String toMailIds[] = {emailId};
                       EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@usea.com");
                        email.setSubject("Test Mail");

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
                        "<p>You have successfully sent your Sponsorship Request. It will be reviewed and Approved within 24 hrs.<p>"+
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
                        //email.setAttachments();
                        EmailEngine emailEngine = new EmailEngine();
                        boolean emailFlag = emailEngine.sendMimeEmail(email);
                        //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                        Debug.print("Email sent sucessfully :"+emailFlag);
                    }
                    session.setAttribute("amount",amount);
                    /*session.setAttribute("objActivityOrganizer",null);
                    session.setAttribute("objPublicationList",null);
                    session.setAttribute("objPaymentList",null);*/
                    return new ModelAndView("frmMeeEduActSuccess");
                 }
            } 
            else{
                 Debug.print("Not Inserted..:");
                 Debug.print("amount:" + amount);
                 request.setAttribute("amount",amount);
                 return new ModelAndView("decline");
            }
            
        }
         catch(Exception e){
            Debug.print("Exception in ActionMadhuraiPayment" + e);
        }
        return new ModelAndView("frmMeeEduActSuccess");
    }
   
}

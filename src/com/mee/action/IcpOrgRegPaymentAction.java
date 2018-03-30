/*
 * IcpOrgRegPaymentAction.java
 *
 * Created on October 15, 2006, 4:17 PM
 */

package com.mee.action;

import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.Debug;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import com.hlcpayment.HLCPaymentSessionBean;


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

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import com.hlcmeeting.util.HLCPaymentDetails;

/**
 *
 * @author suresh
 */


	public class IcpOrgRegPaymentAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
       try{
            HttpSession session = request.getSession();
            HLCPaymentSessionBean paymentBean=new HLCPaymentSessionBean();
            
            HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            
            HLCInstructorDetails objInstDetail = new HLCInstructorDetails();
            HLCPaymentDetails objPayment = (HLCPaymentDetails)session.getAttribute("objPaymentList");
            String userId = (String)session.getAttribute("userId");
            
            Debug.print("Return from Nova UserId:" + (String)session.getAttribute("userId"));
            Debug.print("Return from Nova UserCode:" + (String)session.getAttribute("userCode"));
            Debug.print("Return from Nova memeberId:" + (String)session.getAttribute("memeberId"));
            
            Debug.print("Return from Nova:");
            
            String sslResult = request.getParameter("ssl_result");
            String sslResultMessage =  request.getParameter("ssl_result_message");
            String sslTxnId =  request.getParameter("ssl_txn_id");
            String sslApprovalCode = request.getParameter("ssl_approval_code");
            String sslCvv2Response = request.getParameter("ssl_cvv2_response");
            String sslAvsResponse = request.getParameter("ssl_avs_response");
            String sslTransactionType =  request.getParameter("ssl_transaction_type");
            String sslInvoiceNo = request.getParameter("ssl_invoice_number");
            String sslEmail = request.getParameter("ssl_email");

            Debug.print("Sucessfully return from Nova sslResult:" + sslResult);
            Debug.print("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
            Debug.print("Sucessfully return from Nova sslTxnId:" + sslTxnId);
            Debug.print("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
            Debug.print("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
            Debug.print("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
            Debug.print("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
            Debug.print("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
            Debug.print("Sucessfully return from Nova sslEmail:" + sslEmail);    
            objInstDetail=(HLCInstructorDetails)session.getAttribute("objInstDetail");
            Debug.print("Sucessfully Return objPaymentList:" + objPayment.toString());
              if(sslResult.equals("0")){
                   if(objPayment!=null){
                   HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
                   String pymtId = vaigaiMeetingBean.getPaymtId();
                   objInstDetail.setPaymentId(pymtId);
                  //  objPayment.setPaymentId(pymtId);
                   Debug.print("pymtId:" + pymtId);
                   
                    objPayDet.setPaymentId(pymtId);
                    Debug.print("pymtId:" + pymtId);
                    objPayDet.setUserId(userId);
                    objPayDet.setCcName(objPayment.getCcName());
                    objPayDet.setCcType(objPayment.getCcType());
                   // objPayDet.setCcNumber(objPayment.getCcNumber());
                    objPayDet.setCcExpMonth(objPayment.getCcExpMonth());
                    objPayDet.setCcExpYear(objPayment.getCcExpYear());
                    objPayDet.setCcCvvid(objPayment.getCcCvvid());
                   
                    objPayDet.setAmount(objPayment.getAmount());
                    objPayDet.setPaymentStatus(objPayment.getPaymentStatus());  
                    Debug.print("ccName:" + objPayment.getCcName());
                    Debug.print("ccType:" + objPayment.getCcType());
                    Debug.print("CcNumber:" + objPayment.getCcNumber());
                    Debug.print("CcExpMonth:" + objPayment.getCcExpMonth());
                    Debug.print("CcExpYear;;;;;;;;;;;;;:" + objPayment.getCcExpYear());
                    Debug.print("CcCvvid:" + objPayment.getCcCvvid());
                    Debug.print("amount:" + objPayment.getAmount());
                    objPayDet.setSslResult(sslResult);
                    objPayDet.setSslResultMessage(sslResultMessage);
                    objPayDet.setSslTxnId(sslTxnId);
                    objPayDet.setSslApprovalCode(sslApprovalCode);
                    objPayDet.setSslCvv2Response(sslCvv2Response);
                    objPayDet.setSslAvsResponse(sslAvsResponse);
                    objPayDet.setSslTransactionType(sslTransactionType);
                    objPayDet.setSslInvoiceNo(sslInvoiceNo);
                    objPayDet.setSslEmail(sslEmail);
                     
                    boolean resultPay  = paymentBean.createPayment(objPayDet);
                    Debug.print("Sucessfully Payment Inserted:" + objPayDet.toString());
                     boolean bol =false;
                    if(objInstDetail!=null){
                         objPayment.setUserId(null);
                         bol = vaigaiMeetingBean.addInstructorDetails(objInstDetail,objPayment);
                         System.out.println("For payment & Instructor Detail Result is  : "+bol);
                    }
                    if(resultPay == true && bol==true){
                        String emailId = (String)session.getAttribute("emailId");
                        String toMailIds[] = {emailId};
                        EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@hlc.com");
                        email.setSubject("Your Registration Status");

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
                        "<p>You have successfully sent your ICP Request. It will be reviewed and Approved within 24 hrs.<p>"+
                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                        Debug.print("Email sent sucessfully :"+emailFlag);
                        String amount =(String)session.getAttribute("amount");
                        request.setAttribute("amount",amount);
                        return new ModelAndView("mee-confirmation-icp-org-regi");
                    }
                 }
              }
              else{
                Debug.print("Not Inserted:");
               // Debug.print("amount:" + amount);
                return new ModelAndView("decline");
                
              }
            session.setAttribute("objPaymentList",null);
            session.setAttribute("objInstDetail",null);
            session.setAttribute("amount",null);
             
          //================================================================
            
       }
     catch(Exception ecommon){
          Debug.print("" + ecommon);

      }
        return null;  
     }
    
}

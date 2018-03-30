/*
 * AnnuaCardlFailPayment.java
 *
 * Created on October 29, 2007, 6:46 PM
 */
package com.mee.action;

import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;

import com.hlcreg.util.Debug;
import com.hlcreg.util.HLCPaymentVO;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.Properties;
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

/**
 *
 * @author hari
 * @version
 */

	public class AnnuaCardlFailPayment implements Controller {

  
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {

        try {

        	HLCKaverySessionBeanStatfulBean kaveryStatfulBean=new HLCKaverySessionBeanStatfulBean();
        	
            HttpSession session = request.getSession(true);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

            String sslResult = request.getParameter("ssl_result");
            String sslResultMessage = request.getParameter("ssl_result_message");
            String sslTxnId = request.getParameter("ssl_txn_id");
            String sslApprovalCode = request.getParameter("ssl_approval_code");
            String sslCvv2Response = request.getParameter("ssl_cvv2_response");
            String sslAvsResponse = request.getParameter("ssl_avs_response");
            String sslTransactionType = request.getParameter("ssl_transaction_type");
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


            // Get client's IP address
            String addr = request.getRemoteAddr(); // 123.123.123.123
            Debug.print("Port Value:" + addr);

            String sessUserId = (String) session.getAttribute("userId");

            Debug.print("Sucessfully return from NOVA UserId:" + sessUserId);

            String paymentId = (String) session.getAttribute("payId");
            String amount = (String) session.getAttribute("amount");
            HLCPaymentVO objPayment = new HLCPaymentVO();
            HLCPaymentVO objPay = (HLCPaymentVO) session.getAttribute("objPay");
            if (amount != null && amount.trim().length() != 0) {
                double dbl = Double.parseDouble(amount);
                objPay.setAmount(dbl);
            } else {
                objPay.setAmount(0);
            }
            objPay.setSslResultMessage(sslResultMessage);
            objPay.setIpAddress(addr);
            objPay.setPaymentId(paymentId);
            objPay.setSslApprovalCode(sslApprovalCode);
            objPay.setSslTxnId(sslTxnId);
            objPay.setSslResult(sslResult);


            boolean paymentStatus = false;
            if (sslResult.equals("0")) {
                paymentStatus = true;
                objPay.setActiveStaus(true);
            } else {
                objPay.setActiveStaus(false);
            }

            Debug.print("paymentId:" + paymentId);
            Debug.print("User Id:" + sessUserId);
            Debug.print(" sslResult:" + sslResult);
            Debug.print(" amount:" + amount);

            if (sslResult.equals("0")) {


                String emailId = (String) session.getAttribute("emailId");
                String toMailIds[] = {emailId};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("info@hlc.com");
                email.setSubject("Annual Meeting & Convention Registration");

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
                        "<span class=\"boldTxt\">Dear User</span>,<br /><br />" +
                        "<p>Annual Meeting & Convention Registration<p>" +
                        "You have successfully registered with United States Eventing Association for all " +
                        "the Annual Convention Registration that are to be held! Your application would be verified and processed within" +
                        "24 hours." +
                        "------------------ <br />" +
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
                        "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />" +
                        "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want." +
                        "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:" +
                        "<ul>" +
                        "<li>Unlimited shopping online.</li>" +
                        "<li>Place advertisements online and/or on-site.</li>" +
                        "<li>Sponsor competitions held by HLC.</li>" +
                        "</ul>" +
                        "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as " +
                        "per your �Role� assigned:" +
                        "<ul>" +
                        "<li>Compete in Equestrian Events held by HLC.</li>" +
                        "<li>Take part in other events like; Annual Meetings, Educational events," +
                        "Activity Meetings held by HLC etc.</li>" +
                        "<li>Send Messages to other members.</li>" +
                        "<li>Create your own Distribution Lists.</li>" +
                        "<li>Create/Join a group and share your thoughts and common ideas.</li>" +
                        " <li>Unlimited Shopping online.</li>" +
                        " <li>Place advertisements online and/or on-site.</li>" +
                        " <li>Sponsor competitions held by HLC.</li>" +
                        "</ul>" +
                        "and much more..." +
                        "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>" +
                        "</tr>" +
                        " <tr>" +
                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                        "</tr>" +
                        "</table>";

                email.setBody(content);
                //email.setAttachments();
                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                Debug.print("Email sent sucessfully :" + emailFlag);

                /*
                session.removeAttribute("amount");
                session.removeAttribute("payId");
                session.removeAttribute("bdgeNme");
                session.removeAttribute("meetId");
                 */
                boolean update_stat = kaveryStatfulBean.updatePaymentStatus(objPay);

                if (update_stat == true) {
                    session.setAttribute("paymode", "CardPay");
                    return new ModelAndView("frmAnnualPayCnf");
                }

            /*
             *Redirects to -frmMeeCardSuccess.jsp
             */
            } else {
                Debug.print("Not Inserted..:");
                Debug.print("amount:" + amount);
                request.setAttribute("amount", amount);

                /*
                 *Redirects to - frmMeeAnnualConvRegPaymentNovaDecline.jsp
                 */
                return new ModelAndView("frmAnnDeclinePay");
            }

        } catch (Exception e) {
            Debug.print("Exception occurs in payment" + e.getMessage());

        }
        return null;
    }

  
}


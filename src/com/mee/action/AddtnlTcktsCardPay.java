/*
 * AddtnlTcktsCardPay.java
 *
 * Created on November 1, 2007, 12:26 PM
 */

package com.mee.action;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.session.HLCMahanadhiSessionRemote;
import com.hlcaccounts.session.HLCMahanadhiSessionRemoteHome;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCPaymentResultVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemote;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemoteHome;
import com.hlcreg.util.Debug;
import com.hlcreg.util.HLCPaymentVO;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.util.HLCAdditionalTcktVO;

import com.hlcpayment.HLCPaymentSessionBean;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
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


	public class AddtnlTcktsCardPay implements Controller {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
  
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
       try{
    	   HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
    	   HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();
            
            HLCKaverySessionBeanStatfulBean userBean= new HLCKaverySessionBeanStatfulBean();
            HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
            
            HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
            
            HttpSession session = request.getSession(true);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            
                  
            String sessUserId = (String)session.getAttribute("userId");
            
            Debug.print("Sucessfully return from NOVA UserId:" + sessUserId);
            String paymentId=(String)session.getAttribute("payId");
            Debug.print("Sucessfully return from NOVA paymentId : "+paymentId);
            
            String amount =(String)session.getAttribute("amount");
            
            Debug.print("Sucessfully return from NOVA amount : "+amount);
            
            HLCPaymentVO objPayment = new HLCPaymentVO();
            HLCPaymentVO objPay = (HLCPaymentVO) session.getAttribute("objPay");
             HLCPaymentResultVO payRes = (HLCPaymentResultVO) session.getAttribute("payRes");
            HLCPaymentDetailVO objPaypal = (HLCPaymentDetailVO) session.getAttribute("objPayDet");
            
            String[] results = (String[]) session.getAttribute("results");
            String statusId3 = (String) session.getAttribute("statusId3");
            String statusId = (String) session.getAttribute("statusId");
            System.out.println("payRes in card servlet: " + payRes);
            System.out.println("results in card servlet: " + results);
            System.out.println("statusId3 in card servlet: " + statusId3);
            System.out.println("statusId in card servlet: " + statusId);
                 
               
                
            if (statusId3 == null || statusId3.equalsIgnoreCase("Failure")) {
                String errorCd = payRes.getErrorCd();
                String lngMsg = payRes.getLngMsg();
               String emailId = (String)session.getAttribute("emailId");
                String toMailIds[] = {emailId};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dashboard@useventing.com");
                email.setSubject("Annual Meeting & Convention Additional Ticket(s) Decline");
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
                 String amt=(String)session.getAttribute("amount");                                
                 session.setAttribute("amt",amt);
                 System.out.println("paymentId in second servlet"+paymentId);
                session.setAttribute("paymentId",paymentId );
              // request.setAttribute("registrationLevel", registrationLevel);
               // request.setAttribute("horseMemberId", res);
               // request.setAttribute("horseName", horseName);
                session.setAttribute("bdgeNme","N/A");
               // session.setAttribute("meetId",meetingId);
                request.setAttribute("totalAmount", amt);
               // request.setAttribute("paymentId", paymentId);

                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);

                return new ModelAndView("frmAddntnlAnnDeclinePay");
            }
           
            
            
            // Get client's IP address
            String addr = request.getRemoteAddr(); // 123.123.123.123
            Debug.print("Port Value:" + addr);
          
             if (sessUserId != null) {
                HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
                objPayDet = (HLCPaymentDetailVO) session.getAttribute("objPaymentVO");
                //Debug.print("Sucessfully Return objPaymentList:" + objPayDet.toString());

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
                
         //   String sslResult = request.getParameter("ssl_result");
        //    String sslResultMessage =  request.getParameter("ssl_result_message");
         //   String sslTxnId =  request.getParameter("ssl_txn_id");
         //   String sslApprovalCode = request.getParameter("ssl_approval_code");
          //  String sslCvv2Response = request.getParameter("ssl_cvv2_response");
          //  String sslAvsResponse = request.getParameter("ssl_avs_response");
         //   String sslTransactionType =  request.getParameter("ssl_transaction_type");
          //  String sslInvoiceNo = request.getParameter("ssl_invoice_number");
         //   String sslEmail = request.getParameter("ssl_email");

            Debug.print("Sucessfully return from Nova sslResult:" + sslResult);
            Debug.print("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
            Debug.print("Sucessfully return from Nova sslTxnId:" + sslTxnId);
            Debug.print("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
            Debug.print("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
            Debug.print("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
            Debug.print("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
            Debug.print("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
            Debug.print("Sucessfully return from Nova sslEmail:" + sslEmail);
            
            
          
            
           if(amount!=null && amount.trim().length()!=0){
                double dbl  = Double.parseDouble(amount);
                objPay.setAmount(dbl);
            }
            else{
                objPay.setAmount(0);
            }
            objPay.setSslResultMessage(sslResultMessage);
            objPay.setIpAddress(addr);
            objPay.setPaymentId(paymentId);
            objPay.setSslApprovalCode(sslApprovalCode);
            objPay.setSslTxnId(sslTxnId);
            objPay.setSslResult(sslResult);
                
                    
              if(sslResult.equals("0")){
                   if (objPayDet != null) {
                       objPayDet.setUserId(sessUserId);
                        objPayDet.setSslResult(sslResult);
                        objPayDet.setSslResultMessage(sslResultMessage);
                        objPayDet.setSslTxnId(sslTxnId);
                        objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(sslEmail);
                        objPayDet.setPaymentId(paymentId);
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
                        

                        //Phone Service

                        String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");
                        boolean idExist = humanMemb.isInvoiceIdExist(sessionInvoiceId);
                        Debug.print("idExist value is:" + idExist);

//======================INSERT ENTRIES INTO PAYMENTDETAILS TABLE==========================================
                       // boolean resultPay = false;
                        if (!idExist) {
                            boolean result1  = paymentBean.createPayment(objPayDet);
                            Debug.print("resultPay value is:" + result1);
                            session.setAttribute("sessionResultPay", "true");
                        }
                         boolean paymentStatus = false;
            if(sslResult.equals("0")){
                paymentStatus = true;
                objPay.setActiveStaus(true);
            }
            else{
                objPay.setActiveStaus(false);
            }
            
            Debug.print("paymentId:" + paymentId);
            Debug.print("User Id:" + sessUserId);
            Debug.print(" sslResult:" + sslResult);
            Debug.print(" amount:" + amount);
                 HLCAdditionalTcktVO tcktVO = (HLCAdditionalTcktVO) session.getAttribute("tcktVO");
                String meetingId = vaigaiMeetingBean.registerAdditionalTickets(tcktVO);       
            
                if(session.getAttribute("activityValue")!=null){
                    HLCAccTransactionVO regiVO = (HLCAccTransactionVO) session.getAttribute("activityValue");
                    boolean insert_status = mahanadhiBean.insertAccountTxnDetails(regiVO);
                    Debug.print("Insert Status "+insert_status);    
                }  
                        
                        String emailId = (String)session.getAttribute("emailId");
                        String toMailIds[] = {emailId};
                        EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@usea.com");
                        email.setSubject("Annual Meeting & Convention Registration");

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
                        "<p>Annual Meeting & Convention Registration<p>"+
                       "You have successfully registered with United States Eventing Association for all "+
"the Annual Convention Registration that are to be held! Your application would be verified and processed within"+
"24 hours."+
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
                        String amt=(String)session.getAttribute("amount");
                        session.setAttribute("amt",amt);
                         session.setAttribute("bdgeNme","N/A");
                          session.setAttribute("meetId",meetingId);
                      /*
                       *Redirects to -frmMeeCardSuccess.jsp
                       */
                      //  boolean update_stat = remote.updatePaymentStatus(objPay);
                        
                       // if(update_stat == true){
                            session.setAttribute("paymode","CardPay");
                            return new ModelAndView("frmAdditonalAnnualPayCnf");
                       // }
                 }
              }
               
            else{
                 Debug.print("Not Inserted..:");
                 Debug.print("amount:" + amount);
                 request.setAttribute("amount",amount);
                 
                 session.setAttribute("amount",amount);
                 session.setAttribute("payId",paymentId);
                 session.setAttribute("bdgeNme","N/A");
                // session.setAttribute("meetId",meetingId);

                 return new ModelAndView("frmAddntnlAnnDeclinePay");
            }
            
        }
       }
      catch(Exception e){
          e.printStackTrace();
          Debug.print("Exception occurs in payment" +e.getMessage());
          
      }
       return null;
    }

    public static Context getInitialContext() throws javax.naming.NamingException {
        Properties p =new Properties();
        p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
        p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
        p.setProperty( "java.naming.provider.url", "localhost:11199" );
        return new javax.naming.InitialContext(p);
    }
    
    
}

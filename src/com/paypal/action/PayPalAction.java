/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.paypal.action;



import com.db.GeneralDBAction;
import com.hlcaccounts.session.HLCMahanadhiSessionRemote;
import com.hlcaccounts.session.HLCMahanadhiSessionRemoteHome;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlccommon.util.HLCPaymentResultVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmrm.util.Debug;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
import com.paypal.sdk.core.nvp.NVPDecoder;
import com.paypal.sdk.core.nvp.NVPEncoder;
import com.paypal.action.PayPalPayments;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import com.util.email.MailMail;
import com.hlcform.util.HLCPaymentDetails;
import com.infusionejb.session.InfusionSessionBean;
import com.login.action.KlgLoginAction;

import java.util.ArrayList;
import java.util.Properties;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.MessageResources;
import org.apache.xmlrpc.XmlRpcException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;




 
    public class PayPalAction implements Controller {
    	private final static String SUCCESS = "success"; 
    	
    	public static final String prop_file = "paypalapi.properties";

    	InputStream inputStream;
    	static Logger log = Logger.getLogger(PayPalAction.class.getName());
    	
    	public static final String LOG_FILE = "Log4j.properties";
    	InputStream is;
    	
    	public ModelAndView handleRequest(HttpServletRequest request,
    			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
    			IOException, ParserConfigurationException, SAXException {
        HttpSession session = request.getSession();
       log.info("inside paypal action");
        String[] payDet = new String[7];
        ArrayList finalPayResults = new ArrayList();
        // PaymentDetails objPayment = new PaymentDetails();
        //String fwd="success";
        Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
        
        PayPalPayments paypalpayments = PayPalPayments.getInstance();
        //fetching the API creadentials from properties
        Properties prop = new Properties();
	     
		inputStream = getClass().getClassLoader().getResourceAsStream(prop_file);

		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + prop_file + "' not found in the classpath");
		}
			
		// get the property value and print it out
		String api_username = prop.getProperty("API_username");
		String api_password = prop.getProperty("API_password");
		String api_Signature = prop.getProperty("API_Signature");

        try {

           /* Context jndiContext = new InitialContext();
            Object objPayss = jndiContext.lookup("ejb/HLCPaymentSessionBean");
            HLCPaymentSessionRemoteHome objPaySessHome = (HLCPaymentSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(objPayss, HLCPaymentSessionRemoteHome.class);
            HLCPaymentSessionRemote objPaySessRemote = objPaySessHome.create();

            MessageResources mr = getResources(request);
            String namingfactory = mr.getMessage("ejbclient.namingfactory");
            String contextfactory = mr.getMessage("ejbclient.contextfactory");
            String urlprovider = mr.getMessage("ejbclient.urlprovider");
            String lookupip = mr.getMessage("ejbclient.ip");

            String mahanadhiJndi = mr.getMessage("jndi.acc");
            log.info("mahanadhiJndi  :" + mahanadhiJndi);
            Object maha = jndiContext.lookup(mahanadhiJndi);
            HLCMahanadhiSessionRemoteHome mahaHome = (HLCMahanadhiSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(maha, HLCMahanadhiSessionRemoteHome.class);
            HLCMahanadhiSessionRemote mahaRemote = mahaHome.create();

            String jndiname = mr.getMessage("jndi.usrreg");
            Object objref = jndiContext.lookup(jndiname);
            HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCkaverystatelessRemoteHome.class);
            HLCkaverystatelessRemote remote = home.create();*/
        	GeneralDBAction db = new GeneralDBAction();
        	HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
            HLCPaymentResultVO payRes = new HLCPaymentResultVO();
            String forwardPage = null;
            InfusionSessionBean emails=new InfusionSessionBean();
            String sessionInvoiceId = (String) session.getAttribute("sessionInvoiceId");

            String purpose =  (String) request.getParameter("purpose");
            
            String API_username =api_username;
            String API_password =api_password;
            String API_Signature =api_Signature;
            
            //String API_username ="suresh.kannan_api1.transformationguild.org";
            //String API_password ="R26R7K46ATR7Y74S";
            //String API_Signature ="A4T8tYprcEwxOfI.96B34GrTH9lwARG1QUwZ8V4bLypcmB585JaYAVn1";
            //String API_username ="prabhu.pandi-facilitator_api1.digiblitz.in";
            //String API_password ="33M5P9H3UMNF49Q6";
            //String API_Signature ="AiPC9BjkCyDFQXbSkoZcgqH3hpacAqRcYithSl8PM-MpvR0vtNpqDXT-";
            String payAction = request.getParameter("PAYMENTACTION");
            String ccType = request.getParameter("CREDITCARDTYPE");
            String acct = request.getParameter("ACCT");
            String expDt = request.getParameter("EXPDATE");
            String ipAdd = request.getParameter("IPADDRESS");
            String fName = request.getParameter("FIRSTNAME");
            String cvvNo = request.getParameter("CVVNO");
            String street = request.getParameter("STREET");
            String city = request.getParameter("CITY");
            String state = request.getParameter("STATE");
            String zip = request.getParameter("ZIP");
            String amount = request.getParameter("AMT");
            String ccode = request.getParameter("COUNTRYCODE");
            String method = request.getParameter("METHOD");
            String version = request.getParameter("VERSION");
            String Environ = request.getParameter("ENVIRON");
            String emailId = request.getParameter("EMAIL");
            String currCode = request.getParameter("CURRENCYCODE");
            
            String lName = request.getParameter("LASTNAME");
            String instituteName = request.getParameter("INSTITUTENAME");
            String instituteID = request.getParameter("INSTITUTEID");
            
            String event_title = request.getParameter("event_title");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String userId1 = request.getParameter("userId1");
            
            String Productplan = request.getParameter("Productplan");
            String plan = request.getParameter("plan");
            
            String pay_firstname = request.getParameter("pay_firstname");
            log.info("pay_firstname in paypall action::::::::::::::::::::::::::::::::::::::::"+pay_firstname);
	          String pay_lastname= request.getParameter("pay_lastname");
	          String pay_e_mail=  request.getParameter("pay_e_mail");
	          String pay_mobileno=  request.getParameter("pay_mobileno");
	          String pay_institutionName=  request.getParameter("instituteName");
	          String pay_country=  request.getParameter("pay_country");
	          String pay_state=  request.getParameter("pay_state");
	          String pay_city=  request.getParameter("pay_city");
	          String pay_productPrice =   request.getParameter("typename");
	          String pay_credit_card_type=  request.getParameter("pay_credit_card_type");
	          String pay_credit_card_no=  request.getParameter("pay_credit_card_no");
	          String pay_cvv_no=  request.getParameter("pay_cvv_no");
	          String pay_name_on_card=  request.getParameter("pay_name_on_card");
	          String pay_expiry_month=  request.getParameter("pay_expiry_month");
	          String pay_expiry_year=  request.getParameter("pay_expiry_year");
	          String pay_expiry_date = pay_expiry_month+"/"+pay_expiry_year;
	         // String Productplan=  request.getParameter("Productplan");
	          //String plan=  request.getParameter("plan");
	          String fee=  request.getParameter("fee");
	          String monthYear=  request.getParameter("monthYear");
	          String pay_addrline1=  request.getParameter("pay_addrline1");
	          String pay_addrline2=  request.getParameter("pay_addrline2");
	          String pay_total_amount=  request.getParameter("pay_total_amount");
	          String offer=null;
	          
	          
	         /* String pay_event_title=  request.getParameter("pay_event_title");
	          String pay_start_date=  request.getParameter("pay_start_date");
	          String pay_end_date=  request.getParameter("pay_end_date");
	          String pay_userId1=  request.getParameter("pay_userId1");*/
	          
	          log.info("paypal_firstname::::::::::::::::::"+pay_firstname);
	          log.info("paypal_lastname::::::::::::::::::"+pay_lastname);
	          log.info("paypal_e_mail::::::::::::::::::"+pay_e_mail);
	          log.info("paypal_mobileno::::::::::::::::::"+pay_mobileno);
	          log.info("paypal_institutionName::::::::::::::::::"+pay_institutionName);
	          log.info("paypal_country::::::::::::::::::"+pay_country);
	          log.info("paypal_state::::::::::::::::::"+pay_state);
	          log.info("paypal_city::::::::::::::::::"+pay_city);
	          log.info("paypal_productPrice::::::::::::::::::"+pay_productPrice);
	          log.info("paypal_credit_card_type::::::::::::::::::"+pay_credit_card_type);
	          log.info("paypal_credit_card_no::::::::::::::::::"+pay_credit_card_no);
	          log.info("paypal_cvv_no::::::::::::::::::"+pay_cvv_no);
	          log.info("paypal_name_on_card::::::::::::::::::"+pay_name_on_card);
	          log.info("paypal_expiry_month::::::::::::::::::"+pay_expiry_month);
	          log.info("paypal_expiry_year::::::::::::::::::"+pay_expiry_year);
	          log.info("paypal_expiry_date::::::::::::::::::"+pay_expiry_date);
	          log.info("Productplan::::::::::::::::::"+Productplan);
	          log.info("plan::::::::::::::::::"+plan);
	          log.info("fee::::::::::::::::::"+fee);
	          log.info("monthYear::::::::::::::"+ monthYear);
	          log.info("pay_addrline1::::::::::::::::::"+pay_addrline1);
	          log.info("pay_addrline2::::::::::::::::::"+pay_addrline2);
	          log.info("pay_total_amount::::::::::::::"+ pay_total_amount);
	         

	          
	          String subid=null;
	          String ordid=null;
      		String cusid=null;

            String inVoiceId1 = request.getParameter("INVId");

            String INVId = (String) session.getAttribute("INVId");
            log.info("SESSION INVId in servlet:::" + INVId);

            String inVId = null;
            if (INVId == null || INVId.equalsIgnoreCase("null")) {
                inVId = "start";
            } else {
                inVId = INVId;
            }
            //log.info("inVoiceId1 in servlet:::" + inVoiceId1);
            /*log.info("inVId in servlet:::" + inVId);
            log.info("purpose in servlet:::" + purpose);
            log.info("API_username in servlet:::" + API_username);
            log.info("API_password in servlet:::" + API_password);
            log.info("API_Signature in servlet:::" + API_Signature);
            log.info("method in servlet:::" + method);
            log.info("amount in servlet:::" + amount);
            log.info("version in servlet:::" + version);
            log.info("Environ in servlet:::" + Environ);
            log.info("payAction in servlet:::" + payAction);
            log.info("ccType in servlet:::" + ccType);
            log.info("acct in servlet:::" + acct);
            log.info("expDt in servlet:::" + expDt);
            log.info("cvvNo in servlet:::" + cvvNo);
            log.info("fName in servlet:::" + fName);
            log.info("ipAdd in servlet:::" + ipAdd);
           log.info("emailId in servlet:::" + emailId);*/


            session.setAttribute("inVoiceId1", inVoiceId1);

            /*session.setAttribute("API_username", API_username);
            session.setAttribute("API_password", API_password);
            session.setAttribute("API_Signature", API_Signature);*/
            session.setAttribute("currCode", currCode);
            session.setAttribute("amount", amount);
            session.setAttribute("purpose", purpose); 

            /* String API_username="dhivya_1237881559_biz_api1.digiblitz.com";
            String API_password="1237881603";
            String API_Signature="AZz-.wpdCAiKvEaTAQDfbvLNOC1RA9dqJQtBGucKZ9D.wxwoO6D7nQy2";
            String method="DoDirectPayment";
            String amount="10.00";
            String version="51.0";
            String Environ="sandbox";
            String payAction="Sale";
            String ccType="Visa";
            String acct="4169580619448012";
            String expDt="032019";
            String ipAdd="192.168.1.5"; 
            String fName="dhivya";
            String lName="AB";
            String street="1 Main St";
            String city="San Jose";
            String state="CA";  
            String zip="95131";
            String ccode="US";*/

//log.info("API_username:" + API_username);
//log.info("API_password:" + API_password);
//log.info("API_Signature:" + API_Signature);
            log.info("amount:" + amount);

            String results[] = null;
            if (sessionInvoiceId.equalsIgnoreCase("1")) {
                results = PayPalPayments.DoDirectPaymentCode(API_username, API_password, API_Signature, method, amount, version, Environ, payAction, ccType, acct, expDt, cvvNo, fName, ipAdd, emailId, inVId, inVoiceId1,lName,street,city,state,ccode,zip);
            }
            //log.info("results:" + results);
            session.setAttribute("results", results);
            String statusId3=null;
            if (results != null) {

                 statusId3 = (String) results[0];
                String transactionId3 = (String) results[2];
                String compType3 = "Complete";
                String inVoiceId3 = (String) results[6];
                String ppAmt3 = (String) results[3];
                String sslAvsResponse = (String) results[4];
                String sslCvv2Response = (String) results[5];
                String lngMsg = (String) results[7];
                String errorCd = (String) results[8];
                String tmStmp = (String) results[9];
                String Environ1 = (String) results[10];
                String sslResultMessage = (String) results[0];
                String finalSslAvsResponse = "";
                String finalSslCvv2Response = "";

                if (sslAvsResponse == null || sslAvsResponse.equalsIgnoreCase("")) {
                    finalSslAvsResponse = "NG";
                } else {
                    finalSslAvsResponse = sslAvsResponse;
                }
                if (sslCvv2Response == null || sslCvv2Response.equalsIgnoreCase("")) {
                    finalSslCvv2Response = "NG";
                } else {
                    finalSslCvv2Response = sslCvv2Response;
                }

                session.setAttribute("sessionInvoiceId", inVoiceId3);

                payRes.setAmount(amount);
                payRes.setErrorCd(errorCd);
                payRes.setLngMsg(lngMsg);
                payRes.setSslAvsResponse(finalSslAvsResponse);
                payRes.setSslCvv2Response(finalSslCvv2Response);
                payRes.setTmStmp(tmStmp);

                session.setAttribute("payRes", payRes);

                HLCPaymentDetails objPayment = null;
                if (session.getAttribute("objPayment") != null && session.getAttribute("objPayment") instanceof HLCPaymentDetails) {
                    objPayment = (HLCPaymentDetails) session.getAttribute("objPayment");
                }
 
                log.info("objPayment"+objPayment);                
                /*if(objPayment.getPaymentId()!=null){
                String payId=objPayment.getPaymentId();
                session.setAttribute("payId", payId);
                }*/
                
                HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();

                //log.info("ppAmt in DoDirectPaymentCode#####" + ppAmt3);
                //log.info("statusId3 in servlet#####" + statusId3);
                //log.info("Transaction Id ----:" + transactionId3);

                String currCode1 = (String) session.getAttribute("currCode");
                String amount1 = (String) session.getAttribute("amount");
                log.info("amount1 in paypal: " + amount1);
                //log.info("currCode in paypal:........... " + currCode1);
                String method1 = "DoCapture";
                String version1 = "51.0";
               // String Environ1 = "sandbox";
                String payAction1 = "Authorization";
                String method2 = "DoAuthorization";


                if (statusId3.equalsIgnoreCase("Success")) {


                    //String authorRes[] = PayPalPayments.DoAuthorizationCode(API_username, API_password, API_Signature, method2, amount1, version1, Environ1, transactionId3, currCode1);

                    if (results != null) {

                       // String statusId2 = (String) authorRes[0];
                      //  String authorId = (String) authorRes[1];
                      //  String payAmt = (String) authorRes[2];

                        //log.info("authorId in doAuthorization" + authorId + "satatus Id:" + statusId2 + " Payment amount" + payAmt);

                        String results1[] = PayPalPayments.doCapture(API_username, API_password, API_Signature, method1, amount1, version1, Environ1, payAction1, transactionId3, compType3, inVoiceId3);

                        String statusId1 = (String) results1[0];
                        String ppAuthorizationID = null;
                        if (results1[1] != null) {
                            ppAuthorizationID = (String) results1[1];
                        } else {
                            String correctAction = humanMemb.getErrorDets(errorCd);
                            String finalCorecAction = "";
                            if (correctAction != null && !(correctAction.equalsIgnoreCase(""))) {
                                finalCorecAction = correctAction;
                            } else {
                                finalCorecAction = "NG";
                            }
                            //log.info("Inside Paypal ACtion "+finalSslAvsResponse+"  "+finalSslCvv2Response);
                           // String emailToUSEA=mr.getMessage("hlc.emailid");
                            String emailToUSEA="parasu88@gmail.com";
                            String toMailIds[] = {emailToUSEA, emailId};
                            EmailContent email = new EmailContent();
                            email.setTo(toMailIds);
                            email.setFrom("info@digiblitz.com");
                            String subject=null;
                              if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            subject="Horse Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             subject="Change Rider Owner Decline";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                            subject="Add Rider Owner Decline";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            subject="Not Registered Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            subject="Membership Renewal  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             subject="Membership Registration  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            subject="Education Activity Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             subject="Upgrade Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            subject="Area Membership Decline";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            subject="Event Registration Decline";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                             subject="Annual Meeting Registration Decline";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                               subject="Donation Decline";
                          }
                             else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                               subject="Purchasing Tickets for Area Reception Decline";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              
                          }
                            
                            
                            boolean  emailstatus=false;
                            String fromAddress="info@guildkraft.com";
                  		  String toAddress=pay_e_mail;
                            String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                             subject="Payment Failure"; String textBody="";
                             String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                         			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                         			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/logo.png\" alt=\"Logo\"/></a></td>" +
                         			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                         			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                         			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                         					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Sorry for inconvenience</h4><p style=\"   font-size: 19px;" +
                         					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Invalid Transaction.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                         					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                         					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                         					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                         					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                         					"<strong>First Name</strong><br />"+pay_firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                         					"<strong>Email ID</strong><br />"+pay_e_mail+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                         					"<strong>Message</strong><br /> "+lngMsg+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                         					"<strong>TIME STAMP </strong><br /> "+tmStmp+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                         					"<strong>Error Code</strong><br /> "+errorCd+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                         					"<strong>Amount</strong><br /> "+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                         					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                            try {
                            	
                            	//emails.createContactInfusion(fname, lname, email1);
								int infusionUserId = emails.createAndCheckDuplicateContact(pay_firstname, pay_lastname, pay_e_mail);
						log.info("emailId "+infusionUserId);
								
						InfusionSessionBean.optin_outEmail(pay_e_mail);
         				
                            	
           					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
           				} catch (XmlRpcException e) {
           					// TODO Auto-generated catch block
           					e.printStackTrace();
           				}
                            request.setAttribute("msg", "Payment Declined");
                            request.setAttribute("errorCd", errorCd);
                            request.setAttribute("lngMsg", lngMsg);
                            request.setAttribute("pay_e_mail", pay_e_mail);
                            request.setAttribute("emailId", emailId);
                            request.setAttribute("fName", fName);
                            request.setAttribute("lName", lName);
                            request.setAttribute("instituteName", instituteName);
                            request.setAttribute("Productplan", Productplan);
                           
                            request.setAttribute("plan", plan);
                            /*session.removeAttribute("API_username1");
                            session.removeAttribute("API_password1");
                            session.removeAttribute("API_Signature1");*/
                            session.removeAttribute("currCode1");
                            session.removeAttribute("amount1");
                            //return new ModelAndView("payDecline");
                            return new ModelAndView("signUpFail");
                        }
                        String payInfo = (String) results1[2];
                        String sslTxnId = (String) results1[3];
                        String sslTransactionType = (String) results1[4];
                        String ppPaymentType = (String) results1[5];
                        String payDt = (String) results1[6].replace("%2d", "-");
                        payDt=(String)payDt.replace("%3a",":");
                        String grsAmt = (String) results1[7].replace("%2e", ".");
                        String ppFeeAmt = (String) results1[8].replace("%2e", ".");
                        String ppSettleAmt = (String) results1[9].replace("%2e", ".");
                        String ppTaxAmt = (String) results1[10].replace("%2e", ".");
                        String ppExchangeRate = (String) results1[11];
                        String ppPaymentStatus = (String) results1[12];
                        String ppPendingReason = (String) results1[13];
                        String PP_back1 = (String) results1[14];
                        String sslInvoiceNo = (String) results1[15].replace("%2d", "-");
                        String timeStmp = (String) results1[16];
                        String ppCorrelationID = (String) results1[17];
                        String ppParentTransactionID = (String) results1[18];
                        String ppReasonCode = (String) results1[19];

                        /* log.info("grsAmt::::::"+grsAmt);
                        log.info("ppFeeAmt::::::"+ppFeeAmt);
                        log.info("ppSettleAmt::::::"+ppSettleAmt);
                        log.info("ppTaxAmt::::::"+ppTaxAmt);
                        log.info("sslInvoiceNo::::::"+sslInvoiceNo);
                        log.info("sslTxnId::::::"+sslTxnId);*/


                        /*log.info("results1 in doCapture"+results1); 
                        log.info("statusId1 in doCapture"+statusId1); 
                        log.info("authorId1 in doCapture"+authorId1); 
                        log.info("payInfo in doCapture"+payInfo);  
                        log.info("transacId in doCapture"+transacId);
                        log.info("transacTyp in doCapture"+transacTyp);
                        log.info("payType in doCapture"+payType);
                        log.info("payDt in doCapture"+payDt);
                        log.info("grsAmt in doCapture"+grsAmt);
                        log.info("feAmt in doCapture"+feAmt);
                        log.info("sAmt in doCapture"+sAmt);
                        log.info("tAmt in doCapture"+tAmt);
                        log.info("exRt in doCapture"+exRt);
                        log.info("payStat in doCapture"+payStat);
                        log.info("pendR in doCapture"+pendR);
                        log.info("PP_back1 in doCapture"+PP_back1);
                        log.info("recpId in doCapture"+recpId);
                        log.info("timeStmp in doCapture"+timeStmp);
                        log.info("correlId in doCapture"+correlId);
                        log.info("parentId in doCapture"+parentId);
                        log.info("reasonCode in doCapture"+reasonCode);*/

                        if (session.getAttribute("objPayment") != null && session.getAttribute("objPayment") instanceof HLCPaymentDetails) {
                            log.info("objPayment instanceof PaymentDetails");
                            objPayDet.setPaymentId(objPayment.getPaymentId());
                            objPayDet.setUserId(objPayment.getUserId());
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
                        }

                        objPayDet.setSslResultMessage(sslResultMessage);
                        String sslResult = "0";
                        if (statusId3.equalsIgnoreCase("Success")) {
                            objPayDet.setSslResult(sslResult);
                        } else {
                            sslResult = "1";
                            objPayDet.setSslResult(sslResult);
                        }

                        objPayDet.setSslTxnId(sslTxnId);
                        // objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(String.valueOf(session.getAttribute("emailId")));
                        objPayDet.setPpAuthorizationID(ppAuthorizationID);
                        objPayDet.setPpPaymentType(ppPaymentType);
                        if (ppFeeAmt != null && !(ppFeeAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpFeeAmt(Double.parseDouble(ppFeeAmt));
                        } else {
                            objPayDet.setPpFeeAmt(0);
                        }
                        if (ppSettleAmt != null && !(ppSettleAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpSettleAmt(Double.parseDouble(ppSettleAmt));
                        } else {
                            objPayDet.setPpSettleAmt(0);
                        }
                        if (ppTaxAmt != null && !(ppTaxAmt.equalsIgnoreCase(""))) {
                            objPayDet.setPpTaxAmt(Double.parseDouble(ppTaxAmt));
                        } else {
                            objPayDet.setPpTaxAmt(0);
                        }
                        objPayDet.setPpExchangeRate(ppExchangeRate);
                        objPayDet.setPpPaymentStatus(ppPaymentStatus);
                        objPayDet.setPpPendingReason(ppPendingReason);
                        objPayDet.setPpCorrelationID(ppCorrelationID);
                        objPayDet.setPpParentTransactionID(ppParentTransactionID);
                        objPayDet.setPpReasonCode(ppReasonCode);
                        objPayDet.setInVoiceID(inVoiceId3);
                        objPayDet.setAmount(Double.parseDouble(amount1));

                        //log.info("objPayDet in servlet:" + objPayDet);
                        // }

                        //if(results!=null){
                        String statusId = (String) results[0];
                        String correlationId = (String) results[1];
                        String transactionId = (String) results[2];
                        String ppAmt = (String) results[3];
                        String avsCode = (String) results[4];
                        String cvv2 = (String) results[5];
                        String inVoiceId = (String) results[6];


                        log.info("statusId:" + statusId);
                      //  log.info("payDt:"+payDt);
                      //  log.info("invoiceid3:"+inVoiceId3);
                      //  log.info("amount:"+amount1);
                     //  log.info("ppFeeAmount:"+ppFeeAmt);
                         //log.info("transactionId:" + transactionId);
                        session.setAttribute("statusId3", statusId3);
                        session.setAttribute("statusId", statusId);
                        session.setAttribute("objPayDet", objPayDet);
                        request.setAttribute("transactionId", transactionId);
                        /*if (statusId.equalsIgnoreCase("Success")) {
                        boolean resultPay = objPaySessRemote.createPayment(objPayDet);
                        request.setAttribute("result", String.valueOf(resultPay));
                        log.info("resultPay in PayPalAction::::::" + resultPay);
                        String ccNumber1 = "";
                        if (!(objPayment.getCcNumber().equals("0"))) {
                        String temp = objPayment.getCcNumber().substring(0, 2);
                        String temp1 = objPayment.getCcNumber().substring(2, 12);
                        String temp2 = objPayment.getCcNumber().substring(12);
                        temp1 = "***";
                        ccNumber1 = temp + temp1 + temp2;
                        }*/
                         
                        //String emailToUSEA=mr.getMessage("hlc.emailid");
                        String emailToUSEA="parasu88@gmail.com";
                        String toMailIds[] = {emailToUSEA,emailId};
                        EmailContent email = new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@digiblitz.com");
                        email.setSubject("Payment Details");
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
                        "<p>Payment has been made successfully and the details are as follows:<p>" +
                        "<span class=\"boldTxt\">Payment Details:</span></p>" +
                        "Payment Date:" + payDt + " <br/>" +
                        "Invoice ID:" + inVoiceId3 + "<br/>" +
                        "Amount:" + amount1 + "<br/>" +
                        "Fee Amount:" + ppFeeAmt + "<br/>" +
                        "cc Name: " + ccType + "<br/>" +
                        "cc Number:" + acct+ "<br/>" +
                        "Email ID:" + emailId + "<br/></p>" +
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
                        MailMail mail = new MailMail();
                        boolean emailFlag = mail.sendMimeEmail(email);
                        log.info("Email sent sucessfully :" + emailFlag);
                        
                        
                        /*-----------WELCOME MAIL----------*/
                        EmailContent welcome_email = new EmailContent();
                        welcome_email.setTo(toMailIds);
                        welcome_email.setFrom("info@digiblitz.com");
                        welcome_email.setSubject("Welcome");
                        String welcome_content = "<table align=\"center\" width=\"500px\" cellspacing=\"5\" bgcolor =\"#CCCCCC\">"+
                                "<tr>"+
                        		"<td height=\"122\" colspan=\"3\" align=\"left\">"+
                        		"<p>"+"Hi,"+
                        		  "<br>"+
                        		  "We are glad to know your interest in guldKraft: An Associations Management System powered by ELMT"+
                        		  "<p>"+
                                  "<p>"+
                                  "<font color=\"red\">"+
                                  "Not just a CRM. It"+"&rsquo;s  "+" an AMS powered by  CRM, ERP and BPM"+
                                  "</font>"+
                                  "</p>"+
                              "</td>"+
                              "</tr>"+
                              "<tr align=\"left\">"+
                              "<td width=\"49%\" height=\"155\">"+
                              "<br>"+
                              "<br>"+
                              "<br>"+
                              "<h4>"+
                              "<font color=\"red\">"+
                              "Finance & HR Processes"+
                              "</font>"+
                              "</h4>"+
                                "<p>"+
                                "guikdKraft allows you to create, modify and optimize assets and project budgets. " +
                                "The system will provide you with resource costing aggregated by projects and suppliers." +
                                " Your human resources management is now automated seamlessly and work effectively with other organizational processes."+
                                "</p>"+  
                                "</td>"+
                                "<td width=\"7%\">"+
                                "<b>"+"What would you enjoy using our product?"+
                                "</b>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "<br>"+
                                "</td>"+
                                "<td width=\"44%\" height=\"155\">"+
                                "<br>"+"<br>"+"<br>"+
                                "<h4>"+
                                "<font color=\"red\">"+
                                "Automated Work Flow"+
                                "</font>"+
                                "</h4>"+
                                "<p>"+
                              "Fully Automated Work Flow through our state-of-the-art BPM process template dBBPM. Automated Communications between the stakeholders makes the   system completely effective in closing the positions quick. In-built Modeller to create custom business process."+
                                "</p>"+   
                              "</td>"+

                              "</tr>"+
                              "<tr align=\"left\">"+
                              "<td height=\"50\">"+
                              "<p>"+
                              "<font color=\"red\">"+"WHAT"+"&rsquo;S  "+"BEST ABOUT guildKraft?"+
                              "</font>"+
                              "</p>"+
                              "</TD>"+
                              "</tr>"+
                              "<tr>"+
                              "<td height=\"100\">"+
                              "<P>"+
                              "<ul>"+
                              "<li type =\"square\">"+"Accounts Receivable/Payables"+"<BR>"+
                              "<li type =\"square\">"+	"Human Asset Management"+"</li>"+
                              "<li type =\"square\">"+"Budget Control"+"</li>"+
                              "<li type =\"square\">"+"Sales Mark-up"+"</li>"+"</ul>"+"</P>"+
                              "</td>"+
                              "<td>"+"</td>"+"<td>"+"<P>"+"<ul>"+"<li type =\"square\">"+	"Integration to third-party tools"+"<BR>"+"</li>"+
                              "<li type =\"square\">"+"Invoice Automation"+"</li>"+
                              "<li type =\"square\">"+"Aggregated reports"+"</li>"+
                              "<li type =\"square\">"+"Financial & HR Score Cards"+"</li>"+"</ul>"+"</P>"+
                              "</td>"+"</tr>"+
                              "<tr>"+"<td height=\"100\" colspan=\"3\">"+
                              "<P>"+
							  "You will be contacted by our support  executives shortly to take you for a "+
							  "<BR>"+"virtual walk explain the product"+"&rsquo;s  "+"features and functionality."+"<BR>"+"<BR>"+ "<BR>"+ "<BR>"+ "You can reach us anytime at support@guildkraft.com "+"<BR>"+ "<BR>"+
							  "Talk to us at: +1-571-297-2288"+
                               
                                       "</td>"+"</tr>"+
                                      "</table>";
                        
                       
                        
                        
                        welcome_email.setBody(welcome_content);
                        MailMail wel_mail = new MailMail();
                        //boolean wel_emailFlag = wel_mail.sendMimeEmail(welcome_email);
                        //log.info("Email sent sucessfully :" + wel_emailFlag);
                        

 
                       
                        
                        /*request.setAttribute("correlationId", correlationId);
                        request.setAttribute("transactionId", transactionId);
                        request.setAttribute("ppAmt", amount);
                        request.setAttribute("avsCode", avsCode);
                        request.setAttribute("cvv2", cvv2);
                        request.setAttribute("INVId", inVoiceId);
                        session.removeAttribute("API_username1");
                        session.removeAttribute("API_password1");
                        session.removeAttribute("API_Signature1");
                        session.removeAttribute("currCode1");
                        session.removeAttribute("amount1");
                        }*/
                        log.info("purpose here: " + purpose);
                        if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            session.setAttribute("purpose","newhorseregistration");
                            forwardPage = "horseRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             session.setAttribute("purpose","horseriderownerchange");
                            forwardPage = "riderOwnerChange";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                             session.setAttribute("purpose","addriderowner");
                            forwardPage = "addRiderOwner";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            session.setAttribute("purpose","notregisteredhorse");
                            forwardPage = "notRegisteredHorse";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            session.setAttribute("purpose","membershiprenewal");
                            forwardPage = "membershipRenewal";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                            session.setAttribute("purpose","memberregistration");
                            //forwardPage = "memberRegistration";
                            forwardPage = "paySuccess";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            forwardPage = "educationRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             session.setAttribute("purpose","upgradehorse");
                            forwardPage = "upgradeHorseRegistration";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            forwardPage = "AreaMembership";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            forwardPage = "EndorsedFormRegistration";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                            forwardPage = "annualMeetingRegistration";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                        else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                             session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                        
                        else {

                            
                        	forwardPage = "paySuccess";
                        }
                        String status=null;
                       // boolean regiStatus=(Boolean) null;
                        String userid=db.getuseridbyemail(pay_e_mail);
                        if(userid != null && forwardPage.equalsIgnoreCase("paySuccess")){
                            status=db.updateusersignup(pay_firstname,pay_lastname,pay_e_mail,pay_mobileno,pay_institutionName,pay_country,pay_state, pay_city, pay_credit_card_type, pay_credit_card_no, pay_cvv_no, pay_name_on_card, pay_expiry_date, pay_productPrice,monthYear,Productplan,plan,fee,pay_addrline1,pay_addrline2,pay_total_amount,offer,transactionId); 
                           }else{
                             //status=db.insertsignup(pay_firstname,pay_lastname,pay_e_mail,pay_mobileno,pay_institutionName,pay_country,pay_state, pay_city, pay_credit_card_type, pay_credit_card_no, pay_cvv_no, pay_name_on_card, pay_expiry_date, pay_productPrice,monthYear,Productplan,plan,fee,pay_addrline1,pay_addrline2,pay_total_amount,offer);
                           //qa.mail(e_mail);
                        	   status=db.insertsignup(pay_firstname,pay_lastname,pay_e_mail,pay_mobileno,pay_institutionName,pay_country,pay_state, pay_city, pay_credit_card_type, pay_credit_card_no, pay_cvv_no, pay_name_on_card, pay_expiry_date, pay_productPrice,monthYear,Productplan,plan,fee,pay_addrline1,pay_addrline2,pay_total_amount,offer,transactionId);
                              // regiStatus = db.insertPreMemRegi(pay_event_title,pay_userId1,pay_start_date,pay_end_date);	
                           }
                        if(status != null){
                        	
                        	ArrayList cuslist=db.getcusdetails(pay_e_mail);
                        	Iterator it=cuslist.iterator();
                        	while(it.hasNext()){
                        		String[] s=(String[])it.next();
                        		 subid=s[0];
                        		 ordid=s[1];
                        		 cusid=s[2];
                        		 log.info(" parasu subid"+subid);
                        		 log.info("parasu ordid"+ordid);
                        		 log.info("parasu cusid"+cusid);
                        		
                        		 boolean  emailstatus=false;
                                 String fromAddress="info@guildkraft.com";
                       		  String toAddress=pay_e_mail;
                                 String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                                 String subject="Payment Success"; String textBody="";
                                 String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                               			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                               			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/logo.png\" alt=\"Logo\"/></a></td>" +
                               			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                               			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                               			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                               					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Congratulations User!</h4><p style=\"   font-size: 19px;" +
                               					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">You have finished setting up your account.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                               					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login to Your Account</span></a></td>" +
                               					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                               					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                               					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                               					"<strong>First Name</strong><br />"+pay_firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                               					"<strong>Email ID</strong><br />"+pay_e_mail+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                               					"<strong>Transaction ID</strong><br /> "+transactionId+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                               					"<strong>Subscription ID </strong><br /> "+subid+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                               					"<strong>Order ID</strong><br /> "+ordid+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                               					"<strong>Customer ID</strong><br /> "+cusid+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                               					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                                 try {
                                	 
                                	//emails.createContactInfusion(fname, lname, email1);
     								int infusionUserId = emails.createAndCheckDuplicateContact(pay_firstname, pay_lastname, pay_e_mail);
     						log.info("emailId "+infusionUserId);
     								
     						InfusionSessionBean.optin_outEmail(pay_e_mail);
     						
                					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
                				} catch (XmlRpcException e) {
                					// TODO Auto-generated catch block
                					e.printStackTrace();
                				}
                        	}
                        session.setAttribute("transactionId", transactionId);
                        session.setAttribute("emailId", emailId);
                        session.setAttribute("fName", fName);
                        session.setAttribute("lName", lName);
                        session.setAttribute("instituteName", instituteName);
                        session.setAttribute("Productplan", Productplan);
                        session.setAttribute("cus_id", cusid);
                        session.setAttribute("ord_id", ordid);
                        session.setAttribute("plan", plan);
                        }
                       
                        return new ModelAndView("paySuccess"); 
                       
                    }
                /*else if (statusId3.equalsIgnoreCase("Failure")) {
                log.info("Inside Failure11111");
                String correctAction = remote.getErrorDets(errorCd);
                String finalCorecAction = "";
                if (correctAction != null && correctAction.equalsIgnoreCase("")) {
                finalCorecAction = correctAction;
                } else {
                finalCorecAction = "NG";
                }
                String toMailIds[] = {"payments@useventing.com"};
                EmailContent email = new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("dashboard@useventing.com");
                email.setSubject("Donation");
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
                "TIMESTAMP:" + tmStmp + " <br/>" +
                "L_ERRORCODE0:" + errorCd + "<br/>" +
                "L_LONGMESSAGE0:" + lngMsg + "<br/>" +
                "AMT:" + amount + "<br/>" +
                "AVSCODE: " + sslAvsResponse + "<br/>" +
                "CVV2MATCH:" + sslCvv2Response + "<br/>" +
                "Corrective action:" + finalCorecAction + "<br/></p>" +
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
                log.info("Email sent sucessfully :" + emailFlag);
                request.setAttribute("msg", "Payment Declined");
                request.setAttribute("errorCd", errorCd);
                request.setAttribute("lngMsg", lngMsg);
                session.removeAttribute("API_username1");
                session.removeAttribute("API_password1");
                session.removeAttribute("API_Signature1");
                session.removeAttribute("currCode1");
                session.removeAttribute("amount1");
                return mapping.findForward("payDecline");
                }*/
                } else {
                    log.info("Inside Failure");
                    log.info("Inside Failure22222");

                    String correctAction = humanMemb.getErrorDets(errorCd);
                    log.info("Inside correctAction"+correctAction);
                    String finalCorecAction = "";

                    if (correctAction != null || !(correctAction.equalsIgnoreCase(""))) {
                        finalCorecAction = correctAction;
                    } else {
                        finalCorecAction = "NG";
                    }
                    payRes.setFinalCorecAction(finalCorecAction);
                    session.setAttribute("payRes", payRes);
                    session.setAttribute("statusId3", statusId3);
                    //log.info("Inside Paypal ACtion "+finalSslAvsResponse+"  "+finalSslCvv2Response);
                    // String emailToUSEA=mr.getMessage("hlc.emailid");
                     String emailToUSEA="parasu88@gmail.com";
                     String toMailIds[] = {emailToUSEA, emailId};
                    EmailContent email = new EmailContent();
                    email.setTo(toMailIds);
                    email.setFrom("info@digiblitz.com");
                    String subject=null;
                              if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                            subject="Horse Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                             subject="Horse Rider/Owner Change Decline";
                           
                        } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                            subject="Add Rider/Owner Decline";
                        } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                            subject="Not Registered Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                            subject="Membership Renewal  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             subject="Membership Registration  Decline";
                        } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                            subject="Education Activity Registration Decline";
                        } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                             subject="Upgrade Horse Decline";
                        } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                            subject="Area Membership Decline";
                        }
                       else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            subject="Event Registration Decline";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                             subject="Annual Meeting Registration Decline";
                           } 
                          else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                               subject="Donation Decline";
                          }
                         else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                               subject="Purchasing Tickets for Area Reception Decline";
                          }
                          else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              
                          }
                            

                              boolean  emailstatus=false;
                              String fromAddress="info@guildkraft.com";//sorry for inconvenience
                    		  String toAddress=pay_e_mail;
                              String ccAddresses="finance@digiblitz.com,sales@digiblitz.com"; String bccAddresses="";  String contentType="HTML/TEXT"; 
                               subject="Payment failure"; String textBody="";
                              String htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                            			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                            			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/logo.png\" alt=\"Logo\"/></a></td>" +
                            			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                            			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                            			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                            					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Sorry for inconvenience, Your Payment has Failed</h4><p style=\"   font-size: 19px;" +
                            					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Invalid Transaction.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                            					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                            					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                            					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                            					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                            					"<strong>First Name</strong><br />"+pay_firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                            					"<strong>Email ID</strong><br />"+pay_e_mail+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                            					"<strong>Message</strong><br /> "+lngMsg+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                            					"<strong>TIME STAMP </strong><br /> "+tmStmp+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                            					"<strong>Error Code</strong><br /> "+errorCd+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                            					"<strong>Amount</strong><br /> "+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                            					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                              try {
             					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
             				} catch (XmlRpcException e) {
             					// TODO Auto-generated catch block
             					e.printStackTrace();
             				}
                    /* session.removeAttribute("API_username1");
                    session.removeAttribute("API_password1");
                    session.removeAttribute("API_Signature1");
                    session.removeAttribute("currCode1");
                    session.removeAttribute("amount1");*/
                    
                    log.info("purpose in decline: " + purpose);
                    if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                        session.setAttribute("purpose","newhorseregistration");
                        forwardPage = "horseRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                        session.setAttribute("purpose","horseriderownerchange");
                        forwardPage = "riderOwnerChange";
                    } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                        session.setAttribute("purpose","addriderowner");
                        forwardPage = "addRiderOwner";
                    } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                        session.setAttribute("purpose","notregisteredhorse");
                        forwardPage = "notRegisteredHorse";
                    } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                        session.setAttribute("purpose","membershiprenewal");
                        forwardPage = "membershipRenewal";
                    } else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                        session.setAttribute("purpose","memberregistration");
                        forwardPage = "memberRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                        forwardPage = "educationRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                         session.setAttribute("purpose","upgradehorse");
                        forwardPage = "upgradeHorseRegistration";
                    } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                        forwardPage = "AreaMembership";
                    } 
                     else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                            forwardPage = "EndorsedFormRegistration";
                           }
                          else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                            forwardPage = "annualMeetingRegistration";
                           } 
                    else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                     else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                     else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                              session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                    else {
                        //forwardPage = "payDecline";
                        forwardPage = "signUpFail";
                    }
                    
                    if(forwardPage.equalsIgnoreCase("signUpFail")){
                    	
                    	   emailstatus=false;
                          fromAddress="info@guildkraft.com";
               		   toAddress=pay_e_mail;
                          ccAddresses="finance@digiblitz.com,sales@digiblitz.com";  bccAddresses="";   contentType="HTML/TEXT"; 
                         String subject1="Payment failure";  textBody="";
                          htmlBody="<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                     			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                     			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/logo.png\" alt=\"Logo\"/></a></td>" +
                     			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                     			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                     			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                     					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Sorry for inconvenience, Your Payment has Failed</h4><p style=\"   font-size: 19px;" +
                     					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">Invalid Transaction.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                     					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login Again</span></a></td>" +
                     					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                     					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                     					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>First Name</strong><br />"+pay_firstname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Email ID</strong><br />"+pay_e_mail+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                     					"<strong>Message</strong><br /> "+lngMsg+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"<strong>TIME STAMP </strong><br /> "+tmStmp+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"<strong>Error Code</strong><br /> "+errorCd+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"<strong>Amount</strong><br /> "+amount+"</p><p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\"> " +
                     					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                         try {
        					 emailstatus=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject1, htmlBody, textBody);
        				} catch (XmlRpcException e) {
        					// TODO Auto-generated catch block
        					e.printStackTrace();
        				}
                    }
                    request.setAttribute("pay_e_mail", pay_e_mail);
                    request.setAttribute("lngMsg", lngMsg);
                    request.setAttribute("msg", "Payment Declined");
                    request.setAttribute("fName", fName);
                    request.setAttribute("lName", lName);
                    request.setAttribute("instituteName", instituteName);
                    request.setAttribute("emailId", emailId);
                    request.setAttribute("Productplan", Productplan);
                    request.setAttribute("plan", plan);
                    return new ModelAndView("signUpFail"); 
                }
            } else {
                /*request.setAttribute("msg", "Payment Already Made");
                session.removeAttribute("API_username1");
                session.removeAttribute("API_password1");
                session.removeAttribute("API_Signature1");
                session.removeAttribute("currCode1");
                session.removeAttribute("amount1");
                return mapping.findForward("payDecline");*/
               
                session.setAttribute("statusId3", statusId3);
                log.info("purpose in result null: " + purpose);

                if (purpose.trim().equalsIgnoreCase("newhorseregistration")) {
                   session.setAttribute("purpose","newhorseregistration");  
                    forwardPage = "horseRegistration";
                } else if (purpose.trim().equalsIgnoreCase("horseriderownerchange")) {
                    session.setAttribute("purpose","horseriderownerchange");
                    forwardPage = "riderOwnerChange";
                } else if (purpose.trim().equalsIgnoreCase("addriderowner")) {
                     session.setAttribute("purpose","addriderowner");
                    forwardPage = "addRiderOwner";
                } else if (purpose.trim().equalsIgnoreCase("notregisteredhorse")) {
                    session.setAttribute("purpose","notregisteredhorse");  
                    forwardPage = "notRegisteredHorse";
                } else if (purpose.trim().equalsIgnoreCase("membershiprenewal")) {
                     session.setAttribute("purpose","membershiprenewal");
                    forwardPage = "membershipRenewal";
                } else if (purpose.trim().equalsIgnoreCase("educationregistration")) {
                    forwardPage = "educationRegistration";
                } else if (purpose.trim().equalsIgnoreCase("upgradehorse")) {
                    session.setAttribute("purpose","upgradehorse"); 
                    forwardPage = "upgradeHorseRegistration";
                } else if (purpose.trim().equalsIgnoreCase("areaMemb")) {
                    forwardPage = "AreaMembership";
                } 
                else if (purpose.trim().equalsIgnoreCase("endorsedForm")) {
                    forwardPage = "EndorsedFormRegistration";
                }
                else if (purpose.trim().equalsIgnoreCase("annualmeetingreg")) {
                forwardPage = "annualMeetingRegistration";
                }
                else if(purpose.trim().equalsIgnoreCase("newDonation"))
                          {
                              forwardPage="donateServe";
                          }
                else if (purpose.trim().equalsIgnoreCase("memberregistration")) {
                             session.setAttribute("purpose","memberregistration");
                            forwardPage = "memberRegistration";
                        }
                 else if(purpose.trim().equalsIgnoreCase("endorsedRetryForm"))
                          {
                              forwardPage="EndorsedFormRetryRegistration";
                          }
                 else if(purpose.trim().equalsIgnoreCase("purchasingTickets"))
                          {
                              session.setAttribute("purpose","purchasingTickets");
                              forwardPage="addtnlTcktsPurchase";
                          }  
                else {
                    //forwardPage = "payDecline";
                	forwardPage = "signUpFail";
                }
                request.setAttribute("pay_e_mail", pay_e_mail);
                request.setAttribute("fName", fName);
                request.setAttribute("lName", lName);
                request.setAttribute("instituteName", instituteName);
                request.setAttribute("emailId", emailId);
                request.setAttribute("Productplan", Productplan);
                request.setAttribute("plan", plan);
                
                return new ModelAndView(forwardPage); 

            }

        } catch (Exception e) {
            System.out.print("in the catch block");
            e.printStackTrace();
            String firName = request.getParameter("FIRSTNAME"); 
            String lasName = request.getParameter("LASTNAME");
            String insName = request.getParameter("INSTITUTENAME");
            String eId = request.getParameter("EMAIL");
            String Proplan = request.getParameter("Productplan");
            String planss = request.getParameter("plan");
            request.setAttribute("fName", firName);
            request.setAttribute("lName", lasName);
            request.setAttribute("instituteName", insName);
            request.setAttribute("emailId", eId);
            request.setAttribute("Productplan", Proplan);
            request.setAttribute("plan", planss);
            return new ModelAndView("signUpFail"); 
            
        }
        return null;

    }
}

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
package com.intuit.oauthsample;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oauth.signpost.OAuth;
import oauth.signpost.OAuthConsumer;
import oauth.signpost.http.HttpParameters;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.db.GeneralDBAction;
import com.intuit.ipp.core.Context;
import com.intuit.ipp.core.ServiceType;
import com.intuit.ipp.data.Customer;
import com.intuit.ipp.data.EmailAddress;
import com.intuit.ipp.data.TelephoneNumber;
import com.intuit.ipp.data.Vendor;
import com.intuit.ipp.security.OAuthAuthorizer;
import com.intuit.ipp.services.DataService;

@Controller
public class AccessTokenServletTest {
	
Logger logger = LoggerFactory.getLogger("AccessTokenServletTest.class");
	
	public AccessTokenServletTest() {
		super();
	}
	
	@RequestMapping("/AccessTokenTest.html")
	public ModelAndView helloWorld(HttpServletRequest request,
			HttpServletResponse response){
		
		GeneralDBAction db=new GeneralDBAction();
		
		logger.info("AccessTokenServlet");
		OAuthUtils utils = new OAuthUtils();
		Properties prop = utils.readProperties();

		try{
			
		HttpSession session = request.getSession();
		
		// The realm Id is returned in the callback and read into the session
		String realmID = request.getParameter("realmId");
		System.out.println("realmID:::::::"+realmID);
		session.setAttribute("realmId", realmID);

		OAuthConsumer oauthconsumer = (OAuthConsumer) session.getAttribute("oauthConsumer");


		HttpParameters additionalParams = new HttpParameters();
		additionalParams.put("oauth_callback", OAuth.OUT_OF_BAND);
		additionalParams.put("oauth_verifier", request.getParameter("oauth_verifier"));
		System.out.println("oauth_verifier::::::::"+request.getParameter("oauth_verifier"));
		oauthconsumer.setAdditionalParameters(additionalParams);
		
		
		// Sign the call to retrieve the access token request
		String signedURL = oauthconsumer.sign(OAuthUtils.ACCESS_TOKEN_URL);
		URL url = new URL(signedURL);

		HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
		urlConnection.setRequestMethod("GET");

		String accesstokenresponse = "";
		String accessToken, accessTokenSecret = "";
		if (urlConnection != null) {
			BufferedReader rd = new BufferedReader(new InputStreamReader(
					urlConnection.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
				System.out.println(sb.toString());
			}
			rd.close();
			accesstokenresponse = sb.toString();
		}
		if (accesstokenresponse != null) {
			String[] responseElements = accesstokenresponse.split("&");
			if (responseElements.length > 1) {
				accessToken = responseElements[1].split("=")[1];
				accessTokenSecret = responseElements[0].split("=")[1];
				logger.info("OAuth accessToken: " + accessToken);
				logger.info("OAuth accessTokenSecret: " + accessTokenSecret);
				Map<String, String> accesstokenmap = new HashMap<String, String>();
				accesstokenmap.put("accessToken", accessToken);
				accesstokenmap.put("accessTokenSecret", accessTokenSecret);
				session.setAttribute("accessToken", accesstokenmap.get("accessToken"));
				session.setAttribute("accessTokenSecret", accesstokenmap.get("accessTokenSecret"));
				System.out.println("prabhu here===================");
				//response.sendRedirect("/OauthSampleQuickbooks/connected.jsp");
				
							
							
				OAuthAuthorizer oauth = new OAuthAuthorizer(prop.getProperty("oauth_consumer_key"), prop.getProperty("oauth_consumer_secret"), accessToken, accessTokenSecret);
				
				String appToken = "a4449a5fb5d0eb4fd4ba04ebe0a309e3a4a8";
				String companyID = realmID;  // need to create a company in quickbook connect first.
				System.out.println("prabhu here===================  1");
				Context context = new Context(oauth, appToken, ServiceType.QBO, companyID);
				System.out.println("prabhu here===================  2");
				DataService service = new DataService(context);
				System.out.println("prabhu here===================  3");
				Customer customer=new Customer();
				//Vendor vendor = new Vendor();
				
				
				
				ArrayList customerList = db.getCustomerList();
				int membercount = 0;
								
				if(customerList != null){
					Iterator itr = customerList.iterator();
					while(itr.hasNext()){
						String strarr[] = (String[])itr.next();
						
						String first_name = strarr[0];
		                String middle_name = strarr[1];
		                String last_name = strarr[2];
		                String email_id = strarr[3];
		                
		                String payment_id = strarr[4];
		                String cc_name = strarr[5];
		                String cc_type = strarr[6];
		                String cc_number = strarr[7];
		                String cc_exp_month = strarr[8];
		                String cc_exp_year = strarr[9];
		                String bank_name = strarr[10];
		                String check_date = strarr[11];
		                String check_number = strarr[12];
		                String check_name = strarr[13];
		                String amount = strarr[14];
		                String payment_date = strarr[15];
		                String payment_status = strarr[16];
		                String check_amount = strarr[17];
		                String pending_amount = strarr[18];
		                String invoice_id = strarr[19];
		                String payment_type = strarr[20];
		                
		                String address1 = strarr[21];
		                String address2 = strarr[22];
		                String city = strarr[23];
		                String state = strarr[24];
		                String country = strarr[25];
		                String zip = strarr[26];
		                String phone_no = strarr[27];
		                String mobile_no = strarr[28];
		                String fax_no = strarr[29];
		                
		                String transaction_id = strarr[30];
		                String account_type = strarr[31];
		                String account_no = strarr[32];
		                String payment_mode = strarr[33];
		                String description = strarr[34];
		                String classs = strarr[35];
		                String accamount = strarr[36];
		                String transaction_mode = strarr[37];
		                String transaction_date = strarr[38];
		                String user_id = strarr[39];
		                
		                logger.info("account_no "+account_no+" first_name "+first_name+" last_name "+last_name+" transaction_id "+transaction_id);
		                
						customer.setAcctNum(account_no);
						customer.setContactName(first_name);
						customer.setDisplayName(first_name+" "+last_name);
						customer.setFullyQualifiedName(first_name+" "+last_name);
						customer.setGivenName(first_name+" "+last_name);
						customer.setFamilyName(last_name);
						
						//id should be a valid number. Supplied value:E3629228-FFD2-4880-A447-9D86E129291B
						//customer.setId(transaction_id);
						
						logger.info("mobile_no "+mobile_no+" email_id "+email_id);
						
						TelephoneNumber teleNo = new TelephoneNumber();
						teleNo.setAreaCode("044");
						teleNo.setCountryCode("91");
						teleNo.setFreeFormNumber(mobile_no);
						customer.setMobile(teleNo);
												
						EmailAddress emailadd = new EmailAddress();
						emailadd.setAddress(email_id);
						
						service.add(customer);
						
						boolean updateQBstatus = db.updateQBStatus(user_id);
						membercount++;
						
					}
				}
				
				String memberCount = Integer.toString(membercount);
				
				request.setAttribute("membercount", memberCount);
				
				return new ModelAndView("../QB_jsp/connected");
				
				/*customer.setAcctNum("11111111111111");
				customer.setContactName("Amalesh");
				customer.setDisplayName("Prabhu P");
				customer.setFullyQualifiedName("Prabhu P");
				customer.setGivenName("prabhu");
				customer.setFamilyName("P");
				customer.setId("1100");
				
				TelephoneNumber teleNo = new TelephoneNumber();
				teleNo.setAreaCode("044");
				teleNo.setCountryCode("91");
				teleNo.setFreeFormNumber("9600217212");
				customer.setMobile(teleNo);
				
				service.add(customer);*/
				
							
				//customer.setId("2");
				//customer.setDisplayName("Miya Georgee");
				
				//Customer resultCustomer = service.add(customer);
				
				//Customer resultCustomer = service.findById(customer);
				
								
				//response.sendRedirect("https://qbo.intuit.com/app/vendors");
				/*List<Vendor> vendors = service.findAll(vendor);
				Iterator itr = vendors.iterator();
				String vendorName = null;
				while (itr.hasNext()) {
					vendor = (Vendor) itr.next();
				   vendorName = vendor.getDisplayName();
				   System.out.println("customer name : "+vendorName);
				   
				   }
				request.setAttribute("customerName", vendorName);
				
				return new ModelAndView("connected");
				*/
				
				//System.out.println("Prabhu here--------------------"+resultCustomer);
				//System.out.println("Prabhu here for getting value---------------"+resultCustomer.getFullyQualifiedName());
			}
		}

	} catch (Exception e) {
		logger.error(e.getLocalizedMessage());
		e.printStackTrace();
	}
		System.out.println("last return");
		return new ModelAndView("../QB_jsp/connected");

}
		
		
	

}

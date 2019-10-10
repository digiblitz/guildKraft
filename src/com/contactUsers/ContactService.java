/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
package com.contactUsers;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.jws.WebService;

import com.db.GeneralDBAction;
import com.suitecrm.session.DBCRMSessionBean;


@WebService(endpointInterface="com.contactUsers.ContactServiceInterface")
public class ContactService implements ContactServiceInterface {

	/*String firstName = null;
	String lastName = null;
	String emailId = null;
	String phoneNo = null;
	String companyName = null;
	String description = null;
	String status = null;
	*/
	DBCRMSessionBean dbcrm = new DBCRMSessionBean();
	ContactEmailContent contactEmailContent = new ContactEmailContent();
	ContactUserCRMMethods contactUserCRMMethods = new ContactUserCRMMethods();
	GeneralDBAction generalDB = new GeneralDBAction();
		
	@Override
	public boolean sendEmail(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description, String status
			, String consultation, String freeDemo, String webinar, String mailingList, 
			String contactFormType) {
		// TODO Auto-generated method stub
		
		boolean emailFlag = false;
		
		try{		
			emailFlag = contactEmailContent.sendEmail(firstName, lastName, emailId,
					phoneNo, companyName, description, status, consultation, freeDemo,
					webinar, mailingList, contactFormType);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return emailFlag;
	}

	@Override
	public String suiteCRMTarget(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description) {
		// TODO Auto-generated method stub
		
		/*firstName = contactUser.getFirstName();
		lastName = contactUser.getLastName();
		emailId = contactUser.getEmailId();
		phoneNo = contactUser.getPhoneNo();
		companyName = contactUser.getCompanyName();
		description = contactUser.getDescription();*/
		
  		String status1 = null;
  		
  		try{
  			status1 = contactUserCRMMethods.suiteCRMTarget(firstName, lastName, emailId, phoneNo, companyName, description);
  			System.out.println("status1 ---> "+status1);
  			 	  		
  		}catch(Exception e){
  			e.printStackTrace();
  		}
  		

  		
  		/*dbcrm.addLeadsToDBCRM(email, description, salutation, firstName, last_name, title, 
  				department, phone_home, phone, phone_work, phone_other, phone_fax, 
  				primary_address_street, primary_address_city, primary_address_state, 
  				primary_address_postalcode, primary_address_country, alt_address_street, 
  				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
  				assistant, assistant_phone, converted, account_name, contact_id, account_id, 
  				opportunity_id, opportunity_name, opportunity_amount, campaign_id, birthdate, 
  				website);*/
  	
  		
  		
		return status1;
	}

	@Override
	public String suiteCRMLead(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description) {
		// TODO Auto-generated method stub
		
		/*firstName = contactUser.getFirstName();
		lastName = contactUser.getLastName();
		emailId = contactUser.getEmailId();
		phoneNo = contactUser.getPhoneNo();
		companyName = contactUser.getCompanyName();
		description = contactUser.getDescription();*/
		
		
   		
   		boolean leadFlag = false;
   		String status1 = null;
   		
   		try{   			
   			status1 = contactUserCRMMethods.suiteCRMLead(firstName, lastName, emailId, phoneNo, companyName, description);
   		}catch(Exception e){
   			e.printStackTrace();
   		}
   		
   		if(leadFlag == true){
   			status1 = "Success";
   		}else{
   			status1 = "NotSuccess";
   		}
		
		
		return status1;
	}

	@Override
	public void startNewsLetterPublishing() {
		// TODO Auto-generated method stub
		
		ArrayList<String> newsLetterList = null;
		String newsLetterEmail = null;
		
		Date newsLetterSendDate = null;
 	   String strnewsLetterSendDate = null;
 	  SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
 	   Date currDate = null;
 	   String strCurrDate = null;
 	   int dateValue = 0;
 	   
		try{
			newsLetterList = new ArrayList<String>();
			
			 newsLetterSendDate = generalDB.getWeeklyNewsLettreSendDate();
	  		   strnewsLetterSendDate = formatter.format(newsLetterSendDate);
	  		   
	  		   currDate = new Date();
	  		 strCurrDate = formatter.format(currDate);
			
	  		if(dateValue != 0 && dateValue != -1){
	  			System.out.println("yes");
	  			newsLetterList = generalDB.getNewsLetterEmail();
	  			

				if(newsLetterList != null && newsLetterList.size() != 0){
					
					Iterator<String> itr = newsLetterList.iterator();
					while(itr.hasNext()){
						newsLetterEmail = itr.next();
						System.out.println("newsLetterEmail --> "+newsLetterEmail);
					}				
				}
				
				
	  		   }else{
	  			   System.out.println("no");
	  		   }
			
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}

}

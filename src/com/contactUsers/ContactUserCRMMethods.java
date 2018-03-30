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
package com.contactUsers;

import com.suitecrm.session.DBCRMSessionBean;

public class ContactUserCRMMethods {

	DBCRMSessionBean dbcrm = new DBCRMSessionBean();
	
	public String suiteCRMTarget(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description) {
		// TODO Auto-generated method stub
		
		/*firstName = contactUser.getFirstName();
		lastName = contactUser.getLastName();
		emailId = contactUser.getEmailId();
		phoneNo = contactUser.getPhoneNo();
		companyName = contactUser.getCompanyName();
		description = contactUser.getDescription();*/
		
		String salutation = "";   		
  		String last_name = ""; 
  		String title = "";
  		String department = ""; 
  		String phone_home = "";
  		String phone_work = ""; 
  		String phone_other = "";
  		String phone_fax = "";
  		String primary_address_street = ""; 
  		String primary_address_city = ""; 
  		String primary_address_state = "";
  		String primary_address_postalcode = ""; 
  		String primary_address_country = ""; 
  		String alt_address_street = ""; 
  		String alt_address_city = ""; 
  		String alt_address_state = ""; 
  		String alt_address_postalcode = "";
  		String alt_address_country = "";
  		String assistant = "";
  		String assistant_phone = ""; 
  		String converted = "";
  		String account_name = "guildKraft";
  		String contact_id = ""; 
  		String account_id = "";
  		String opportunity_id = ""; 
  		String opportunity_name = ""; 
  		String opportunity_amount = "";
  		String campaign_id = ""; 
  		String birthdate = null; 
  		String website = "";
  		
  		String description_C = "gK-Person";
  		
  		boolean targetsFlag = false;
  		boolean targetsCustomFlag = false;
  		
  		String status1 = null;
  		
  		
  		String jjwg_maps_geocode_status_c = "";
  		String jjwg_maps_address_c = "";
  		String account_description_c = "";
  		String website_c = "";
  		String lead_source_c = "";
  		String company_c = companyName;
  		String employees_c = "";
  		String code_c = "";
  		String profile_c = "";
  		String linkedprofile_c = "";
  		String facebook_c = "";
  		
  		try{
  			targetsFlag = dbcrm.addTargetsToDBCRM(emailId, description_C, salutation, firstName, last_name, title, 
  	  				department, phone_home, phoneNo, phone_work, phone_other, phone_fax, 
  	  				primary_address_street, primary_address_city, primary_address_state, 
  	  				primary_address_postalcode, primary_address_country, alt_address_street, 
  	  				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
  	  				assistant, assistant_phone, birthdate, account_name);
  			System.out.println("targetsFlag ---> "+targetsFlag);
  			
  			targetsCustomFlag = dbcrm.addTargetsCustomToDBCRM(0.0f, 0.0f, jjwg_maps_geocode_status_c, 
  	  				jjwg_maps_address_c, account_description_c, website_c, lead_source_c, company_c, 
  	  				employees_c, code_c, profile_c, linkedprofile_c, facebook_c);
  			System.out.println("targetsCustomFlag ---> "+targetsCustomFlag);
  			

  	  		if(targetsFlag == true || targetsCustomFlag == true){
  	  			status1 = "Success";
  	  		}else{
  	  			status1 = "NotSuccess";
  	  		}
  	  		
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
	
	public String suiteCRMLead(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description) {
		// TODO Auto-generated method stub
		
		/*firstName = contactUser.getFirstName();
		lastName = contactUser.getLastName();
		emailId = contactUser.getEmailId();
		phoneNo = contactUser.getPhoneNo();
		companyName = contactUser.getCompanyName();
		description = contactUser.getDescription();*/
		
		String description1 = ""; 
   		String salutation = "";
   		String title = "";
   		String department = ""; 
   		String phone_home = "";
   		String phone_work = ""; 
   		String phone_other = "";
   		String phone_fax = "";
   		String primary_address_street = ""; 
   		String primary_address_city = ""; 
   		String primary_address_state = "";
   		String primary_address_postalcode = ""; 
   		String primary_address_country = ""; 
   		String alt_address_street = ""; 
   		String alt_address_city = ""; 
   		String alt_address_state = ""; 
   		String alt_address_postalcode = "";
   		String alt_address_country = "";
   		String assistant = "";
   		String assistant_phone = ""; 
   		String converted = "";
   		String account_name = "guildKraft";
   		String contact_id = ""; 
   		String account_id = "";
   		String opportunity_id = ""; 
   		String opportunity_name = ""; 
   		String opportunity_amount = "";
   		String campaign_id = ""; 
   		String birthdate = null; 
   		String website = "";
   		
   		boolean leadFlag = false;
   		String status1 = null;
   		
   		try{   			
   			leadFlag = dbcrm.addLeadsToDBCRM(emailId, description, salutation, firstName, lastName, title, 
   	   				department, phone_home, phoneNo, phone_work, phone_other, phone_fax, 
   	   				primary_address_street, primary_address_city, primary_address_state, 
   	   				primary_address_postalcode, primary_address_country, alt_address_street, 
   	   				alt_address_city, alt_address_state, alt_address_postalcode, alt_address_country, 
   	   				assistant, assistant_phone, converted, account_name, contact_id, account_id, 
   	   				opportunity_id, opportunity_name, opportunity_amount, campaign_id, birthdate, 
   	   				website);
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
	
}

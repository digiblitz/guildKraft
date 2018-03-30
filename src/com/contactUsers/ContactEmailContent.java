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

import com.util.email.EmailContent;
import com.util.email.EmailEngine;

public class ContactEmailContent {

	/*String firstName = null;
	String lastName = null;
	String emailId = null;
	String phoneNo = null;
	String companyName = null;
	String description = null;
	String status = null;*/
	
	public boolean sendEmail(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description, String status,
			String consultation, String freeDemo, String webinar, String mailingList, 
			String contactFormType) {
		
		
		System.out.println("consultation --> "+consultation+" freeDemo --> "+freeDemo+" webinar --> "+webinar+" mailingList --> "+mailingList);
		System.out.println("contactFormType --> "+contactFormType);
		// TODO Auto-generated method stub
		/*firstName = contactUser.getFirstName();
		lastName = contactUser.getLastName();
		emailId = contactUser.getEmailId();
		phoneNo = contactUser.getPhoneNo();
		companyName = contactUser.getCompanyName();
		description = contactUser.getDescription();
		status = contactUser.getStatus();*/
		
		boolean emailFlag = false;
		
		String htmlbodytocandidate = null;

		try{
		
		
		 /* =====================================
	      *
	      * Sending confirmation E-mail
	      *
	      * ====================================*/
	    EmailContent sendemail=new EmailContent();
	     String emailid = emailId;
	     String toMailIds[] = {emailid};
	     
	     sendemail.setTo(toMailIds);
	     sendemail.setFrom("priya.karunanidhi@digiblitz.in");
	     sendemail.setSubject("Welcome!");

	     if(status.equals("Success")){
	     
	    	 htmlbodytocandidate = "<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
	                   "text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
	                   "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/dBguildLogo.png\" alt=\"Logo\"/></a></td>" +
	                   " </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
	                   "<tr><td  valign=\"top\" style=\"  padding: 0px 10px;text-align: center; vertical-align: top;\"><h4 style=\"font-size: 18px;font-weight: 400;line-height: 25px; margin: 16px 0 8px;padding: 0;text-align: left;\">Welcome "+firstName+",</h4></td> </tr><tr></tr> <tr><td style=\"padding:0px 10px\"><p style=\"margin: 20px 0 10px;text-align:left;\">"+
	                   "We are glad that you visited our website and have expressed interest towards our product.</br>" +
	                   "To guide you through the subscription package, our Membership Consultant will get in touch with you soon.<a href=\"https://www.digiblitzonline.com:8643/guildKraft\">Click here</a> to know more about us." +
	                   "</br></br>Thanks for your patronage." +
	                   "</td></tr>"+
	                   "<tr><td style=\"padding:0px 10px\"><p style=\"line-height: 20px;text-align:left;\">Regards,<br>guildKraft Team</td></tr></tbody> </table> </td> </tr> </tbody> </table> </div></div></div></div></body></html>";
	     
	    	 sendEmailOne(firstName, lastName, emailid, phoneNo, companyName, description, status, consultation, freeDemo, webinar, mailingList, contactFormType);
	    	 
	    	 
	     }else{
	     
	    	 htmlbodytocandidate = "<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                 "text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                 "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"https://www.digiblitzonline.com:8643/guildKraft/images/dBguildLogo.png\" alt=\"Logo\"/></a></td>" +
                 " </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                 "<tr><td  valign=\"top\" style=\"  padding: 0px 10px;text-align: center; vertical-align: top;\"><h4 style=\"font-size: 18px;font-weight: 400;line-height: 25px; margin: 16px 0 8px;padding: 0;text-align: left;\">Welcome "+firstName+",</h4></td> </tr><tr></tr> <tr><td style=\"padding:0px 10px\"><p style=\"margin: 20px 0 10px;text-align:left;\">"+
                 "Sorry, you have tried to contact us but something went wrong.</br>" +
                 "Please try again, <a href=\"https://www.digiblitzonline.com:8643/guildKraft\">Click here</a> contact us." +
                 "</br></br>Thanks for your patronage." +
                 "</td></tr>"+
                 "<tr><td style=\"padding:0px 10px\"><p style=\"line-height: 20px;text-align:left;\">Regards,<br>guildKraft Team</td></tr></tbody> </table> </td> </tr> </tbody> </table> </div></div></div></div></body></html>";
	     }
	     
	     sendemail.setBody(htmlbodytocandidate);
	    
	     //email.setAttachments();

	     EmailEngine emailEngine = new EmailEngine();
	     emailFlag = emailEngine.sendMimeEmail(sendemail);
	     System.out.println("Email sent sucessfully :" + emailFlag);
		
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return emailFlag;
	}

	
	public static boolean sendEmailOne(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description, String status,
			String consultation, String freeDemo, String webinar, String mailingList, 
			String contactFormType){
		
		boolean emailFlag = false;
		
		String htmlbodytocandidate = null;
		
		try{
			
			/* =====================================
		      *
		      * Sending confirmation E-mail
		      *
		      * ====================================*/
		    EmailContent sendemail=new EmailContent();
		     String emailid = emailId;
		     String toMailIds[] = {emailid};
		     
		     sendemail.setTo(toMailIds);
		     sendemail.setFrom("priya.karunanidhi@digiblitz.in");
		     sendemail.setSubject("Hello!");
			
			if(contactFormType != null && contactFormType.equals("ContactUs")){
	    		 
				if(consultation != null){
					
				}else{
					
				}
				
				if(freeDemo != null){
									
				}else{
							
				}
				
				if( webinar != null){
					
				}else{
					
				}
				
				if( mailingList != null){
					
				}else{
					
				}
				
				
	    	 }else if(contactFormType != null && contactFormType.equals("Sales")){
	    		 
	    	 }else if(contactFormType != null && contactFormType.equals("LavlitaChat")){
	    		 
	    	 }else if(contactFormType != null && contactFormType.equals("DemoRequest")){
	    		 
	    	 }
			
			sendemail.setBody(htmlbodytocandidate);
		    
		     //email.setAttachments();

		     EmailEngine emailEngine = new EmailEngine();
		     emailFlag = emailEngine.sendMimeEmail(sendemail);
		     System.out.println("Email sent sucessfully :" + emailFlag);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return emailFlag;
	}
	
	
	
}

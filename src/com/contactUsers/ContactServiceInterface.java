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

import javax.jws.WebMethod;
import javax.jws.WebService;
import javax.jws.soap.SOAPBinding;
import javax.jws.soap.SOAPBinding.Style;

@WebService
@SOAPBinding(style=Style.RPC)
public interface ContactServiceInterface {
	
	@WebMethod
	public boolean sendEmail(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description, String status
			, String consultation, String freeDemo, String webinar, String mailingList,
			String contactFormType);
	
	@WebMethod
	public String suiteCRMTarget(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description);
	
	@WebMethod
	public String suiteCRMLead(String firstName, String lastName, String emailId,
			String phoneNo, String companyName, String description);
	
	public void startNewsLetterPublishing();
	
	/*
	@WebMethod
	public boolean sendEmail(ContactUser contactUser);
	
	@WebMethod
	public String suiteCRMTarget(ContactUser contactUser);
	
	@WebMethod
	public String suiteCRMLead(ContactUser contactUser);
	*/
	
}

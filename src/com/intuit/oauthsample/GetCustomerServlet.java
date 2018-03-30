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

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class GetCustomerServlet {
	@RequestMapping("/getcustomer.html")
	public ModelAndView getcustomer(HttpServletRequest request,
			HttpServletResponse response){
		String process = (String)request.getParameter("cmd");
		
		
		if(process.equalsIgnoreCase("success") & process != null){
			
			String memberCount = (String)request.getParameter("memberCount");
			request.setAttribute("memberCount", memberCount);
			
		//request.setAttribute("process", process);
		return new ModelAndView("../QB_jsp/QBCustomerSuccess");
		}
		return new ModelAndView("index");
	}

}

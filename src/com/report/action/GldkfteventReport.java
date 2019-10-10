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
package com.report.action;

import java.io.IOException;
import java.net.ProtocolException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


	public class GldkfteventReport implements Controller {
	
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
		
		try{
			  HttpSession session = request.getSession();
			  String type=request.getParameter("type");
			  String cmd = request.getParameter("cmd");
			  
			  if(type.equalsIgnoreCase("eventsYearWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("eventsTypeWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("eventsAreaWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("eventsAreaWiseForEventType")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("humanMembersParticipatedInEvents")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("humanMembersParticipatedForAllHumanMemberships")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("getHumanMembersParticipatedEventTypeWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("getHumanMembersParticipatedAreaWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("getHumanMembersParticipatedBasedOnMembTypeAreaWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("getMembersParticipatedEventTypeAreaWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("HorseMembersEventCompetitionsWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			  if(type.equalsIgnoreCase("HorseMembersEventCompetitionsAndMembershipTypeWise")){
				  request.setAttribute("type", type);
				  return new ModelAndView("createEventReports");   	  
			  }
			


			
		}catch(Exception e){
			e.printStackTrace();
			
		}
		
			return null;
		
		}
		

	}
		

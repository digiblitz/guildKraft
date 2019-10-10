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
package com.logout.action;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Properties;
import java.util.Vector;
 

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
//import org.apache.struts.util.MessageResources;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
import com.util.XMLParser;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.login.action.KlgLoginAction;

import org.springframework.ui.ModelMap;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.systinet.uddi.ResourceBundle;


public class KlgLogoutAction implements Controller {

	String userId = null;
    Vector vObj = new Vector();
    String status=null;
static Logger log = Logger.getLogger(KlgLogoutAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
	
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
        
         
         String logoutProcess=request.getParameter("cmd");
         HttpSession session=request.getSession(true); 
         HttpSession session1 = request.getSession(true);
         
       if(logoutProcess != null && logoutProcess.equals("logout")){
    	   

           String adminUserId=(String)session.getAttribute("adminUserId");
           log.info("adminUserId while logout :"+adminUserId);
                     
      if(adminUserId!=null)
      {

    	  log.info("Admin Logout Process !!");

          
          String memberId = (String) session.getAttribute("searchMemId");
          String fName = (String) session.getAttribute("fname");
          String lName = (String) session.getAttribute("lname");
          String email = (String) session.getAttribute("email");
          String zip = (String) session.getAttribute("zip");
          String loginName = (String) session.getAttribute("login_Name");
          String frmDate = (String) session.getAttribute("fromDate");
          String tDate = (String) session.getAttribute("toDate");
          String rolId = (String) session.getAttribute("roleIds");
          String radMem = (String) session.getAttribute("radMem");
          String titleName = (String) session.getAttribute("title");

        


          ArrayList DBLeftPrivlegeList = new ArrayList();
          DBLeftPrivlegeList=(ArrayList)session.getAttribute("DBLeftPrivlegeListTemp");
          
       
          session1.setAttribute("sessionId",session1.getId());
          session1.setAttribute("adminUserId",adminUserId);
          log.info("Admin Logout Process adminUserId !!"+(String)session1.getAttribute("adminUserId"));

          session1.setAttribute("fname",fName);
          session1.setAttribute("lname",lName);
          session1.setAttribute("email",email);
          session1.setAttribute("zip",zip);
          session1.setAttribute("login_Name",loginName);
          session1.setAttribute("fromDate",frmDate);
          session1.setAttribute("toDate",tDate);
          session1.setAttribute("rolesId",rolId);
          session1.setAttribute("searchMemId",memberId);
          session1.setAttribute("radMem",radMem);
          session1.setAttribute("DBLeftPrivlegeList",DBLeftPrivlegeList);
          session1.setAttribute("title",titleName);


          session.removeAttribute("sessionId");
          session.removeAttribute("userId");
          session.removeAttribute("userCode");
          session.removeAttribute("firstName");
          session.removeAttribute("userTypeName");
          session.removeAttribute("emailId");
          session.removeAttribute("memberId");
          //session.invalidate();

          log.info("Admin Logout Process adminUserId !!"+(String)session1.getAttribute("adminUserId"));
        // return mapping.findForward("bckAdminProcess");
return new ModelAndView("frmHome");
      } else
      {

          Debug.print("Normal User Logout Process !!");

          session.removeAttribute("sessionId");
          session.removeAttribute("userId");
          session.removeAttribute("userCode");
          session.removeAttribute("firstName");
          session.removeAttribute("userTypeName");
          session.removeAttribute("emailId");
          session.removeAttribute("memberId");
          session.invalidate();
          
          System.out.println("Sucessfully Logout");

   	   return new ModelAndView("frmHome");   
      }
       
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

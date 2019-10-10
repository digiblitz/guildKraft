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
package com.user.action;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.xmlrpc.XmlRpcException;
import org.jasypt.util.text.BasicTextEncryptor;
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
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import java.util.StringTokenizer;
import java.util.Vector;
 

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
//import org.apache.struts.util.MessageResources;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.db.GeneralDBAction;
import com.google.gson.Gson;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCContactDetails;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCPaymentDetails;
import com.hlcform.util.HLCUserMaster;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
//import com.user.actionform.KlgUserRegActionForm;
import com.util.XMLParser;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import com.util.email.MailMail;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.infusionejb.session.InfusionSessionBean;
//import com.hlcutil.HLCMemberVO;
import com.login.action.KlgLoginAction;
import com.mysql.dao.MySQLDAO;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

import org.springframework.ui.ModelMap;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/*------------------------------------------------------PRABHU HERE---------------------------*/
import com.AD.action.*;
/*---------------------------------------------------PRABHU END HERE----------------------------*/


public class KlgUserAction implements Controller  {

	String userId = null;
    Vector vObj = new Vector();
    String status=null;
    String fromAddress="info@guildkraft.com";
static Logger log = Logger.getLogger(KlgUserAction.class.getName());
	
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
	
		InfusionSessionBean emails=new InfusionSessionBean();
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
         HLCKaverySessionStatefulBean hrsBean=new HLCKaverySessionStatefulBean();
         
       
        
         HLCUserRegVO userregvo=new HLCUserRegVO();
         GeneralDBAction db=new GeneralDBAction();	 
        
         HttpSession session=request.getSession(true); 
         String usrProcess=request.getParameter("cmd");
         String source = request.getParameter("source");
         
         if(usrProcess.equals("initUsr")){
                     
         return new ModelAndView("frmMemberUserSignup");
        
         }else if(usrProcess.equals("initUsrReg")){
        	 ArrayList companyname = db.getallcompanyname();
        	
        	
        	 request.setAttribute("company_name", companyname);
        	 System.out.println("company_name---------->"+companyname);
        	   	 
        	 return new ModelAndView("frmMemberUserRegistration");	  
        	 
         }else if(usrProcess.equals("usrReg")){
        	/* try {
        		 
        		// /*------------------------------------PRABHU START HERE-------------------------------------------------
                 String username = request.getParameter("usrname");
                 String firstname = request.getParameter("fname");
                 String lastname = request.getParameter("lname");
                 String usrPassword = request.getParameter("cpwd");
                 NewUser nu = new NewUser(username, firstname, lastname, usrPassword, "SharePoint");
                 
                 boolean addUsrStatus = nu.addUser();
                // boolean addUsrToGroupStatus = nu.addUserToGroup();
         		//boolean status = nu.deleteUser("kamal123");
         		//nu.assignUser("kamal123", "JavaSample");
         		if (addUsrStatus == true){
         			log.info("user created in Active Directory succcessfully");	
         		*/
/*------------------------------------PRABHU END HERE-------------------------------------------------*/
        		 
        		 BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                 textEncryptor.setPassword("sa");	 
        		 
                 HLCUserMaster objUserMaster = new HLCUserMaster();
                 HLCContactDetails objContact = new HLCContactDetails();
                 HLCMemberDetails objMember = new HLCMemberDetails();
                 HLCPaymentDetails objPayment = new HLCPaymentDetails();
               
                 log.info("inside user registration ..........");

               
                // String bday = request.getParameter("birthyear") + "-" + request.getParameter("birthmonth") + "-" + request.getParameter("birthday");
                 //log.info(bday);
               
             //===================MULTIPART STARTS HERE============================    
                 
                 if(usrProcess!=null && usrProcess.equalsIgnoreCase("usrReg")){
        			 log.info("inside usrReg------------- > ");
        			 
        				String fname=null;
        				String mname=null;
        				String lname=null;
        				String sname=null;
        				String dat=null;
        				String gender=null;
        				String usrname=null;
        				String email1=null;
        				String pwd=null;
        				String cpwd=null;
        				String usrcompanyname=null;
        				String QSelect=null;
        				String ans=null;
        				String paddress1=null;
        				String paddress2=null;
        				String floor_no=null;
        				String srt_addr=null;
        				String lane=null;
        				String area=null;
        				String pcountry_sel=null;
        				String pstate_sel=null;
        				String pcity_txt=null;
        				String pzip_txt=null;
        				//String pphone_txt=null;
        				//String pmob_txt=null;
        				//String pfax_txt=null;
        				String iphone_txt=null;
        				String aphone_txt=null;
        				String pphone_txt1=null;
        				String imob_txt=null;
        				String pmob_txt1=null;
        				String ifax_txt=null;
        				String afax_txt=null;
                        String pfax_txt1=null;
        				String saddress1=null;
        				String saddress2=null;
        				String sfloor_no=null;
        			    String ssrt_addr=null;
                        String slane=null;
                        String sarea=null;
        				String scountry_txt=null;
        				String sstate_txt=null;
        				String scity_txt=null;
        				String szip_txt=null;
        				//String sphone_txt=null;
        				//String smob_txt=null;
        				//String sfax_txt=null;
        				String siphone_txt=null;
        				String saphone_txt=null;
        				String sphone_txt1=null;
        				String simob_txt=null;
        				String smob_txt1=null;
        				String sifax_txt=null;
        				String safax_txt=null;
        				String sfax_txt1=null;
        				String myselect=null;
        				String nonUseaEmail=null;
        				String nonUseaMail=null;
        				String addr=null;
        				String fileLocation=null;
        				
        					try {
        						 
        						
        						 String fileSavePath;
        						    final String UPLOAD_DIRECTORY = "C://profilePic//";

        						    
        						        fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
        						        if (!(new File(fileSavePath)).exists()) {
        						            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
        						        }
        						    

        						    
        						        String resp = "";
        						        int i = 1;
        						        resp += "<br>Here is information about uploaded files.<br>";
        						        try {
        						            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
        						            Part _part;
        						            while ((_part = parser.readNextPart()) != null) {
        						            	
        						            	String genName= _part.getName();
        						                if (_part.isFile()) {
        						                    FilePart fPart = (FilePart) _part;  // get some info about the file
        						                    String name = fPart.getFileName();
        						                    
        						                    if (name != null) {
        						                        long fileSize = fPart.writeTo(new File(fileSavePath));
        						                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
        						                        String saveFile=fileSavePath+name;
        						                        fileLocation=saveFile;//file_name=name;
        						                        //db5.adddocumentfromstudent(user_id,name,saveFile);
        						                        log.info("file path"+saveFile);	 
        						                    } else {
        						                        resp = "<br>The user did not upload a file for this part.";
        						                    }
        						                }
        						                if(_part.isParam()){
        						                	
        						                	 ParamPart paramPart = (ParamPart)_part;
        						                	  if(genName.equals("fname")){
        						                		  fname = paramPart.getStringValue();
        						                           
        						                	  }
        											
        						                	
        						                	  if(genName.equals("mname")){
        						                		  mname = paramPart.getStringValue();
        						                         	
        						                	  }
        						                	
        						                	  if(genName.equals("lname")){
        						                		  lname = paramPart.getStringValue();
        						                         	
        						                	  }
        											
        						                	  if(genName.equals("sname")){
        						                		  sname = paramPart.getStringValue();
        						                     		
        						                	  }
        						                	  if(genName.equals("dat")){
        						                		  dat = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("gender")){
        						                		  gender = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("usrname")){
        						                		  usrname = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("email")){
        						                		  email1 = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("companyname")){
        						                		  usrcompanyname=paramPart.getStringValue();
        						                		  
        						                  }
        						                	  if(genName.equals("pwd")){
        						                		  pwd = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("cpwd")){
        						                		  cpwd= paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("QSelect")){
        						                		  QSelect = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("ans")){
        						                		  ans = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("paddress1")){
        						                		  paddress1 = paramPart.getStringValue();
        					                     		
        					                	  }
        		
        						                	  if(genName.equals("paddress2")){
        						                		  paddress2 = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("floor_no")){
        						                		floor_no=paramPart.getStringValue();  
        						                  }
        						                	  if(genName.equals("srt_addr")){
        						                		  srt_addr=paramPart.getStringValue();  
          						                  }
        						                	  if(genName.equals("lane")){
        						                		  lane=paramPart.getStringValue();  
          						                  }
        						                	  if(genName.equals("area")){
        						                		  area=paramPart.getStringValue();  
          						                  }
        						                	  
        						                	  if(genName.equals("pcountry_sel")){
        						                		  pcountry_sel = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("pstate_sel")){
        						                		  pstate_sel = paramPart.getStringValue();
        					                     		
        					                	  }
        						                	  if(genName.equals("pcity_txt")){
        						                		  pcity_txt=paramPart.getStringValue();
        						                		  
        						                	  }
        						                	 if(genName.equals("pzip_txt")){
        						                		 pzip_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("iphone_txt")){
        						                		 iphone_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("aphone_txt")){
        						                		 aphone_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("pphone_txt1")){
        						                		 pphone_txt1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("imob_txt")){
        						                		 imob_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("pmob_txt1")){
        						                		 pmob_txt1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("ifax_txt")){
        						                		 ifax_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("afax_txt")){
        						                		 afax_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("pfax_txt1")){
        						                		 pfax_txt1=paramPart.getStringValue();
        						                	 }
        						                     if(genName.equals("saddress1")){
        						                    	 saddress1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("saddress2")){
        						                		 saddress2=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sfloor_no")){
        						                		 sfloor_no=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("ssrt_addr")){
        						                		 ssrt_addr=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("slane")){
        						                		 slane=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sarea")){
        						                		 sarea=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("scountry_txt")){
        						                		 scountry_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sstate_txt")){
        						                		 sstate_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("scity_txt")){
        						                		 scity_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("szip_txt")){
        						                		 szip_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("siphone_txt")){
        						                		 siphone_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("saphone_txt")){
        						                		 saphone_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sphone_txt1")){
        						                		 sphone_txt1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("simob_txt")){
        						                		 simob_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("smob_txt1")){
        						                		 smob_txt1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sifax_txt")){
        						                		 sifax_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("safax_txt")){
        						                		 safax_txt=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("sfax_txt1")){
        						                		 sfax_txt1=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("myselect")){
        						                		 myselect=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("nonUseaEmail")){
        						                		 nonUseaEmail=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("nonUseaMail")){
        						                		 nonUseaMail=paramPart.getStringValue();
        						                	 }
        						                	 if(genName.equals("addr")){
        						                		 addr=paramPart.getStringValue();
        						                	 }
        						                } 
        						                }// end while 
        						                String pphone_txt=iphone_txt+"\n"+aphone_txt+"\n"+pphone_txt1;
        						                String pmob_txt=imob_txt+"\n"+pmob_txt1;
        						                String pfax_txt=ifax_txt+"\n"+afax_txt+"\n"+pfax_txt1;
        						                String sphone_txt=siphone_txt+"\n"+saphone_txt+"\n"+sphone_txt1;
        						                String smob_txt=simob_txt+"\n"+smob_txt1;
        						                String sfax_txt=sifax_txt+"\n"+safax_txt+"\n"+sfax_txt1;
        						                log.info("fname"+ fname);
        						                log.info("lname"+ lname);
        						                log.info("mname"+ mname);
        						                log.info("sname"+ sname);
        						                log.info("email1"+ email1);
        						                log.info("dat"+ dat);
        						                log.info("gender"+ gender);
        						                log.info("usrname"+ usrname);
        						                log.info("pwd"+ pwd);
        						                log.info("cpwd"+ cpwd);
        						                log.info("QSelect"+ QSelect);
        						                log.info("ans"+ ans);
        						                log.info("paddress1"+ paddress1);
        						                log.info("paddress2"+ paddress2);
        						                log.info("floor_no"+ floor_no);
        						                log.info("srt_addr"+ srt_addr);
        						                log.info("lane"+ lane);
        						                log.info("area"+ area);
        						                log.info("pcountry_sel"+ pcountry_sel);
        						                log.info("pstate_sel"+ pstate_sel);
        						                log.info("pcity_txt"+ pcity_txt);
        						                log.info("pzip_txt"+ pzip_txt);
        						                log.info("pphone_txt"+ pphone_txt);
        						                log.info("pmob_txt"+ pmob_txt);
        						                log.info("pfax_txt"+ pfax_txt);
        						                log.info("saddress1"+ saddress1);
        						                log.info("saddress2"+ saddress2);
        						                log.info("sfloor_no"+ sfloor_no);
        						                log.info("ssrt_addr"+ ssrt_addr);
        						                log.info("slane"+ slane);
        						                log.info("sarea"+ sarea); 
        						                log.info("scountry_txt"+ scountry_txt);
        						                log.info("sstate_txt"+ sstate_txt);
        						                log.info("scity_txt"+ scity_txt);
        						                log.info("szip_txt"+ szip_txt);
        						                log.info("sphone_txt"+ sphone_txt);
        						                log.info("smob_txt"+ smob_txt);
        						                log.info("sfax_txt"+ sfax_txt);
        						                log.info("myselect"+ myselect);
        						                log.info("nonUseaEmail"+ nonUseaEmail);
        						                log.info("nonUseaMail"+ nonUseaMail);
        						                log.info("addr"+ addr);
        						               
                                             String bday = dat;
       						                 String[] parts = bday.split("-");
       						                 String part1 = parts[0]; //month
       						                 String part2 = parts[1]; //day
       						                 String part3 = parts[2]; //year
       						                 String birthDate = part3+"-"+part1+"-"+part2;
       						                 log.info("birthdate :::::::"+birthDate);

       						                 objUserMaster.setUserTypeName("");
       						                 objUserMaster.setPrefix(request.getParameter("USelect"));
       						                 objUserMaster.setFirstName(fname);
       						                 objUserMaster.setMiddleName(mname);
       						                 objUserMaster.setLastName(lname);
       						                 objUserMaster.setSufix(sname);
       						                 //objUserMaster.setDob(bday);
       						                 objUserMaster.setDob(birthDate);
       						                 objUserMaster.setGender(gender);
       						                 objUserMaster.setEmailId(email1);
       						                 

       						                 String str=cpwd;
       						                 String encryptedPWD = textEncryptor.encrypt(str);
       						                  objUserMaster.setPassword(encryptedPWD);
       						                  objUserMaster.setSecretQuestion(QSelect);
       						                 objUserMaster.setSecretAnswer(ans);
       						                 objUserMaster.setLoginName(usrname);
       						                 if (nonUseaEmail != null) {
       						                     objUserMaster.setNonUseaEmailStatus(true);
       						                     log.info("commit nonUseaEMail status--true");
       						                 } else {
       						                     objUserMaster.setNonUseaEmailStatus(false);
       						                     log.info("commit nonUseaEMail status--false");
       						                 }
       						                 if (nonUseaMail != null) {
       						                     objUserMaster.setNonUseaMailingStatus(true);
       						                     log.info("commit nonUseaMail status--true");
       						                 } else {
       						                     objUserMaster.setNonUseaMailingStatus(false);
       						                     log.info("commit nonUseaMail status--false");
       						                 }
       						                 if (addr.equalsIgnoreCase("Secondary")) {
       						                     objUserMaster.setCommunicationAddress("Primary");
       						                 }

       						                 if (addr.equalsIgnoreCase("Primary")) {
       						                     objUserMaster.setCommunicationAddress(request.getParameter("myselect"));
       						                 }
       						              String usrid = db.addUserRegistration(objUserMaster,usrcompanyname);
       						              log.info("usr id" + usrid);
       						         	 if(usrid != null){
       						              String user_id=db.getuserid(usrname);
       						              String status=db.adduserpicture(user_id,fileLocation);
       						         	 }
       					                 log.info("remote.addUserRegistration(objUserMaster) usrid :" + usrid);
       					                 objContact.setUserId(usrid);
       					                 String finalPrimaryPh = "";

       					                 if (pphone_txt != null) {
       					                     log.info("pphone_txt value:" + pphone_txt);

       					                     StringTokenizer strTkns = new StringTokenizer((pphone_txt), "[](),.-{}");

       					                     while (strTkns.hasMoreTokens()) {
       					                         try {
       					                             String phNo = (String) strTkns.nextToken();

       					                             if (phNo != null && phNo.trim().length() != 0) {
       					                                 log.info("ph no Added from Stokenizer:" + phNo);
       					                                 finalPrimaryPh = finalPrimaryPh + phNo;
       					                             }
       					                         } catch (Exception e) {
       					                             log.info("ph no tokanizing exception:" + e);
       					                         }
       					                     }

       					                     log.info("finally appended primary phNo :" + finalPrimaryPh);
       					                 }
       					                
       					                 String finalPrimaryMob = "";

       					                 if (pmob_txt != null) {
       					                     log.info("pmob_txt value:" + pmob_txt);

       					                     StringTokenizer strTkns = new StringTokenizer((pmob_txt), "[](),.-{}");

       					                     while (strTkns.hasMoreTokens()) {
       					                         try {
       					                             String phNo = (String) strTkns.nextToken();

       					                             if (phNo != null && phNo.trim().length() != 0) {
       					                                 log.info("ph no Added from Stokenizer:" + phNo);
       					                                 finalPrimaryMob = finalPrimaryMob + phNo;
       					                             }
       					                         } catch (Exception e) {
       					                             log.info("ph no tokanizing exception:" + e);
       					                         }
       					                     }

       					                     log.info("finally appended primary finalPrimaryMob :" + finalPrimaryMob);
       					                 }

       					                 String finalPrimaryFax = "";

       					                 if ((pfax_txt) != null) {
       					                     log.info("pfax_txt value:" + pfax_txt);

       					                     StringTokenizer strTkns = new StringTokenizer((pfax_txt), "[](),.-{}");

       					                     while (strTkns.hasMoreTokens()) {
       					                         try {
       					                             String phNo = (String) strTkns.nextToken();

       					                             if (phNo != null && phNo.trim().length() != 0) {
       					                                 log.info("ph no Added from Stokenizer:" + phNo);
       					                                 finalPrimaryFax = finalPrimaryFax + phNo;
       					                             }
       					                         } catch (Exception e) {
       					                             log.info("ph no tokanizing exception:" + e);
       					                         }
       					                     }

       					                     log.info("finally appended primary finalPrimaryFax :" + finalPrimaryFax);
       					                 }
       					                  
       				        				
       					                 objContact.setContactType("Primary");
       					                 objContact.setAddress1(paddress1);
       					                 objContact.setAddress2(paddress2);
       					                 objContact.setCity(pcity_txt);
       					                 objContact.setState(pstate_sel);
       					                 objContact.setCountry(pcountry_sel);
       					                 objContact.setZip(pzip_txt);
       					                 objContact.setPhoneNo(finalPrimaryPh);
       					                 objContact.setMobileNo(finalPrimaryMob);
       					                 objContact.setFaxNo(finalPrimaryFax);
       					                 db.addContactDetails(objContact,objUserMaster.getLoginName());



       					                 if (addr.equalsIgnoreCase("Primary")) {
       					                	 objContact.setUserId(usrid);
       					                     String finalSecPh = "";
       					                     if (sphone_txt != null) {

       					                         StringTokenizer strTkns1 = new StringTokenizer(sphone_txt, "[](),.-{}");


       					                         while (strTkns1.hasMoreTokens()) {
       					                             try {
       					                                 String phNo = (String) strTkns1.nextToken();

       					                                 if (phNo != null && phNo.trim().length() != 0) {
       					                                     log.info("ph no Added from Stokenizer:" + phNo);
       					                                     finalSecPh = finalSecPh + phNo;
       					                                 }
       					                             } catch (Exception e) {
       					                                 log.info("Secondary ph no tokanizing exception:" + e);
       					                             }
       					                         }

       					                         log.info("finally appended Secondary phNo :" + finalSecPh);
       					                     }

       					                     String finalSecMob = "";
       					                     if (smob_txt != null) {

       					                         StringTokenizer strTkns1 = new StringTokenizer(smob_txt, "[](),.-{}");


       					                         while (strTkns1.hasMoreTokens()) {
       					                             try {
       					                                 String phNo = (String) strTkns1.nextToken();

       					                                 if (phNo != null && phNo.trim().length() != 0) {
       					                                     log.info("ph no Added from Stokenizer:" + phNo);
       					                                     finalSecMob = finalSecMob + phNo;
       					                                 }
       					                             } catch (Exception e) {
       					                                 log.info("Secondary ph no tokanizing exception:" + e);
       					                             }
       					                         }

       					                         log.info("finally appended Secondary finalSecMob :" + finalSecMob);
       					                     }

       					                     String finalSecFax = "";
       					                     if (sfax_txt != null) {

       					                         StringTokenizer strTkns1 = new StringTokenizer(sfax_txt, "[](),.-{}");


       					                         while (strTkns1.hasMoreTokens()) {
       					                             try {
       					                                 String phNo = (String) strTkns1.nextToken();

       					                                 if (phNo != null && phNo.trim().length() != 0) {
       					                                     log.info("ph no Added from Stokenizer:" + phNo);
       					                                     finalSecFax = finalSecFax + phNo;
       					                                 }
       					                             } catch (Exception e) {
       					                                 log.info("Secondary ph no tokanizing exception:" + e);
       					                             }
       					                         }

       					                         log.info("finally appended Secondary finalSecFax :" + finalSecFax);
       					                     }
       					                     
       					                     objContact.setContactType("Secondary");
       					                     objContact.setAddress1(saddress1);
       					                     objContact.setAddress2(saddress2);
       					                     objContact.setCity(scity_txt);
       					                     objContact.setState(sstate_txt);
       					                     objContact.setCountry(scountry_txt);
       					                     objContact.setZip(szip_txt);
       					                     objContact.setPhoneNo(finalSecPh);
       					                     objContact.setMobileNo(finalSecMob);
       					                     objContact.setFaxNo(finalSecFax);
       					                     db.addContactDetails(objContact,objUserMaster.getLoginName());

       					                 }

       					                 request.setAttribute("pwd", cpwd);
       					                 request.setAttribute("loginName", usrname);  
       					                 request.setAttribute("emailid", email1);  
       					                 
       					                 
       					            
       					                 
       					                 
       					                 /* =====================================
       					                 *
       					                 * Sending confirmation E-mail
       					                 *
       					                 * ====================================*/
       					               /* String emailid = email1;
       					                String toMailIds[] = {emailid};
       					                EmailContent email = new EmailContent();
       					                email.setTo(toMailIds);
       					                email.setFrom("dhivya@digiblitz.in");
       					                email.setSubject("Your Account Info !");

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
       					                        "<span class=\"boldTxt\">Dear " + fname + "</span>,<br /><br />" +
       					                        "<p>Please save this email for your records. Your account information is as follows:.<p>" + "<p>----------------------------<p>" + "<p>UserName :" + usrname + "<p> password: " + cpwd + "<p> ----------------------------<p>" +
       					                        "<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
       					                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+
       					                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>" +
       					                        "Thank You <br />" +
       					                        "------------------ <br />" +
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
       					                        "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />" +
       					                        "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want." +
       					                        "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:" +
       					                        "<ul>" +
       					                        "<li>Unlimited shopping online.</li>" +
       					                        "<li>Place advertisements online and/or on-site.</li>" +
       					                        "<li>Sponsor competitions held by HLC.</li>" +
       					                        "</ul>" +
       					                        "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as " +
       					                        "per your �Role� assigned:" +
       					                        "<ul>" +
       					                        "<li>Compete in Equestrian Events held by HLC.</li>" +
       					                        "<li>Take part in other events like; Annual Meetings, Educational events," +
       					                        "Activity Meetings held by HLC etc.</li>" +
       					                        "<li>Send Messages to other members.</li>" +
       					                        "<li>Create your own Distribution Lists.</li>" +
       					                        "<li>Create/Join a group and share your thoughts and common ideas.</li>" +
       					                        " <li>Unlimited Shopping online.</li>" +
       					                        " <li>Place advertisements online and/or on-site.</li>" +
       					                        " <li>Sponsor competitions held by HLC.</li>" +
       					                        "</ul>" +
       					                        "and much more..." +
       					                        "So go ahead and <a href=http://dashboard.useventing.com/>LOGIN NOW!</a></td>" +
       					                        "</tr>" +
       					                        " <tr>" +
       					                        "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
       					                        "</tr>" +
       					                        "</table>";


       					                email.setBody(content);
       					                //email.setAttachments();

       					                EmailEngine emailEngine = new EmailEngine();
       					                boolean emailFlag = emailEngine.sendMimeEmail(email);
       					                log.info("Email sent sucessfully :" + emailFlag);*/
       					                request.setAttribute("source", source);     
        						            }
        				                	  
        						        catch (java.io.IOException ioe) {
        						            resp = ioe.getMessage();
        						        }
        						        request.setAttribute("message", resp);
        						
        			request.setAttribute("status", status);		
        					}catch(Exception e){
        						e.printStackTrace();
        					}
        			
        					try {
								//emails.createContactInfusion(fname, lname, email1);
								int infusionUserId = emails.createAndCheckDuplicateContact(fname, lname, email1);
						log.info("emailId "+infusionUserId);
								
						InfusionSessionBean.optin_outEmail(email1);
						
							} catch (XmlRpcException e) {
								
								e.printStackTrace();
							}
        					
        					String ccAddresses="";String bccAddresses="";String contentType="HTML/TEXT";String textBody="";
        					String subject="Your Account Information";
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
			                					"<strong>Username</strong><br />"+usrname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
			                					"<strong>Password</strong><br />"+cpwd+"</p> " +
			                					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";

        					try {
								emails.sendEmail(fromAddress, email1, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
							} catch (XmlRpcException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
        					return new ModelAndView("uploadsuccess");
        					
        			}
                 
 
        	 return new ModelAndView("frmMemberUserRegiCnf");	
        	// return mapping.findForward("Confirmation");
        	 
         }
         
         
         else if(usrProcess != null && usrProcess.equals("edit")) 
         {
             Vector EditusrVect=new Vector();
             String usrId=(String)session.getAttribute("userId");
             log.info("loginName :"+usrId);
         
             userregvo = hrsBean.selectUserRegistrationForm1(usrId);

             request.setAttribute("EditusrVect",userregvo);
                                       
             System .out.println("inside status =" +status);
            // fwd="EditUserReg";
        
       	   return new ModelAndView("frmEditMemberUserSignUp");    
       	   
          }else if(usrProcess != null && usrProcess.equals("updateUsr")){
        	  
              HLCUserMaster objUserMaster = new HLCUserMaster();
              HLCContactDetails objContact = new HLCContactDetails();

              /*
               * Updating User Details by ejb/HLCMemberRegistrationJNDI JNDI
               */

             // UpdateUserRegActionForm usrbean = (UpdateUserRegActionForm) form;

              //String bday = request.getParameter("birthyear") + "-" + request.getParameter("birthmonth") + "-" + request.getParameter("birthday");;
              
              //log.info(bday);

              String userId = request.getParameter("userId");


              objUserMaster.setPrefix(request.getParameter("uselect"));
              objUserMaster.setFirstName(request.getParameter("fname"));
              objUserMaster.setMiddleName(request.getParameter("mname"));
              objUserMaster.setLastName(request.getParameter("lname"));
              objUserMaster.setSufix(request.getParameter("sname"));
              objUserMaster.setDob(request.getParameter("dob"));
              objUserMaster.setGender(request.getParameter("gender"));
              objUserMaster.setCommunicationAddress(request.getParameter("comAdd_sel"));
              objUserMaster.setEmailId(request.getParameter("email"));
              objUserMaster.setUserId(userId);
              objUserMaster.setLoginName(request.getParameter("usrname"));
              objUserMaster.setSecretQuestion(request.getParameter("QSelect"));
              objUserMaster.setSecretAnswer(request.getParameter("ans"));

              request.setAttribute("usrname", request.getParameter("usrname"));

             /* if (request.getParameter("confPwd") != null && request.getParameter("confPwd").trim().length() != 0) {
                  request.setAttribute("cpwd", request.getParameter("confPwd"));
              } else {
                  String pwd = request.getParameter("confPwd");

                  log.info("context.getAttribute(pwd) :" + pwd);
                  request.setAttribute("cpwd", pwd);
              }*/

              String finalPrimaryPh = "";

              if (request.getParameter("pphone_txt") != null) {
                  log.info("request.getParameter(pphone_txt) value:" + request.getParameter("pphone_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pphone_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              log.info("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryPh = finalPrimaryPh + phNo;
                          }
                      } catch (Exception e) {
                          log.info("ph no tokanizing exception:" + e);
                      }
                  }

                  log.info("finally appended primary phNo :" + finalPrimaryPh);
              }

              String finalPrimaryMob = "";

              if (request.getParameter("pmob_txt") != null) {
                  log.info("request.getParameter(pmob_txt) value:" + request.getParameter("pmob_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pmob_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              log.info("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryMob = finalPrimaryMob + phNo;
                          }
                      } catch (Exception e) {
                          log.info("ph no tokanizing exception:" + e);
                      }
                  }

                  log.info("finally appended finalPrimaryMob :" + finalPrimaryMob);
              }

              String finalPrimaryFax = "";

              if (request.getParameter("pfax_txt") != null) {
                  log.info("request.getParameter(pfax_txt) value:" + request.getParameter("pfax_txt"));

                  StringTokenizer strTkns = new StringTokenizer(request.getParameter("pfax_txt"), "[](),.-{}");

                  while (strTkns.hasMoreTokens()) {
                      try {
                          String phNo = (String) strTkns.nextToken();

                          if (phNo != null && phNo.trim().length() != 0) {
                              log.info("ph no Added from Stokenizer:" + phNo);
                              finalPrimaryFax = finalPrimaryFax + phNo;
                          }
                      } catch (Exception e) {
                          log.info("ph no tokanizing exception:" + e);
                      }
                  }

                  log.info("finally appended finalPrimaryFax :" + finalPrimaryFax);
              }

              objContact.setContactType(request.getParameter("priAdd_cbx"));
              objContact.setAddress1(request.getParameter("padd_txt"));
              objContact.setAddress2(request.getParameter("padd_txt2"));
              objContact.setCity(request.getParameter("pcity_txt"));
              objContact.setState(request.getParameter("pstate_sel"));
              objContact.setCountry(request.getParameter("pcountry_sel"));
              objContact.setZip(request.getParameter("pzip_txt"));
              objContact.setPhoneNo(finalPrimaryPh);
              objContact.setMobileNo(finalPrimaryMob);
              objContact.setFaxNo(finalPrimaryFax);
              log.info("nonUseaEmail.status:=" + request.getParameter("nonUseaEmail"));
              log.info("nonUseaMail.status:=" + request.getParameter("nonUseaMail"));

              if (request.getParameter("nonUseaEmail") != null) {
                  objUserMaster.setNonUseaEmailStatus(true);
                  log.info("commit nonUseaEMail status--true");
              } else {
                  objUserMaster.setNonUseaEmailStatus(false);
                  log.info("commit nonUseaEMail status--false");
              }
              if (request.getParameter("nonUseaMail") != null) {
                  objUserMaster.setNonUseaMailingStatus(true);
                  log.info("commit nonUseaMail status--true");
              } else {
                  objUserMaster.setNonUseaMailingStatus(false);
                  log.info("commit nonUseaMail status--false");
              }
              db.editUserDetails(objUserMaster, objContact);

              log.info("objUserMaster.getLoginName() :" + objUserMaster.getLoginName());
              log.info("objUserMaster.getEmailId() :" + objUserMaster.getEmailId());

              boolean result = new MySQLDAO().updateUserDetailToMqSQL(objUserMaster, objContact);
              log.info("                MySql Result :" + result);

              /*
               * If Secondary address is updated or added
               */

              String secstat = request.getParameter("cttyp");
              String userid = request.getParameter("userid");

              log.info("sec status :" + secstat);
              log.info("user id :" + userid);


              if (request.getParameter("secAdd_cbx") != null) {
                  objContact.setUserId(userid);
                  objContact.setContactType(request.getParameter("secAdd_cbx"));
                  objContact.setAddress1(request.getParameter("sadd_txt"));
                  objContact.setAddress2(request.getParameter("sadd_txt1"));
                  objContact.setCity(request.getParameter("scity_txt"));
                  objContact.setState(request.getParameter("sState_sel"));
                  objContact.setCountry(request.getParameter("sCountry_sel"));
                  objContact.setZip(request.getParameter("szip_txt"));

                  log.info("request.getParameter(sphone_txt) value:" + request.getParameter("sphone_txt"));

                  String finalSecPh = "";
                  if (request.getParameter("sphone_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("sphone_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  log.info("ph no Added from Stokenizer:" + phNo);
                                  finalSecPh = finalSecPh + phNo;
                              }
                          } catch (Exception e) {
                              log.info("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      log.info("finally appended Secondary phNo :" + finalSecPh);
                  }

                  String finalSecMob = "";
                  if (request.getParameter("smob_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("smob_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  log.info("ph no Added from Stokenizer:" + phNo);
                                  finalSecMob = finalSecMob + phNo;
                              }
                          } catch (Exception e) {
                              log.info("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      log.info("finally appended Secondary finalSecMob :" + finalSecMob);
                  }

                  String finalSecFax = "";
                  if (request.getParameter("sfax_txt") != null) {

                      StringTokenizer strTkns1 = new StringTokenizer(request.getParameter("sfax_txt"), "[](),.-{}");


                      while (strTkns1.hasMoreTokens()) {
                          try {
                              String phNo = (String) strTkns1.nextToken();

                              if (phNo != null && phNo.trim().length() != 0) {
                                  log.info("ph no Added from Stokenizer:" + phNo);
                                  finalSecFax = finalSecFax + phNo;
                              }
                          } catch (Exception e) {
                              log.info("Secondary ph no tokanizing exception:" + e);
                          }
                      }

                      log.info("finally appended Secondary finalSecFax :" + finalSecFax);
                  }

                  objContact.setPhoneNo(finalSecPh);
                  objContact.setFaxNo(finalSecFax);
                  objContact.setMobileNo(finalSecMob);
                
                  db.editUserDetails(objUserMaster, objContact);

              }

              if (secstat != null && request.getParameter("secAdd_cbx") == null) {
                  boolean delstat = humanMemb.deleteContactDetail(userId, "Secondary");
                  log.info("Secondary Contact Delete Status :" + delstat);
              }
              request.setAttribute("source", source);
              
              boolean status1=false;
           
              return new ModelAndView("index");
          }
         
          else if(usrProcess != null && usrProcess.equals("initchgPwd")){
        	  
        	  
        	  return new ModelAndView("frmChangePassword");  
        	  
          }
          else if(usrProcess != null && usrProcess.equals("profiledetails")){
        	String userId=(String)session.getAttribute("userId");
        	String emailId=db.getemail_id(userId);
        	ArrayList userdetails=db.getprofile_details(emailId);
        	String details[];
        	String username=null;
        	String password=null;
        	String institution_name=null;
        	String e_mail=null;
        	String customer_id=null;
        	if(userdetails!=null){
   			 Iterator itr=userdetails.iterator();			 
   			 while(itr.hasNext()){
   				details=(String[]) itr.next();
   				username=details[0];
   				password=details[1];
   				institution_name=details[2];
   				e_mail=details[3];
   				customer_id=details[4];
   			 }}
   			 request.setAttribute("username", username);
   			 request.setAttribute("password", password);
   			 request.setAttribute("institutionname", institution_name);
   			 request.setAttribute("e_mail",e_mail);
   			 request.setAttribute("customer_id", customer_id);	
        	  return new ModelAndView("profiledetails");  
        	  
          }
          else if(usrProcess != null && usrProcess.equals("product_package")){
          	String userId=(String)session.getAttribute("userId");
          	String emailId=db.getemail_id(userId);
          	ArrayList packagedetails=db.getproduct_package(emailId);
          	String packages[];
          	String Productplan=null;
          	String subscription_plan=null;
          	String amount=null;
          	if(packagedetails!=null){
     			 Iterator itr=packagedetails.iterator();			 
     			 while(itr.hasNext()){
     				packages=(String[]) itr.next();
     				Productplan=packages[0];
     				subscription_plan=packages[1];
     				amount=packages[2];
     			
     			 }}
     			 request.setAttribute("Productplan", Productplan);
     			 request.setAttribute("subscription_plan",subscription_plan);
     			 request.setAttribute("amount", amount);
     			 

     			 String dateStr=db.getdate(emailId);	 				
     							 String difference=null;
     							 //subscription status Area---------------------------------------				  	  
     							  SimpleDateFormat formatter=new SimpleDateFormat("yyyy-MM-dd");
     								
     								try {
     									Date date=formatter.parse(dateStr);
     									long lo=30;					
     									Date thirty = new Date(date.getTime() + lo * 1000 * 60 * 60 * 24);						
     									log.info("Tomorrow"+thirty);						
     									String subsenddate=formatter.format(thirty);						
     									log.info(subsenddate);			
     									
     									Date currentdate=new Date();
     									String strcurrent=formatter.format(currentdate);	
     									
     				int diffInDays = (int) ((thirty.getTime() - currentdate.getTime()) / (1000 * 60 * 60 * 24));

     									if(strcurrent.equals(subsenddate)){
     										diffInDays=0;
     									}		
     									else{
     										log.info(diffInDays);
     										difference=Integer.toString(diffInDays);
     									}
     								} catch (ParseException e) {					
     									e.printStackTrace();
     								}
     								
     								request.setAttribute("difference", difference);

     								return new ModelAndView("productpackage");  
          	  
            }
          else if(usrProcess != null && usrProcess.equals("security")){
            	String userId=(String)session.getAttribute("userId");
            	String emailId=db.getemail_id(userId);
            	ArrayList securitydetails=db.getsecurity_details(emailId);
            	/*String packages[];
            	String Productplan=null;
            	String subscription_plan=null;
            	String amount=null;
            	if(securitydetails!=null){
       			 Iterator itr=securitydetails.iterator();			 
       			 while(itr.hasNext()){
       				packages=(String[]) itr.next();
       				Productplan=packages[0];
       				subscription_plan=packages[1];
       				amount=packages[2];
       			
       			 }}*/
       			// request.setAttribute("Productplan", Productplan);
       			 //request.setAttribute("subscription_plan",subscription_plan);
       			 //request.setAttribute("amount", amount);	
            	String lasttime=db.getLoginDetails(userId);
            	String days=getdate(lasttime);
            	request.setAttribute("days", days);
            	  return new ModelAndView("security");  
            	  
              }
          else if(usrProcess != null && usrProcess.equals("couponname")){

        		 String json = null;
        		 String couponcode=request.getParameter("prog");
        		 String cost=request.getParameter("cost");
        		
        		 String offer=db.getcouponoffer(couponcode);
        		 log.info("parasu checking -----offer--->"+offer);
        		 
        		if(offer != null){
        			int off = Integer.parseInt(offer);
        			double aa=Double.parseDouble(cost);  
        			int amount = (int)Math.round(aa);
           		 
        			int to=amount*off/100;
        			int total=amount-to;
        			db.updatecouponstatus(couponcode);
        			json = new Gson().toJson(total);				 
        		     response.setContentType("application/json");	             
        		     response.getWriter().write(json);
        		}else{
        			
        			json = new Gson().toJson(offer);				 
        		     response.setContentType("application/json");	             
        		     response.getWriter().write(json);
        		}
          }
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("updateprofile")){
     		 BasicTextEncryptor textEncryptor = new BasicTextEncryptor();

			    log.info("user picture upload here");
			    String new_email=request.getParameter("email");
			     //String usernamee=db1.getusername(user_id);
			     
			   String username=request.getParameter("username");
			   String password=request.getParameter("password");
			   textEncryptor.setPassword("sa");
			   String encryptedPWD = textEncryptor.encrypt(password);
			   
			   log.info("password encrypt---------->"+ encryptedPWD);
			   String e_mail=request.getParameter("emailid");
			   String institutionname=request.getParameter("institutionname");
			   String customerid=request.getParameter("customerid");
			   log.info("institutionname--------->"+institutionname);
			   
			  
	   			
			   
			  
			   String updateprofile=db.updateprofile(new_email,username, password, e_mail,institutionname);
			   String updatesignup=db.updatesignupuserdetails(new_email,username, encryptedPWD, e_mail);
			   if(updateprofile != null && updatesignup != null){
				   request.setAttribute("upstatus", "Updated Succesfully!!!");
			   }else{
				   request.setAttribute("upstatus", "Updated Failed!!!!!");
			   }
			   request.setAttribute("upstatus", updateprofile);
			   	 request.setAttribute("username", username);
	   			 request.setAttribute("password", password);
	   			 request.setAttribute("institutionname", institutionname);
	   			 request.setAttribute("e_mail",e_mail);
			   return new ModelAndView("profiledetails");
			   }
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("updateproductppackage")){
			    
			    log.info("user picture upload here");
			     userId=request.getParameter("userId");
			     //String usernamee=db1.getusername(user_id);
			     
			   String plantype=request.getParameter("plan_type");
			   String subscriptiontype=request.getParameter("subs_type");
			   String paymentHistory=request.getParameter("pay_history");
			   String subscriptionExpiry=request.getParameter("Subs_expiry");
			   String new_email=request.getParameter("email");

			   
			  
			   String updateproductppackage=db.updateproductpackage(new_email,plantype, subscriptiontype, paymentHistory,subscriptionExpiry); 
			   request.setAttribute("updatestatus", updateproductppackage);
			   return new ModelAndView("productpackage");
			   }
          else if(usrProcess!=null && usrProcess.equalsIgnoreCase("contactus")){
			   
			   String name=request.getParameter("name");
			   String email=request.getParameter("email");
			   String phone=request.getParameter("phone");
			   String message=request.getParameter("message");
			  
			   String s=db.insertcontact(name,email,phone,message); 
			   request.setAttribute("updatestatus", s);
			   return new ModelAndView("frmContacts");
			   }

          else if(usrProcess != null && usrProcess.equals("chngPwd")){
        	        	 
              String userId=(String)session.getAttribute("userId");
              String oldPass=request.getParameter("currPwd");
              String newPass=request.getParameter("newPwd");
              String reNewPass=request.getParameter("reNewPwd");
              
              String password=db.getPasswordByLoginId(userId);
              BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
              textEncryptor.setPassword("sa");
              String  decryptPwd=textEncryptor.decrypt(password);
              
              log.info("decrypted Password : "+decryptPwd);
             
              
              if(decryptPwd.equals(oldPass) && newPass.equals(reNewPass)){
            	  
             
              
              log.info("user id from session :" +userId);
             
              log.info("changed password :" +newPass);
              BasicTextEncryptor textEncryptor1 = new BasicTextEncryptor();
              textEncryptor1.setPassword("sa");
              boolean status = humanMemb.changePassword(userId,textEncryptor1.encrypt(newPass));
              
              log.info("changePassword status :" +status);
              
              if(status==true)
                  
              {
                  log.info("Password Changed Successfully");
                  log.info("New Password is : "+newPass);
                  /* =====================================
                       *
                       * Sending confirmation E-mail
                       *
                       * ====================================*/
                  		
                      //String emailid=(String)session.getAttribute("emailId");
                  	  String emailid = db.getEmailIdByPassword(userId);
                      log.info("User emailid :"+emailid);
                      String toMailIds[] = {emailid};
                      EmailContent email=new EmailContent();
                      email.setTo(toMailIds);
                      email.setFrom("dhivya@digiblitz.in");
                      email.setSubject("Your Account Info !");
                      
                      String content = "<table width=\"530\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                              " <tr>" +
                              " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                              " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                              "<tr>" +
                              "<td height=\"70\" valign=\"top\"><img src=\"images/logo3.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                              " </tr>"+
                              "  <tr>"+
                              "<td valign=\"top\">"+
                              "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                              "<tr>"+
                              "<td width=\"7\" height=\"12\" valign=\"top\">&nbsp;</td> " +
                              
                              "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                              "<td width=\"7\" height=\"12\" valign=\"top\">&nbsp;</td>   " +
                           
                              "</tr>"+
                              "<tr>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/left.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                              "<span class=\"boldTxt\">Dear User"+"</span>,<br /><br />"+
                              "<p>Please save this email for your records. Your Password Change Request is Succesful !! Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p> New Password : "+newPass+"<p> ----------------------------<p>"+
                              /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                              "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                              "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                              "Thank You <br />"+
                              "------------------ <br />"+
                              "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/Rght.jpg\">&nbsp;</td>"+
                              "</tr>"+
                              "<tr><td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBotLeft.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBot.jpg\">&nbsp;</td>"+
                              "<td valign=\"top\" background=\"https://dashboard.useventing.com/dashboard/images/cornerBotRght.jpg\">&nbsp;</td>"+
                              "</tr>"+
                              " </table>"+
                              "</td></tr>"+
                              "<tr>"+
                              "<td valign=\"top\" style=\"padding:10px;\">"+                            
                              "and much more..."+
                              "So go ahead and <a href=\"http://localhost:8080/klugwerks/login.html?cmd=initLogin\">LOGIN NOW!</a></td>"+
                              "</tr>"+
                              " <tr>"+
                              "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"></td>"+
                              "</tr>"+
                              "</table>";
                      
                      
                      email.setBody(content);
                      //email.setAttachments();
                      
                     /* EmailEngine emailEngine = new EmailEngine();
                      boolean emailFlag = emailEngine.sendMimeEmail(email);
                      log.info("Email sent sucessfully :"+emailFlag);*/
                      
                      log.info("Email ID :"+email);
                	  MailMail mail = new MailMail();
                	  boolean emailFlag = mail.sendMimeEmail(email);
                      log.info("Email sent sucessfully :"+emailFlag);
                  
                      return new ModelAndView("frmChange-pwd-conf");  
              }

              }
              
              else
              {
                  String stat="fail";
                  request.setAttribute("status",stat);
                  return new ModelAndView("frmChange-pwd-conf");  
               }
          
          }
         
         
         
          else if(usrProcess!=null)

              if(usrProcess.equalsIgnoreCase("view"))
              { 
            	
            	  return new ModelAndView("frmForgetPassword");  
              }
              
              if(usrProcess.equalsIgnoreCase("Password"))
              {
                  log.info("inside forget user name block ...........");
                  String usrname=request.getParameter("usrname2");
                  log.info("usrname :" +usrname);
                 
                  ArrayList fullUserDetails=new ArrayList();
                  String firstName = null;
                  String lastName = null;
                  
                  String toAddress=usrname;
                  String ccAddresses=""; String bccAddresses="";  String contentType="HTML/TEXT"; 
                  String subject="Your Account Details"; String textBody="";
                   ArrayList det=new ArrayList();
                   det=humanMemb.getLoginDetailsByEmailId(usrname);
                 
                  if(det.size() == 1){
                       for(int i=0;i<det.size();i++){
                          String lname=(String)det.get(i);
                          if(lname==null){
                              log.info("Login Name is "+lname+"     Redirected to user sign up page ");
                              request.setAttribute("loginName","notFound");
                              
                              return new ModelAndView("frmMemberUserSignup"); 
                          }
                       }
                  }
                   
                  if(det!=null)
                  {                     
                  
                  if(det.size()!=0)
                  {                   
                      String username="";              
                      log.info("det.size() :"+det.size());
                            
                      for(int i=0;i<det.size();i++)
                      {
                              String lname=(String)det.get(i);
                              if(lname!=null)
                              {
                                  username=username+lname+",";
                              }
                              
                              log.info("usrname's fetched :"+lname);
                              log.info("usrname's consolidated :"+username);
                      }
                      
                      fullUserDetails = db.getFullLoginDetailsByEmailId(usrname);
                      
                      if(fullUserDetails!=null && fullUserDetails.size()!=0){
           Iterator itEntList = fullUserDetails.iterator();
           int i=1;
           while(itEntList.hasNext()){
           
            String strRolelist[]= (String[])itEntList.next();
            firstName = strRolelist[1];
            lastName = strRolelist[2];
            System.out.println("firstName  in forget username"+firstName);
            System.out.println("lastName in forget username"+lastName);;
           }
                      }
                      
                  /* =====================================
                   *
                   * Sending Password E-mail
                   *
                   * ====================================*/
                      
                  String toMailIds[] = {usrname};
                  EmailContent email=new EmailContent();
                  
                  
                  String htmlBody = "<html><body><div style=\" background-color: #d8dde4;  padding: 32px 10px;text-align: center!important;\"><div style=\"max-width: 580px; text-align: center;margin: 0 auto;width: 100%; display: inline-block;" +
                			"text-align: center;vertical-align: top; width: 100%;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody><tr><td align=\"center\" valign=\"top\" style=\" background-color: #2f68b4;border-radius: 4px 4px 0 0;padding-bottom: 16px; text-align: center;\">" +
                			"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"padding-top: 16px;\"><a href=\"#\"><img style=\"height: auto; max-width: 156px;\" src=\"../../images/dBguildLogo.png\" alt=\"Logo\"/></a></td>" +
                			" </tr></tbody></table></td></tr></tbody></table><div ><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr><td align=\"center\" valign=\"top\" style=\"background-color: #fff;\"><table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody>" +
                			"<tr><td align=\"center\" valign=\"top\" style=\"  padding: 16px;text-align: center; vertical-align: top;\"><table style=\"width: 48px;clear: both; margin-left: auto; margin-right: auto;\"  width=\"80\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td >&nbsp;</td>" +
                			"</tr><tr> <td style=\"background-color: #e1e3e7;border-radius: 80px; height: 48px;line-height: 1;padding: 8px;\"><img src=\"http://notification-emails.com/wp-content/themes/notification-emails/template_showcase/simpleapp//ic_person_white_48dp_2x.png\" width=\"48\" height=\"48\" alt=\"\"/></td>" +
                					"</tr><tr><td >&nbsp;</td></tr></tbody></table><h4 style=\"font-size: 22px;font-weight: 700;line-height: 30px; margin: 16px 0 8px;padding: 0;color: #383d42;text-align: center;\">Congratulations User!</h4><p style=\"   font-size: 19px;" +
                					"line-height: 27px; margin-bottom: 16px;margin-top: 16px; text-align: center;\">You have finished setting up your account.</p><table style=\" clear: both; margin: 0 auto;\" align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">" +
                					"<tbody> <tr> <td style=\"border-radius: 4px;padding: 12px 24px;text-align: center;vertical-align: middle;background-color: #22aaa0; font-size: 16px;\" class=\"font_default\"><a style=\"font-weight: 700; color:#fff;\" href=\"https://www.digiblitzonline.com:8643/guildKraft\"><span style=\" display: block;text-align: center; color: #fff;\">Login to Your Account</span></a></td>" +
                					"</tr> </tbody> </table> <p>&nbsp; </p> </td> </tr> </tbody> </table> </td> </tr> </tbody> </table> <table  width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"><tbody> <tr> <td align=\"center\" valign=\"top\" style=\"background-color: #fff;  padding: 16px; text-align: center; vertical-align: top;\">" +
                					"<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> <tbody> <tr> <td style=\"color: #888;\" align=\"center\" valign=\"top\" style=\" padding: 16px; text-align: center; vertical-align: top;\">" +
                					" <p style=\" line-height: 23px; margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                					"<strong>Username</strong><br />"+username+"</p>" +
                					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                  
                  try {
                	  
                	//emails.createContactInfusion(fname, lname, email1);
						int infusionUserId = emails.createAndCheckDuplicateContact(firstName, lastName, usrname);
				log.info("emailId "+infusionUserId);
						
				InfusionSessionBean.optin_outEmail(usrname);
				
 					 emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
 				} catch (XmlRpcException e) {
 					// TODO Auto-generated catch block
 					e.printStackTrace();
 				}//email.setBody(content);
                  //email.setAttachments();
                  
                  //MailMail mail = new MailMail();
                 // boolean emailFlag = mail.sendMimeEmail(email);
                 // log.info("Email sent sucessfully :"+emailFlag);
                  String stat="success";
                 // String usrnamedummy=request.getParameter("usrname");
                  request.setAttribute("status1",stat);
                  request.setAttribute("user","digiblitz");
                  request.setAttribute("username",username);
                  request.setAttribute("email",usrname);
                  return new ModelAndView("frmForgetUsernameCnf"); 
               
                  
                  }
                  else
                  {
                      String stat="fail";
                      request.setAttribute("status",stat);
                      return new ModelAndView("frmForgetPassword");   
                    
                      
                  }
                  }
                 
              }
              
               if(usrProcess.equalsIgnoreCase("User"))
              {    
            	    
                  log.info("Inside forget pwd block ..........");
                  String secretqus=request.getParameter("sAnswer2");
                  String sAnswer=request.getParameter("sAnswer");
                  String usrname=request.getParameter("usrname");
                  ArrayList fullUserDetails=new ArrayList();
                  String firstName = null;
                  String lastName = null;
                  
                  log.info("usrname :" +usrname);
                  log.info("sAnswer :" +secretqus);
                  log.info("secretqus :" +sAnswer);
                                   
                  // context.setAttribute("usrname",usrname);
                  boolean statu=false;
                  boolean status=humanMemb.checkSecurityQuestionByLoginName(usrname,secretqus,sAnswer);
                  log.info("remote.checkSecurityQuestionByLoginName(usrname,secretqus,sAnswer2) :" +status);
                
                  if(status == true)
                  {
                      
                      log.info(" ::::::::::::::: inside secret q/a fail block send pwd mail ::::::::" );
                      String emailid=humanMemb.getEmailByLoginName(usrname);
                      log.info("remote.getEmailByLoginName(usrname) :" +emailid);
                      log.info("remote.getPasswordByLoginName(usrname) :" +usrname);
                      String password=humanMemb.getPasswordByLoginName(usrname);
                      BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
                      textEncryptor.setPassword("sa");
                      String  decryptPwd=textEncryptor.decrypt(password);
                      request.setAttribute("password",decryptPwd);
                      log.info("remote.getPasswordByLoginName(usrname) :" +decryptPwd);
                      
                                          
                      fullUserDetails = db.getFullLoginDetailsByEmailId(emailid);
                     
                      if(fullUserDetails!=null && fullUserDetails.size()!=0){
           Iterator itEntList = fullUserDetails.iterator();
           int i=1;
           while(itEntList.hasNext()){
           
            String strRolelist[]= (String[])itEntList.next();
            firstName = strRolelist[1];
            lastName = strRolelist[2];
            System.out.println("firstName  in forget username"+firstName);
            System.out.println("lastName in forget username"+lastName);;
           }
                      }
                      
                      
                  /* =====================================
                   *
                   * Sending User Name E-mail
                   *
                   * ====================================*/
                      
                  /*String toMailIds[] = {emailid};
                  EmailContent email=new EmailContent();
                  //email.setTo(toMailIds);
                  //email.setFrom("dhivya@digiblitz.in");
                  //email.setSubject("Your Account Details");
*/                // String fromAddress="prabhu.pandi@digiblitz.in";
                  String toAddress=emailid;
                  String ccAddresses=""; String bccAddresses="";  String contentType="HTML/TEXT"; 
                  String subject="Your Account Details"; String textBody="";
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
                					"<strong>Username</strong><br />"+usrname+"</p> <p style=\" line-height: 23px; margin-bottom: 24px;margin-top: 16px;font-size: 15px;\">" +
                					"<strong>Password</strong><br />"+decryptPwd+"</p> <p style=\" line-height: 23px;margin-bottom: 24px; margin-top: 16px;font-size: 15px;\">" +
                					"<strong>Email</strong><br /> "+emailid+"</p> " +
                					"</td> </tr> </tbody></table></td></tr></tbody></table></div></div></div></div></body></html>";
                  
                  try {
                	//emails.createContactInfusion(fname, lname, email1);
						int infusionUserId = emails.createAndCheckDuplicateContact(firstName, lastName, emailid);
				log.info("emailId "+infusionUserId);
						
				InfusionSessionBean.optin_outEmail(emailid);
                	  statu=emails.sendEmail(fromAddress, toAddress, ccAddresses, bccAddresses, contentType, subject, htmlBody, textBody);
				} catch (XmlRpcException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                  //email.setBody(content);
                  //email.setAttachments(); no need...
                  
                 // MailMail mail = new MailMail();
                 // boolean emailFlag = mail.sendMimeEmail(email);
                 // log.info("Email sent sucessfully :"+emailFlag);
                  String stat="success";
                  request.setAttribute("status",stat);
                  request.setAttribute("pass","digiblitz");
                  request.setAttribute("emailid",emailid);
                  request.setAttribute("usrname",usrname);
                  request.setAttribute("password",decryptPwd);
                 
                  return new ModelAndView("frmForgetUsernameCnf");  
                    
                  }
                  
                  else
                  {
                      String stat="fail";
                      request.setAttribute("idstatus",stat);
                      return new ModelAndView("frmForgetPassword");   
                    
                      
                  }
                  
               
              }
              
               if(usrProcess.equalsIgnoreCase("resetpw"))
              { 
                  
                  log.info("::::::::::::::::::: Inside reset pwd update block ::::::::::::");
                  String usrname=request.getParameter("usrname");
                  log.info("context.getAttribute(usrname) :"+usrname);
                  
                  String password=request.getParameter("password");
                  log.info("request.getParameter(password) :"+password);
                  
                  boolean stat=humanMemb.updateLoginDetailsByLoginName(usrname,password);
                  
                  log.info("remote.updateLoginDetailsByLoginName(usrname,password) :"+stat);
                  
                   String emailid=humanMemb.getEmailByLoginName(usrname);
                   log.info("remote.getEmailByLoginName(usrname) :" +emailid);
                   
                    /* =====================================
                   *
                   * Sending User Name E-mail
                   *
                   * ====================================*/
                      
                  String toMailIds[] = {emailid};
                  EmailContent email=new EmailContent();
                  email.setTo(toMailIds);
                  email.setFrom("dhivya@digiblitz.in");
                  email.setSubject("Your Account Details");
                  
                  String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                          " <tr>" +
                          " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                          " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                          "<tr>" +
                          "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
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
                          "<span class=\"boldTxt\">Dear user,</span>,<br /><br />"+
                          "<p>Please save this email for your records. Your account information is as follows:.<p>"+
                          "<p> --------------------- <p>"+
                         
                          "<p> Your Password has been changed !!<p>"+
                          "<p> --------------------- <p>"+
                          "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                          "Thank You <br />"+
                          "------------------ <br />"+
                          "<span class=\"boldRedTxt\">HLC Team</span></td>"+
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
                          "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                          "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                          "<ul>"+
                          "<li>Unlimited shopping online.</li>"+
                          "<li>Place advertisements online and/or on-site.</li>"+
                          "<li>Sponsor competitions held by HLC.</li>"+
                          "</ul>"+
                          
                          
                          "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                          "per your �Role� assigned:"+
                          
                          "<ul>"+
                          "<li>Compete in Equestrian Events held by HLC.</li>"+
                          "<li>Take part in other events like; Annual Meetings, Educational events,"+
                          "Activity Meetings held by HLC etc.</li>"+
                          "<li>Send Messages to other members.</li>"+
                          "<li>Create your own Distribution Lists.</li>"+
                          "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                          " <li>Unlimited Shopping online.</li>"+
                          " <li>Place advertisements online and/or on-site.</li>"+
                          " <li>Sponsor competitions held by HLC.</li>"+
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
                  
                  MailMail mail = new MailMail();
                  boolean emailFlag = mail.sendMimeEmail(email);
                  log.info("Email sent sucessfully :"+emailFlag);
                  
                  return new ModelAndView("frmResetPasswordCnf");  
                 
              }
               if(usrProcess.equalsIgnoreCase("homeDash"))
               {  
            	   
                return new ModelAndView("dashboard");  
               }
               if(usrProcess.equalsIgnoreCase("inithome"))
               {  
            	   
                return new ModelAndView("frmHome");  
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

public String getdate(String lastdate)
{
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Calendar calobj = Calendar.getInstance();
	String days=null;
	String dateStart=df.format(calobj.getTime());
	
	//System.out.print(dateStart);
	//System.out.print(lastdate);
	//SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
	 
	Date d1 = null;
	Date d2 = null;

	try {
		d1 = df.parse(dateStart);
		d2 = df.parse(lastdate);

		//in milliseconds
		long diff = d1.getTime() - d2.getTime();

		long diffSeconds = Math.abs(diff / 1000 % 60);
		long diffMinutes = Math.abs(diff / (60 * 1000) % 60);
		long diffHours = Math.abs(diff / (60 * 60 * 1000) % 24);
		long diffDays = Math.abs(diff / (24 * 60 * 60 * 1000));

		String sec=Long.toString(diffSeconds);
		String min=Long.toString(diffMinutes);
		String hour=Long.toString(diffHours);
		String day=Long.toString(diffDays);
        days=day+"days"+hour+"hours"+min+"minutes";
	} catch (Exception e) {
		e.printStackTrace();
	}
	return days;

}
}

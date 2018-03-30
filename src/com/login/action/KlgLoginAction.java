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
package com.login.action;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.ProtocolException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import java.util.Vector;
 

import javax.ejb.FinderException;
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
import org.apache.commons.io.IOUtils;
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

import com.AD.action.NewUser;
import com.contactUsers.ContactClient;
import com.contactUsers.ContactService;
import com.contactUsers.ContactUser;
import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;
import com.suitecrm.session.DBCRMSessionBean;
import com.util.XMLParser;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import org.springframework.ui.ModelMap;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.systinet.uddi.ResourceBundle;


public class KlgLoginAction implements Controller {
static Logger log = Logger.getLogger(KlgLoginAction.class.getName());
	
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
	
		 int totalXMLUsers=0;int totalUsersAssignedRole=0;
			GeneralDBAction db=new GeneralDBAction();	 
		 String loginProcess=request.getParameter("cmd");
         String login,pass = "";
                 String userName="";
                 String userPassword="";
        
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
         DBCRMSessionBean dbcrm = new DBCRMSessionBean();
         ContactService contactService = new ContactService();
         ContactUser contactUser = new ContactUser();
         ContactClient contactClient = new ContactClient();
        
         HttpSession session=request.getSession(true); 
        
        
        // String memberId = (String) session.getAttribute("searchMemId");
         String fName = (String) session.getAttribute("fname");
         String lName = (String) session.getAttribute("lname");
         String email = (String) session.getAttribute("email");
         String zip = (String) session.getAttribute("zip");
         String loginName = (String) session.getAttribute("login_Name");
         String frmDate = (String) session.getAttribute("fromDate");
         String tDate = (String) session.getAttribute("toDate");
         String rolId = (String) session.getAttribute("rolesId");
         String radMem = (String) session.getAttribute("radMem");
                             
         session.setAttribute("sessionId",null);  
         session.setAttribute("userId",null);
         session.setAttribute("userCode",null);
         //session.setAttribute("firstName",null);
         session.setAttribute("userTypeName",null);
         session.setAttribute("emailId",null);
         session.setAttribute("memberId",null);
         session.setAttribute("periodValue",null);
         session.setAttribute("userTypeId",null);
         session.setAttribute("title","guildKraft");
       
         
       String license_file_path="C://XML//license-config.xml";
       log.info("Inside KlgLoginAction");
       
       if(loginProcess != null && loginProcess.equals("initDash")){
    	   String membId=null;       
    	   String userId = null;
    	   String imagedata=null;
    	   String file_path=null;
    	    Vector vObj = new Vector();
    	    /*-----------------------ACTIVE DIRECTORY HERE------------------------
    	    boolean ADchk = false;
    	    /*-----------------------ACTIVE DIRECTORY HERE------------------------*/

    	    String status=null;
    	      	  
           String fileEncryptedContent=XMLParser.readXMLCreated(license_file_path);
           String original=XMLParser.decryptFileContent(fileEncryptedContent);
           
           totalXMLUsers=XMLParser.readFromXMLUsers(original); // Reading licensed users from license file .
           totalUsersAssignedRole=humanMemb.getUserCountBasedOnRole();
            log.info("befor if totalUsersAssignedRole...."+totalUsersAssignedRole);
           
           if(totalUsersAssignedRole==-1)
           {
        	   log.info("Inside if block....");
           	return new ModelAndView("callErrorPage");
           //	return mapping.findForward("callErrorPage");
           }
           
           boolean output=XMLParser.readXMLDecryptedContent(original);
           ArrayList uu=XMLParser.totalXMLUsers(original);
          String hh1=uu.get(0).toString();
          String hh2=uu.get(1).toString();
          String hh3=uu.get(2).toString();
          String hh4=uu.get(3).toString();
          request.setAttribute("nuser",hh1);
          request.setAttribute("sdate",hh2);
          request.setAttribute("edate",hh3);
          request.setAttribute("luser",hh4);
  
          if(output)
          {
           login = request.getParameter("textfield");
           pass = request.getParameter("textfield2");
       
           
           log.info("   Normal Login Process    Login Name:" + login);
          // log.info("   Normal Login Process    viewVal:" + viewVal);
           if(login != null && login.trim().length() != 0 && pass != null && pass.trim().length() != 0)
			try {
				
/* --------------------------ACTIVE DIRECTORY CODE START HERE---------------------------------------------------
				
				NewUser nu = new NewUser();
				ADchk = nu.active(login,pass);
				 log.info("ACTIVE DIRECTORY RESULT HERE : "+ADchk);
				

			if (ADchk == true){
/* --------------------------ACTIVE DIRECTORY CODE END HERE---------------------------------------------------*/
				vObj = humanMemb.getLoginStatus(login, pass);
/*			} else{
				 log.info("LDAP Authentication faild");
			}
*/             String user_id=db.getuser_status(login); 
               if(user_id != null){
                file_path=db.getpicture_path(user_id);
               }

               try
              					 {
              					 FileInputStream inpStream = new FileInputStream(file_path);
              					 byte[] bytearr= IOUtils.toByteArray(inpStream);
              					 byte byteImageData[]  =com.bea.xbean.util.Base64.encode(bytearr);
              					  imagedata= new String(byteImageData);
              					  log.info("sdvvv==>"+imagedata);
              					 }
              					 catch(Exception e)
              					 {
              					  log.info("Exception Occured"+e.toString());
              					 }
               
               session.setAttribute("imagedata",imagedata);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
          // session.setAttribute("viewVal", viewVal);
           
          }
          
          else
          {
            status="expired";
            request.setAttribute("status",status);
            session.removeAttribute("adminUserId");
            return new ModelAndView("frmMemberUserSignup");
           // return mapping.findForward("ReLogin");   
          }
          

          if(vObj != null && (vObj.size() != 0)) {
             String[] logdet=null;

             logdet=(String[]) vObj.elementAt(0);
             if(logdet[0].equalsIgnoreCase("true")) {            
               // counting first Roles count for this userID
                 int count=humanMemb.getRolesCountForUser(logdet[1]);
                log.info("Count For Roles for this User"+count);
                 if(count==0)
                      request.setAttribute("requestStatus","false");
                 else if(count>0)
                 {
                     if(totalUsersAssignedRole>totalXMLUsers)
                     {
                         // log.info("If equal");
                         status="users";
                         request.setAttribute("status",status);
                         // log.info("If equal");
                         session.removeAttribute("adminUserId");
                         return new ModelAndView("frmLogin");
                         //return mapping.findForward("ReLogin");
                     }
                         
                     else if(totalUsersAssignedRole<=totalXMLUsers)
                     {
                       request.setAttribute("requestStatus","true");
                       // log.info("If less");
                     }
                 }  
               
                
                
                session.setAttribute("userCode",logdet[2]);
                session.setAttribute("userName",userName);
                session.setAttribute("userPassword",userPassword);
                session.setAttribute("userTypeName",logdet[4]);
                session.setAttribute("emailId",logdet[5]);
               // session.setAttribute("memberId",logdet[6]);
               
                session.setAttribute("loginName",logdet[7]);
                session.setAttribute("lastName",logdet[8]);
                session.setAttribute("phoneNo",logdet[9]);
                session.setAttribute("periodValue",logdet[10]);
                session.setAttribute("userTypeId",logdet[11]);
                String request_Status=logdet[12];
                request.setAttribute("requestValue",request_Status);
                session.setAttribute("fname",fName);
                session.setAttribute("lname",lName);
                session.setAttribute("email",email);
                session.setAttribute("zip",zip);
                session.setAttribute("login_Name",loginName);
               // session.setAttribute("searchMemId",memberId);
                session.setAttribute("fromDate",frmDate);
                session.setAttribute("toDate",tDate);
                session.setAttribute("rolesId",rolId);
                session.setAttribute("radMem",radMem);
                 log.info(logdet[0]+" "+logdet[1]+" "+logdet[2]+" "+logdet[3]+" "+logdet[4]+" "+logdet[5]+" "+logdet[6]+" "+logdet[7]+" "+logdet[8]+" "+logdet[9] + " " + logdet[10] + " " + logdet[11]);
                   //return mapping.findForward("LoginSuccess");
              String msgCount = String.valueOf(db.totalMessageCount(logdet[1].trim()));
                session.setAttribute("msgCount",msgCount);
                
                boolean updateStat=humanMemb.updateLoginDate(logdet[1]);
               
                log.info("remote.updateLoginDate() in servlet :"+updateStat);
               
                  session.setAttribute("sessionId",session.getId()); 
                session.setAttribute("userId",logdet[1]);
                log.info("userId in logdet[1] :"+logdet[1]);
                
                
              /* String lastlogin_id = db.getlastlogin_id(logdet[1]);
				
                if(lastlogin_id != null){
                db.updatelastlogin(lastlogin_id,logdet[1]);
                }else{
                db.insertuserid_lastlogin(logdet[1]);	
                }*/
                
                
         try {
			 membId=db.selectMembIdBasedonUserId(logdet[1]);
			 session.setAttribute("memberId",membId);
			 log.info("membId inside :"+membId);
		} catch (FinderException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}        
                session.setAttribute("firstName",logdet[3]);
                session.setAttribute("userName",login);
                session.setAttribute("userPassword",pass);
                status="success";
                request.setAttribute("status",status);
                 try {

        DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
        DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
       
        String str="C:/XML/";
        Document doc = docBuilder.parse (new File(str+"association-config.xml"));

        // normalize text representation
        doc.getDocumentElement ().normalize ();
         log.info ("Root element of the doc is " + doc.getDocumentElement().getNodeName());


        NodeList listOfPersons = doc.getElementsByTagName("first");
        int totalPersons = listOfPersons.getLength();
         for(int s=0; s<listOfPersons.getLength() ; s++){


            Node firstPersonNode = listOfPersons.item(s);
            if(firstPersonNode.getNodeType() == Node.ELEMENT_NODE){


                Element firstPersonElement = (Element)firstPersonNode;

                //-------
                NodeList firstNameList = firstPersonElement.getElementsByTagName("title");
                Element firstNameElement = (Element)firstNameList.item(0);

                NodeList textFNList = firstNameElement.getChildNodes();
                 log.info("Title Name : " + ((Node)textFNList.item(0)).getNodeValue().trim());
                 String titleName=((Node)textFNList.item(0)).getNodeValue().trim();
                 session.setAttribute("title",titleName);
              

            }


        }


    }catch (SAXParseException err) {
     log.info ("** Parsing error" + ", line " 
         + err.getLineNumber () + ", uri " + err.getSystemId ());
     log.info(" " + err.getMessage ());

    }catch (SAXException e) {
    Exception x = e.getException ();
    ((x == null) ? e : x).printStackTrace ();

    }catch (Throwable t) {
    	
    t.printStackTrace ();
     log.info("Inside catch block");
    request.setAttribute("status","conFailed");
    return new ModelAndView("frmLogin");
   // return mapping.findForward("ReLogin");
    }
                 
         //=================Role mgt Process=====================
                 
                 //String firName = (String) session.getAttribute("fname");
                 String userIdVal = (String)session.getAttribute("userId");
                  log.info("user id value Role mgt Process............."+userId);
               
                 
                 String requestStat=(String)request.getAttribute("requestStatus");
                 String req_Value=(String)request.getAttribute("requestValue");
                 log.info("Request Value is "+req_Value);
                String displayButton=(String)request.getAttribute("viewButton");
                 log.info("display button....."+displayButton);
                 log.info("RequestStatus In main board"+requestStat);
                 try {
                 log.info("KlgLoginAction.initDashboard()");
                 
                 ArrayList roleList = new ArrayList();
                 ArrayList entityList = new ArrayList();
                 //ArrayList allList = new ArrayList();
                
                 
    String viewVal=(String) session.getAttribute("viewVal");
   
   
    log.info("View Value in Action Role Mgt"+viewVal);
    
    
                 if(userIdVal != null)
                	  log.info("after userIdVal loop............."+userIdVal);
                     roleList = db.getAllRolesBasedOnUser(userIdVal);
                    // String generalRoleId = "bc559b5e-3aaf-47c4-8560-d10197c86119";
                
                     String roleId = null;
                    
                     if(roleList != null && roleList.size() != 0) {
                         Iterator itEntList = roleList.iterator();
                         if(itEntList.hasNext()) {
                             String[] strRolelist = (String[])(String[])itEntList.next();
                             roleId = strRolelist[2];
                         }
                     }         
                     if(roleId != null && roleId.trim().length() != 0) {
                        // allList = db.getMappingDetailsForRlEntPriv(roleId);
                         entityList = db.getMappingDetailsForRlEnt(roleId);
                    
                         String roleDetails[] = db.getRole(roleId);
                         String roleName = roleDetails[1];
                         if(roleName == null)
                             roleName = "";
                         session.setAttribute("roleId", roleId);
                         session.setAttribute("roleName", roleName);
                     } 
                     //*****************
                     if(roleId == null){
                    	 ArrayList eveList = db.geteveDetails();
                    	 request.setAttribute("eveList", eveList);
                    	 return new ModelAndView("participant_index"); 
                     }
                     
                     //****************88
                    // session.setAttribute("DBAllList", allList);
                     session.setAttribute("DBEntityList", entityList);
                    
                     
                    log.info("entityList size() in KlgLoginAction"+entityList.size());
 					
                   
                 }
                 catch(Exception eDisp) {
                     log.info("while calling initalDashboard:" + eDisp);
                 }
                 log.info("KlgLoginAction.initDashboard() sucessfully comes from servlet.");
                 session.setAttribute("userId",userIdVal);
                 session.setAttribute("memberId",membId);
                 if(requestStat.equalsIgnoreCase("true"))
                 {
                       log.info("first if ......");
                     session.setAttribute("requestStat","true");
                     session.setAttribute("req_Value","true");
                     
                      log.info("userId ::1"+userIdVal);
                     session.setAttribute("userId",userIdVal);
                     session.setAttribute("memberId",membId);
                     return new ModelAndView("dashboard");
                     //return mapping.findForward("LoginSuccess");
                 }
                 else if(displayButton!=null && requestStat.equalsIgnoreCase("false") && displayButton.equalsIgnoreCase("true"))
                 {
                      log.info("second if else......");

                     request.setAttribute("viewButton","true");
                     session.setAttribute("viewButton","true");

                     return new ModelAndView("frmIndex-no-role");
                     //return mapping.findForward("LoginSuccessNoRole");
                 }
                 else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("true"))
                 {
                      log.info("Third if else......");
                     request.setAttribute("viewButton","true");
                     session.setAttribute("viewButton","true");
                     session.setAttribute("requestStat","false");
                     session.setAttribute("req_Value","true");
                     
                     return new ModelAndView("frmIndex-no-role");
                    // return mapping.findForward("LoginSuccessNoRole");
                 }
                 else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("false"))
                     {
                         log.info("Fourth if else......");
                     session.setAttribute("requestStat","false");
                     session.setAttribute("req_Value","false");
                     return new ModelAndView("frmIndex-no-role"); 
                     //return mapping.findForward("LoginSuccessNoRole");
                 }
                 session.setAttribute("userId",userIdVal);
                 session.setAttribute("memberId",membId);
                  log.info("userId ::2"+userId);
                  return new ModelAndView("dashboard");
               // return mapping.findForward("callMainBoard");

             }
             else  {
                 status="fail";
                 request.setAttribute("status",status);
                 session.removeAttribute("adminUserId");
                 return new ModelAndView("frmMemberUserSignup"); 
               //  return mapping.findForward("ReLogin");
                 
             }
   
         }
         else{
             status="fail";
             request.setAttribute("status",status);
             session.removeAttribute("adminUserId");
             
             return new ModelAndView("frmMemberUserSignup");
             
         }
          
       }
       else if(loginProcess != null && loginProcess.equals("initIndex")){
    	  
           ArrayList privList = new ArrayList();
           ArrayList allList = new ArrayList();
          
    	   String userId = request.getParameter("UsrId");
    	   String entityId = request.getParameter("entityId");
    	   String roleId = request.getParameter("roleId");
    	   String memId= request.getParameter("membId");
    	   // log.info("memId in initIndex"+memId);
          
                   allList = db.getMappingDetailsForRlEntPrivPerm(roleId,entityId);              
                   privList = db.getMappingDetailsForRlEntPriv(roleId,entityId);
               
               session.setAttribute("DBAllList", allList);
               session.setAttribute("privList", privList);
                log.info("userId in index servlet : "+userId);
               session.setAttribute("userId",userId); 
               session.setAttribute("memberId",memId);
              log.info("entityList size() in KlgLoginAction"+privList.size()); 
    	   
    	  
    	   return new ModelAndView("index");
       }  
       
       else if(loginProcess != null && loginProcess.equals("initLogin")){
    	   String digiblitz="digiblitz";
    	   session.setAttribute("digiblitz",digiblitz);
    	   return new ModelAndView("frmHome");
       }
       else if(loginProcess != null && loginProcess.equals("profile_det")){
    	   String digiblitz="digiblitz";
    	   session.setAttribute("digiblitz",digiblitz);
    	   return new ModelAndView("frmHome");
       }
       else if(loginProcess != null && loginProcess.equals("demorequest")){
    	   
    	   /*String firstname = request.getParameter("firstname");
    	   String emailid = request.getParameter("emailid");
    	   String phone = request.getParameter("phone");
    	    */   	   
    	   
    	   String firstName = request.getParameter("firstname");
    	   String lastName = request.getParameter("lname");
    	   String emailId = request.getParameter("emailid");
    	   String phone = request.getParameter("phone");
    	   String company = request.getParameter("company");
    	   String description = request.getParameter("description");
    	   
    	   String contactFormType = "DemoRequest";
    	   
    	   String crmType = "Lead";
    	   
    	   contactUser.setFirstName(firstName);
    	   contactUser.setLastName(lastName);
    	   contactUser.setEmailId(emailId);
    	   contactUser.setPhoneNo(phone);
    	   contactUser.setCompanyName(company);    	   
    	   contactUser.setCrmType(crmType);
    	   
    	   contactUser.setContactFormType(contactFormType);
    	   
    	   //contactService.suiteCRMTarget(contactUser);
    	   //contactClient.contact(contactUser);
    	   
    	   log.info("in login action demoRequest");
    	   log.info("firstName ---> "+firstName+" emailId---> "+emailId+" phone---> "+phone);
    	   log.info("company ---> "+company+" description---> "+description);
    	 
    	   
    	   request.setAttribute("firstname",firstName);
    	   request.setAttribute("emailid",emailId);
    	   request.setAttribute("phone",phone);
    	   return new ModelAndView("frmDemoRequest");
       }
       else if(loginProcess != null && loginProcess.equals("contactUs")){
    	   
    	   String firstName = request.getParameter("firstName");
    	   String emailId = request.getParameter("email");
    	   String phone = request.getParameter("phone");
    	   String company = request.getParameter("company");
    	   String description = request.getParameter("description");
    	   
    	   String consultation = request.getParameter("consultation");
    	   String freeDemo = request.getParameter("freeDemo");
    	   String webinar = request.getParameter("webinar");
    	   String mailingList = request.getParameter("mailingList");
    	   
    	   String contactFormType = null;
    	   
    	   if(consultation != null){
    		   consultation = "I need a cosultation for my business";
    	   }else{
    		   consultation = "";
    	   }
    	   
    	   if(freeDemo != null){
    		   freeDemo = "I need a free Demo";
    	   }else{
    		   freeDemo = "";
    	   }
    	   
    	   if(webinar != null){
    		   webinar = "I would like to attend your webinar";
    	   }else{
    		   webinar = "";
    	   }
    	   
    	   if(mailingList != null){
    		   mailingList = "Add me to your mailing list";
    	   }else{
    		   mailingList = "";
    	   }
    	   
    	   String crmType = "Target";
    	   
    	   contactUser.setFirstName(firstName);
    	   contactUser.setLastName("");
    	   contactUser.setEmailId(emailId);
    	   contactUser.setPhoneNo(phone);
    	   contactUser.setCompanyName(company);  
    	   contactUser.setDescription(description);
    	   
    	   contactUser.setConsultation(consultation);
    	   contactUser.setFreeDemo(freeDemo);
    	   contactUser.setWebinar(webinar);
    	   contactUser.setMailingList(mailingList);
    	   
    	   contactUser.setCrmType(crmType);
    	   
    	   contactFormType = "ContactUs";
    	   
    	   contactUser.setContactFormType(contactFormType);
    	   
    	   //contactService.suiteCRMTarget(contactUser);
    	   
    	   //contactClient.contact(contactUser);
    	   
    	   log.info("in login action ");
    	   log.info("firstName ---> "+firstName+" emailId---> "+emailId+" phone---> "+phone);
    	   log.info("company ---> "+company+" description---> "+description);
    	 
      		
       }
       else if(loginProcess != null && loginProcess.equals("lavlitaChatCRM")){
    	   
    	   /*String fname = request.getParameter("fname");
    	   String lname = request.getParameter("lname");
    	   String emailId = request.getParameter("email");
*/
    	   String firstName = request.getParameter("fname");
    	   String lastName = request.getParameter("lname");
    	   String emailId = request.getParameter("email");
    	   String phone = request.getParameter("phone");
    	   String company = request.getParameter("company");
    	   String description = request.getParameter("description");
    	   
    	   String contactFormType = null;
    	   
    	   String crmType = "Target";
    	   
    	   contactUser.setFirstName(firstName);
    	   contactUser.setLastName(lastName);
    	   contactUser.setEmailId(emailId);
    	   contactUser.setPhoneNo(phone);
    	   contactUser.setCompanyName(company);    	   
    	   contactUser.setCrmType(crmType);
    	   
    	   contactFormType = "LavlitaChat";
    	   contactUser.setContactFormType(contactFormType);
    	   
    	   //contactService.suiteCRMTarget(contactUser);
    	   //contactClient.contact(contactUser);
    	   
    	   log.info("in login action lavlitaChatCRM");
    	   log.info("firstName ---> "+firstName+" emailId---> "+emailId+" phone---> "+phone);
    	   log.info("company ---> "+company+" description---> "+description);
    	  
       }
       else if(loginProcess != null && loginProcess.equals("contactSales")){
    	   
    	   /*String fname = request.getParameter("firstname");
    	   String lname = request.getParameter("lastname");
    	   String emailId = request.getParameter("emailid");*/
    	   
    	   String query = request.getParameter("query");    	   
    	   String firstName = request.getParameter("firstname");
    	   String lastName = request.getParameter("lastname");
    	   String emailId = request.getParameter("emailid");
    	   String phone = request.getParameter("phone");
    	   String company = request.getParameter("company");
    	   String description = request.getParameter("description");
    	   
    	   String crmType = "Target";
    	   
    	   String contactFormType = "Sales";
    	   
    	   contactUser.setFirstName(firstName);
    	   contactUser.setLastName(lastName);
    	   contactUser.setEmailId(emailId);
    	   contactUser.setPhoneNo(phone);
    	   contactUser.setCompanyName(company);    	   
    	   contactUser.setCrmType(crmType);
    	   contactUser.setContactFormType(contactFormType);
    	   
    	   //contactService.suiteCRMTarget(contactUser);
    	   //contactClient.contact(contactUser);
    	   
    	   log.info("in login action contactSales ");
    	   log.info("firstName ---> "+firstName+" emailId---> "+emailId+" phone---> "+phone);
    	   log.info("company ---> "+company+" description---> "+description);
    	 
    	   

     	   request.setAttribute("fname", firstName);
     	   request.setAttribute("lname", lastName);
     	   request.setAttribute("emailId", emailId);
     	   request.setAttribute("query", query);
     	   
    	   return new ModelAndView("frmContactSales");
       }
       else if(loginProcess != null && loginProcess.equals("DemoForm")){
    	   
    	   
    	   String name = request.getParameter("name");
    	   String emailid = request.getParameter("emailid");
    	   String phone = request.getParameter("phone");
    	   String company = request.getParameter("company");
    	   String description = request.getParameter("description");
    	   
    	   String consultation = request.getParameter("consultation");
    	   String freeDemo = request.getParameter("freeDemo");
    	   String webinar = request.getParameter("webinar");
    	   String mailingList = request.getParameter("mailingList");
    	   
    	   
    	   log.info("name --> "+name+" emailid --> "+emailid+" phone --> "+phone);
    	   log.info("company --> "+company+" description --> "+description);
    	   log.info("consultation --> "+consultation+" freeDemo --> "+freeDemo);
    	   log.info("webinar --> "+webinar+" mailingList --> "+mailingList);
    	   
    	   
       }
       else if(loginProcess != null && loginProcess.equals("newsLetter")){
    	   
    	   	String fileLocation = null;
    	    String fileSavePath;
		    final String UPLOAD_DIRECTORY = "C://profilePic//";
		    
    	   SimpleDateFormat formatter1 = null; 
    	   Date newsLetterSendDate = null;
    	   String strnewsLetterSendDate = null;
    	   String status = null;
    	   
    	   try{
    		   
    		   formatter1 = new SimpleDateFormat("dd-MM-yyyy"); 
    		   
    	  /* Date date = new Date();    	   
    	      	   
    	   String strDate = formatter1.format(date);   
    	   System.out.println("strDate ---> "+strDate);
    	   
    	   String str = "30-09-2017";
    	   Date date1 = formatter1.parse(str);
    	   
    	   Date newsDate = db.addDays(date1, 7);
    	   String newsStrDate = formatter1.format(newsDate);    	   
    	   System.out.println("newsStrDate ---> "+newsStrDate);
    	   */
    		   
    		   newsLetterSendDate = db.getWeeklyNewsLettreSendDate();
    		   strnewsLetterSendDate = formatter1.format(newsLetterSendDate);
    		   
    		   System.out.println("strnewsLetterSendDate ---> "+strnewsLetterSendDate);
    		   
    	   if(strnewsLetterSendDate != null){
    		   
    		   
    		   fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
   	        if (!(new File(fileSavePath)).exists()) {
   	            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
   	        }
   	        
   	        String resp = "";
   	        int i = 1;
   	        resp += "<br>Here is information about uploaded files.<br>";
   	        
   	        MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
               Part _part;
               while ((_part = parser.readNextPart()) != null) {
               	
               	String genName= _part.getName();
                   if (_part.isFile()) {
                       FilePart fPart = (FilePart) _part;  // get some info about the file
                       //String name = fPart.getFileName();
                       String name = "NewsLetter-"+strnewsLetterSendDate;
                       System.out.println("names---> "+name);
                       
                       if (name != null) {
                           long fileSize = fPart.writeTo(new File(fileSavePath));
                           resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
                           String saveFile=fileSavePath+name;
                           fileLocation=saveFile;//file_name=name;
                          
                           log.info("file path"+saveFile);	 
                       } else {
                           resp = "<br>The user did not upload a file for this part.";
                       }
                   }
               }               
               
               status = db.insertWeeklyNewsLetter(fileLocation, newsLetterSendDate);
               System.out.println("status ---> "+status);
    	   }
		   
    	   
    	   }catch(Exception e){
    		   e.printStackTrace();
    	   }
    	   
    	   return new ModelAndView("frmHome");
       }
     
       else if(loginProcess != null && loginProcess.equals("newsLetterSendDate")){
    	   
    	   SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
    	   
    	   String str = "02-10-2017";
    	
   		   try {
			/*Date date = formatter.parse(str);
			db.weeklyNewsLetterSendDate(date);*/
   			contactService.startNewsLetterPublishing();
   				   
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	   
    	   
       }
       
       return new ModelAndView("frmHome");
		
	}
	
	

public static Context getInitialContext() throws javax.naming.NamingException {
    Properties p =new Properties();
    p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
    p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
    p.setProperty( "java.naming.provider.url", "localhost:11199" );
    return new javax.naming.InitialContext(p);
  }           
}

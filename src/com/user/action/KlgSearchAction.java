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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
//import com.hlcutil.HLCMemberVO;
import com.login.action.KlgLoginAction;
import com.mysql.dao.MySQLDAO;
import com.util.XMLParser;

import org.springframework.web.servlet.DispatcherServlet;

public class KlgSearchAction implements Controller  {

	String userId = null;
    Vector vObj = new Vector();
    String status=null;
static Logger log = Logger.getLogger(KlgSearchAction.class.getName());
	
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
         HLCKaverySessionStatefulBean hrsBean=new HLCKaverySessionStatefulBean();
         HLCKaveryMembershipTypeSessionBean memTypBean=new HLCKaveryMembershipTypeSessionBean();
        
         GeneralDBAction db=new GeneralDBAction();	 
        
         HttpSession session=request.getSession(true); 
         String usrProcess=request.getParameter("searchProcess");
         
  //Breadcrumb navigation bar code start here
         
         String navPrivName=request.getParameter("navPrivName");
         String navAccsName=request.getParameter("navAccessName");
         
         
         session.setAttribute("navPrivName",navPrivName);
         session.setAttribute("navAccsName",navAccsName);
         
         //Breadcrumb navigation bar code end here
         
             if(usrProcess.equals("initViewDet")){
            	       	   
                   ArrayList roleList = new ArrayList();
                       roleList = (ArrayList)db.getAllRoles();

                    request.setAttribute("roleList",roleList);

                    return new ModelAndView("frmMemberSearchList");                   
               }
               
               else if(usrProcess.equals("humanSearch")){
                   log.info("SearchList Action humanSearch executing....");
                   ArrayList memberDetails = null;
                 
         //=========Dhivya Here:Search Users and Members========================
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                   String radMem=request.getParameter("radMem");
                       String  firstName = request.getParameter("fname");
                       String lastName = request.getParameter("lname");
                       String emailVal = request.getParameter("email");
                       String zipCode = request.getParameter("zip");
                       String logName = request.getParameter("loginName");
                       String frmDate = request.getParameter("frmDate");
                       String tDate = request.getParameter("toDate");
                       String rolId = request.getParameter("roleId");
           log.info("radMem in servlet&&&&&"+radMem);
            session.setAttribute("radMem",radMem);
                       String  fName = firstName.trim();
                       String lName = lastName.trim();
                       String email = emailVal.trim();
                       String zip = zipCode.trim();
                       String loginName = logName.trim();

                        Date fromDate = null;
           if (frmDate != null && frmDate.trim().length() != 0) {
               try {
				fromDate = (Date) sdf.parse(frmDate);
			} catch (ParseException e) {
			
				e.printStackTrace();
			}
               log.info("fromDate in servlet" + fromDate);
           }

                        Date toDate = null;
           if (tDate != null && tDate.trim().length() != 0) {
               try {
				toDate = (Date) sdf.parse(tDate);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
               log.info("toDate in servlet" + toDate);
           }
                       
                   
                       String roleId= rolId.trim();

                   if(radMem!=null && radMem.equalsIgnoreCase("members")){
                   String memID=request.getParameter("memberId");
                   String  memberId =memID.trim();             
                   session.setAttribute("searchMemId",memberId); 
                   if(memberId!=null && memberId.trim().length()!=0){
                       log.info("SearchList Action Found MemberSearch");
                       memberDetails = humanMemb.searchUserByMemberId(memberId);
                       
                     /*  if(memberDetails.size()==0){
                    	   memberDetails=db.selectFreeMemberDetailsByMemberId(memberId);
                       }
                       */
                      
                   } else{
                                     
                       session.setAttribute("fname",fName);
                       session.setAttribute("lname",lName);
                       session.setAttribute("email",email);
                       session.setAttribute("zip",zip);
                       session.setAttribute("login_Name",loginName);
                       session.setAttribute("fromDate",fromDate);
                       session.setAttribute("toDate",toDate);
                       session.setAttribute("roleIds",roleId);
                       
                       if((fName!=null && fName.trim().length()!=0) || (lName!=null && lName.trim().length()!=0)
                       || (email!=null && email.trim().length()!=0) || (zip!=null && zip.trim().length()!=0) 
                       || (fromDate!=null) || (toDate!=null)
                       || (roleId!=null && roleId.trim().length()!=0)){
                           memberDetails = (ArrayList)humanMemb.searchUserByGeneral(fName, lName, email, zip, fromDate,toDate,roleId,radMem);
                       /*    if(memberDetails.size()==0){
                        	   memberDetails=db.selectFreeMemberDetailsByGeneralSearch(fName, lName, email, zip, fromDate,toDate,roleId,radMem);   
                           }
                           */
                       } else if(loginName!=null && loginName.trim().length()!=0) {
                           log.info("SearchList Action Found LoginSearch");
                           memberDetails = (ArrayList)humanMemb.searchUserByLoginName(loginName,radMem);                    
                        /*
                           if(memberDetails.size()==0){
                        	   memberDetails=db.selectFreeMemberDetailsByLoginName(loginName,radMem);
                           }
                           */
                       }
                       
                   }

                   }else if(radMem!=null && radMem.equalsIgnoreCase("nonMembers")){

                       session.setAttribute("fname",fName);
                       session.setAttribute("lname",lName);
                       session.setAttribute("email",email);
                       session.setAttribute("zip",zip);
                       session.setAttribute("login_Name",loginName);
                       session.setAttribute("fromDate",fromDate);
                       session.setAttribute("toDate",toDate);
                       session.setAttribute("roleId",roleId);

                       if((fName!=null && fName.trim().length()!=0) || (lName!=null && lName.trim().length()!=0)
                       || (email!=null && email.trim().length()!=0) || (zip!=null && zip.trim().length()!=0)
                       || (fromDate!=null) || (toDate!=null) || (roleId!=null && roleId.trim().length()!=0)){
                          memberDetails = (ArrayList)humanMemb.searchUserByGeneral(fName, lName, email, zip, fromDate,toDate,roleId,radMem);                    
                      /*  
                          if(memberDetails.size()==0){
                       	   memberDetails=db.selectFreeMemberDetailsByGeneralSearch(fName, lName, email, zip, fromDate,toDate,roleId,radMem);   
                          }
                          */
                       } else if(loginName!=null && loginName.trim().length()!=0) {
                           log.info("SearchList Action Found LoginSearch");
                           memberDetails = (ArrayList)humanMemb.searchUserByLoginName(loginName,radMem);
                         /*
                           if(memberDetails.size()==0){
                        	   memberDetails=db.selectFreeMemberDetailsByLoginName(loginName,radMem);
                           }   
                           */
                          
                       }
                   }   
                     request.setAttribute("memberDetails",memberDetails);

                     return new ModelAndView("frmMemberSearchResultList");  
                  
               }         
               
               else if(usrProcess.equals("loginProcess")){
                   log.info("Search loginProcess executing........");
                  
                   
                   String staff_user_id = (String) session.getAttribute("userId");
                   log.info("staff_user_id is "+staff_user_id);
                   session.setAttribute("staff_user_id",staff_user_id);
                   
                   String  userId =   request.getParameter("userId");
                   String mailAddressStatus = request.getParameter("mailAddressStatus");
                   String splNote="";
                   if(request.getParameter("splNote")!=null && request.getParameter("splNote").trim().length() != 0){
                       splNote = request.getParameter("splNote");
                       System.out.println("splNote is assigned");
                   }
                   boolean AddressStatus = false;
                   if(mailAddressStatus!=null ){
                       System.out.println("inside mailAddressStatus!=null");
                       if(mailAddressStatus.equals("true")){
                           AddressStatus = true;
                           System.out.println("AddressStatus = true");
                       }
                   }
                   
                   System.out.println("Checking mailAddressStatus:"+mailAddressStatus);
                   System.out.println("Checking userID:"+userId);
                   System.out.println("Checking splNote:"+splNote);
                   boolean updateStatus = memTypBean.updateUserMemberFlag(userId,splNote,AddressStatus);
                   if(updateStatus){
                       System.out.println("Inside servlet view Action updateUserMemberFlag Successfull"+updateStatus);
                   } else {
                       System.out.println("Inside Servlet Action updateUserMemberFlag failed");
                   }
                   
                   if(userId!=null && userId.trim().length()!=0) {
                       request.setAttribute("userId" , userId);
                       String backButton="";
                       if(request.getParameter("Back")!=null && request.getParameter("Back").trim().length()!=0){
                           backButton = request.getParameter("Back");
                       }
                       if(backButton.equalsIgnoreCase("Update")){
                    	   return new ModelAndView("frmMemberSearchList");
                       }else{
                           request.setAttribute("loginProcess", "adminByAdmin");
                           
                           int totalXMLUsers=0;int totalUsersAssignedRole=0;
               			 
               		
                        String login,pass = "";
                                String userName="";
                                String userPassword="";
                        String adminUsrId = null;
                        
                        vObj=null;
                       
                        adminUsrId =(String)session.getAttribute("userId");
                        log.info("adminUsrId :"+adminUsrId);
                        
                        String memberId = (String) session.getAttribute("searchMemId");
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
                        session.setAttribute("firstName",null);
                        session.setAttribute("userTypeName",null);
                        session.setAttribute("emailId",null);
                        session.setAttribute("memberId",null);
                        session.setAttribute("periodValue",null);
                        session.setAttribute("userTypeId",null);
                        
                        
                           String fileEncryptedContent=XMLParser.readXMLCreated("C://XML//license-config.xml");
                           String original=XMLParser.decryptFileContent(fileEncryptedContent);
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
                          
                          
                         
                           //System.out.println("File content"+original);
                           totalXMLUsers=XMLParser.readFromXMLUsers(original); // Reading licensed users from license file .
                           try{
                           totalUsersAssignedRole=humanMemb.getUserCountBasedOnRole();
                           System.out.println("Inside totalUsersAssignedRole...."+totalUsersAssignedRole);
                           if(totalUsersAssignedRole==-1)
                           {
                           	System.out.println("Inside if block....");
                            return new ModelAndView("callErrorPage");
                           //	return mapping.findForward("callErrorPage");
                           }
                           
                           }
                           catch (Exception e)
                           {
                           	System.out.println("Inside catch block....");
                           }
                          //System.out.println("XML users"+totalXMLUsers+"  DB users"+totalUsersAssignedRole);
                          
                           userId = (String)request.getAttribute("userId");
                           log.info("   Admin Login Process userId:" + userId);
                           if(userId != null && userId.trim().length() != 0){
                               try {
                				vObj = humanMemb.getLoginStatusByUserId(userId);
                			} catch (SQLException e) {
                				// TODO Auto-generated catch block
                				e.printStackTrace();
                			}
                               session.setAttribute("loggedBy","Admin");
                               session.setAttribute("adminUserId",adminUsrId);
                               
                               ArrayList DBLeftPrivlegeList = new ArrayList();
                               DBLeftPrivlegeList = (ArrayList) session.getAttribute("DBLeftPrivlegeList");
                               
                               session.setAttribute("DBLeftPrivlegeList",null);
                               session.setAttribute("DBLeftPrivlegeListTemp",DBLeftPrivlegeList);
                               
                               session.setAttribute("adminUserId",adminUsrId);
                               log.info("adminUserId before logging as user :"+adminUsrId);
                           }  
                           
                           
             if(vObj != null && vObj.size() != 0){

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
                             //System.out.println("If equal");
                             status="users";
                             request.setAttribute("status",status);
                             //System.out.println("If equal");
                             session.removeAttribute("adminUserId");
                             return new ModelAndView("frmHome");
                             //return mapping.findForward("ReLogin");
                         }
                             
                         else if(totalUsersAssignedRole<=totalXMLUsers)
                         {
                           request.setAttribute("requestStatus","true");
                           //System.out.println("If less");
                         }
                     }  
                   
                    
                    
                    session.setAttribute("userCode",logdet[2]);
                    session.setAttribute("userName",userName);
                    session.setAttribute("userPassword",userPassword);
                    session.setAttribute("userTypeName",logdet[4]);
                    session.setAttribute("emailId",logdet[5]);
                    session.setAttribute("memberId",logdet[6]);
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
                    session.setAttribute("searchMemId",memberId);
                    session.setAttribute("fromDate",frmDate);
                    session.setAttribute("toDate",tDate);
                    session.setAttribute("rolesId",rolId);
                    session.setAttribute("radMem",radMem);
                    System.out.println(logdet[0]+" "+logdet[1]+" "+logdet[2]+" "+logdet[3]+" "+logdet[4]+" "+logdet[5]+" "+logdet[6]+" "+logdet[7]+" "+logdet[8]+" "+logdet[9] + " " + logdet[10] + " " + logdet[11]);
                       //return mapping.findForward("LoginSuccess");
                  String msgCount = String.valueOf(db.totalMessageCount(logdet[1].trim()));
                    session.setAttribute("msgCount",msgCount);
                    
                    boolean updateStat=humanMemb.updateLoginDate(logdet[1]);
                    log.info("remote.updateLoginDate() in servlet :"+updateStat);
                   
                      session.setAttribute("sessionId",session.getId()); 
                    session.setAttribute("userId",logdet[1]);
                    session.setAttribute("firstName",logdet[3]);
                    status="success";
                    request.setAttribute("status",status);
                     try {

            DocumentBuilderFactory docBuilderFactory = DocumentBuilderFactory.newInstance();
            DocumentBuilder docBuilder = docBuilderFactory.newDocumentBuilder();
           
            String str="C:/XML/";
            Document doc = docBuilder.parse (new File(str+"association-config.xml"));

            // normalize text representation
            doc.getDocumentElement ().normalize ();
            System.out.println ("Root element of the doc is " + doc.getDocumentElement().getNodeName());


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
                    System.out.println("Title Name : " + ((Node)textFNList.item(0)).getNodeValue().trim());
                     String titleName=((Node)textFNList.item(0)).getNodeValue().trim();
                     session.setAttribute("title",titleName);
                  

                }


            }


        }catch (SAXParseException err) {
        System.out.println ("** Parsing error" + ", line " 
             + err.getLineNumber () + ", uri " + err.getSystemId ());
        System.out.println(" " + err.getMessage ());

        }catch (SAXException e) {
        Exception x = e.getException ();
        ((x == null) ? e : x).printStackTrace ();

        }catch (Throwable t) {
        	
        t.printStackTrace ();
        System.out.println("Inside catch block");
        request.setAttribute("status","conFailed");
        return new ModelAndView("frmHome");
       // return mapping.findForward("ReLogin");
        }
                     
             //=================Role mgt Process=====================
                     
                     String firName = (String) session.getAttribute("fname");
                     String userIdVal = (String)session.getAttribute("userId");
                     log.info("firName inside the role Process:: "+firName);
                     
                     String requestStat=(String)request.getAttribute("requestStatus");
                     String req_Value=(String)request.getAttribute("requestValue");
                    System.out.println("Request Value is "+req_Value);
                    String displayButton=(String)request.getAttribute("viewButton");
                    System.out.println("display button....."+displayButton);
                     log.info("RequestStatus In main board"+requestStat);
                     try {
                     log.info("ActionRoleMangement.initDashboard()");
                     
                    // System.out.println("user id value............."+userIdVal);
                     ArrayList roleList = new ArrayList();
                     ArrayList entityList = new ArrayList();
                    // ArrayList allList = new ArrayList();
                     ArrayList generalPrivList = new ArrayList();
                     ArrayList genealRoleList = new ArrayList();
                     ArrayList privilegeList = new ArrayList();
                     ArrayList permissionList = new ArrayList();
                     ArrayList privilegeSubList = new ArrayList();
                     ArrayList roleSubList = new ArrayList();
                     ArrayList privilegeMList = new ArrayList();
                     
        String viewVal=(String) session.getAttribute("viewVal");
       
        session.setAttribute("fName",firName);
        log.info("firName Value in LoginAction"+firName);
        
        log.info("View Value in Action Role Mgt"+viewVal);
        
        
                     if(userIdVal != null)
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
                        // session.setAttribute("DBAllList", allList);
                         session.setAttribute("DBEntityList", entityList);
                         session.setAttribute("userIdVal", userIdVal); 
                         
                       
     					
                       
                     }
                     catch(Exception eDisp) {
                         log.info("while calling initalDashboard:" + eDisp);
                     }
                     log.info("ActionRoleMangement.initDashboard() sucessfully comes from servlet.");
                     session.setAttribute("userId",userIdVal);
                     if(requestStat.equalsIgnoreCase("true"))
                     {
                          System.out.println("first if ......");
                         session.setAttribute("requestStat","true");
                         session.setAttribute("req_Value","true");

                         return new ModelAndView("dashboard");
                         //return mapping.findForward("LoginSuccess");
                     }
                     else if(displayButton!=null && requestStat.equalsIgnoreCase("false") && displayButton.equalsIgnoreCase("true"))
                     {
                         System.out.println("second if else......");

                         request.setAttribute("viewButton","true");
                         session.setAttribute("viewButton","true");

                         return new ModelAndView("frmIndex-no-role");
                         //return mapping.findForward("LoginSuccessNoRole");
                     }
                     else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("true"))
                     {
                         System.out.println("Third if else......");
                         request.setAttribute("viewButton","true");
                         session.setAttribute("viewButton","true");
                         session.setAttribute("requestStat","false");
                         session.setAttribute("req_Value","true");
                         
                         return new ModelAndView("frmIndex-no-role");
                        // return mapping.findForward("LoginSuccessNoRole");
                     }
                     else if(requestStat.equalsIgnoreCase("false") && req_Value.equalsIgnoreCase("false"))
                         {
                            System.out.println("Fourth if else......");
                         session.setAttribute("requestStat","false");
                         session.setAttribute("req_Value","false");
                         return new ModelAndView("frmIndex-no-role"); 
                         //return mapping.findForward("LoginSuccessNoRole");
                     }
                     session.setAttribute("userId",userIdVal);
                     return new ModelAndView("dashboard");
                   // return mapping.findForward("callMainBoard");

                 }
                 else  {
                     status="fail";
                     request.setAttribute("status",status);
                     session.removeAttribute("adminUserId");
                     return new ModelAndView("frmHome"); 
                   //  return mapping.findForward("ReLogin");
                     
                 }
       
             
             }else{
                 status="fail";
                 request.setAttribute("status",status);
                 session.removeAttribute("adminUserId");
                 
                 return new ModelAndView("frmHome");
                 
             }
                        
                       }
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

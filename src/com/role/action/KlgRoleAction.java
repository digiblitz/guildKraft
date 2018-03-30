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
package com.role.action;


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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
 
//import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;
import org.xml.sax.SAXParseException;

import com.AD.action.NewUser;
import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.util.XMLParser;

import com.hlcmsg.groups.*;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
//import com.hlcutil.HLCMemberVO;

import org.springframework.ui.ModelMap;
//import org.springframework.context.ApplicationContexweewewewewewewewewwt;
import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.systinet.uddi.ResourceBundle;


public class KlgRoleAction implements Controller {

	String userId = null;
    Vector vObj = new Vector();
    String status=null;
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
         
         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
         GeneralDBAction db=new GeneralDBAction();	 
        
         HttpSession session=request.getSession(true); 
         String roleProcess=request.getParameter("roleProcess");
         
         if(roleProcess!=null && roleProcess.equals("initUserRole")){
        	 
        	 
        	
             int usersFromDB=humanMemb.getUserCountBasedOnRole();
             
             String license_file_path="C://XML//license-config.xml";
             
             String fileEncryptedContent = XMLParser.readXMLCreated(license_file_path);
             String original = XMLParser.decryptFileContent(fileEncryptedContent); //validating  Registered Users Count
             int usersFromXML = XMLParser.readFromXMLUsers(original);
             if(usersFromDB<usersFromXML) // if users from Database are less than In license file
             {

             try{
                 Debug.print("ActionRoleMangement.initUserRole()");
                 String userIdVal = request.getParameter("userId");
                 String empMapScr = request.getParameter("empScr");
                 String login_Name = request.getParameter("login_name");
                 
                 if(empMapScr!=null || empMapScr!="")
                 {
                 	 request.setAttribute("empMapScr","empMapScr");
                 }
                 //String userIdVal = (String)session.getAttribute("userId");
                 ArrayList roleList = new ArrayList();
                 ArrayList userRoles = new ArrayList();
                 ArrayList usrViewPnt = new ArrayList();
                 roleList = (ArrayList)db.getAllRoles();
                 userRoles = (ArrayList)db.getAllRolesBasedOnUser(userIdVal);
                 String usrCrit="";
                 ArrayList userContactDetail = new ArrayList();
                 if(userIdVal!=null){
                     userContactDetail = (ArrayList)humanMemb.getUserContactDetails(userIdVal);
                    // usrCrit=remote.getusrCriteria(userIdVal);
                     usrViewPnt=humanMemb.getUserViewPoints(userIdVal);
                     //request.setAttribute("usrCrit" ,usrCrit);
                     request.setAttribute("usrViewPnt" ,usrViewPnt);
                 }
                 
                 ArrayList viewPoint=db.getAllViews();
                request.setAttribute("userContactDetails" ,null);
                request.setAttribute("userContactDetails" ,userContactDetail);

                request.setAttribute("userId",userIdVal);
                request.setAttribute("roleDetails" ,null);
                request.setAttribute("roleDetails" ,roleList);

                request.setAttribute("userRoleDetails" ,null);
                request.setAttribute("userRoleDetails" ,userRoles);
                request.setAttribute("viewPoint" ,viewPoint);
                request.setAttribute("login_name", login_Name);
                System.out.println("login_Name >>------------>"+login_Name);
                
             }
             catch(Exception eDisp){
                 Debug.print("while getting initUserRole:" + eDisp);
             }

             Debug.print("ActionRoleMangement.initUserRole() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMUserRoleMapping");
             
             }
             else if(usersFromDB==usersFromXML)
            	 return new ModelAndView("frmUserRoleAssignAccessDenied");
         
        	 
         }
         else if(roleProcess.equals("mapUserRoles")){
  /*      	 boolean addUsrToGroupStatus = false;
        	 try{
        	 String roleId = request.getParameter("roleIds");
        	 System.out.println("RoleId from Jsp : "+roleId);
        	 
             String roleName = db.getRoleNameByRoleId(roleId);
             request.setAttribute("roleNameValue", roleName);
             System.out.println("Role name in servlet : "+roleName);
             
             String first_Name = request.getParameter("firstname");
             request.setAttribute("firstName", first_Name);
             System.out.println("First name in servlet : "+first_Name);
             
             String last_Name = request.getParameter("lastname");
             request.setAttribute("lastName", last_Name);
             System.out.println("Last name in servlet : "+last_Name);
             
             String user_Name = request.getParameter("username");
             System.out.println("User name in servlet : "+user_Name);
             
             NewUser nu = new NewUser();
             addUsrToGroupStatus = nu.addUserToGroup(first_Name, last_Name, roleName, user_Name);
             //addUsrToGroupStatus = nu.addUserToGroup(first_Name1, last_Name1);
             
        	 }catch(Exception eLDAP){
                 Debug.print("Failed to Map User with Role in Active Directory:" + eLDAP);
        	 }
             if(addUsrToGroupStatus == true){
                 System.out.println("Successfully user mapped with Role in Active Directory ::");
                 
                 */

             ArrayList userContactDetail = new ArrayList();
            try{
                Debug.print("KlgRoleAction.mapUserRoles()");
               
                 String roleIds = request.getParameter("roleIds");
                 String empScreen=request.getParameter("empScreen");
                  ArrayList roleList = new ArrayList();
                 roleList = (ArrayList)db.getAllRoles();
                 String rolId=null;String rolName=null;
                Debug.print("roleIds:" + roleIds);
                String userIdVal = request.getParameter("userId");
            //==================Dhivya Here:User View==============================    
                
                String viewPntCnt = request.getParameter("viewPntCnt");
                String usrCrit = request.getParameter("usrCrit");
                String fname=request.getParameter("firstname");
                String lname=request.getParameter("lastname");
                
                request.setAttribute("firstName", fname);
                request.setAttribute("lastName", lname);
                
                int viewpntSize = 0;
                  if(viewPntCnt!=null && viewPntCnt.trim().length()!=0){
                	  viewpntSize = Integer.parseInt(viewPntCnt);
                  }   
                 
                  for(int i=0; i<viewpntSize; i++){
                	  if(request.getParameter("viewPnt"+i)!=null && request.getParameter("viewPnt"+i)!=""){	                    		 	                    		  
       	               String viewPnt = request.getParameter("viewPnt"+i); 
       	               
       	               
       	           boolean result=humanMemb.updateUserCriteria(userIdVal,viewPnt,usrCrit);    
       	                                
                	  }  
                  }
                  
                
                 StringTokenizer strTkns = new StringTokenizer(roleIds,"#");
               String userList="";
                while(strTkns.hasMoreTokens()){
                    try{
                        String roleId = (String)strTkns.nextToken();
                         Iterator listName=roleList.iterator();
                       while(listName.hasNext())
                       {
                          String strRoleName[] =(String[])listName.next();
                           rolId=strRoleName[0];
                          rolName=strRoleName[1];
                          if(roleId.equalsIgnoreCase(rolId))
                          {
                              //userList=rolName;
                              userList=userList+rolName+",";

                          }


                    }

                    }
                    catch(Exception e){
                        Debug.print("Exception while spliting privilegeIds KlgRoleAction.mapUserRoles() :" + e);
                    }
                }

                   request.setAttribute("userNameList",userList);
                   System.out.println("user name list....."+userList);
                

                 //For Debug Starts
                   humanMemb.deactivateRequestStatus(userIdVal,true);
                 //For Debug Ends
                if(userIdVal!=null){
                    userContactDetail = (ArrayList)humanMemb.getUserContactDetails(userIdVal);
                }


                request.setAttribute("userId",userIdVal);



                strTkns = new StringTokenizer(roleIds,"#");
                ArrayList rolesList = new ArrayList();
                while(strTkns.hasMoreTokens()){
                    try{
                        String roleId = (String)strTkns.nextToken();
                        if(roleId!=null && roleId.trim().length()!=0){
                            Debug.print("KlgRoleAction.mapUserRoles() Added from Stokenizer:" + roleId);
                            rolesList.add(roleId);
                        }
                    }
                    catch(Exception e){
                        Debug.print("Exception while spliting privilegeIds KlgRoleAction.mapUserRoles() :" + e);
                    }
                }

                if(userIdVal!=null){
                    Debug.print("KlgRoleAction.mapUserRoles() All Ids Are valid");
                    db.createMappingUserWithRoles(userIdVal, rolesList);
                }

            }
            catch(Exception eDisp){
                Debug.print("while getting mapUserRoles:" + eDisp);
            }
            request.setAttribute("userContactDetails" ,userContactDetail);
            Debug.print("KlgRoleAction.mapUserRoles() sucessfully comes from servlet.");
            
            return new ModelAndView("frmRolAssignCnf"); 
            
            
          //   }
        	
       }
         
         else if(roleProcess.equals("initRoleEntPriv")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             try{
                 Debug.print("ActionRoleMangement.initRoleEntPriv()");
                 ArrayList roleList = new ArrayList();
                 roleList = (ArrayList)db.getAllRoles();

                 request.setAttribute("roleDetails" ,null);
                 request.setAttribute("roleDetails" ,roleList);
             }
             catch(Exception eDisp){
                 Debug.print("while getting initEntPriv:" + eDisp);
             }

             Debug.print("ActionRoleMangement.initRoleEntPriv() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMRoleMapping"); 
             //return mapping.findForward("frmRolMRoleMapping");
         } 
         
         else if(roleProcess.equals("initSelectRoleEnt")){
             try{
                 Debug.print("ActionRoleMangement.initSelectRoleEnt()");
                 String roleId = request.getParameter("roleId");
                 Debug.print("roleId:" + roleId);
                 request.setAttribute("roleId",roleId);

                 Debug.print("ActionRoleMangement.initSelectRoleEnt()");
                 ArrayList roleList = new ArrayList();
                 ArrayList mapRoleEnt = new ArrayList();

                 roleList = (ArrayList)db.getAllRoles();
                 mapRoleEnt = db.getMappingDetailsForRoleAndPrivileges(roleId);

                 request.setAttribute("roleDetails" ,null);
                 request.setAttribute("roleDetails" ,roleList);

                 request.setAttribute("mapDetails" ,null);
                 request.setAttribute("mapDetails" ,mapRoleEnt);

             }
             catch(Exception eDisp){
                 Debug.print("while getting initSelectRoleEnt:" + eDisp);
             }

             Debug.print("ActionRoleMangement.initSelectRoleEnt() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMRoleMapping"); 
         }
         
         else if(roleProcess.equals("initSelectRoleEntPriv")){
             try{
                 Debug.print("ActionRoleMangement.initSelectRoleEntPriv()");
                 String roleId = request.getParameter("roleId");
                 String entityId = request.getParameter("entityId");
                 Debug.print("roleId:" + roleId);
                 request.setAttribute("roleId",roleId);
                 Debug.print("entityId:" + entityId);
                 request.setAttribute("entityId",entityId);

                 ArrayList roleList = new ArrayList();
                 ArrayList mapRoleEnt = new ArrayList();
                 ArrayList mapEntPriv = new ArrayList();
                 ArrayList mapRoleEntPriv = new ArrayList();
                   ArrayList mapRoleEntPrivPer = new ArrayList();
                 ArrayList mapRoleSubPer = new ArrayList();


                 roleList = (ArrayList)db.getAllRoles();
                 mapRoleEnt = db.getMappingDetailsForRoleAndPrivileges(roleId);

                 if(entityId!=null){
                     mapEntPriv = db.getMappingDetailsForEnitityAndPrivileges(entityId);
                 }

                 if(roleId!=null && entityId!=null){
                     mapRoleEntPriv = db.getPermissionBasedOnEntityRole(roleId,entityId);
                 }


               //Start:[RoleMgt] For Role,Privilege,Permission Mapping
              ArrayList subPermList = new ArrayList();
                 subPermList = (ArrayList)db.getMappingDetailsForRoleSubPerm();

                 request.setAttribute("allSubPerm" ,null);
                 request.setAttribute("allSubPerm" ,subPermList);
                 ArrayList permList = new ArrayList();
                 permList = (ArrayList)db.getAllPermission();
                 //For Debug
                 ArrayList allMapPrivList = new ArrayList();
                 allMapPrivList = (ArrayList)db.getAllMapPrivilege(roleId, entityId);

                 request.setAttribute("allMapPrivDetails" ,null);
                 request.setAttribute("allMapPrivDetails" ,allMapPrivList);

                 ArrayList allMapPermList = new ArrayList();
                 allMapPermList = (ArrayList)db.getAllMapPermission(roleId, entityId);

                 request.setAttribute("allMapPermDetails" ,null);
                 request.setAttribute("allMapPermDetails" ,allMapPermList);
                 request.setAttribute("permissionDetails" ,null);
                 request.setAttribute("permissionDetails" ,permList);

                 request.setAttribute("roleDetails" ,null);
                 request.setAttribute("roleDetails" ,roleList);

                 request.setAttribute("mapDetails" ,null);
                 request.setAttribute("mapDetails" ,mapRoleEnt);

                 request.setAttribute("mapEntPrivDetails" ,null);
                 request.setAttribute("mapEntPrivDetails" ,mapEntPriv);

                 request.setAttribute("mapRoleEntPrivDetails" ,null);
                 request.setAttribute("mapRoleEntPrivDetails" ,mapRoleEntPriv);

             }
             catch(Exception eDisp){
                 Debug.print("while getting initSelectRoleEntPriv:" + eDisp);
             }

             Debug.print("ActionRoleMangement.initSelectRoleEntPriv() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMRoleMapping"); 
         } 
         
         else if(roleProcess.equals("mapRoleEntityPrivPerms")){
             try{
                 Debug.print("ActionRoleMangement.mapRoleEntityPrivPerms()");
                 String roleId = request.getParameter("roleId");
                 String entityId = request.getParameter("entityId");
                 Debug.print("roleId:" + roleId);
                 request.setAttribute("roleId",roleId);
                 Debug.print("entityId:" + entityId);
                 request.setAttribute("entityId",entityId);

                 if(roleId!=null && roleId.trim().length()!=0 && entityId!=null && entityId.trim().length()!=0){
                     Debug.print("ActionRoleMangement.mapRoleEntityPrivPerms() Role ID and EntityIds are valid");
                     String PrivPermIds = request.getParameter("PrivPermIds");
                     Debug.print("PrivPermIds:" + PrivPermIds);
                     ArrayList privPermList = new ArrayList();
                     if(PrivPermIds!=null && PrivPermIds.trim().length()!=0){
                         StringTokenizer strTkns = new StringTokenizer(PrivPermIds,"#");
                         while(strTkns.hasMoreTokens()){
                             try{
                                 String permIds = (String)strTkns.nextToken();
                                 StringTokenizer strTknPerm = new StringTokenizer(permIds,"!");
                                 while(strTknPerm.hasMoreTokens()){
                                     String privId = (String)strTknPerm.nextToken();
                                     String permissionId = (String)strTknPerm.nextToken();
                                     Debug.print("Splitted privId:" + privId);
                                     Debug.print("Splitted permissionId:" + permissionId);
                                     if(privId!=null && permissionId!=null && privId.trim().length()!=0 && permissionId.trim().length()!=0){
                                         String [] arrayPrivPerm = {privId,permissionId};
                                         privPermList.add(arrayPrivPerm);
                                     }
                                 }
                             }
                             catch(Exception e){
                                 Debug.print("Exception while spliting privilegeIds and PermissionIds ActionRoleMangement.mapRoleEntityPrivPerms() :" + e);
                             }
                         }
                     }
                                     //For Debug Starts
                                     String permSubPermIds[] = request.getParameterValues("subPermChk");
                                     String permId = null;
                                     String subPermId = null;
                                     int permSubPermLen = 0;

                                     if(permSubPermIds!=null && !permSubPermIds.equals(""))
                                     {
                                         permSubPermLen = permSubPermIds.length;
                                     }

                                    
                                     String permIdArr[] = new String[permSubPermLen];
                                 
                                     String subPermIdArr[] = new String[permSubPermLen];
                                  
                                     if(permSubPermIds!=null){
                                     for(int i=0;i <permSubPermIds.length; i++)
                                     {
                                             StringTokenizer permSubPermTkns = new StringTokenizer(permSubPermIds[i],"#");
                                                 System.out.println("String token 1 "+permSubPermIds[i]);
                                             while(permSubPermTkns.hasMoreTokens()){

                                                  permId =  (String)permSubPermTkns.nextToken();
                                                  System.out.println("String token 2 "+permId);

                                                  subPermId =  (String)permSubPermTkns.nextToken();
                                                  System.out.println("String token 3 "+subPermId);
                                             }
                                              permIdArr[i] =  permId;
                                              subPermIdArr[i] =  subPermId;
                                              System.out.println("String token 4 "+permIdArr[i] +"===="+subPermIdArr[i]);

                                     }
                     }
                                         System.out.println("String token 5 ");
                                     //roleRemote.generateMappingPermSubPerm(permIdArr,subPermIdArr);
                                       System.out.println("String token 6 ");
                                     //For Debug Ends
                     Debug.print("ActionRoleMangement.mapRoleEntityPrivPerms() All Ids Are valid");
                     db.generateMappingRoleWithEntitiesAndPrivileges(roleId, entityId, privPermList);
                 }
             }
             catch(Exception eDisp){
                 Debug.print("while generation mapUserRoles:" + eDisp);
             }

             Debug.print("ActionRoleMangement.mapRoleEntityPrivPerms() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMRoleMapping"); 
            // return mapping.findForward("redirectFromRolesEntityPrivMap");
         }  
     
         
      
       //==================================================init Role mapping with Entities =====================================================================================
         else if(roleProcess.equals("initRoleEnt")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             try{
                 Debug.print("ActionRoleMangement.initRoleEnt()");
                 ArrayList roleList = new ArrayList();
                 ArrayList entityList = new ArrayList();
                 roleList = (ArrayList)db.getAllRoles();
                 entityList = (ArrayList)db.getAllEntity();

                 request.setAttribute("roleDetails" ,null);
                 request.setAttribute("roleDetails" ,roleList);

                 request.setAttribute("enityDetails" ,null);
                 request.setAttribute("enityDetails" ,entityList);
             }
             catch(Exception eDisp){
                 Debug.print("while getting initEntPriv:" + eDisp);
             }

             Debug.print("ActionRoleMangement.initRoleEnt() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMEntityRoleMapping");
            
         }
         
       //==================================================initSelect Role mapping with Enities =====================================================================================
         else if(roleProcess.equals("roleEntSelect")){
             try{
                 String roleId = request.getParameter("roleId");
                 if(roleId!=null){
                     Debug.print("ActionRoleMangement.roleEntSelect()");
                     ArrayList roleList = new ArrayList();
                     ArrayList entityList = new ArrayList();
                     ArrayList mapRoleEnt = new ArrayList();
                     roleList = (ArrayList)db.getAllRoles();
                     entityList = (ArrayList)db.getAllEntity();

                     mapRoleEnt = db.getMappingDetailsForRoleAndPrivileges(roleId);

                     request.setAttribute("roleDetails" ,null);
                     request.setAttribute("roleDetails" ,roleList);

                     request.setAttribute("enityDetails" ,null);
                     request.setAttribute("enityDetails" ,entityList);

                     request.setAttribute("mapDetails" ,null);
                     request.setAttribute("mapDetails" ,mapRoleEnt);
                     request.setAttribute("roleId", roleId);
                     //{mapEntityId, roleIdVal, entityId, roleName, entityName};
                 }
             }
             catch(Exception eDisp){
                 Debug.print("while getting roleEntSelect:" + eDisp);
             }

             Debug.print("ActionRoleMangement.roleEntSelect() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMEntityRoleMapping");
         }   
         
         
         
         else if(roleProcess.equals("mappingRoleEnt")){
         	//String empMap=null;
         	String uId=null;
         	String uName=null;
         	String roleName=null;
         	String deptName=null;
         	 String roleId1=null;
         	 String empId=null;
             try{
                 Debug.print("ActionRoleMangement.mappingRoleEnt==()");
                 String roleId = request.getParameter("roleId");
                // empMap= request.getParameter("empMap");
                  uId = request.getParameter("userId");
                  deptName = request.getParameter("deptName");
                  roleId1 = request.getParameter("roleId1");
                  uName = request.getParameter("uName");  
                  roleName = request.getParameter("roleName"); 
                  empId = request.getParameter("empId");
                
                
                 
                 Debug.print("roleId:" + roleId);
                 request.setAttribute("roleId",roleId);

                 String entityIds = request.getParameter("entityIds");
                 Debug.print("entityIds:" + entityIds);
                 StringTokenizer strTkns = new StringTokenizer(entityIds,"#");
                 ArrayList entityList = new ArrayList();
                 while(strTkns.hasMoreTokens()){
                     try{
                         String entityId = (String)strTkns.nextToken();
                         if(entityId!=null && entityId.trim().length()!=0){
                             Debug.print("ActionRoleMangement.mappingRoleEnt() Added from Stokenizer:" + entityId);
                             entityList.add(entityId);
                         }
                     }
                     catch(Exception e){
                         Debug.print("Exception while spliting privilegeIds ActionRoleMangement.mappingRoleEnt() :" + e);
                     }
                 }

                 if(roleId!=null){
                     Debug.print("ActionRoleMangement.mappingRoleEnt() All Ids Are valid");
                          db.generateMappingRoleWithEntities(roleId, entityList);
                 }
             }
             
             catch(Exception eDisp){
                 Debug.print("while getting mappingRoleEnt:" + eDisp);
             }
             Debug.print("ActionRoleMangement.mappingRoleEnt() sucessfully comes from servlet.");
             ArrayList roleList = new ArrayList();
             ArrayList entityList = new ArrayList();
             roleList = (ArrayList)db.getAllRoles();
             entityList = (ArrayList)db.getAllEntity();

             request.setAttribute("roleDetails" ,null);
             request.setAttribute("roleDetails" ,roleList);

             request.setAttribute("enityDetails" ,null);
             request.setAttribute("enityDetails" ,entityList);
             //if(empMap==null)
           //  {
            	 return new ModelAndView("frmRolMEntityRoleMapping");
            // }
            /* else
             {
             	   request.setAttribute("chgStat","mapped");
             	   request.setAttribute("deptName",deptName);
             	   request.setAttribute("empId",empId);
             	   
             	  
             	   ArrayList roleList = new ArrayList();
                    ArrayList entityList = new ArrayList();
                    ArrayList mapRoleEnt = new ArrayList();
                    roleList = (ArrayList)db.getAllRoles();
                    entityList = (ArrayList)roleBean.getAllEntity();

                    mapRoleEnt = roleBean.getMappingDetailsForRoleAndPrivileges(roleId1);

                    request.setAttribute("roleDetails" ,null);
                    request.setAttribute("roleDetails" ,roleList);

                    request.setAttribute("enityDetails" ,null);
                    request.setAttribute("enityDetails" ,entityList);

                    request.setAttribute("mapDetails" ,null);
                    request.setAttribute("mapDetails" ,mapRoleEnt);
                    request.setAttribute("roleId", roleId1);
                    request.setAttribute("roleName", roleName);
                    request.setAttribute("uName", uName);
             	  return mapping.findForward("dispRoletoUser");
             } */
         }   
         
         
         else if(roleProcess.equals("roleList")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.roleList()");
             ArrayList roleList = new ArrayList();
             roleList = (ArrayList)db.getAllRoles();

             request.setAttribute("allRoleList",null);
             request.setAttribute("allRoleList",roleList);

             Debug.print("KlgRoleAction.roleList() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMListRoles");
            
         } 
         
       //==================================================initRole Role Management =====================================================================================
         else if(roleProcess.equals("initCreateRole")){
              Debug.print("ActionRoleMangement.initCreateRole() sucessfully comes from servlet.");
              return new ModelAndView("frmRolMCreateRole");
              
          }
       //==================================================create Role Management =====================================================================================
         else if(roleProcess.equals("createRole")){
             Debug.print("KlgRoleAction.createRole()");
             String rolename = request.getParameter("rolename");
	
              String roledesc = request.getParameter("roledesc");
               String status = request.getParameter("status");
	
             Debug.print("KlgRoleAction.createRole() rolename:" + rolename);
             
             if(rolename!=null){
            	 try{
            	/*	 NewUser nu = new NewUser();
            		 boolean grpStatus = false;
            		 grpStatus = nu.CreateNewGroup(rolename, roledesc);
            		 if(grpStatus == true){
            			 System.out.println("Role Created in Active Directory Successfully");
            			 
            			 */
            			 boolean result = db.createRole(rolename,roledesc,status);
	
            			 Debug.print("KlgRoleAction.createRole()");
            			 if(result){
            				 ArrayList roleList = new ArrayList();
            				 roleList = (ArrayList)db.getAllRoles();

            				 request.setAttribute("allRoleList",null);
            				 request.setAttribute("allRoleList",roleList);
 
            				 return new ModelAndView("frmRolMListRoles");
            			 }
            			 else{
            				 request.setAttribute("err","alexists");
            				 return new ModelAndView("frmRolMCreateRole");
                   
            			 }
     /*       			 
            		 } else{
            			 System.out.println("Problem was creating Role in Active Directory");
            		 }
            		 
            		 */
            	 } catch(Exception e){
                	 System.err.println(e);
                 }
                 Debug.print("KlgRoleAction.createRole() sucessfully comes from servlet.");
             }
         }
         
         
         else if(roleProcess.equals("initeditRole")){
             Debug.print("KlgRoleAction.editRole()");
             String roleId = request.getParameter("roleId");
             if(roleId!=null){
                 String[]  result = db.getRole(roleId);
                 request.setAttribute("roleDetails",result);
             }
             
             Debug.print("KlgRoleAction.editRole() sucessfully comes from servlet.");
          
             return new ModelAndView("frmRolMEditRole");
         }    
         
         else if(roleProcess.equals("editRole")){
             Debug.print("KlgRoleAction.editRole()");
             String roleId = request.getParameter("roleId");
             
             String oldRoleName = db.getRoleNameByRoleId(roleId);
             request.setAttribute("OldRoleNameValue", oldRoleName);
             System.out.println("Old Role name in servlet : "+oldRoleName);
             
             String rolename = request.getParameter("rolename");
             System.out.println("New Role name in servlet : "+rolename);
             
             String roledesc =request.getParameter("roledesc");
             String status = request.getParameter("status");
	
             boolean result = false;
             Debug.print("KlgRoleAction.editRole() values:" + roleId+"==="+rolename+"==="+roledesc+status);
             if(roleId!=null && roleId.trim().length()!=0 && rolename!=null){
	
            	 try{
            	/*
            		 NewUser nu = new NewUser();
            		 boolean deleteStatus = false;
            		 deleteStatus = nu.deleteGroup(oldRoleName);
            		 boolean grpStatus = false;
            		 if (deleteStatus == true){
            		 grpStatus = nu.CreateNewGroup(rolename, roledesc);
            		 }
            		 if((grpStatus == true) && (deleteStatus == true)){
            			 System.out.println("Role Created in Active Directory Successfully");
            			 
            			 */
            			 
            			 result = db.editRole(roleId, rolename,roledesc,status);

            			 Debug.print("KlgRoleAction.editRole() result:" + result);
            			 if(result==true){
            				 Debug.print("KlgRoleAction.editRole() result:" + result);
            				 if(roleId!=null){
            					 String[]  resultString = db.getRole(roleId);
            					 request.setAttribute("roleDetails",resultString);
            				 }
                   
            				 ArrayList roleList = new ArrayList();
            				 roleList = (ArrayList)db.getAllRoles();

            				 request.setAttribute("allRoleList",null);
            				 request.setAttribute("allRoleList",roleList);                 
            				 return new ModelAndView("frmRolMListRoles");
                    
            			 }
            			 else{
            				 Debug.print("KlgRoleAction.editRole() result:" + result);
            				 if(roleId!=null){
            					 String[]  resultString = db.getRole(roleId);
            					 request.setAttribute("roleDetails",resultString);
            				 }
                    
            				 request.setAttribute("rolename", rolename);
            				 request.setAttribute("err","alexists");
            				 return new ModelAndView("frmRolMEditRole");
            			 }
             /*    
            		 	} else{
            			 System.out.println("Problem was Editing Role in Active Directory");
            		 	}
            		 	
            		 	*/ 
            	 } catch(Exception e){
                	 System.err.println(e);
                 }
            	 
             }
             Debug.print("KlgRoleAction.editRole() sucessfully comes from servlet.");
         } 
         //===================Delete Role(s)==============================================
         else if(roleProcess.equals("deleteRole")){
             Debug.print("ActionRoleMangement.deleteRole()");
             String roleId = request.getParameter("roleId");
             String rolename = request.getParameter("rolename");
             String roledesc =request.getParameter("roledesc");
          
             String status = request.getParameter(roleId);
             String chkRoleIdArr[] = request.getParameterValues("chk");

             for(int i=0;i<chkRoleIdArr.length;i++)
             Debug.print("KlgRoleAction.deleteRole() checked records: "+chkRoleIdArr[i]);

             boolean result = false;
             Debug.print("KlgRoleAction.deleteRole() values:" + roleId+"==="+rolename+"==="+roledesc+status);

             ArrayList roleList = (ArrayList)db.getAllRoles();

             request.setAttribute("allRoleList",null);
             request.setAttribute("allRoleList",roleList);

             
             if(chkRoleIdArr!=null){
                 //result = roleRemote.deleteRole(roleId);
                 result = db.deleteRole(chkRoleIdArr);
                 Debug.print("ActionRoleMangement.deleteRole() result:" + result);
                // if(result==true){
                     Debug.print("KlgRoleAction.deleteRole() result:" + result);
                   
               //  }
                 
             }
             return new ModelAndView("frmRolMListRoles");
         }
      
         
         
         
         
         
         
         
         
         
         
         
         
       //==================================================Entity  Management =====================================================================================
         else if(roleProcess.equals("initCreateEntity")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.initCreateEntity() sucessfully comes from servlet.");
            
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMCreateEntity");
         }
//==================================================Create Entity =====================================================================================
         else if(roleProcess.equals("createEntity")){
             Debug.print("KlgRoleAction.createEntity()");
             String entityName = request.getParameter("entityName");
             Debug.print("KlgRoleAction.insertPriv() insertPerm:" + entityName);
             if(entityName!=null){
                 boolean result = db.createEntity(entityName);
                 Debug.print("KlgRoleAction.createEntity()");
                 if(result){
                	 return new ModelAndView("frmRolMCreateEntity");
                 }
                 else{
                	 request.setAttribute("err","alexists");
                	 return new ModelAndView("frmRolMCreateEntity");
                 }
             }
             Debug.print("KlgRoleAction.createEntity() sucessfully comes from servlet.");
         }       
         
       //==================================================List Entity Management=====================================================================================
         else if(roleProcess.equals("entityList")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.entityList()");
             ArrayList entityList = new ArrayList();
             entityList = (ArrayList)db.getAllEntity();

             request.setAttribute("allEntityList",null);
             request.setAttribute("allEntityList",entityList);

             Debug.print("KlgRoleAction.entityList() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
            
             return new ModelAndView("frmRolMListEntities");
         }
         
       //==================================================initEdit Entity Management =====================================================================================
         else if(roleProcess.equals("initEditEntity")){
             Debug.print("KlgRoleAction.initEditEntity()");
             String entityId = request.getParameter("entityId");
             if(entityId!=null){
                 String[]  result = db.getEntity(entityId);
                 request.setAttribute("entityDetails",result);
             }
             Debug.print("KlgRoleAction.initEditEntity() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMEditEntity");
            
         }       
     
         else if(roleProcess.equals("editEntity")){
             Debug.print("KlgRoleAction.editEntity()");
             String entityId = request.getParameter("entityId");
             String entityName = request.getParameter("entityName");
             boolean result = false;
             if(entityId!=null && entityId.trim().length()!=0 && entityName!=null){
                 result = db.editEntity(entityId, entityName);
                 Debug.print("KlgRoleAction.editEntity() result:" + result);
                 if(result==true){
                     Debug.print("KlgRoleAction.editEntity() result:" + result);
                     if(entityId!=null && entityId.trim().length()!=0){
                         String[]  resultString = db.getEntity(entityId);
                         request.setAttribute("entityDetails",resultString);
                     }
                     return new ModelAndView("frmRolMEditEntity");
                 }
                 else{
                     if(entityId!=null && entityId.trim().length()!=0){
                         String[]  resultString = db.getEntity(entityId);
                         request.setAttribute("entityDetails",resultString);
                     }
                     Debug.print("KlgRoleAction.editEntity() result:" + result);
                     request.setAttribute("err","alexists");
                     return new ModelAndView("frmRolMEditEntity");
                 }
             }
             Debug.print("KlgRoleAction.editEntity() sucessfully comes from servlet.");
         }
         
   //=======================CURD Permission=====================================================
         
         else if(roleProcess.equals("initCreatePerm")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.initCreatePerm() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
           
             return new ModelAndView("frmRolMCreatePermission");
         }
         
         else if(roleProcess.equals("insertPerm")){
             Debug.print("KlgRoleAction.insertPerm()");
             String permissionName = request.getParameter("permissionName");
             Debug.print("KlgRoleAction.insertPriv() insertPerm:" + permissionName);
             if(permissionName!=null){
                 boolean result = db.createPermission(permissionName);
                 Debug.print("KlgRoleAction.insertPerm()");
                 if(result){
                	 return new ModelAndView("frmRolMCreatePermission");
                 }
                 else{
                	 request.setAttribute("err","alexists");
                	 return new ModelAndView("frmRolMCreatePermission");
                 }
             }
             Debug.print("KlgRoleAction.insertPerm() sucessfully comes from servlet.");
         }
         else if(roleProcess.equals("permissionList")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.permissionList()");
             ArrayList permList = new ArrayList();
             permList = (ArrayList)db.getAllPermission();

             request.setAttribute("allPermList",null);
             request.setAttribute("allPermList",permList);

             Debug.print("KlgRoleAction.permissionList() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMListPermissions");
            
         } 
         else if(roleProcess.equals("initEditPerm")){
             Debug.print("KlgRoleAction.initEditPerm()");
             String permissionId = request.getParameter("permissionId");
             if(permissionId!=null){
                 String[]  result = db.getPermission(permissionId);
                 request.setAttribute("permDetails",result);
             }

             Debug.print("KlgRoleAction.initEditPerm() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMEditPermission");
             
         }       
         else if(roleProcess.equals("editPerm")){
             Debug.print("KlgRoleAction.editPerm()");
             String permissionId = request.getParameter("permissionId");
             String permissionName = request.getParameter("permissionName");
             boolean result = false;
             if(permissionId!=null && permissionId.trim().length()!=0 && permissionName!=null){
                 result = db.editPermission(permissionId, permissionName);
                 Debug.print("KlgRoleAction.editPerm() result:" + result);
                 if(result==true){
                     Debug.print("ActionRoleMangement.editPerm() result:" + result);
                     if(permissionId!=null && permissionId.trim().length()!=0){
                         String[]  resultString = db.getPermission(permissionId);
                         request.setAttribute("permDetails",resultString);
                     }
                     return new ModelAndView("frmRolMEditPermission");                    
                   
                 }
                 else{
                     if(permissionId!=null){
                         String[]  resultString = db.getPermission(permissionId);
                         request.setAttribute("permDetails",resultString);
                     }
                     Debug.print("KlgRoleAction.editPerm() result:" + result);
                     request.setAttribute("err","alexists");
                     return new ModelAndView("frmRolMEditPermission");
                     
                 }
             }
             Debug.print("KlgRoleAction.editPerm() sucessfully comes from servlet.");
         }        
         else if(roleProcess.equals("initCreatePriv")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.initCreatePriv() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMCreatePrivileges");
             
         }
         else if(roleProcess.equals("insertPriv")){
             Debug.print("KlgRoleAction.insertPriv()");
             String privName = request.getParameter("privName");
             Debug.print("KlgRoleAction.insertPriv() privName:" + privName);
             if(privName!=null){
                 boolean result = db.createPrivilege(privName);
                 Debug.print("KlgRoleAction.insertPriv()");
                 if(result){
                	 return new ModelAndView("frmRolMCreatePrivileges");
                 }
                 else{
                	 request.setAttribute("err","alexists");
                	 return new ModelAndView("frmRolMCreatePrivileges");
                 }
             }
             Debug.print("KlgRoleAction.insertPriv() sucessfully comes from servlet.");
         }
         
         else if(roleProcess.equals("privList")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             Debug.print("KlgRoleAction.privList()");
             ArrayList roleList = new ArrayList();
             roleList = (ArrayList)db.getAllPrivilege();

             request.setAttribute("allPrivList",null);
             request.setAttribute("allPrivList",roleList);

             Debug.print("KlgRoleAction.privList() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMListPrivileges");
            
         }     
         else if(roleProcess.equals("initEditPriv")){
             Debug.print("KlgRoleAction.initEditPriv()");
             String privId = request.getParameter("privId");
             if(privId!=null){
                 String[]  result = db.getPrivilege(privId);
                 request.setAttribute("privDetails",result);
             }

             Debug.print("KlgRoleAction.initEditPriv() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMEditPrivileges");
         }
         else if(roleProcess.equals("editPriv")){
             Debug.print("KlgRoleAction.editPriv()");
             String privId = request.getParameter("privId");
             String privName = request.getParameter("privName");
             boolean result = false;
             if(privId!=null && privId.trim().length()!=0 && privName!=null){
                 result = db.editPrivilege(privId, privName);
                 Debug.print("KlgRoleAction.editPriv() result:" + result);
                 if(result==true){
                     Debug.print("KlgRoleAction.editPriv() result:" + result);
                     if(privId!=null){
                         String[]  resultString = db.getPrivilege(privId);
                         request.setAttribute("privDetails",resultString);
                     }
                     return new ModelAndView("frmRolMEditPrivileges");
                 }
                 else{
                     if(privId!=null){
                         String[]  resultString = db.getPrivilege(privId);
                         request.setAttribute("privDetails",resultString);
                     }
                     Debug.print("KlgRoleAction.editPriv() result:" + result);
                     request.setAttribute("err","alexists");
                     return new ModelAndView("frmRolMEditPrivileges");
                 }
             }
             Debug.print("KlgRoleAction.editPriv() sucessfully comes from servlet.");
         }
       //==================================================init Entity mapping with Privileges =====================================================================================
         else if(roleProcess.equals("initEntPriv")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             
        	 
             try{
                 Debug.print("KlgRoleAction.initEntPriv()");
                 ArrayList privList = new ArrayList();
                 ArrayList entityList = new ArrayList();
                 privList = (ArrayList)db.getAllPrivilege();
                 entityList = (ArrayList)db.getAllEntity();

                 request.setAttribute("privillegeDetails" ,null);
                 request.setAttribute("privillegeDetails" ,privList);

                 request.setAttribute("enityDetails" ,null);
                 request.setAttribute("enityDetails" ,entityList);
             }
             catch(Exception eDisp){
                 Debug.print("while getting initEntPriv:" + eDisp);
             }

             Debug.print("KlgRoleAction.initEntPriv() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             return new ModelAndView("frmRolMPrivilegeEntityMapping");
         }
         
         else if(roleProcess.equals("entPrivSelect")){
             try{
                 String entityId = request.getParameter("entityId");
                 String permissionId = request.getParameter("permissionId");
                 String roleId = request.getParameter("roleID");
                 String privilegeId = request.getParameter("privilegeId");
                 if(entityId!=null){
                     Debug.print("KlgRoleAction.entPrivSelect()");
                     ArrayList privList = new ArrayList();
                     ArrayList entityList = new ArrayList();
                     ArrayList mapEntPriv = new ArrayList();
                     ArrayList permission= new ArrayList();
                     ArrayList mapPrivPer = new ArrayList();
                     privList = (ArrayList)db.getAllPrivilege();
                     entityList = (ArrayList)db.getAllEntity();
                     permission =(ArrayList)db.getAllPermission();

                     mapEntPriv = db.getMappingDetailsForEnitityAndPrivileges(entityId);
                     mapPrivPer=db.getMappingDetailsForPermissionAndPrivilege(privilegeId);

                     request.setAttribute("PermissionDetails" ,null);
                     request.setAttribute("PermissionDetails" ,permission);
                     request.setAttribute("privillegeDetails" ,null);
                     request.setAttribute("privillegeDetails" ,privList);

                     request.setAttribute("enityDetails" ,null);
                     request.setAttribute("enityDetails" ,entityList);

                      request.setAttribute("PermapDetails" ,null);
                     request.setAttribute("PermapDetails" ,mapPrivPer);
                     request.setAttribute("permissionId",permissionId);
                     request.setAttribute("mapDetails" ,null);
                     request.setAttribute("mapDetails" ,mapEntPriv);
                     request.setAttribute("entityId",entityId);
                     //{mapPermissionId, permissionName, accessName, accessUrl};
                 }
             }
         catch(Exception eDisp){
                 Debug.print("while getting entPrivSelect:" + eDisp);
             }

             Debug.print("KlgRoleAction.entPrivSelect() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMPrivilegeEntityMapping");
         }
         
         else if(roleProcess.equals("mappingEntPriv")){
             try{
                 Debug.print("KlgRoleAction.mappingEntPriv()");
                 String entityId = request.getParameter("entityId");
                 Debug.print("KlgRoleAction entityId:" + entityId);
                 request.setAttribute("entityId",entityId);

                 String privilegeIds = request.getParameter("privilegeIds");
                 Debug.print("KlgRoleAction privilegeIds:" + privilegeIds);
                 StringTokenizer strTkns = new StringTokenizer(privilegeIds,"#");
                 ArrayList privList = new ArrayList();
                 while(strTkns.hasMoreTokens()){
                     try{
                         String privilegeId = (String)strTkns.nextToken();
                         Debug.print("KlgRoleAction.mappingEntPriv() :" + privilegeId);
                         if(privilegeId!=null && privilegeId.trim().length()!=0){
                             Debug.print("KlgRoleAction.mappingEntPriv() Added from Stokenizer:" + privilegeId);
                             privList.add(privilegeId);
                         }
                     }
                     catch(Exception e){
                         Debug.print("Exception while spliting privilegeIds KlgRoleAction.mappingEntPriv() :" + e);
                     }
                 }

                 if(entityId!=null){
                     Debug.print("KlgRoleAction.mappingEntPriv() All Ids Are valid");
                          db.generateMappingEnitityWithPrivileges(entityId, privList);
                 }
             }
             catch(Exception eDisp){
                 Debug.print("while getting KlgRoleAction mappingEntityPriv:" + eDisp);
             }
             ArrayList privList = new ArrayList();
             ArrayList entityList = new ArrayList();
             privList = (ArrayList)db.getAllPrivilege();
             entityList = (ArrayList)db.getAllEntity();

             request.setAttribute("privillegeDetails" ,null);
             request.setAttribute("privillegeDetails" ,privList);

             request.setAttribute("enityDetails" ,null);
             request.setAttribute("enityDetails" ,entityList);
             return new ModelAndView("frmRolMPrivilegeEntityMapping");
         }     
         
         else if(roleProcess.equals("initPrivPermission")){
        	 
        	 String navPrivName=request.getParameter("navPrivName");
             String navAccsName=request.getParameter("navAccessName");
             
             try{
                 Debug.print("KlgRoleAction.initPrivPermission()");
                 ArrayList privList = new ArrayList();
                 ArrayList permList = new ArrayList();
                 privList = (ArrayList)db.getAllPrivilege();
                 permList = (ArrayList)db.getAllPermission();

                 request.setAttribute("privillegeDetails" ,null);
                 request.setAttribute("privillegeDetails" ,privList);

                 request.setAttribute("permissionDetails" ,null);
                 request.setAttribute("permissionDetails" ,permList);
             }
             catch(Exception eDisp){
                 Debug.print("while getting KlgRoleAction initPrivPermission:" + eDisp);
             }

             Debug.print("KlgRoleAction.initPrivPermission() sucessfully comes from servlet.");
             
             session.setAttribute("navPrivName",navPrivName);
             session.setAttribute("navAccsName",navAccsName);
             
             return new ModelAndView("frmRolMpriviPermissionMapping");
         }
         
         else if(roleProcess.equals("privPermissionSelect")){
             try{
                 String privId = request.getParameter("privId");
                 if(privId!=null){
                     Debug.print("KlgRoleAction.privPermissionSelect()");
                     ArrayList privList = new ArrayList();
                     ArrayList permList = new ArrayList();
                     ArrayList mapPrivPerm = new ArrayList();
                     privList = (ArrayList)db.getAllPrivilege();
                     permList = (ArrayList)db.getAllPermission();

                     mapPrivPerm = db.getMappingDetailsForPermissionAndPrivilege(privId);

                     request.setAttribute("privillegeDetails" ,null);
                     request.setAttribute("privillegeDetails" ,privList);

                     request.setAttribute("permissionDetails" ,null);
                     request.setAttribute("permissionDetails" ,permList);

                     request.setAttribute("mapDetails" ,null);
                     request.setAttribute("mapDetails" ,mapPrivPerm);
                     request.setAttribute("privId",privId);
                     //{mapPermissionId, permissionName, accessName, accessUrl};
                 }
             }
             catch(Exception eDisp){
                 Debug.print("while getting KlgRoleAction privPermissionSelect:" + eDisp);
             }

             Debug.print("KlgRoleAction.privPermissionSelect() sucessfully comes from servlet.");
             return new ModelAndView("frmRolMpriviPermissionMapping");
         }
         
         else if(roleProcess.equals("mappingPrivPermission")){
             try{
                 Debug.print("KlgRoleAction.mappingPrivPermission()");
                 String privId = request.getParameter("privId");
                 String editStatus = request.getParameter("editStatus");
                 Debug.print("KlgRoleAction editStatus:" + editStatus);
                 
                 String viewId = request.getParameter("viewId");
                  String deleteId = request.getParameter("deleteId");
                  String createId = request.getParameter("createId");
                  String editId = request.getParameter("editId");
                 String permissionId1 = request.getParameter("permissionId1");
                 String permissionId2 = request.getParameter("permissionId2");
                 String permissionId3 = request.getParameter("permissionId3");
                 String permissionId4 = request.getParameter("permissionId4");
                 String permissionId5 = request.getParameter("permissionId5");
                 String permissionId6 = request.getParameter("permissionId6");
                 String permissionId7 = request.getParameter("permissionId7");
                 String permissionId8 = request.getParameter("permissionId8");
               Debug.print("KlgRoleAction permissionId1=="+permissionId1+"permissionId2=="+permissionId2+"permissionId3=="+permissionId3+"permissionId4=="+permissionId4+"permissionId5=="+permissionId5+"permissionId6=="+permissionId6);
               

                 if(privId!=null && permissionId1!= null && permissionId2!= null && permissionId3!= null && permissionId4!= null 
              		   && permissionId5!= null  && permissionId6!= null  && permissionId7!= null  && permissionId8!= null)
                 {
                     Debug.print("KlgRoleAction.mappingPrivPermission() All Ids Are valid");
					   String viewName = request.getParameter("viewName");
                      String viewURL = request.getParameter("viewURL");
                      String editName = request.getParameter("editName");
                      String editURL = request.getParameter("editURL");
                      String createName = request.getParameter("createName");
                      String createUrl = request.getParameter("createUrl");
                      String deleteName = request.getParameter("deleteName");
                      String deleteURL = request.getParameter("deleteURL");
                      
                     String perName1 = request.getParameter("perName1");
                     String perURL1 = request.getParameter("perURL1");
                     String perName2 = request.getParameter("perName2");
                     String perURL2 = request.getParameter("perURL2");
                     String perName3 = request.getParameter("perName3");
                     String perURL3 = request.getParameter("perURL3");
                     String perName4 = request.getParameter("perName4");
                     String perURL4 = request.getParameter("perURL4");
                     String perName5 = request.getParameter("perName5");
                     String perURL5 = request.getParameter("perURL5");
                     String perName6 = request.getParameter("perName6");
                     String perURL6 = request.getParameter("perURL6");
                     String perName7 = request.getParameter("perName7");
                     String perURL7 = request.getParameter("perURL7");
                     String perName8 = request.getParameter("perName8");
                     String perURL8 = request.getParameter("perURL8");

                     if(perName1==null) perName1="";
                     if(perURL1==null) perURL1="";
                     if(perName2==null) perName2="";
                     if(perURL2==null) perURL2="";
                     if(perName3==null) perName3="";
                     if(perURL3==null) perURL3="";
                     if(perName4==null) perName4="";
                     if(perURL4==null) perURL4="";
                     if(perName5==null) perName5="";
                     if(perURL5==null) perURL5="";
                     if(perName6==null) perName6="";
                     if(perURL6==null) perURL6="";
                     if(perName7==null) perName7="";
                     if(perURL7==null) perURL7="";
                     if(perName8==null) perName8="";
                     if(perURL8==null) perURL8="";
                     if(editStatus==null) editStatus="";
					   
                      if(viewName==null) viewName="";
                      if(viewURL==null) viewURL="";
                      if(editName==null) editName="";
                      if(editURL==null) editURL="";
                      if(createName==null) createName="";
                      if(createUrl==null) createUrl="";
                      if(deleteName==null) deleteName="";
                      if(deleteURL==null) deleteURL="";
                      if(editStatus==null) editStatus="";

                      String[] permListView = {viewId,viewName,viewURL};
                      String[] permListEdit = {editId,editName,editURL};
                      String[] permListCreate = {createId,createName,createUrl};
                      String[] permListDelete = {deleteId,deleteName,deleteURL};

                     String[] permListPerm1 = {permissionId1,perName1,perURL1};
                     String[] permListPerm2 = {permissionId2,perName2,perURL2};
                     String[] permListPerm3 = {permissionId3,perName3,perURL3};
                     String[] permListPerm4 = {permissionId4,perName4,perURL4};
                     String[] permListPerm5 = {permissionId5,perName5,perURL5};
                     String[] permListPerm6 = {permissionId6,perName6,perURL6};
                     String[] permListPerm7 = {permissionId7,perName7,perURL7};
                     String[] permListPerm8 = {permissionId8,perName8,perURL8};
                   
                     
                     ArrayList permissionList = new ArrayList();
					     permissionList.add(permListView);
                      permissionList.add(permListDelete);
                      permissionList.add(permListCreate);
                      permissionList.add(permListEdit);
                     permissionList.add(permListPerm1);
                     permissionList.add(permListPerm2);
                     permissionList.add(permListPerm3);
                     permissionList.add(permListPerm4);
                     permissionList.add(permListPerm5);
                     permissionList.add(permListPerm6);
                     permissionList.add(permListPerm7);
                     permissionList.add(permListPerm8);

                     if(editStatus.equalsIgnoreCase("editMapPrivPerm")) {
                          Debug.print("KlgRoleAction.mappingPrivPermission() Editting..");
                          db.editMappingPermissionToPrivilege(permissionList,privId);
                     }
                     else {
                         Debug.print("KlgRoleAction.mappingPrivPermission() Inserting..");
                         db.createMappingPermissionToPrivilege(privId,permissionList);
                     }
                 }
                 ArrayList privList = new ArrayList();
                 ArrayList permList = new ArrayList();
                 privList = (ArrayList)db.getAllPrivilege();
                 permList = (ArrayList)db.getAllPermission();

                 request.setAttribute("privillegeDetails" ,null);
                 request.setAttribute("privillegeDetails" ,privList);

                 request.setAttribute("permissionDetails" ,null);
                 request.setAttribute("permissionDetails" ,permList);
             }
             catch(Exception eDisp){
                 Debug.print("while getting KlgRoleAction mappingPrivPermission:" + eDisp);
             }
             Debug.print("KlgRoleAction.mappingPrivPermission() sucessfully inserted and comes from servlet.");
             return new ModelAndView("frmRolMpriviPermissionMapping");
         }   

	return null;	
	}

      
}

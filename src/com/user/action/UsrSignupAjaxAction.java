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
package com.user.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.Debug;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.hlcrole.management.HLCBrahmaputraSessionRemote;
import com.systinet.info.SystinetStatelessBean;
import com.util.OptionsBuilder;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import java.util.*;


public class UsrSignupAjaxAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
		try{
		String process=request.getParameter("cmd");
		HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
        HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
        HLCEducationalSessionBean eduBean=new HLCEducationalSessionBean();
        HLCVaigaiSessionBean vaigaiBean = new HLCVaigaiSessionBean();
		GeneralDBAction db=new GeneralDBAction();
	    //set the content type 
        response.setContentType("text/xml"); 
         
        response.setHeader("Cache-Control", "no-cache"); 
        
        //get the PrintWriter object to write the html page 
        PrintWriter writer = response.getWriter(); 
	
		if(process.equalsIgnoreCase("checkusrnam"))
        {
                
            String usrId=request.getParameter("chsUserName");
            System.out.println("request.getParameter(chsUserName) :"+usrId);

            boolean usrStat=humanMemb.checkUserNameExist(usrId);

            System.out.println("UsrSignupAjaxAction.checkUserNameExist(usrId)"+usrStat);

            //get the member id existing or not status and respond 

            writer.println("<userstatus><![CDATA[" + usrStat + "]]></userstatus>"); 
        
        }
		/*
         * Checking lifecycle Name already exists or not
         */
        if(process.equalsIgnoreCase("checkLifecycle"))
        {
                
            String lifecycleNam=request.getParameter("lifecycleN");
            System.out.println("request.getParameter(lifecycleN) :"+lifecycleNam);

           boolean lifecycleStat=db.isLifecycleDBExist(lifecycleNam);

            Debug.print("UsrSignupAjaxAction.isLifecycleDBExist(lifecycleNam)"+lifecycleStat);

            //get the member id existing or not status and respond 

            writer.println("<userstatus><![CDATA[" + lifecycleStat + "]]></userstatus>"); 
       
        }
		
		if(process.equalsIgnoreCase("sQaonLogName"))
        {
        
            Debug.print(":::::::: inside secret question block in ajax action ::::::::");
            
            String usrName=request.getParameter("usrName");
            System.out.println("request.getParameter(usrName) :"+usrName);

            String secqus=humanMemb.getSecretQuestionByLoginName(usrName);

            Debug.print("UsrSignupAjaxAction.getSecretQuestionByLoginName(usrName) :"+secqus);

            //get the member id existing or not status and respond 

            writer.println("<secqus><![CDATA[" + secqus + "]]></secqus>"); 
            
            if(secqus == null)
            {
            
           /* if(secqus.trim().length() == 0 && )
            {*/
                
                Debug.print(" ::::::::::::::: inside secret q/a unavailable block of ajax servlet send pwd mail ::::::::" );
                String emailid=humanMemb.getEmailByLoginName(usrName);
                 Debug.print("UsrSignupAjaxAction.getEmailByLoginName(usrName) :" +emailid);
                 
                 String password=humanMemb.getPasswordByLoginName(usrName);
                    
                    Debug.print("UsrSignupAjaxAction.getPasswordByLoginName(usrname) :" +password);
                 
                /* =====================================
                 *
                 * Sending User Name E-mail
                 *
                 * ====================================*/
                    
                String toMailIds[] = {emailid};
                EmailContent email=new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("anandv@digiblitz.com");
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
                       
                        "<p> Password :"+password+"<p>"+
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
                
                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                Debug.print("Email sent sucessfully :"+emailFlag);
            }
            else if(secqus.trim().length() == 0)
            {
                Debug.print(" ::::::::::::::: inside secret q/a unavailable block of ajax servlet send pwd mail ::::::::" );
                String emailid=humanMemb.getEmailByLoginName(usrName);
                 Debug.print("UsrSignupAjaxAction.getEmailByLoginName(usrName) :" +emailid);
                 
                 String password=humanMemb.getPasswordByLoginName(usrName);
                    
                    Debug.print("UsrSignupAjaxAction.getPasswordByLoginName(usrname) :" +password);
                 
                /* =====================================
                 *
                 * Sending User Name E-mail
                 *
                 * ====================================*/
                    
                String toMailIds[] = {emailid};
                EmailContent email=new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("anandv@digiblitz.com");
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
                       
                        "<p> Password :"+password+"<p>"+
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
                
                EmailEngine emailEngine = new EmailEngine();
                boolean emailFlag = emailEngine.sendMimeEmail(email);
                Debug.print("Email sent sucessfully :"+emailFlag);
                                                   
        }
            
        }	
		
	
	
			if(process.equalsIgnoreCase("mappingExist")){
			 Debug.print("MappingDetExists method is calling...........");
		      
		  
		      
		      String viewPntId = request.getParameter("viewPntId");
		      String lobId = request.getParameter("lobId");
		      String viewId = request.getParameter("viewId");
		      String grpId = request.getParameter("grpId");
		      String domProcId = request.getParameter("domProcId");
		     
		     
		      boolean output = (boolean)db.viewPointMapExists(viewPntId,lobId,viewId,grpId,domProcId);
		      
		            
		      String finalStr = String.valueOf(output);
		      
		      Debug.print("Final String is "+finalStr);
		      
		      PrintWriter out = response.getWriter();
		      
		      response.setContentType("text/xml; charset=UTF-8");
		      response.setHeader("Cache-Control", "no-cache");            
		      
		      out.println("<outValue>"+finalStr+"</outValue>");
		      
		      return null;
		}
			
			
			   //================Dhivya Here:LOBs Loading============================
	        /**
	         *  To load the drop down list for LOBs based on view point Id
	         */
		
			if(process.equalsIgnoreCase("lobsList")){
	                        Debug.print("lobsList method is calling...........");
	                       String viewPntId = request.getParameter("viewPntId");
	                       Debug.print("lobsList(): viewPntId..........."+viewPntId);
	                       Vector lobsObj = (Vector)db.getLOBs(viewPntId);
	                       
	                       Debug.print("lobsList() LOBs size..........."+lobsObj.size());
				return getXmlContent(request,response,lobsObj);
		}
		
		
		 //================Dhivya Here:Views & Groups Loading============================
	    /**
	     *  To load the drop down list for LOBs based on view point Id, LOB Id
	     */
	
		if(process.equalsIgnoreCase("viewGrpList")){
	                    Debug.print("viewGrpList method is calling...........");
	                   String viewPntId = request.getParameter("viewPntId");
	                   String lobId = request.getParameter("lobId");
	                   
	                   Debug.print("viewGrpList(): viewPntId..........."+viewPntId);
	                   Debug.print("viewGrpList(): lobId..........."+lobId);
	                   
	                   Vector viewsObj = (Vector)db.getViews(viewPntId,lobId);
	                   Vector grpsObj = (Vector)db.getGroups(viewPntId,lobId);
	                   
	                   Debug.print("viewGrpList() view size..........."+viewsObj.size());
	                   Debug.print("viewGrpList() grp size..........."+grpsObj.size());
			return getIssueContent(request,response,viewsObj,grpsObj);
	}
	//================Dhivya Here:Process/Domains Loading============================
	/**
	 *  To load the drop down list for Process/Domains based on view point Id, LOB Id,Grp Id
	 */

		if(process.equalsIgnoreCase("processDomainList")){
	                Debug.print("processDomainList method is calling...........");
	               String viewPntId = request.getParameter("viewPntId");
	               String lobId = request.getParameter("lobId");
	               String grpId = request.getParameter("grpId");
	               Debug.print("processDomainList(): viewPntId..........."+viewPntId);
	               Debug.print("processDomainList(): lobId..........."+lobId);
	               Debug.print("processDomainList(): grpId..........."+grpId);
	               
	               Vector proDomObj = (Vector)db.getProcessDomain(viewPntId,lobId,grpId);
	               
	               Debug.print("processDomainList() procDom size..........."+proDomObj.size());
		return getXmlContent(request,response,proDomObj);
	}
	//================Dhivya Here:ArtifactExistsStatus============================
	/**
	*  To check the existence of the Mapped record
	*/
	
		if(process.equalsIgnoreCase("MappingDetExists")){
		 Debug.print("MappingDetExists method is calling...........");
	        
	    
	        
	        String viewPntId = request.getParameter("viewPntId");
	        String lobId = request.getParameter("lobId");
	        String viewId = request.getParameter("viewId");
	        String grpId = request.getParameter("grpId");
	        String domProcId = request.getParameter("domProcId");
	        String artifactId = request.getParameter("artifactId");
	       
	        boolean output = (boolean)db.artifactMapExists(viewPntId,lobId,viewId,grpId,domProcId,artifactId);
	        
	              
	        String finalStr = String.valueOf(output);
	        
	        Debug.print("Final String is "+finalStr);
	        
	        PrintWriter out = response.getWriter();
	        
	        response.setContentType("text/xml; charset=UTF-8");
	        response.setHeader("Cache-Control", "no-cache");            
	        
	        out.println("<outValue>"+finalStr+"</outValue>");
	        
	        return null;
	 }
		
		
		if(process.equalsIgnoreCase("memberDetail")){
			
			 Debug.print("UsrSignupAjaxAction executing....");
		        Debug.print("memberDetail executing....");
		        String  memberId = request.getParameter("memberId");
		        Debug.print("MemberId from input: "+memberId);
		      
		        if(memberId!=null) {
		            Debug.print("Member Details in ajax action executing....");
		            //ArrayList memberDetails = eduRemote.getMemberContactDetails(memberId);
		            ArrayList memberDetails = eduBean.getMemberContactDetailsForAnnualMeeting(memberId);
		            String[] memberArr = (String[]) memberDetails.toArray(new String[memberDetails.size()]);
		            Debug.print("getMemberContactDetailsForAnnualMeeting" + memberArr.length);
		            String result = null;
		            for (int i = 0; i < memberArr.length; i++) {
		                result += memberArr[i]+",";
		            }
		            Debug.print("MemberDetails : "+result);
		            return getXmlCon(request,response,memberArr);
		        } else{
		            return null;
		        }
			
		}
	    //=======================Dhivya Ends Here:=======================================  
		//=======================Prabhu start Here:=======================================  
		if(process.equalsIgnoreCase("advType")){
			Debug.print("advType method is calling...........");
	        //HLCVaigaiSessionRemote activityRemote = initializeEJB(request);
	        String meeCatagoryTypeId = request.getParameter("meeCatagoryTyp");

	        Debug.print("Activity Id : " + meeCatagoryTypeId);

	        Vector specificationType = (Vector) vaigaiBean.displaySpecification1();
	        return getXmlContent(request, response, specificationType);
		}
		//=======================Prabhu Ends Here:=======================================  
		
		 //===========================Dhivya Here:MemberId Exists===============================
		   String names="";
		   String eid=null;
		   String mid=null;
		   String hid=null;
		   
		   Enumeration en=request.getParameterNames();
		   while(en.hasMoreElements())
		   {
		   names=en.nextElement().toString();
		   System.out.println(" queries :" +names);
		   }
		   
		   if(names.equals("memberid"))
		   {
		       
		      mid= request.getParameter("memberid"); 
		     
		      System.out.println("ajax servlet :"+mid);
		      boolean membstatus=false;
		      
		      if(mid!=null&&!(mid.equals("")))
		      {
		          
		            System.out.println("Servlet Called for validating member id existance .........");
		            membstatus=db.isMemberIdExist(mid);
		            System.out.println("member id existance status :" +membstatus);
		      }
		      
		       //get the member id existing or not status and respond 
		   
		    writer.println("<memberstatus><![CDATA[" + membstatus + "]]></memberstatus>"); 
		    
		   }
		
		   //===========================Dhivya Ends Here=========================================================	
	
		
		writer.close();
		}
		  catch(Exception e)
	         {
	             System.out.println(e);
	         }
		
		

		return null;
	}

	public final ModelAndView getXmlContent(HttpServletRequest request,HttpServletResponse response,Vector vec) throws Exception {
		 String xml = null;
		    try {
                      xml = new OptionsBuilder().getContent(vec);
                      Debug.print("XmlContent = "+xml); 		   		     
		    } catch (Exception ex) {
		      // Send back a 500 error code.
		      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
		      return null;
		    }
		    // Set content to xml
		    response.setContentType("text/xml; charset=UTF-8");
		    response.setHeader("Cache-Control", "no-cache");
		    PrintWriter pw = response.getWriter();
		    pw.write(xml);
		    pw.close();
		    return null;     
	}
	
	 /**
     *  return the xml content for the given drop down
     */
   public final ModelAndView getIssueContent(HttpServletRequest request,HttpServletResponse response,Vector issueType,Vector dispType) throws Exception {
	 String xml = null;
	    try {
                  xml = new OptionsBuilder().getIssueContent(issueType,dispType);
                  Debug.print("XmlContent = "+xml); 		   		     
	    } catch (Exception ex) {
	      // Send back a 500 error code.
	      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
	      return null;
	    }
	    // Set content to xml
	    response.setContentType("text/xml; charset=UTF-8");
	    response.setHeader("Cache-Control", "no-cache");
	    PrintWriter pw = response.getWriter();
	    pw.write(xml);
	    pw.close();
	    return null;     
}
   
   
   public final ModelAndView getXmlCon(HttpServletRequest request,HttpServletResponse response,String[] strArr) throws Exception {
       String xml = null;
       try {
           xml = new OptionsBuilder().getUserDet(strArr);
           Debug.print("XmlContent = "+xml);
       } catch (Exception ex) {
           // Send back a 500 error code.
           response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
           return null;
       }
       // Set content to xml
       response.setContentType("text/xml; charset=UTF-8");
       response.setHeader("Cache-Control", "no-cache");
       PrintWriter pw = response.getWriter();
       pw.write(xml);
       pw.close();
       return null;
   }
   
  
   
}

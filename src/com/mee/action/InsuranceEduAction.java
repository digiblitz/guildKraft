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
package com.mee.action;

import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlccommon.util.*;
import com.mee.actionform.InsuranceEduForm;
import java.text.SimpleDateFormat;
import org.apache.struts.action.ActionForward;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import java.io.*;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


	public class InsuranceEduAction implements Controller {

   
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
             try{
                   
            	 HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();
                                   
                    HttpSession session = request.getSession(true);
                    InsuranceEduForm insForm = new InsuranceEduForm();
            
                    HLCActivityUserVO objActUser = new HLCActivityUserVO();
                    String activityName=insForm.getActivityName();
                    String hlcArea=insForm.getUseaArea();
                    String dateHeld=insForm.getDateHeld();
                    String location=insForm.getLocation();
                    String state=insForm.getState();
                    String memberId=insForm.getMemberId(); 
                    String participantName=insForm.getParticipantName(); 
                    String address=insForm.getAddress();
                    String country=insForm.getCountry();
                    String participantState=insForm.getParticipantName();
                    String city=insForm.getCity();
                    String zipcode=insForm.getZipcode();
                    String fax=insForm.getFax();
                    String emailId=insForm.getEmailId();
                    String horseNo = null;
                    String ridingLevel=null;
                    String orgMeetingId=insForm.getOrgMeetingId();

                    horseNo=insForm.getHorseNo();
                    ridingLevel=insForm.getRidingLevel();
                    boolean isUseaMember=insForm.isUseaMember();
                    String memberShipNo=insForm.getMemberShipNo();
                    Debug.print("Insurance Education Activity Form:"+insForm.toString());
                    String userId =(String)session.getAttribute("userId");
                    objActUser.setActivityMeetingId(orgMeetingId);
                    objActUser.setUserId(userId);
                    objActUser.setNoOfHorses(horseNo);
                    objActUser.setEventLevelId(ridingLevel);
                    objActUser.setMembershipStatus(isUseaMember);
                    objActUser.setMemberId(memberShipNo);
                    objActUser.setAddDate(new Date());
                    objActUser.setRequestStatus("Pending");
    
         boolean result = educationBean.createActivityUser(objActUser);
         String toMailId = (String)session.getAttribute("emailId");
         String toMailIds[] = {toMailId};
                //String toMailIds[] = {"rpunithaa@yahoo.co.in"};
                EmailContent email=new EmailContent();
                email.setTo(toMailIds);
                email.setFrom("info@hlc.com");
                email.setSubject("Insurance Activities Registration confirmation.");

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
                        "<span class=\"boldTxt\">Dear User</span>,<br /><br />"+
                        "<p> Dear User,"+


"You have successfully registered with United States Eventing Association for all  "+
"the Insurance Activities that are to be held! Your application would be verified and processed within "+
"24 hours."+
"Thank you for registering with United States Eventing Association."+
 
                        "<p>Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                    //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                    Debug.print("Email sent sucessfully :"+emailFlag);
                    return new ModelAndView("frmMeeUserEduSuccess");
     }
     catch(Exception einsert){
         Debug.print("insertion occurs in insurcance edu action" + einsert);
         
     }
             return null;
 }
  
   /*
    */

private ArrayList getDropDown(Vector mediaLists){        
ArrayList dropDwonLists = new ArrayList();
for (Iterator it = mediaLists.iterator(); it.hasNext();) {
String[] keyValue = (String[]) it.next();
dropDwonLists.add(new LabelValueBean(keyValue[1],keyValue[0]));                  
}    
return dropDwonLists; 
}   
     
private String convertToString(Date txtYesDate){

if(null==txtYesDate)
return "";

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
return sdf.format(txtYesDate);
}
}

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

import com.hlccommon.util.*;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


	public class ActionOrganiserRecap implements Controller {
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        try {
            Debug.print("ActionOrganiserRecap ActionForward");
            HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();

            HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();

            HLCOraganizerRecapVO objOrgRecap = new HLCOraganizerRecapVO();
            HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
            Vector publication = new Vector();
            String recapProcess = request.getParameter("recapProcess");
            Debug.print("recapProcess Value:" + recapProcess);

            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            HttpSession session = request.getSession(true);

            /*
             * get particular recap activity
             * public HLCOraganizerRecapVO getOrganizerRecapDetails(String recapId) throws RemoteException;
             */
            if (recapProcess.equals("initRecapOrg")) {
                try {
                    String memberId = (String) session.getAttribute("memberId");
                    Debug.print("initRecapOrg.status() called ....");
                    String Status = "Approved";
                    ArrayList statusList = educationBean.getAllActivityByRequestStatusByOrganizer(memberId, Status);
                    session.setAttribute("displayApprovedDetails", statusList);
                    /*
                    ArrayList actList =(ArrayList)educationBean.getActivityOraganizerMeeting(activityMeeId);
                    Iterator it = actList.iterator();
                    HLCActivityOrganizerVO objActivityDet = null;
                    Vector publicationVal = null;
                    if(it.hasNext()){
                    objActivityDet = (HLCActivityOrganizerVO)it.next();
                    publicationVal = (Vector)it.next();
                    }
                    session.setAttribute("ActivityOrganizerVODet", objActivityDet);
                     */
                    String userId = (String) session.getAttribute("userId");
                    Debug.print("ActionMeeting userId:" + userId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                    }
                    session.setAttribute("dynamicOrgDetails", organiserDet);
                    ArrayList area = (ArrayList) educationBean.getAreaMaster();
                    session.setAttribute("DispAreaDetails", area);
                    return new ModelAndView("frmMeeEduActRecap");
                } catch (Exception e) {
                    Debug.print("ActionMeeting Exception is:" + e);
                }
            } //======================================================================
            else if (recapProcess.equals("initRecapOrgSelect")) {
                try {
                    Debug.print("initRecapOrg.status() called ....");
                    String Status = "Approved";
                    ArrayList statusList = educationBean.getAllActivityByRequestStatus(Status);
                    session.setAttribute("displayApprovedDetails", statusList);
                    String meetingId = request.getParameter("activityName");
                    ArrayList actList = (ArrayList) educationBean.getActivityOraganizerMeeting(meetingId);
                    Iterator it = actList.iterator();
                    HLCActivityOrganizerVO objActivityDet = null;
                    Vector publicationVal = null;
                    if (it.hasNext()) {
                        objActivityDet = (HLCActivityOrganizerVO) it.next();
                        publicationVal = (Vector) it.next();
                    }

                    request.setAttribute("meetingId", meetingId);
                    request.setAttribute("ActivityOrganizerVODet", objActivityDet);
                    String userId = (String) session.getAttribute("userId");
                    Debug.print("ActionMeeting userId:" + userId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                    }
                    session.setAttribute("dynamicOrgDetails", organiserDet);

                    return new ModelAndView("frmMeeEduActRecap");
                } catch (Exception e) {
                    Debug.print("ActionMeeting Exception is:" + e);
                }
            } //=====================================================================        
            else if (recapProcess.equals("createRecapOrg")) {
                try {
                    //objOrgRecap.setRecapId(String recapId);

                    String activityMeetingId = request.getParameter("activityName");
                    String activityOrganizerId = (String) session.getAttribute("memberId");
                    String tempActivityDateChangeStaus = request.getParameter("activityDateChangeStatus");
                    Debug.print("activityMeetingId:" + activityMeetingId);
                    Debug.print("activityOrganizerId:" + activityOrganizerId);


                    boolean activityDateChangeStatus = false;
                    if (tempActivityDateChangeStaus.equals("yes")) {
                        activityDateChangeStatus = true;
                    }

                    int noOfRiders = Integer.parseInt(request.getParameter("noOfRiders"));
                    int noOfInstructors = Integer.parseInt(request.getParameter("noOfInstructors"));
                    int noOfCurrentMembers = Integer.parseInt(request.getParameter("noOfCurrentMembers"));
                    int noOfNewMembers = Integer.parseInt(request.getParameter("noOfNewMembers"));
                    int noOfRenewingMembers = Integer.parseInt(request.getParameter("noOfRenewingMembers"));
                    int noOfFullMembers = Integer.parseInt(request.getParameter("noOfFullMembers"));
                    int noOfJuniorMembers = Integer.parseInt(request.getParameter("noOfJuniorMembers"));
                    int noOfNonCompetingMembers = Integer.parseInt(request.getParameter("noOfNonCompetingMembers"));
                    // Date activityReportDate = Integer.parseInt(request.getParameter("noOfRiders"));
                    float totalAmount = Float.parseFloat(request.getParameter("totalAmount"));
                    //Date closeDate;
                    String comments = request.getParameter("comments");
                    String tempPublishComments = request.getParameter("publishComments");
                    boolean publishComments = false;
                    if (tempPublishComments.equals("yes")) {
                        publishComments = true;
                    }

                    String suggestions = request.getParameter("suggestions");
                    Date addDate = null;
                    boolean activeStatus = true;
                    String requestStatus = "Pending";
                    objOrgRecap.setActivityMeetingId(activityMeetingId);
                    objOrgRecap.setActivityDateChangeStatus(activityDateChangeStatus);
                    objOrgRecap.setActivityOrganizerId(activityOrganizerId);
                    // objOrgRecap.set
                    objOrgRecap.setNoOfRiders(noOfRiders);
                    objOrgRecap.setNoOfInstructors(noOfInstructors);
                    objOrgRecap.setNoOfCurrentMembers(noOfCurrentMembers);
                    objOrgRecap.setNoOfNewMembers(noOfNewMembers);
                    objOrgRecap.setNoOfRenewingMembers(noOfRenewingMembers);
                    objOrgRecap.setNoOfFullMembers(noOfFullMembers);
                    objOrgRecap.setNoOfJuniorMembers(noOfJuniorMembers);
                    objOrgRecap.setNoOfNonCompetingMembers(noOfNonCompetingMembers);
                    //objOrgRecap.setActivityReportDate(null);
                    objOrgRecap.setTotalAmount(totalAmount);
                    //objOrgRecap.setCloseDate(new Date());
                    objOrgRecap.setComments(comments);
                    objOrgRecap.setPublishComments(publishComments);
                    objOrgRecap.setSuggestions(suggestions);
                    objOrgRecap.setAddDate(new Date());
                    objOrgRecap.setActiveStatus(true);
                    objOrgRecap.setRequestStatus(requestStatus);

                    boolean result = educationBean.createRecap(objOrgRecap);
                    Debug.print("Result:" + result);
                    if (result == true) {
                        String emailId = (String) session.getAttribute("emailId");
                        String toMailIds[] = {emailId};

                        EmailContent email = new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@hlc.com");
                        email.setSubject("Educational Activities Recap Registration confirmation.");

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
                                "<span class=\"boldTxt\">Dear User</span>,<br /><br />" +
                                "<p>Dear Organizer," +
                                "You have successfully submitted the Educational Activity Recap form!" +
                                "Thank you for using this service.<p>" +
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
                                "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>" +
                                "</tr>" +
                                " <tr>" +
                                "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                                "</tr>" +
                                "</table>";

                        email.setBody(content);
                        //email.setAttachments();
                        EmailEngine emailEngine = new EmailEngine();
                        boolean emailFlag = emailEngine.sendMimeEmail(email);
                        //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                        Debug.print("Email sent sucessfully :" + emailFlag);
                    }
                    return new ModelAndView("frmMeeEduOrgRecapSuccess");
                } catch (Exception ers) {
                    Debug.print("Exception occurs while creating recaping " + ers);
                }
            } else if (recapProcess.equalsIgnoreCase("showRecapAct")) {
                Debug.print("showRecapAct method is calling......");
                String recapId = request.getParameter("orgRecapId");
                Debug.print("showRecapAct method is calling Recap ID:" + recapId);
                objOrgRecap = educationBean.getOrganizerRecapDetails(recapId);
                session.setAttribute("DispOrgRecapDetails", objOrgRecap);

                ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                session.setAttribute("DisplayActivityTypeDetails", list);
                ArrayList actList = (ArrayList) educationBean.getActivityOraganizerMeeting(objOrgRecap.getActivityMeetingId());
                Iterator it = actList.iterator();
                HLCActivityOrganizerVO objActivityDet = null;
                Vector publicationVal = null;
                ArrayList recaplistAll = new ArrayList();
                while (it.hasNext()) {
                    objActivityDet = (HLCActivityOrganizerVO) it.next();
                    publicationVal = (Vector) it.next();
                    recaplistAll.add(objActivityDet);
                }
                session.setAttribute("ActivityOrganizerVODet", objActivityDet);
                ArrayList organiserDet = new ArrayList();
                if (objOrgRecap.getActivityOrganizerId() != null) {
                    organiserDet = (ArrayList) humanMemb.getMemberContactDetails(objOrgRecap.getActivityOrganizerId());
                }
                session.setAttribute("dynamicOrgDetails", organiserDet);
                ArrayList area = (ArrayList) educationBean.getAreaMaster();
                session.setAttribute("DispAreaDetails", area);
                return new ModelAndView("frmMeeOrgEduActRecapDetails");
            } else if (recapProcess.equalsIgnoreCase("showMyRecapAct")) {
                Debug.print("showMyRecapAct method is calling......");
                String recapId = request.getParameter("orgRecapId");
                Debug.print("showMyRecapAct method is calling Recap ID:" + recapId);
                objOrgRecap = educationBean.getOrganizerRecapDetails(recapId);
                session.setAttribute("DispOrgRecapDetails", objOrgRecap);

                ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                session.setAttribute("DisplayActivityTypeDetails", list);
                ArrayList actList = (ArrayList) educationBean.getActivityOraganizerMeeting(objOrgRecap.getActivityMeetingId());
                Iterator it = actList.iterator();
                HLCActivityOrganizerVO objActivityDet = null;
                Vector publicationVal = null;
                ArrayList recaplistAll = new ArrayList();
                while (it.hasNext()) {
                    objActivityDet = (HLCActivityOrganizerVO) it.next();
                    publicationVal = (Vector) it.next();
                    recaplistAll.add(objActivityDet);
                }
                session.setAttribute("ActivityOrganizerVODet", objActivityDet);
                ArrayList organiserDet = new ArrayList();
                if (objOrgRecap.getActivityOrganizerId() != null) {
                    organiserDet = (ArrayList) humanMemb.getMemberContactDetails(objOrgRecap.getActivityOrganizerId());
                }
                session.setAttribute("dynamicOrgDetails", organiserDet);


                return new ModelAndView("frmMeeOrgEduActRecapMyDetails");
            } else if (recapProcess.equalsIgnoreCase("approval")) {
                Debug.print("approval method is calling......");
                String recapId = request.getParameter("orgRecapId");
                String tempReportDate = request.getParameter("reportDate");
                String tempCloseDate = request.getParameter("closeDate");
                Date reportDate = null;
                Date closeDate = null;
                if (tempReportDate != null) {
                    reportDate = (Date) sdf.parse(tempReportDate);
                }

                if (tempCloseDate != null) {
                    closeDate = (Date) sdf.parse(tempCloseDate);
                }

                boolean result = educationBean.assignDatesForRecap(recapId, reportDate, closeDate);
                // session.setAttribute("DispOrgRecapDetails", objOrgRecap);
                

                Debug.print("viewListRecapAdmin method is calling......");
              
                ArrayList recapList = new ArrayList();
                ArrayList recapOrgList = educationBean.getAllOrganizerRecapDetails();
                Iterator e = recapOrgList.iterator();
                while (e.hasNext()) {
                    HLCOraganizerRecapVO objActRecapDet = (HLCOraganizerRecapVO) e.next();
                    String recapId1 = objActRecapDet.getRecapId();
                    String mettingId = objActRecapDet.getActivityMeetingId();
                    String activityName = educationBean.getActivityName(objActRecapDet.getActivityMeetingId());
                    Date addDate = objActRecapDet.getAddDate();
                    String resuestStatus = objActRecapDet.getRequestStatus();
                    ArrayList listRecap = new ArrayList();
                    listRecap.add(recapId1);
                    listRecap.add(mettingId);
                    listRecap.add(activityName);
                    listRecap.add(addDate);
                    listRecap.add(resuestStatus);
                    recapList.add(listRecap);
                }

                session.setAttribute("DispAllOrgRecapAdminDetails", recapList);
                return new ModelAndView("frmMeeOrgEduActRecapListing");
            
                
                
            } 
            
            /* Page not found
            else if (recapProcess.equalsIgnoreCase("singleRecap")) {
                Debug.print("singleRecap method is calling......");
                String meetingId = request.getParameter("meetingId");
                ArrayList recapList = educationBean.getOrganizerRecapDetailsByMeetingId(meetingId);
                session.setAttribute("DispRecapMeeDetails", recapList);
                return mapping.findForward("goToParticualrPage");
            } 
            */
            
            
            
            /*
             * ArrayList al = educationBean.getOrganizerRecapDetailsByOrganizerId("100000");
             * get organiser recap details by orgainserId
             */ else if (recapProcess.equalsIgnoreCase("viewListRecapAdmin")) {
                Debug.print("viewListRecapAdmin method is calling......");
               

                ArrayList recapList = new ArrayList();
                ArrayList recapOrgList = educationBean.getAllOrganizerRecapDetails();
                Iterator e = recapOrgList.iterator();
                while (e.hasNext()) {
                    HLCOraganizerRecapVO objActRecapDet = (HLCOraganizerRecapVO) e.next();
                    String recapId = objActRecapDet.getRecapId();
                    String mettingId = objActRecapDet.getActivityMeetingId();
                    String activityName = educationBean.getActivityName(objActRecapDet.getActivityMeetingId());
                    Date addDate = objActRecapDet.getAddDate();
                    String resuestStatus = objActRecapDet.getRequestStatus();
                    ArrayList listRecap = new ArrayList();
                    listRecap.add(recapId);
                    listRecap.add(mettingId);
                    listRecap.add(activityName);
                    listRecap.add(addDate);
                    listRecap.add(resuestStatus);
                    recapList.add(listRecap);
                }

                session.setAttribute("DispAllOrgRecapAdminDetails", recapList);
                return new ModelAndView("frmMeeOrgEduActRecapListing");
            } else if (recapProcess.equalsIgnoreCase("viewListRecapOrg")) {
                Debug.print("viewListRecapOrg method is calling......");
                //String organiserId = request.getParameter("organiserId");

                ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                session.setAttribute("DisplayActivityTypeDetails", list);
                String organiserId = (String) session.getAttribute("memberId");
                //String organiserId = "100000";
                ArrayList recapOrgList = new ArrayList();
                ArrayList recapList = new ArrayList();
                if (organiserId != null) {
                    recapOrgList = (ArrayList) educationBean.getOrganizerRecapDetailsByOrganizerId(organiserId);
                    // ArrayList recapOrgList = educationBean.getAllOrganizerRecapDetails();
                    Iterator e = recapOrgList.iterator();
                    while (e.hasNext()) {
                        HLCOraganizerRecapVO objActRecapDet = (HLCOraganizerRecapVO) e.next();
                        String recapId = objActRecapDet.getRecapId();
                        String mettingId = objActRecapDet.getActivityMeetingId();
                        String activityName = educationBean.getActivityName(objActRecapDet.getActivityMeetingId());
                        Date addDate = objActRecapDet.getAddDate();
                        String resuestStatus = objActRecapDet.getRequestStatus();
                        ArrayList listRecap = new ArrayList();
                        listRecap.add(recapId);
                        listRecap.add(mettingId);
                        listRecap.add(activityName);
                        listRecap.add(addDate);
                        listRecap.add(resuestStatus);
                        recapList.add(listRecap);
                    }
                }
                Debug.print("viewListRecapOrg method is calling......" + recapList.size());
                session.setAttribute("DispAllOrgRecapDetails", recapList);

                return new ModelAndView("frmMeeOrgEduActRecapMyListing");
            }
            
            /*
            Page Not found
           else if (recapProcess.equalsIgnoreCase("recapByOrg")) {
                Debug.print("recapByOrg method is calling......");
                String organiserId = request.getParameter("organiserId");
                // String organiserId = "100001";
                ArrayList recapOrgList = educationBean.getOrganizerRecapDetailsByOrganizerId(organiserId);
                session.setAttribute("DispOrgDetails", recapOrgList);
                return mapping.findForward("goToOrgRecapPage");
            } 
            */
            
            /*
             *  show user records
             *  frmMeeOrgUserEduActRegiListing.jsp
             *  Admin can view status
             * public ArrayList getAllActivityUserByRequestStatus(String activityMeetingId, String requestStatus) throws RemoteException;
             */ else if (recapProcess.equalsIgnoreCase("userViewStatus")) {
                Debug.print("User Status is calling................");
                try {
                    String userStatus = request.getParameter("userStatus");
                    String meetingId = request.getParameter("meetingId");
                    ArrayList userList = educationBean.getAllActivityUserByRequestStatus(meetingId, userStatus);
                    session.setAttribute("DisplayUserDetails", userList);
                } catch (Exception eUserStatus) {
                    Debug.print("Exception occurs in eUserStatus " + eUserStatus);
                }

            }
        } catch (Exception ex) {
            Debug.print("ActionOrganiserRecap Exception is :" + ex);
        }

        return null;
    }
}

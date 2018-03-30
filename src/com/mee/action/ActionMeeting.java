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
/*  Program Name    : ActionMeeting.java
 *  Created Date    : September 20, 2006, 11:04 AM
 *  Author          : Punitha
 *  Version         : 1.7
 *  CopyrightInformation:
(c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
916 W. Broad Street Suite 205, FallsChurch, VA 22046.
This document is protected by copyright. No part of this document may be reproduced in any form by any means without
prior written authorization of Sun and its licensors. if any.
The information described in this document may be protected by one or more U.S.patents.foreign patents,or
pending applications.
 */
package com.mee.action;

import com.hlccommon.util.*;
import com.hlcevent.edu.HLCEducationalSessionBean;

import com.hlcform.stateless.HLCkaverystatelessBean;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcmro.display.HLCVaigaiStatelessBean;


	public class ActionMeeting implements Controller {

		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
        try {
        	 HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();

        	 HLCVaigaiStatelessBean vaigaiBean=new HLCVaigaiStatelessBean();

        	 HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
        	 
            HLCOraganizerRecapVO objOrgRecap = new HLCOraganizerRecapVO();
            HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
            Vector publication = new Vector();

            String meeProcess = request.getParameter("meeProcess");
            HttpSession session = request.getSession(true);

//--------------------------------------------------------redirects to organiser list-------------------------------------------             
            if (meeProcess.equals("newAdmin")) {
                try {
                    Debug.print("ActionMeeting.newAdmin() called ....");
                    Debug.print("educationBean" + educationBean);
                    Debug.print("Redirected successfully to particular page.....");
                    return new ModelAndView("frmMeeAdminEduActRegiListing");
                } catch (Exception enew) {
                    System.out.print("Exception is::::;;;;;;;;" + enew);

                }
            } //--------------------------------------------------------Based on status get organiser details-------------------------------------------                
            else if (meeProcess.equals("showStatus")) {
                try {
                    Debug.print("ActionMeeting.status() called ....");
                    String status = request.getParameter("status");

                    String memberId = (String) session.getAttribute("memberId");
                    Debug.print("ActionMeeting memberId:" + memberId);
                    ArrayList organiserDet = null;
                    if (memberId != null) {
                        organiserDet = (ArrayList) humanMemb.getMemberContactDetails(memberId);
                    }
                    ArrayList statusList = educationBean.getAllActivityByRequestStatus(status);
                    Debug.print("status" + status);
                    request.setAttribute("displayStatusDetails", statusList);
                    request.setAttribute("status", status);
                    Debug.print("Records are fetched Successfully based on the status:" + statusList);
                    session.setAttribute("dynamicOrgDetails", organiserDet);
                    return new ModelAndView("frmMeeAdminEduActRegiListing");
                } catch (Exception e) {
                    System.out.print("Exception is::::;;;;;;;;" + e);
                }
            } //--------------------------------------------------------redirects to frmMeeAdminEduActRegiApprove.jsp-------------------------------------------             
            else if (meeProcess.equals("showDet")) {
                Debug.print("ActionMeeting.showDet() called ....");
                String activityMeeId = request.getParameter("meetingId");
                Debug.print("activityMeeId" + activityMeeId);
                String memberId = (String) session.getAttribute("memberId");
                Debug.print("memberId" + memberId);

                if (activityMeeId != null && memberId != null) {
                    ArrayList memberDet = humanMemb.getMemberContactDetails(memberId);
                    Debug.print("Member Details from database" + memberDet);
                    request.setAttribute("DisplaymemberDetails", memberDet);
                    Debug.print("Servlet inside loop:" + activityMeeId);
                    ArrayList listDet = educationBean.getActivityOraganizerMeeting(activityMeeId);
                    request.setAttribute("DisplayOrgDetails", listDet);

                    ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                    request.setAttribute("DisplayActivityTypeDetails", list);

                    ArrayList area = (ArrayList) educationBean.getAreaMaster();
                    request.setAttribute("DispAreaDetails", area);
                }
                return new ModelAndView("frmMeeAdminEduActRegiApprove");
            } //----------------------------------------------------------status changes for organiser-------------------------------------------------------------------
            else if (meeProcess.equals("updateStatus")) {
                try {
                    Debug.print("ActionMeeting.updateStatus() called ....");
                    String activityMeeId = request.getParameter("actMeetId");
                    String radioStatus = request.getParameter("radioStatus");
                    String comments = request.getParameter("comments");
                    Debug.print("activityMeeId" + activityMeeId);
                    Debug.print("radioStatus" + radioStatus);
                    Debug.print("comments" + comments);
                    //  String approvedBy =  (String)session.getAttribute("userCode");
                    Debug.print("activityMeeId is::::::::::::" + activityMeeId);
                    if (activityMeeId != null && radioStatus != null) {
                        if (radioStatus.equals("Approve")) {
                            radioStatus = "Approved";
                        }

                        if (radioStatus.equals("Reject")) {
                            radioStatus = "Rejected";
                        }
                    }
                    Debug.print("Servlet inside changeStatus:" + radioStatus);
                    boolean result = educationBean.changeStatusOrganizer(activityMeeId, radioStatus, comments);

                    // String userCode =  (String)session.getAttribute("userCode");
                    return new ModelAndView("frmMeeAdminEduActRegiListing");

                } catch (Exception eupdate) {
                    System.out.println("exception occurs in status update::");
                }
            } //-----------------------------------------------------------------------Organiser Details---------------------------------------------------              
            else if (meeProcess.equals("editOrgDet")) {
                String activityOrgId = request.getParameter("ownOrgId");
                ArrayList singleOrgDet = (ArrayList) educationBean.getMyEducationalActivity(activityOrgId);
                request.setAttribute("editOrgDetails", singleOrgDet);
                return new ModelAndView("frmMeeEduEditActivity");

            } //----------------------------------------------------------------------- Organiser Lists based on member Id---------------------------------------------------              
            else if (meeProcess.equals("orgOwnList")) {
                String sessOrgId = (String) session.getAttribute("memberId");
                ArrayList OrgDetails = null;
                if (sessOrgId != null) {
                    OrgDetails = (ArrayList) educationBean.getMyEducationalActivity(sessOrgId);
                }
                request.setAttribute("dispOwnOrgDetails", OrgDetails);
                Debug.print("own organiser list");
                return new ModelAndView("frmMeeOrgEduActRegiListing");
            } //------------------------------------------------------------------- Particular Organiser Details based on meeting Id----------------------------           
            else if (meeProcess.equals("viewOwnList")) {
                Debug.print("Organiser Detail List is calling....");
                String memberId = (String) session.getAttribute("memberId");
                String submitApproval = request.getParameter("submitApproval");
                Debug.print("memberId" + memberId);
                String activityMeeId = request.getParameter("activityMeeId");
                Debug.print("activityMeeId" + activityMeeId);
                if (activityMeeId != null && memberId != null) {
                    ArrayList memberDet = humanMemb.getMemberContactDetails(memberId);
                    Debug.print("Member Details from database" + memberDet);
                    request.setAttribute("DisplaymemberDetails", memberDet);

                    ArrayList OrgDetailsDisplay = (ArrayList) educationBean.getActivityOraganizerMeeting(activityMeeId);
                    request.setAttribute("OrgDetailsDisplay", OrgDetailsDisplay);

                    ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                    request.setAttribute("DisplayActivityTypeDetails", list);

                    ArrayList area = (ArrayList) educationBean.getAreaMaster();
                    request.setAttribute("DispAreaDetails", area);

                    if (submitApproval.equals("Edit")) {
                        return new ModelAndView("frmMeeEduEditActivity");
                    } else if (submitApproval.equals("View")) {
                        return new ModelAndView("frmMeeOrgEduActRegiDetails");
                    }
                }
            // return new ModelAndView("frmMeeOrgEduActRegiListing"); 
            } //---------------------------------------Redirects to frmMeeOrgUserEduActRegiListing for display all user details-----------------------             
            else if (meeProcess.equals("userDetList")) {
                Debug.print("ActionMeeting.userList() called ....");
                ArrayList OrgDetails = new ArrayList();
                ArrayList memberDet = new ArrayList();
                String organizerId = (String) session.getAttribute("memberId");
                session.setAttribute("DisplaymemberDetails", null);
                session.setAttribute("dispOwnOrgDetails", null);
                session.setAttribute("DispUserDetails", null);
                Debug.print("ActionMeeting.userDetList() called .... OrganizerId:" + organizerId);
                if (organizerId != null) {
                    OrgDetails = (ArrayList) educationBean.getMyEducationalActivity(organizerId);
                    memberDet = humanMemb.getMemberContactDetails(organizerId);
                }
                Debug.print("Member Details from database" + memberDet);

                session.setAttribute("DisplaymemberDetails", memberDet);
                session.setAttribute("dispOwnOrgDetails", OrgDetails);

                return new ModelAndView("frmMeeOrgUserEduActRegiListing");
            } //---------------------------------------Based on status get user details----------------------------------------------------------------             
            else if (meeProcess.equals("userShowStatus")) {
                try {
                    Debug.print("ActionMeeting.userShowStatus() called ....");
                    String selUserStatus = request.getParameter("selUserStatus");
                    Debug.print("Actionmeeting selUserStatus:" + selUserStatus);
                    String meetingId = request.getParameter("meetingId");
                    Debug.print("Actionmeeting Meeting ID:" + meetingId);
                    ArrayList organiserDet = new ArrayList();
                    request.setAttribute("selUserStatus", selUserStatus);
                    ArrayList statusList = new ArrayList();

                    statusList = educationBean.getAllActivityUserByRequestStatus(meetingId, selUserStatus);
                    Iterator itMain = statusList.iterator();
                    HLCActivityUserVO objActivityUserDet = null;
                    ArrayList recaplistAll = new ArrayList();
                    while (itMain.hasNext()) {
                        ArrayList UList = new ArrayList();
                        objActivityUserDet = (HLCActivityUserVO) itMain.next();
                        String releaseId = objActivityUserDet.getReleaseId();
                        String uId = objActivityUserDet.getUserId();
                        String meetingIdVal = objActivityUserDet.getActivityMeetingId();
                        Date regDate = objActivityUserDet.getAddDate();
                        String noHorse = objActivityUserDet.getNoOfHorses();
                        UList.add(releaseId);
                        UList.add(meetingIdVal);
                        UList.add(uId);
                        String uName = "";
                        if (uId != null) {
                            organiserDet = (ArrayList) humanMemb.getUserContactDetails(uId);
                            Iterator it = organiserDet.iterator();
                            if (it.hasNext()) {
                                String prefix1 = (String) it.next();
                                if (prefix1 == null) {
                                    prefix1 = "";
                                }
                                String first_name = (String) it.next();
                                if (first_name == null) {
                                    first_name = "";
                                }
                                String middle_name = (String) it.next();
                                if (middle_name == null) {
                                    middle_name = "";
                                }
                                String last_name = (String) it.next();
                                if (last_name == null) {
                                    last_name = "";
                                }
                                String sufix = (String) it.next();
                                if (sufix == null) {
                                    sufix = "";
                                }
                                String email_id = (String) it.next();
                                if (email_id == null) {
                                    email_id = "";
                                }
                                String suite = (String) it.next();
                                if (suite == null) {
                                    suite = "";
                                }
                                String address1 = (String) it.next();
                                if (address1 == null) {
                                    address1 = "";
                                }
                                String address2 = (String) it.next();
                                if (address2 == null) {
                                    address2 = "";
                                }
                                String city = (String) it.next();
                                if (city == null) {
                                    city = "";
                                }
                                String state = (String) it.next();
                                if (state == null) {
                                    state = "";
                                }
                                String country = (String) it.next();
                                if (country == null) {
                                    country = "";
                                }
                                String zip = (String) it.next();
                                if (zip == null) {
                                    zip = "";
                                }
                                String phone_no = (String) it.next();
                                if (phone_no == null) {
                                    phone_no = "";
                                }
                                String mobile_no = (String) it.next();
                                if (mobile_no == null) {
                                    mobile_no = "";
                                }
                                String fax_no = (String) it.next();
                                if (fax_no == null) {
                                    fax_no = "";
                                }
                                uName = first_name;
                            }
                        }
                        UList.add(uName);
                        UList.add(regDate);
                        UList.add(noHorse);
                        recaplistAll.add(UList);
                    }
                    request.setAttribute("meetingId", meetingId);
                    Debug.print("status" + statusList);
                    session.setAttribute("DispUserDetails", recaplistAll);
                    return new ModelAndView("frmMeeOrgUserEduActRegiListing");
                } catch (Exception e) {
                    System.out.print("Exception occurs while displaying records based status" + e);
                }
            } //-----------------------------------------------------------Change Status for user----------------------------------------------------
            else if (meeProcess.equals("userUpdateStatus")) {
                Debug.print("userUpdateStatus is calling................");
                try {
                    String userChangeStatus = request.getParameter("userChangeStatus");
                    if (userChangeStatus.equals("Approve")) {
                        userChangeStatus = "Approved";
                    }
                    String releaseId = request.getParameter("releaseId");
                    boolean userStatus = educationBean.changeStatusForUser(releaseId, userChangeStatus);
                    request.setAttribute("releaseId", releaseId);
                    session.setAttribute("DispUserDetails", null);
                    Debug.print("userUpdateStatus Result:" + userStatus);
                } catch (Exception eUserStatus) {
                    Debug.print("Exception occurs in eUserStatus " + eUserStatus);
                }
                return new ModelAndView("frmMeeOrgUserEduActRegiListing");
            } //-----------------------------------------------------------User can see their status----------------------------------------------------
            else if (meeProcess.equalsIgnoreCase("userStatus")) {
                Debug.print("userStatus is calling................");
                try {
                    String userId = (String) session.getAttribute("userId");
                    ArrayList al = new ArrayList();
                    if (userId != null) {
                        al = educationBean.getUserMyEducationalActivity(userId);
                    }
                    session.setAttribute("DispAllUserDetail", al);
                } catch (Exception eUserStatus) {
                    Debug.print("Exception occurs in eUserStatus " + eUserStatus);
                }
                return new ModelAndView("frmMeeUserEduActInsureRegiListing");
            } //---------------------------------------------------------------user can see their particular detail---------------------------------------------
            else if (meeProcess.equalsIgnoreCase("userDetail")) {
                Debug.print("userDetail is calling................");
                try {
                    String releaseId = request.getParameter("releaseId");
                    String activityMeetingId = request.getParameter("activityMeetingId");
                    String userId = (String) session.getAttribute("userId");
                    Debug.print("ActionMeeting userId:" + userId);
                    Debug.print("ActionMeeting releaseId:" + userId);
                    Debug.print("ActionMeeting activityMeetingId:" + activityMeetingId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                    }
                    session.setAttribute("dynamicOrgDetails", organiserDet);
                    ArrayList detailList = (ArrayList) educationBean.getActivityOraganizerMeeting(activityMeetingId);
                    Iterator it = detailList.iterator();
                    HLCActivityOrganizerVO objActivityDet = null;
                    Vector publicationVal = null;
                    if (it.hasNext()) {
                        objActivityDet = (HLCActivityOrganizerVO) it.next();
                        publicationVal = (Vector) it.next();
                    }
                    request.setAttribute("orgMeetingId", activityMeetingId);
                    request.setAttribute("ActivityOrganizerVODet", objActivityDet);

                    HLCActivityUserVO objActUser = (HLCActivityUserVO) educationBean.getActivityUserDetail(releaseId);
                    request.setAttribute("DispParticularUserDetail", objActUser);

                    ArrayList area = (ArrayList) educationBean.getAreaMaster();
                    request.setAttribute("DispAreaDetails", area);

                    Vector levels = vaigaiBean.getAllLevels();
                    request.setAttribute("AllLevels", levels);
                } catch (Exception ereleaseId) {
                    Debug.print("Exception occurs in eUserStatus " + ereleaseId);
                }
                return new ModelAndView("frmMeeUserEduActInsureDetails");

            } //--------------------------------------------------------------Available Meetingss----------------------------------------------------------                
            else if (meeProcess.equals("statusApproved")) {
                try {
                    Debug.print("statusApproved.status() called ....");
                    String status = "Approved";
                    ArrayList statusList = educationBean.getAllActivityByRequestStatus(status);
                    Debug.print("status" + status);
                    request.setAttribute("displayApprovedDetails", statusList);
                    Debug.print("Records are fetched Successfully based on the status:" + statusList);
                    return new ModelAndView("frmMeeUserEduMeeListing");
                } catch (Exception e) {
                    System.out.print("Exception is:" + e);
                }
            } //--------------------------------------------------------------Particular Meeting Details----------------------------------------------------------                                
            /*
             *  particular meeting details   input=frmMeeUserEduMeeListing.jsp
             *  public ArrayList getActivityOraganizerMeeting(String activityMeetingId) throws RemoteException;
             */ else if (meeProcess.equals("showOrgMee")) {
                try {
                    Debug.print("showOrgMee.status() called ....");
                    String orgMeetingId = request.getParameter("orgMeetingId");
                    Debug.print("meetingId" + orgMeetingId);
                    String butName = request.getParameter("butName");
                    Debug.print("butName" + butName);

                    if (butName.equalsIgnoreCase("View")) {
                        ArrayList detailList = educationBean.getActivityOraganizerMeeting(orgMeetingId);
                        Debug.print("status" + detailList);
                        Iterator it = detailList.iterator();
                        HLCActivityOrganizerVO objActivityDet = null;
                        Vector publicationVal = null;
                        ArrayList recaplistAll = new ArrayList();

                        while (it.hasNext()) {
                            objActivityDet = (HLCActivityOrganizerVO) it.next();
                            publicationVal = (Vector) it.next();
                        //recaplistAll.add(objActivityDet);
                        }

                        // session.setAttribute("ActivityOrganizerVODet", recaplistAll);
                        request.setAttribute("displayFULLMeeDetails", detailList);
                        ArrayList organiserDet = new ArrayList();

                        Debug.print("MemeberId" + objActivityDet.getActivityOrganizerId());
                        if (objActivityDet.getActivityOrganizerId() != null) {
                            organiserDet = (ArrayList) humanMemb.getMemberContactDetails(objActivityDet.getActivityOrganizerId());
                        }


                        session.setAttribute("dynamicOrgDetails", organiserDet);
                        //session.setAttribute("ActivityOrganizerVODet", objActivityDet);
                        ArrayList list = (ArrayList) educationBean.getActivityTypeDetails();
                        session.setAttribute("DisplayActivityTypeDetails", list);

                        ArrayList area = (ArrayList) educationBean.getAreaMaster();
                        session.setAttribute("DispAreaDetails", area);

                        return new ModelAndView("frmMeeUserViewDetEdu");
                    } else if (butName.equalsIgnoreCase("Apply")) {

                        Vector levels = vaigaiBean.getAllLevels();
                        request.setAttribute("AllLevels", levels);

                        ArrayList area = (ArrayList) educationBean.getAreaMaster();
                        session.setAttribute("DispAreaDetails", area);


                        ArrayList detailList = (ArrayList) educationBean.getActivityOraganizerMeeting(orgMeetingId);
                        Iterator it = detailList.iterator();
                        HLCActivityOrganizerVO objActivityDet = null;
                        Vector publicationVal = null;
                        if (it.hasNext()) {
                            objActivityDet = (HLCActivityOrganizerVO) it.next();
                            publicationVal = (Vector) it.next();
                        }
                        request.setAttribute("orgMeetingId", orgMeetingId);
                        session.setAttribute("ActivityOrganizerVODet", objActivityDet);

                        String userId = (String) session.getAttribute("userId");
                        Debug.print("ActionMeeting userId:" + userId);
                        ArrayList organiserDet = null;
                        if (userId != null) {
                            organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                        }
                        session.setAttribute("dynamicOrgDetails", organiserDet);

                        return new ModelAndView("frmMeeInsureEduAct");
                    }
                } catch (Exception e) {
                    System.out.print("Exception is::::;;;;;;;;" + e);
                }
            } //--------------------------------------------------------------------------------------------------------------------------------------                  
            /*
             *  show user records
             *  frmMeeOrgUserEduActRegiListing.jsp
             *  Admin can view status
             * public ArrayList getAllActivityUserByRequestStatus(String activityMeetingId, String requestStatus) throws RemoteException;
             */ else if (meeProcess.equals("userViewStatus")) {
                Debug.print("userViewStatus is calling................");
                try {
                    String userStatus = request.getParameter("userStatus");
                    String meetingId = request.getParameter("meetingId");
                    ArrayList userList = educationBean.getAllActivityUserByRequestStatus(meetingId, userStatus);
                    session.setAttribute("DisplayUserDetails", userList);
                } catch (Exception eUserStatus) {
                    Debug.print("Exception occurs in eUserStatus " + eUserStatus);
                }

            } //---------------------------------------------------------------Organizer can see their particular User detail---------------------------------------------
            else if (meeProcess.equalsIgnoreCase("userDetailOrg")) {
                Debug.print("userDetailOrg is calling................");
                try {
                    String userId = request.getParameter("uId");
                    Debug.print("ActionMeeting userId:" + userId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                    }
                    session.setAttribute("dynamicOrgDetails", organiserDet);
                    String releaseId = request.getParameter("releaseId");
                    String activityMeetingId = request.getParameter("activityMeetingId");
                    ArrayList detailList = (ArrayList) educationBean.getActivityOraganizerMeeting(activityMeetingId);
                    Iterator it = detailList.iterator();
                    HLCActivityOrganizerVO objActivityDet = null;
                    Vector publicationVal = null;
                    if (it.hasNext()) {
                        objActivityDet = (HLCActivityOrganizerVO) it.next();
                        publicationVal = (Vector) it.next();
                    }
                    request.setAttribute("orgMeetingId", activityMeetingId);
                    session.setAttribute("ActivityOrganizerVODet", objActivityDet);
                    HLCActivityUserVO objActUser = (HLCActivityUserVO) educationBean.getActivityUserDetail(releaseId);
                    session.setAttribute("DispParticularUserDetail", objActUser);

                    Vector levels = vaigaiBean.getAllLevels();
                    request.setAttribute("AllLevels", levels);

                    ArrayList area = (ArrayList) educationBean.getAreaMaster();
                    request.setAttribute("DispAreaDetails", area);
                } catch (Exception ereleaseId) {
                    Debug.print("Exception occurs in eUserStatus " + ereleaseId);
                }
                return new ModelAndView("frmMeeUserEduActInsureDetailsOrg");

            } else if (meeProcess.equalsIgnoreCase("userDetailsView")) {
                Debug.print("userDetailsView is calling................");
                try {
                    String userId = request.getParameter("uid");
                    Debug.print("ActionMeeting userId:" + userId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetails(userId);
                    }
                    request.setAttribute("userDetails", organiserDet);
                } catch (Exception ereleaseId) {
                    Debug.print("Exception occurs in userDetailsView :" + ereleaseId);
                }
                return new ModelAndView("frmMemUserDetails");
            } else if (meeProcess.equalsIgnoreCase("userDetailsViewLogin")) {
                Debug.print("userDetailsViewLogin is calling................");
                try {
                    String userId = request.getParameter("uid");
                    Debug.print("ActionMeeting userId:" + userId);
                    ArrayList organiserDet = null;
                    if (userId != null) {
                        organiserDet = (ArrayList) humanMemb.getUserContactDetailsForAdmin(userId);
                        request.setAttribute("logUserId", userId);
                    }
                    request.setAttribute("userDetails", organiserDet);
                } catch (Exception ereleaseId) {
                    Debug.print("Exception occurs in userDetailsViewLogin :" + ereleaseId);
                }
                return new ModelAndView("frmMemUserDetailsLoginView");
            }

        } catch (Exception ex) {
            System.out.println("Exception is general:::" + ex);
        }
        return null;
    }
}

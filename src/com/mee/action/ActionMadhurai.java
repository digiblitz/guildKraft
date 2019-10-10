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
/*  Program Name    : ActionMadhurai.java
 *  Created Date    : September 17, 2006, 4:20 PM
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
    import com.hlccommon.util.HLCPaymentDetailVO;
    import com.hlccommon.util.Debug;
import com.hlcevent.edu.HLCEducationalSessionBean;
    import com.hlcevent.edu.HLCEducationalSessionRemote;
    import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlcpayment.HLCPaymentSessionBean;
    import com.hlcpayment.HLCPaymentSessionRemote;
    import com.hlcpayment.HLCPaymentSessionRemoteHome;
    import com.util.email.EmailContent;
    import com.util.email.EmailEngine;
    import com.mee.actionform.FormMadhurai;
    import com.hlccommon.util.*;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
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


	public class ActionMadhurai implements Controller {
     private static final String NEWPAGE = "initEduOrg";
     public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
            try{
           
            /*
             * Educational session bean
             */
            	 HLCEducationalSessionBean educationBean=new HLCEducationalSessionBean();
            /*
             * Payment Session bean
             */
            	 HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
            
            
            	 HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();

            
            HttpSession session = request.getSession(true);
            SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
            String activityProcess = request.getParameter("activityProcess");
             String reqIp = request.getRemoteAddr();
            Debug.print(" Request IP :" + reqIp);
            FormMadhurai eduForm =new FormMadhurai();
            HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
            HLCActivityOrganizerVO objActDet = new HLCActivityOrganizerVO();
            Vector publication = new Vector();
          
            if(activityProcess.equals(NEWPAGE)){
                    ArrayList list =(ArrayList)educationBean.getActivityTypeDetails();
                    session.setAttribute("DisplayActivityTypeDetails", list);
                    ArrayList area =(ArrayList)educationBean.getAreaMaster();
                    session.setAttribute("DispAreaDetails",area);
                    String memberId = (String)session.getAttribute("memberId");              
                    Debug.print("ActionMadhurai memberId:" + memberId);
                    ArrayList organiserDet = null;
                    if(memberId!=null){
                        organiserDet = (ArrayList)humanMemb.getMemberContactDetails(memberId);
                    }
                    session.setAttribute("DisplaymemberDetails",organiserDet);
                    System.out.println("list" + list);
                    session.setAttribute("memberId",memberId);
                    return new ModelAndView("frmMeeEduActivity");
            }
/*
 * insert event organiser details...
 */       
            if(activityProcess.equals("insertEduDet")){
                Debug.print("insert method is called............1");

                //readablity from form bean..........................................................

                String activityName = eduForm.getActivityName();
                Date activityDate = (Date) formatter.parse(eduForm.getActivityDate());
                String noOfDays = eduForm.getNoOfDays();
                String location = eduForm.getLocation();
                String state = eduForm.getState();
                String country = request.getParameter("txtLocation");
                String actCity = request.getParameter("actCity");
                String actZipcode = request.getParameter("actZipcode");
                String activityOrganiserId = eduForm.getUseaNo();
                String activityTypeId = eduForm.getSelActivityId();
                String otherActivityType = eduForm.getOtherActivityType();
                String activityFees = eduForm.getActivityFees();
                String instructorsCoaches = eduForm.getInstructorsCoaches();
                String useaAreaId = eduForm.getIadAreaId();
                Debug.print("insert method is called............3++++Area ID"+useaAreaId);
                String facility1 = "";
                String facility2 = "";
                String facility3 = "";
                String facility4 = "";
                String facilities = "";

                /* String chkFac1 = request.getParameter("chkFac1");
                String chkFac2 = request.getParameter("chkFac2");
                String chkFac3 = request.getParameter("chkFac3");
                String chkFac4 = request.getParameter("chkFac4");
                Debug.print("chkFac4" + chkFac4);  
                Debug.print("chkFac4" + chkFac4);  
                Debug.print("chkFac4" + chkFac4);  
                Debug.print("chkFac4" + chkFac4);  */


                String otherFacilities = "";
                Debug.print("insert method is called............4");
                facility1 = eduForm.getChkFac1();
                facility2 = eduForm.getChkFac2();
                facility3 = eduForm.getChkFac3();
                facility4 = eduForm.getChkFac4();
                if (facility1 == null) {
                    facility1 = "";
                }
                if (facility2 == null) {
                    facility2 = "";
                }
                if (facility3 == null) {
                    facility3 = "";
                }
                if (facility4 == null) {
                    facility4 = "";
                }

                if (facility4.equals("Other")) {
                    facilities = facility1 + "," + facility2 + "," + facility3 + "," + facility4;
                    otherFacilities = eduForm.getOtherFacilities();
                } else {
                    facilities = facility1 + "," + facility2 + "," + facility3 + "," + facility4;
                }


                boolean additionalSites = false;
                String landOwnerName = eduForm.getLandOwnerName();
                String landOwnerBusinessName = eduForm.getLandOwnerBusinessName();
                String landOwnerAddress = eduForm.getLandOwnerAddress();
                String landOwnerCity = eduForm.getLandOwnerCity();
                String landOwnerState = eduForm.getLandOwnerState();
                String landOwnerCountry = eduForm.getLandOwnerCountry();
                String landOwnerZip = eduForm.getLandOwnerZip();
                String landOwnerPhone = eduForm.getLandOwnerPhone();
                String landOwnerFax=eduForm.getLandOwnerFax();
                String landOwnerEmail=eduForm.getLandOwnerEmail();
                String comments = eduForm.getComments();
                // boolean additionalSites = eduForm.isAdditionalSites();
                String addSites = eduForm.getAdditionalSites();
                Debug.print("addSites" + addSites);
                Debug.print("insert method is called............5");


                if (addSites == null) {
                    additionalSites = false;
                    if (comments == null) {
                        comments = "";
                    }
                } else if (addSites != null || addSites.equals("yes")) {
                    additionalSites = true;

                }
                Debug.print("insert method is called............6");
                Debug.print("additionalSites" + additionalSites);
                Debug.print("comments" + comments);
                Debug.print("insert method is called............7");
                /*
                 * printing outputs in console...............................................................................
                 */
                Debug.print("==================Activity=================");
                Debug.print("activityName" + activityName);
                Debug.print("activityDate" + activityDate);
                Debug.print("noOfDays" + noOfDays);
                Debug.print("location" + location);
                Debug.print("state" + state);
                Debug.print("actCity" + actCity);
                Debug.print("actZipcode" + actZipcode);

                Debug.print("otherActivityType" + otherActivityType);
                Debug.print("activityFees" + activityFees);
                Debug.print("instructorsCoaches" + instructorsCoaches);
                Debug.print("facility1" + facility1);
                Debug.print("facility2" + facility2);
                Debug.print("facility3" + facility3);
                Debug.print("facility4" + facility4);
                Debug.print("getSelActivityId()" + eduForm.getSelActivityId());
                Debug.print("otherFacilities" + otherFacilities);
                Debug.print("landOwnerName" + landOwnerName);
                Debug.print("landOwnerBusinessName" + landOwnerBusinessName);
                Debug.print("landOwnerAddress" + landOwnerAddress);
                Debug.print("landOwnerCity" + landOwnerCity);
                Debug.print("landOwnerState" + landOwnerState);
                Debug.print("landOwnerCountry" + landOwnerCountry);
                Debug.print("landOwnerZip" + landOwnerZip);
                Debug.print("landOwnerPhone" + landOwnerPhone);
                Debug.print("landOwnerFax" + landOwnerFax);
                Debug.print("landOwnerEmail" + landOwnerEmail);
                Debug.print("additionalSites" + additionalSites);
                Debug.print("facilities" + facilities);
                Debug.print("================Publication==================");

                Debug.print("==============================================");
                /*
                 *for file upload......................................................................................
                 */
                // publication details are stored in vector............................................. 
                String pubStatus = request.getParameter("pmlRad");
                if (pubStatus.equalsIgnoreCase("yes")) {
                    Debug.print("Publication Status:" + pubStatus);
                    String publicationEmail = eduForm.getEmailLogo();
                    String mailingFormat = eduForm.getRadioCompMail();
                    String mailingBy = eduForm.getRadioSendMail();
                    String mailStatus = null;
                    if (mailingBy.equalsIgnoreCase("States")) {
                        mailStatus = eduForm.getAreaState();
                    } else {
                        mailStatus = eduForm.getAreaStatus();
                    }

                    String mailingSortBy = eduForm.getRadioSortMail();

                    String noOfCopies = eduForm.getNoOfCopies();
                    if (noOfCopies.trim().length() == 0 || noOfCopies.equals("")) {
                        noOfCopies = null;
                    }

                    publication.addElement(publicationEmail);
                    publication.addElement(mailingFormat);
                    publication.addElement(mailingBy);
                    publication.addElement(mailingSortBy);
                    publication.addElement(noOfCopies);
                    publication.addElement(mailStatus);
                    Debug.print("publicationEmail" + publicationEmail);
                    Debug.print("mailingFormat" + mailingFormat);
                    Debug.print("mailingBy" + mailingBy);
                    Debug.print("mailingSortBy" + mailingSortBy);
                    Debug.print("mailStatus" + mailStatus);
                    Debug.print("noOfCopies" + noOfCopies);
                } else {
                    Debug.print("Publication Status:" + pubStatus);
                    publication.addElement(null);
                    publication.addElement(null);
                    publication.addElement(null);
                    publication.addElement(null);
                    publication.addElement(null);
                    publication.addElement(null);
                }

                // organiser details are stored in object.............................................                      


                objActDet.setActivityName(activityName);
                objActDet.setActivityDate(activityDate);
                objActDet.setNoOfDays(noOfDays);
                objActDet.setUseaAreaId(useaAreaId);
                objActDet.setLocation(location);
                objActDet.setState(state);
                objActDet.setCity(actCity);
                objActDet.setCountry(country);
                objActDet.setZip(actZipcode);
                Debug.print("activityOrganizerId" + activityOrganiserId);
                objActDet.setActivityOrganizerId(activityOrganiserId);
                objActDet.setActivityTypeId(activityTypeId);
                objActDet.setOtherActivityType(otherActivityType);
                objActDet.setActivityFees(activityFees);
                objActDet.setInstructorsCoaches(instructorsCoaches);
                objActDet.setFacilities(facilities);
                objActDet.setOtherFacilities(otherFacilities);
                objActDet.setLandOwnerName(landOwnerName);
                objActDet.setLandOwnerBusinessName(landOwnerBusinessName);
                objActDet.setLandOwnerAddress(landOwnerAddress);
                objActDet.setLandOwnerCity(landOwnerCity);
                objActDet.setLandOwnerState(landOwnerState);
                objActDet.setLandOwnerCountry(landOwnerCountry);
                objActDet.setLandOwnerZip(landOwnerZip);
                objActDet.setAddDate(new Date());
                objActDet.setLandOwnerPhone(landOwnerPhone);
                objActDet.setLandOwnerFax(landOwnerFax);
                objActDet.setLandOwnerEmail(landOwnerEmail);
                objActDet.setAdditionalSites(additionalSites);
                objActDet.setAdditionalSitesPath(comments);
                objActDet.setRequestStatus("Pending");
                /*
                 * payment detials..........
                 */
                String userId = (String) session.getAttribute("userId");
                String emailId = (String) session.getAttribute("emailId");
                Debug.print("userId" + userId);
                int CcExpMonth = 0;
                int CcExpYear = 0;
                int CcCvvid = 0;
                double amount = 0;
                String CcNumber = null;
                String checkNumber = null;
                Date check_date = null;
                Date comp_date = null;
                String ccType = null;
                String ccName = null;
                String bankname = null;
                String nameoncheck = null;
                String r11 = eduForm.getR11();
                float chkAmt = 0;
                float checkAmount = 0;

                System.out.print("Check Status :" + r11);

                if (r11.equals("card")) {
                    if (eduForm.getCcNumber() == null || eduForm.getCcNumber().equals("")) {
                        CcNumber = "0";
                    } else {
                        CcNumber = eduForm.getCcNumber();
                    }
                    if (eduForm.getCcName() == null || eduForm.getCcName().equals("")) {
                        ccName = "";
                    } else {
                        ccName = eduForm.getCcName();
                    }
                    if (!(eduForm.getCcType().equals("")) && eduForm.getCcType() != null) {
                        ccType = eduForm.getCcType();
                    }
                    if (eduForm.getCcExpMonth() == null || eduForm.getCcExpMonth().equals("")) {
                        CcExpMonth = 0;
                    } else {
                        CcExpMonth = Integer.parseInt(eduForm.getCcExpMonth());
                    }
                    if (eduForm.getCcExpYear() == null || eduForm.getCcExpYear().equals("")) {
                        CcExpYear = 0;
                    } else {
                        CcExpYear = Integer.parseInt(eduForm.getCcExpYear());
                    }
                    if (eduForm.getCcCvvid() == null || eduForm.getCcCvvid().equals("")) {
                        CcCvvid = 0;
                    } else {
                        CcCvvid = Integer.parseInt(eduForm.getCcCvvid());
                    }
                    check_date = null;
                    objPayDet.setPaymentStatus("card");

                    objPayDet.setUserId(userId);
                    objPayDet.setCcName(ccName);
                    objPayDet.setCcType(ccType);
                    objPayDet.setCcNumber(CcNumber);
                    objPayDet.setCcExpMonth(CcExpMonth);
                    objPayDet.setCcExpYear(CcExpYear);
                    objPayDet.setCcCvvid(CcCvvid);
                    objPayDet.setBankName(null);
                    objPayDet.setCheckDate(null);
                    objPayDet.setCheckNumber("0");
                    objPayDet.setCheckName(null);
                    objPayDet.setCheckAmount(0);
                    objPayDet.setPaymentDate(new Date());
                    objPayDet.setIpAddress(reqIp);


                }
                if (eduForm.getAmount() == null || eduForm.getAmount() == "") {
                    amount = 0;
                } else {
                    amount = Double.parseDouble(eduForm.getAmount());
                }
                Debug.print("eduForm.getCheckAmount: " + eduForm.getCheckAmount());

                if (eduForm.getCheckAmount() == null || eduForm.getAmount() == "") {
                    checkAmount = 0;
                    Debug.print("Activity Organizer checkAmount in if loop: " + checkAmount);
                } else {
                    checkAmount = Float.parseFloat(eduForm.getCheckAmount());
                    Debug.print("Activity Organizer checkAmount in else loop: " + checkAmount);
                }
                chkAmt = Float.parseFloat(eduForm.getAmount());

                float pendingAmount = chkAmt - checkAmount;
                Debug.print(" pendingAmount after calculation in servlet :" + pendingAmount);

                if (r11.equals("check")) {
                    if (eduForm.getCheckNumber() == null || eduForm.getCheckNumber().equals("")) {
                        checkNumber = "0";
                    } else {
                        checkNumber = eduForm.getCheckNumber();
                    }
                    if (eduForm.getCheckDate().equals("")) {
                        check_date = null;
                    } else {
                        check_date = (Date) formatter.parse(eduForm.getCheckDate());
                    }

                    objPayDet.setPaymentStatus("Check");

                    objPayDet.setUserId(userId);
                    objPayDet.setCcName(null);
                    objPayDet.setCcType(null);
                    objPayDet.setCcNumber("0");
                    objPayDet.setCcExpMonth(0);
                    objPayDet.setCcExpYear(0);
                    objPayDet.setCcCvvid(0);
                    objPayDet.setBankName(eduForm.getBankName());
                    objPayDet.setCheckName(eduForm.getNameCheck());
                    objPayDet.setCheckDate(check_date);
                    objPayDet.setCheckNumber(checkNumber);
                    objPayDet.setCheckAmount(chkAmt);
                    objPayDet.setPaymentDate(new Date());

                }

                objPayDet.setAmount(amount);

                //objPayDet.setActiveStaus(true);

                Debug.print("checkNumber:" + checkNumber);
                Debug.print("check_date:" + check_date);
                Debug.print("amount:" + amount);


                if (r11.equals("card")) {
                    Debug.print("Sucessfully Redirect to NoVa:");
                    session.setAttribute("objActivityOrganizer", objActDet);
                    session.setAttribute("objPublicationList", publication);
                    session.setAttribute("objPaymentList", objPayDet);
                    //ActivityOrganizerVO
                    //Debug.print("Sucessfully Payment objPaymentList:" + objPayDet.toString());
                    //=======================================
                    request.setAttribute("email", emailId);
                    session.setAttribute("amount", String.valueOf(amount));
                    request.setAttribute("cardNo", String.valueOf(CcNumber));
                    String expMon = String.valueOf(CcExpMonth);
                    String expYear = String.valueOf(CcExpYear);
                    if (expMon.trim().length() == 1) {
                        expMon = "0" + expMon;
                    }
                    // if(expYear.trim().length()==1) {
                    //Debug.print("expYear:" + expYear);
                    //expYear = expYear.substring(2);
                    //
                   //Debug.print("expMon:" + expMon);
                    //Debug.print("expYear:" + expYear);

                    String expDate = expMon + expYear;
                    request.setAttribute("expDate", expDate);
                    request.setAttribute("expDate", expDate);
                    request.setAttribute("amount", String.valueOf(amount));
                    request.setAttribute("chkDigit", String.valueOf(CcCvvid));

                    StringBuffer reqURL = request.getRequestURL();
                    int lastIndex = reqURL.lastIndexOf("/");
                    String url = "";

                    if (lastIndex != -1) {
                        url = reqURL.substring(0, lastIndex + 1);
                    }

                    String tmpNova = "eduActivityPayment.html";
                    String nova = url + tmpNova;
                    Debug.print("succsssullll from app file nova........::" + nova);
                    Debug.print("succsssullll from app file tmpNova ........::" + tmpNova);
                    /*request.setAttribute("nova", nova);
                    return mapping.findForward("novaPage");*/
                    int intVId = 1;
//                if (inVoiceId1.equalsIgnoreCase("0")) {
//                    intVId = 1;
//                } else {
//                    intVId = 1;
 //               }
                request.setAttribute("AMT", request.getParameter("amount"));
                request.setAttribute("PAYMENTACTION", "Authorization");
                request.setAttribute("CREDITCARDTYPE", request.getParameter("ccType"));
                request.setAttribute("ACCT", request.getParameter("ccNumber"));
                request.setAttribute("EXPDATE", expDate);
                request.setAttribute("IPADDRESS", reqIp);
                request.setAttribute("FIRSTNAME", request.getParameter("ccName"));
                request.setAttribute("CVVNo", request.getParameter("ccCvvid"));
                request.setAttribute("STREET", "1 Main St");
                request.setAttribute("CITY", "San Jose");
                request.setAttribute("STATE", "CA");
                request.setAttribute("ZIP", "95131");
                request.setAttribute("COUNTRYCODE", "US");
                request.setAttribute("EMAIL", emailId);
                //session.setAttribute("objPaymentVO", objPayment);

                request.setAttribute("purpose", "educationregistration");
                //intVId++; 
                request.setAttribute("intVId", String.valueOf(intVId));
                System.out.println("intVId in servlet InsertHorseRegAction &&&&&&&" + intVId);

                return new ModelAndView("testpaypal");

                } else {
                    String paymentId = educationBean.getNextId();
                    Debug.print("  ActionMadhurai.paymentId:" + paymentId);
                    objActDet.setPaymentId(paymentId);
                    objPayDet.setPaymentId(paymentId);

                    boolean dimFlag = educationBean.createActivityOrganizer(objActDet, publication);
                    Debug.print("Activity Organizer INserted Sucessfully:" + dimFlag);


                    boolean result = paymentBean.createPayment(objPayDet);
                  
                    if (session.getAttribute("loggedBy") != null) {
                        String loggedBy = "";
                        loggedBy = (String) session.getAttribute("loggedBy");
                        Debug.print("ActionMadhurai.loggedBy: " + loggedBy);
                        if (pendingAmount > 0) {
                            boolean pendStat = educationBean.updatePendingAmount(userId, paymentId, pendingAmount);
                            Debug.print("ActionMadhurai.pendStat: " + pendStat);
                        }
                    }
                    Debug.print("Result  Payment Bean" + result);
                    Debug.print("succsssullll Created.........::");
                    if (result == true && dimFlag == true) {

                        String toMailIds[] = {emailId};

                        EmailContent email = new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@usea.com");
                        email.setSubject("Educational Activities Registration confirmation.");

                        String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                                " <tr>" +
                                " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                                " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                                "<tr>" +
                                "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"USEA Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
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
                                "You have successfully registered with United States Eventing Association for all " +
                                "the Educational Activities that are to be held! Your application would be verified and processed within" +
                                "24 hours." +
                                "Thank you for using this service.<p>" +
                                "Thank You <br />" +
                                "------------------ <br />" +
                                "<span class=\"boldRedTxt\">USEA Team</span></td>" +
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
                                "<p>The easiest way to access your day to day USEA activities online or offline where ever you are and when ever you want." +
                                "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:" +
                                "<ul>" +
                                "<li>Unlimited shopping online.</li>" +
                                "<li>Place advertisements online and/or on-site.</li>" +
                                "<li>Sponsor competitions held by USEA.</li>" +
                                "</ul>" +
                                "Also, REGISTER NOW! and become a member of USEA to access and 	enjoy the following privileges as per your Membership Type and as " +
                                "per your �Role� assigned:" +
                                "<ul>" +
                                "<li>Compete in Equestrian Events held by USEA.</li>" +
                                "<li>Take part in other events like; Annual Meetings, Educational events," +
                                "Activity Meetings held by USEA etc.</li>" +
                                "<li>Send Messages to other members.</li>" +
                                "<li>Create your own Distribution Lists.</li>" +
                                "<li>Create/Join a group and share your thoughts and common ideas.</li>" +
                                " <li>Unlimited Shopping online.</li>" +
                                " <li>Place advertisements online and/or on-site.</li>" +
                                " <li>Sponsor competitions held by USEA.</li>" +
                                "</ul>" +
                                "and much more..." +
                                "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>" +
                                "</tr>" +
                                " <tr>" +
                                "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>" +
                                "</tr>" +
                                "</table>";
                        email.setBody(content);
                        EmailEngine emailEngine = new EmailEngine();
                        boolean emailFlag = emailEngine.sendMimeEmail(email);
                        Debug.print("Email sent sucessfully :" + emailFlag);
                    }
                    request.setAttribute("amount", String.valueOf(amount));
                    return new ModelAndView("frmMeeEduActSuccess");

                }
}
                
 
/*-----------------------------------------------------------Edit Organiser Details-----------------------------------------
 *
 */
       
                else if(activityProcess.equalsIgnoreCase("updateDet")){
                    Debug.print("updateDet() is calling"  );
                    String activityMeetingId = request.getParameter("actMeetId");
                    String editActivityName = eduForm.getActivityName();
                    Date editActivityDate = (Date)formatter.parse(eduForm.getActivityDate());
                    String editNoOfDays = eduForm.getNoOfDays();
                    String editUseaArea = eduForm.getIadAreaId();
                    String editLocation = eduForm.getLocation();
                    String editState = eduForm.getState();
                    String editActivityOrgId = eduForm.getUseaNo();
                    String editActivityTypeId = eduForm.getSelActivityId();
                    String editOtherActivityType = eduForm.getOtherActivityType();
                    String editActivityFees = eduForm.getActivityFees();
                    String editInstructorsCoaches = eduForm.getInstructorsCoaches();
                                       
                    String editLandOwnerName = eduForm.getLandOwnerName();
                    String editLandOwnerBusinessName = eduForm.getLandOwnerBusinessName();
                    String editLandOwnerAddress = eduForm.getLandOwnerAddress();
                    String editLandOwnerCity = eduForm.getLandOwnerCity();
                    String editLandOwnerState = eduForm.getLandOwnerState();
                    String editLandOwnerCountry = eduForm.getLandOwnerCountry();
                    String editLandOwnerPhone = eduForm.getLandOwnerPhone();
                    String editLandOwnerZip = eduForm.getLandOwnerZip();
                    String editComments = eduForm.getComments();
                    Debug.print("edit method is called............3");   
                    String  editfacility1 = "";
                    String  editfacility2 = "";
                    String  editfacility3= "";
                    String  editfacility4 = "";
                    String editfacilities ="";
                    String  editotherFacilities ="";
                    Debug.print("edit method is called............4");   
                    editfacility1 = eduForm.getChkFac1();
                    editfacility2 = eduForm.getChkFac2();
                    editfacility3= eduForm.getChkFac3();
                    editfacility4 = eduForm.getChkFac4();
                    if(editfacility1==null)
                    editfacility1="";

                    if(editfacility2==null)
                    editfacility2="";

                    if(editfacility3==null)
                    editfacility3="";

                    if(editfacility4==null)
                    editfacility4="";
            
                    if(editfacility4.equals("Other")){
                           editfacilities = editfacility1 +","+ editfacility2 +"," +editfacility3+","+editfacility4;
                           editotherFacilities = eduForm.getOtherFacilities();
                    }
                   // boolean editadditionalSites = eduForm.isAdditionalSites();
                    String editSites = eduForm.getAdditionalSites();
                    boolean editadditionalSites = false;
                     if(editSites==null){
                        editadditionalSites = false; 
                        if(editComments==null){
                            editComments="";
                        }
                      }  
                    else if (editSites!=null || editSites.equals("yes")){
                            editadditionalSites = true;
                    }
                    String editpublicationEmail = eduForm.getEmailLogo();
                    String editmailingFormat = eduForm.getRadioCompMail();
                    String editmailingBy = eduForm.getRadioSendMail();
                    String editmailingSortBy = eduForm.getRadioSortMail();
                    String editnoOfCopies = eduForm.getNoOfCopies();
                    String editMailingBy =eduForm.getRadioSendMail();
                    String mailStatus = null;
                    if(editMailingBy.equalsIgnoreCase("States")){
                          mailStatus = eduForm.getAreaState();
                    }
                    else{
                         mailStatus = eduForm.getAreaStatus();
                    }
                    Debug.print("====================Activity Details====================");
                    Debug.print("activityMeetingId" + activityMeetingId);
                    Debug.print("editActivityName" + editActivityName);
                    Debug.print("editActivityOrgId" + editActivityOrgId);
                    Debug.print("editActivityDate" + editActivityDate);
                    Debug.print("editNoOfDays" + editNoOfDays);
                    Debug.print("editLocation" + editLocation);
                    Debug.print("editState" + editState);
                    Debug.print("editOtherActivityType" + editOtherActivityType);
                    Debug.print("editActivityFees" + editActivityFees);
                    Debug.print("editInstructorsCoaches" + editInstructorsCoaches);
                    Debug.print("editActivityTypeId" +  editActivityTypeId);
                    Debug.print("editfacility1" + editfacility1);
                    Debug.print("editfacility2" + editfacility2);
                    Debug.print("editfacility3" + editfacility3);
                    Debug.print("editfacility4" + editfacility4);

                    Debug.print("otherFacilities" + editotherFacilities);
                    Debug.print("editLandOwnerName" + editLandOwnerName);
                    Debug.print("editLandOwnerBusinessName" + editLandOwnerBusinessName);
                    Debug.print("editLandOwnerAddress" + editLandOwnerAddress);
                    Debug.print("editLandOwnerCity" + editLandOwnerCity);
                    Debug.print("editLandOwnerState" + editLandOwnerState);
                    Debug.print("editLandOwnerCountry" + editLandOwnerCountry);
                    Debug.print("editLandOwnerZip" + editLandOwnerZip);
                    Debug.print("editLandOwnerPhone" + editLandOwnerPhone);
                    Debug.print("editAdditionalSites" + editadditionalSites);
                    Debug.print("comments" + editComments);
                    Debug.print("====================Publication====================");
                    Debug.print("editpublicationEmail" + editpublicationEmail);
                    Debug.print("editmailingFormat" + editmailingFormat);
                    Debug.print("editmailingBy" + editmailingBy);
                    Debug.print("editmailingSortBy" + editmailingSortBy);
                    Debug.print("editnoOfCopies" + editnoOfCopies);
                    Debug.print("====================Publication====================");
 
 // publication details are stored in vector............................................. 
                    publication.addElement(editpublicationEmail);
                    publication.addElement(editmailingFormat);
                    publication.addElement(editmailingBy);
                    publication.addElement(editmailingSortBy);
                    publication.addElement(editnoOfCopies);
                    publication.addElement(mailStatus);
   // organiser details are stored in object.............................................  
                    objActDet.setActivityMeetingId(activityMeetingId);
                    objActDet.setActivityOrganizerId(editActivityOrgId);
                    objActDet.setActivityName(editActivityName);
                    objActDet.setActivityDate(editActivityDate);
                    objActDet.setNoOfDays(editNoOfDays);
                    objActDet.setUseaAreaId(editUseaArea);
                    //objActDet.setUseaAreaId(editUseaArea);
                    objActDet.setLocation(editLocation);
                    objActDet.setState(editState);
                    objActDet.setActivityOrganizerId(editActivityOrgId);
                    objActDet.setActivityTypeId(editActivityTypeId);
                    objActDet.setOtherActivityType(editOtherActivityType); 
                    objActDet.setActivityFees(editActivityFees);
                    objActDet.setInstructorsCoaches(editInstructorsCoaches);
                    objActDet.setFacilities(editfacilities);
                    objActDet.setOtherFacilities(editotherFacilities);
                    objActDet.setLandOwnerName(editLandOwnerName);
                    objActDet.setLandOwnerBusinessName(editLandOwnerBusinessName);
                    objActDet.setLandOwnerAddress(editLandOwnerAddress);    
                    objActDet.setLandOwnerCity(editLandOwnerCity);
                    objActDet.setLandOwnerState(editLandOwnerState);   
                    objActDet.setLandOwnerCountry(editLandOwnerCountry);
                    objActDet.setLandOwnerZip(editLandOwnerZip);
                    objActDet.setAddDate(new Date());
                    objActDet.setLandOwnerPhone(editLandOwnerPhone);
                    objActDet.setAdditionalSites(editadditionalSites);
                    objActDet.setAdditionalSitesPath(editComments);  
       
          }       
          boolean result = educationBean.editActivityOrganizer(objActDet, publication);
          Debug.print("Successfully Updated...................................");
          return new ModelAndView("frmMeeEduActEditCnf");
        } 
    
        catch(Exception e){
            System.out.print("Exception" + e);
            
        }
         return  null;
     }
}

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
package com.mrm.action;
/*
 * OrganizerUSEAEventRegistration.java
 *
 * Created on August 12, 2006, 4:58 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

/**
 *
 * @author karthikeyan
 */

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmro.display.*;
import com.hlcmro.org.*;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.*;
import org.apache.struts.util.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.Context;
import com.hlcmro.util.*;
import java.util.*;
import javax.rmi.PortableRemoteObject;
import java.util.*;
import javax.naming.*;
import com.hlccommon.util.Debug;
import com.hlccommon.util.*;
import com.hlcevent.edu.*;
import com.hlcmro.util.*;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import java.util.*;

/**
 *
 * @author karthikeyan
 * @version
 */
public class OrganizerUSEAEventRegAction implements Controller  {
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {  
        String fwd="";
        
        try {
            
          
            
            HttpSession session=request.getSession();
            String memberId=(String)session.getAttribute("memberId");
            String process=request.getParameter("process");
            System.out.println("process:"+process);
            
           
                    HLCVaigaiSessionBean remote4 =new HLCVaigaiSessionBean();  
                    
        
                    HLCVaigaiStatelessBean remote2 = new HLCVaigaiStatelessBean();
                    
        
            HLCKrishnaStatelessBean krishRemote = new HLCKrishnaStatelessBean();           
                              
            if(process!=null) {
                if(process.equalsIgnoreCase("reqreg")){
                   
                    HLCVaigaiSessionBean remote = new HLCVaigaiSessionBean();
                                                     
                    ArrayList stateDetails = new ArrayList();
                   // ArrayList issueDetails = new ArrayList();
                    Vector allTypesVect = new Vector();
                    
                    
                    stateDetails = remote.getAllStates();
                    allTypesVect = remote2.getAllMapTyLe();
                    Debug.print("Vector Returned:"+allTypesVect.toString());
                    
                   // issueDetails = remote.getAllIssues();
                   // Debug.print("ArrayList Returned:"+issueDetails.toString());
                    
                    Debug.print("ArrayList Returned:"+stateDetails.toString());
                    Vector eventTypeDetails = new Vector();
                    HashMap hm = new HashMap();
                    HashMap eventTypeMap = new HashMap();
                    ArrayList subLevel = new ArrayList();
                    
                    if(allTypesVect!=null ){
                        Enumeration e = allTypesVect.elements();
                        while(e.hasMoreElements()){
                            String[] typeDetails = (String[])e.nextElement();
                            String mapId = typeDetails[0];
                            String typeId = typeDetails[1];
                            String levelId = typeDetails[2];
                            String typeName = typeDetails[3];
                            String levelCode = typeDetails[4];
                            String levelName = typeDetails[5];
                            if(hm.containsKey(typeId)){
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }else{
                                subLevel = new ArrayList();
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }
                            hm.put(typeId,typeName);
                            
                        }
                        Set set = hm.keySet();
                        Iterator itr = set.iterator();
                        while(itr.hasNext()){
                            String keyId = (String)itr.next();
                            String valueName = (String)hm.get(keyId);
                            String[] eventTypeDet = {keyId,valueName};
                            eventTypeDetails.add(eventTypeDet);
                        }
                    }
                /*Set setMap = eventTypeMap.keySet();
                Iterator itrMap = setMap.iterator();
                while(itrMap.hasNext()){
                    String typeId = (String)itrMap.next();
                    ArrayList subLevelMap = (ArrayList)eventTypeMap.get(typeId);
                    Iterator itrSub = subLevelMap.iterator();
                    while(itrSub.hasNext()){
                        String[] subEntry = (String[])itrSub.next();
                        String mapId = subEntry[0];
                        String levelId = subEntry[1];
                        String levelCode = subEntry[2];
                        String levelName = subEntry[3];
                    }
                }*/
                    //request.setAttribute("hm",hm);
                    
                   // request.setAttribute("issueDetails",issueDetails);
                    
                    request.setAttribute("stateDetails",stateDetails);
                    request.setAttribute("eventTypeDetails",eventTypeDetails);
                    request.setAttribute("eventTypeMap",eventTypeMap);
                    fwd="toRequestReg";
                }
                if(process.equalsIgnoreCase("reqInsert")){
                   
                    HLCVaigaiSessionBean remote = new HLCVaigaiSessionBean();
                    
                
                    HLCkaverystatelessBean remote3 = new HLCkaverystatelessBean();
                    
                    HLCEventRequestVO eventReqVO = new HLCEventRequestVO();
                    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                     String userId1 = (String) session.getAttribute("userId");
                    Debug.print("userId1 in reqInsert" +userId1);
                    String eventTitle = request.getParameter("eventTitle");
                    Debug.print("Event Title:"+eventTitle);
                    if(eventTitle!=null && eventTitle.trim().length()!=0){
                        eventReqVO.setEvent_title(eventTitle);
                    }
                    
                    eventReqVO.setCompetition_country("USA");
                    
                    String state = request.getParameter("selState");
                    Debug.print("State Id:"+state);
                    if(state!=null && state.trim().length()!=0){
                        eventReqVO.setCompetition_state(state);
                    }else{
                        eventReqVO.setCompetition_state(null);
                    }
                    
                    String zipCode = request.getParameter("zipCode");
                    Debug.print("Zip Code:"+zipCode);
                    if(zipCode!=null && zipCode.trim().length()!=0){
                        eventReqVO.setCompetition_zip(zipCode);
                    }else{
                        eventReqVO.setCompetition_zip(null);
                    }
                    
                    String beginDate = request.getParameter("beginDate");
                    Date startDate=null;
                    
                    if(beginDate!=null && beginDate.trim().length()!=0){
                        startDate=(Date)sdf.parse(beginDate);
                        Debug.print("startDate in servlet"+startDate);
                    }
                    String endDate = request.getParameter("endDate");
                    Debug.print("End Date :"+endDate);
                    Date evendDate=null;
                    if(endDate!=null && endDate.trim().length()!=0){
                        evendDate=(Date)sdf.parse(endDate);
                    }                    
                    if(startDate!=null ){
                        eventReqVO.setEveBegDate(startDate);
                    }else{
                        eventReqVO.setEveBegDate(null);
                    }
                    if(evendDate!=null ){
                        eventReqVO.setEveEndDate(evendDate);
                    }else{
                        eventReqVO.setEveEndDate(null);
                    }                   
                    String organizerId = request.getParameter("orgnaizerId");
                    Debug.print("Orgnaizer Id:"+organizerId);
                    if(organizerId!=null && organizerId.trim().length()!=0){
                        eventReqVO.setOrganizer_id(organizerId);
                    }else{
                        eventReqVO.setOrganizer_id(null);
                    }                    
                    String location = request.getParameter("txtLocation");
                    Debug.print("Location :"+location);
                    if(location!=null && location.trim().length()!=0){
                        eventReqVO.setCompetition_location(location);
                    }else{
                        eventReqVO.setCompetition_location(null);
                    }                    
                    String city = request.getParameter("txtCity");
                    Debug.print("City :"+city);
                    if(city!= null && city.trim().length()!=0){
                        eventReqVO.setCompetition_city(city);
                    }else{
                        eventReqVO.setCompetition_city(null);
                    }                   
                    String issId = request.getParameter("selIssue");
                    Debug.print("issId :"+issId);
                    if(issId!= null && issId.trim().length()!=0){
                        eventReqVO.setIssueId(issId);
                    }else{
                        eventReqVO.setIssueId(null);
                    }               
                    String area = request.getParameter("areaId");
                    Debug.print("Area :"+area);
                    if(area!=null && area.trim().length()!=0){
                        eventReqVO.setChampionship_area(area);
                    }else{
                        eventReqVO.setChampionship_area(null);
                    }
                    eventReqVO.setStatus_id("Pending");
                    String levelCount = request.getParameter("levelCount");
                    int count = 0;
                    if(levelCount != null && levelCount.trim().length()!=0){
                        count = Integer.parseInt(levelCount);
                    }
                    
                    
                  /*  ArrayList mappingTypeIds = new ArrayList();
                    for(int i = 1 ; i <=count ;i++){
                        String eventLevelMapId = request.getParameter("eventLevels"+i);
                        if(eventLevelMapId != null && eventLevelMapId.trim().length()!=0 ){
                            Debug.print("Selected Event Sub Level Id:"+eventLevelMapId);
                            mappingTypeIds.add(eventLevelMapId);
                        }
                    }
                    if(mappingTypeIds!=null && mappingTypeIds.size()!=0){
                        eventReqVO.setMaping_type_id(mappingTypeIds);
                    }else{
                        eventReqVO.setMaping_type_id(null);
                    }*/
                    
                    
                    //String[] eventLevels = request.getParameterValues("eventLevels");
                    String eventId = remote.insertEventRequest(eventReqVO,userId1);
                    
                   /* if(eventId!=null && eventId.trim().length()!=0){
                     Debug.print("eventId in insertEventHistoryDets condition:"+eventId);
                        HLCEventRequestVO eventVO = new HLCEventRequestVO();
                        eventVO = remote.getEventRequestDetails(eventId);                       
                        String eveId=eventVO.getEvent_id();
                        String eveTitle=eventVO.getEvent_title();
                        String orgId=eventVO.getOrganizer_id();
                        Date begDate=eventVO.getEveBegDate();
                        Debug.print("begDate in insertEventHistoryDets condition:"+begDate);
                        String tempDt =(begDate.toString());
                        Debug.print("tempDt in insertEventHistoryDets condition:"+tempDt);
                        String tempYr = tempDt.substring(0,4);
                        Debug.print("tempYr in Servlet"+tempYr);
                        int compYr = Integer.parseInt(tempYr); 
                        Debug.print("compYr in Servlet"+compYr);
                        String appStatus=eventVO.getStatus_id();
                        Debug.print("appStatus in Servlet"+appStatus);                       
                        String paymentId=eventVO.getPayId();                        
                   boolean hisOutput = remote.insertEventHistoryDets(eventVO,compYr,appStatus);                                
                    }*/
                    
                    // To email the Event Registration details to Organizer
                    String organizerEmailId ="";
                    if(organizerId!=null && organizerId.trim().length()!=0){
                        String userId = remote3.getUserIdBasedOnMemberId(organizerId);
                        Debug.print("userId in reqInsert" +userId);
                        organizerEmailId = remote3.getEmailBasedOnUserId(userId);
                    }
                                       
                    // To email the Event Registration details to Area Chair
                    String areaChairEmailId = "";
                    if(area!=null && area.trim().length()!=0){
                        String areaChairMemberId = remote.getAreaChairMemberId(area);
                        String areaChairUserId = remote3.getUserIdBasedOnMemberId(areaChairMemberId);
                        areaChairEmailId = remote3.getEmailBasedOnUserId(areaChairUserId);
                    }
                    
                    //Start of Email
                    String toMailIds[] = {organizerEmailId,areaChairEmailId};
                    EmailContent email=new EmailContent();
                    email.setTo(toMailIds);
                    email.setFrom("dashboard@useventing.com");
                    email.setSubject("Event Registration Info !");
                    
                    String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                            " <tr>" +
                            " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                            " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                            "<tr>" +
                            "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"USEA Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
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
                            "<span class=\"boldTxt\">Dear User,</span>,<br /><br />"+
                            "<p>The Event is Registered in Dashboard,It is under process. The Event Registration information is as follows:.<p>"+"<p>----------------------------<p>"+"<p> Event Id :"+eventReqVO.getEvent_id()+"<p> Evnt Title :"+eventReqVO.getEvent_title()+"<p> Organizer: "+eventReqVO.getOrganizer_id()+"<p> ----------------------------<p>"+
                            "<p>Event Begin Date:"+eventReqVO.getEveBegDate()+"<p> Event End Date: "+eventReqVO.getEveEndDate()+"<p>"+"<p> ZipCode :"+eventReqVO.getCompetition_zip()+"<p> Event Competition Location:"+eventReqVO.getCompetition_location()+"<p> Event Competition City:"+eventReqVO.getCompetition_city()+
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                            "<p>Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
                            "Thank You <br />"+
                            "------------------ <br />"+
                            "<span class=\"boldRedTxt\">USEA Team</span></td>"+
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
                            "<p>The easiest way to access your day to day USEA activities online or offline where ever you are and when ever you want."+
                            "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                            "<ul>"+
                            "<li>Unlimited shopping online.</li>"+
                            "<li>Place advertisements online and/or on-site.</li>"+
                            "<li>Sponsor competitions held by USEA.</li>"+
                            "</ul>"+
                            
                            
                            "Also, REGISTER NOW! and become a member of USEA to access and 	enjoy the following privileges as per your Membership Type and as "+
                            "per your �Role� assigned:"+
                            
                            "<ul>"+
                            "<li>Compete in Equestrian Events held by USEA.</li>"+
                            "<li>Take part in other events like; Annual Meetings, Educational events,"+
                            "Activity Meetings held by USEA etc.</li>"+
                            "<li>Send Messages to other members.</li>"+
                            "<li>Create your own Distribution Lists.</li>"+
                            "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                            " <li>Unlimited Shopping online.</li>"+
                            " <li>Place advertisements online and/or on-site.</li>"+
                            " <li>Sponsor competitions held by USEA.</li>"+
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
                    // End of Email
                    Debug.print("Returned Event Id ::>"+eventId);
                    // IF a Event Id is returned then redirected to Confirmation page else to the Request Event Registration page
                    if(eventId!=null && eventId.trim().length()!=0){
                        Debug.print("Event Id :"+eventId);
                        request.setAttribute("eventId",eventId);
                        request.setAttribute("organizerId",organizerId);
                        fwd = "toRequestConfirmation";
                    }else{
                        ArrayList stateDetails = new ArrayList();
                        ArrayList issueDetails = new ArrayList();
                        Vector allTypesVect = new Vector();
                        
                        stateDetails = remote.getAllStates();
                        issueDetails = remote.getAllIssues();
                        allTypesVect = remote2.getAllMapTyLe();
                        Debug.print("Vector Returned:"+allTypesVect.toString());
                        Debug.print("ArrayList Returned:"+stateDetails.toString());
                        
                        Vector eventTypeDetails = new Vector();
                        HashMap hm = new HashMap();
                        HashMap eventTypeMap = new HashMap();
                        ArrayList subLevel = new ArrayList();
                        
                        if(allTypesVect!=null ){
                            Enumeration e = allTypesVect.elements();
                            while(e.hasMoreElements()){
                                String[] typeDetails = (String[])e.nextElement();
                                String mapId = typeDetails[0];
                                String typeId = typeDetails[1];
                                String levelId = typeDetails[2];
                                String typeName = typeDetails[3];
                                String levelCode = typeDetails[4];
                                String levelName = typeDetails[5];
                                if(hm.containsKey(typeId)){
                                    String[] subEntry = {mapId,levelId,levelCode,levelName};
                                    subLevel.add(subEntry);
                                    eventTypeMap.put(typeId,subLevel);
                                }else{
                                    subLevel = new ArrayList();
                                    String[] subEntry = {mapId,levelId,levelCode,levelName};
                                    subLevel.add(subEntry);
                                }
                                hm.put(typeId,typeName);
                                
                            }
                            Set set = hm.keySet();
                            Iterator itr = set.iterator();
                            while(itr.hasNext()){
                                String keyId = (String)itr.next();
                                String valueName = (String)hm.get(keyId);
                                String[] eventTypeDet = {keyId,valueName};
                                eventTypeDetails.add(eventTypeDet);
                            }
                        }
                /*Set setMap = eventTypeMap.keySet();
                Iterator itrMap = setMap.iterator();
                while(itrMap.hasNext()){
                    String typeId = (String)itrMap.next();
                    ArrayList subLevelMap = (ArrayList)eventTypeMap.get(typeId);
                    Iterator itrSub = subLevelMap.iterator();
                    while(itrSub.hasNext()){
                        String[] subEntry = (String[])itrSub.next();
                        String mapId = subEntry[0];
                        String levelId = subEntry[1];
                        String levelCode = subEntry[2];
                        String levelName = subEntry[3];
                    }
                }*/
                        // request.setAttribute("hm",hm);
                        request.setAttribute("stateDetails",stateDetails);
                        request.setAttribute("eventTypeDetails",eventTypeDetails);
                        request.setAttribute("eventTypeMap",eventTypeMap);
                        fwd="toRequestReg";
                    }
                    
                    
                }
                        /*
                         * Redirection to OrganizerUSEAEventReg Page
                         */
                
                if(process.equalsIgnoreCase("reg")) {
                    System.out.println("Inside Organizer Reg form Action..........");
                    
                   
                    HLCVaigaiSessionBean remote1 = new HLCVaigaiSessionBean();
                    
                    //Vector allTypesVect = new Vector();
                    Vector getAllMapRuleSubRule= new Vector();
                    
                    Vector distanceSpeedVect = new Vector();
                    Vector dressageHorseTrialsVect = new Vector();
                    ArrayList arenaSizeVect = new ArrayList();
                    ArrayList jdDet=new ArrayList();
                    
                    HLCVaigaiStatelessBean remote = new HLCVaigaiStatelessBean();
                    //allTypesVect = remote.getAllMapTyLe();
                    getAllMapRuleSubRule=remote.getAllMapRuleSubRule();
                    jdDet=remote.selectJudgesDetails();
                    System.out.println("jdDet size in servlet :"+jdDet.size());
                    
                    dressageHorseTrialsVect = remote.selectDressageHorseTrials();
                    arenaSizeVect = remote.getAreaPriceMaster();//selectArenaSize();
                    
                    //request.setAttribute("allTypesVect", allTypesVect);
                    request.setAttribute("distanceSpeedVect",distanceSpeedVect);
                    request.setAttribute("getAllMapRuleSubRule",getAllMapRuleSubRule);
                    request.setAttribute("dressageHorseTrialsVect",dressageHorseTrialsVect);
                    request.setAttribute("arenaSizeVect",arenaSizeVect);
                    request.setAttribute("jdDet",jdDet);
                    
                //for event title, event type and event level.
                String eventId="";
                eventId = (String)request.getAttribute("eventId");//"10026";
                Debug.print("eventId from getAttribute:"+eventId);
                String paramValue=request.getParameter("fromList");
                Debug.print("paramValue :"+paramValue);
                if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                eventId=request.getParameter("eventId");    
                }
                Debug.print("eventId from getParameter:"+eventId);
                String type = request.getParameter("type");
                HLCEventRequestVO eventReqVO = new HLCEventRequestVO();
                ArrayList areaDetails = new ArrayList();
                if(eventId!= null && eventId.trim().length()!=0){
                    eventReqVO = remote1.getEventRequestDetails(eventId);
                    areaDetails = remote1.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                }
                Debug.print("EventReqVO returned:"+eventReqVO.toString());
                ArrayList stateDetails = new ArrayList();
                Vector allTypesVect = new Vector();
                stateDetails = remote1.getAllStates();
                allTypesVect = remote.getAllMapTyLe();
                Vector eventTypeDetails = new Vector();
                HashMap hm = new HashMap();
                HashMap eventTypeMap = new HashMap();
                ArrayList subLevel = new ArrayList();
                if(allTypesVect!=null ){
                    Enumeration e = allTypesVect.elements();
                    while(e.hasMoreElements()){
                        String[] typeDetails = (String[])e.nextElement();
                        String mapId = typeDetails[0];
                        String typeId = typeDetails[1];
                        String levelId = typeDetails[2];
                        String typeName = typeDetails[3];
                        String levelCode = typeDetails[4];
                        String levelName = typeDetails[5];
                        if(hm.containsKey(typeId)){
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                            eventTypeMap.put(typeId,subLevel);
                        }else{
                            subLevel = new ArrayList();
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                            eventTypeMap.put(typeId,subLevel);
                        }
                        hm.put(typeId,typeName);
                    }
                    Set set = hm.keySet();
                    Iterator itr = set.iterator();
                    while(itr.hasNext()){
                        String keyId = (String)itr.next();
                        String valueName = (String)hm.get(keyId);
                        String[] eventTypeDet = {keyId,valueName};
                        eventTypeDetails.add(eventTypeDet);
                    }
                }
                if(areaDetails!=null && areaDetails.size()!=0){
                Iterator arItr = areaDetails.iterator();
                if(arItr.hasNext()){
                    String[] areaDet = (String[])arItr.next();
                    request.setAttribute("AREA_DETAILS",areaDet);
                }
                }
                request.setAttribute("EVENT_REQUEST_VO",eventReqVO);
                request.setAttribute("stateDetails",stateDetails);
                request.setAttribute("eventTypeDetails",eventTypeDetails);
                request.setAttribute("eventTypeMap",eventTypeMap);
                //==============================================================
                
                String payMode=(String)request.getAttribute("paymentMode");
                String amt=(String)request.getAttribute("amount");
                request.setAttribute("amount",amt);
                request.setAttribute("paymentMode",payMode);
                String noPay="";
                noPay=(String)request.getAttribute("noPayment");
                if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                noPay=request.getParameter("noPayment");    
                }
                Debug.print("noPay from getAttribute:"+noPay);
                Debug.print("noPay from getParameter:"+noPay);
                request.setAttribute("noPayment",noPay);
                String eventID=request.getParameter("eventId");
                Debug.print("eventID :"+eventID);
                String secId=remote1.isOrgMainEventRegExist(eventID);
                Debug.print("secId :"+secId);
                    if(memberId != null && secId==null || secId=="") {
                        fwd="OrganizerUSEAEventReg";
                    } else if(memberId == null){
                        fwd="orgRegEligibility";
                    } else if(secId!= null){
                        request.setAttribute("alreadyExists","alreadyExists");
                        fwd="orgRegEligibility";
                    }
                }
                
            }
                        /*
                         * Redirection to Confirmation Page after Insertion
                         */
            
            if(process.equalsIgnoreCase("insert")) {
                System.out.println("Inside Organizer Reg form insert Action..........");
               
                HLCVaigaiSessionBean remote = new HLCVaigaiSessionBean();
                
                System.out.println("After ejb create ......");
                
                Vector accommodation = new Vector();
                Vector crossCountry = new Vector();
                Vector cogginsDetails = new Vector();
                Vector divisionLevels = new Vector();
                Vector judgesDetails = new Vector();
                Vector hDressage = new Vector();
                Vector refundRuleDetails = new Vector();
                Vector tentativeTime= new Vector();
                
                HLCRenewalOrganizerDetails objRenewalDet = new HLCRenewalOrganizerDetails();
                HLCOtherDetailsVO othersDet = new HLCOtherDetailsVO();
                HLCPaymentDetails objPayDet = new HLCPaymentDetails();
                HLCEventDetailsVO objEventDet = new HLCEventDetailsVO();
                
                
                //********** Part A of the form starts here **********
                
                String eventsecid=request.getParameter("eventsecid");
                System.out.println("eventsecid :" +eventsecid);
                
                String eventtitle=request.getParameter("eventtitle");
                System.out.println("eventtitle :" +eventtitle);
                String eventID=request.getParameter("eventId");
                objEventDet.setEventId(eventID);
                    /*
                     * Adding Divisions Checked Values
                     */
                
                String divcbxct=request.getParameter("divcbxct");
                System.out.println("divcbxct :"+divcbxct);
                int dcbxct=0;
                if(divcbxct!=null && divcbxct.trim().length()!=0){
                dcbxct=Integer.parseInt(divcbxct);
                }
                int x=0;
                String[] nam=new String[500];
                
                Enumeration en=request.getParameterNames();
                while(en.hasMoreElements()) {
                    String na=(String)en.nextElement();
                    nam[x]=na;
                    System.out.println("Param names :"+nam[x]);
                    x++;
                }
                
                for(int i=0;i<=dcbxct;i++) {
                    String chbx="divlevel"+Integer.toString(i);
                    System.out.println("divisions made : "+chbx);
                    for(int y=0;y<nam.length;y++) {
                        
                        if(chbx.equals(nam[y])){
                            String chkd=null;
                            chkd =request.getParameter(chbx);
                            System.out.println("checked val: "+chkd);
                            
                            if(chkd!=null && chkd.trim().length()!=0) {
                                divisionLevels.add(chkd);
                                System.out.println("after adding division detail :"+chkd);
                            }
                            
                        }
                    }
                }
                
                    /*
                     * Adding Judges Checked Id & TextBox Name Values
                     */
                
                String offcnt=request.getParameter("offct");
                System.out.println("offct :"+offcnt);
                
                int offct=Integer.parseInt(offcnt);
                int y=0;
                
                for(int c=0;c<=offct;c++) {
                    String ofchbx="official"+Integer.toString(c);
                    System.out.println("official cbx made : "+ofchbx);
                    
                    String oftbx="officialtxt"+Integer.toString(c);
                    System.out.println("official tbx made : "+oftbx);
                    
                    for(int z=0;z<nam.length;z++) {
                        
                        if(ofchbx.equals(nam[z])){
                            
                            String offchkd=null;
                            String offtbx=null;
                            
                            offchkd =request.getParameter(ofchbx);
                            System.out.println("off checked val: "+offchkd);
                            
                            offtbx =request.getParameter(oftbx);
                            System.out.println("off txt val: "+offtbx);
                            
                            if(offchkd!=null&&offchkd.trim().length()!=0&&offtbx!=null&&offtbx.trim().length()!=0) {
                                String[] jud = {offchkd,offtbx};
                                judgesDetails.add(jud);
                                System.out.println("after adding judge detail :" +jud);
                            }
                        }
                    }
                }
                
                
                // *********** Part B of the form starts here **********
                
                String fees=request.getParameter("fees");
                String others=request.getParameter("others");
                String memblevel=request.getParameter("memblevel");
                String comppay=request.getParameter("comppay");
                
                String dblE=request.getParameter("dblE");
                String dblEntry="0";
                
                if(fees==null && fees.trim().length()==0)
                    fees="0";
                dblEntry=request.getParameter("dblEntry");
                if(dblEntry==null && dblEntry.trim().length()!=0)
                    dblEntry="0";
                String drawCheck=request.getParameter("drawCheck");
                String r1=request.getParameter("r1");
                String lpOne=request.getParameter("lpOne");
                String lpTwo=request.getParameter("lpTwo");
                String lpOther=request.getParameter("lpOther");
                String r5=request.getParameter("r5");
                
                System.out.println(fees);
                System.out.println(others);
                System.out.println(memblevel);
                System.out.println(comppay);
                System.out.println(dblE);
                System.out.println(dblEntry);
                System.out.println(drawCheck);
                System.out.println(r1);
                   /* System.out.println(lpOne);
                    System.out.println(lpTwo);
                    System.out.println(lpOther);
                    System.out.println(r5);*/
                
                        /*
                         * EventSecretary Details
                         */
                System.out.println("memberId inside insert block :" +memberId );
                
                objEventDet.setOrganizeId(memberId);
                objEventDet.setEventSecretaryId(eventsecid);
                objEventDet.setEventTitle(eventtitle);
                
                objEventDet.setEntryFee(fees);
                objEventDet.setOtherEntryFee(others);
                
                        /*
                         * Double Entries
                         */
                
                if(dblE!=null) {
                    if(dblE.equalsIgnoreCase("yes")) {
                        
                        objEventDet.setDoubleEntryFee(dblE);
                        objEventDet.setOfficeFee(dblEntry);
                        System.out.println("dblEntry selected and added :" +dblEntry);
                    } else {
                        objEventDet.setDoubleEntryFee(dblE);
                        objEventDet.setOfficeFee("0");
                        System.out.println("dblEntry selected and added : 0");
                        
                    }
                }
                
                objEventDet.setMembershipApplicable(memblevel+"#"+comppay);
                objEventDet.setCheckPayableTo(drawCheck);
                
                        /*
                         * Lost Pinny
                         */
                
                if(r1!=null) {
                    objEventDet.setPinniesPosition(r1);
                    
                    if(r1.equals("0"))
                        objEventDet.setPinniesCharge(lpOne);
                    if(r1.equals("1"))
                        objEventDet.setPinniesCharge(lpTwo);
                    if(r1.equals("2"))
                        objEventDet.setPinniesCharge(lpOther);
                }
                
                    /*
                     * To get the refund details from cbx & txt
                     */
                
                String rulecbxct=request.getParameter("rulecbxct");
                
                int rcbxct=Integer.parseInt(rulecbxct);
                for(int j=0;j<rcbxct;j++) {
                    
                    String rcb="refund"+Integer.toString(j);
                    System.out.println("refund cbx made : "+rcb);
                    
                    String rtb="refundtxt"+Integer.toString(j);
                    System.out.println("refund txt box made : "+rtb);
                    
                    for(int a=0;a<nam.length;a++) {
                        String rulertb="";
                        String rulercb=null;
                        
                        if(rcb.equals(nam[a])) {
                            rulercb=request.getParameter(rcb);
                            System.out.println("refunds cbx val: "+rulercb);
                            
                            for(int t=0;t<nam.length;t++) {
                                if(rtb.equals(nam[t])) {
                                    rulertb=request.getParameter(rtb);
                                    System.out.println("refunds txt val: "+rulertb);
                                    
                                }
                            /* else
                             {
                                rulertb=" ";
                                System.out.println("refunds txt val inside else : "+rulertb);
                             }*/
                            }
                            
                            String[] reffinal={rulercb,rulertb};
                            refundRuleDetails.add(reffinal);
                            System.out.println("refunds after adding :" +reffinal);
                        }
                        
                    }
                }
                
                      /*
                       * Negative Coggins Test
                       */
                
                if(r5!=null) {
                    
                    if(r5.equalsIgnoreCase("nctRef")) {
                        String nctReq1=request.getParameter("nctReq1");
                        
                        cogginsDetails.add(nctReq1);
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        System.out.println(" Coggins : Required for all horses added" +nctReq1);
                    }
                    
                    if(r5.equalsIgnoreCase("nctRef1")) {
                        String nctInState=request.getParameter("nctInState");
                        String nctOutState=request.getParameter("nctOutState");
                        
                        cogginsDetails.add(" ");
                        cogginsDetails.add(nctInState);
                        cogginsDetails.add(nctOutState);
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        System.out.println(" Coggins : Required Within " +nctInState+"#"+nctOutState);
                    }
                    
                    if(r5.equalsIgnoreCase("Not Required")) {
                        
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add("Not Required");
                        cogginsDetails.add(" ");
                        System.out.println(" Coggins : Not Required" +r5);
                    }
                    
                    if(r5.equalsIgnoreCase("Others")) {
                        
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add(" ");
                        cogginsDetails.add("Others");
                        System.out.println(" Coggins : Others" +r5);
                    }
                    
                }
                
                //********** Part C of the form starts here **********
                
                      /*
                       * Tentative Schedule 1
                       */
                
                String DateImported1=request.getParameter("DateImported1");
                String PhaseImported1=request.getParameter("PhaseImported1");
                String TimeImported1=request.getParameter("TimeImported1");
                String MinuteImported1=request.getParameter("MinuteImported1");
                String FormatImported1=request.getParameter("FormatImported1");
                
                String finaltime1=TimeImported1+":"+MinuteImported1+" "+FormatImported1;
                
                // String [] tt1 = {DateImported1,PhaseImported1,finaltime1};
                
                SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyy");
                Date tent_date1 =null;
                tent_date1=(Date)sdf.parse(DateImported1);
                
                ArrayList tentativeTime1= new ArrayList();
                tentativeTime1.add(tent_date1);
                tentativeTime1.add(PhaseImported1);
                tentativeTime1.add(finaltime1);
                
                tentativeTime.add(tentativeTime1);
                
                System.out.println("Tentative Schedule 1 added.... date :"+tent_date1+"phase :"+PhaseImported1+"final time :"+finaltime1);
                
                        /*
                         * Tentative Schedule 2
                         */
                
                String PhaseImported2=request.getParameter("PhaseImported2");
                if(PhaseImported2!=null&&PhaseImported2.trim().length()!=0) {
                    String DateImported2=request.getParameter("DateImported2");
                    String TimeImported2=request.getParameter("TimeImported2");
                    String MinuteImported2=request.getParameter("MinuteImported2");
                    String FormatImported2=request.getParameter("FormatImported2");
                    
                    String finaltime2=TimeImported2+":"+MinuteImported2+" "+FormatImported2;
                    
                    //  String [] tt2 = {DateImported2,PhaseImported2,finaltime2};
                    
                    //  tentativeTime.add(tt2);
                    
                    Date tent_date2 =null;
                    tent_date2=(Date)sdf.parse(DateImported2);
                    
                    ArrayList tentativeTime2= new ArrayList();
                    tentativeTime2.add(tent_date2);
                    tentativeTime2.add(PhaseImported2);
                    tentativeTime2.add(finaltime2);
                    
                    tentativeTime.add(tentativeTime2);
                    System.out.println("Tentative Schedule 2 added.... date :"+tent_date2+"phase :"+PhaseImported2+"final time :"+finaltime2);
                    
                    
                }
                
                        /*
                         * Tentative Schedule 3
                         */
                
                String PhaseImported3=request.getParameter("PhaseImported3");
                if(PhaseImported3!=null&&PhaseImported3.trim().length()!=0) {
                    String DateImported3=request.getParameter("DateImported3");
                    String TimeImported3=request.getParameter("TimeImported3");
                    String MinuteImported3=request.getParameter("MinuteImported3");
                    String FormatImported3=request.getParameter("FormatImported3");
                    
                    String finaltime3=TimeImported3+":"+MinuteImported3+" "+FormatImported3;
                    
                    //    String [] tt3 = {DateImported3,PhaseImported3,finaltime3};
                    
                    //    tentativeTime.add(tt3);
                    
                    Date tent_date3 =null;
                    tent_date3=(Date)sdf.parse(DateImported3);
                    
                    ArrayList tentativeTime3= new ArrayList();
                    tentativeTime3.add(tent_date3);
                    tentativeTime3.add(PhaseImported3);
                    tentativeTime3.add(finaltime3);
                    
                    tentativeTime.add(tentativeTime3);
                    
                    System.out.println("Tentative Schedule 3 added.... date :"+tent_date3+"phase :"+PhaseImported3+"final time :"+finaltime3);
                    
                }
                Debug.print("tentativeTime.size() :"+tentativeTime.size());
                
                       /*
                        * Awards Radio and txt  :
                        */
                
                
                String r6=request.getParameter("r6");
                if(r6!=null) {
                    if(r6.equalsIgnoreCase("awardOne")) {
                        String ribbons=request.getParameter("ribbons");
                        
                        objEventDet.setAwardTrophy(ribbons);
                        System.out.println("Awards : tropy & ribbon :" +ribbons);
                    }
                    
                    if(r6.equalsIgnoreCase("awardTwo")) {
                        String award2=request.getParameter("award2");
                        objEventDet.setAwardPrize(award2);
                        System.out.println("Awards : Prize money :" +award2);
                        
                    }
                    
                    if(r6.equalsIgnoreCase("awardThree")) {
                        String awrdOth=request.getParameter("awrdOth");
                        objEventDet.setAwardOthers(awrdOth);
                        System.out.println("Awards : Other :" +awrdOth);
                        
                    }
                }               
                        /*
                         * Date Available  :
                         */
                
                String dateAvailable=request.getParameter("dateAvailable");
                System.out.println("dateAvailable :"+dateAvailable);
                objEventDet.setDateAvailable(dateAvailable);
                
                       /*
                        * Available from  :
                        */
                
                String r7=request.getParameter("r7");
                objEventDet.setAvailablePosition("0");
                if(r7!=null) {
                    if(r7.equalsIgnoreCase("The secretary")) {
                        objEventDet.setAvailableFrom("The secretary");
                        System.out.println("Available from  : The secretary ");
                        objEventDet.setAvailablePosition("0");
                    }
                    if(r7.equalsIgnoreCase("Postcards will be sent")) {
                        objEventDet.setAvailableFrom("Postcards will be sent");
                        System.out.println("Available from  : Postcards will be sent ");
                        objEventDet.setAvailablePosition("1");
                    }
                    if(r7.equalsIgnoreCase("dateThree")) {
                        String dateDivOth=request.getParameter("dateDivOth");
                        //objEventDet.setAvailableFrom(dateDivOth);
                        System.out.println("Available from  : others "+dateDivOth);
                        objEventDet.setAvailableFromOther(dateDivOth);
                        objEventDet.setAvailablePosition("2");
                    }
                }
                
                //********** Part D of the form starts here **********
                
                         /*
                          * Stabling / Veterinarian details :
                          */
                
                       /*
                        * Stabling Info:
                        */
                objEventDet.setStablingLimited("0");
                String r8=request.getParameter("r8");
                if(r8!=null) {
                    if(r8.equalsIgnoreCase("stableOne")) {
                        objEventDet.setStablingLimited("1");
                        System.out.println("Limited stabling : 1");
                        
                    }
                    
                    if(r8.equalsIgnoreCase("stableTwo")) {
                        objEventDet.setStablingLimited("1");
                        System.out.println("UnLimited stabling : 1");
                    }
                    
                    if(r8.equalsIgnoreCase("stableThree")) {
                        objEventDet.setStablingLimited("0");
                        System.out.println("No stabling available : 0");
                    }
                    
                }
                
                        /*
                         * Stall Info :
                         */
                objEventDet.setStallPernightPrice("0");
                objEventDet.setPerStallPrice("0");
                String r81=request.getParameter("r81");
                
                if(r8 != null) {
                    if(!r8.equalsIgnoreCase("stableThree")) {
                        
                        
                        if(r81!=null) {
                            if(r81.equalsIgnoreCase("unlStbOne")) {
                                
                                String perStallOne1=request.getParameter("perStallOne1");
                                
                                if(perStallOne1==null && perStallOne1.trim().length()==0)
                                    perStallOne1="0";
                                objEventDet.setStallPernightPrice(perStallOne1);
                                System.out.println("Charges per stall per night :"+perStallOne1);
                                
                            }
                            if(r81.equalsIgnoreCase("unlStbTwo")) {
                                String amount1=request.getParameter("amount1");
                                
                                String stablingtime1=request.getParameter("stablingtime1");
                                String stablingminute1=request.getParameter("stablingminute1");
                                String stablingformat1=request.getParameter("stablingformat1");
                                String date1=request.getParameter("date1");
                                
                                String finalsttime1=stablingtime1+":"+stablingminute1+" "+stablingformat1;
                                
                                String stablingtime2=request.getParameter("stablingtime2");
                                String stablingminute2=request.getParameter("stablingminute2");
                                String stablingformat2=request.getParameter("stablingformat2");
                                String todate=request.getParameter("todate");
                                
                                String finalsttime2=stablingtime2+":"+stablingminute2+" "+stablingformat2;
                                if(amount1==null && amount1.trim().length()==0)
                                    amount1="0";
                                objEventDet.setPerStallPrice(amount1);
                                objEventDet.setPerStallFromTime(finalsttime1);
                                objEventDet.setPerStallFromDate(date1);
                                objEventDet.setPerStallToTime(finalsttime2);
                                objEventDet.setPerStallToDate(todate);
                                
                                System.out.println("Per stall on a given time & date price :"+amount1);
                                System.out.println("Per stall on a given time & date PerStallFromTime :"+finalsttime1);
                                System.out.println("Per stall on a given time & date  PerStallFromDate :"+date1);
                                System.out.println("Per stall on a given time & date PerStallToTime :"+finalsttime2);
                                System.out.println("Per stall on a given time & date PerStallToDate :"+todate);
                                
                            }
                        }
                        
                    }
                }
                
                        /*
                         * Type of stabling:
                         */
                
                String r9=request.getParameter("r9");
                System.out.println("Type of stabling selected :" +r9);
                objEventDet.setNoOfTempPermanentStalls("0");
                objEventDet.setMilesFromEvent("0");
                objEventDet.setNoOfStalls("0");
                objEventDet.setNoOfTempStalls("0");
                if(r9!=null) {
                    if(r9.equalsIgnoreCase("typStableOne")) {
                        
                        String permStall=request.getParameter("qtyOne");
                        if(permStall==null && permStall.trim().length()==0)
                            permStall="0";
                        objEventDet.setNoOfStalls(permStall);
                        System.out.println("Type of stabling Permanent stalls on ground :" +permStall);
                        
                    }
                    if(r9.equalsIgnoreCase("typStableTwo")) {
                        String tempStall=request.getParameter("qtyTwo");
                        if(tempStall==null && tempStall.trim().length()==0)
                            tempStall="0";
                        objEventDet.setNoOfTempStalls(tempStall);
                        System.out.println("Type of stabling Temporary stalls on ground :" +tempStall);
                        
                    }
                    
                    if(r9.equalsIgnoreCase("typStableThree")) {
                        String pertempStall=request.getParameter("amountnew");
                        String miles=request.getParameter("timenew");
                        if(pertempStall==null && pertempStall.trim().length()==0)
                            pertempStall="0";
                        objEventDet.setNoOfTempPermanentStalls(pertempStall);
                        if(miles==null && miles.trim().length()==0)
                            miles="0";
                        objEventDet.setMilesFromEvent(miles);
                        
                        System.out.println("Permanent/temporary stalls with approximate distance from event :" +pertempStall);
                        System.out.println("Permanent/temporary stalls with approximate distance from event :" +miles);
                        
                    }
                    
                }              
                        /*
                         * Veterinarian Info:
                         */
                
                String vetName=request.getParameter("vetName");
                String phNum=request.getParameter("phNum");
                String vetNo=request.getParameter("vetNo");
                
                objEventDet.setVeterinarianName(vetName);
                objEventDet.setVeterinarianPhone(phNum);
                objEventDet.setVeterinarianPlace(vetNo);
                
                System.out.println("Veterinarian Name :" +vetName);
                System.out.println("Veterinarian phone no. at event :" +phNum);
                System.out.println("Where Vet. no. will be posted at event :" +vetNo);
                
                        /*
                         * Accomodations:
                         */
                
                String hotel1=request.getParameter("hotel1");
                String phone1=request.getParameter("phone1");
                String mile1=request.getParameter("mile1");
                
                System.out.println("Accomodations hotel1 :" +hotel1);
                System.out.println("Accomodations phone1:" +phone1);
                System.out.println("Accomodations mile1:" +mile1);
                
                String acc1[] = {hotel1,phone1,mile1};
                
                accommodation.addElement(acc1);
                System.out.println("After adding Accomodations 1 :" +acc1);
                
                String hotel2=request.getParameter("hotel2");
                if(hotel2!=null && hotel2.trim().length()!=0) {
                    
                    String phone2=request.getParameter("phone2");
                    String mile2=request.getParameter("mile2");
                    
                    System.out.println("Accomodations hotel2 :" +hotel2);
                    System.out.println("Accomodations phone2 :" +phone2);
                    System.out.println("Accomodations mile2 :" +mile2);
                    
                    String acc2[] = {hotel2,phone2,mile2};
                    
                    accommodation.addElement(acc2);
                    System.out.println("After adding Accomodations 2 :" +acc2);
                }
                
                String hotel3=request.getParameter("hotel3");
                if(hotel3!=null && hotel3.trim().length()!=0) {
                    
                    String phone3=request.getParameter("phone3");
                    String mile3=request.getParameter("mile3");
                    
                    System.out.println("Accomodations hotel3 :" +hotel3);
                    System.out.println("Accomodations phone3 :" +phone3);
                    System.out.println("Accomodations mile3 :" +mile3);
                    
                    String acc3[] = {hotel3,phone3,mile3};
                    
                    accommodation.addElement(acc3);
                    System.out.println("After adding Accomodations 3 :" +acc3);
                }
                
                        /*
                         * Directions
                         */
                
                String textarea=request.getParameter("textarea");
                objEventDet.setDirections(textarea);
                System.out.println("After adding Directions :" +textarea);
                
                /********** Part E of the form starts here **********
                 *
                 * /*
                 * Dressage test for horse trials
                 */
                
                String dtct=request.getParameter("dtct");
                System.out.println("dtct :"+dtct);               
                int dct=Integer.parseInt(dtct);                
                for(int e=0;e<=dct;e++) {
                    String chbxnam="advlevel"+Integer.toString(e);
                    System.out.println("dressage cbx made : "+chbxnam);                   
                    String aropt="arena"+Integer.toString(e);
                    System.out.println("dressage opt made : "+aropt);                    
                    for(int z=0;z<nam.length;z++) {
                        
                        if(chbxnam.equals(nam[z])){
                            
                            String dtchkd=null;
                            String dtOpt=null;
                            
                            dtchkd =request.getParameter(chbxnam);
                            System.out.println("dressage checked val: "+dtchkd);
                            
                            dtOpt =request.getParameter(aropt);
                            System.out.println("dressage option val: "+dtOpt);
                            
                            String hDress1[] = {dtchkd,dtOpt};
                            hDressage.addElement(hDress1);
                            
                            System.out.println("dressage after adding : "+"horse :"+dtchkd+ "arena :"+dtOpt);
                        }
                    }
                }              
                     /*
                      * Footing :
                      */
                
                String footing=request.getParameter("footing");
                objEventDet.setFootingDesc(footing);
                System.out.println(" footing : " +footing);
                
                    /*
                     * Cross-Country :
                     */
                
                String division1=request.getParameter("division1");
                String length1=request.getParameter("length1");
                String speed1=request.getParameter("speed1");
                String AdditionalInfo=request.getParameter("AdditionalInfo");
                String r10=request.getParameter("r10");              
                String cross1[] = {division1,length1,speed1,r10,AdditionalInfo};
                crossCountry.addElement(cross1);
                System.out.println("After adding Cross-Country 1 :" +cross1);
                
                String length2=request.getParameter("length2");
                if(length2!=null && length2.trim().length()!=0) {
                    
                    String division2=request.getParameter("division2");
                    String speed2=request.getParameter("speed2");
                    
                    String cross2[] = {division2,length2,speed2," "," "};
                    crossCountry.addElement(cross2);
                    
                    System.out.println("After adding Cross-Country 2 :" +cross2);
                }                
                String length3=request.getParameter("length3");
                if(length3!=null && length3.trim().length()!=0) {
                    
                    String division3=request.getParameter("division3");
                    String speed3=request.getParameter("speed3");                   
                    String cross3[] = {division3,length3,speed3," "," "};
                    crossCountry.addElement(cross3);
                    System.out.println("After adding Cross-Country 3 :" +cross3);                
                }
                
                       /*
                        * Cross-country course officially closed on
                        */
                SimpleDateFormat sdf1 = new SimpleDateFormat("mm/dd/yyy");
                Date crctdate =null;
                
                if(request.getParameter("CrossCountryDate")!=null && request.getParameter("CrossCountryDate").trim().length()!=0) {
                    String CrossCountryDate=request.getParameter("CrossCountryDate");
                    crctdate=(Date)sdf.parse(CrossCountryDate);
                    othersDet.setCourseCloseDate(crctdate);
                } else {
                    othersDet.setCourseCloseDate(null);
                }
                
                
                        /*
                         * EntryLimit
                         */
                
                if(request.getParameter("EntryLimit")!=null && request.getParameter("EntryLimit").trim().length()!=0) {
                    String EntryLimit=request.getParameter("EntryLimit");
                    othersDet.setEntryLimit(EntryLimit);
                } else {
                    othersDet.setEntryLimit(null);
                }
                
                
                
                        /*
                         * Riders limited to horse/level * (or) horse/entire event.**
                         */
                
                if(request.getParameter("RiderLimit1")!=null && request.getParameter("RiderLimit1").trim().length()!=0) {
                    String RiderLimit1=request.getParameter("RiderLimit1");
                    othersDet.setRidersHorseLevelLimit(RiderLimit1);
                } else {
                    othersDet.setRidersHorseLevelLimit(null);
                }
                
                if(request.getParameter("RiderLimit2")!=null && request.getParameter("RiderLimit2").trim().length()!=0) {
                    String RiderLimit2=request.getParameter("RiderLimit2");
                    othersDet.setRidersHorseEntireLimit(RiderLimit2);
                } else {
                    othersDet.setRidersHorseEntireLimit(null);
                }
                
                
                        /*
                         * Divisions further divided if entries warrant; state birth date on entry.
                         */
                
                Date divdate=null;
                
                String BirthDate=request.getParameter("BirthDate");
                if(request.getParameter("BirthDate")!=null && request.getParameter("BirthDate").trim().length()!=0) {
                    divdate=(Date)sdf.parse(request.getParameter("BirthDate"));
                    othersDet.setDivisionEntryBirthDate(divdate);
                } else {
                    othersDet.setDivisionEntryBirthDate(null);
                }
                
                          /*
                           * Dogs must be leashed
                           */
                
                String r11=request.getParameter("r11");
                if(r11!=null) {
                    if(r11.equalsIgnoreCase("true")) {
                        othersDet.setLeaseDogs(true);
                    }
                    if(r11.equalsIgnoreCase("false")) {
                        othersDet.setLeaseDogs(false);
                    }
                } else {
                    othersDet.setLeaseDogs(false);
                }
                
                        /*
                         * Team of three of four, best three scores
                         */
                
                String PerHead=request.getParameter("PerHead");
                String TeamTotal=request.getParameter("TeamTotal");
                String Party=request.getParameter("Party");
                
                if(request.getParameter("PerHead")!=null && request.getParameter("PerHead").trim().length()!=0) {
                    othersDet.setPerTimePrice(request.getParameter("PerHead"));
                    
                } else {
                    PerHead="0";
                    othersDet.setPerTimePrice(PerHead);
                    
                }
                
                if(request.getParameter("TeamTotal")!=null && request.getParameter("TeamTotal").trim().length()!=0) {
                    othersDet.setTeamCompetition(request.getParameter("TeamTotal"));
                } else {
                    TeamTotal="0";
                    othersDet.setTeamCompetition(TeamTotal);
                }
                
                othersDet.setPartyName(Party);
                
                         /*
                          * Additional information
                          */
                String AdditionalInfo2=request.getParameter("AdditionalInfo2");
                othersDet.setAddInfo(AdditionalInfo2);
                
                //-------------
                objEventDet.setAccomodationCamping("setAccomodationCamping");
                othersDet.setOtherTeamInfo(null);
                
                Debug.print("=================================");
                Debug.print("Event ID:"+objEventDet.getEventId());
                Debug.print("=================================");
                Debug.print(objEventDet.getOrganizeId());
                Debug.print( objEventDet.getEventSecretaryId());
                Debug.print(objEventDet.getEntryFee());
                Debug.print(objEventDet.getOtherEntryFee());
                Debug.print(objEventDet.getOfficeFee());
                Debug.print(objEventDet.getCheckPayableTo());
                Debug.print(objEventDet.getPinniesCharge());
                Debug.print(objEventDet.getPinniesPosition());
                Debug.print(objEventDet.getAwardTrophy());
                Debug.print(objEventDet.getAwardPrize());
                Debug.print(objEventDet.getAwardOthers());
                Debug.print(objEventDet.getDateAvailable());
                Debug.print(objEventDet.getAvailableFrom());
                Debug.print(objEventDet.getAvailableFromOther());
                Debug.print(objEventDet.getAvailablePosition());
                Debug.print(objEventDet.getStablingLimited());
                Debug.print(objEventDet.getStallPernightPrice());
                Debug.print(objEventDet.getPerStallPrice());
                Debug.print(objEventDet.getPerStallFromTime());
                Debug.print(objEventDet.getPerStallFromDate());
                Debug.print(objEventDet.getPerStallToTime());
                Debug.print(objEventDet.getPerStallToDate());
                Debug.print(objEventDet.getNoOfStalls());
                Debug.print(objEventDet.getNoOfTempStalls());
                Debug.print(objEventDet.getNoOfTempPermanentStalls());
                Debug.print(objEventDet.getMilesFromEvent());
                Debug.print(objEventDet.getVeterinarianName());
                Debug.print(objEventDet.getVeterinarianPhone());
                Debug.print(objEventDet.getVeterinarianPlace());
                Debug.print(objEventDet.getAccomodationCamping());
                Debug.print(objEventDet.getDirections());
                Debug.print(objEventDet.getFootingDesc());              
                Debug.print(othersDet.getCourseCloseDate().toString());
                Debug.print(othersDet.getEntryLimit());
                Debug.print(othersDet.getPerTimePrice());
                Debug.print(othersDet.getTeamCompetition());
                
                if(othersDet.getDivisionEntryBirthDate()!=null) {
                    Debug.print(othersDet.getDivisionEntryBirthDate().toString());
                }               
                Debug.print(othersDet.getRidersHorseEntireLimit());
                Debug.print(othersDet.getRidersHorseLevelLimit());
                Debug.print(othersDet.getPartyName());
                Debug.print(othersDet.getAddInfo());
                Debug.print("=================================");
                boolean updateResult=false;
                updateResult=remote.updateMainEventRegDetails(objEventDet);
                Debug.print("updateResult :"+updateResult);
                
                String eventId = remote.createEvent(objEventDet, accommodation, crossCountry,
                        cogginsDetails, divisionLevels, hDressage, judgesDetails,
                        othersDet, refundRuleDetails, tentativeTime);
                System.out.print("Sucessfully Inserted.." + eventId);
                request.setAttribute("eventId",eventId);
                String payMode=request.getParameter("paymentMode");
                Debug.print("payMode :"+payMode);
                String amt=request.getParameter("amount");
                Debug.print("amt :"+amt);
                request.setAttribute("amount",amt);
                String noPay=request.getParameter("noPayment");
                Debug.print("noPay :"+noPay);
                if(payMode!=null && payMode.equalsIgnoreCase("check")){
                fwd="checkConfirmation";    
                }else if(payMode!=null && payMode.equalsIgnoreCase("card")){
                fwd="cardConfirmation";
                }
                if(noPay!=null && noPay.equalsIgnoreCase("noPay")){
                fwd="confirmation";    
                }
            }
            
                 
     else if(process.equalsIgnoreCase("initUpdate")){
         
       String eventId=request.getParameter("eventId");  
       String indieventID=(String)request.getAttribute("indieventID");  
       ArrayList jdTypDet=new ArrayList();
       ArrayList jdDet=new ArrayList();
       //ArrayList eventDetails=new ArrayList();
       
        HLCVaigaiSessionBean remote = new HLCVaigaiSessionBean();
        
       HLCEventRequestVO eventReqVO = new HLCEventRequestVO();     
       String oldEveId = remote4.getOldEventId(eventId);
       ArrayList omniComments=new ArrayList();
       
        ArrayList areaDetails = new ArrayList();       
         jdTypDet=remote2.selectJudgesDetails();
         
       if(oldEveId!=null && oldEveId.trim().length()!=0 && !(oldEveId.equalsIgnoreCase("null"))){         
        eventReqVO = remote.getEventRequestDetails(oldEveId);  
        jdDet=remote2.selectOfficialDetails(oldEveId);  
        
        boolean delRes=krishRemote.deleteEveTypeDets(oldEveId);            
         Debug.print("existRes in update of delRes" + delRes);            
        ArrayList eveChampLevlDets=remote.getChampionEveLevelDets(oldEveId);          
          String mapTypeId=null;
          if(eveChampLevlDets!=null && eveChampLevlDets.size()!=0){          
            Iterator itrSub = eveChampLevlDets.iterator();
            while(itrSub.hasNext()){
            String[] subEntry = (String[])itrSub.next();
            String levelId = subEntry[1];
            String eveTypId = subEntry[3];
            
             mapTypeId=krishRemote.getEveTypLevelMapId(eveTypId,levelId);
           Debug.print("existRes in update of mapTypeId" + mapTypeId);  
 
           boolean mapResult=krishRemote.insertMapDets(oldEveId,mapTypeId);           
                                    
            }
          }  
          omniComments=remote.getOmniComments(oldEveId); 
          
  if(omniComments.size()==0){           
        String oldEve=remote.getOldEventId(oldEveId);
        if(oldEve!=null){
        ArrayList omniComments1=remote.getOmniComments(oldEve);
        request.setAttribute("omniComments",omniComments1);
        request.setAttribute("msg","newInsert");
        }else{
         request.setAttribute("omniComments",omniComments);
         request.setAttribute("msg","oldUpt");
        }               
        }else{
           request.setAttribute("omniComments",omniComments); 
           request.setAttribute("msg","oldUpt");
        }        
        
       }else{
          eventReqVO = remote.getEventRequestDetails(eventId);    
          jdDet=remote2.selectOfficialDetails(eventId); 
         boolean delRes=krishRemote.deleteEveTypeDets(eventId);            
         Debug.print("existRes in update of delRes" + delRes);            
        ArrayList eveChampLevlDets=remote.getChampionEveLevelDets(eventId);          
          String mapTypeId=null;
          if(eveChampLevlDets!=null && eveChampLevlDets.size()!=0){          
            Iterator itrSub = eveChampLevlDets.iterator();
            while(itrSub.hasNext()){
            String[] subEntry = (String[])itrSub.next();
            String levelId = subEntry[1];
            String eveTypId = subEntry[3];
            
             mapTypeId=krishRemote.getEveTypLevelMapId(eveTypId,levelId);
           Debug.print("existRes in update of mapTypeId" + mapTypeId);  
 
           boolean mapResult=krishRemote.insertMapDets(eventId,mapTypeId);           
                                    
            }
          }   
    
   omniComments=remote.getOmniComments(eventId);    
   
   
 if(omniComments.size()==0){           
        String oldEve=remote.getOldEventId(eventId);
        if(oldEve!=null){
        ArrayList omniComments1=remote.getOmniComments(oldEve);
        request.setAttribute("omniComments",omniComments1);
        request.setAttribute("msg","newInsert");
        }else{
         request.setAttribute("omniComments",omniComments);
         request.setAttribute("msg","oldUpt");
        }               
        }else{
           request.setAttribute("omniComments",omniComments); 
           request.setAttribute("msg","oldUpt");
        }  
          
       }
       
         
       
               
        areaDetails = remote.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
        ArrayList stateDetails = new ArrayList();
        
              
                Vector allTypesVect = new Vector();
                stateDetails = remote.getAllStates();
                allTypesVect = remote.getAllMapTyLe();
                Vector eventTypeDetails = new Vector();
                HashMap hm = new HashMap();
                HashMap eventTypeMap = new HashMap();
                ArrayList subLevel = new ArrayList();
                if(allTypesVect!=null ){
                    Enumeration e = allTypesVect.elements();
                    while(e.hasMoreElements()){
                        String[] typeDetails = (String[])e.nextElement();
                        String mapId = typeDetails[0];
                        String typeId = typeDetails[1];
                        String levelId = typeDetails[2];
                        String typeName = typeDetails[3];
                        String levelCode = typeDetails[4];
                        String levelName = typeDetails[5];
                        if(hm.containsKey(typeId)){
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                            eventTypeMap.put(typeId,subLevel);
                        }else{
                            subLevel = new ArrayList();
                            String[] subEntry = {mapId,levelId,levelCode,levelName};
                            subLevel.add(subEntry);
                            eventTypeMap.put(typeId,subLevel);
                        }
                        hm.put(typeId,typeName);
                    }
                    Set set = hm.keySet();
                    Iterator itr = set.iterator();
                    while(itr.hasNext()){
                        String keyId = (String)itr.next();
                        String valueName = (String)hm.get(keyId);
                        String[] eventTypeDet = {keyId,valueName};
                        eventTypeDetails.add(eventTypeDet);
                    }
                }
                if(areaDetails!=null && areaDetails.size()!=0){
                Iterator arItr = areaDetails.iterator();
                if(arItr.hasNext()){
                    String[] areaDet = (String[])arItr.next();
                    request.setAttribute("AREA_DETAILS",areaDet);
                }
                }
       
                
                
         request.setAttribute("eventTypeDetails",eventTypeDetails);
         request.setAttribute("eventTypeMap",eventTypeMap);
         request.setAttribute("jdTypDet",jdTypDet);
         request.setAttribute("jdDet",jdDet);
        // request.setAttribute("eventDetails",eventDetails);
         request.setAttribute("EVENT_REQUEST_VO",eventReqVO);
         request.setAttribute("indieventID",indieventID);
     
         fwd="frmEventOrgUpdate";
         
     }  
            
            
            
            
            
        }       
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("client exception :" +e);
        }        
        return new ModelAndView(fwd); 
       }
}


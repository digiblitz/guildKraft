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
/*  Program Name    : ActionAdvertiseAdmin.java
 *  Created Date    : September 5, 2006, 4:24 PM
 *  Author          : Dhivya
 *  Version         : 1.15
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.adv.action;
import com.db.GeneralDBAction;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;

import com.hlccommon.util.HLCAdsDetailedVO;
import com.hlccommon.util.HLCAdvertiserVO;
import com.hlccommon.util.Debug;
import com.hlccommon.util.HLCManifestVO;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;


	public class GldkftActionAdvertiseAdmin implements Controller {
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
            try {
               
                HttpSession session = request.getSession(false);
                GeneralDBAction db=new GeneralDBAction();
                HLCAdvertiseSessionBean advBean=new HLCAdvertiseSessionBean();
            	
//==================================================HOME PAGE=====================================================================================
                String advProcess = request.getParameter("advProcess");
                if(advProcess.equals("AdvAdmin")){
                    try{
                        Vector vMedia = (Vector)advBean.getAllMediaDetails();
                        HttpSession hs = request.getSession(true);
                        hs.setAttribute("displayPendingAds" ,null);
                        hs.setAttribute("displayMediaTypeSesssion" ,null);
                        hs.setAttribute("displayMediaTypeSesssion" ,vMedia);
                      
                        return new ModelAndView("frmAdvAdminRequestView");  
                      
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting new display type page" + eDisp);
                    }
                    return new ModelAndView("frmAdvAdminRequestView");  
                }
//======================================View Manifest ==================================================================================                
                if(advProcess.equals("AdvAdminManifest")){
                    try{
                        Vector vMedia = (Vector)advBean.getAllMediaDetails();
                        HttpSession hs = request.getSession(true);
                        hs.setAttribute("activeAdsList" ,null);
                         hs.setAttribute("displayPendingAds" ,null);
                        
                        hs.setAttribute("mediaList" ,null);
                        hs.setAttribute("mediaList" ,vMedia);
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Manifest page" + eDisp);
                    }
                    return new ModelAndView("frmAdvManifestRequestView"); 
                }                
//==================================================Admin View Ads Request=====================================================================================
                else if(advProcess.equals("viewAdsReqest")){
                    try{
                        String mid = request.getParameter("mid");
                        Debug.print("Servlet Mid:"+ mid);
                        
                        String status = request.getParameter("status");
                        Debug.print("Servlet Status:"+ status);
                        
                        if(mid!=null){
                            Debug.print("Servlet Inside Loop:"+ mid);
                            Vector vMedia = (Vector)advBean.getAllMediaDetails();
                            HttpSession hs = request.getSession(true);
                            hs.setAttribute("activeAdsList" ,null);
                            hs.setAttribute("mediaList" ,null);
                            hs.setAttribute("mediaList" ,vMedia);
                            request.setAttribute("mid",mid);
                            Debug.print(" Vector vMedia:" + vMedia);
                            Debug.print("Servlet Mid:"+ mid);
                            Debug.print("Servlet Status:"+ status);
                            ArrayList list = advBean.getAllAdvertiserMediaBasedStatusDetails(mid,status);
                            //Debug.print("List" +list);
                            request.setAttribute("status",status);
                            ArrayList displayPendingAds = new ArrayList();
                            Iterator itall = list.iterator();
                            while(itall.hasNext()){
                                ArrayList al = (ArrayList) itall.next();
                                Iterator it = al.iterator();
                                while(it.hasNext()){
                                    HLCAdvertiserVO objAdv = (HLCAdvertiserVO)it.next();
                                    displayPendingAds.add(objAdv);
                                    ArrayList li = (ArrayList)it.next();
                                }
                            }
                            hs.setAttribute("displayPendingAds" ,null);
                            hs.setAttribute("displayPendingAds" ,displayPendingAds);
                            Debug.print("Vector displayPendingAds:" + displayPendingAds);
                        }
                        return new ModelAndView("frmAdvAdminRequestView"); 
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Admin Main  page" + eDisp);
                        
                    }
                   
                }
//==================================================Admin View Manifest Details=====================================================================================
                else if(advProcess.equals("viewAdsManifest")){
                    try{
                        String mid = request.getParameter("mid");
                        Debug.print("Servlet Mid:"+ mid);
                        
                        if(mid!=null){
                            Debug.print("Servlet Inside Loop:"+ mid);
                            Vector vMedia = (Vector)advBean.getAllMediaDetails();
                            HttpSession hs = request.getSession(true);
                            hs.setAttribute("mediaList" ,null);
                            hs.setAttribute("mediaList" ,vMedia);
                            request.setAttribute("mid",mid);
                            
                            
                            ArrayList list = advBean.getAllAdvertiserMediaBasedStatusDetails(mid,"Active");
                            //Debug.print("List" +list);
                            ArrayList displayPendingAds = new ArrayList();
                            Iterator itall = list.iterator();
                            while(itall.hasNext()){
                                ArrayList al = (ArrayList) itall.next();
                                Iterator it = al.iterator();
                                while(it.hasNext()){
                                    HLCAdvertiserVO objAdv = (HLCAdvertiserVO)it.next();
                                    displayPendingAds.add(objAdv);
                                    ArrayList li = (ArrayList)it.next();
                                }
                            }
                            hs.setAttribute("activeAdsList" ,null);
                            hs.setAttribute("activeAdsList" ,displayPendingAds);
                        }
                      
                        return new ModelAndView("frmAdvManifestRequestView");
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Admin Main  page" + eDisp);
                        
                    }
                    
                }                                
//==================================================HOME PAGE=====================================================================================
                else if(advProcess.equals("statusChange")){
                    try{
                        String advId = request.getParameter("advId");
                        String status = request.getParameter("status");
                        Debug.print("Servlet viewAds:"+ advId);
                        if(advId!=null && status!=null){
                            if(status.equals("Activate")){
                                status = "Active";
                            }
                            
                            if(status.equals("Reject")){
                                status = "Rejected";
                            }
                            
                            Debug.print("Servlet Inside Loop:"+ advId);
                            HttpSession hs = request.getSession(true);
                            boolean result = advBean.advertisementStatusChange(advId,status);
                            
                      if(result==true){
                        String toMailId = (String)session.getAttribute("emailId");
                        String toMailIds[] = {toMailId};
                        EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("info@hlc.com");
                        email.setSubject("Test Mail");

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
                        "<p>You request has been approved successfully.<p>"+
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
                        "per your ‘Role’ assigned:"+

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
                    }
     
                Vector vMedia = (Vector)advBean.getAllMediaDetails();
                hs.setAttribute("displayMediaTypeSesssion" ,null);
                hs.setAttribute("displayMediaTypeSesssion" ,vMedia);
                hs.setAttribute("displayPendingAds" ,null);
           }
                        return new ModelAndView("frmAdvAdminRequestView");
       
       
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Admin Main  page" + eDisp);
                    }
                }                
 
//==================================================HOME PAGE=====================================================================================
               else if(advProcess.equals("viewAds")){
                    try{
                        String advId = request.getParameter("advId");
                        Debug.print("Servlet viewAds:"+ advId);
                        if(advId!=null){
                            Debug.print("Servlet Inside Loop:"+ advId);
                            HttpSession hs = request.getSession(true);
                            ArrayList listAds = advBean.getAdvertiserDetails(advId);
                            hs.setAttribute("displayParticularAds" ,null);
                            hs.setAttribute("displayParticularAds" ,listAds);
                            Debug.print("Servlet Suscessfully leaved" + listAds);
                        }
                       
                        return new ModelAndView("advViewOmnibus");
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Admin Main  page" + eDisp);
                    }
                }
//==================================================HOME PAGE=====================================================================================
               else if(advProcess.equals("viewAdsDetail")){
                    try{
                        String advId = request.getParameter("advId");
                        Debug.print("Servlet viewAdsDetail:"+ advId);
                        if(advId!=null){
                            Debug.print("Servlet Inside Loop:"+ advId);
                            HttpSession hs = request.getSession(true);
                            ArrayList listAds = advBean.getAdvertiserDetails(advId);
                            hs.setAttribute("displayParticularAds" ,null);
                            hs.setAttribute("displayParticularAds" ,listAds);
                            Debug.print("Servlet Suscessfully leaved" + listAds);
                        }
                      
                        return new ModelAndView("frmAdsDetailsView");
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting Admin Main  page" + eDisp);
                    }
                }
//==================================================Manage Manifest====================================================================================
         
             else if(advProcess.equals("manageManifest")){
                    try{
                        String manifest = request.getParameter("manifest");
                        Debug.print("Servlet manageManifest manifest:"+ manifest);
                        String advId = request.getParameter("advId");
                        Debug.print("Servlet manageManifest:"+ advId);
                        if(advId!=null){
                            Debug.print("Servlet Inside Loop:"+ advId);
                            ArrayList adsDetailList = new ArrayList();
                            if(manifest.equals("Manage")){
                                if(advId!=null && advId.trim().length()!=0){
                                        adsDetailList = advBean.getAdvertisementDetailsByAdsId(advId);

                                        request.setAttribute("adsDetailList" ,adsDetailList);
                                        
                                        return new ModelAndView("frmAdvManifestUpdateList");
                                  }
                            }
  //======================================================Manifest Details========================================================               
                         else if(manifest.equals("Manifest")){
                                if(advId!=null && advId.trim().length()!=0){
                                    adsDetailList = advBean.getAllManifestDetailForUser(advId);
                                     request.setAttribute("manifestDetailList",adsDetailList);
                                                                                                           
                                 }
                             
                                return new ModelAndView("advAdminManifestUpdatedDetails");
                           }
//======================================================End Manifest Detail========================================================               
                        }
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting manageManifest  page" + eDisp);
                    }
                }      
  //================================================================Edit manifest=================================================              
              else if(advProcess.equals("editManifest")){
                    try{
                      
                        String manifestId = request.getParameter("manifestId");
                        Debug.print("Servlet editManifest:"+ manifestId);
                        String pubMediaId = request.getParameter("pubMediaId");
                        Debug.print("Servlet editManifest:"+ pubMediaId);
                        
                        if(manifestId!=null){
                            Debug.print("Servlet Inside Loop:"+ manifestId);
                            HLCManifestVO manifestDetailList = advBean.getManifesttDetailsByManifestId(manifestId);
                            session.setAttribute("manifestDetailList",manifestDetailList);
                            Vector dimensionDet = (Vector)advBean.getAllDimensionDetails();
                            session.setAttribute("DisplayDimensionDetails",null);
                            session.setAttribute("DisplayDimensionDetails",dimensionDet);
                           
                            Vector issueDetails = (Vector)advBean.getIssueByMedia(pubMediaId);
                            session.setAttribute("DisplayIssueDetails",null);
                            session.setAttribute("DisplayIssueDetails",issueDetails);
                            
                         
                            return new ModelAndView("frmAdvManifestEdit");
                        }

                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting manageManifest  page" + eDisp);
                    }
                }      
//==================================================HOME PAGE=====================================================================================
             else if(advProcess.equals("initUpdateAdsDetail")){
                    try{
                        String advDetailId = request.getParameter("advDetailId");
                        String mediaId = request.getParameter("mediaId");
                         Debug.print("Servlet initUpdateAdsDetail advDetailId:"+ advDetailId);
                        Debug.print("Servlet initUpdateAdsDetail mediaId:"+ mediaId);
                        if(advDetailId!=null && mediaId!=null){
                            Debug.print("Servlet Inside Loop:"+ advDetailId);
                            HLCAdsDetailedVO manifestUpdateDetails= advBean.getAdsDetailsByAdsDetId(advDetailId);
                            
                            session.setAttribute("DispUpdateDetails" ,null);
                            session.setAttribute("DispUpdateDetails" ,manifestUpdateDetails);
                           
                            Vector dimensionDet = (Vector)advBean.getAllDimensionDetails();
                            session.setAttribute("DisplayDimensionDetails",null);
                            session.setAttribute("DisplayDimensionDetails",dimensionDet);
                           
                            Vector issueDetails = (Vector)advBean.getIssueByMedia(mediaId);
                            session.setAttribute("DisplayIssueDetails",null);
                            session.setAttribute("DisplayIssueDetails",issueDetails);
                            
                        }
                     
                        return new ModelAndView("frmAdvManifestUpdate");
                    }
                    catch(Exception updateDetDisp){
                        Debug.print("while redirecting manageManifest  page" + updateDetDisp);
                    }
                }
//======================================================================================================
               else if(advProcess.equals("updateManifest")){
                    try{
                        String pubAdvId = request.getParameter("pubAdvId");
                        String pubMapId = request.getParameter("pubMapId");
                        String pageNo = request.getParameter("pageno");
                        String splInstructions = request.getParameter("SpecialInstructions");
                        String dimensionId = request.getParameter("selDimension");
                        String issueId = request.getParameter("selIssue");
                        String placement = request.getParameter("placement");
                        String manifestId = request.getParameter("manifestId");
                        
                        Debug.print("Servlet updateManifest pubAdvId:"+ pubAdvId);
                        Debug.print("Servlet updateManifest pubMapId:"+ pubMapId);
                        Debug.print("Servlet updateManifest pageNo:"+ pageNo);
                        Debug.print("Servlet updateManifest splInstructions:"+ splInstructions);
                        Debug.print("Servlet updateManifest dimensionId:"+ dimensionId); 
                        Debug.print("Servlet updateManifest issueId:"+ issueId);
                        Debug.print("Servlet updateManifest placement:"+ placement);
                        Debug.print("Servlet updateManifest manifestId:"+ manifestId);
                        
                       if(manifestId!=null && manifestId.trim().length()!=0){
                        boolean editManifest = advBean.editManifest(manifestId, issueId,dimensionId,placement,splInstructions, pageNo);
                        Debug.print("editManifest" + editManifest);
                       
                        return new ModelAndView("frmAdvManifestRequestView");
                       }
                        
                    }
                    catch(Exception updateEditDisp){
                        Debug.print("while redirecting updateEditDisp " + updateEditDisp);
                    }
                }  

//==================================================Update manifest=====================================================================================                
                else if(advProcess.equals("updateConfirm")){
                    try{
                        String advertisementId = request.getParameter("adId");
                        String advMapId = request.getParameter("advMapId");
                        String pageNo = request.getParameter("pageno");
                        String splInstructions = request.getParameter("SpecialInstructions");
                        String dimensionId = request.getParameter("selDimension");
                        String issueId = request.getParameter("selIssue");
                        String placement = request.getParameter("placement");
                        String advDetailId = request.getParameter("advDetailId");
                        
                        Debug.print("Servlet updateConfirm advertisementId:"+ advertisementId);
                        Debug.print("Servlet updateConfirm advMapId:"+ advMapId);
                        Debug.print("Servlet updateConfirm pageNo:"+ pageNo);
                        Debug.print("Servlet updateConfirm splInstructions:"+ splInstructions);
                        Debug.print("Servlet updateConfirm dimensionId:"+ dimensionId); 
                        Debug.print("Servlet updateConfirm issueId:"+ issueId);
                        Debug.print("Servlet updateConfirm placement:"+ placement);
                        Debug.print("Servlet updateConfirm advDetailId:"+ advDetailId);
                            
                            
                        boolean createManifest = advBean.createManifest(advDetailId, advertisementId, issueId, advMapId,dimensionId, placement, splInstructions, pageNo);
                        Debug.print("createManifest" + createManifest);
                       
                        return new ModelAndView("frmAdvManifestRequestView");
                    }
                    catch(Exception updateDetDisp){
                        Debug.print("while redirecting manageManifest  page" + updateDetDisp);
                    }
                }  
                
                
 //============================================GLOBAL TRY BLOCK END===================================================================
            }
//===============================================GLOBAL CATCH BLOCK================================================================            
            catch(Exception eAdvertise){
                Debug.print("In ActionAdvertise while calling advertise session bean::::::::" + eAdvertise );
            }

              return null;
        }       

    }



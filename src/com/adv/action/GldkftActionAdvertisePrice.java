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
package com.adv.action;
import com.db.GeneralDBAction;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.Debug;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import java.io.*;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.*;

public class GldkftActionAdvertisePrice implements Controller {
 
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

            try{
                        

                HLCAdvertiseSessionBean advRemote = new HLCAdvertiseSessionBean();
                HttpSession session = request.getSession(false); 
                Debug.print("ActionAdvertisePrice.initLoad() called ...."); 
                String advPrice = request.getParameter("advPrice");
                GeneralDBAction db=new GeneralDBAction();
    /*
     *  new page
     *
     */         if(advPrice.equals("userView")){    
                    Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                    session.setAttribute("FrequencyPriceDetails",null);
                    session.setAttribute("DisplayTypeDetails",null);
                    session.setAttribute("DisplayMediaDetails",null);
                    session.setAttribute("DisplayMediaDetails",dispMediaType);
                    return new ModelAndView("frmAdvUsrPricematrixList");  
               }
	   
     /*
      *  based on media Id get display id
      *
      */
             else if(advPrice.equals("mediaPriceLst")){
                    try{
                            String mid = request.getParameter("mid");
                            Debug.print("Servlet mid" + mid);
                                Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                                session.setAttribute("DisplayMediaDetails" ,dispMediaType);  
                                session.setAttribute("FrequencyPriceDetails",null);
                                session.setAttribute("DisplayTypeDetails",null);
                                Vector displayType = (Vector)advRemote.getMediaDisplayTypeDetails(mid);
                                session.setAttribute("DisplayTypeDetails" ,displayType);
                                
                                request.setAttribute("mid",mid);
                                return new ModelAndView("frmAdvUsrPricematrixList");
                    } 
                    catch(Exception priceFreqType){
                        Debug.print("While Listing new display sub type page" + priceFreqType);
                    }
            }   
        
/*
* based on display id list all frequency and price..........
*
*/
                
              else if(advPrice.equals("searchFreq")){
                    try{
                        String mid = request.getParameter("mid");
                        Debug.print("Servlet mid" + mid);
                        Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                        session.setAttribute("DisplayMediaDetails" ,dispMediaType);    

                        Vector displayType = (Vector)advRemote.getMediaDisplayTypeDetails(mid);
                        session.setAttribute("DisplayTypeDetails" ,displayType);
                        request.setAttribute("mid",mid);

                        String dispId = request.getParameter("dispId");
                        Debug.print("Servlet dispId" + dispId);
                        
                        ArrayList FrequencyPriceDetails  = (ArrayList)advRemote.getPriceDetailsByMediaIdDispId(mid, dispId);
                        session.setAttribute("FrequencyPriceDetails", FrequencyPriceDetails);
                        request.setAttribute("dispId",dispId);
                        return new ModelAndView("frmAdvUsrPricematrixList");
                    }
                    catch(Exception freqPrice){
                        Debug.print("Frequency and price Exception......." + freqPrice);
                   }
              }   
 /*
  * User post status............
  *
  */  
            else if(advPrice.equals("userStatus")){
                    String userId = (String)session.getAttribute("userId");     
                    if(userId!=null){
                        Debug.print("User ID In Sesssion:" + userId);
                        ArrayList UserListDetails = advRemote.viewAllAdsForUser(userId);            
                        Debug.print("ArrayList" +UserListDetails);
                        session.setAttribute("UserListDetails",null);
                        session.setAttribute("UserListDetails" ,UserListDetails); 

                         return new ModelAndView("frmAdvMyRequest");
                    }
                }
                
             
   /*
    * to see posted ad details
    *
    */   
           else if(advPrice.equals("viewMyAds")){
                    try{
                        String manifest = request.getParameter("manifest");
                        String advId = request.getParameter("advId");
                        Debug.print("Servlet viewAds() advId:"+ advId);
                        Debug.print("Servlet viewAds() manifest:"+ manifest);
                        Debug.print("Servlet posted ad details() is calling");
                         if(advId!=null && advId.trim().length()!=0){
                            if(manifest.equals("View")) {
                                    Debug.print("Servlet Inside Loop:"+ advId);
                                    ArrayList listAds = advRemote.getAdvertiserDetails(advId);
                                    session.setAttribute("displayParticularAds" ,null);
                                    session.setAttribute("displayParticularAds" ,listAds);
                                    Debug.print("Servlet Suscessfully leaved" + listAds);
                                    return new ModelAndView("advViewMyAds");
                            }
                            else if(manifest.equals("Manifest")){
                                ArrayList adsDetailList = advRemote.getAllManifestDetailForUser(advId);
                                request.setAttribute("manifestDetailList",adsDetailList);
                                return new ModelAndView("advManifestUpdatedDetails");
                            }     
                            
                        }
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while redirecting User My Ads  page" + eDisp);
                    }
                }                                      
        
    /*
     *  new page
     *
     */      else if(advPrice.equals("mediaView")){    
                    Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                    session.setAttribute("DisplayMediaDetails",null);
                    session.setAttribute("DisplayMediaDetails",dispMediaType);
                    return new ModelAndView("frmAdvAvailableMedia");  
               }                
     /*
      * based on sub type id and media id we r getting freqDet details....................
      * public ArrayList getDimensionDetailBySubTypeAdvertisement(String mediaId, String subTypeId) throws RemoteException;
      * String dimList[] = {mediaName,  dispName, dispSubName, dimName, height, width, units, imagePath };
      */           
     else if (advPrice.equals("freqDet")){
              Debug.print("Action AdvertisePrice.getDimensionDetailBySubTypeAdvertisement() is calling......");      
              String mediaId = request.getParameter("mediaId");
              String subTypeId = request.getParameter("subTypeId");
              System.out.print("mediaId" + mediaId);
              System.out.print("subTypeId" + subTypeId);
              ArrayList list = (ArrayList)advRemote.getDimensionDetailBySubTypeAdvertisement(mediaId,subTypeId);                    
              session.setAttribute("dimensionDetails",list);
              return new ModelAndView("frmAdvDimDetail");
     }   
                
     /*  
      * try block end..............
      */       

      }  
      /*
      *
      * catch block starts..............
      */               
      catch(Exception general){
          Debug.print("Exception occurs while calling price servlet" + general);
      }
           return new ModelAndView("index");
      }
}

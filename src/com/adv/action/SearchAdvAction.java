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
/*  Program Name    : ActionAdvertisement.java
 *  Created Date    : September 1, 2006, 10:25 AM
 *  Author          : Punitha.R
 *  Version         : 1.3
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
package com.adv.action;
//import com.adv.actionform.FormAdvertisement;
import com.adv.actionform.AdvertisementFormVO;
import com.adv.actionform.SearchAdvtForm;
import com.db.GeneralDBAction;
import com.hlcadv.advertise.HLCAdvertiseBean;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlcadv.masters.HLCDimensionLocal;
import com.hlcadv.masters.HLCMediaMasterLocal;
import com.hlccommon.util.HLCAdvertisementVO;
import com.hlccommon.util.Debug;
import com.hlcpayment.HLCPaymentSessionBean;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import java.io.*;
import java.net.ProtocolException;
import java.rmi.RemoteException;
import java.util.*;

import javax.ejb.FinderException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.*;


	public class SearchAdvAction implements Controller {
		  GeneralDBAction db = new GeneralDBAction();
		
		 public ModelAndView handleRequest(HttpServletRequest request,
		 			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
		 			IOException, ParserConfigurationException, SAXException {
    try{	
    	  /**
         * Getting the EJB Remote object to access the bean
         */
   	   HttpSession session = request.getSession();
   	   HLCAdvertiseSessionBean advBean=new HLCAdvertiseSessionBean();
   	   HLCAdvertiseBean advertise=new HLCAdvertiseBean();
   	   HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();
   	 
    String cmd = request.getParameter("method");
	
    if(cmd.equals("search")){
    	
    	 Debug.print("ActionAdvertise.search() called ...."); 
		
               SearchAdvtForm searchAdvForm = new SearchAdvtForm();

               if(request.getAttribute("mediaType")!=null)
		    searchAdvForm.setSelMediaType((String)request.getAttribute("mediaType"));
		  if(request.getAttribute("displayType")!=null)
		    searchAdvForm.setSelDisplayType((String)request.getAttribute("displayType"));

		  
		   String offset =  request.getParameter("offset");
		   String rowSize =  request.getParameter("rowSize");
		   
		   Debug.print("mediaType="+searchAdvForm.getSelMediaType());
		   Debug.print("displayType="+searchAdvForm.getSelDisplayType());
		   Debug.print("offset="+offset);
		   Debug.print("rowSize="+rowSize);

		   List mediaLists = advBean.searchDimByMediaAndSubTypeId(searchAdvForm.getSelMediaType(),
                        searchAdvForm.getSelDisplayType());			
                
                for (Iterator it = mediaLists.iterator(); it.hasNext();) {
                     HLCAdvertisementVO advVO = (HLCAdvertisementVO) it.next();
                     Debug.print("Advertisement Object ="+advVO);                       
                }
                
                Debug.print("mediaLists :"+mediaLists); 
		   
              searchAdvForm.setResults(mediaLists) ;
              // request.setAttribute("MediaSearchDetails",mediaListDetails);
               
               Vector dispMediaType = (Vector)advBean.getAllMediaDetails();
		  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));   
           if(searchAdvForm.getSelMediaType()!=null && searchAdvForm.getSelMediaType().trim().length()>0)   {  
               Vector displayType = (Vector)advBean.getMediaDisplayTypeDetails(searchAdvForm.getSelMediaType());  
              request.setAttribute("DisplayTypeDetails",getDropDown(displayType));
           }    
		 request.setAttribute("searchAdvtForm",searchAdvForm);	
		 return new ModelAndView("frmAdvDimensionDetailsList");     	
    	
    	
    }
    
    else if(cmd.equals("initSearch")){
    	 Debug.print("ActionAdvertise.initSearch() called ...."); 
		
                 Vector dispMediaType = getAllMediaDetails();                 
		  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                 Vector dispDimensionType =(Vector)advBean.getAllDimensionDetails();
                 request.setAttribute("DispDimensionDetails",getDropDown(dispDimensionType));
                 return new ModelAndView("frmAdvDimensionDetailsList");   	
    	
    }
    

		
		
    }
    catch(Exception ecommon){
        Debug.print("" + ecommon);

    }
      return null;  
   }
		 
		  /*
	         *  Convert the vector into array list
	         */
	        private ArrayList getDropDown(Vector mediaLists){
	           ArrayList dropDwonLists = new ArrayList();
	                  for (Iterator it = mediaLists.iterator(); it.hasNext();) {
	                      String[] keyValue = (String[]) it.next();
	                     dropDwonLists.add(new LabelValueBean(keyValue[1],keyValue[0]));                  
	                  }    
	       return dropDwonLists; 
	     }   
	       
	        public Vector getAllMediaDetails( ) throws RemoteException,FinderException {
	            Debug.print("AdvertiseSessionBean getAllMediaDetails");
	            Vector mediaList = new Vector();
	            Collection result = db.findByAll();
	            System.out.println("=====result===="+result);
	            Iterator e = result.iterator();
	            while(e.hasNext()){
	                HLCMediaMasterLocal objMedialocalRemote = (HLCMediaMasterLocal)e.next();
	                Debug.print("AdvertiseSessionBean getAllMediaDetails");
	                String mediaIdVal  = objMedialocalRemote.getMediaId();
	                String mediaName =  objMedialocalRemote.getMediaName();
	                String mediaDesc =  objMedialocalRemote.getMediaDescription();
	                String mediaStatus = String.valueOf(objMedialocalRemote.isActiveStatus());
	                String media [] = {mediaIdVal,mediaName,mediaDesc,mediaStatus};
	                mediaList.add(media);
	            }
	            return mediaList;
	        }
	        
	        


	        public Vector getAllDimensionDetails( ) throws RemoteException,FinderException {
	               Debug.print("AdvertiseSessionBean getAllDimensionDetails");
	               Vector dimList = new Vector();
	               Collection result = db.findByAll();
	               Iterator e = result.iterator();
	               while(e.hasNext()){
	                   HLCDimensionLocal objDimlocalRemote = (HLCDimensionLocal)e.next();
	                   Debug.print("AdvertiseSessionBean getAllDimensionDetails");
	                   String dimensionTypeId = objDimlocalRemote.getDimensionTypeId();
	                   String dimensionTypeName =  objDimlocalRemote.getDimensionTypeName();
	                   String dimStatus = String.valueOf(objDimlocalRemote.isActiveStatus());
	                   String dimension [] = {dimensionTypeId,dimensionTypeName,dimStatus};
	                   dimList.add(dimension);
	               }
	               return dimList;
	           }
		
	 }	
		
		

        
      
  

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
/*  Program Name    : ActionAdvertise.java
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Punitha.R
 *  Version         : 1.19
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
package com.adv.action;

import com.adv.actionform.AdvertisementFormVO;
import com.adv.actionform.FormAdvertisement;
import com.adv.actionform.SearchAdvtForm;
import com.db.GeneralDBAction;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.HLCAdvertisementVO;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.login.action.KlgLoginAction;
import com.util.OptionsBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.upload.FormFile;
import org.apache.struts.util.LabelValueBean;
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
import org.springframework.web.servlet.mvc.*;

	
	public class GldkftActionAdvertise implements Controller {
	
 
    private static final String ROOTDIR = "WEB-INF";
    
static Logger log = Logger.getLogger(KlgLoginAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
    	
    	Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
    	
    	GeneralDBAction db=new GeneralDBAction();
    	HLCAdvertiseSessionBean advBean=new HLCAdvertiseSessionBean();
    	 String process = request.getParameter("artiMapProcess");
    	 try
         {
    		 if(process.equals("create")){
         FormAdvertisement  advForm = new FormAdvertisement();
                 
                 // just for the readability 
                 String dimensionHeight = advForm.getTxtAdvHeight();
                 String dimensionWidth = advForm.getTxtAdvWidth();
                 String dimensionName = advForm.getTxtDimensionalName();
                 String dimensionUnit = advForm.getTxtDimensionalUnit();
                 String mediaType = advForm.getSelMediaType();
                 String displayType = advForm.getSelDisplayType();
                 String displaySubType = advForm.getSelDisplaySubType();
                 String dimensionType = advForm.getSelDimensionType();
                 FormFile fileUpload = advForm.getFileUpload();
                 
                 //logging the inputs coming from the GUI
                 log.info("FormAdvertisement ="+advForm);
            
                 
                 //upload the  file                  
                 String rootDir ="";                                  
                 log.info("RootDir="+rootDir);                 
                 String directoryTemp = rootDir+java.io.File.separator +"temp";                                                   
                 String fileName = fileUpload.getFileName();                   
                 String imageFilePath = directoryTemp+File.separator+fileName;                 
                 String imagePath = File.separator+ROOTDIR+File.separator +"temp"+File.separator+fileName;
                 
                 log.info("ImagePath="+imagePath);
                 BufferedOutputStream outFile = null;
                try {                      
                    //creating the temp dir if not exists
                      File fDir = new File(directoryTemp);
                        if (!fDir.exists()) {
                            if (!fDir.mkdir()) {
                              throw new IOException("Cannot create tmpdir for dimension file");
                            }
                        } 
                    File newFile = new File(imageFilePath);                           
                   log.info("NewFilePath ="+newFile.getAbsolutePath());                                                       
                    outFile = new BufferedOutputStream(
                                new FileOutputStream(newFile));
                    outFile.write(fileUpload.getFileData());
 
                } catch (IOException ie) {
                  log.info("Error while writing into the file");
                } finally {
                 if(outFile!=null){   
                    outFile.flush();
                    outFile.close();              
                 }  
                } 
                boolean dimFlag = advBean.createDimDetails(displaySubType,dimensionType,mediaType,dimensionName,dimensionHeight
                         ,dimensionWidth,dimensionUnit,imagePath);
                log.info("Dimension Detail created Flag :"+dimFlag);
                if(dimFlag==true){
                   
                    return new ModelAndView("frmDimensionAddConfirmation");
                }
                else{
                    request.setAttribute("err","st");
                    return new ModelAndView("frmAdvDimensionDetailsAdd");
                }
        
    		 }
    		 
    		 else if(process.equals("update")){
    			 

    			   String mediaTypeId   =  request.getParameter("selMediaType");
    			   String displayTypeId =  request.getParameter("selDisplayType");
    		       
    			   log.info("mediaType="+mediaTypeId);
    			   log.info("displayType="+displayTypeId);
    			     			  
    			   log.info("ActionAdvertise.update() called ...."); 

    			   FormAdvertisement  advForm = new FormAdvertisement();
    				 
    				 // just for the readability 
    				 String dimensionId    = advForm.getDimensionId();
    				 String dimensionHeight = advForm.getTxtAdvHeight();
    				 String dimensionWidth = advForm.getTxtAdvWidth();
    				 String dimensionName = advForm.getTxtDimensionalName();
    				 String dimensionUnit = advForm.getTxtDimensionalUnit();
    				 String mediaType = advForm.getSelMediaType();
    				 String displayType = advForm.getSelDisplayType();
    				 String displaySubType = advForm.getSelDisplaySubType();
    				 String dimensionType = advForm.getSelDimensionType();
    				 FormFile fileUpload = advForm.getFileUpload();
    				 
    	                       log.info("Advertisement Form ="+advForm);
    	 
    			       String[] loadDimension = advBean.getDimDetails(dimensionId);
    	                       String loadedImagePath = loadDimension[7];

    				 //logging the inputs coming from the GUI
    				
    				
    				 
    				 //upload the  file                  
    				 String rootDir = "";                                  
    				 log.info("RootDir="+rootDir);                 
    				 String directoryTemp = rootDir +java.io.File.separator +"temp";                                                   
    				 String fileName = fileUpload.getFileName();                   
    				 String imageFilePath = directoryTemp+File.separator+fileName;  
    	                         
    				 String imagePath = File.separator+ROOTDIR+java.io.File.separator +"temp"+File.separator+fileName;
    				 
    				 log.info("ImagePath="+imagePath);
    				 BufferedOutputStream outFile = null;
    				try {                      
    					
    					File newFile = new File(imageFilePath);  
    					log.info("NewFilePath ="+newFile.getAbsolutePath());  

    					 if (!newFile.exists()) {						
    	                                    if(fileUpload.getFileData()!=null) {
    						  outFile = new BufferedOutputStream(new FileOutputStream(newFile));                                          
    						  outFile.write(fileUpload.getFileData());
    						  File delFile = new File(directoryTemp+File.separator+loadedImagePath);
    						  boolean delFlag =  delFile.delete();
    						  if(delFlag)
    						    log.info("File Successfully Deleted :"+delFile.getAbsolutePath());
    	                                    }
    	                                    
    	                                    imagePath = loadedImagePath;
    					 } 


    				} catch (IOException ie) {
    				  log.info("Error while writing into the file");
    				} finally {
    	                            if(outFile!=null){
    					outFile.flush();
    					outFile.close();              
    	                            }    
    				}   		
    	                        log.info("Update ImagePath="+imagePath);
    	                        
    				boolean dimFlag = advBean.editDimDetails(dimensionId,displaySubType,dimensionType,mediaType,
    					dimensionName,dimensionHeight,dimensionWidth,dimensionUnit,imagePath);
    			
    				request.setAttribute("mediaType",mediaTypeId);
    				request.setAttribute("displayType",displayTypeId);

    				 log.info("Dimension Detail Update Successfully "+dimFlag);
    	                         //it will redirect to search page
    				 
    				//return mapping.findForward("updateList");  
    		//==============Redirected to Search screen==============================
    				 SearchAdvtForm searchAdvForm = new SearchAdvtForm();
    				 if(request.getAttribute("mediaType")!=null)
    					    searchAdvForm.setSelMediaType((String)request.getAttribute("mediaType"));
    					  if(request.getAttribute("displayType")!=null)
    					    searchAdvForm.setSelDisplayType((String)request.getAttribute("displayType"));

    					  
    					   String offset =  request.getParameter("offset");
    					   String rowSize =  request.getParameter("rowSize");
    					   
    					   log.info("mediaType="+searchAdvForm.getSelMediaType());
    					   log.info("displayType="+searchAdvForm.getSelDisplayType());
    					   log.info("offset="+offset);
    					   log.info("rowSize="+rowSize);

    					   List mediaLists = advBean.searchDimByMediaAndSubTypeId(searchAdvForm.getSelMediaType(),
    			                           searchAdvForm.getSelDisplayType());			
    			                   
    			                   for (Iterator it = mediaLists.iterator(); it.hasNext();) {
    			                        HLCAdvertisementVO advVO = (HLCAdvertisementVO) it.next();
    			                        log.info("Advertisement Object ="+advVO);                       
    			                   }
    			                   
    			                   log.info("mediaLists :"+mediaLists); 
    					   
    			                 searchAdvForm.setResults(mediaLists) ;
    			                
    			                  Vector dispMediaType = (Vector)advBean.getAllMediaDetails();
    					  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));   
    			              if(searchAdvForm.getSelMediaType()!=null && searchAdvForm.getSelMediaType().trim().length()>0)   {  
    			                  Vector displayTypes = (Vector)advBean.getMediaDisplayTypeDetails(searchAdvForm.getSelMediaType());  
    			                 request.setAttribute("DisplayTypeDetails",getDropDown(displayTypes));
    			              }    
    					// request.setAttribute(mapping.getName(),searchAdvForm);	
    					  
    					   return new ModelAndView("frmAdvDimensionDetailsList");
    		 }
    		 
    		 else if(process.equals("delete")){
    			 String dimensionId =  request.getParameter("dimId");
     	           log.info("dimensionId="+dimensionId);
  		   boolean delDimFlag = advBean.deleteDimDetails(dimensionId);			
  			 log.info("Dimension Detail Deleted Successfully "+delDimFlag);
  			//return mapping.findForward("updateList");  
     		//==============Redirected to Search screen==============================
     				 SearchAdvtForm searchAdvForm = new SearchAdvtForm();
     				 if(request.getAttribute("mediaType")!=null)
     					    searchAdvForm.setSelMediaType((String)request.getAttribute("mediaType"));
     					  if(request.getAttribute("displayType")!=null)
     					    searchAdvForm.setSelDisplayType((String)request.getAttribute("displayType"));

     					  
     					   String offset =  request.getParameter("offset");
     					   String rowSize =  request.getParameter("rowSize");
     					   
     					   log.info("mediaType="+searchAdvForm.getSelMediaType());
     					   log.info("displayType="+searchAdvForm.getSelDisplayType());
     					   log.info("offset="+offset);
     					   log.info("rowSize="+rowSize);

     					   List mediaLists = advBean.searchDimByMediaAndSubTypeId(searchAdvForm.getSelMediaType(),
     			                           searchAdvForm.getSelDisplayType());			
     			                   
     			                   for (Iterator it = mediaLists.iterator(); it.hasNext();) {
     			                        HLCAdvertisementVO advVO = (HLCAdvertisementVO) it.next();
     			                        log.info("Advertisement Object ="+advVO);                       
     			                   }
     			                   
     			                   log.info("mediaLists :"+mediaLists); 
     					   
     			                 searchAdvForm.setResults(mediaLists) ;
     			                
     			                  Vector dispMediaType = (Vector)advBean.getAllMediaDetails();
     					  request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));   
     			              if(searchAdvForm.getSelMediaType()!=null && searchAdvForm.getSelMediaType().trim().length()>0)   {  
     			                  Vector displayTypes = (Vector)advBean.getMediaDisplayTypeDetails(searchAdvForm.getSelMediaType());  
     			                 request.setAttribute("DisplayTypeDetails",getDropDown(displayTypes));
     			              }    
     					// request.setAttribute(mapping.getName(),searchAdvForm);	
     					  
     					   return new ModelAndView("frmAdvDimensionDetailsList");   
    		 }
    		 
    		 
    		 else if(process.equals("newAdd")){
    			 
    			 Vector dispMediaType = (Vector)advBean.getAllMediaDetails();
                 request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                 Vector dispDimensionType =(Vector)advBean.getAllDimensionDetails();
                 request.setAttribute("DispDimensionDetails",getDropDown(dispDimensionType));
                 return new ModelAndView("frmAdvDimensionDetailsAdd");  
                
    		 }
    		 else if(process.equals("advEditDetails")){
    			 
    			 FormAdvertisement  advFormDetail = new FormAdvertisement();
                		   
                 String dimensionId =  request.getParameter("dimId");               
                 log.info("DimensionId="+dimensionId);
                 String[] mediaList = advBean.getDimDetails(dimensionId);	
                 advFormDetail = getFormAdvertisement(mediaList);
                 log.info("FormAdvertisement ="+advFormDetail);

                 Vector dispMediaType = (Vector)advBean.getAllMediaDetails();
                 request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                 
                 Vector displayType = (Vector)advBean.getMediaDisplayTypeDetails(advFormDetail.getSelMediaType());  
                 log.info("Display Type = "+displayType);
                 request.setAttribute("DisplayTypeDetails",getDropDown(displayType));
                 
                 Vector dispSubType = (Vector)advBean.getDisplayTypeFromSubType(advFormDetail.getSelDisplayType());
                 log.info("Display Sub Type = "+dispSubType);
                 request.setAttribute("DisplaySubTypeDetails",getDropDown(dispSubType));
                 
                 Vector dimensionDetails = (Vector)advBean.getAllDimensionDetails();
                 request.setAttribute("DimensionDetails",getDropDown(dimensionDetails));
                 
               // request.setAttribute(mapping.getName(),advFormDetail);
                return new ModelAndView("frmAdvDimensionDetailsEdit");		 
    			 
    		 }
    		 
    		 else if(process.equals("advDisplayDetails")){
    			 
    			 String dimensionId =  request.getParameter("dimId");               
                 log.info("DimensionId="+dimensionId);
                 HLCAdvertisementVO advForm = advBean.getDisplayDetails(dimensionId);	
                 log.info("AdvertisementVO ="+advForm);
                 request.setAttribute("AdvertisementDisplayDetail",advForm);
                 return new ModelAndView("frmAdvDimensionDetailsDisplay");	 			 
                
    		 }
    		 else if(process.equals("advDeleteDetails")){
    			 
    			 String dimensionId =  request.getParameter("dimId");               
                 log.info("DimensionId="+dimensionId);
                 HLCAdvertisementVO advForm = advBean.getDisplayDetails(dimensionId);	
                 log.info("AdvertisementVO ="+advForm);
                 request.setAttribute("AdvertisementDisplayDetail",advForm);
                 return new ModelAndView("frmAdvDimensionDetailsDelete");   		 
    			 
    		 }
    		
    	
    	
         }
         catch(Exception exp)
         {
             log.info((new StringBuilder()).append("In GldkftActionAdvertise :").append(exp.getMessage()).toString());
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
    
    
    private FormAdvertisement getFormAdvertisement(String[] mediaList) {
        FormAdvertisement  advForm = new FormAdvertisement();
        advForm.setDimensionId(mediaList[0]);
advForm.setSelDisplaySubType(mediaList[1]);
        advForm.setSelDimensionType(mediaList[2]);
advForm.setSelMediaType(mediaList[3]);
advForm.setTxtDimensionalName(mediaList[4]);
advForm.setTxtAdvHeight(mediaList[5]);
advForm.setTxtAdvWidth(mediaList[6]);
advForm.setTxtDimensionalUnit(mediaList[7]);
advForm.setImagePath(mediaList[8]);
        advForm.setSelDisplayType(mediaList[9]);
return advForm; 
}
    
    
	}

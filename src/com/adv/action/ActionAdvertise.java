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
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.HLCAdvertisementVO;
import com.hlccommon.util.Debug;
import com.util.OptionsBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;


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

public class ActionAdvertise implements Controller {
 
    private static final String ROOTDIR = "WEB-INF";
    HLCAdvertiseSessionBean advRemote = new HLCAdvertiseSessionBean();
  
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
    	
               HLCAdvertiseSessionBean advRemote = new HLCAdvertiseSessionBean();
     
               Debug.print("ActionAdvertise.create() called ...."); 
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
                 Debug.print("FormAdvertisement ="+advForm);
            
                 
                 //upload the  file                  
                 String rootDir = getServlet().getServletContext().getRealPath(File.separator+ROOTDIR);                                  
                 Debug.print("RootDir="+rootDir);                 
                 String directoryTemp = rootDir+java.io.File.separator +"temp";                                                   
                 String fileName = fileUpload.getFileName();                   
                 String imageFilePath = directoryTemp+File.separator+fileName;                 
                 String imagePath = File.separator+ROOTDIR+File.separator +"temp"+File.separator+fileName;
                 
                 Debug.print("ImagePath="+imagePath);
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
                   Debug.print("NewFilePath ="+newFile.getAbsolutePath());                                                       
                    outFile = new BufferedOutputStream(
                                new FileOutputStream(newFile));
                    outFile.write(fileUpload.getFileData());
 
                } catch (IOException ie) {
                  Debug.print("Error while writing into the file");
                } finally {
                 if(outFile!=null){   
                    outFile.flush();
                    outFile.close();              
                 }  
                } 
                boolean dimFlag = advRemote.createDimDetails(displaySubType,dimensionType,mediaType,dimensionName,dimensionHeight
                         ,dimensionWidth,dimensionUnit,imagePath);
                Debug.print("Dimension Detail created Flag :"+dimFlag);
                if(dimFlag==true){
                    return new ModelAndView("confirmView");
                }
                else{
                    request.setAttribute("err","st");
                    return new ModelAndView("frmAdvDimensionDetailsAdd");
                }
              
                     
          }        
          
      
          /**
           *  /advertise.do?method=update&selMediaType=22&selDisplayType=55
           *
           */

  public ActionForward update(ActionMapping mapping, ActionForm  form,HttpServletRequest request, HttpServletResponse response)
		throws Exception {      

		   String mediaTypeId   =  request.getParameter("selMediaType");
		   String displayTypeId =  request.getParameter("selDisplayType");
	       
		   Debug.print("mediaType="+mediaTypeId);
		   Debug.print("displayType="+displayTypeId);
		   
		    //HLCAdvertiseSessionBean advRemote = initializeEJB(request);

		   Debug.print("ActionAdvertise.update() called ...."); 

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
			 
                       Debug.print("Advertisement Form ="+advForm);
 
		       String[] loadDimension = advRemote.getDimDetails(dimensionId);
                       String loadedImagePath = loadDimension[7];

			 //logging the inputs coming from the GUI
			
			
			 
			 //upload the  file                  
			 String rootDir = getServlet().getServletContext().getRealPath(File.separator+ROOTDIR);                                  
			 Debug.print("RootDir="+rootDir);                 
			 String directoryTemp = rootDir +java.io.File.separator +"temp";                                                   
			 String fileName = fileUpload.getFileName();                   
			 String imageFilePath = directoryTemp+File.separator+fileName;  
                         
			 String imagePath = File.separator+ROOTDIR+java.io.File.separator +"temp"+File.separator+fileName;
			 
			 Debug.print("ImagePath="+imagePath);
			 BufferedOutputStream outFile = null;
			try {                      
				
				File newFile = new File(imageFilePath);  
				Debug.print("NewFilePath ="+newFile.getAbsolutePath());  

				 if (!newFile.exists()) {						
                                    if(fileUpload.getFileData()!=null) {
					  outFile = new BufferedOutputStream(new FileOutputStream(newFile));                                          
					  outFile.write(fileUpload.getFileData());
					  File delFile = new File(directoryTemp+File.separator+loadedImagePath);
					  boolean delFlag =  delFile.delete();
					  if(delFlag)
					    Debug.print("File Successfully Deleted :"+delFile.getAbsolutePath());
                                    }
                                    
                                    imagePath = loadedImagePath;
				 } 


			} catch (IOException ie) {
			  Debug.print("Error while writing into the file");
			} finally {
                            if(outFile!=null){
				outFile.flush();
				outFile.close();              
                            }    
			}   		
                        Debug.print("Update ImagePath="+imagePath);
                        
			boolean dimFlag = advRemote.editDimDetails(dimensionId,displaySubType,dimensionType,mediaType,
				dimensionName,dimensionHeight,dimensionWidth,dimensionUnit,imagePath);
		
			request.setAttribute("mediaType",mediaTypeId);
			request.setAttribute("displayType",displayTypeId);

			 Debug.print("Dimension Detail Update Successfully "+dimFlag);
                         //it will redirect to search page
			return mapping.findForward("updateList");       
	  }        
			
				
          /**
           *  /advertise.do?method=delete&dimId=222
           *
           */
        public ActionForward delete(ActionMapping mapping, ActionForm  form,HttpServletRequest request, HttpServletResponse response)
		throws Exception {  
 		   Debug.print("ActionAdvertise.delete() called ...."); 
		   //HLCAdvertiseSessionRemote advRemote = initializeEJB(request);	   		  		   
		   String dimensionId =  request.getParameter("dimId");
   	           Debug.print("dimensionId="+dimensionId);
		   boolean delDimFlag = advRemote.deleteDimDetails(dimensionId);			
			 Debug.print("Dimension Detail Deleted Successfully "+delDimFlag);
			return mapping.findForward("updateList");       
	  }        
				
      

	
  /*
    *Loading new  page initially prompting to the user for add dimensional details
    *
    */  
        public ActionForward newAdd(ActionMapping mapping, ActionForm  form,HttpServletRequest request, HttpServletResponse response)
		throws Exception {      
               // HLCAdvertiseSessionRemote advRemote = initializeEJB(request);
     
                Debug.print("ActionAdvertise.startUp() called ...."); 
                Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                Vector dispDimensionType =(Vector)advRemote.getAllDimensionDetails();
                request.setAttribute("DispDimensionDetails",getDropDown(dispDimensionType));
                return mapping.findForward("frmAdvDimensionDetailsAdd");   
     }   
        public ActionForward advEditDetails(ActionMapping mapping, ActionForm  form,HttpServletRequest request,
                HttpServletResponse response)
                throws Exception {     
                Debug.print("ActionAdvertise.advEditDetails() called ...."); 
                   
                FormAdvertisement  advFormDetail = new FormAdvertisement();
               // HLCAdvertiseSessionRemote advRemote = initializeEJB(request);		   
                String dimensionId =  request.getParameter("dimId");               
                Debug.print("DimensionId="+dimensionId);
                String[] mediaList = advRemote.getDimDetails(dimensionId);	
                advFormDetail = getFormAdvertisement(mediaList);
                Debug.print("FormAdvertisement ="+advFormDetail);

                Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                request.setAttribute("DisplayMediaDetails",getDropDown(dispMediaType));
                
                Vector displayType = (Vector)advRemote.getMediaDisplayTypeDetails(advFormDetail.getSelMediaType());  
                Debug.print("Display Type = "+displayType);
                request.setAttribute("DisplayTypeDetails",getDropDown(displayType));
                
                Vector dispSubType = (Vector)advRemote.getDisplayTypeFromSubType(advFormDetail.getSelDisplayType());
                Debug.print("Display Sub Type = "+dispSubType);
                request.setAttribute("DisplaySubTypeDetails",getDropDown(dispSubType));
                
                Vector dimensionDetails = (Vector)advRemote.getAllDimensionDetails();
                request.setAttribute("DimensionDetails",getDropDown(dimensionDetails));
                request.setAttribute(mapping.getName(),advFormDetail);
                return mapping.findForward("frmAdvDimensionDetailsEdit");       
	  }     
      
      
        public ActionForward advDisplayDetails(ActionMapping mapping, ActionForm  form,HttpServletRequest request,
                HttpServletResponse response)
                throws Exception {     
		Debug.print("ActionAdvertise.advDisplayDetails() called for displaying the Dimension details...."); 
		
                //HLCAdvertiseSessionRemote advRemote = initializeEJB(request);		   
                String dimensionId =  request.getParameter("dimId");               
                Debug.print("DimensionId="+dimensionId);
                HLCAdvertisementVO advForm = advRemote.getDisplayDetails(dimensionId);	
                Debug.print("AdvertisementVO ="+advForm);
                request.setAttribute("AdvertisementDisplayDetail",advForm);
                return mapping.findForward("frmAdvDetailDisplay");       
	  }     
        public ActionForward advDeleteDetails(ActionMapping mapping, ActionForm  form,HttpServletRequest request,
                HttpServletResponse response)
                throws Exception {     
                Debug.print("ActionAdvertise.advDisplayDetails() called for displaying the Dimension details...."); 
		
                //HLCAdvertiseSessionRemote advRemote = initializeEJB(request);		   
                String dimensionId =  request.getParameter("dimId");               
                Debug.print("DimensionId="+dimensionId);
                HLCAdvertisementVO advForm = advRemote.getDisplayDetails(dimensionId);	
                Debug.print("AdvertisementVO ="+advForm);
                request.setAttribute("AdvertisementDisplayDetail",advForm);
                return mapping.findForward("frmAdvDimensionDetailsDelete");       
	  }     

				 
	 public ActionForward updateCancel(ActionMapping mapping, ActionForm  form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception { 
                Debug.print("ActionAdvertise.updateCancel() called ...."); 
                if(isCancelled(request)){                    
                return mapping.findForward("updateList");      
                }
                return mapping.findForward("updateList"); 
	   } 
           
         public ActionForward addCancel(ActionMapping mapping, ActionForm  form,
		HttpServletRequest request, HttpServletResponse response)
		throws Exception { 
        	Debug.print("ActionAdvertise.addCancel() called ...."); 
		if(isCancelled(request)){                    
		   return mapping.findForward("addList");      
		}
		return mapping.findForward("addList"); 
	   } 
           
         /**
          * Getting the EJB Remote object to access the bean
          */
        
         
         private ArrayList getDropDown(Vector mediaLists){
                ArrayList dropDwonLists = new ArrayList();
                  for (Iterator it = mediaLists.iterator(); it.hasNext();) {
                      String[] keyValue = (String[]) it.next();
                     dropDwonLists.add(new LabelValueBean(keyValue[1],keyValue[0]));                  
                  }    
        return dropDwonLists; 
        }   
     
     
         private AdvertisementFormVO getAdvertisementVO(String[] mediaList) {
                   AdvertisementFormVO  advForm = new AdvertisementFormVO();
                   advForm.setDimensionId(mediaList[0]);
		   advForm.setDisplaySubType(mediaList[1]);
                   advForm.setDimensionType(mediaList[2]);
		   advForm.setMediaType(mediaList[3]);
		   advForm.setDimensionalName(mediaList[4]);
		   advForm.setHeight(mediaList[5]);
		   advForm.setWidth(mediaList[6]);
		   advForm.setDimensionalUnit(mediaList[7]);
		   advForm.setImagePath(mediaList[8]);
         
         return advForm; 
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
//====================================THE END====================================================================================                   

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
// Java Document
/*
 * ActionEventLevel.java
 *
 * Created on December 22, 2006, 5:28 PM
 */

package com.mee.action.master;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hlcmro.org.*;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlccommon.util.Debug;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;
/**
 *
 * @author punitha
 * @version
 */

	public class ActionRefundRuleSubType implements Controller {
   
    /* forward name="success" path="" */
    private final static String SUCCESS = "EditHorseRegistration";
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
     
    try{
        
    	 HLCVaigaiSessionBean vaigaiBean =new HLCVaigaiSessionBean();
                String process= (String) request.getParameter("process");
                Debug.print("Process in Servlet "+process);

                String statusvalue = (String)request.getParameter("status");
                Debug.print("Process in Saved Status "+statusvalue);
             
                HttpSession session = request.getSession(true);


//=============================Add New Refund SubType Level=========================================================               
            
            
            if(process.equals("newRefundSubType")){
                return new ModelAndView("frmMeeRefunSubTypeCreate");
            }
             if(process.equals("newRefundSubListContent")){
                return new ModelAndView("frmMeeRefunSubTypeList");
            }
           
            else if(process.equals("newSubType")){
                boolean result = false;
                boolean txtstatus = false;
                String refundlevel = request.getParameter("txtRefundSubName");
                String refundStatus = request.getParameter("rdstatus");
                Debug.print("refundlevel:" + refundlevel);
                Debug.print("refundStatus:" + refundStatus);
               
               if(refundStatus.equals("true")){
                    txtstatus = true;
               }
               else if(refundStatus.equals("false")){
               txtstatus = false;
               }
                 if(refundlevel!=null){ 
                      refundlevel = refundlevel.trim();
                 }
                result =vaigaiBean.insertRefundRuleSubTypeMaster(refundlevel,txtstatus);
                    if(result==true){
                        return new ModelAndView("frmMeeRefundLevelConf");
                    }
                    else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeRefunSubTypeCreate");
                    }
            }
            
            else if(process.equals("newSubTypeList")){
                String status = null;
                
                if(session.getAttribute("status")!=null){
                    status = (String)session.getAttribute("status");    
                    Debug.print("Inside session.getAttribute(status)");
                }
                                
                
                boolean result = false;
                
                if(request.getParameter("status")!=null){
                    status = (String)request.getParameter("status");
                    Debug.print("Inside request.getParameter(status)");
                }
                
                
                Debug.print("status in list servlet:"+status);
                if(status.equalsIgnoreCase("true")){
                    result = true;
                
                Vector vectObj = (Vector)vaigaiBean.displayAllRefundRuleSubType(result);
                request.setAttribute("DisplayEventLevel",vectObj);
                request.setAttribute("status",status);
                
                session.setAttribute("status",null);
                
                return new ModelAndView("frmMeeRefunSubTypeList");
                }
                if(status.equalsIgnoreCase("false")){
                    result = false;
                
                Vector vectObj = (Vector)vaigaiBean.displayAllRefundRuleSubType(result);
                request.setAttribute("DisplayEventLevel",vectObj);
                request.setAttribute("status",status);
                
                session.setAttribute("status",null);
                
                return new ModelAndView("frmMeeRefunSubTypeList");
                }
                else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeRefunSubTypeList");
                    }
            }
            
                
 
//f//=============================Edit & Delete Refund SubType level=========================================================
            
            else if(process.equals("editRefundLevel")){
                String prolevel = request.getParameter("advDimButton");
                String levelId = request.getParameter("refundListId");
                System.out.print("prolevel:" + prolevel);
                System.out.print("levelId:" + levelId);
                
                    if(prolevel.equals("Edit")){
                        Vector levelObj = (Vector)vaigaiBean.displayRefundRuleSubType(levelId);
                        Debug.print("levelObj.size() :" +levelObj.size());
                        
                        Enumeration enm = levelObj.elements();
                        while(enm.hasMoreElements()){
                            String[] s = (String[])enm.nextElement();
                            Debug.print("s[0] :" +s[0]);
                            Debug.print("s[1] :" +s[1]);
                            
                            request.setAttribute("editRefundSublevel",s);
                            
                        }
                        return new ModelAndView("frmMeeRefunSubTypeEdit");
                    }
                    else if(prolevel.equals("Delete")){
                        Vector levelObj = (Vector)vaigaiBean.displayRefundRuleSubType(levelId);
                        request.setAttribute("deleteEventLevel",levelObj);
                        return new ModelAndView("frmMeeRefunSubTypeDelete");
                    }
            }
//=============================Edit Exist Refund SubType Level=========================================================
            
            else if(process.equals("Update")){
                 boolean result = false;
                    String refundListId= request.getParameter("refundListId");
                    String refundListName = request.getParameter("refundListName");
                    String refundStatus = request.getParameter("rdstatus");
                    Debug.print("refundListId in servlet:" + refundListId);
                    Debug.print("refundListName in servlet:" + refundListName);
                    Debug.print("refundStatus in servlet:"+refundStatus);
                      boolean txtstatus = false;
               
                       if(refundStatus.equals("true")){
                            txtstatus = true;
                       }
                       else if(refundStatus.equals("false")){
                       txtstatus = false;
                       }
                
                
                    result = vaigaiBean.updateRefundRuleSubMaster(refundListName,refundListId,txtstatus);
                    if(result==true){
                       return new ModelAndView("frmMeeRefundSubTypeLevelConfUpt"); 
                    }
                    else{

			String levelId = request.getParameter("refundListId");
                        Vector levelObj = (Vector)vaigaiBean.displayRefundRuleSubType(levelId);
                        Debug.print("levelObj.size() :" +levelObj.size());
                        System.out.print("levelId:" + levelId);
                           
                        Enumeration enm = levelObj.elements();
                        while(enm.hasMoreElements()){
                            String[] s = (String[])enm.nextElement();
                            Debug.print("s[0] :" +s[0]);
                            Debug.print("s[1] :" +s[1]);
                            
                            request.setAttribute("editRefundSublevel",s);
                        }

                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeRefunSubTypeEdit");
                    }
            }
//=============================Deactivate Refund SubType Level=========================================================  
            
             else if(process.equals("Deactivate")){
                    String refundListId= request.getParameter("refundListId");
                    System.out.print("refundListId:" + refundListId);
                    boolean resultDelete = vaigaiBean.deleteRefundRuleSubMaster(refundListId);
                    
                        Debug.print("statusvalue in Deactive:"+statusvalue);
                        session.setAttribute("status",statusvalue);
                    
                    if(resultDelete == true){
                        Debug.print(" Succeffully Deativated : "+resultDelete);
                        return new ModelAndView("frmMeeRefundSubTypeStatusConf"); 
                    }
                    
                    else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeRefunSubTypeList"); 
                   }
             }
//=============================Activate Refund SubType Level=========================================================  
            
             else if(process.equals("Activate")){
                String refundListId= request.getParameter("refundListId");
                boolean bol = vaigaiBean.activateRefundRuleSubType(refundListId);
                
                    
                    Debug.print("statusvalue in Active:"+statusvalue);
                    session.setAttribute("status",statusvalue);
                    
                            
            if (bol == true){
                Debug.print(" Succeffully Activated : "+bol);
                return new ModelAndView("frmMeeRefundSubTypeStatusConf");
                 }
                else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeRefunSubTypeList"); 
                   }
             }
  //=================================Delete Event Level====================================================================
        }
        catch(Exception e){
            System.out.print("Exception :" + e.getMessage());
        }
 
 return null;
        
    }
}

			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			

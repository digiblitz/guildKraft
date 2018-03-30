/*
 * Program Name     :   MemEventLevelMapAction.java
 * Created Date     :   April 10, 2007, 10.00 AM
 * Author           :   punitha
 * Copy Right       :   digiBlitz Technologies Inc /  digiBlitz Technologies (P) Ltd
 * Version          :   1.15
 * CopyRightInformation:
 *  (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
 *  916 W. Broad Street Suite 205, FallsChurch, VA 22046.
 *  This document is protected by copyright. No part of this document may be reproduced in any form by any means without
 *  prior written authorization of Sun and its licensors. if any.
 *  The information described in this document may be protected by one or more U.S.patents.foreign patents,or
 *  pending applications.
 */

package com.mee.action;

import com.mrm.action.*;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;

import com.hlcmro.display.HLCVaigaiStatelessBean;
import com.hlcmro.org.*;
import com.hlccommon.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
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


	public class MemEventLevelMapAction implements Controller {    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
       try {
    	   
    	   HLCkaverySessionBeanStatlessBean kaveryStatelessBean =new HLCkaverySessionBeanStatlessBean();
    	   HLCVaigaiStatelessBean vaigaiBean =new HLCVaigaiStatelessBean();  
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

            String process = request.getParameter("process");
            Debug.print("Process in Servlet " + process);
                  
            if(process!=null && process.equalsIgnoreCase("newMap")) {
                Debug.print("MemEventLevelMapAction of :" +process+ "calling................. ");
                ArrayList horsememtypVect = (ArrayList)kaveryStatelessBean.displayAllMembershipType();
                request.setAttribute("horsememberVect", horsememtypVect);
                Vector allLevelsVect = (Vector)vaigaiBean.getAllLevels();
                request.setAttribute("allLevelsVect", allLevelsVect);
                Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                request.setAttribute("allTypesVect", allTypesVect);
                Debug.print("Sucessfully comes from Admin List");
                return new ModelAndView("frmMemEventLevelMap");
            }
            /*
             * getting membership Type Id from membership/frmMemEventLevelMap.jsp 
             *  based on that we are getting all the levels:
             */
            else if(process!=null && process.equalsIgnoreCase("mapProcess")) {
                Debug.print("MemEventLevelMapAction of :" +   process  + "calling................. ");
                    try{
                        String memberId = request.getParameter("membershipTypeId");
                        if(memberId==null || memberId.trim().length()==0){
                            memberId = (String)request.getAttribute("memberId");
                        }
                        if(memberId!=null && memberId.trim().length()!=0){
                            request.setAttribute("memberId", memberId);
                            
                            ArrayList mapMemLevelDetails = (ArrayList)kaveryStatelessBean.getMapDetForMemberAndEventLevel(memberId);
                            request.setAttribute("mapMemLevelDetails", mapMemLevelDetails);
                            
                            ArrayList horsememtypVect = (ArrayList)kaveryStatelessBean.displayAllMembershipType();
                            request.setAttribute("horsememberVect", horsememtypVect);
                            
                            Vector allLevelsVect = (Vector)vaigaiBean.getAllLevels();
                            request.setAttribute("allLevelsVect", allLevelsVect);
                            
                            Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                            request.setAttribute("allTypesVect", allTypesVect);
                            
                            Debug.print("MemEventLevelMapAction.mapProcess() sucessfully comes from servlet.");
                            return new ModelAndView("frmMemEventLevelMap");
                        }
                    }
                    catch(Exception eDisp){
                        Debug.print("while getting roleEntSelect:" + eDisp);
                    }

                }
            
            /*
             * getting membership type id and  event level id from  frmMemEventLevelMap.jsp
             * to map the mebership type id and event level id into mapping table with the help
             * of business methods.
             *
             */
            
             else if(process!=null && process.equals("mappingMemLevel")){
                    try{
                        Debug.print("MemEventLevelMapAction of :" + process  + "calling................. ");
                        String memberId = request.getParameter("memberId");
                        String eventTypeId = request.getParameter("eventTypeId");
                        Debug.print("MemEventLevelMapAction MemberId:" + memberId);
                        request.setAttribute("memberId",memberId);
                        String entityIds = request.getParameter("entityIds");
                        Debug.print("entityIds:" + entityIds);
                        StringTokenizer strTkns = new StringTokenizer(entityIds,"#");
                        ArrayList eventLevelList = new ArrayList();
                         boolean result = false;
                        while(strTkns.hasMoreTokens()){
                            try{
                                String entityId = (String)strTkns.nextToken();
                                if(entityId!=null && entityId.trim().length()!=0){
                                    Debug.print("MemEventLevelMapAction.mappingMemLevel() Added from Stokenizer:" + entityId);
                                    eventLevelList.add(entityId);
                                }
                            }
                            catch(Exception e){
                                Debug.print("Exception while spliting entityIds MemEventLevelMapAction.mappingRoleEnt() :" + e);
                            }
                        }
                       
                        if(memberId!=null && memberId.trim().length()!=0){
                                 Debug.print("MemEventLevelMapAction.mappingMemLevel() All Ids Are valid");
                                 result =kaveryStatelessBean.generateMappingMemWithEventLevel(memberId,eventTypeId,eventLevelList);
                                 Debug.print("result in map action :" + result);
                                 if(result==true){
                                     Debug.print("MemEventLevelMapAction.mappingMemLevel() sucessfully comes from servlet.");
                                     request.setAttribute("memberId",memberId);
                                     
                                     Debug.print("MemEventLevelMapAction of :" +   process  + "calling................. ");
                                     try{
                                         String memberId1 = request.getParameter("membershipTypeId");
                                         if(memberId1==null || memberId1.trim().length()==0){
                                             memberId = (String)request.getAttribute("memberId");
                                         }
                                         if(memberId!=null && memberId.trim().length()!=0){
                                             request.setAttribute("memberId", memberId);
                                             
                                             ArrayList mapMemLevelDetails = (ArrayList)kaveryStatelessBean.getMapDetForMemberAndEventLevel(memberId);
                                             request.setAttribute("mapMemLevelDetails", mapMemLevelDetails);
                                             
                                             ArrayList horsememtypVect = (ArrayList)kaveryStatelessBean.displayAllMembershipType();
                                             request.setAttribute("horsememberVect", horsememtypVect);
                                             
                                             Vector allLevelsVect = (Vector)vaigaiBean.getAllLevels();
                                             request.setAttribute("allLevelsVect", allLevelsVect);
                                             
                                             Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                                             request.setAttribute("allTypesVect", allTypesVect);
                                             
                                             Debug.print("MemEventLevelMapAction.mapProcess() sucessfully comes from servlet.");
                                             return new ModelAndView("frmMemEventLevelMap");
                                         }
                                     }
                                     catch(Exception eDisp){
                                         Debug.print("while getting roleEntSelect:" + eDisp);
                                     }                            
                                     
                                   
                                 }
                        }
                        else{
                        	return new ModelAndView("index");
                        }
                       
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while getting mappingRoleEnt:" + eDisp);
                    }
                   
                }
         /*
          *  Init load mapping based on the priority
          */   
            
            if(process!=null && process.equalsIgnoreCase("newPriorityMap")) {
                Debug.print("MemEventLevelMapAction of :" +process+ "calling................. ");
                 ArrayList DispCompResult = (ArrayList)kaveryStatelessBean.displayAllCompResultDetails();
                 request.setAttribute("DispCompResult", DispCompResult);
                Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                request.setAttribute("allTypesVect", allTypesVect);
                Debug.print("Sucessfully comes from Admin List");
                return new ModelAndView("frmMemPriorityMap");
            }
             /*
             * getting membership Type Id from membership/frmMemEventLevelMap.jsp 
             *  based on that we are getting all the levels:
             */
            else if(process!=null && process.equalsIgnoreCase("mapPriorityProcess")) {
                Debug.print("MemEventLevelMapAction of :" +   process  + "calling................. ");
                    try{
                        String eventTypeId = request.getParameter("eventTypeId");
                        Debug.print("=======eventTypeId:" + eventTypeId);
                        
                        if(eventTypeId==null || eventTypeId.trim().length()==0){
                            eventTypeId = (String)request.getAttribute("eventTypeId");
                        }
                         Debug.print("=======eventTypeId:" + eventTypeId);
                        if(eventTypeId!=null && eventTypeId.trim().length()!=0){
                            request.setAttribute("eventTypeId", eventTypeId);
                            
                            ArrayList mapEventTypeDetails = (ArrayList)kaveryStatelessBean.getMappingDetailsForEventTypeAndCompResult(eventTypeId);
                            request.setAttribute("mapEventTypeDetails", mapEventTypeDetails);
                            
                            ArrayList DispCompResult = (ArrayList)kaveryStatelessBean.displayAllCompResultDetails();
                            request.setAttribute("DispCompResult", DispCompResult);
                            
                            Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                            request.setAttribute("allTypesVect", allTypesVect);
                            
                            Debug.print("MemEventLevelMapAction.mapPriorityProcess() sucessfully comes from servlet.");
                        }
                        return new ModelAndView("frmMemPriorityMap");
                    }
                    catch(Exception eDisp){
                        Debug.print("while getting roleEntSelect:" + eDisp);
                    }

                }
            
            
            /*
             * getting Event type id and  comp result id from  frmMemPriorityMap.jsp
             * to map the Event type id and comp result id ,priority number into mapping table with the help
             * of business methods.
             *
             */
            
             else if(process!=null && process.equals("mappingPriorityLevel")){
                    try{
                        Debug.print("MemEventLevelMapAction of :" + process  + "calling................. ");
                        String EventId = request.getParameter("EventId");
                        Debug.print("MemEventLevelMapAction EventId:" + EventId);
                        request.setAttribute("eventTypeId",EventId);
                        String entityIds = request.getParameter("entityIds");
                        Debug.print("entityIds:" + entityIds);
                        StringTokenizer strTkns = new StringTokenizer(entityIds,"#");
                        ArrayList compResultFieldList = new ArrayList();
                        boolean result = false;
                        while(strTkns.hasMoreTokens()){
                            try{
                                String comReusltIds = (String)strTkns.nextToken();
                                StringTokenizer strTknsExl = new StringTokenizer(comReusltIds,"!");
                                String compList[] = {};
                                if(strTknsExl.hasMoreTokens()){
                                    String resultId = (String)strTknsExl.nextToken();
                                    String priority = (String)strTknsExl.nextToken();
                                    if(priority==null || priority.trim().length()==0) {
                                        priority = "0";
                                    }
                                    String tempCompList[] = {resultId, priority};
                                    Debug.print("resultId:" + resultId);
                                    Debug.print("priority:" + priority);
                                    compList = tempCompList;
                                }
                                if(compList!=null && compList.length!=0){
                                    Debug.print("MemEventLevelMapAction.mappingPriorityLevel() Added from Stokenizer:" + compList.length);
                                    compResultFieldList.add(compList);
                                }
                            }
                            catch(Exception e){
                                Debug.print("Exception while spliting privilegeIds MemEventLevelMapAction.mappingRoleEnt() :" + e);
                            }
                        }
                       
                        if(EventId!=null && EventId.trim().length()!=0){
                                 Debug.print("MemEventLevelMapAction.mappingPriorityLevel() All Ids Are valid");
                                 result =kaveryStatelessBean.generateMappingEventTypeWithResultFields(EventId, compResultFieldList);
                                 Debug.print("result in map action :" + result);
                                  if(result==true){
                                        Debug.print("MemEventLevelMapAction.mappingPriorityLevel() sucessfully comes from servlet.");
                                        request.setAttribute("eventTypeId",EventId);
                                       // request.setAttribute("mapPriorityProcess","mapPriorityProcess");
                                        
                                        try{
                                            String eventTypeId = request.getParameter("eventTypeId");
                                            Debug.print("=======eventTypeId:" + eventTypeId);
                                            
                                            if(eventTypeId==null || eventTypeId.trim().length()==0){
                                                eventTypeId = (String)request.getAttribute("eventTypeId");
                                            }
                                             Debug.print("=======eventTypeId:" + eventTypeId);
                                            if(eventTypeId!=null && eventTypeId.trim().length()!=0){
                                                request.setAttribute("eventTypeId", eventTypeId);
                                                
                                                ArrayList mapEventTypeDetails = (ArrayList)kaveryStatelessBean.getMappingDetailsForEventTypeAndCompResult(eventTypeId);
                                                request.setAttribute("mapEventTypeDetails", mapEventTypeDetails);
                                                
                                                ArrayList DispCompResult = (ArrayList)kaveryStatelessBean.displayAllCompResultDetails();
                                                request.setAttribute("DispCompResult", DispCompResult);
                                                
                                                Vector allTypesVect = (Vector)vaigaiBean.getAllTypes();
                                                request.setAttribute("allTypesVect", allTypesVect);
                                                
                                                Debug.print("MemEventLevelMapAction.mapPriorityProcess() sucessfully comes from servlet.");
                                            }
                                            return new ModelAndView("frmMemPriorityMap");
                                        }
                                        catch(Exception eDisp){
                                            Debug.print("while getting roleEntSelect:" + eDisp);
                                        }                                      
                                  
                                 }
                                  else{
                                     Debug.print("failed:::::::::");
                                  }
                        }
                       
                        
                    }
                    catch(Exception eDisp){
                        Debug.print("while getting mappingRoleEnt:" + eDisp);
                    }
                   
                }
             
        } catch(Exception e){
            System.out.println("Exception in MemEventLevelMapAction Action: " + e.toString());
        }
        return null;
    }
}
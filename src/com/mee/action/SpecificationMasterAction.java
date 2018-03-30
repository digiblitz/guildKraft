/*
 * SpecificationMasterAction.java
 *
 * Created on September 21, 2007, 1:58 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;

import com.hlcmeeting.util.Debug;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.*;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;
/**
 *
 * @author Dhivya
 * @version
 */


	public class SpecificationMasterAction implements Controller {   
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
        
        try {
        	HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            
            HttpSession session = request.getSession(true);
            
            System.out.println("\n after InitialContext inside icp user Meeting list action...\n");
            
            String specProcess = request.getParameter("specProcess");
            Debug.print("specProcess In Servlet:" + specProcess);
                                  
            if(specProcess!=null && specProcess.equals("initSpec")){
                
                Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                Debug.print("Event Details are" + eventObj);
                request.setAttribute("eventObj",eventObj);
                
                return new ModelAndView("frmCreateSpecificationType");
                
            }
            
            
            else if(specProcess!=null && specProcess.equals("insertSpec")){
                
                String selEventType=request.getParameter("selEventType");
                Debug.print("selEventType : "+selEventType);
                String txtSpec = request.getParameter("txtSpec");
                Debug.print("txtSpec : "+txtSpec);
                String txtDesc = request.getParameter("txtDesc");
                Debug.print("txtDesc : "+txtDesc);
                boolean bol = false;
                
                if(selEventType!=null && selEventType.trim().length()!=0 && txtSpec!=null && txtSpec.trim().length()!=0){
                    
                    boolean exists =vaigaiMeetingBean.isSpecNameExist(selEventType,txtSpec);
                    if(exists == false){
                        bol = vaigaiMeetingBean.addAnnualSpecificationDetails(selEventType,txtSpec,txtDesc);
                        Debug.print("result in servlet: "+bol);
                        if(bol == true){
                        	return new ModelAndView("frmCreateSuccess");
                        } else{
                            Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                            Debug.print("Event Details are" + eventObj);
                            request.setAttribute("eventObj",eventObj);
                            request.setAttribute("err","st");
                            return new ModelAndView("frmCreateSpecificationType");
                        }
                    } else{
                        Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                        Debug.print("Event Details are" + eventObj);
                        request.setAttribute("eventObj",eventObj);
                        request.setAttribute("err","st");
                        return new ModelAndView("frmCreateSpecificationType");
                    }
                    
                }
                
            }
            //=========================================List========================================
            
            else if(specProcess!=null && specProcess.equalsIgnoreCase("toListSpecMaster")){
                Debug.print("Inside SpecificationMasterAction calling specProcess::"+specProcess);
                return new ModelAndView("frmSpecTypeMasterListing");
            } else if(specProcess!=null && specProcess.equalsIgnoreCase("listSpecMaster")){
                Debug.print("Inside SpecificationMasterAction calling specProcess::"+specProcess);
                ArrayList objAllSpecDetails = new ArrayList();
                String status = request.getParameter("status");
                boolean stat = false;
                if(status!=null ){
                    stat = Boolean.parseBoolean(status);
                }
                objAllSpecDetails = vaigaiMeetingBean.displayAllSpecificationDetails(stat);
                request.setAttribute("status",status);
                request.setAttribute("objAllSpecDetails",objAllSpecDetails);
                return new ModelAndView("frmSpecTypeMasterListing");
                
            } else if(specProcess!=null && specProcess.equalsIgnoreCase("selectSpecDet")){
                Debug.print("Inside SpecificationMasterAction calling specProcess::"+specProcess);
                String status = request.getParameter("btnSubmit");
                String specId = request.getParameter("specId");
                boolean activityStatus = false;
                if(status!=null && status.equalsIgnoreCase("Edit")){
                    Debug.print("Inside SpecificationMasterAction calling status::"+status);
                    Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                    Debug.print("Event Details are" + eventObj);
                    request.setAttribute("eventObj",eventObj);
                    String specId1=request.getParameter("specId");
                    Debug.print("specId1 : "+specId1);
                    ArrayList objSingleSpecDet = vaigaiMeetingBean.displaySingleSpecDetail(specId1);
                    Debug.print("ArrayList Returned::>"+objSingleSpecDet);
                    
                    request.setAttribute("objSingleSpecDet",objSingleSpecDet);
                    
                    return new ModelAndView("frmEditSpecificationType");           
                   
                }else if(status!=null && status.equalsIgnoreCase("Activate")){
                    Debug.print("Inside SpecificationMasterAction calling status::"+status);
                    if(specId!=null && specId.trim().length()!=0){
                        activityStatus = vaigaiMeetingBean.activateSpecDetail(specId);
                    }
                    if(!activityStatus){
                        request.setAttribute("Error","Error");
                    }
                    return new ModelAndView("frmSpecTypeMasterListing");
                }else if(status!=null && status.equalsIgnoreCase("Deactivate")){
                    Debug.print("Inside SpecificationMasterAction calling status::"+status);
                    if(specId!=null && specId.trim().length()!=0){
                        activityStatus = vaigaiMeetingBean.deleteSpecDetail(specId);
                    }
                    if(!activityStatus){
                        request.setAttribute("Error","Error");
                    }
                    return new ModelAndView("frmSpecTypeMasterListing");
                }
                
            }
            
            //============================================Edit==========================================
            
            if(specProcess!=null && specProcess.equals("initUpdate")){
                
                Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                Debug.print("Event Details are" + eventObj);
                request.setAttribute("eventObj",eventObj);
                String specId=request.getParameter("specId");
                Debug.print("specId : "+specId);
                ArrayList objSingleSpecDet = vaigaiMeetingBean.displaySingleSpecDetail(specId);
                Debug.print("ArrayList Returned::>"+objSingleSpecDet);
                
                request.setAttribute("objSingleSpecDet",objSingleSpecDet);
                
                return new ModelAndView("frmEditSpecificationType");
                
            }
            
            else if(specProcess!=null && specProcess.equals("update")){
                
                String specId=request.getParameter("specId");
                Debug.print("specId : "+specId);     
                String eventId=request.getParameter("eventTypeId");
                Debug.print("eventName : "+eventId);
                String txtSpec = request.getParameter("txtSpec");
                Debug.print("txtSpec : "+txtSpec);
                String txtDesc = request.getParameter("txtDesc");
                Debug.print("txtDesc : "+txtDesc);
                
                boolean result=false;
                if(specId!=null && specId.trim().length()!=0 && eventId!=null && eventId.trim().length()!=0){
                    
                    
                    if(specId!=null && specId.trim().length()!=0 && txtSpec!=null && txtSpec.trim().length()!=0){
                        
                        boolean exists1 =vaigaiMeetingBean.isEditSpecNameExist(specId,eventId,txtSpec);
                        if(exists1 == false){
                            result = vaigaiMeetingBean.editSpecDetail(specId,eventId,txtSpec,txtDesc);
                            Debug.print("result in servlet: "+result);
                            if(result == true){
                            	return new ModelAndView("frmSpecTypeMasterListing");
                            } else{
                                Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                                Debug.print("Event Details are" + eventObj);
                                request.setAttribute("eventObj",eventObj);
                                request.setAttribute("err","st");
                                ArrayList objSingleSpecDet = vaigaiMeetingBean.displaySingleSpecDetail(specId);
                                Debug.print("ArrayList Returned::>"+objSingleSpecDet);
                                request.setAttribute("objSingleSpecDet",objSingleSpecDet);
                                return new ModelAndView("frmEditSpecificationType");
                            }
                        } else{
                            Vector eventObj = (Vector)vaigaiMeetingBean.displayAnnualActivityTypeMaster();
                            Debug.print("Event Details are" + eventObj);
                            request.setAttribute("eventObj",eventObj);
                            request.setAttribute("err","st");
                            ArrayList objSingleSpecDet = vaigaiMeetingBean.displaySingleSpecDetail(specId);
                            Debug.print("ArrayList Returned::>"+objSingleSpecDet);
                            request.setAttribute("objSingleSpecDet",objSingleSpecDet);
                            return new ModelAndView("frmEditSpecificationType");
                        }
                        
                    }
                    
                }
            }
            
            
        } catch(Exception e){
            System.out.println("Exception"+e);
        }
        return null;
        
    }
}

/*
 * AddMeePriceDetailMasterAction.java
 *
 * Created on September 23, 2006, 11:44 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;

import com.hlcform.stateless.HLCkaverystatelessBean;

import com.hlcmeeting.util.Debug;
import com.hlcmeeting.session.HLCVaigaiSessionBean;

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
 * @author harmohan
 */

	public class AddMeePriceDetailMasterAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
			 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
	            
        	 HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
        try
        {
       
        	
            HttpSession session = request.getSession(true);

            System.out.println("\n after InitialContext inside icp user Meeting list action...\n");

            String priceMasterProcess = request.getParameter("priceMasterProcess");
            Debug.print("Activity Category Name In Servlet:" + priceMasterProcess);
            
            String specificationId = null;
            String userTypeId = null;
            String eventRegistrationTypeId = null;
            double dueDatePrice = 0;
            double aftDueDatePrice = 0;
             
            if(priceMasterProcess.equals("addPriceMaster")){
                
                eventRegistrationTypeId = request.getParameter("selCatagoryType");
                Debug.print("eventRegistrationTypeId : "+eventRegistrationTypeId);
                specificationId = request.getParameter("selSpecification");
                Debug.print("specificationId : "+specificationId);
                userTypeId = request.getParameter("selUserType");
                Debug.print(" userTypeId : "+userTypeId);
                dueDatePrice = Double.valueOf(request.getParameter("duePrice")).doubleValue();
                Debug.print(" dueDatePrice : "+dueDatePrice);
                aftDueDatePrice = Double.valueOf(request.getParameter("afterPrice")).doubleValue();
                Debug.print("aftDueDatePrice : "+aftDueDatePrice);
                try {
                    boolean bol = vaigaiMeetingBean.addPriceDetail(specificationId,userTypeId,
                            eventRegistrationTypeId,dueDatePrice,aftDueDatePrice);
                    Debug.print("Result for add in Servlet : "+bol);

                    if (bol == true){
                    	return new ModelAndView("mee-confirmation-price-master");
                    }else {
                        request.setAttribute("err","st");
                        
                        Vector nobj = (Vector) vaigaiMeetingBean.displayEventRegistrationTypeMaster();
                        Debug.print("DisplayActivityCatgory Details arel" + nobj);
                        request.setAttribute("meeCataTypeVect", nobj);

                        Vector vObj = (Vector) humanMemb.displayMemberType();

                        Debug.print("DisplayUserDetails arel" + vObj);
                        request.setAttribute("userTypeVec", vObj);

                        return new ModelAndView("mee-price-detail-master-Ajax");      
                        
                    }
                }catch (Exception e){
                    Debug.print(" Error : "+e.getMessage());
                }
            }
            else if(priceMasterProcess.equals("initPriceList")){
                Vector nobj = (Vector)vaigaiMeetingBean.displayEventRegistrationTypeMaster();
                request.setAttribute("eventTypeList",nobj);
               
                //Vector vObj =(Vector)vaigaiBean.displaySpecification1();
                //session.setAttribute("specList",vObj);
                Debug.print("sucessfully comes from initPriceList");
                return new ModelAndView("frmMeeAdminAnnConPriceDetailListings");
            }
            
            else if(priceMasterProcess.equals("selectPriceList")){
                ArrayList priceList = new ArrayList();
                String eventTypeId = request.getParameter("eventTypeId");
                String specId = request.getParameter("specId");
                if(eventTypeId!=null && eventTypeId.trim().length()!=0 && specId!=null && specId.trim().length()!=0){
                     priceList = vaigaiMeetingBean.displayPriceDetails(eventTypeId, specId);
                }
                Vector nobj = (Vector)vaigaiMeetingBean.displayEventRegistrationTypeMaster();
                request.setAttribute("eventTypeList",nobj);
               
                Vector vObj =(Vector)vaigaiMeetingBean.displaySpecification1();
                request.setAttribute("specList",vObj);
                
                request.setAttribute("eventTypeId",eventTypeId);
                request.setAttribute("specId",specId);
                request.setAttribute("priceListView",priceList);
                Debug.print("sucessfully comes from selectPriceList");
                return new ModelAndView("frmMeeAdminAnnConPriceDetailListings");
            }
            
            else if(priceMasterProcess.equals("viewEditPriceList")){
                ArrayList priceList = new ArrayList();
                String btnSubmit = request.getParameter("btnSubmit");
                String priceDetId = request.getParameter("priceDetId");
                
                Vector nobj = (Vector)vaigaiMeetingBean.displayEventRegistrationTypeMaster();
                request.setAttribute("eventTypeList",nobj);
               
                Vector vObj =(Vector)vaigaiMeetingBean.displaySpecification1();
                request.setAttribute("specList",vObj);
                
                //Vector userObj =(Vector)vaigaiMeetingBean.displayUserType();
                Vector userObj =(Vector)humanMemb.displayMemberType();
                request.setAttribute("userTypeVec",userObj);
               
                String[] priceDetail = {};
                if(priceDetId!=null && priceDetId.trim().length()!=0){
                    String [] priceListDet = vaigaiMeetingBean.displayPriceDetailsById(priceDetId);
                    priceDetail = priceListDet;
                }
                request.setAttribute("priceDetails",priceDetail);
                
                if(btnSubmit.equals("Edit")){
                	return new ModelAndView("frmMeeAdminAnnConPriceDetailEdit");
                }
                else if(btnSubmit.equals("View")){
                	return new ModelAndView("frmMeeAdminAnnConPriceDetailView");
                }
               Debug.print("sucessfully comes from viewEditPriceList");
               return new ModelAndView("frmMeeAdminAnnConPriceDetailListings");
            }
            
             else if(priceMasterProcess.equals("editPriceMaster")){
                String priceId = request.getParameter("priceDetId");
                Debug.print("priceId : "+priceId);
                eventRegistrationTypeId = request.getParameter("eventTypeId");
                Debug.print("eventTypeId : "+eventRegistrationTypeId);
                specificationId = request.getParameter("specId");
                Debug.print("specId : "+specificationId);
                userTypeId = request.getParameter("selUserType");
                Debug.print(" userTypeId : "+userTypeId);
                dueDatePrice = Double.valueOf(request.getParameter("duePrice")).doubleValue();
                Debug.print(" dueDatePrice : "+dueDatePrice);
                aftDueDatePrice = Double.valueOf(request.getParameter("afterPrice")).doubleValue();
                Debug.print("aftDueDatePrice : "+aftDueDatePrice);
                ArrayList priceList = new ArrayList();
                
                if(eventRegistrationTypeId!=null && eventRegistrationTypeId.trim().length()!=0 && specificationId!=null && specificationId.trim().length()!=0){
                     priceList = vaigaiMeetingBean.displayPriceDetails(eventRegistrationTypeId, specificationId);
                }
                
             
                
                Vector nobj = (Vector)vaigaiMeetingBean.displayEventRegistrationTypeMaster();
                request.setAttribute("eventTypeList",nobj);

                Vector vObj =(Vector)vaigaiMeetingBean.displaySpecification1();
                request.setAttribute("specList",vObj);

               // Vector userObj =(Vector)vaigaiMeetingBean.displayUserType();
                Vector userObj =(Vector)humanMemb.displayMemberType();
                request.setAttribute("userTypeVec",userObj);

               
                try {
                    if(priceId!=null && priceId.trim().length() !=0){
                        boolean bol = vaigaiMeetingBean.editPriceDetail(priceId,specificationId,userTypeId,
                                eventRegistrationTypeId,dueDatePrice,aftDueDatePrice);
                        Debug.print("Result for edit in Servlet : "+bol);
                        
                        
                       if (bol == true){
                             if(eventRegistrationTypeId!=null && eventRegistrationTypeId.trim().length()!=0 && specificationId!=null && specificationId.trim().length()!=0){
                             priceList = vaigaiMeetingBean.displayPriceDetails(eventRegistrationTypeId, specificationId);
                            }
                            request.setAttribute("eventTypeId",eventRegistrationTypeId);
                            request.setAttribute("specId",specificationId);
                            request.setAttribute("priceListView",priceList);
                            return new ModelAndView("frmMeeAdminAnnConPriceDetailListings");
                        }else {
                            request.setAttribute("err","st");
                            String[] priceDetail = {};
                            if(priceId!=null && priceId.trim().length()!=0){
                                String [] priceListDet = vaigaiMeetingBean.displayPriceDetailsById(priceId);
                                priceDetail = priceListDet;
                            }
                            request.setAttribute("priceDetails",priceDetail);
                            return new ModelAndView("frmMeeAdminAnnConPriceDetailEdit");
                        }
                    }
                }catch (Exception e){
                    Debug.print(" Error : "+e.getMessage());
                }
            }
            
            
           
    }catch(Exception ex)
            {
                System.err.println("Caught an exception."+ex.getMessage());
                ex.printStackTrace();
            }
        Vector nobj = (Vector) vaigaiMeetingBean.displayEventRegistrationTypeMaster();
        Debug.print("DisplayActivityCatgory Details arel" + nobj);
        request.setAttribute("meeCataTypeVect", nobj);

        Vector vObj = (Vector) humanMemb.displayMemberType();

        Debug.print("DisplayUserDetails arel" + vObj);
        request.setAttribute("userTypeVec", vObj);

        return new ModelAndView("mee-price-detail-master-Ajax");  
    }
    
}

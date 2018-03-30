/*
 * ActionAdvertisement.java
 *
 * Created on September 1, 2006, 10:25 AM
 */
package com.mee.action;
//import com.adv.actionform.FormAdvertisement;
import com.adv.actionform.AdvertisementFormVO;
import com.adv.actionform.SearchAdvtForm;
import com.hlccommon.util.Debug;
import com.hlchorse.form.display.*;

import com.hlcmeeting.session.HLCVaigaiSessionBean;

import com.mee.actionform.AdminOrgListingForm;
import com.mee.actionform.MemberContactDetails;
import com.util.AttributeConstant;

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
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
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


	public class AdminOrgListingAction implements Controller {
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
			 try{
				 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean(); 
				 String cmd = request.getParameter("method");	
				 
				 if(cmd.equalsIgnoreCase("initAdmin")){
					 
					  Debug.print("AdminOrgListingAction.initAdmin() called ...."); 
						
					  return new ModelAndView("frmMeeAdminICPRegiListing");  			 
					
				 }
				 else if(cmd.equalsIgnoreCase("initOrg")){
					 Debug.print("AdminOrgListingAction.initOrg() called ...."); 
						
					 return new ModelAndView("frmMeeOrgICPRegiListing");      			 
					 
				 } else if(cmd.equalsIgnoreCase("searchAdmin")){
					 
					  Debug.print("AdminOrgListingAction.searchAdmin() called ...."); 
					 
			                  AdminOrgListingForm adminOrgForm = new AdminOrgListingForm();  
			                  if(request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME)!=null)
			                      adminOrgForm =(AdminOrgListingForm) request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME);
			                  
			                  String status = adminOrgForm.getStatus();                  
			                  Debug.print("status="+status);                 
			                  Vector resultObj = vaigaiMeetingBean.displayICPRegistrationForm(status);
				          adminOrgForm.setResults(getList(resultObj));
			                  request.setAttribute("FormAdminOrgListing",adminOrgForm);	               
			                  return new ModelAndView("frmMeeAdminICPRegiListing");       					 
					 
					 
				 }
				 else if(cmd.equalsIgnoreCase("viewAdmin")){
					 Debug.print("AdminOrgListingAction.viewAdmin() called ...."); 
					
			                  String icpMeetingId = request.getParameter("icpMeetingId");
			                  String reqstatus = request.getParameter("usrStat");
			                  String comments = request.getParameter("commentarea");
			                  
			                  Debug.print("IcpMeeting Id is "+icpMeetingId);
			                  Debug.print("reqstatus="+reqstatus);
			                  Debug.print("comments"+comments);
			            //Update for the icp meeting register                  
			            //vaigaiMeetingBean.update
			                  Vector resultObj = vaigaiMeetingBean.displayICPRegBasedOnMeetingId(icpMeetingId);
			                  AdminOrgVO adminOrg =  getAdminView(resultObj); 
			                  Debug.print("HLCContactDetails : "+adminOrg);   
				         request.setAttribute("ViewOrgDetails",resultObj);
				         return new ModelAndView("frmMeeAdminICPAssessInsureApprove");       				 
					 
				 }
				 
				 else if(cmd.equalsIgnoreCase("viewOrg")){
					 
					 Debug.print("AdminOrgListingAction.viewAdmin() called ...."); 
					                          
			                  String icpMeetingId = request.getParameter("icpMeetingId")                 ;
			                  Debug.print("IcpMeetingId="+icpMeetingId);                 
			                  Vector resultObj =  vaigaiMeetingBean.displayICPRegBasedOnMeetingId(icpMeetingId);
			                  AdminOrgVO adminOrg =  getAdminView(resultObj);
			                  request.setAttribute("MeeDetails",resultObj);
			                  Debug.print("HLCContactDetails : "+adminOrg);   
				          request.setAttribute("ViewOrgDetails",adminOrg);
				          return new ModelAndView("frmMeeOrgICPAssessRegiDetails");      					 
					 
					 
				 }
				 
				 else if(cmd.equalsIgnoreCase("AdminupdateStatus")){
					 
					  
		                  String icpMeetingId = request.getParameter("icpMeetingId");
		                  String reqstatus = request.getParameter("usrStat");
		                  String comments = request.getParameter("commentarea");
		                  Debug.print("IcpMeeting Id is "+icpMeetingId);
		                  Debug.print("reqstatus="+reqstatus);
		                  Debug.print("comments"+comments);
		                  String approvedBy =  (String)request.getSession().getAttribute("userCode");
		                  boolean updateStatus =  vaigaiMeetingBean.editStatusICPRequest(icpMeetingId,reqstatus,approvedBy,comments);
		                  
		                  Debug.print("Update status :"+updateStatus); 
		                 
		                  AdminOrgListingForm adminOrgForm = new AdminOrgListingForm();  
		                  if(request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME)!=null)
		                      adminOrgForm =(AdminOrgListingForm) request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME);
		                  
		                  String status = adminOrgForm.getStatus();                  
		                  Debug.print("status="+status);                 
		                  Vector resultObj = vaigaiMeetingBean.displayICPRegistrationForm(status);
			          adminOrgForm.setResults(getList(resultObj));
		                  request.setAttribute("FormAdminOrgListing",adminOrgForm);	               
		                  return new ModelAndView("frmMeeAdminICPRegiListing");			 
				
				 }
				 else if(cmd.equalsIgnoreCase("searchOrg")){
					 
					 
					  Debug.print("AdminOrgListingAction.searchOrg() called ...."); 
					  
			                  AdminOrgListingForm adminOrgForm = new AdminOrgListingForm();                   
			                  String instructorId =  (String)request.getSession().getAttribute("memberId");                   
			                  Debug.print("Member Id from the session :"+instructorId);
			                  Vector resultObj =  vaigaiMeetingBean.displayICPRegBasedOnInstructorId(instructorId);
			                  ArrayList orgDetails = getOrgList(resultObj);
				          Debug.print("Org Member Details:"+orgDetails);
			                  adminOrgForm.setResults(orgDetails);
			                  
			                  //String status=adminOrgForm.getStatus();
			              //    String meetingId =adminOrgForm.getMeetingId();
			                  
			                 // request.setAttribute("FormAdminOrgListing",adminOrgForm);	
			                 // request.setAttribute("status",status);
			                  //request.setAttribute("meetingId",meetingId);
			                  
			                  request.setAttribute("orgDetails",orgDetails);
			                  
			                  return new ModelAndView("frmMeeOrgICPRegiListing");       					 
	
				 }
				 
				 else if(cmd.equalsIgnoreCase("updateStatus")){
					 
					 Debug.print("AdminOrgListingAction.updateStatus() called ...."); 
					        
			                 AdminOrgListingForm adminOrgForm = new AdminOrgListingForm();  
			                 String meetingId = adminOrgForm.getMeetingId();  
			                 String status  = adminOrgForm.getStatus();
			                 String approvedBy =  (String)request.getSession().getAttribute("userCode");
			                 String comments = adminOrgForm.getComments();

			                 Debug.print("meetingId="+meetingId);                 
			                 Debug.print("status="+status);    
			                 Debug.print("approvedBy="+approvedBy);    
			                 Debug.print("comments="+comments);    
			                      
			                 boolean updateStatus =  vaigaiMeetingBean.editStatusICPRequest(meetingId,status,approvedBy,comments);
			                  
			                 Debug.print("Update status :"+updateStatus); 
			                  
				         request.setAttribute("FormAdminOrgListing",adminOrgForm);	
			                  
			                String userCode =  (String)request.getSession().getAttribute("userCode");
			              
			                  if(request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME)!=null)
			                      adminOrgForm =(AdminOrgListingForm) request.getAttribute(AttributeConstant.ADMIN_LISTING_FORM_NAME);
			                  
			                  String status1 = adminOrgForm.getStatus();                  
			                  Debug.print("status="+status1);                 
			                  Vector resultObj = vaigaiMeetingBean.displayICPRegistrationForm(status1);
				          adminOrgForm.setResults(getList(resultObj));
			                  request.setAttribute("FormAdminOrgListing",adminOrgForm);	               
			                  return new ModelAndView("frmMeeAdminICPRegiListing");		     					 
					 
		 
				 }
			
			 
			 }
				 catch( Exception e ){
			            e.printStackTrace();
			        }
			             return null;
			        
			    }
		 
		 /*
	         *  Convert the vector into array list
	         */
	        private ArrayList getList(Vector mediaLists){
	           ArrayList dropDwonLists = new ArrayList();
	           AdminOrgVO adminOrgVO = null;
	                  for (Iterator it = mediaLists.iterator(); it.hasNext();) {
	                      String[] icpDetails = (String[]) it.next();
	                      adminOrgVO = new AdminOrgVO();
	                      adminOrgVO.setInstructorId(icpDetails[6]);
	                      adminOrgVO.setLandOwnerName(icpDetails[11]);
	                      adminOrgVO.setAssesmentLevel(icpDetails[1]);
	                      adminOrgVO.setHostMemberId(icpDetails[7]);
	                      if(icpDetails[2]!=null){
	                          adminOrgVO.setAssesmentDate(icpDetails[2]);
	                      }
	                      else{
	                          
	                      }
	                      if(icpDetails[24]!=null){
	                          adminOrgVO.setAddDate(icpDetails[24]);
	                      }
	                      else{
	                          
	                      }
	                    
	                        adminOrgVO.setIcpMeetingId(icpDetails[0]);
	                        
	                       
	                        dropDwonLists.add(adminOrgVO);  
	                     
	             }
	                      
	       return dropDwonLists; 
	     }   	 
	        
	        
	        private ArrayList getOrgList(Vector mediaLists){
	            ArrayList dropDwonLists = new ArrayList();
	            AdminOrgVO adminOrgVO = null;
	                   for (Iterator it = mediaLists.iterator(); it.hasNext();) {
	                       String[] icpDetails = (String[]) it.next();
	                       adminOrgVO = new AdminOrgVO();
	                       adminOrgVO.setInstructorId(icpDetails[6]);
	                       adminOrgVO.setRequestStatus(icpDetails[25]);
	                       adminOrgVO.setAssesmentDate(icpDetails[2]);
	                       adminOrgVO.setAddDate(icpDetails[24]);
	                       adminOrgVO.setIcpMeetingId(icpDetails[0]);
	                       adminOrgVO.setHostMemberId(icpDetails[7]);
	                       adminOrgVO.setAssesmentLevel(icpDetails[1]);
	                       dropDwonLists.add(adminOrgVO);                  
	                   }    
	        return dropDwonLists; 
	      }   
	        private AdminOrgVO getAdminView(Vector resultObj) {    
                AdminOrgVO adminOrgVO = new AdminOrgVO();
         for (Iterator it = resultObj.iterator(); it.hasNext();) {
                 String[] icpDetails = (String[]) it.next();   
                 adminOrgVO.setIcpMeetingId(icpDetails[0]);
                 adminOrgVO.setAssesmentLevel(icpDetails[1]);
                 adminOrgVO.setAssesmentDate(icpDetails[2]);
                 adminOrgVO.setNoOfDays(icpDetails[3]);                      
                 adminOrgVO.setUseaAreaId(icpDetails[4]);
                 adminOrgVO.setLocation(icpDetails[5]);                    
                 adminOrgVO.setInstructorId(icpDetails[6]);                     
                 adminOrgVO.setHostMemberId(icpDetails[7]);
                 adminOrgVO.setShippingTypeId(icpDetails[8]);
                 //adminOrgVO.setAreaName();
                 adminOrgVO.setAssessor(icpDetails[9]);
                 adminOrgVO.setFacilities(icpDetails[10]);
                 adminOrgVO.setLandOwnerName(icpDetails[11]);
                 adminOrgVO.setLandOwnerBusinessName(icpDetails[12]);
                 adminOrgVO.setLandOwnerAddress(icpDetails[13]);
                 adminOrgVO.setLandOwnerCity(icpDetails[14]);
                 adminOrgVO.setLandOwnerState(icpDetails[15]);
                 adminOrgVO.setLandOwnerCountry(icpDetails[16]);
                 adminOrgVO.setLandOwnerZip(icpDetails[17]);
                 adminOrgVO.setLandOwnerPhone(icpDetails[18]);
                 if(icpDetails[19]==null || icpDetails[19].trim().length()==0){
                     icpDetails[19] ="-N.A-";
                  adminOrgVO.setLandOwnerFax(icpDetails[19]);
                 }
                 else{
                 adminOrgVO.setLandOwnerFax(icpDetails[19]);
                 }
                 
                 adminOrgVO.setLandOwnerEmail(icpDetails[20]);                     
                 adminOrgVO.setApprovedBy(icpDetails[21]);
                 adminOrgVO.setApprovedDate(icpDetails[22]);
                 adminOrgVO.setPostingType(icpDetails[23]);
                 adminOrgVO.setAddDate(icpDetails[24]);
                 adminOrgVO.setRequestStatus(icpDetails[25]);   
                 adminOrgVO.setAreaName(icpDetails[26]); 
                 adminOrgVO.setAmount(icpDetails[49]);
                 adminOrgVO.setCcName(icpDetails[39]);
                 adminOrgVO.setCheckDate(icpDetails[46]);
                 adminOrgVO.setCheckName(icpDetails[48]);
                 adminOrgVO.setBankName(icpDetails[45]);
                 adminOrgVO.setCcType(icpDetails[40]);
                 adminOrgVO.setCcNumber(icpDetails[26]);
                 adminOrgVO.setPaymentStatus(icpDetails[51]);
                 adminOrgVO.setPaymentDate(icpDetails[50]);
                 adminOrgVO.setCcCvvid(icpDetails[44]);
                 adminOrgVO.setCheckNumber(icpDetails[47]);
                 
                 if(icpDetails[37]==null || icpDetails[37].trim().length()==0){
                     icpDetails[37] ="-N.A-";
                     adminOrgVO.setComments(icpDetails[37]);
                 }
                 else{
                 adminOrgVO.setComments(icpDetails[37]);
                 }
                 
                MemberContactDetails  conatctDetails = new MemberContactDetails();
                conatctDetails.setFirstName(icpDetails[27]);
                //conatctDetails.setMiddleName(icpDetails[]); 
                conatctDetails.setLastName(icpDetails[28]);  
		    conatctDetails.setEmailId(icpDetails[29]);           
                conatctDetails.setAddress1(icpDetails[30]);
              //  conatctDetails.setAddress2(icpDetails[]);
                conatctDetails.setCity(icpDetails[33]);
                conatctDetails.setCountry(icpDetails[31]);
                if(icpDetails[36]==null || icpDetails[36].trim().length()==0){
                     icpDetails[36] ="-N.A-";
                     conatctDetails.setFaxNo(icpDetails[36]);
                 }
                 else{
                 conatctDetails.setFaxNo(icpDetails[36]);
                 }
                
              //  conatctDetails.setMobileNo(icpDetails[]);
                conatctDetails.setPhoneNo(icpDetails[35]);
                conatctDetails.setState(icpDetails[32]);
               // conatctDetails.setSuite(icpDetails[]);
              //  conatctDetails.setUserId(icpDetails[]);
                conatctDetails.setZip(icpDetails[34]);
                
                adminOrgVO.setMemberContactDetails(conatctDetails);
                 
         }
                
                 
             
     return adminOrgVO;
}
    
		 
		 
			     
			     
}
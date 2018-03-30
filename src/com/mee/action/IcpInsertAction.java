/*
 * IcpInsertAction.java
 *
 * Created on September 19, 2006, 3:00 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.hlcmeeting.util.HLCInstructorPriceMaster;
import com.hlcmro.util.*;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hlcmeeting.util.HLCPaymentDetails;
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
/**
 *
 * @author karthikeyan
 * @version
 */

	public class IcpInsertAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
            String fwd="";
            Collection col;
            ArrayList array;
            ArrayList array1;
            String email=null;
  
                   try
                   {
                      
                       
                    HttpSession session=request.getSession();
                  
                    email="karthik@yahoo.com";
                    
                    HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();             
                    System.out.println("\n after InitialContext inside icp insert action...\n");
                    
                    String status=request.getParameter("status"); // get the request staus from query string
                    
                    /*
                     * Block Of Execution Regd the Status value
                     */
                    
                    if(status!=null)
                    {
                        /*
                         * Process And Redirect to Display Icp Reg Form 
                         */
                        
                        if(status.equalsIgnoreCase("view"))
                        {
                            Vector hlcArea=new Vector();
                            hlcArea= vaigaiMeetingBean.displayUseaArea(); // Contains AreaId,AreaCode,AreaName
                            
                            request.setAttribute("hlcArea",hlcArea);
                            fwd="meetings-icp-assessment-form";
                        }
                        
                        /*
                         * Insert And Redirect to Confirmation Page From Icp Reg Form 
                         */
                         
                        if(status.equalsIgnoreCase("insert"))
                        {
                    HLCPaymentDetails objPayment = new HLCPaymentDetails();
                    HLCInstructorDetails objInstDetail = new HLCInstructorDetails();
                    HLCInstructorPriceMaster objInstPriceMas = new HLCInstructorPriceMaster();
                    
                objInstDetail.setEmail(email);    
                objInstDetail.setAssesmentLevel("RAM");
                objInstDetail.setAssesmentDate("2006-09-02");
               // objInstDetail.setUseaAreaId(String hlcAreaId);
                objInstDetail.setAreaName("CHENNAI");
                objInstDetail.setLocation("RAM");
                objInstDetail.setInstructorId("100013");
                objInstDetail.setHostMemberId("100011");
                //objInstDetail.setShippingTypeId("100011");
                objInstDetail.setAssessor("RAM");
                objInstDetail.setFacilities("RAM");
                objInstDetail.setLandOwnerName("RAM");
                objInstDetail.setLandOwnerBusinessName("RAM");
                objInstDetail.setLandOwnerFax("12345");
                objInstDetail.setLandOwnerEmail("ram@yahoo.com");
                objInstDetail.setLandOwnerAddress("RAM");
                objInstDetail.setLandOwnerCity("RAM");
                objInstDetail.setLandOwnerState("RAM");
                objInstDetail.setLandOwnerZip("600001");
                objInstDetail.setLandOwnerPhone("99999999");
                //objInstDetail.setAddDate(String addDate);
                objInstDetail.setApprovedBy("RAM");
                objInstDetail.setApprovedDate("2006-09-02");
                objInstDetail.setPostingType("RAM");
                objInstDetail.setNoOfDays("5");
                
                //----------------
                System.out.println(objInstDetail.getEmail());    
                System.out.println(objInstDetail.getAssesmentLevel());
                System.out.println(objInstDetail.getAssesmentDate());
               // objInstDetail.setUseaAreaId(String hlcAreaId);
                System.out.println(objInstDetail.getAreaName());
                System.out.println(objInstDetail.getLocation());
                System.out.println(objInstDetail.getInstructorId());
                System.out.println(objInstDetail.getHostMemberId());
                //objInstDetail.setShippingTypeId("100011");
                System.out.println(objInstDetail.getAssessor());
                System.out.println(objInstDetail.getFacilities());
                System.out.println(objInstDetail.getLandOwnerName());
                System.out.println(objInstDetail.getLandOwnerBusinessName());
                System.out.println(objInstDetail.getLandOwnerFax());
                System.out.println(objInstDetail.getLandOwnerEmail());
                System.out.println(objInstDetail.getLandOwnerAddress());
                System.out.println(objInstDetail.getLandOwnerCity());
                System.out.println(objInstDetail.getLandOwnerState());
                System.out.println(objInstDetail.getLandOwnerZip());
                System.out.println(objInstDetail.getLandOwnerPhone());
                //objInstDetail.setAddDate(String addDate);
                System.out.println(objInstDetail.getApprovedBy());
                System.out.println(objInstDetail.getApprovedDate());
                System.out.println(objInstDetail.getPostingType());
                System.out.println(objInstDetail.getNoOfDays());
                
               // objInstDetail.setRequestStatus(String requestStatus);
                String userId=null;
              
                objPayment.setCcName("Harmohan Nath sharma");
                objPayment.setCcType("MAster");
                //objPayment.setCcNumber("41289432");
                objPayment.setCcExpMonth(10);
                objPayment.setCcExpYear(2006);
                objPayment.setCcCvvid(1783);
                objPayment.setBankName("State Bank Of India");
                objPayment.setCheckDate(new Date());
               // objPayment.setCheckNumber("342846824");
                objPayment.setAmount(12000);
                objPayment.setPaymentDate(new Date());
                objPayment.setPaymentStatus("yes");
                                
               boolean bol = vaigaiMeetingBean.addInstructorDetails(objInstDetail, objPayment);
               System.out.println("Result is : "+bol);
                
                objInstPriceMas.setNoOfDays("5");
                objInstPriceMas.setPrice("111.00");
                objInstPriceMas.setEventRegistrationTypeName("ICP");
                
                System.out.println(objPayment.getCcName());
                System.out.println(objPayment.getCcType());
                System.out.println(objPayment.getCcNumber());
                System.out.println(objPayment.getCcExpMonth());
                System.out.println(objPayment.getCcExpYear());
                System.out.println(objPayment.getCcCvvid());
                System.out.println(objPayment.getBankName());
                System.out.println(objPayment.getCheckDate());
                System.out.println(objPayment.getCheckNumber());
                System.out.println(objPayment.getAmount());
                System.out.println(objPayment.getPaymentDate());
                System.out.println(objPayment.getPaymentStatus());
                
                System.out.println(objInstPriceMas.getNoOfDays());
                System.out.println(objInstPriceMas.getPrice());
                System.out.println(objInstPriceMas.getEventRegistrationTypeName());
                
                boolean bool = vaigaiMeetingBean.addInstructorPriceMaster( objInstPriceMas);
                System.out.println("Result is : "+bool);
                fwd="post-confirmation-page";
                   }
              }
        }
                   
        catch(Exception ex)
        {
            System.err.println("Caught an exception."+ex.getMessage());
            ex.printStackTrace();
        }
                   return new ModelAndView(fwd);
        
    }
}

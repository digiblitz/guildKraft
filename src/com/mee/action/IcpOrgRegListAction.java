/*
 * IcpOrgRegListAction.java
 *
 * Created on September 22, 2006, 5:38 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.hlcmeeting.util.HLCMeeICPUserDetails;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * @author karthikeyan
 * @version
 */


	public class IcpOrgRegListAction implements Controller {

		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
        String fwd="";
        
         try
        {        
        	 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
                    
                    String process=request.getParameter("process");
                    HttpSession session=request.getSession();
                    
                    System.out.println("\n after InitialContext inside icp org reg list action...\n");
                                      
                     if(process!=null)
                    {
                        /*
                         * Redirection to IcpOrgRegInitList 
                         */
                        
                        if(process.equalsIgnoreCase("initList"))
                        { 
                             System.out.println("\n inside icp org reg Init list action...\n");
                    
                             fwd="frmMeeOrgUserICPRegiListing";
                        }
                        
                        /*
                         * Redirection to IcpOrgRegList 
                         */
                        
                        if(process.equalsIgnoreCase("list")){   
                            
                             String status=request.getParameter("status");
                             Vector orgList=new Vector();
                             orgList=vaigaiMeetingBean.displayUserListBasedOnStatus(status);
                             System.out.println("Size :" + orgList.size());
                             request.setAttribute("orgList",orgList);
                             request.setAttribute("status",status);
                             fwd="frmMeeOrgUserICPRegiListing";
                       }
                        
                        /*
                         * Redirection to IcpOrgRegView
                         */
                        
                         if(process.equalsIgnoreCase("view"))
                        {   
                            
                            String relId=request.getParameter("relId");
                            Debug.print("Rel ID in servlet"+relId);
                            Vector orgDet=new Vector();
                            orgDet=vaigaiMeetingBean.displayUserBasedOnReleaseId(relId);
                            System.out.println("Size :" +orgDet.size());
                            request.setAttribute("orgDet",orgDet);
                            fwd="frmMeeOrgUserICPAssessInsureApprove";
                        }
                        
                        /*
                         * Redirection to IcpOrgRegList After Approval 
                         */
                        
                         if(process.equalsIgnoreCase("Approve"))
                        {   
                            
                            String relId=request.getParameter("relId");
                            String membStat=request.getParameter("usrStat");
                            String comment = request.getParameter("commentarea");
                            
                            Debug.print("relId:" + relId);
                             Debug.print("relId:" + membStat);
                              Debug.print("relId:" + comment);
                              
                            HLCMeeICPUserDetails objIcpUser = new HLCMeeICPUserDetails();
                            objIcpUser.setReleaseId(relId);
                            objIcpUser.setRequestStatus(membStat);
                            objIcpUser.setComments(comment);

                            boolean bol = vaigaiMeetingBean.editICPUserStatus(objIcpUser);
                            System.out.println("Result Status : "+bol);
                           
                            fwd="frmMeeOrgUserICPRegiListing";
                        }
                        
                     }
         }
            catch (Exception ex) {
            System.err.println("Caught an exception."+ex.getMessage());
            ex.printStackTrace();
        }
         return new ModelAndView(fwd);
}
}
/*
 * UsrMeetListAction.java
 *
 * Created on September 21, 2006, 1:08 PM
 */

package com.mee.action;

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.HLCMeeICPUserDetails;

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
 * @author karthikeyan
 * @version
 */


	public class UsrMeetListAction implements Controller {  
   
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
         String fwd="";
        
        try
        {
        	 HLCVaigaiSessionBean vaigaiMeetingBean =new HLCVaigaiSessionBean();
               
                    HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
                               
                    System.out.println("\n after InitialContext inside icp user Meeting list action...\n");
                    
                    String process=request.getParameter("process");
                    HttpSession session=request.getSession();
                    String uId=(String)session.getAttribute("userId");
                    String emailId=(String)session.getAttribute("emailId");
                     /*
                     * Process based Page Redirection
                     */
                   
                    if(process!=null)
                    {
                        /*
                         * Redirection to IcpUsrMeetList 
                         */
                    
                        if(process.equalsIgnoreCase("list")) {   
                            System.out.println("\n Inside Meeting list ...\n");
                    
                            Vector meeDet=new Vector();                     
                            meeDet=vaigaiMeetingBean.displayICPRegistrationForm("Approved");
                            
                            System.out.println("meeDet Vect Size :"+meeDet.size());
                            request.setAttribute("meeDet",meeDet);
                            fwd="frmMeeUserICPMeeListing";
                        }
                        
                         /*
                         * Redirection to IcpUsrMeetListAppDisp
                         */
               
                        if(process.equalsIgnoreCase("applyDisp")){  
                            System.out.println("\n Inside Meeting after apply ...\n");
                            String meetingId=request.getParameter("mid");
                            Vector meeDet=new Vector();
                            meeDet = vaigaiMeetingBean.displayICPRegBasedOnMeetingId(meetingId);
                            System.out.println("Size :" +meeDet.size());
                            String userId = (String) session.getAttribute("userId");
                            ArrayList userInfo = (ArrayList)humanMemb.getUserContactDetails(userId);
                            request.setAttribute("userInfo",userInfo);
                            request.setAttribute("meeDetapp",meeDet);
                            fwd = "IcpUsrMeetListAppDisp";
//                            fwd="IcpUsrMeetListApply";
                        }
                        
                        /*
                         * Redirection to IcpUsrMeetListApply
                         */
                        
                        if(process.equalsIgnoreCase("view"))
                        { 
                            System.out.println("\n Inside Meeting view ...\n");
                    
                            String meetingId=request.getParameter("mid");
                            Vector meeDet=new Vector();
                            meeDet = vaigaiMeetingBean.displayICPRegBasedOnMeetingId(meetingId);
                            System.out.println("Size :" +meeDet.size());
                            request.setAttribute("meeDet",meeDet);
                            String userId = (String) session.getAttribute("userId");
                            ArrayList userInfo = (ArrayList)humanMemb.getUserContactDetails(userId); 
                            request.setAttribute("userInfo",userInfo);
                            fwd="IcpUsrMeetListApply";
                        }
                        
                       
                          if(process.equalsIgnoreCase("apply"))  { 
                            System.out.println("\n Inside Meeting insert ...\n");
                            String midapp=request.getParameter("mid");
                            String membapp=request.getParameter("hlcmemb");
                            String membno=request.getParameter("membno");
                            if(membapp.equals("no")){
                                membno=null;
                            }
                            System.out.println("meeid :" +midapp + "memb status :"+membapp + "memb no :" +membno);
                            HLCMeeICPUserDetails objICPUser = new HLCMeeICPUserDetails();
                            objICPUser.setIcpMeetingId(midapp);
                            objICPUser.setMembershipStatus(membapp);
                            objICPUser.setUserId(uId);
                            objICPUser.setMemberId(membno);
                            boolean bol = vaigaiMeetingBean.addICPUserDetails(objICPUser);
                            System.out.println(" Result is : "+bol);
                            fwd="IcpUsrMeetListAppConf";
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
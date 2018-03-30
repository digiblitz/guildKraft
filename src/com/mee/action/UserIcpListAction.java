/*
 * UserIcpListAction.java
 *
 * Created on September 20, 2006, 8:19 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

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
/**
 *
 * @author karthikeyan
 * @version
 */


	public class UserIcpListAction implements Controller {
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
        String fwd="";
        
        try
        {
            
        	HLCVaigaiSessionBean vaigaiMeetingBean =new HLCVaigaiSessionBean();
                    
                    System.out.println("\n after InitialContext inside icp user list action...\n");
                    
                    String process=request.getParameter("process");
                    HttpSession session=request.getSession();
                    String uId=(String)session.getAttribute("userId");
                   
                    /*
                     * Process based Page Redirection
                     */
                    
                    if(process!=null)
                    {
                        /*
                         * Redirection to IcpUsrRegList 
                         */
                        
                        if(process.equalsIgnoreCase("list"))
                        {   
                            Vector usrDetail=new Vector();
                            usrDetail= vaigaiMeetingBean.displayUserList(uId);
                            request.setAttribute("usrDetail",usrDetail); 
                            fwd="frmMeeUserICPRegiListing";
                        }
                        
                        /*
                         * Redirect to IcpUsrRegDetails
                         */
                        
                        if(process.equalsIgnoreCase("view"))
                        {
                            String releaseId=request.getParameter("releaseId");
                            Vector usrDesc=new Vector();
                            usrDesc= vaigaiMeetingBean.displayUserBasedOnReleaseId(releaseId);
                            //Debug.print("usrDesc size :",usrDesc.size());
                            System.out.println("usrDesc size :"+usrDesc.size());
                            request.setAttribute("usrDesc",usrDesc);
                            fwd="frmMeeUserICPAssessInsureDetails";
                            
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

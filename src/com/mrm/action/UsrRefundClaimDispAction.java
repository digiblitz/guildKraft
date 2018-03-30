/*
 * UsrRefundClaimDispAction.java
 *
 * Created on September 13, 2006, 12:03 AM
 */

package com.mrm.action;

import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.Context;
import com.hlcmrm.util.*;
/**
 *
 * @author karthikeyan
 * @version
 */

public class UsrRefundClaimDispAction implements Controller {
    
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
       
         String memberId = null;
         String stat=null;
         
         try {
             
                HLCRefundSessionBean remote = new HLCRefundSessionBean();
                HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
                HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
                HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
                
                System.out.println("\n this is from claim disp action servlets.........\n");
                
                
                
                HttpSession session=request.getSession();
                Vector refundTyp=new Vector();
                String[] refdet=(String[])session.getAttribute("refdet");
                stat=refdet[6];
                refundTyp=(Vector)remote.displayRefundTypes();
                request.setAttribute("refundTyp",refundTyp);
                session.setAttribute("refunddet",refdet);
                
                System.out.println("Vector Size :"+refundTyp.size());
              
              
              } catch (Exception ex) {
            System.err.println("Caught an exception.: "+ex.getMessage());
            ex.printStackTrace();
        }
         if(stat!=null)
         {
         if(stat.equalsIgnoreCase("Approved"))
         {
          return new ModelAndView("usr_refund_claim");
         }
         else{
             return new ModelAndView("usr_refund-request-viewstatus");
         }
         }
         else
         {
             return new ModelAndView("usr_refund-request-list");
         }
    
    }

    public static Context getInitialContext()
        throws javax.naming.NamingException {
        Properties p =new Properties();
        p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
        p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
        p.setProperty( "java.naming.provider.url", "localhost:11199" );
        return new javax.naming.InitialContext(p);
}
}
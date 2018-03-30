/*
 * UsrRefundReqListAction.java
 *
 * Created on September 12, 2006, 2:43 PM
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

public class UsrRefundReqListAction implements Controller {
    
  
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
         String fwd="";
         
         Vector vObj = new Vector();
        
         String memberId = null;
         
         try {
                
        	 HLCRefundSessionBean remote = new HLCRefundSessionBean();
                
                HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
                HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
                HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
               
                System.out.println("\n after InitialContext Beginning emp Client...\n");
                
               // memberId="100000";
                
                HttpSession session=request.getSession();
                memberId=(String)session.getAttribute("memberId");
                String userId=(String)session.getAttribute("userId");
                
                Vector refundDetail=new Vector();
                System.out.println("userId :"+userId);
                
                refundDetail=remote.getRefundDetailByUserId(userId);
               
                System.out.println("refundDetail size :"+refundDetail.size());
                
                request.setAttribute("refundDetail",refundDetail);
       
               /* if(memberId!=null)
                {*/
                  if(request.getParameter("id")!=null)
                 {
                       String rid=request.getParameter("rId");
                       boolean balanceStatus=remote.getApproveBalance(rid);
                       String balstat=String.valueOf(balanceStatus);
                       request.setAttribute("balanceStatus",balstat);
                       
                       System.out.println("balanceStatus :"+balanceStatus);

                       
                       return new ModelAndView("usr_refund-request-viewstatus");
                 }
                  else
                 {
               
                	  return new ModelAndView("usr_refund-request-list");
                        
                 }
                /*}
                else
                {
                    fwd="RefundDenied";
                }*/
                
          } catch (Exception ex) {
            System.err.println("Caught an exception.");
            ex.printStackTrace();
        }
         
         
         return null;
         
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

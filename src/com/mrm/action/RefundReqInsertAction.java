/*
 * RefundReqInsertAction.java
 *
 * Created on September 10, 2006, 2:47 PM
 */

package com.mrm.action;

import com.hlcmrm.refund.HLCRefundDetailsBean;
import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;
import com.hlcmrm.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.ejb.CreateException;
import javax.naming.Context;
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

import com.hlcmrm.util.*;
/**
 *
 * @author karthikeyan
 * @version
 */

public class RefundReqInsertAction implements Controller {
    
    
    
     
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
                HttpSession session=request.getSession();
                String loginName=(String)session.getAttribute("loginName");
        
              
                HLCRefundSessionBean remote = new HLCRefundSessionBean();
                
                HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
                HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
                HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
        
     //  String balamt=request.getParameter("txtAmount");
       String ClaimAmount=request.getParameter("claimAmount");
       String comment=request.getParameter("txtarea");
      
       System.out.println(ClaimAmount+" "+comment);
       
       objRefundDetails.setClaimAmount(Double.parseDouble(ClaimAmount));
       objRefundDetails.setClaimDate(new Date());
       objRefundDetails.setComments(comment);
              
       String userId=(String)session.getAttribute("userId");
       
       objRefundDetails.setUserId(userId);
       
       objRefundDetails.setLoginName(loginName);
       Debug.print("loginName :"+loginName);
       
       //remote.addMembershipRefundDetail(objRefundDetails);    
       HLCRefundDetailsBean ss = new HLCRefundDetailsBean();
       try {
		ss.ejbCreate(objRefundDetails);
	} catch (CreateException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    
     return new ModelAndView("refund-confirmation");  
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

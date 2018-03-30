/*
 * UsrRefClaimAction.java
 *
 * Created on September 12, 2006, 11:41 PM
 */

package com.mrm.action;

import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;
import com.hlcmrm.util.Debug;

import javax.servlet.ServletException;
import javax.servlet.http.*;
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

public class UsrRefClaimAction implements Controller {
    
   
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
         Vector vObj = new Vector();
        // String name = "ejb/HLCRefundSessionJNDI";
       
         try {   
                
                HLCRefundSessionBean remote = new HLCRefundSessionBean();
                HttpSession session=request.getSession();
                String memberId=(String)session.getAttribute("memberId");
                
                HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
                HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
                HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
                
                System.out.println("\n Usr Refund Claim Action...\n");
                
                String rid=request.getParameter("ridId");
                System.out.println("refund Id :"+rid);
              
                
                String count=request.getParameter("cbxct");
                int hid=Integer.parseInt(count);
                
                String[] nam=new String[100];
                String[] chkd=new String[100];
                String[] tval=new String[100];
                
                int x=0;
                 
                Enumeration en=request.getParameterNames();
                while(en.hasMoreElements())
                {
                    String na=(String)en.nextElement();
                    nam[x]=na;
                    System.out.println("Param names :"+nam[x]);
                    x++;
                }
                
                double amt=0.0;
                
                 for(int i=0;i<hid;i++)
                 {
                              String chbx="refundcb"+Integer.toString(i);
                              System.out.println("refundcb made : "+chbx);
                              String tbname="refundtb"+Integer.toString(i);
                              System.out.println("tbname made : "+tbname);

                              for(int y=0;y<nam.length;y++)
                              {

                                      if(chbx.equals(nam[y]))
                                      {
                                      chkd[y] =request.getParameter(chbx);
                                      tval[y] =request.getParameter(tbname);
                                      System.out.println("checked val: "+chkd[y]);
                                      System.out.println("text box val: "+tval[y]);

                                      objRefundTypeDetails.setRefundAmount(Double.parseDouble(tval[y]));
                                      objRefundTypeDetails.setRefundTypeId(chkd[y]);
                                      objRefundTypeDetails.setRefundId(rid);

                                      remote.addMembershipRefundTypeDetail(objRefundTypeDetails); 
                                      
                                      double d=Double.parseDouble(tval[y]);
                                      amt= amt+d;                                     
                                     }

                               }      
                              
                           
               }
                              double appamt=Double.parseDouble(request.getParameter("approveamt"));
                              //double balamt=appamt-amt;
                              double balamt=Double.parseDouble(request.getParameter("balamt"));
                              double bal=balamt-amt;
                              
                              String userId=(String)session.getAttribute("userId");
                              Debug.print("userId :"+userId);
                              
                              objRefundDetails.setUserId(userId);
                              objRefundDetails.setMemberId(memberId);
                              objRefundDetails.setRefundId(rid);
                              objRefundDetails.setBalanceAmount(bal);
                              System.out.println("objRefundDetails.setBalanceAmount(bal) :" +objRefundDetails.getBalanceAmount());
                              
                              remote.editRefundDetails(objRefundDetails);
                
         }
            catch (Exception ex) {
            System.err.println("Caught an exception.: "+ex.getMessage());
            ex.printStackTrace();
                 }
        
        return new ModelAndView("usr_refund-request-viewstatus");
        
         
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

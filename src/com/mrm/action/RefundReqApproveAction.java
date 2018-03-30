/*
 * RefundReqApproveAction.java
 *
 * Created on September 11, 2006, 8:42 PM
 */

package com.mrm.action;


import com.db.GeneralDBAction;
import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

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

public class RefundReqApproveAction implements Controller {
    
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
        Vector vObj = new Vector();
         String name = "ejb/HLCRefundSessionJNDI";
         String memberId = null;
         try {
               System.out.println("parasu checking................>");
                HLCRefundSessionBean remote = new HLCRefundSessionBean();
                
                HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
                HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
                HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
        
                HttpSession session=request.getSession();
                /*String[] details;
                details=(String[])session.getAttribute("usrdet");*/
                String membid=request.getParameter("membid");
                String refid=request.getParameter("refid");
                String userId=request.getParameter("userId");
                
                System.out.println("rid from servlet :" +refid);
                System.out.println("mid from servlet :" +membid);
                System.out.println("userId from servlet :" +userId);
                
                String ststus = request.getParameter("radiobutton");
                
                objRefundDetails.setRefundId(refid);
                objRefundDetails.setUserId(userId);
                objRefundDetails.setRefundAmount(Double.parseDouble(request.getParameter("appamt")));
                objRefundDetails.setBalanceAmount(Double.parseDouble(request.getParameter("appamt")));
                objRefundDetails.setRefundDate(new Date());
                objRefundDetails.setRefundStatus(request.getParameter("radiobutton"));
               
                 System.out.println("from Refund approv action....");

                 System.out.println("ref id : "+refid);
                 System.out.println("ref amt :" +Double.parseDouble(request.getParameter("appamt"))); 
                 System.out.println("ref date :" +new Date());
                 System.out.println("status :" +request.getParameter("radiobutton"));
                 
                 System.out.println(objRefundDetails.getRefundStatus());
                 
                 remote.editRefundDetails(objRefundDetails);
                    
                 System.out.println("inserted succesfully........from approv action....");
    
           } catch (Exception ex) {
            System.err.println("Caught an exception.");
            ex.printStackTrace();
        }
          //return mapping.findForward("RefundListAction");
         //response.sendRedirect("RefundList.html");
       
         try {
        	 HLCRefundSessionBean remote = new HLCRefundSessionBean();
             GeneralDBAction db=new GeneralDBAction();
             HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
             HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
             HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();
             String uid=request.getParameter("uid");
         
         Vector refundDetail=new Vector();
         Vector usrdet=new Vector();
         String userId = null;
         vObj = remote.getRefundDetailList();
         Enumeration it1 = vObj.elements();
        while(it1.hasMoreElements()){
            String[] reflist= (String[])it1.nextElement();
            for(int i=0;i<reflist.length; i++){
                System.out.print("   "+reflist[i]);
            System.out.println();
            
            }
           
            userId = reflist[13];
            System.out.println("userId in servlet :" +userId);
            
         Collection col =remote.memberDetailsOnUserId(userId);
         System.out.println("user id after coll :" +userId);
            
            Vector array = new Vector(col);
           /// ArrayList array = new ArrayList(col);
            Object o = array.get(0);
            Object o1 = array.get(1);
            HLCUserMaster objUser = null;
            HLCContactDetails objContact = null;
            if (o instanceof HLCUserMaster) {
                objUser = (HLCUserMaster) o;
            }
            if (o1 instanceof HLCContactDetails) {
                objContact = (HLCContactDetails) o1;
            }
       // System.out.println("Size of the Vector : "+V.size());
       // HLCUserMaster objUser = (HLCUserMaster)vObj.elementAt(0);
       // HLCContactDetails objContact = (HLCContactDetails)vObj.elementAt(1);
            
        System.out.print("--------------------- from servlet : ---------------------");
        
      
        
        String mstatus="Pending";
        
        refundDetail = remote.getRefundBasedOnStatus(mstatus);
                       
        String[] User=new String[10];
        
        User[0]=reflist[3]; // date of req
        User[1]=objUser.getFirstName();
        User[2]=objUser.getLastName();
        User[3]=objUser.getEmailId();
        User[4]=reflist[1];  // memb id
        User[5]=reflist[2];  // claim amt
        User[6]=reflist[11]; // memb comment 
        User[7]=reflist[0]; // Refund Id 
        User[8]=userId; // user Id 
        
        System.out.println("after vector ..........");
        System.out.println("parasu member id :" +User[4]);
        usrdet.add(User);
        System.out.println(User[0]+" "+User[1]);
        }
         
 System.out.print("--------------------- end of servlet print. ---------------------");        
         
request.setAttribute("User",usrdet);
request.setAttribute("refundDetail",refundDetail);


      
} catch (Exception ex) {
    System.err.println("Caught an exception.");
    ex.printStackTrace();
}

         return new ModelAndView("refund-application-listing");  
         
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
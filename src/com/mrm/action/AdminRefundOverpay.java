/*
 * Program Name     :   AdminRefundOverpay.java
 * Created Date     :   August 6, 2007, 1:26 PM
 * Author           :   Hari
 * Version          :   1.4
 * CopyRightInformation:
 *  (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
 *  916 W. Broad Street Suite 205, FallsChurch, VA 22046.
 *  This document is protected by copyright. No part of this document may be reproduced in any form by any means without
 *  prior written authorization of Sun and its licensors. if any.
 *  The information described in this document may be protected by one or more U.S.patents.foreign patents,or
 *  pending applications.
 */

package com.mrm.action;

import com.hlcaccounts.util.Debug;
import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;
import com.hlcmrm.util.HLCMembershipRefundDetails;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Properties;
import javax.naming.Context;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


public class AdminRefundOverpay implements Controller {
    
    
    
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

        
            String refundname = "ejb/HLCRefundSessionJNDI";
            
            try{
                
                HLCRefundSessionBean refundRemote = new HLCRefundSessionBean();
                
                String process = request.getParameter("process");
                
                if(process!=null){
                    if(process.equalsIgnoreCase("listpay")){
                        
                        ArrayList refundReq = null;
                        String statusList = request.getParameter("statusList");
                        
                        if(statusList!=null){
                            refundReq = refundRemote.listExcessPayment(statusList);
                        }
                        request.setAttribute("statusList",statusList);
                        request.setAttribute("RefundReq",refundReq);
                        
                        //return mapping.findForward("listPay");
                        return new ModelAndView("frmlistingOverpayments");
                    }
                    
                    if(process.equalsIgnoreCase("submt")){
                        String Submit2 = request.getParameter("Submit2");
                        Debug.print("Submit2 Value is"+Submit2);
                        if(Submit2!=null && Submit2.trim().length()>0){
                            if(Submit2.equalsIgnoreCase("Approve")){
                                String refundId = request.getParameter("refundId");
                                Debug.print("Process is "+process +" refund ID "+refundId);
                                HLCMembershipRefundDetails memRefund= null;
                                if(refundId!=null && refundId.trim().length()!=0){
                                    memRefund = refundRemote.getExcessPaymentDetails(refundId);
                                }
                                request.setAttribute("memRefund",memRefund);
                                //return mapping.findForward("listApprove");
                                return new ModelAndView("frmOverpayApprove");
                            }
                            if(Submit2.equalsIgnoreCase("view")){
                                String refundId = request.getParameter("refundId");
                                Debug.print("Process is "+process +" refund ID "+refundId);
                                HLCMembershipRefundDetails memRefund = null;
                                if(refundId!=null && refundId.trim().length()!=0){
                                    memRefund = refundRemote.getExcessPaymentDetails(refundId);
                                }
                                request.setAttribute("memRefund",memRefund);

                                ArrayList refundReq = new ArrayList();
                                String statusList = request.getParameter("statusList");

                                if(statusList!=null){
                                    refundReq = refundRemote.listExcessPayment(statusList);
                                }                        

                                request.setAttribute("RefundReq",refundReq);                        

                                //return mapping.findForward("listPend"); 
                                return new ModelAndView("frmOverpayPendingDet");
                            }
                        }
                    }
                    
                    if(process.equalsIgnoreCase("updateentry")){
                        String refundId =request.getParameter("refundId");
                        String comments = request.getParameter("ovepayComments");
                        String refunddate = request.getParameter("refunddate");
                        String refundby = request.getParameter("refundby");
                        String chequedate = request.getParameter("chequedate");
                        String chequeno = request.getParameter("chequeno");
                        String bankname = request.getParameter("bankname");
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
                        
                        java.util.Date refund_date =null;
                        refund_date=(java.util.Date)sdf.parse(request.getParameter("refunddate"));
                        java.util.Date check_date =null;
                        check_date=(java.util.Date)sdf.parse(request.getParameter("chequedate"));
                        
                        Debug.print("Refund Id "+refundId);
                        Debug.print("comments Id "+comments);
                        Debug.print("refunddae Id "+refunddate);
                        Debug.print("refundby Id "+refundby);
                        Debug.print("chequedate Id "+chequedate);
                        Debug.print("chequeno Id "+chequeno);
                        Debug.print("bankname Id "+bankname);
                        
                        HLCMembershipRefundDetails memRefund = new HLCMembershipRefundDetails();
                        
                        memRefund.setRefundId(refundId);
                        memRefund.setComments(comments);
                        memRefund.setBankName(bankname);
                        memRefund.setRefundDate(refund_date);
                        memRefund.setRefundedBy(refundby);
                        memRefund.setCheckDate(check_date);
                        
                        memRefund.setCheckNumber(Integer.parseInt(chequeno));
                        
                        boolean updateEntry = refundRemote.updateRefundDetails(memRefund);
                        Debug.print("Update Entry is "+updateEntry);

                        ArrayList refundReq = new ArrayList();
                        String statusList = request.getParameter("statusList");
                        
                        if(statusList!=null){
                            refundReq = refundRemote.listExcessPayment(statusList);
                        }                        
                        
                        request.setAttribute("RefundReq",refundReq);
                        
                        return new ModelAndView("frmlistingOverpayments");
                    }
                }
                else{
                	return new ModelAndView("login");
                }
            }
            catch(Exception e){
                Debug.print("Servlet Exception in AdminRefundOverPay ");
                e.printStackTrace();
            }
        
            return new ModelAndView("login");
        
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

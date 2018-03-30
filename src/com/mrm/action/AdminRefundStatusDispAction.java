/*
 * AdminRefundStatusDispAction.java
 *
 * Created on September 13, 2006, 8:14 PM
 */
package com.mrm.action;

import com.hlcmrm.statless.HLCRefundSessionBean;
import com.hlcmrm.statless.HLCRefundSessionRemote;
import com.hlcmrm.statless.HLCRefundSessionRemoteHome;
import com.hlcmrm.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;

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

import java.util.*;
import javax.naming.Context;
import com.hlcmrm.util.*;

/**
 *
 * @author karthikeyan
 * @version
 */
public class AdminRefundStatusDispAction implements Controller {
    
    
    
    
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

        Vector vObj = new Vector();
        String name = "ejb/HLCRefundSessionJNDI";
        String memberId = null;
        try {
            HLCRefundSessionBean remote = new HLCRefundSessionBean();

            HLCMembershipRefundDetails objRefundDetails = new HLCMembershipRefundDetails();
            HLCMembershipRefundTypeDetails objRefundTypeDetails = new HLCMembershipRefundTypeDetails();
            HLCMembershipRefundTypeMaster objRefundTypeMaster = new HLCMembershipRefundTypeMaster();

            System.out.println("\n Admin Refund Status Disp Action...\n");

            /*=====================Listing Based On Status=====================*/

            String mstatus = request.getParameter("membstat");
            System.out.println(mstatus);

            Vector refundDetail = new Vector();
            Vector names = new Vector();

            refundDetail = remote.getRefundBasedOnStatus(mstatus);
            request.setAttribute("refundDetail", refundDetail);

            Vector refundTyp = new Vector();

            //======================= get ref type from admin_refund-approve.jsp ===========

            if (request.getParameter("id") != null) {
                HttpSession session = request.getSession();
                Vector redet = new Vector();
                redet = (Vector) session.getAttribute("refundDetail");
                String id = request.getParameter("id");
                int ct = Integer.parseInt(id);
                String[] refund = (String[]) redet.elementAt(ct);

                System.out.println("Size in app servlet :" + redet.size());

                refundTyp = remote.displayRefundTypeDetail(refund[2]);

                request.setAttribute("refundTyp", refundTyp);
                request.setAttribute("refundDetail", redet);
                request.setAttribute("reid", id);

            }
            /*Enumeration it3 = vObj.elements();
            while(it3.hasMoreElements()){
            String[] s = (String[])it3.nextElement();
            for(int i=0;i<s.length; i++){
            System.out.print("   "+s[i]);
            // memberId = s[1];
            }System.out.println();
            }*/



            /**============ Modify/Edit the Refund Details got from admin_refund-approve.jsp ===================================*/
            if (request.getParameter("process") != null) {
                System.out.println(request.getParameter("refundid"));
                System.out.println(request.getParameter("refunddate"));
                System.out.println(request.getParameter("refundby"));
                System.out.println(request.getParameter("bankname"));
                System.out.println(request.getParameter("chequeno"));
                System.out.println(request.getParameter("chequedate"));

                SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyy");
                Date ref_date = null;
                ref_date = (Date) sdf.parse(request.getParameter("refunddate"));
                System.out.println(ref_date);
                Date chk_date = null;
                chk_date = (Date) sdf.parse(request.getParameter("chequedate"));
                System.out.println(chk_date);

                objRefundDetails.setRefundId(request.getParameter("refundid"));
                String memid = request.getParameter("memid");
                Debug.print("memid :" + memid);

                String userId = request.getParameter("userId");
                Debug.print("userId :" + userId);

                objRefundDetails.setUserId(userId);

                objRefundDetails.setMemberId(memid);
                //objRefundDetails.setRefundAmount(999.00);
                objRefundDetails.setRefundDate(ref_date);
                objRefundDetails.setRefundedBy(request.getParameter("refundby"));
                objRefundDetails.setBankName(request.getParameter("bankname"));
                objRefundDetails.setCheckNumber(Integer.parseInt(request.getParameter("chequeno")));
                objRefundDetails.setCheckDate(chk_date);
                //objRefundDetails.setBalanceAmount(500.00);
                // objRefundDetails.setRefundStatus("Pending");

                System.out.println("AdminRefundStatusDispAction from servlet Refund details insertion succesful !!!!!!!!");

                remote.editRefundDetails(objRefundDetails);
            }
        } catch (Exception ex) {
            System.err.println("Caught an exception.: " + ex.getMessage());
            ex.printStackTrace();
        }
        if (request.getParameter("id") != null) {
        	return new ModelAndView("admin_refund-approve"); 
            //return mapping.findForward("AdminRefundApprove");
        } else {
        	return new ModelAndView("refund-admin-status-list"); 
            //return mapping.findForward("AdminRefundStatusList");
        }
    }

    public static Context getInitialContext()
            throws javax.naming.NamingException {
        Properties p = new Properties();
        p.setProperty("java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory");
        p.setProperty("java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces");
        p.setProperty("java.naming.provider.url", "");
        return new javax.naming.InitialContext(p);
    }
}

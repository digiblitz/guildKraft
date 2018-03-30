/*
 * MerchantAction.java
 *
 * Created on November 10, 2006, 11:29 AM
 */
package com.mee.action;

import com.hlccommon.util.Debug;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author hari
 * @version
 */

	public class MerchantAction implements Controller {
    private final static String process = "add";

    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
       
    	HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
        HttpSession session = request.getSession(true);

        String process = request.getParameter("process");
        System.out.println("Process is " + process);

        if (process.equals("add")) {
            try {
                String merchantId;
                String merchantLoginId;
                String merchantUserId;
                String merchantPin;
                String[] db_data = vaigaiMeetingBean.gettMerchantDetails();
                session.setAttribute("value", db_data);
                merchantId = db_data[0];
                merchantLoginId = db_data[1];
                merchantUserId = db_data[2];
                merchantPin = db_data[3];
                Debug.print("Merchant Id " + merchantId);
                Debug.print("Login Id" + merchantUserId);
                Debug.print("User Id" + merchantUserId);
                Debug.print("Mechant Pin" + merchantPin);
                System.out.println("Add Page");
            } catch (Exception e) {
                Debug.print(" Error : " + e.getMessage());
            }
            return new ModelAndView("merchantAccountDetail");
        }
        if (process.equals("update")) {
            try {
                String merchId = request.getParameter("mId");
                String merchLogId = request.getParameter("merchId");
                String userId = request.getParameter("userId");
                String mercPinNo = request.getParameter("mercPinNo");
                Debug.print("MerchId" + merchId);
                Debug.print("Merchant Id " + merchLogId);
                Debug.print("User Id " + userId);
                Debug.print("Merchant Pin No/: ", mercPinNo);
                boolean bol = vaigaiMeetingBean.updateMerchantDetails(merchId, merchLogId, userId, mercPinNo);
                if (bol == true) {
                    Debug.print("Result in Update is" + bol);
                    System.out.println("Update True Page");
                    return new ModelAndView("ConfMerchantUpdate");
                }
            } catch (Exception e) {
                Debug.print(" Error : " + e.getMessage());
            }
        }
        return new ModelAndView("merchantAccountDetail");
    }
}

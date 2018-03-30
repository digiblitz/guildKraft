/*
 * RefundReqDispAction.java
 *
 * Created on September 10, 2006, 4:51 PM
 */
package com.mrm.action;

import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlckavery.stateless.HLCkaveryStatelessBean;
import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import com.hlccommon.util.Debug;
import com.hlcdonation.dao.HLCDonationDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author karthikeyan
 * @version
 */
public class RefundReqDispAction implements Controller {

    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

        HttpSession session = request.getSession(true);
        //Context jndiContext = new InitialContext();


        String userId = (String) session.getAttribute("userId");
        String memberId = (String) session.getAttribute("memberId");

        HLCkaverySessionBeanStatlessBean remote =new HLCkaverySessionBeanStatlessBean();

        ArrayList donSelect = new ArrayList();
        Vector dispMembershipTypeVect = new Vector();

        dispMembershipTypeVect = remote.displayMembershipType("Human");

        HLCkaverystatelessBean remote1 = new HLCkaverystatelessBean();
  
        String memTypId = remote1.getMembershipTypeIdBasedOnUserId(userId);
        Debug.print(" memTypId in servlet :" + memTypId);

        donSelect = remote.getMemberDonationDetails(userId);
        String[] addonPrice = remote.getFamilyAddOn("family member");

        //HLCkaveryStatelessBean remote2 = new HLCkaveryStatelessBean();
        HLCkaveryStatelessBean remote2=new HLCkaveryStatelessBean();
        HLCDonationDAO hd=new HLCDonationDAO();
        ArrayList donDet = new ArrayList();
        //donDet = remote2.getAllDonationDetails();
        donDet = hd.selectAllDonationPriceDetails();

        request.setAttribute("dispMembershipTypeVect", dispMembershipTypeVect);
        request.setAttribute("memTypId", memTypId);
        request.setAttribute("addonPrice", addonPrice);
        request.setAttribute("donSelect", donSelect);
        request.setAttribute("donDet", donDet);

        //fwd = "refund-request";
        /* }
        else
        {
        fwd="refund-not-exist-memb";
        }*/
        return new ModelAndView("refund-request");

    }
    }
                
       
     


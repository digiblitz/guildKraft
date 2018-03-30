/*
 * UserDetailsAjaxAction.java
 *
 * Created on September 20, 2006, 11:00 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mee.action;

import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.util.OptionsBuilder;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.MessageResources;
import com.hlchorse.form.display.*;

/**
 *
 * @author vijitha
 */
public class UserDetailsAjaxAction extends DispatchAction {

    /** Creates a new instance of UserDetailsAjaxAction */
    public UserDetailsAjaxAction() {
    }

    public ActionForward userDetails(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        Debug.print("userDetails executing....");

        String memberId = request.getParameter("memberId");
        Debug.print("MemberId from input: " + memberId);
        String userId = (String) request.getSession().getAttribute("userId");
        Debug.print("UserId from session: " + userId);
        HLCkaverystatelessRemote remote = initializeKaveryEJB(request);
        if (memberId != null) {
            Debug.print("Member Details executing....");
            ArrayList memberDetails = remote.getMemberContactDetails(memberId);
            String[] memberArr = (String[]) memberDetails.toArray(new String[memberDetails.size()]);
            String result = null;
            for (int i = 0; i < memberArr.length; i++) {
                result += memberArr[i] + ",";
            }
            Debug.print("MemberDetails : " + result);

            return getXmlContent(request, response, memberArr);
        } else {

            Debug.print("User  Details executing....");
            ArrayList userDetails = remote.getUserContactDetails(userId);
            String[] userArr = (String[]) userDetails.toArray(new String[userDetails.size()]);
            return getXmlContent(request, response, userArr);

        }
    }

    public ActionForward calcAmount(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Debug.print("calAmount executing....");
        String specificationId = request.getParameter("specId");
        Debug.print("specificationId: " + specificationId);
        String userTypeId = request.getParameter("userTypeId");
        Debug.print("userTypeId : " + userTypeId);
        Date currentDate = new Date();
        Debug.print("CurrentDate : " + currentDate);
        HLCVaigaiSessionRemote vaiRemote = initializeVaigaiEJB(request);
        String amount = vaiRemote.getDueOrAfterDatePrice(currentDate, specificationId, userTypeId);
        Debug.print("Amount  : " + amount);
        return getAmount(request, response, amount);
    }

    public ActionForward dailyBasis(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Debug.print("calAmount executing....");
        String annualMeeName = request.getParameter("annualMeeName");
        Debug.print("annualMeeName: " + annualMeeName);
        HLCVaigaiSessionRemote vaiRemote = initializeVaigaiEJB(request);
        Vector annualMeetings = vaiRemote.dispAnnualMeeForNoOfDays(annualMeeName);
        Debug.print("AnnualMeetings  : " + annualMeetings);
        return (null == annualMeetings) ? null : getNoOfDays(request, response, (String[]) annualMeetings.get(0));
    }

    public ActionForward calcTickets(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        Debug.print("calcTickets executing....");
        String specificationId = request.getParameter("specId");
        Debug.print("specificationId: " + specificationId);
        String userTypeId = request.getParameter("userTypeId");
        Debug.print("userTypeId : " + userTypeId);
        HLCVaigaiSessionRemote vaiRemote = initializeVaigaiEJB(request);
        String[] priceDetails = vaiRemote.getDueDatePrice(specificationId, userTypeId);
        Debug.print("TicketAmount  : " + priceDetails[0] + "," + priceDetails[1]);
        return getAmount(request, response, priceDetails);
    }

    public ActionForward memberValid(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

        String mid = request.getParameter("mid");
        Debug.print("memberId : " + mid);

        if (mid != null) {
            //HLCKaverySessionStatefulRemote kavRemote = initializeEJB(request);
            boolean isValid = mid.equals("100000") ? true : false;//kavRemote.getRiderDetails(mid);
            Debug.print("Member Valid : " + isValid);
            return geMemberInfo(request, response, isValid);
        }

        return null;
    }

    private HLCVaigaiSessionRemote initializeVaigaiEJB(HttpServletRequest request) throws Exception {

        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        String jndiname = mr.getMessage("jndi.icp");

        System.setProperty(namingfactory, contextfactory);
        System.setProperty(urlprovider, lookupip);

        Context jndiContext = new InitialContext();
        Object objref = jndiContext.lookup(jndiname);
        HLCVaigaiSessionRemoteHome home = (HLCVaigaiSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCVaigaiSessionRemoteHome.class);
        HLCVaigaiSessionRemote remote = home.create();

        return remote;

    }

    private HLCkaverystatelessRemote initializeKaveryEJB(HttpServletRequest request) throws Exception {

        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        //String jndiname=mr.getMessage("jndi.advertise");
        Context jndiContext = new InitialContext();
        String jndiname1 = mr.getMessage("jndi.usrreg");
        Object objref1 = jndiContext.lookup(jndiname1);

        HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref1, HLCkaverystatelessRemoteHome.class);
        HLCkaverystatelessRemote remote1 = home.create();
        return remote1;

    }

    /**
     *  return the xml content for the given drop down
     */
    public final ActionForward getXmlContent(HttpServletRequest request, HttpServletResponse response, String[] strArr) throws Exception {
        String xml = null;
        try {
            xml = new OptionsBuilder().getUserDetails(strArr);
            Debug.print("XmlContent = " + xml);
        } catch (Exception ex) {
            // Send back a 500 error code.
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
            return null;
        }
        // Set content to xml
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        pw.write(xml);
        pw.close();
        return null;
    }

    public final ActionForward geMemberInfo(HttpServletRequest request, HttpServletResponse response, boolean valid)
            throws Exception {
        String xml = null;
        try {
            xml = new OptionsBuilder().getMemberInfo(valid);
            Debug.print("XmlContent = " + xml);
        } catch (Exception ex) {
            // Send back a 500 error code.
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
            return null;
        }
        // Set content to xml
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        pw.write(xml);
        pw.close();
        return null;
    }

    public final ActionForward getAmount(HttpServletRequest request, HttpServletResponse response, String amount) throws Exception {

        String encoding = "UTF-8";
        StringBuffer xml = new StringBuffer();
        xml.append("<?xml version=\"1.0\"");
        if (encoding != null) {
            xml.append(" encoding=\"");
            xml.append(encoding);
            xml.append("\"");
        }
        xml.append(" ?>\n");
        xml.append("<amount>" + amount + "</amount>");

        // Set content to xml
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        Debug.print("XmlContent = " + xml);
        pw.write(xml.toString());
        pw.close();
        return null;
    }

    public final ActionForward getNoOfDays(HttpServletRequest request, HttpServletResponse response, String[] noOfDays) throws Exception {

        String encoding = "UTF-8";
        StringBuffer xml = new StringBuffer();
        xml.append("<?xml version=\"1.0\"");
        if (encoding != null) {
            xml.append(" encoding=\"");
            xml.append(encoding);
            xml.append("\"");
        }
        xml.append(" ?>\n");
        xml.append("<MeetindDates>\n");
        // Date will come from DATABASE as 2006-09-23 i.e Year month day
        int dayNos = Integer.parseInt(noOfDays[3]);
        Calendar meetingDate = Calendar.getInstance();
        SimpleDateFormat myDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date myDate = null;
        try {
            myDate = myDateFormat.parse(noOfDays[2]);
        } catch (ParseException e) {
            System.out.println("Invalid Date Parser Exception ");
            e.printStackTrace();
        }
        meetingDate.setTime(myDate);
        Calendar tempDate = null;
        SimpleDateFormat formatter = new SimpleDateFormat("EEEE,MMM yy");
        for (int i = 0; i < dayNos; i++) {
            tempDate = (Calendar) meetingDate.clone();
            tempDate.add(Calendar.DAY_OF_WEEK, +i);
            xml.append("<meetingDate>" + (String) formatter.format(tempDate.getTime()) + "</meetingDate>\n");
        }

        xml.append("</MeetindDates>");

        // Set content to xml
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        Debug.print("XmlContent = " + xml);
        pw.write(xml.toString());
        pw.close();
        return null;
    }

    private ActionForward getAmount(HttpServletRequest request, HttpServletResponse response, String[] priceDetails) throws Exception {

        String encoding = "UTF-8";
        StringBuffer xml = new StringBuffer();
        xml.append("<?xml version=\"1.0\"");
        if (encoding != null) {
            xml.append(" encoding=\"");
            xml.append(encoding);
            xml.append("\"");
        }
        xml.append(" ?>\n");
        xml.append("<priceDetails>\n");
        xml.append(" <priceId>" + priceDetails[0] + "</priceId>\n");
        xml.append(" <amount>" + priceDetails[1] + "</amount>\n");
        xml.append("</priceDetails>");
        // Set content to xml
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        Debug.print("XmlContent = " + xml);
        pw.write(xml.toString());
        pw.close();
        return null;
    }
}

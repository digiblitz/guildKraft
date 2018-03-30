/*
 * AnnualConRegAction.java
 *
 * Created on September 24, 2006, 2:56 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemote;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemoteHome;
import java.io.*;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author Shiva Kumar Subbiaha
 */

	public class AnnualConRegAction implements Controller {
		 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
         HLCKaveryMembershipTypeSessionBean membTypBean =new HLCKaveryMembershipTypeSessionBean();
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
			
        try {
        	
            String annProcess = request.getParameter("annProcess");
            if (annProcess.equals("initAnnual")) {
                Debug.print("AnnualConRegAction.initAnnaul() executed.....");
               
                Vector reg = vaigaiMeetingBean.displayActivityTypeRegister();

                Debug.print("DROP DOWN REGISTERATION TYPE :" + reg);
               
                Vector memberTypeDetails = membTypBean.displayAnnualMemberDetails();
                //ArrayList memberType = getMemberDropDown(memberTypeDetails);
                Debug.print("displayAnnualMemberDetails :" + memberTypeDetails);
                Vector otherAct = vaigaiMeetingBean.displayActivityTypeActivity();

                request.setAttribute("DisplayRegTypeDetails", reg);
                request.setAttribute("MEMBER_TYPE", memberTypeDetails);
                request.setAttribute("MEETING_DATES", dailyBasis(request));
                request.setAttribute("OTHER_ACTIVITY", otherAct);

                return new ModelAndView("frmMeeAnnualConvRegister");
            }

        } catch (Exception e) {
            Debug.print("Exception is" + e);
        }
        return null;
    }

    private boolean isNotNull(String data) {
        return (data != null && data.trim().length() > 0) ? true : false;
    }

    public static Context getInitialContext()
            throws javax.naming.NamingException {
        Properties p = new Properties();
        p.setProperty("java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory");
        p.setProperty("java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces");
        p.setProperty("java.naming.provider.url", "");
        return new javax.naming.InitialContext(p);
    }

    private String getAsString(String[] arr) {
        if (arr == null) {
            return null;
        }
        StringBuffer buffer = new StringBuffer();
        int len = (arr.length - 1);
        for (int i = 0; i < len; i++) {
            buffer.append(arr[i] + "#");
        }
        if (arr.length > 0) {
            buffer.append(arr[arr.length - 1]);
        }
        //buffer.append();
        return buffer.toString();
    }

    private ArrayList dailyBasis(HttpServletRequest request) throws Exception {

        Debug.print("dailyBasis executing....");
        String annualMeeName = "Daily Basis";
        Debug.print("annualMeeName: " + annualMeeName);
       
        Vector annualMeetings = vaigaiMeetingBean.dispAnnualMeeForNoOfDays(annualMeeName);
        Debug.print("AnnualMeetings  : " + annualMeetings);
        String[] noOfDays = (String[]) annualMeetings.get(0);

        ArrayList dropDwonLists = new ArrayList();
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
        Debug.print("Number of Days :" + dayNos);
        for (int i = 0; i < dayNos; i++) {
            tempDate = (Calendar) meetingDate.clone();
            tempDate.add(Calendar.DAY_OF_WEEK, +i);
            String meetingDateValue = (String) formatter.format(tempDate.getTime());
            //dropDwonLists.add(new LabelValueBean(meetingDateValue,meetingDateValue));
            dropDwonLists.add(meetingDateValue);
        }
        return dropDwonLists;
    }
}

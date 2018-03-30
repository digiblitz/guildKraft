/*
 * AdminSetDateMasterAction.java
 *
 * Created on September 23, 2006, 11:49 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import java.util.*;
import java.text.SimpleDateFormat;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

import java.io.IOException;
import java.lang.Double;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import java.util.regex.*;
import java.lang.String;
import java.net.ProtocolException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author harmohan
 */


	public class AdminSetDateMasterAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
       
       
      try {
    	  HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean(); 
           
            Vector nobj = new Vector();
            String adminSetDateProcess = request.getParameter("adminSetDateProcess");
            if (adminSetDateProcess != null){
                Debug.print("MemeberShip Name In Servlet:" + adminSetDateProcess);
            }

             nobj = vaigaiMeetingBean.displayEventRegistrationTypeMaster();
             request.setAttribute("eventRegMasterVect",nobj);
             
            String eventRegMasterID = null;
            Date regDate = null;
            Date meeDate = null;
            int noOfDays = 0;

              if(adminSetDateProcess != null && adminSetDateProcess.equals("setDateForEvent")){
                
                eventRegMasterID = request.getParameter("eventRegMaster_sel");
                Debug.print("eventRegMasterID : "+eventRegMasterID);
                String regMeeName = request.getParameter("");
                String regDate1 = request.getParameter("regDate"); 
                String meeDate1 = request.getParameter("meeDate"); 
                Debug.print(" Registartion Date : "+regDate1);
                Debug.print(" Meeting Date : "+meeDate1);
                noOfDays = Integer.parseInt(request.getParameter("noOfDays"));
                Debug.print("No of Days : "+noOfDays);
                
                try {
                    boolean bol = vaigaiMeetingBean.updateEventRegistrationTypeMaster(eventRegMasterID, null,
                            regDate1,meeDate1,noOfDays);
                    Debug.print("Result for add in Servlet : "+bol);

                    if (bol == true){
                    	return new ModelAndView("mee-confirmation-set-date-master");
                    }else {
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeAdminSetDateMaster");
                    }
                }catch (Exception e){
                    Debug.print(" Error : "+e.getMessage());
                }
            }
            
            
                    
            }
        catch(Exception e){
                /* this will most likely be because the customer already exists in the database. */
       // System.out.print("Client Exception :" + e);
            e.printStackTrace();
        }
      return new ModelAndView("frmMeeAdminSetDateMaster");
   }
   
  
}

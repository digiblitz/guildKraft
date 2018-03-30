/*
 * MeeOrgAnnConRegiListings.java
 *
 * Created on September 25, 2006, 3:28 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;
import com.hlchorse.form.util.Debug;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.Context;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import java.util.regex.*;
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

	public class MeeOrgAnnConRegiListings implements Controller {
    
   Vector vObj = new Vector();
   public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
       
      try {

    	  HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            
            Vector vObj = new Vector();
            Vector nobj = new Vector();
            String memProcess = request.getParameter("memProcess");
            
            Debug.print("Annula Meeting Details In Servlet:" + memProcess);
            
            String userId = (String)request.getSession().getAttribute("userId");
              nobj = vaigaiMeetingBean.displayAnnualDetailBasedOnUserID(userId);
              request.setAttribute("annConRegList",nobj);
              
           if(memProcess != null && memProcess.equals("dispDetail")){
                    String annualMeeId = request.getParameter("annualMeetingId");
                    System.out.println("Annual Meeting Id In Servlet : "+annualMeeId);
                    
                    vObj = (Vector)vaigaiMeetingBean.displayAnnaulApplicationDetail(annualMeeId);
                    Debug.print("Vector element for user detail in Servlet : "+vObj);
                    request.setAttribute("viewMember",vObj);
                    nobj = null;
                    nobj = (Vector)vaigaiMeetingBean.displayAnnaulSpecificationDetail(annualMeeId);
                    Debug.print("Vector element for specification detail in Servlet : "+nobj);
                    request.setAttribute("viewSpecification",nobj);
                    
                    return new ModelAndView("frmMeeOrgAnnConvRegiDetails");
                
           }
                                          
        }
        catch(Exception e){
                
          System.out.print("Client Exception :" + e.getMessage());
            e.printStackTrace();
        }
      return new ModelAndView("frmMeeOrgAnnConRegiListings");
   }
   
  
}

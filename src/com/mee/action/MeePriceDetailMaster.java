/*
 * MeePriceDetailMaster.java
 *
 * Created on September 22, 2006, 8:16 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.*;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;
/**   
 *
 * @author harmohan
 */

	public class MeePriceDetailMaster implements Controller {
   
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
			  
       	 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
	            
       	 HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
         try
        {
          
            System.out.println("\n after InitialContext inside icp user Meeting list action...\n");


            Vector vObj = new Vector();
            Vector nobj = new Vector();
            String meeProcess = request.getParameter("meeProcess");

            Debug.print("Activity Category Name In Servlet:" + meeProcess);

            nobj = vaigaiMeetingBean.displayActivityCategory();
            request.setAttribute("meeCataTypeVect",nobj);
            
            vObj = (Vector) vaigaiMeetingBean.displayUserType();
            request.setAttribute("userTypeVec",vObj);
            //meeCatagoryTyp
            String meeActivityTypId = request.getParameter("meeCatagoryTyp");
           if(meeActivityTypId !=null && meeActivityTypId.trim().length()>0) {     

                Debug.print("meeActivityTypId in Servlet : " + meeActivityTypId);
                vObj = (Vector) vaigaiMeetingBean.displaySpecification(meeActivityTypId);
                request.setAttribute("dispSpecifcation",vObj);
           }              
                  }
      
                      catch(Exception ex)
                        {
                            System.err.println("Caught an exception."+ex.getMessage());
                            ex.printStackTrace();
                        }
        
         Vector nobj = (Vector) vaigaiMeetingBean.displayEventRegistrationTypeMaster();
         Debug.print("DisplayActivityCatgory Details arel" + nobj);
         request.setAttribute("meeCataTypeVect", nobj);

         Vector vObj = (Vector) humanMemb.displayMemberType();

         Debug.print("DisplayUserDetails arel" + vObj);
         request.setAttribute("userTypeVec", vObj);

         return new ModelAndView("mee-price-detail-master-Ajax");
         
    }
    
}

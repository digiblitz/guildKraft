/*
 * orgStaffCompResultAction.java
 *
 * Created on December 3, 2007, 2:25 PM
 */

package com.oer.action;

import com.db.GeneralDBAction;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCompResultVO;
import com.hlcutil.Debug;
import java.util.ArrayList;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import java.util.Date;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import java.util.regex.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author Vidhya
 * @version
 */

	public class OrgStaffCompResultAction implements Controller {
    

		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {

        
       try{
            HttpSession session=request.getSession();
            HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
	    	
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			/*PRABHU START HERE*/ 
			GeneralDBAction db = new GeneralDBAction();
			/*PRABHU END HERE*/ 
			
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            HLCCompResultVO compVO= new HLCCompResultVO();
            if(cmd!=null){
                
            if(cmd.equals("initOrgResultList")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    return new ModelAndView("frmOEROrgnazierCompResList");         
            }
            else if(cmd.equals("initEventTitle")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    String year=request.getParameter("year");
                    Debug.print("year :"+year);
                    String organizerId=(String)session.getAttribute("memberId");
                    ArrayList eventTitles=new ArrayList();
                    eventTitles=membQualBean.getEventTiles(year,organizerId);
                    if(eventTitles.isEmpty()){
                    	System.out.println("eventTitles is empty:::::::::::::");
                    }
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("year",year);
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    return new ModelAndView("frmOEROrgnazierCompResList");
            }
            else if(cmd.equals("initStaffResultList")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    return new ModelAndView("frmOERStaffCompResList");         
            }
            else if(cmd.equals("initAllEventTitle")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    String year=request.getParameter("year");
                    int tempYear=0;
                    if(year!=null && year.trim().length()!=0){
                    tempYear=Integer.parseInt(year);    
                    }
                    Debug.print("year :"+year);
                    ArrayList eventTitles=new ArrayList();
                    eventTitles=membQualBean.getAllEventTiles(tempYear);
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("year",year);
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    return new ModelAndView("frmOERStaffCompResList");
            }
            else if(cmd.equals("orgResultList")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    String year = request.getParameter("year");
                    int tempYear=Integer.parseInt(year);
                    String eventId=request.getParameter("selTitle"); 
                    String organizerId=(String)session.getAttribute("memberId");
                                 
                    ArrayList eventTitles=new ArrayList();
                    ArrayList eventCompResList=new ArrayList();  
                    
                    eventTitles=membQualBean.getEventTiles(year,organizerId);                                                       
                    eventCompResList=membQualBean.getCompResultList(eventId,tempYear);
                    
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("year",year);
                    request.setAttribute("tempeventId",eventId);                  
                    request.setAttribute("eventCompResList",eventCompResList);
                    return new ModelAndView("frmOEROrgnazierCompResList");
                 
            }
            else if(cmd.equals("staffResultList")){
                    Debug.print("cmd in orgStaffCompResultAction :"+cmd);
                    String year = request.getParameter("year");                    
                    String eventId=request.getParameter("selTitle"); 
                    int tempYear=0;
                    if(year!=null && year.trim().length()!=0){
                    tempYear=Integer.parseInt(year);    
                    }         
                    ArrayList eventTitles=new ArrayList();
                    ArrayList eventCompResList=new ArrayList();  
                    
                    eventTitles=membQualBean.getAllEventTiles(tempYear);                                                       
                    eventCompResList=membQualBean.getCompResultList(eventId,tempYear);
                    if(eventCompResList.isEmpty()){
                    	System.out.println("eventCompResList is empty:::::::");
                    }else{
                    	System.out.println("eventCompResList is not empty");
                    }
                    
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("year",year);
                    request.setAttribute("tempeventId",eventId);                  
                    request.setAttribute("eventCompResList",eventCompResList);
                    return new ModelAndView("frmOERStaffCompResList");
                 
            }
            
            }
   }catch(Exception e){
   e.printStackTrace();    
   }
   return null;         
  }       
}    

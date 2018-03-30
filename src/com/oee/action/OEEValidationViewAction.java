/*
 * OEEValidationViewAction.java
 *
 * Created on November 7, 2007, 11:36 AM
 */

package com.oee.action;

//import bsh.Remote;
import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Vector;
import javax.servlet.*;
import javax.servlet.http.*;

import com.db.GeneralDBAction;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.apache.struts.actions.DispatchAction;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcutil.*;
import java.util.regex.Pattern;
import java.sql.*;
import java.math.*;

/**
 *
 * @author Vidhya
 * @version
 */

	public class OEEValidationViewAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
			 
			 try{
		            HttpSession session=request.getSession();
		            GeneralDBAction db=new GeneralDBAction();
					HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
					HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
					HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
					 String process = request.getParameter("method");
					 if(process!=null){
						 if(process.equals("initView")){
							 Debug.print("OEEValidationViewAction.initView() method calling ..........");
					           
					            Vector eventTypeDetails = null;
					            ArrayList userTypeDetails = new ArrayList();
					            ArrayList divisionTypeDetails = new ArrayList();
					            ArrayList areaDetails = new ArrayList();
					           
					            
					            String areaId="";
					            String divisionId="";
					            eventTypeDetails = krishnaBean.getAllEventTypes();
					            userTypeDetails = krishnaBean.getUserTypes();
					            divisionTypeDetails = krishnaBean.getDivisions();
					            areaDetails = krishnaBean.getAllAreaMasters();
					                      
					            request.setAttribute("eventTypeDetails",eventTypeDetails);
					            request.setAttribute("userTypeDetails",userTypeDetails);
					            request.setAttribute("divisionId",divisionId);
					            request.setAttribute("divisionTypeDetails",divisionTypeDetails);
					            request.setAttribute("areaDetails",areaDetails);
					            request.setAttribute("areaId",areaId);                      
					            return new ModelAndView("frmViewQualificationDetails");					 
						 }
						 
						 else if(process.equals("qualificationView")){
							 Debug.print("OEEValidationViewAction.qualificationView() method calling .........."); 
					          
					            String eventTypeId = request.getParameter("eventType");
					            Debug.print("eventTypeId in servlet"+eventTypeId);
					            String userTypeId = request.getParameter("userType");
					            Debug.print("userTypeId in servlet"+userTypeId);
					            String divisionId = request.getParameter("division");
					            Debug.print("divisionId in servlet"+divisionId);
					      					            
					            String areaId = request.getParameter("selArea");
					            Debug.print("areaId in servlet"+areaId);            
					            String chmpStatus = request.getParameter("chmpStatus");
					            Debug.print("chmpStatus in servlet"+chmpStatus);
					            
					            String chmpStat="";
					            if(chmpStatus.equalsIgnoreCase("yes")){              
					             chmpStat="True";     
					            }
					            else 
					            {
					               chmpStat="False";   
					            }
					            
					            Vector eventTypeDetails = null;
					            ArrayList userTypeDetails = new ArrayList();
					            ArrayList viewEventDetails=new ArrayList();
					            ArrayList divisionTypeDetails = new ArrayList();
					            ArrayList areaDetails = new ArrayList();
					            
					            areaDetails = krishnaBean.getAllAreaMasters();
					            eventTypeDetails = krishnaBean.getAllEventTypes();
					            userTypeDetails = krishnaBean.getUserTypes();
					            divisionTypeDetails = krishnaBean.getDivisions();
					            viewEventDetails=krishnaBean.getValidationDetails(eventTypeId,userTypeId,divisionId,areaId,chmpStat);
					            
					            request.setAttribute("viewEventDetails",viewEventDetails);
					            request.setAttribute("eventTypeDetails",eventTypeDetails);
					            request.setAttribute("userTypeDetails",userTypeDetails);
					            request.setAttribute("eventTypeId",eventTypeId);
					            request.setAttribute("userTypeId",userTypeId);
					            request.setAttribute("divisionId",divisionId);
					            request.setAttribute("divisionTypeDetails",divisionTypeDetails);
					            request.setAttribute("areaId",areaId); 
					            request.setAttribute("areaDetails",areaDetails);
					            request.setAttribute("chmpStatus",chmpStatus); 
					            return new ModelAndView("frmViewQualificationDetails");					 
						 }
						 
						 
						 
						 
					 }
				
			 }catch(Exception e){
		            e.printStackTrace();
		        }
		        
			    return null;
		    }
   
   
   
}

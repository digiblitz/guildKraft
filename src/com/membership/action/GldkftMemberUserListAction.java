/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.membership.action;

import java.io.IOException;
import java.net.ProtocolException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import javax.ejb.FinderException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;

public class GldkftMemberUserListAction implements Controller {
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
		HLCKaveryMembershipTypeSessionBean membTypeBean=new HLCKaveryMembershipTypeSessionBean();
		HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
		HLCMahanadhiSessionBean acctBean=new HLCMahanadhiSessionBean();
		HLCkaverySessionBeanStatlessBean hrsBean= new HLCkaverySessionBeanStatlessBean();
		HLCKaverySessionStatefulBean hrsStBean= new HLCKaverySessionStatefulBean();
		
		
		 HLCUserRegVO userregvo=new HLCUserRegVO();
		
		 String memProcess = request.getParameter("memProcess");
         //  String memProcess1 = request.getParameter("memProcess1");
           Debug.print("MemeberShip Name In Servlet:" + memProcess);
           
           Vector nobj;
		try {
			nobj = membTypeBean.displayUserTypeDetails();
			 Debug.print("Size:" + nobj.size());
	           request.setAttribute("userTypeVect",nobj);
	             
		} catch (FinderException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
          
            // Debug.print("userTypeVect" + userTypeVect);
             if(memProcess==null){
               Debug.print(" memProcess is null ");
                               
               String userTypeId;
			try {
				userTypeId = hrsStBean.getHumanUserTypeId();
				  int rCnt =0;
	               int pNo =1;
	               String pageNo = request.getParameter("pn");

	               if(pageNo!=null){
	                   pNo = Integer.parseInt(pageNo);
	               }
	               Debug.print("Page NO :"+pNo);
	               if(userTypeId!=null && userTypeId.trim().length()>0) {
	                   Debug.print("memberId:" + userTypeId);
	                   rCnt = hrsStBean.userRowCount(userTypeId);
	                   Vector vObj = (Vector) hrsStBean.displayMemberUserList(userTypeId,pNo);
	                   request.setAttribute("dispStr",vObj);
	                   request.setAttribute("userTypeId",userTypeId);
	                   request.setAttribute("rCnt", String.valueOf(rCnt));
	                   request.setAttribute("pNo", String.valueOf(pNo));
	               }
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} //request.getParameter("selMemTypeId");
               
             
               
               return new ModelAndView("membership-user-list");
             }
             
             else if(memProcess!=null && memProcess.trim().equalsIgnoreCase("uList")){
                 String userTypeId;
				try {
					userTypeId = hrsStBean.getHumanUserTypeId();
					 int rCnt =0;
	                 int pNo =1;
	                 String pageNo = request.getParameter("pn");

	                 if(pageNo!=null){
	                     pNo = Integer.parseInt(pageNo);
	                 }
	                 Debug.print("Page NO :"+pNo);
	                 if(userTypeId!=null && userTypeId.trim().length()>0) {
	                     Debug.print("memberId:" + userTypeId);
	                     rCnt = hrsStBean.userRowCount(userTypeId);
	                     Vector vObj = (Vector) hrsStBean.displayMemberUserList(userTypeId,pNo);
	                     request.setAttribute("dispStr",vObj);
	                     request.setAttribute("userTypeId",userTypeId);
	                     request.setAttribute("rCnt", String.valueOf(rCnt));
	                     request.setAttribute("pNo", String.valueOf(pNo));
	                 } 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}//request.getParameter("selMemTypeId");
                
                 return new ModelAndView("membership-user-list");
               }
		
             else if(memProcess!=null && memProcess.equals("updateStatus")){
                 String userId = request.getParameter("userId");
                 System.out.println("USER ID : "+userId);
                 //For Debug Starts
                 //String activeStat = "False";
                 String activeStat = request.getParameter("activeStatus");
                 //For Debug Ends
		    //public boolean editActiveStatus(String activeStat, String userId) throws RemoteException
                 boolean bol1 = hrsStBean.editActiveStatus(activeStat, userId);
                 System.out.println("Status is : "+bol1);

                 String userTypeId;
				try {
					userTypeId = hrsStBean.getHumanUserTypeId();
					 int rCnt =0;
	                 int pNo =1;
	                 String pageNo = request.getParameter("pn");
	                 
	                 if(pageNo!=null){
	                     pNo = Integer.parseInt(pageNo);
	                 }
	                 Debug.print("Page NO :"+pNo);
	                 if(userTypeId!=null && userTypeId.trim().length()>0) {
	                     Debug.print("memberId:" + userTypeId);
	                     rCnt = hrsStBean.userRowCount(userTypeId);
	                     Vector vObj = (Vector) hrsStBean.displayMemberUserList(userTypeId,pNo);
	                     request.setAttribute("dispStr",vObj);
	                     request.setAttribute("userTypeId",userTypeId);
	                     request.setAttribute("rCnt", String.valueOf(rCnt));
	                     request.setAttribute("pNo", String.valueOf(pNo));
	                 }
	                 
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} //request.getParameter("selMemTypeId");
                 
                
                 return new ModelAndView("membership-user-list");
          }	
		
		
             else if(memProcess!=null && memProcess.equals("viewMember")){
                 String userId = request.getParameter("userId");
                 System.out.println("userId In Servlet : "+userId);

                 userregvo = (HLCUserRegVO)hrsStBean.displayUserRegistrationFormOnUserId(userId);
                 Debug.print("Vector element in Servlet : "+userregvo);
                 request.setAttribute("viewMember",userregvo);
                
                 Debug.print("userregvo.getUserId() :"+userregvo.getUserId());

                 ArrayList donSelect=new ArrayList();
                 donSelect=hrsBean.getMemberDonationDetails(userregvo.getUserId());
                 request.setAttribute("donSelect",donSelect);

                 return new ModelAndView("membership-user-list");
             }	
		
		
		
		
		
		
		
	
	
	
	
	
	
		return null;	
	}	
}

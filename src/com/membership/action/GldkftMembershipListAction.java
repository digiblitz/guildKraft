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
import java.util.ArrayList;
import java.util.Vector;

import javax.ejb.FinderException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcmember.type.util.HLCMembershipTypeMaster;

public class GldkftMembershipListAction implements Controller {

	@Override
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

HLCKaveryMembershipTypeSessionBean membTypeBean=new HLCKaveryMembershipTypeSessionBean();
		
		HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
		HLCMahanadhiSessionBean acctBean=new HLCMahanadhiSessionBean();
		HLCkaverySessionBeanStatlessBean hrsBean= new HLCkaverySessionBeanStatlessBean();
		  HLCMembershipTypeMaster objMemberTypeMaster = new HLCMembershipTypeMaster();
		  GeneralDBAction db=new GeneralDBAction();
		HttpSession session=request.getSession(true); 
		String memProcess = request.getParameter("memProcess");
		

		 if(memProcess.equals("initList")){
            Debug.print("initList Called");
            Vector vDisUserType = membTypeBean.displayHumanMembershipTypeDetail();
                int i=0;
                while(i<vDisUserType.size())
                {
                    String[] val = (String[])vDisUserType.get(i);
                    String ID = val[1];
                    String name1 = val[2];
                    String amount=val[3];
                    Debug.print(amount);
/*
Debug.print("Value [0] is "+ID);
Debug.print("Value [1] is "+name1);*/
                    i++;
                }
            session.setAttribute("displayMemDetails" ,null);
            session.setAttribute("displayMemDetails" ,vDisUserType);
            ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
            request.setAttribute("accDetails",accDetails);
            return new ModelAndView("membership-view-membership-list");
          
     }
		 else if(memProcess.equals("createMemTyMaster")){
             Debug.print("createMemTyMaster Called");
             String uTypeId;
			try {
				uTypeId = membTypeBean.getUserTypeIdOnName("Human");
				objMemberTypeMaster.setUserTypeId(uTypeId);
			} catch (FinderException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
             String memName = request.getParameter("memName");
             String memAmount = request.getParameter("memAmount");
             String duration=request.getParameter("DurationNoDdl")+"-";
             duration=duration+request.getParameter("DurationTypeDdl");
             String periodValue = request.getParameter("periodValue");
             String QBTranascType = request.getParameter("transacType");
             String memYear = request.getParameter("memYear");
             String active_Status=request.getParameter("rd1");
                  int active=1;
                  if(active_Status.equals("1"))
                 {
                     active=1;
                 }
                  else
                 {
                     active=0;
                 }
             Debug.print("memYear "+memYear);
             
             if(memYear!=null && memYear.trim().length()!=0){
                 objMemberTypeMaster.setMembership_year(Integer.parseInt(memYear));
             }
             else{
                 objMemberTypeMaster.setMembership_year(0);
             }
             objMemberTypeMaster.setActive_Status(active);
             
             objMemberTypeMaster.setMembershipTypeName(memName);
             objMemberTypeMaster.setMembershipAmount(memAmount);
             objMemberTypeMaster.setPeriodValue(periodValue);
             objMemberTypeMaster.setTransaction_type_id(QBTranascType);
             objMemberTypeMaster.setDuration(duration);
             boolean stat=db.addMembershipTypeMaster(objMemberTypeMaster);
             Debug.print("Inserted Sucessfully "+stat);
            // String status=String.valueOf(stat);
             
             if(stat==true)
             {
                  Vector vMemDetails = membTypeBean.displayHumanMembershipTypeDetail();
                  ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
                 request.setAttribute("accDetails",accDetails);
                 session.setAttribute("displayMemDetails" ,null);
                 session.setAttribute("displayMemDetails" ,vMemDetails);
                 return new ModelAndView("membership-view-membership-list");

             }
             else
             {
             Vector vDisUserType;
			try {
				vDisUserType = membTypeBean.displayUserTypeDetails();
				ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
				 request.setAttribute("accDetails",accDetails);
				 session.setAttribute("displayUserTypeDetails" ,vDisUserType);
			} catch (FinderException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
             
            
             session.setAttribute("displayUserTypeDetails" ,null);
            
             session.setAttribute("displayMemDetails" ,null);
             request.setAttribute("status",String.valueOf(stat));
             
           
             return new ModelAndView("membership-create-memb-type");
               
             }
             
      }
		 
		 else if(memProcess.equals("memTyDelete")){
             Debug.print("memTyDelete Called");
             String memId[] = request.getParameterValues("select11");
             String typeid;
              System.out.println("You have selected:"+memId.length);

              if(memId.length!=0)
              {
                 for(int i=0;i<memId.length;i++)
                 {
                     typeid=memId[i];
                     if(typeid!=null && typeid.trim().length()!=0)
                     {
							 // Method HLCMembershipType in com.hlcmember.type.stateless
                          boolean result;
						try {
							result = membTypeBean.deleteMembershipTypeMaster(typeid);
						    System.out.println("MembershipTypeId: "+typeid);
	                          System.out.println("Delete Operation Result "+result);
						} catch (FinderException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

                      
                     }

                 }

              }

              Vector vMemDetails = membTypeBean.displayHumanMembershipTypeDetail();
              ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
                 request.setAttribute("accDetails",accDetails);
              session.setAttribute("displayMemDetails" ,null);
              session.setAttribute("displayMemDetails" ,vMemDetails);
              return new ModelAndView("membership-view-membership-list");
				
                 }
		 
	      else if(memProcess.equals("Listing"))
          {
                 Debug.print("Inside Listing");
                 String memId = request.getParameter("memId");
                 String process = request.getParameter("btnsubmit"); 
                 Debug.print("memId is "+memId);
                 Debug.print("button Value "+process);

                     /*This Condition is selected When Delete Button is Clicked In Human Membership Type Page

                      */
//3/10/2011
                    if(process.equals("Delete"))
                     {
                          Debug.print("memTyDelete Called");

                             String memID[] = request.getParameterValues("select11");
                             String typeid;
                            //System.out.println("You have selected:"+memID.length);

                             // typeid=memID[0];
                              if(memID!=null)
                                 {
                                  System.out.println("You have selected:"+memID.length);
                                     for(int i=0;i<memID.length;i++)
                                     {
                                         typeid=memID[i];
                                        if(typeid!=null && typeid.trim().length()!=0)
                                        {
                                            boolean result;
											try {
												result = membTypeBean.deleteMembershipTypeMaster(typeid);
												 System.out.println("MembershipTypeId: "+typeid);
	                                             System.out.println("Delete Operation Result "+result);

											} catch (FinderException e) {
												// TODO Auto-generated catch block
												e.printStackTrace();
											}
                                            
                                         }
                                    }
                                }
                               Vector vMemDetails = membTypeBean.displayHumanMembershipTypeDetail();
                               ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
                    request.setAttribute("accDetails",accDetails);
                               session.setAttribute("displayMemDetails" ,null);
                               session.setAttribute("displayMemDetails" ,vMemDetails);
                               return new ModelAndView("membership-view-membership-list");

                     }
                    else if(process.equals("Update"))
                    {
                        String index=request.getParameter("index1");
                        String memName=request.getParameter("TypeNameText"+index);
                        Debug.print("Index Value"+index);
                        String memAmount=request.getParameter("TypeAmtText"+index);
                        Debug.print("Membership Name,MEmbership Amount"+memName+memAmount);
                        String active_Status=request.getParameter("rd"+index);
                        Debug.print("Active Status"+active_Status);
                        int active;
                        String duration=request.getParameter("TypeDurationnoDdl"+index)+"-";
                        duration=duration+request.getParameter("TypeDurationtypeDdl"+index);
                        Debug.print("Active Status"+request.getParameter("TypeDurationtypeDdl"+index));
                        Debug.print("Active Status"+duration);
                        if(active_Status.equals("active"))
                        {
                            active=1;
                        }
                         else
                        {
                            active=0;
                        }
                        objMemberTypeMaster.setMembershipTypeId(memId);
                        objMemberTypeMaster.setMembershipTypeName(memName);
                        objMemberTypeMaster.setMembershipAmount(memAmount);
                        objMemberTypeMaster.setActive_Status(active);
                         objMemberTypeMaster.setDuration(duration);
                          boolean stat;
						try {
							stat = membTypeBean.editHumanMembershipTypeMaster(objMemberTypeMaster);
							if(stat==true)
	                          {
	                              Debug.print("Update Sucessful on Membership ID"+memId);
	                          }
						} catch (FinderException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                          
                           Vector vDisUserType = membTypeBean.displayHumanMembershipTypeDetail();
                           ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
                         request.setAttribute("accDetails",accDetails);
                        session.setAttribute("displayUserTypeDetails" ,null);
                        session.setAttribute("displayMemDetails" ,vDisUserType);
                        return new ModelAndView("membership-view-membership-list");

                    }
                      else if(process.equals("Add"))
                     {
	Debug.print("initCreate Called");
	//String uTypeId = remote.getUserTypeIdOnName("Human");
	ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
	//session.setAttribute("displayUserTypeDetails" ,null);
	 //session.setAttribute("displayUserTypeDetails" ,vDisUserType);
	 Debug.print("The After the list");
	 session.setAttribute("displayMemDetails" ,null);
	  request.setAttribute("accDetails",accDetails);
	 // request.setAttribute("uTypeId",uTypeId);
	  request.setAttribute("status","true");
	 
	 return new ModelAndView("membership-create-memb-type");                    
                     }

                     else
                     {
                          return null;
                }
                 }
		
		
	      else if(memProcess.equals("initEdit")){
              Debug.print("initEdit Called");
              String memId = request.getParameter("memId");
              if(memId!=null && memId.trim().length()!=0){
                  String[] vMemDetail;
				try {
					vMemDetail = membTypeBean.getMembershipTypeDetail(memId);
					 ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
	                 // Vector vDisUserType = remote.displayUserTypeDetails();
	                  int year = membTypeBean.getMembershipTypeYearOnId(memId);
	                  request.setAttribute("year",String.valueOf(year));
	                  session.setAttribute("displayEditMemDetails" ,null);
	                  session.setAttribute("displayEditMemDetails" ,vMemDetail);
	                  //session.setAttribute("displayUserTypeDetails" ,null);
	                  //session.setAttribute("displayUserTypeDetails" ,vDisUserType);
	                  request.setAttribute("uTypeId",memId);
	                  request.setAttribute("accDetails",accDetails);
	                  request.setAttribute("status","true");
				} catch (FinderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                 
                  return new ModelAndView("membership-edit-memb-type");
              }
              //return mapping.findForward("admin");
       }
       	
		
	      else if(memProcess.equals("memTyEdit")){
              Debug.print("memTyEdit Called");
              String memId = request.getParameter("memId");
              
              if(memId!=null && memId.trim().length()!=0){
                  String memName = request.getParameter("memName");
                  String memAmount = request.getParameter("memAmount");
                  String uTypeId = request.getParameter("uType");
                  String periodValue = request.getParameter("periodValue");
                  String transacType= request.getParameter("transacType");
                  //Debugs starts by Lakshmi
                  String year1 = request.getParameter("memyear");
                  //Debugs Ends by lakshmi
                  Debug.print("memyear"+ year1);
                  String duration=request.getParameter("DurationNoDdl")+"-";
                  duration=duration+request.getParameter("DurationTypeDdl");
                   String active_Status=request.getParameter("rd1");
                   int active=1;
                    if(active_Status.equals("active"))
                  {
                      active=1;
                  }
                   else
                  {
                      active=0;
                  }
                  objMemberTypeMaster.setMembershipTypeId(memId);
                  objMemberTypeMaster.setUserTypeId(uTypeId);
                  objMemberTypeMaster.setMembershipTypeName(memName);
                  objMemberTypeMaster.setMembershipAmount(memAmount);
                  objMemberTypeMaster.setPeriodValue(periodValue);
                  objMemberTypeMaster.setTransaction_type_id(transacType);
                  objMemberTypeMaster.setActive_Status(active);
                   objMemberTypeMaster.setDuration(duration);
                  if(year1!=null && !year1.equalsIgnoreCase("0")){
                      objMemberTypeMaster.setMembership_year(Integer.parseInt(year1));
                  }
                  else{
                      objMemberTypeMaster.setMembership_year(0);
                  }
                  
                  boolean stat;
				try {
					stat = db.editHumanMembershipTypeMaster(objMemberTypeMaster);
					   if(stat==true){
		                      Debug.print("memTyEdit Sucessfully Editted:" + memId);
		                      String sesYear = (String)session.getAttribute("year");
		                      int year = 0;
		                      if(sesYear !=null && sesYear.trim().length()!=0){
		                          year = Integer.parseInt(sesYear);
		                      }         
		                      String membTxt = (String)session.getAttribute("membTxt");
		                      //Vector vMemDetails = remote.displayMembershipType(uTypeId);
		                      Vector vMemDetails = membTypeBean.displayHumanMembershipTypeDetail();;
		                      //Vector vDisUserType = remote.displayUserTypeDetails();
		                      ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
		                       request.setAttribute("accDetails",accDetails);
		                     // session.setAttribute("displayUserTypeDetails" ,null);
		                      //session.setAttribute("displayUserTypeDetails" ,vDisUserType);
		                      session.setAttribute("displayMemDetails" ,null);
		                      session.setAttribute("displayMemDetails" ,vMemDetails);
		                      request.setAttribute("uTypeId",uTypeId);
		                      request.setAttribute("status",String.valueOf(stat));
		                      request.setAttribute("membTxt",membTxt);
		                      return new ModelAndView("membership-view-membership-list");
		                  }
		                  else{
		                      String [] vMemDetail = membTypeBean.getMembershipTypeDetail(memId);
		                      int year = membTypeBean.getMembershipTypeYearOnId(memId);
		                      request.setAttribute("year",String.valueOf(year));                                            
		                      ArrayList accDetails = (ArrayList) membTypeBean.getAccTxnTypDetails();
		                      Vector vDisUserType = membTypeBean.displayUserTypeDetails();

		                      session.setAttribute("displayEditMemDetails" ,null);
		                      session.setAttribute("displayEditMemDetails" ,vMemDetail);
		                    //  session.setAttribute("displayUserTypeDetails" ,null);
		                     // session.setAttribute("displayUserTypeDetails" ,vDisUserType);
		                      request.setAttribute("uTypeId",memId);
		                      //For Debugs Starts
		                     request.setAttribute("memName", memName);
		                     Debug.print("memName"+memName);
		                     //For Debugs Ends
		                      request.setAttribute("accDetails",accDetails);
		                      request.setAttribute("status","false");
		                      return new ModelAndView("membership-edit-memb-type");                                         
		                  }
				} catch (FinderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
               
              }
             // return mapping.findForward("admin");
       }		
		
		
		
		
		
		
		
		
		
		
	
		
		return null;
	}
}

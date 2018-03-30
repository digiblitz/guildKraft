/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
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
import com.google.gson.Gson;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCPaymentDetails;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.util.HLCUserRegVO;
import com.hlckavery.stateless.HLCkaveryStatelessBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcpublication.DAO.HLCPublicationDAO;

public class GldkftMembershipRegistrationAction implements Controller {
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
	
		HLCKaveryMembershipTypeSessionBean memberRemote=new HLCKaveryMembershipTypeSessionBean();
		HLCMahanadhiSessionBean acctBean=new HLCMahanadhiSessionBean();
		HLCkaverySessionBeanStatlessBean remote= new HLCkaverySessionBeanStatlessBean();
		HLCKaverySessionStatefulBean hrsStBean= new HLCKaverySessionStatefulBean();
				
		 HLCkaverystatelessBean remote1 = new HLCkaverystatelessBean();
         HLCkaveryStatelessBean remote2 = new HLCkaveryStatelessBean();
         HLCPublicationDAO hp = new HLCPublicationDAO();
        
		GeneralDBAction db=new GeneralDBAction();	
		
		 HttpSession session=request.getSession(true); 
		
		 
		String process=request.getParameter("process");
		System.out.println("Process in servlet : "+process);
		 String usrId=(String) session.getAttribute("userId");
         
		
        Vector dispMembershipTypeVect = new Vector();
        Vector areUAMemberVect = new Vector();
        Vector membershipToVect = new Vector();
        Vector serviceTypeVect = new Vector();
        
        String memberId=(String) session.getAttribute("memberId");
        String userIdforDate = (String)session.getAttribute("userId");
        
        
        areUAMemberVect = remote.areUAMember();
        membershipToVect = remote.membershipTo();
        
        String country=remote.getCountryName(usrId);
        Debug.print("User Country :"+country);
        
        
        ArrayList donDet=new ArrayList();
        donDet=db.getAllDonationDetails();
      
        
        java.util.Calendar toDay1 = java.util.Calendar.getInstance();
        int newyear1 = toDay1.get(Calendar.YEAR);
        int new_month1 = toDay1.get(Calendar.MONTH);
        Debug.print("new Year1 "+newyear1);
        Debug.print("new month "+new_month1);
        String[] addonPrice= new String[2];
        if(new_month1==11){
            Debug.print("In month == 11");
            dispMembershipTypeVect = memberRemote.displayMembershipTypeOnYearAndTypeName("human",newyear1+1);
            addonPrice = remote.getFamilyAddOnPrice("family member",newyear1+1);
        } else{
            Debug.print("In month != 11");
            dispMembershipTypeVect = remote.getMembershipTypesOnCurYr("Human");
            addonPrice = remote.getFamilyAddOnPrice("family member",newyear1);
        }
        
        ArrayList humanMembTypes = memberRemote.getMembershipTypeForRegisteration();
        request.setAttribute("humanMembTypes",humanMembTypes);
        
        //dispMembershipTypeVect = remote.displayMembershipType("Human");
        
       
        serviceTypeVect=remote.displayHorsePhoneServiceType("Horse");
        
        request.setAttribute("dispMembershipTypeVect", dispMembershipTypeVect);
        request.setAttribute("areUAMemberVect", areUAMemberVect);
        request.setAttribute("membershipToVect", membershipToVect);
        request.setAttribute("addonPrice",addonPrice);
        request.setAttribute("donDet",donDet);
        request.setAttribute("country",country);
        request.setAttribute("serviceTypeVect",serviceTypeVect);
		

		 boolean memextstat=remote1.isMemberExist(userIdforDate);
         Debug.print("remote1.isMemberExist(userIdforDate) :"+memextstat);
		
		if(process.equalsIgnoreCase("reg")) {
            //Debug.print("isMemberExist status in servlet :" + memextstat);
            
            Debug.print("     User Id:" + userIdforDate);
            Date dob = null;
            dob=remote1.getUserBirthDate(userIdforDate);
            Debug.print("     User DOB:" + dob);
            
            Debug.print("dob in Servlet:" + dob);
            request.setAttribute("dobCnt",dob);
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            
            ArrayList objlist = (ArrayList)db.getAllPublicationDetails();
            request.setAttribute("DispPubDetails",objlist);
            
            
            //Added for Furture year price
            
            java.util.Calendar toDay = java.util.Calendar.getInstance();
            int newyear = toDay.get(Calendar.YEAR);
            
            String[] dBnewFamilyPrice = memberRemote.selectNextYrPrice("family member",newyear+1);
            String newFamilyPrice = dBnewFamilyPrice[0]+"#"+dBnewFamilyPrice[1];
            Debug.print("New Family Price "+newFamilyPrice);
            request.setAttribute("newFamilyPrice",newFamilyPrice);
            
            // Ended for Furture year price
            
            if(memextstat==true) {
                
                String stat="If you would like to renew your membership, please go to our <a href=" + "MembershipReg.do?process=renew" +">Renewal Page</a>";
                Debug.print("stat in servlet "+stat);
                request.setAttribute("stat",stat);
                return new ModelAndView("memb-reg-eligibility");
               
            } else {
                
                return new ModelAndView("member-registration");
            }
            
        }
		if(process.equalsIgnoreCase("preMemReg")) {
			ArrayList objlist = (ArrayList)db.getAllPublicationDetails();
            request.setAttribute("DispPubDetails",objlist);
			return new ModelAndView("preMemberShip");
		}
		
		
		 if(process.equalsIgnoreCase("renew")) {
             String fwd=null;
            
             System.out.println("inside membership renewal diaplay block : ");
             if(memberId==null){
                 if(memextstat==false){
                     String stat="Sorry You should first register as a member !!";
                     request.setAttribute("stat",stat);
                     fwd="memb-reg-ren-eligibility";
                 }
             } else{
                 String status=remote1.getStatusByMemberId(memberId);
                 System.out.println("memberId : "+memberId);
                 
                 if(memberId != null){
                     ArrayList histValues = remote1.getMembershipStatusFromHistory(memberId);
                     request.setAttribute("histValues",histValues);
                 }
                 
                 java.util.Calendar toDay = java.util.Calendar.getInstance();
                 int newyear = toDay.get(Calendar.YEAR);
                 
                 Enumeration itrators= (Enumeration)dispMembershipTypeVect.elements();
                 String memNme = "";
                 
                 HLCMemberDetails objMember = new HLCMemberDetails();
                 objMember=remote1.displayMemberDetail(memberId);
                 
                 String membTypId = objMember.getMembershipTypeId();
                 int prior_val = memberRemote.selectPriorityValue(membTypId);
                 request.setAttribute("prior_value",String.valueOf(prior_val));
                 
                 //Added for Furture year price
                 String[] dBfuturePrice = memberRemote.selectNextYrPrice(objMember.getMembershipTypeName(),newyear+1);
                 String futurePrice = dBfuturePrice[0]+"#"+dBfuturePrice[1];
                 Debug.print("futurePrice  "+futurePrice);
                 request.setAttribute("futurePrice",futurePrice);
                 
                 String[] dBnewFamilyPrice = memberRemote.selectNextYrPrice("family member",newyear+1);
                 String newFamilyPrice = dBnewFamilyPrice[0]+"#"+dBnewFamilyPrice[1];
                 Debug.print("New Family Price "+newFamilyPrice);
                 request.setAttribute("newFamilyPrice",newFamilyPrice);
                 
                 // Ended for Furture year price
                 Debug.print("remote1.displayMemberDetail(memberId) :" + objMember);
                 System.out.println("objMember.getMembershipTypeName() from servlet : "+objMember.getMembershipTypeName());
                 
                 Vector userVect3 = null;
				try {
					userVect3 = memberRemote.selectDetailsForMember(memberId);
				} catch (FinderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                 request.setAttribute("userTypeVect3",userVect3);
                 
                 Date dob = null;
                 dob=remote1.getUserBirthDate(userIdforDate);
                 Debug.print("     User DOB:" + dob);
                 
                 Date expDt=new Date();
                 expDt=remote1.getExpiredDate(memberId);
                 Debug.print("remote1.getExpiredDate(memberId) :" + expDt);
                 request.setAttribute("expDt",expDt);
                 request.setAttribute("status",status);
                 
                 Debug.print("dob in Servlet:" + dob);
                 request.setAttribute("dobCnt",dob);
                 
                 request.setAttribute("objMember",objMember);
                 
                 ArrayList nonhlc=new ArrayList();
                 ArrayList donSelect=new ArrayList();
                 
                 nonhlc=remote.getMemberNonUseaDetails(memberId);
                 Debug.print("user Id from session : " +userIdforDate);
                 
                 donSelect=remote.getMemberDonationDetails(userIdforDate);
                 
                 request.setAttribute("nonhlc",nonhlc);
                 request.setAttribute("donSelect",donSelect);
                 
                 ArrayList objlist = (ArrayList)hp.selectAllPublicationDetails();
                 request.setAttribute("DispPubDetails",objlist);
                 
                 if(memberId!=null) {
                     if(memextstat==true && !status.equalsIgnoreCase("Pending")) {
                         fwd="member-registration-renewal";
                     } else {
                         if(status.equalsIgnoreCase("Pending")) {
                             String stat="Sorry Your membership approval status is still pending !!";
                             request.setAttribute("stat",stat);
                             request.setAttribute("membStat",status);
                         }
                         
                         if(memextstat==false) {
                             String stat="Sorry You should first register as a member !!";
                             request.setAttribute("stat",stat);
                         }
                         
                         fwd="memb-reg-ren-eligibility";
                         
                     }
                     
                     
                 }
                 
                 else {
                     if(memextstat==false) {
                         String stat="Sorry You should first register as a member !!";
                         request.setAttribute("stat",stat);
                     } else {
                         
                         String stat="Sorry Your membership approval status is still pending !!";
                         request.setAttribute("stat",stat);
                         request.setAttribute("membStat",status);
                     }
                     
                     fwd="memb-reg-ren-eligibility";
                 }
             }
             
             return new ModelAndView(fwd);
         }
         
		
		
		 if(process.equalsIgnoreCase("familyView")) {
             Debug.print("process in Family View"+process);
             try{
             ArrayList donSelect1=new ArrayList();
             HLCMemberDetails objMember = new HLCMemberDetails();
             ArrayList mailPreference = new ArrayList();
             ArrayList familyAddOnId = new ArrayList();
             ArrayList nonhlc=new ArrayList();
             
             String memberId1=request.getParameter("familyAddOnId1");
             String familyUserId=request.getParameter("userId");
             
             if(memberId1 != null && memberId1.trim().length()!= 0) {                 
                 Debug.print("request.getParameter(familyAddOnId1) in FamilyView :"+memberId1); 
                 if(familyUserId != null && familyUserId.trim().length() != 0) {                         
                     Debug.print("request.getParameter(userId) in FamilyView :"+familyUserId);
                     request.setAttribute("userId",familyUserId);                           
                     donSelect1=remote.getMemberDonationDetails(familyUserId);
                     Debug.print("donSelect1 in familyView " +donSelect1);
                     if(donSelect1!=null){
                         request.setAttribute("donSelect1",donSelect1);
                     } else {
                         
                         request.setAttribute("donSelect1",null);
                     }
                     ArrayList resultNew = (ArrayList)remote1.getUserContactDetailsForAdmin(familyUserId);
                     String mailStatus = (String)resultNew.get(16);
                     String splNotes = (String)resultNew.get(17);
                     System.out.println("Click mailStatus in Family View:"+mailStatus);
                     System.out.println("Click splNotes in Family View:"+splNotes);
                     request.setAttribute("mailStatus",mailStatus);
                     request.setAttribute("splNotes",splNotes);
                     
                     Date approvalDate =(Date) remote1.getApprovedDate(memberId1);
                     request.setAttribute("approvalDate",approvalDate);
                     HLCUserRegVO userregvo=new HLCUserRegVO();
                     userregvo = hrsStBean.selectUserRegistrationForm1(familyUserId);
                     Debug.print("user details :"+userregvo.toString());
                     request.setAttribute("userregvo",userregvo);
                     Vector userVect3=memberRemote.selectDetailsForMember(memberId1);
                     request.setAttribute("userTypeVect3",userVect3);
                     objMember=remote1.displayMemberDetail(memberId1);
                     request.setAttribute("objMember",objMember);
                     mailPreference = memberRemote.getMailPreference(memberId1);
                     familyAddOnId = memberRemote.getFamilyAddOnId(memberId1);
                     nonhlc=remote.getMemberNonUseaDetails(memberId1);
                     
                     request.setAttribute("nonhlc",nonhlc);
                     request.setAttribute("mailPreference",mailPreference);
                     request.setAttribute("familyAddOnId",familyAddOnId);
                     
                     HLCPaymentDetails objPayment = new HLCPaymentDetails();
                     objPayment=remote1.getPaymentDetails(objMember.getPaymentId());
                     request.setAttribute("objPayment",objPayment);
                     
                     Debug.print("objMember.getPaymentId() in Family View :"+objMember.getPaymentId());
                     System.out.println("objPayment :"+objPayment.toString());
                     
                     if(request.getParameter("memberId") != null){
                         String memberId2=request.getParameter("memberId");
                         Debug.print("memberId2 in Family View" +memberId2);
                         ArrayList histValues = remote1.getMembershipDetailsFromHistory(memberId2);
                         request.setAttribute("histValues",histValues);
                     }
                 }
            
             //fwd="famMembView";
             return new ModelAndView("frmViewFamilyMember-Regi");
             }
              /*
             * Redirect to approve-memberSearch-regi.jsp Page
             */
             
             else if(request.getParameter("status") != null) {
             Debug.print("request.getParameter(status) in Family View approve :"+request.getParameter("status"));
             String approMembId=request.getParameter("memberId");
             String appUserId=request.getParameter("userId");                   
             if(approMembId != null && approMembId.trim().length()!= 0) {                 
                 Debug.print("request.getParameter(familyAddOnId1) in FamilyView approve :"+approMembId); 
                 
                 if(appUserId != null && appUserId.trim().length() != 0) {                        
                     Debug.print("request.getParameter(userId) in FamilyView approve :"+appUserId);
                     request.setAttribute("userId",appUserId);                           
                     donSelect1=remote.getMemberDonationDetails(appUserId);
                     Debug.print("donSelect1 in familyView approve " +donSelect1);
                     if(donSelect1!=null){
                         request.setAttribute("donSelect1",donSelect1);
                     } else {
                         
                         request.setAttribute("donSelect1",null);
                     }
                     ArrayList resultNew = (ArrayList)remote1.getUserContactDetailsForAdmin(appUserId);
                     String mailStatus = (String)resultNew.get(16);
                     String splNotes = (String)resultNew.get(17);
                     System.out.println("Click mailStatus in Family View approve:"+mailStatus);
                     System.out.println("Click splNotes in Family View approve:"+splNotes);
                     request.setAttribute("mailStatus",mailStatus);
                     request.setAttribute("splNotes",splNotes);
                     
                     Date approvalDate =(Date) remote1.getApprovedDate(approMembId);
                     request.setAttribute("approvalDate",approvalDate);
                     HLCUserRegVO userregvo=new HLCUserRegVO();
                     userregvo = hrsStBean.selectUserRegistrationForm1(appUserId);
                     Debug.print("user details :"+userregvo.toString());
                     request.setAttribute("userregvo",userregvo);
                     Vector userVect3=memberRemote.selectDetailsForMember(approMembId);
                     request.setAttribute("userTypeVect3",userVect3);
                     objMember=remote1.displayMemberDetail(approMembId);
                     request.setAttribute("objMember",objMember);
                     mailPreference = memberRemote.getMailPreference(approMembId);
                     familyAddOnId = memberRemote.getFamilyAddOnId(approMembId);
                     nonhlc=remote.getMemberNonUseaDetails(approMembId);
                     
                     request.setAttribute("nonhlc",nonhlc);
                     request.setAttribute("mailPreference",mailPreference);
                     request.setAttribute("familyAddOnId",familyAddOnId);
                     
                     HLCPaymentDetails objPayment = new HLCPaymentDetails();
                     objPayment=remote1.getPaymentDetails(objMember.getPaymentId());
                     request.setAttribute("objPayment",objPayment);
                     
                     Debug.print("objMember.getPaymentId() in Family View approve :"+objMember.getPaymentId());
                     System.out.println("objPayment :"+objPayment.toString());
                     
                     if(request.getParameter("memberId") != null){
                         String memberId3=request.getParameter("memberId");
                         Debug.print("memberId3 in Family View approve" +memberId3);
                         ArrayList histValues = remote1.getMembershipDetailsFromHistory(memberId3);
                         request.setAttribute("histValues",histValues);
                     }
                 }            
             }
          //fwd="approveMemb";
          return new ModelAndView("approve-memberSearch-regi");      
             }
             
             }catch(FinderException e){
            	 e.printStackTrace();
             }
               
         }
		
		 if(process.equalsIgnoreCase("autosearch")) {
			 response.setContentType("application/json");
             try {
                     String term = request.getParameter("term");
                     System.out.println("Data from ajax call " + term);

                     ArrayList list = db.autoSearch(term);
                      

                     String searchList = new Gson().toJson(list);
                     response.getWriter().write(searchList);
             } catch (Exception e) {
                     System.err.println(e.getMessage());
             } 
		 }
		
		
	
    
		return null;	
		}	
	

}

/*
 * OnlineEntriesListAction.java
 *
 * Created on November 1, 2007, 10:52 AM
 */

package com.oec.action;

import com.db.ELMTdbaction;
import com.db.GeneralDBAction;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCMemberVO;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;

import com.hlccommon.util.Debug;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCEventRequestVO;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;
/**
 *
 * @author Dhivya
 * @version
 */


	public class OnlineEntriesListAction implements Controller {
    
    
    
    /**
     * This is the action called from the Struts framework.
     * @param mapping The ActionMapping used to select this instance.
     * @param form The optional ActionForm bean for this request.
     * @param request The HTTP Request we are processing.
     * @param response The HTTP Response we are processing.
     * @throws java.lang.Exception
     * @return
     */
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {

        
        try{
        	GeneralDBAction db=new GeneralDBAction();
			HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
			 ELMTdbaction dbelmt=new ELMTdbaction();
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            String process=request.getParameter("process");
            HttpSession session = request.getSession(true);
            
          if(process!=null && process.equalsIgnoreCase("initList")){
                ArrayList allAreaList = null;
                allAreaList = (ArrayList)krishnaBean.getAllAreaMasters();
                request.setAttribute("allAreaList",allAreaList);
                return new ModelAndView("frmProCalUseaStaffList");
            } else if(process!=null && process.equalsIgnoreCase("list")){
                ArrayList objProCalList = null;
                HLCCalendarVO objCalVO = new HLCCalendarVO();
                String orgId="";
                String orgFirstName = "";
                String orgLastName = "";
                String year = request.getParameter("year");
                int tempYear=Integer.parseInt(year);
                String area =request.getParameter("selArea");
                String organizerId =(String)session.getAttribute("memberId");
                String firstName =(String)session.getAttribute("firstName");
                String lastName =(String)session.getAttribute("lastName");
                if(tempYear!=0 && area!=null && area.trim().length()!=0){
                    objProCalList = krishnaBean.getUseaStaffList(tempYear,area);
                }
                if(objProCalList!=null && objProCalList.size()!=0) {
                Iterator itr =objProCalList.iterator();
                    while(itr.hasNext()){
                    objCalVO =(HLCCalendarVO)itr.next();
                    orgId = objCalVO.getOrganizerId();
                        if(orgId!=null && orgId.trim().length()!=0){
                            HLCMemberVO meVO = membQualBean.getMemberDetails(orgId);
                            orgFirstName = meVO.getFirstName();
                            orgLastName = meVO.getLastName();
                            objCalVO.setOrgFName(orgFirstName);
                            objCalVO.setOrgLName(orgLastName);
                        }
                    }    
                }
                    request.setAttribute("objProCalList",objProCalList);
                    request.setAttribute("year",year);
                    request.setAttribute("area",area);
                
                request.setAttribute("firstName",firstName);
                request.setAttribute("lastName",lastName);
                ArrayList allAreaList = null;
                allAreaList = (ArrayList)krishnaBean.getAllAreaMasters();
                request.setAttribute("allAreaList",allAreaList);
                return new ModelAndView("frmProCalUseaStaffList");
            } else if(process!=null && process.equalsIgnoreCase("eventView")){
                String provisionalId = request.getParameter("provisionId");
                HLCCalendarVO objCalVO = new HLCCalendarVO();
                if(provisionalId!=null && provisionalId.trim().length()!=0){
                    objCalVO = krishnaBean.getSingleEventDetails(provisionalId);
                }
                request.setAttribute("objCalVO",objCalVO);
                return new ModelAndView("frmProCalUseaStaffView");
            } else if(process!=null && process.equalsIgnoreCase("initEventApprove")){
                String provisionalId = request.getParameter("provisionId");
                HLCCalendarVO objCalVO = new HLCCalendarVO();
                if(provisionalId!=null && provisionalId.trim().length()!=0){
                    objCalVO = krishnaBean.getSingleEventDetails(provisionalId);
                }
                request.setAttribute("singleEventDetails",objCalVO);
                return new ModelAndView("frmProCalUseaStaffApprove");
            } else if(process!=null && process.equalsIgnoreCase("eventApprove")){
                String uStaffStatus = request.getParameter("uStaffStatus");
                String uStaffComments = request.getParameter("uStaffComments");
                String provisionalId = request.getParameter("provisionId");
                String eventId=request.getParameter("eventId");
                
                boolean result = false;
                if(provisionalId!=null && provisionalId.trim().length()!=0 && uStaffStatus!=null && uStaffStatus.trim().length()!=0){
                    result = krishnaBean.approveEventDetailsByUStaff(provisionalId, uStaffStatus, uStaffComments);
                }
               if(result){
                   ArrayList eveStatList = krishnaBean.getEventDetsApprovedByAll(provisionalId,eventId);
                    String areaChApprovStat="";
                     String orgApprovStat="";
                     String uStaffApprovStat="";
                     String oldEventId="";
                     int compYear=0;
                 if(eveStatList!=null && eveStatList.size()!=0){               
                 Iterator itr =eveStatList.iterator(); 
                 HLCCalendarVO calVO = new HLCCalendarVO();
                 while(itr.hasNext()){
                calVO =(HLCCalendarVO)itr.next();
                String provisionId = calVO.getCalenderId();
                System.out.println("provisionId in jsp"+provisionId);
                String orgId=calVO.getOrganizerId();
                Date beginDate=calVO.getBeginDate();
                Date endDate=calVO.getEndDate();                                              
                String eventTitle=calVO.getEventTitle();                
                String areaCode=calVO.getAreaCode();
                String areaName=calVO.getAreaName();
                String stateName=calVO.getStateName();
                 areaChApprovStat=calVO.getOrgApprovalStatus();
                String orgFirstName = calVO.getOrgFName();  
                String orgLastName = calVO.getOrgLName();
                String userId = calVO.getUserId();                
                 orgApprovStat=calVO.getOrgApprovalStatus();   
                 uStaffApprovStat=calVO.getApprovalStatus(); 
                eventId=calVO.getEventId();  
                 oldEventId=calVO.getOldEventId(); 
                 compYear=calVO.getCompYear();
                 }                                                         
          if(orgApprovStat!=null && orgApprovStat.equalsIgnoreCase("Approved") && areaChApprovStat!=null && areaChApprovStat.equalsIgnoreCase("Approved") && uStaffApprovStat!=null && uStaffApprovStat.equalsIgnoreCase("Approved") && oldEventId!=null && eventId!=null){
              boolean output=krishnaBean.eveDetailsExistsInEveTable(eventId);
              Debug.print("output:" +output);
              if(output==false){
              ArrayList eveStatList1 = krishnaBean.getOldEventDetails(oldEventId);
              ArrayList eveStatList2 = krishnaBean.getOldEventHistoryDetails(oldEventId);
              boolean resultStat=false;
              boolean resultHistStat=false;
              if(eveStatList1!=null && eveStatList1.size()!=0){                  
              Iterator itr1 =eveStatList1.iterator();
             
              if(itr1.hasNext()){
             HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr1.next();             
             String compLocation=objEventDetails.getCompetition_location();
             Debug.print("compLocation in servlet:" +compLocation);
            String compCity=objEventDetails.getCompetition_city();
            String compCountry=objEventDetails.getCompetition_country();
            String issueId=objEventDetails.getIssueId();
            float entryFee=objEventDetails.getEntry_fee();
            String otherEntryFee=objEventDetails.getOther_entry_fee();
            String membApplicable=objEventDetails.getMembership_applicable();
            String doubleEntryFee=objEventDetails.getDouble_entry_fee_status();
            float offFee=objEventDetails.getOffice_fee();
            String chkPayTo=objEventDetails.getCheck_payable_to();
            float pinneyChrg=objEventDetails.getPinnies_charge();
            int pinneyPos=objEventDetails.getPinnies_position();
            String awdTrophy=objEventDetails.getAward_trophy();
            String awdPrize=objEventDetails.getAward_prize();
            String awdOthers=objEventDetails.getAward_others();
            Date dateAvail=objEventDetails.getDate_available();
            String availableFrom=objEventDetails.getAvailable_from();
            String availFrmOther=objEventDetails.getAvailable_from_other();
            int availPosition=objEventDetails.getAvailable_position();
            boolean stabLimited=objEventDetails.isStabling_limited();
            float stallPerNightPrice=objEventDetails.getStall_pernight_price();
            float perStallPrice=objEventDetails.getPer_stall_price();
            String perStallFrmTime=objEventDetails.getPer_stall_from_time();
            Date perStallFrmDt=objEventDetails.getPer_stall_from_date();
            
            String perStallToTime=objEventDetails.getPer_stall_to_time();
            Date perStallToDt=objEventDetails.getPer_stall_to_date();
            int noOfStalls=objEventDetails.getNo_of_stalls();
            int noOfTempStalls=objEventDetails.getNo_of_temp_stalls();
            int noOfTempPermantStalls=objEventDetails.getNo_of_temp_permanent_stalls();
            
            String milesFrmEvent=objEventDetails.getMiles_from_event();
            String vertName=objEventDetails.getVeterinarian_name();
            String vertPhne=objEventDetails.getVeterinarian_phone();
            String vertPlace=objEventDetails.getVeterinarian_place();
            String accomCamp=objEventDetails.getAccomodation_camping();
            
            String direct=objEventDetails.getDirections();
            String footingDesc=objEventDetails.getFooting_desc();
            String comments=objEventDetails.getComments();
            String orgId=objEventDetails.getOrgId();
             Debug.print("orgId in servlet:" +orgId);
            String eveTitle=objEventDetails.getEventTitle();
            Debug.print("eveTitle in servlet:" +eveTitle);
             String compZip=objEventDetails.getCompetition_zip();
             String userId=objEventDetails.getUserId();
           
            
            if(compLocation!=null && compLocation.trim().length()!=0){
                objEventDetails.setCompetition_location(compLocation);
            }else{
                objEventDetails.setCompetition_location(null);
            }
            
            if(compCity!=null && compCity.trim().length()!=0){
                objEventDetails.setCompetition_city(compCity);
            }else{
               objEventDetails.setCompetition_city(null);
            }
            
            if(compCountry!=null && compCountry.trim().length()!=0){
               objEventDetails.setCompetition_country(compCountry);
            }else{
                objEventDetails.setCompetition_country(null);
            }
            
            if(issueId!=null && issueId.trim().length()!=0){
               objEventDetails.setIssueId(issueId);
            }else{
               objEventDetails.setIssueId(null);
            }
            if(entryFee!=0){
              objEventDetails.setEntry_fee(entryFee);
            }else{
                objEventDetails.setEntry_fee(0);
            }
            if(otherEntryFee!=null && otherEntryFee.trim().length()!=0){
               objEventDetails.setOther_entry_fee(otherEntryFee);
            }else{
                objEventDetails.setOther_entry_fee(null);
            }
            
            if(membApplicable!=null && membApplicable.trim().length()!=0){
               objEventDetails.setMembership_applicable(membApplicable);
            }else{
                objEventDetails.setMembership_applicable(null);
            }
            if(doubleEntryFee!=null && doubleEntryFee.trim().length()!=0){
              objEventDetails.setDouble_entry_fee_status(doubleEntryFee);
            }else{
                objEventDetails.setDouble_entry_fee_status(null);
            }
            
            if(offFee!=0){
               objEventDetails.setOffice_fee(offFee);
            }else{
                objEventDetails.setOffice_fee(0);
            }
            if(chkPayTo!=null && chkPayTo.trim().length()!=0){
              objEventDetails.setCheck_payable_to(chkPayTo);
            }else{
                objEventDetails.setCheck_payable_to(null);
            }
            if(pinneyChrg!=0){
               objEventDetails.setPinnies_charge(pinneyChrg);
            }else{
                objEventDetails.setPinnies_charge(0);
            }
            if(pinneyPos!=0){
               objEventDetails.setPinnies_position(pinneyPos);
            }else{
                objEventDetails.setPinnies_position(0);
            }
             if(awdTrophy!=null){
            objEventDetails.setAward_trophy(awdTrophy);
             }else{
                objEventDetails.setAward_trophy(null);
             }
            if(awdPrize!=null){
            objEventDetails.setAward_prize(awdPrize);
            }else{
              objEventDetails.setAward_prize(null);  
            }
            if(awdOthers!=null){
            objEventDetails.setAward_others(awdOthers);
            }else{
              objEventDetails.setAward_others(null);  
            }
            if(dateAvail!=null){
            objEventDetails.setDate_available(dateAvail);
            }else{
             objEventDetails.setDate_available(null);   
            }
            if(availableFrom!=null){
            objEventDetails.setAvailable_from(availableFrom);
            }else{
               objEventDetails.setAvailable_from(null);  
            }
            if(availFrmOther!=null){
             objEventDetails.setAvailable_from_other(availFrmOther);   
            }else{
              objEventDetails.setAvailable_from_other(null);   
            }
            if(availPosition!=0){
            objEventDetails.setAvailable_position(availPosition);
            }else{
               objEventDetails.setAvailable_position(0); 
            }
            
           objEventDetails.setStabling_limited(stabLimited);
                               
            if(stallPerNightPrice!=0){
            objEventDetails.setStall_pernight_price(stallPerNightPrice);
            }else{
             objEventDetails.setStall_pernight_price(0);   
            }
            
            if(perStallPrice!=0){
            objEventDetails.setPer_stall_price(perStallPrice);
            }else{
              objEventDetails.setPer_stall_price(0);  
            }
             if(perStallFrmTime!=null){
             objEventDetails.setPer_stall_from_time(perStallFrmTime);
            }else{
                objEventDetails.setPer_stall_from_time(null);
            }
            
            if(perStallFrmDt!=null){
            objEventDetails.setPer_stall_from_date(perStallFrmDt);
            }else{
             objEventDetails.setPer_stall_from_date(null);   
            }
            if(perStallToTime!=null){
            objEventDetails.setPer_stall_to_time(perStallToTime);
            }else{
             objEventDetails.setPer_stall_to_time(null);
            }
            
            if(perStallToDt!=null){
            objEventDetails.setPer_stall_to_date(perStallToDt);
            }else{
            objEventDetails.setPer_stall_to_date(null);
            }
            
            if(noOfStalls!=0){
            objEventDetails.setNo_of_stalls(noOfStalls);
            }else{
            objEventDetails.setNo_of_stalls(0);
            }
             if(noOfTempStalls!=0){        
            objEventDetails.setNo_of_temp_stalls(noOfTempStalls);
             }else{
                objEventDetails.setNo_of_temp_stalls(0);
             }
            if(noOfTempPermantStalls!=0){
            objEventDetails.setNo_of_temp_permanent_stalls(noOfTempPermantStalls);
            }else{
               objEventDetails.setNo_of_temp_permanent_stalls(0); 
            }
            if(milesFrmEvent!=null){
            objEventDetails.setMiles_from_event(milesFrmEvent);
            }else{
               objEventDetails.setMiles_from_event(null); 
            }
            if(vertName!=null){
            objEventDetails.setVeterinarian_name(vertName);
            }else{
               objEventDetails.setVeterinarian_name(null);
            }
            if(vertPhne!=null){
            objEventDetails.setVeterinarian_phone(vertPhne);
            }else{
               objEventDetails.setVeterinarian_phone(null);
            }
           if(vertPlace!=null){
            objEventDetails.setVeterinarian_place(vertPlace);
            }else{
               objEventDetails.setVeterinarian_place(null);
            }
            if(accomCamp!=null){
            objEventDetails.setAccomodation_camping(accomCamp);
            }else{
               objEventDetails.setAccomodation_camping(null);
            }
        
            if(direct!=null){
            objEventDetails.setDirections(direct);
            }else{
               objEventDetails.setDirections(null);
            }
            if(footingDesc!=null){
            objEventDetails.setFooting_desc(footingDesc);
            }else{
               objEventDetails.setFooting_desc(null);
            }
            if(accomCamp!=null){
            objEventDetails.setComments(comments);
            }else{
               objEventDetails.setComments(null);
            }                   
            if(eventId!=null){
            objEventDetails.setEvent_id(eventId);   
            }else{
              objEventDetails.setEvent_id(null);      
            }
           
           if(orgId!=null){
            objEventDetails.setOrgId(orgId);
            }else{
               objEventDetails.setOrgId(null);
            }
           if(eveTitle!=null){
            objEventDetails.setEventTitle(eveTitle);
            }else{
               objEventDetails.setEventTitle(null);
            }
            if(compZip!=null){
            objEventDetails.setCompetition_zip(compZip);
            }else{
               objEventDetails.setCompetition_zip(null);
            } 
           if(userId!=null && userId.trim().length()!=0){
                objEventDetails.setUserId(userId);
            }else{
                objEventDetails.setUserId(null);
            }
            
                     
             resultStat=krishnaBean.insertProCalEveIntoEveDetails(objEventDetails);
             Debug.print("resultStat:" +resultStat);
             
          }            
              }
              
             if(resultStat==true){
             
          if(eveStatList2!=null && eveStatList2.size()!=0){                  
              Iterator itr2 =eveStatList2.iterator();             
              if(itr2.hasNext()){
             HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr2.next(); 
             
             String orgId=objEventDetails.getOrgId();
             Debug.print("orgId in servlet:" +orgId);
            String eveTitle=objEventDetails.getEventTitle();
            Debug.print("eveTitle in servlet:" +eveTitle);
            
             //int compYr=objEventDetails.getCompYear();
            // Debug.print("compYr in servlet:" +compYr);                     
            
     
            if(compYear!=0){
                objEventDetails.setCompYear(compYear);
            }else{
                objEventDetails.setCompYear(0);
            }
                  
           if(orgId!=null){
            objEventDetails.setOrgId(orgId);
            }else{
               objEventDetails.setOrgId(null);
            }
           if(eveTitle!=null){
            objEventDetails.setEventTitle(eveTitle);
            }else{
               objEventDetails.setEventTitle(null);
            }
             objEventDetails.setEvent_id(eventId);
             
             //compYear
           
             resultHistStat=krishnaBean.insertProCalEveIntoEveHistoryDetails(objEventDetails);
             Debug.print("resultHistStat:" +resultHistStat);                   
          }            
              }
    
             } 
               
            ArrayList provDets= new ArrayList();
            if(resultStat==true){
             provDets=krishnaBean.getProvEventDetails(eventId);
            }
            if(provDets!=null && provDets.size()!=0){
                String orgId="";
                 String eveTitle="";
                 Date eveBegDt=null;
                 Date eveEndDt=null;
                 Date oeBegDt=null;
                 Date oeEndDt=null;
                 Date oeExDueDt=null;
                 String state=null;
                String area=null;
              
              Iterator itr2 =provDets.iterator();
              if(itr2.hasNext()){
                HLCCalendarVO calVO1 = (HLCCalendarVO)itr2.next();
                orgId= calVO1.getOrganizerId();
                 eveTitle=calVO1.getEventTitle();
                 eveBegDt=calVO1.getBeginDate();
                 eveEndDt=calVO1.getEndDate();
                 oeBegDt=calVO1.getEntryStrtDate();
                 oeEndDt=calVO1.getEntryEndDate();
                 oeExDueDt=calVO1.getExtDueDate();                
                 state=calVO1.getStateId();  
                 area=calVO1.getAreaId(); 
                 
             if(orgId!=null && orgId.trim().length()!=0){
                calVO1.setOrganizerId(orgId); 
             }else{
                 calVO1.setOrganizerId(null);    
             } 
             if(eveTitle!=null && eveTitle.trim().length()!=0){
                calVO1.setEventTitle(eveTitle); 
             }else{
                 calVO1.setEventTitle(null);    
             }    
             if(eveBegDt!=null){
                calVO1.setBeginDate(eveBegDt); 
             }else{
                 calVO1.setBeginDate(null);    
             }    
             if(eveEndDt!=null){
                calVO1.setEndDate(eveEndDt); 
             }else{
                 calVO1.setEndDate(null);    
             }    
             if(oeBegDt!=null){
                calVO1.setEntryStrtDate(oeBegDt); 
             }else{
                 calVO1.setEntryStrtDate(null);    
             }
             if(oeEndDt!=null){
                calVO1.setEntryEndDate(oeEndDt); 
             }else{
                 calVO1.setEntryEndDate(null);    
             }  
             if(oeExDueDt!=null){
                calVO1.setExtDueDate(oeExDueDt); 
             }else{
                 calVO1.setExtDueDate(null);    
             }    
             if(state!=null){
                calVO1.setStateId(state); 
             }else{
                 calVO1.setStateId(null);    
             }    
             if(area!=null){
                calVO1.setAreaId(area); 
             }else{
                 calVO1.setAreaId(null);    
             } 
                 
        
  
             boolean resultStat1=krishnaBean.updateNewEveDets(orgId,eveTitle,eveBegDt,eveEndDt,oeBegDt,oeEndDt,oeExDueDt,state,area,eventId);
             boolean resultStat2=krishnaBean.updateOmnibusDetsInAllTables(eventId,oldEventId);
             Debug.print("resultStat1:" +resultStat1); 
             Debug.print("resultStat2:" +resultStat2);  
                 
              }
             
            }         
          }
          }         
                 else if(orgApprovStat!=null && orgApprovStat.equalsIgnoreCase("Approved") && areaChApprovStat!=null && areaChApprovStat.equalsIgnoreCase("Approved") && uStaffApprovStat!=null && uStaffApprovStat.equalsIgnoreCase("Approved") && oldEventId==null && eventId!=null){
                     
       boolean output1=krishnaBean.eveDetailsExistsInEveTable(eventId);
              Debug.print("output1:" +output1);  
       if(output1==false){  
    ArrayList eveList = krishnaBean.getApprovedEventDet(provisionalId,eventId); 
    
          HLCEventRequestVO proEveObj= new HLCEventRequestVO(); 
          
                     String areaChApprovStat1="";
                     String orgApprovStat1="";
                     String uStaffApprovStat1="";
                     String oldEventId1="";
                     int compYear1=0;
                 if(eveList!=null && eveList.size()!=0){               
            Iterator itr1 =eveList.iterator(); 
            HLCCalendarVO calVO1 = new HLCCalendarVO();
            while(itr1.hasNext()){
            calVO =(HLCCalendarVO)itr1.next();
            String provisionId = calVO.getCalenderId();
            System.out.println("provisionId in jsp"+provisionId);
            String orgId=calVO.getOrganizerId();
            Date beginDate=calVO.getBeginDate();
            Date endDate=calVO.getEndDate();                                              
            String eventTitle=calVO.getEventTitle();                
            String areaCode=calVO.getAreaCode();
            String areaName=calVO.getAreaName();
            String stateName=calVO.getStateName();
            areaChApprovStat1=calVO.getOrgApprovalStatus();
            String orgFirstName = calVO.getOrgFName();  
            String orgLastName = calVO.getOrgLName();
            String userId = calVO.getUserId();                
            orgApprovStat1=calVO.getOrgApprovalStatus();   
            uStaffApprovStat1=calVO.getApprovalStatus(); 
            eventId=calVO.getEventId();  
            oldEventId1=calVO.getOldEventId();  
            compYear1=calVO.getCompYear();
            Date oeBeginDate=calVO.getEntryStrtDate();
            Date oeEndDate=calVO.getEntryEndDate();      
            Date oeExtndDate=calVO.getExtDueDate();      
            String areaId=calVO.getAreaId();
            String StaId=calVO.getStateId();
            String eveTypIds=calVO.getEventTypeId();
            String eveLevIds=calVO.getEventLevelId();
            String eveLocat=calVO.getEveLocation();
            String eveCity=calVO.getEveCity();
            String eveZip=calVO.getEveZip();
            String eveIssId=calVO.getEveIssueId();
                                                                           
        if(eventId!=null){
            proEveObj.setEvent_id(eventId);   
            }else{
              proEveObj.setEvent_id(null);      
            }       
                 
          if(orgId!=null){
            proEveObj.setOrgId(orgId);   
            }else{
              proEveObj.setOrgId(null);      
            }       
                 
           if(eventTitle!=null){
            proEveObj.setEventTitle(eventTitle);  
            }else{
              proEveObj.setEventTitle(null);      
            }       
                 
           if(beginDate!=null){
            proEveObj.setEveBegDate(beginDate);
            }else{
              proEveObj.setEveBegDate(null);      
            }       
                 
            if(endDate!=null){
            proEveObj.setEveEndDate(endDate);
            }else{
              proEveObj.setEveEndDate(null);      
            }       
                 
            if(oeBeginDate!=null){
            proEveObj.setEveOeBegDate(oeBeginDate);
            }else{
              proEveObj.setEveOeBegDate(null);      
            }       
                 
            if(oeEndDate!=null){
            proEveObj.setEveOeEndDate(oeEndDate);
            }else{
              proEveObj.setEveOeEndDate(null);      
            }       
                 
             if(oeExtndDate!=null){
            proEveObj.setEveOeExtnDate(oeExtndDate);
            }else{
              proEveObj.setEveOeExtnDate(null);      
            }       
                 
            if(areaId!=null){
            proEveObj.setChampionship_area(areaId);
            }else{
              proEveObj.setChampionship_area(null);      
            }       
                 
           if(StaId!=null){
            proEveObj.setCompetition_state(StaId);
            }else{
              proEveObj.setCompetition_state(null);      
            } 
             
            if(eveLocat!=null){
            proEveObj.setCompetition_location(eveLocat);
            }else{
              proEveObj.setCompetition_location(null);      
            }        
             
            if(eveCity!=null){
            proEveObj.setCompetition_city(eveCity);
            }else{
              proEveObj.setCompetition_city(null);      
            }        
           
            if(eveZip!=null){
            proEveObj.setCompetition_zip(eveZip);
            }else{
              proEveObj.setCompetition_zip(null);      
            }        
                        
            if(eveIssId!=null){
            proEveObj.setIssueId(eveIssId);
            }else{
              proEveObj.setIssueId(null);      
            }           
   
                         
            }        
   
                 }                   
             boolean eveResult=krishnaBean.insertEveDetails(proEveObj);  
             
             
          if(eveResult==true){
              
        ArrayList eveTypLevelsList=krishnaBean.getEveTyLevIdDet(provisionalId,eventId);
                        
          if(eveTypLevelsList!=null && eveTypLevelsList.size()!=0){
                Iterator itrObj = eveTypLevelsList.iterator();               
                while(itrObj.hasNext()){
                 HLCCalendarVO typeLevelObj = (HLCCalendarVO)itrObj.next();                         
                 String eveTypeId=typeLevelObj.getEventTypeId();
                 String eveLevId=typeLevelObj.getEventLevelId();
                                   
            String mapTypeId=krishnaBean.getEveTypLevelMapId(eveTypeId,eveLevId);
            
           boolean mapResult=krishnaBean.insertMapDets(eventId,mapTypeId);
            Debug.print("mapResult *****" +mapResult);             
                }    
              
                }                      
          }  
             
           }
            }     
            }                                               
                }           
    
                if(result){
                    request.setAttribute("approveStatus","approveSuccess");
                    return new ModelAndView("frmProCalUseaStaffList");
                }else{
                    request.setAttribute("approveStatus","approveFailed");
                    return new ModelAndView("frmProCalUseaStaffList");
                }
            }
            
            else if(process!=null && process.equalsIgnoreCase("intEveCalList")){
               
                ArrayList allAreaList = new ArrayList();
                ArrayList objAppEvent = new ArrayList();
                ArrayList tempObjAppEvent = new ArrayList();
                String area="";
                
                HLCMemberVO memDetails = new HLCMemberVO();
                
                String memberId=(String)session.getAttribute("memberId");
                allAreaList = (ArrayList)krishnaBean.getAllAreaMasters();
                
                if(allAreaList!=null&& allAreaList.size()!=0){
		
                	Iterator areaLst = allAreaList.iterator();
                	
                	while(areaLst.hasNext()){
                		String AreaLstArr[] = (String [])areaLst.next();
                		String area_id = AreaLstArr[0];
               
                		Debug.print("memberId:" +memberId); 
                		Debug.print("area_id:" +area_id);
                		String zipCode=krishnaBean.getZipCodeDetail(memberId);
                		Debug.print("zipCode:" +zipCode);
                		area=krishnaBean.getAreaDetail(zipCode);
                		
                		tempObjAppEvent = krishnaBean.getFinalizedEventCalDetails(area_id);
                        Debug.print("getFinalizedEventCalDetails called");
                        
                        objAppEvent.addAll(tempObjAppEvent);
                        Debug.print("tempObjAppEvent ---> "+tempObjAppEvent.size());
                        Debug.print("objAppEvent ---> "+objAppEvent.size());
                        
                }
                }
                if(memberId!=null && memberId.trim().length()!=0 && memberId.equals("Join Now!")){
                    memDetails = membQualBean.getMemberDetails(memberId);
                    request.setAttribute("isMember","yes");
                }else{
                    request.setAttribute("isMember","no");
                }
                request.setAttribute("memDetails",memDetails); 
               
                
                
                
                                                                                       
                request.setAttribute("allAreaList",allAreaList);
                request.setAttribute("objAppEvent",objAppEvent);
                
                return new ModelAndView("frmFinalizedEventCalendar");
   
            } 
            else if(process!=null && process.equalsIgnoreCase("intEveCalLists")){
                
                ArrayList allAreaList = null;
                String area="";
                HLCMemberVO memDetails = new HLCMemberVO();
                String memberId=(String)session.getAttribute("memberId");
                allAreaList = (ArrayList)krishnaBean.getAllAreaMasters();
                if(allAreaList!=null&& allAreaList.size()!=0){
		Iterator areaLst = allAreaList.iterator();
		while(areaLst.hasNext()){
		String AreaLstArr[] = (String [])areaLst.next();
		String area_id = AreaLstArr[0];
               
                Debug.print("memberId:" +memberId); 
                Debug.print("area_id:" +area_id);
                String zipCode=krishnaBean.getZipCodeDetail(memberId);
                Debug.print("zipCode:" +zipCode);
                area=krishnaBean.getAreaDetail(zipCode);
                }
                }
                if(memberId!=null && memberId.trim().length()!=0){
                    memDetails = membQualBean.getMemberDetails(memberId);
                    request.setAttribute("isMember","yes");
                }else{
                    request.setAttribute("isMember","no");
                }
                request.setAttribute("memDetails",memDetails); 
               
                ArrayList objAppEvent = null;
                objAppEvent = krishnaBean.getFinalizedEventCalDetails(null);
                Debug.print("getFinalizedEventCalDetails called");
                
                                                                                       
                request.setAttribute("allAreaList",allAreaList);
                request.setAttribute("objAppEvent",objAppEvent);
                
                return new ModelAndView("frmFinalizedEventCalendars");
   
            } 
                else if(process!=null && process.equalsIgnoreCase("finalEveCal")){
                //String year = request.getParameter("year");
                //int tempYear=Integer.parseInt(year);
                String area=request.getParameter("selArea");
                Debug.print("area:---> " +area);
                
                 HLCMemberVO memDetails = new HLCMemberVO();
                String memberId=(String)session.getAttribute("memberId");
                Debug.print("memberId:---> " +memberId);
                
                if(memberId!=null && memberId.trim().length()!=0){
                    memDetails = membQualBean.getMemberDetails(memberId);
                    request.setAttribute("isMember","yes");
                }else{
                    request.setAttribute("isMember","no");
                }
                request.setAttribute("memDetails",memDetails); 
                
                ArrayList objAppEvent = null;
                ArrayList allAreaList1 = null;
                allAreaList1 = (ArrayList)krishnaBean.getAllAreaMasters();
                //if(tempYear!=0){
                    //objAppEvent = krishnaBean.getFinalizedEventCalDetails(area);
                objAppEvent=dbelmt.selectApprovedEveCalendarDets(area);
                //}
                if(objAppEvent!=null && objAppEvent.size()!=0){                   
                Iterator itr =objAppEvent.iterator();
                int i=0;
                int compYear=0;
		while(itr.hasNext()){
                 HLCCalendarVO calVO =(HLCCalendarVO)itr.next();                      
                 String newEveId=calVO.getEventId();
                 String oldEveId=calVO.getOldEventId();
                 String provisId=calVO.getCalenderId();
                 Debug.print("newEveId:" +newEveId); 
                 Debug.print("oldEveId:" +oldEveId); 
                 
             if(oldEveId!=null){    
                boolean output=krishnaBean.eveDetailsExistsInEveTable(newEveId);            
                     if(output==false){
              ArrayList eveStatList1 = krishnaBean.getOldEventDetails(oldEveId);
              ArrayList eveStatList2 = krishnaBean.getOldEventHistoryDetails(oldEveId);
              boolean resultStat=false;
              boolean resultHistStat=false;
              if(eveStatList1!=null && eveStatList1.size()!=0){                  
              Iterator itr1 =eveStatList1.iterator();
             
              if(itr1.hasNext()){
             HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr1.next();             
             String compLocation=objEventDetails.getCompetition_location();
             Debug.print("compLocation in servlet:" +compLocation);
            String compCity=objEventDetails.getCompetition_city();
            String compCountry=objEventDetails.getCompetition_country();
            String issueId=objEventDetails.getIssueId();
            float entryFee=objEventDetails.getEntry_fee();
            String otherEntryFee=objEventDetails.getOther_entry_fee();
            String membApplicable=objEventDetails.getMembership_applicable();
            String doubleEntryFee=objEventDetails.getDouble_entry_fee_status();
            float offFee=objEventDetails.getOffice_fee();
            String chkPayTo=objEventDetails.getCheck_payable_to();
            float pinneyChrg=objEventDetails.getPinnies_charge();
            int pinneyPos=objEventDetails.getPinnies_position();
            String awdTrophy=objEventDetails.getAward_trophy();
            String awdPrize=objEventDetails.getAward_prize();
            String awdOthers=objEventDetails.getAward_others();
            Date dateAvail=objEventDetails.getDate_available();
            String availableFrom=objEventDetails.getAvailable_from();
            String availFrmOther=objEventDetails.getAvailable_from_other();
            int availPosition=objEventDetails.getAvailable_position();
            boolean stabLimited=objEventDetails.isStabling_limited();
            float stallPerNightPrice=objEventDetails.getStall_pernight_price();
            float perStallPrice=objEventDetails.getPer_stall_price();
            String perStallFrmTime=objEventDetails.getPer_stall_from_time();
            Date perStallFrmDt=objEventDetails.getPer_stall_from_date();
            
            String perStallToTime=objEventDetails.getPer_stall_to_time();
            Date perStallToDt=objEventDetails.getPer_stall_to_date();
            int noOfStalls=objEventDetails.getNo_of_stalls();
            int noOfTempStalls=objEventDetails.getNo_of_temp_stalls();
            int noOfTempPermantStalls=objEventDetails.getNo_of_temp_permanent_stalls();
            
            String milesFrmEvent=objEventDetails.getMiles_from_event();
            String vertName=objEventDetails.getVeterinarian_name();
            String vertPhne=objEventDetails.getVeterinarian_phone();
            String vertPlace=objEventDetails.getVeterinarian_place();
            String accomCamp=objEventDetails.getAccomodation_camping();
            
            String direct=objEventDetails.getDirections();
            String footingDesc=objEventDetails.getFooting_desc();
            String comments=objEventDetails.getComments();
            String orgId=objEventDetails.getOrgId();
             Debug.print("orgId in servlet:" +orgId);
            String eveTitle=objEventDetails.getEventTitle();
            Debug.print("eveTitle in servlet:" +eveTitle);
             String compZip=objEventDetails.getCompetition_zip();
             String userId=objEventDetails.getUserId();
           
            
            if(compLocation!=null && compLocation.trim().length()!=0){
                objEventDetails.setCompetition_location(compLocation);
            }else{
                objEventDetails.setCompetition_location(null);
            }
            
            if(compCity!=null && compCity.trim().length()!=0){
                objEventDetails.setCompetition_city(compCity);
            }else{
               objEventDetails.setCompetition_city(null);
            }
            
            if(compCountry!=null && compCountry.trim().length()!=0){
               objEventDetails.setCompetition_country(compCountry);
            }else{
                objEventDetails.setCompetition_country(null);
            }
            
            if(issueId!=null && issueId.trim().length()!=0){
               objEventDetails.setIssueId(issueId);
            }else{
               objEventDetails.setIssueId(null);
            }
            if(entryFee!=0){
              objEventDetails.setEntry_fee(entryFee);
            }else{
                objEventDetails.setEntry_fee(0);
            }
            if(otherEntryFee!=null && otherEntryFee.trim().length()!=0){
               objEventDetails.setOther_entry_fee(otherEntryFee);
            }else{
                objEventDetails.setOther_entry_fee(null);
            }
            
            if(membApplicable!=null && membApplicable.trim().length()!=0){
               objEventDetails.setMembership_applicable(membApplicable);
            }else{
                objEventDetails.setMembership_applicable(null);
            }
            if(doubleEntryFee!=null && doubleEntryFee.trim().length()!=0){
              objEventDetails.setDouble_entry_fee_status(doubleEntryFee);
            }else{
                objEventDetails.setDouble_entry_fee_status(null);
            }
            
            if(offFee!=0){
               objEventDetails.setOffice_fee(offFee);
            }else{
                objEventDetails.setOffice_fee(0);
            }
            if(chkPayTo!=null && chkPayTo.trim().length()!=0){
              objEventDetails.setCheck_payable_to(chkPayTo);
            }else{
                objEventDetails.setCheck_payable_to(null);
            }
            if(pinneyChrg!=0){
               objEventDetails.setPinnies_charge(pinneyChrg);
            }else{
                objEventDetails.setPinnies_charge(0);
            }
            if(pinneyPos!=0){
               objEventDetails.setPinnies_position(pinneyPos);
            }else{
                objEventDetails.setPinnies_position(0);
            }
             if(awdTrophy!=null){
            objEventDetails.setAward_trophy(awdTrophy);
             }else{
                objEventDetails.setAward_trophy(null);
             }
            if(awdPrize!=null){
            objEventDetails.setAward_prize(awdPrize);
            }else{
              objEventDetails.setAward_prize(null);  
            }
            if(awdOthers!=null){
            objEventDetails.setAward_others(awdOthers);
            }else{
              objEventDetails.setAward_others(null);  
            }
            if(dateAvail!=null){
            objEventDetails.setDate_available(dateAvail);
            }else{
             objEventDetails.setDate_available(null);   
            }
            if(availableFrom!=null){
            objEventDetails.setAvailable_from(availableFrom);
            }else{
               objEventDetails.setAvailable_from(null);  
            }
            if(availFrmOther!=null){
             objEventDetails.setAvailable_from_other(availFrmOther);   
            }else{
              objEventDetails.setAvailable_from_other(null);   
            }
            if(availPosition!=0){
            objEventDetails.setAvailable_position(availPosition);
            }else{
               objEventDetails.setAvailable_position(0); 
            }
            
           objEventDetails.setStabling_limited(stabLimited);
                               
            if(stallPerNightPrice!=0){
            objEventDetails.setStall_pernight_price(stallPerNightPrice);
            }else{
             objEventDetails.setStall_pernight_price(0);   
            }
            
            if(perStallPrice!=0){
            objEventDetails.setPer_stall_price(perStallPrice);
            }else{
              objEventDetails.setPer_stall_price(0);  
            }
             if(perStallFrmTime!=null){
             objEventDetails.setPer_stall_from_time(perStallFrmTime);
            }else{
                objEventDetails.setPer_stall_from_time(null);
            }
            
            if(perStallFrmDt!=null){
            objEventDetails.setPer_stall_from_date(perStallFrmDt);
            }else{
             objEventDetails.setPer_stall_from_date(null);   
            }
            if(perStallToTime!=null){
            objEventDetails.setPer_stall_to_time(perStallToTime);
            }else{
             objEventDetails.setPer_stall_to_time(null);
            }
            
            if(perStallToDt!=null){
            objEventDetails.setPer_stall_to_date(perStallToDt);
            }else{
            objEventDetails.setPer_stall_to_date(null);
            }
            
            if(noOfStalls!=0){
            objEventDetails.setNo_of_stalls(noOfStalls);
            }else{
            objEventDetails.setNo_of_stalls(0);
            }
             if(noOfTempStalls!=0){        
            objEventDetails.setNo_of_temp_stalls(noOfTempStalls);
             }else{
                objEventDetails.setNo_of_temp_stalls(0);
             }
            if(noOfTempPermantStalls!=0){
            objEventDetails.setNo_of_temp_permanent_stalls(noOfTempPermantStalls);
            }else{
               objEventDetails.setNo_of_temp_permanent_stalls(0); 
            }
            if(milesFrmEvent!=null){
            objEventDetails.setMiles_from_event(milesFrmEvent);
            }else{
               objEventDetails.setMiles_from_event(null); 
            }
            if(vertName!=null){
            objEventDetails.setVeterinarian_name(vertName);
            }else{
               objEventDetails.setVeterinarian_name(null);
            }
            if(vertPhne!=null){
            objEventDetails.setVeterinarian_phone(vertPhne);
            }else{
               objEventDetails.setVeterinarian_phone(null);
            }
           if(vertPlace!=null){
            objEventDetails.setVeterinarian_place(vertPlace);
            }else{
               objEventDetails.setVeterinarian_place(null);
            }
            if(accomCamp!=null){
            objEventDetails.setAccomodation_camping(accomCamp);
            }else{
               objEventDetails.setAccomodation_camping(null);
            }
        
            if(direct!=null){
            objEventDetails.setDirections(direct);
            }else{
               objEventDetails.setDirections(null);
            }
            if(footingDesc!=null){
            objEventDetails.setFooting_desc(footingDesc);
            }else{
               objEventDetails.setFooting_desc(null);
            }
            if(accomCamp!=null){
            objEventDetails.setComments(comments);
            }else{
               objEventDetails.setComments(null);
            }                   
            if(newEveId!=null){
            objEventDetails.setEvent_id(newEveId);   
            }else{
              objEventDetails.setEvent_id(null);      
            }
           
           if(orgId!=null){
            objEventDetails.setOrgId(orgId);
            }else{
               objEventDetails.setOrgId(null);
            }
           if(eveTitle!=null){
            objEventDetails.setEventTitle(eveTitle);
            }else{
               objEventDetails.setEventTitle(null);
            }
            if(compZip!=null){
            objEventDetails.setCompetition_zip(compZip);
            }else{
               objEventDetails.setCompetition_zip(null);
            } 
           
           if(userId!=null && userId.trim().length()!=0){
                objEventDetails.setUserId(userId);
            }else{
                objEventDetails.setUserId(null);
            }
           
             resultStat=krishnaBean.insertProCalEveIntoEveDetails(objEventDetails);
             Debug.print("resultStat:" +resultStat);
             
          }            
              }
              
             if(resultStat==true){
             
          if(eveStatList2!=null && eveStatList2.size()!=0){                  
              Iterator itr2 =eveStatList2.iterator();             
              if(itr2.hasNext()){
             HLCEventRequestVO objEventDetails = (HLCEventRequestVO) itr2.next(); 
             
             String orgId=objEventDetails.getOrgId();
             Debug.print("orgId in servlet:" +orgId);
            String eveTitle=objEventDetails.getEventTitle();
            Debug.print("eveTitle in servlet:" +eveTitle);
            
             //int compYr=objEventDetails.getCompYear();
            // Debug.print("compYr in servlet:" +compYr);                     
            
     
            if(compYear!=0){
                objEventDetails.setCompYear(compYear);
            }else{
                objEventDetails.setCompYear(0);
            }
                  
           if(orgId!=null){
            objEventDetails.setOrgId(orgId);
            }else{
               objEventDetails.setOrgId(null);
            }
           if(eveTitle!=null){
            objEventDetails.setEventTitle(eveTitle);
            }else{
               objEventDetails.setEventTitle(null);
            }
             objEventDetails.setEvent_id(newEveId);
             
             //compYear
           
             resultHistStat=krishnaBean.insertProCalEveIntoEveHistoryDetails(objEventDetails);
             Debug.print("resultHistStat:" +resultHistStat);                   
          }            
              }
    
             } 
               
            ArrayList provDets= new ArrayList();
            if(resultStat==true){
             provDets=krishnaBean.getProvEventDetails(newEveId);
            }
            if(provDets!=null && provDets.size()!=0){
                String orgId="";
                 String eveTitle="";
                 Date eveBegDt=null;
                 Date eveEndDt=null;
                 Date oeBegDt=null;
                 Date oeEndDt=null;
                 Date oeExDueDt=null;
                 String state=null;
                 String area1=null;
              
              Iterator itr2 =provDets.iterator();
              if(itr2.hasNext()){
                HLCCalendarVO calVO1 = (HLCCalendarVO)itr2.next();
                orgId= calVO1.getOrganizerId();
                 eveTitle=calVO1.getEventTitle();
                 eveBegDt=calVO1.getBeginDate();
                 eveEndDt=calVO1.getEndDate();
                 oeBegDt=calVO1.getEntryStrtDate();
                 oeEndDt=calVO1.getEntryEndDate();
                 oeExDueDt=calVO1.getExtDueDate();                
                 state=calVO1.getStateId();  
                 area1=calVO1.getAreaId(); 
                 
             if(orgId!=null && orgId.trim().length()!=0){
                calVO1.setOrganizerId(orgId); 
             }else{
                 calVO1.setOrganizerId(null);    
             } 
             if(eveTitle!=null && eveTitle.trim().length()!=0){
                calVO1.setEventTitle(eveTitle); 
             }else{
                 calVO1.setEventTitle(null);    
             }    
             if(eveBegDt!=null){
                calVO1.setBeginDate(eveBegDt); 
             }else{
                 calVO1.setBeginDate(null);    
             }    
             if(eveEndDt!=null){
                calVO1.setEndDate(eveEndDt); 
             }else{
                 calVO1.setEndDate(null);    
             }    
             if(oeBegDt!=null){
                calVO1.setEntryStrtDate(oeBegDt); 
             }else{
                 calVO1.setEntryStrtDate(null);    
             }
             if(oeEndDt!=null){
                calVO1.setEntryEndDate(oeEndDt); 
             }else{
                 calVO1.setEntryEndDate(null);    
             }  
             if(oeExDueDt!=null){
                calVO1.setExtDueDate(oeExDueDt); 
             }else{
                 calVO1.setExtDueDate(null);    
             }    
             if(state!=null){
                calVO1.setStateId(state); 
             }else{
                 calVO1.setStateId(null);    
             }    
             if(area1!=null){
                calVO1.setAreaId(area1); 
             }else{
                 calVO1.setAreaId(null);    
             }    
  
             boolean resultStat1=krishnaBean.updateNewEveDets(orgId,eveTitle,eveBegDt,eveEndDt,oeBegDt,oeEndDt,oeExDueDt,state,area1,newEveId);
             boolean resultStat2=krishnaBean.updateOmnibusDetsInAllTables(newEveId,oldEveId);
             Debug.print("resultStat1:" +resultStat1); 
             Debug.print("resultStat2:" +resultStat2);  
                 
              }
             
            }         
          } 
                
                
      }else{
    
                                       
       boolean output1=krishnaBean.eveDetailsExistsInEveTable(newEveId);
              Debug.print("output1:" +output1);  
       if(output1==false){  
    ArrayList eveList = krishnaBean.getApprovedEventDet(provisId,newEveId); 
    
          HLCEventRequestVO proEveObj= new HLCEventRequestVO(); 
          
                     String areaChApprovStat1="";
                     String orgApprovStat1="";
                     String uStaffApprovStat1="";
                     String oldEventId1="";
                     String eventId=null;
                     int compYear1=0;
                 if(eveList!=null && eveList.size()!=0){               
                 Iterator itr1 =eveList.iterator(); 
                 HLCCalendarVO calVO1 = new HLCCalendarVO();
                 while(itr1.hasNext()){
                calVO =(HLCCalendarVO)itr1.next();
                String provisionId = calVO.getCalenderId();
                System.out.println("provisionId in jsp"+provisionId);
                String orgId=calVO.getOrganizerId();
                Date beginDate=calVO.getBeginDate();
                Date endDate=calVO.getEndDate();                                              
                String eventTitle=calVO.getEventTitle();                
                String areaCode=calVO.getAreaCode();
                String areaName=calVO.getAreaName();
                String stateName=calVO.getStateName();
                 areaChApprovStat1=calVO.getOrgApprovalStatus();
                String orgFirstName = calVO.getOrgFName();  
                String orgLastName = calVO.getOrgLName();
                String userId = calVO.getUserId();                
                 orgApprovStat1=calVO.getOrgApprovalStatus();   
                 uStaffApprovStat1=calVO.getApprovalStatus(); 
                eventId=calVO.getEventId();  
                 oldEventId1=calVO.getOldEventId();  
                  compYear1=calVO.getCompYear();
             Date oeBeginDate=calVO.getEntryStrtDate();
             Date oeEndDate=calVO.getEntryEndDate();      
             Date oeExtndDate=calVO.getExtDueDate();      
             String areaId=calVO.getAreaId();
             String StaId=calVO.getStateId();
             String eveTypIds=calVO.getEventTypeId();
             String eveLevIds=calVO.getEventLevelId();
             String eveLocat=calVO.getEveLocation();
             String eveCity=calVO.getEveCity();
             String eveZip=calVO.getEveZip();
             String eveIssId=calVO.getEveIssueId();     
                                                                           
        if(eventId!=null){
            proEveObj.setEvent_id(eventId);   
            }else{
              proEveObj.setEvent_id(null);      
            }       
                 
          if(orgId!=null){
            proEveObj.setOrgId(orgId);   
            }else{
              proEveObj.setOrgId(null);      
            }       
                 
           if(eventTitle!=null){
            proEveObj.setEventTitle(eventTitle);  
            }else{
              proEveObj.setEventTitle(null);      
            }       
                 
           if(beginDate!=null){
            proEveObj.setEveBegDate(beginDate);
            }else{
              proEveObj.setEveBegDate(null);      
            }       
                 
            if(endDate!=null){
            proEveObj.setEveEndDate(endDate);
            }else{
              proEveObj.setEveEndDate(null);      
            }       
                 
            if(oeBeginDate!=null){
            proEveObj.setEveOeBegDate(oeBeginDate);
            }else{
              proEveObj.setEveOeBegDate(null);      
            }       
                 
            if(oeEndDate!=null){
            proEveObj.setEveOeEndDate(oeEndDate);
            }else{
              proEveObj.setEveOeEndDate(null);      
            }       
                 
             if(oeExtndDate!=null){
            proEveObj.setEveOeExtnDate(oeExtndDate);
            }else{
              proEveObj.setEveOeExtnDate(null);      
            }       
                 
            if(areaId!=null){
            proEveObj.setChampionship_area(areaId);
            }else{
              proEveObj.setChampionship_area(null);      
            }       
                 
           if(StaId!=null){
            proEveObj.setCompetition_state(StaId);
            }else{
              proEveObj.setCompetition_state(null);      
            }  
            if(eveLocat!=null){
            proEveObj.setCompetition_location(eveLocat);
            }else{
              proEveObj.setCompetition_location(null);      
            }        
             
            if(eveCity!=null){
            proEveObj.setCompetition_city(eveCity);
            }else{
              proEveObj.setCompetition_city(null);      
            }        
           
            if(eveZip!=null){
            proEveObj.setCompetition_zip(eveZip);
            }else{
              proEveObj.setCompetition_zip(null);      
            }        
                        
            if(eveIssId!=null){
            proEveObj.setIssueId(eveIssId);
            }else{
              proEveObj.setIssueId(null);      
            }          
       
            }        
   
                 }                   
             boolean eveResult=krishnaBean.insertEveDetails(proEveObj);  
             
             
          if(eveResult==true){
              
        ArrayList eveTypLevelsList=krishnaBean.getEveTyLevIdDet(provisId,eventId);
                        
          if(eveTypLevelsList!=null && eveTypLevelsList.size()!=0){
                Iterator itrObj = eveTypLevelsList.iterator();               
                while(itrObj.hasNext()){
                 HLCCalendarVO typeLevelObj = (HLCCalendarVO)itrObj.next();                         
                 String eveTypeId=typeLevelObj.getEventTypeId();
                 String eveLevId=typeLevelObj.getEventLevelId();
                 
                    
            String mapTypeId=krishnaBean.getEveTypLevelMapId(eveTypeId,eveLevId);
            
           boolean mapResult=krishnaBean.insertMapDets(eventId,mapTypeId);
            Debug.print("mapResult *****" +mapResult);             
                }    
              
                }                      
          }                      
      }   
                     
      } 
                 
    
                 
i++;}   
                
  
        
                }
        
                
                
                request.setAttribute("objAppEvent",objAppEvent);
                //request.setAttribute("year",year);
                request.setAttribute("area",area);
                ArrayList allAreaList = null;
                allAreaList = (ArrayList)krishnaBean.getAllAreaMasters();
                request.setAttribute("allAreaList",allAreaList);
                  HLCCalendarVO calVO = new HLCCalendarVO();
               
                Calendar now = Calendar.getInstance();
	        int currentYear = now.get(Calendar.YEAR);
                 String currentYear1=String.valueOf(currentYear);
                 Debug.print("currentYear1"+currentYear1);
                ArrayList eventLevelDetails = new ArrayList();  
                if(objAppEvent!=null && objAppEvent.size()!=0){
                Iterator itr =objAppEvent.iterator();

                while(itr.hasNext()){
                String entryStartDate="";
                String entryCloseDate="";
                calVO =(HLCCalendarVO)itr.next();
                String provisionId = calVO.getCalenderId();
                String eventId = calVO.getEventId();                              
                eventLevelDetails=krishnaBean.getEveLevTypDets(provisionId);
                
                request.setAttribute("eventLevelDetails",eventLevelDetails);
                }
                }
                return new ModelAndView("frmFinalizedEventCalendar");
            } else if(process!=null && process.equalsIgnoreCase("finalEventView")){
                String provisionalId = request.getParameter("provisionId");
                HLCCalendarVO objCalVO = new HLCCalendarVO();
                ArrayList objEveDets=new ArrayList();
                if(provisionalId!=null && provisionalId.trim().length()!=0){
                    objCalVO = krishnaBean.getSingleEventDetails(provisionalId);
                    objEveDets=krishnaBean.getEveLevTypDets(provisionalId);
                }
                request.setAttribute("objCalVO",objCalVO);
                request.setAttribute("objEveDets",objEveDets);
                return new ModelAndView("frmFinalizedEventCalendarView");
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
     
}
/*
 * OrgCompResultAction.java
 *
 * Created on November 28, 2007, 12:29 PM
 */

package com.oer.action;

import com.hlccommon.util.Debug;
import com.hlcutil.HLCCompetitionResultVO;
import com.hlcutil.HLCPriceMatrixVO;

import java.io.IOException;
import java.io.OutputStream;
import java.net.ProtocolException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.*;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.Properties;
import java.util.Date;
import java.text.*;
import org.apache.struts.util.MessageResources;

import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcutil.HLCCompRegistrationVO;
import org.apache.struts.upload.FormFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


/**
 *
 * @author Vidhya
 * @version
 */

	public class OrgCompResultAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {

        try{
            HttpSession session=request.getSession();
        	HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
	    	
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            String filePath="C:/horse_comp_result_excel";
            HLCCompetitionResultVO compVO= new HLCCompetitionResultVO();
            if(cmd!=null){
                
                if(cmd.equals("initList")){
                    Debug.print("cmd in OrgCompResultAction :"+cmd);
                    
                    return new ModelAndView("frmOEROrgCompResList");
                }
                if(cmd.equals("initEventTitleList")){
                    Debug.print("cmd in OrgCompResultAction :"+cmd);
                    String year=request.getParameter("year");
                    Debug.print("year :"+year);
                    String organizerId=(String)session.getAttribute("memberId");
                    ArrayList eventTitles=new ArrayList();
                    eventTitles=membQualBean.getEventTiles(year,organizerId);
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("tempYear",year);
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    return new ModelAndView("frmOEROrgCompResList");
                }
                if(cmd.equals("initEventTypeList")){
                    Debug.print("cmd in OrgCompResultAction :"+cmd);
                    String year=request.getParameter("year");
                    Debug.print("year in initEventTypeList:"+year);
                    String eventId=request.getParameter("eventId");
                    String organizerId=(String)session.getAttribute("memberId");
                    Debug.print("year :"+year);
                    Debug.print("eventId :"+eventId);
                    ArrayList eventType=new ArrayList();
                    eventType=membQualBean.getEventTypes(eventId);
                    request.setAttribute("eventType",eventType);
                    ArrayList eventTitles=new ArrayList();
                    eventTitles=membQualBean.getEventTiles(year,organizerId);
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("tempYear",year);
                    request.setAttribute("eventId",eventId);
                    
                    return new ModelAndView("frmOEROrgCompResList");
                }
                if(cmd.equals("listDetails")){
                    Debug.print("cmd in OrgCompResultAction :"+cmd);
                    String year=request.getParameter("initSelYear");
                    String eventId=request.getParameter("eventId");
                    String organizerId=(String)session.getAttribute("memberId");                    
                    String eventTyAndLevel=request.getParameter("eventType");
                        Debug.print("eventTyAndLevel in for loop: "+eventTyAndLevel);
                        Pattern pat=Pattern.compile("#");
                        String eventTypeId="";
                        String eventTypeName="";
                        if(eventTyAndLevel!=null && eventTyAndLevel.trim().length()!=0){
                            String str[]=pat.split(eventTyAndLevel);
                            eventTypeId=str[0];
                            eventTypeName=str[1];
                            Debug.print("eventTypein AddPriceAction: "+eventTypeId);
                            Debug.print("eventLevelin AddPriceAction: "+eventTypeName);
                        }
                    ArrayList eventType=new ArrayList();
                    ArrayList eventTitles=new ArrayList();
                    ArrayList eventcompResLabel=new ArrayList();
                    ArrayList eventcompResDetails=new ArrayList();
                    
                    eventType=membQualBean.getEventTypes(eventId);
                    eventTitles=membQualBean.getEventTiles(year,organizerId);
                    eventcompResLabel=membQualBean.getOrgCompResLabelList(eventTypeId);
                    eventcompResDetails=membQualBean.getOrgCompResList(Integer.parseInt(year),eventId,eventTypeName,organizerId);
                    
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTitles",eventTitles);
                    request.setAttribute("tempYear",year);
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTypeId",eventTypeId);
                    request.setAttribute("eventcompResLabel",eventcompResLabel);
                    request.setAttribute("eventcompResDetails",eventcompResDetails);
                    request.setAttribute("eventTyAndLevel",eventTyAndLevel);
                    
                    return new ModelAndView("frmOEROrgCompResList");
                } 
                if(cmd.equals("insertResultDetails")){
                    Debug.print("cmd in OrgCompResultAction :"+cmd);
                    String year=request.getParameter("tempSelYear");
                    int tempYear=0;
                        if(year!=null && year.trim().length()!=0){
                        tempYear=Integer.parseInt(year);    
                        }
                    
                    String eventId=request.getParameter("eventId");
                    String eventTyAndLevel=request.getParameter("eventTyAndLevel");
                    
                        Debug.print("eventTyAndLevel in for loop: "+eventTyAndLevel);
                        Pattern pat=Pattern.compile("#");
                        String eventTypeId="";
                        String eventTypeName="";
                        if(eventTyAndLevel!=null && eventTyAndLevel.trim().length()!=0){
                            String str[]=pat.split(eventTyAndLevel);
                            eventTypeId=str[0];
                            eventTypeName=str[1];
                            Debug.print("eventTypein AddPriceAction: "+eventTypeId);
                            Debug.print("eventLevelin AddPriceAction: "+eventTypeName);
                        }
                    boolean flag=true;    
                    int resSize = 0;
                    String resultSize = request.getParameter("resultSize");
                    Debug.print("noChSize in AddPriceAction: "+resultSize);
                    
                    if(resultSize!=null && resultSize.trim().length()!=0){
                        resSize = Integer.parseInt(resultSize);
                    }
                    for(int i=1; i<=resSize; i++){
                        Debug.print("inside loop: "+i);
                        
                        String riderUserId=request.getParameter("riderUserId"+i);
                        Debug.print("riderUserId in Servlet: "+riderUserId);
                        String eveId=request.getParameter("eveId"+i);
                        String eventType=request.getParameter("eventType"+i);
                        String eventLevel=request.getParameter("eventLevel"+i);
                        String eventLevelId=membQualBean.getEventLevelId(eventLevel);
                        String division=request.getParameter("division"+i);
                        String eventDivisionId=membQualBean.getEventDivId(division);
                        String horseMemberId=request.getParameter("horseMemberId"+i);
                        String horseName=request.getParameter("horseName"+i);
                        String riderId=request.getParameter("riderId"+i);
                        String riderFirstName=request.getParameter("riderFirstName"+i);
                        String riderLastName=request.getParameter("riderLastName"+i);
                        String finalPlace=request.getParameter("finalPlace"+i);
                        String phaseDIns=request.getParameter("phaseDIns"+i);
                        String dressPlace=request.getParameter("dressPlace"+i);
                        String XCphaseDElapTime=request.getParameter("XCphaseDElapTime"+i);
                        String showJumpPenal=request.getParameter("showJumpPenal"+i);
                        String RandTC=request.getParameter("RandTC"+i);
                        Debug.print("RandTC in OrgCompResultAction"+RandTC);
                        String RandTA=request.getParameter("RandTA"+i);
                        Debug.print("RandTA in OrgCompResultAction"+RandTA);
                        String danRidPenal=request.getParameter("danRidPenal"+i);
                        String finalPoints=request.getParameter("finalPoints"+i);
                        String pinneyNo=request.getParameter("pinneyNo"+i);
                        String steepleChaseTimePenal=request.getParameter("steepleChaseTimePenal"+i);
                        String XCPhaseDJumpPenal=request.getParameter("XCPhaseDJumpPenal"+i);
                        String toDatePoints=request.getParameter("toDatePoints"+i);
                        String showJumpTimePenal=request.getParameter("showJumpTimePenal"+i);
                        String hlcPonits=request.getParameter("hlcPonits"+i);
                        String steepleChaseJumpPenal=request.getParameter("steepleChaseJumpPenal"+i);
                        String XCPhaseDTimePenal=request.getParameter("XCPhaseDTimePenal"+i);
                        String lastInS=request.getParameter("lastInS"+i);
                        String dressPenal=request.getParameter("dressPenal"+i);
                        String toDatePlace=request.getParameter("toDatePlace"+i);
                        String eventSubDiv=request.getParameter("eventSubDiv"+i);
                        String firstIns=request.getParameter("firstIns"+i);
                        
                        if(tempYear!=0) compVO.setCompYear(tempYear);
                        else compVO.setCompYear(0); 
                        if(riderUserId!=null && riderUserId.trim().length()!=0) compVO.setRiderUserId(riderUserId);
                            else compVO.setRiderUserId(null); 
                        if(eveId!=null && eveId.trim().length()!=0) compVO.setEventId(eveId);
                            else compVO.setEventId(null); 
                        if(eventTypeId!=null && eventTypeId.trim().length()!=0) compVO.setEventTypeId(eventTypeId);
                            else compVO.setEventTypeId(null); 
                        if(eventLevelId!=null && eventLevelId.trim().length()!=0) compVO.setEventLevelId(eventLevelId);
                            else compVO.setEventLevelId(null); 
                        if(eventDivisionId!=null && eventDivisionId.trim().length()!=0) compVO.setEventDivId(eventDivisionId);
                            else compVO.setEventDivId(null); 
                        if(horseMemberId!=null && horseMemberId.trim().length()!=0) compVO.setHorseMemberId(horseMemberId);
                            else compVO.setHorseMemberId(null); 
                        if(horseName!=null && horseName.trim().length()!=0) compVO.setHorseName(horseName);
                            else compVO.setHorseName(null); 
                        if(riderId!=null && riderId.trim().length()!=0) compVO.setRiderMemberId(riderId);
                            else compVO.setRiderMemberId(null); 
                        if(riderFirstName!=null && riderFirstName.trim().length()!=0) compVO.setRiderFirstName(riderFirstName);
                            else compVO.setRiderFirstName(null); 
                        if(riderLastName!=null && riderLastName.trim().length()!=0) compVO.setRiderLastName(riderLastName);
                            else compVO.setRiderLastName(null); 
                        if(finalPlace!=null && finalPlace.trim().length()!=0) compVO.setFinalPlace(finalPlace);
                            else compVO.setFinalPlace(null); 
                        if(phaseDIns!=null && phaseDIns.trim().length()!=0) compVO.setPhase_DInspec(phaseDIns);
                            else compVO.setPhase_DInspec(null); 
                        if(dressPlace!=null && dressPlace.trim().length()!=0) compVO.setDressagePlace(dressPlace);
                            else compVO.setDressagePlace(null); 
                        if(XCphaseDElapTime!=null && XCphaseDElapTime.trim().length()!=0) compVO.setXc_phase_elapsTime(XCphaseDElapTime);
                            else compVO.setXc_phase_elapsTime(null); 
                        if(showJumpPenal!=null && showJumpPenal.trim().length()!=0) compVO.setShow_jmp_jmpPenal(showJumpPenal);
                            else compVO.setShow_jmp_jmpPenal(null); 
                        if(RandTC!=null && RandTC.trim().length()!=0) compVO.setRdTrackC(RandTC);
                            else compVO.setRdTrackC(null); 
                        if(RandTA!=null && RandTA.trim().length()!=0) compVO.setRdTrackA(RandTA);
                            else compVO.setRdTrackA(null); 
                        if(danRidPenal!=null && danRidPenal.trim().length()!=0) compVO.setDangerRidPenal(danRidPenal);
                            else compVO.setDangerRidPenal(null); 
                        if(finalPoints!=null && finalPoints.trim().length()!=0) compVO.setFinalPoints(finalPoints);
                            else compVO.setFinalPoints(null); 
                        if(pinneyNo!=null && pinneyNo.trim().length()!=0) compVO.setPinneyNumber(pinneyNo);
                            else compVO.setPinneyNumber(null); 
                        if(steepleChaseTimePenal!=null && steepleChaseTimePenal.trim().length()!=0) compVO.setSteepleCh_timePenal(steepleChaseTimePenal);
                            else compVO.setSteepleCh_timePenal(null); 
                        if(XCPhaseDJumpPenal!=null && XCPhaseDJumpPenal.trim().length()!=0) compVO.setXc_phase_jmpPenal(XCPhaseDJumpPenal);
                            else compVO.setXc_phase_jmpPenal(null); 
                        if(toDatePoints!=null && toDatePoints.trim().length()!=0) compVO.setToDatePts(toDatePoints);
                            else compVO.setToDatePts(null); 
                        if(showJumpTimePenal!=null && showJumpTimePenal.trim().length()!=0) compVO.setShow_jmp_timePenal(showJumpTimePenal);
                            else compVO.setShow_jmp_timePenal(null); 
                        if(hlcPonits!=null && hlcPonits.trim().length()!=0) compVO.setUseaPoints(hlcPonits);
                            else compVO.setUseaPoints(null); 
                        if(steepleChaseJumpPenal!=null && steepleChaseJumpPenal.trim().length()!=0) compVO.setSteepleCh_jmpPenal(steepleChaseJumpPenal);
                            else compVO.setSteepleCh_jmpPenal(null); 
                        if(XCPhaseDTimePenal!=null && XCPhaseDTimePenal.trim().length()!=0) compVO.setXc_phase_timePenal(XCPhaseDTimePenal);
                            else compVO.setXc_phase_timePenal(null); 
                        if(lastInS!=null && lastInS.trim().length()!=0) compVO.setLastInspec(lastInS);
                            else compVO.setLastInspec(null); 
                        if(dressPenal!=null && dressPenal.trim().length()!=0) compVO.setDressagePenal(dressPenal);
                            else compVO.setDressagePenal(null); 
                        if(toDatePlace!=null && toDatePlace.trim().length()!=0) compVO.setToDatePlace(toDatePlace);
                            else compVO.setToDatePlace(null); 
                        if(eventSubDiv!=null && eventSubDiv.trim().length()!=0) compVO.setEventSubDivision(eventSubDiv);
                            else compVO.setEventSubDivision(null); 
                        if(firstIns!=null && firstIns.trim().length()!=0) compVO.setFirstInspec(firstIns);
                            else compVO.setFirstInspec(null); 
                        boolean result=false;
                        boolean isexist=true;
                        isexist=membQualBean.isCompResExist(tempYear,eveId,horseMemberId,riderUserId);
                        if(isexist==true){
                        request.setAttribute("AlreadyExist","AlreadyExist");
                        return new ModelAndView("frmOEROrgCompResList");
                        }else{
                        result=membQualBean.insertCompResultDetails(compVO);
                        }
                        if(result==true){
                        flag=true;    
                        }else{
                        flag=false;   
                       } 
                    
                    }
                    if(flag==true){
                    request.setAttribute("insertStatus","success");  
                     return new ModelAndView("frmOEROrgCompResList");       
                    }else{
                    request.setAttribute("insertStatus","failed");
                    return new ModelAndView("frmOEROrgCompResList");
                    }    
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}

/*
 * ActionCompetitionRegistration.java
 *
 * Created on April 13, 2007, 12:05 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.HLCCompResultVO;
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

import com.hlccommon.util.HLCCompRegVO;


/**
 *
 * @author Karthikeyan
 * @version
 */


	public class ActionCompetitionRegistration implements Controller {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
      
        try{
           
        	HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();
            HttpSession session = request.getSession(true);
            
            String process = request.getParameter("process");
            Debug.print("ActionCompetitionRegistration.process:" + process);
            if(process==null || process.trim().length()==0){
                Debug.print("ActionCompetitionRegistration.process Null block:");
                return new ModelAndView("index");
            } else if(process.equalsIgnoreCase("exceptionReg")){
                Debug.print("ActionCompetitionRegistration.exceptionReg :");
                String eventId = request.getParameter("eventId");
                String upId = request.getParameter("upId");
                request.setAttribute("uploadId", upId);
                Debug.print("upload Id in Servlet:"+upId);
                Debug.print("ActionCompetitionRegistration.exceptionReg eventId:" + eventId);
                if(upId!=null && upId.trim().length()!=0){
                    ArrayList exceptionList = (ArrayList)vaigaiBean.getExceptionReport(upId);
                    
                    request.setAttribute("exceptionList", exceptionList);
                    Debug.print("ActionCompetitionRegistration.exceptionReg.size() :" + exceptionList.size());
                }
                return new ModelAndView("frmCompRegException");
            } else if(process.equalsIgnoreCase("validate")){
                Debug.print("ActionCompetitionRegistration.validate :");
                ArrayList valHrList = new ArrayList();
                int rCount = 0;
                String rSize = request.getParameter("rSize");
                String uploadId = request.getParameter("uploadId");
                
                if(rSize!=null && rSize.trim().length()!=0) {
                    rCount = Integer.parseInt(rSize);
                }
                Debug.print("Record Size:" + rSize);
                
                for(int i=1; i<=rCount; i++){
                    String tmpHorseId = request.getParameter("horseMemberId"+i);
                    String tmpRiderId = request.getParameter("riderMemberId"+i);
                    String tmpHorseName = request.getParameter("horseName"+i);
                    String tmpRiderFName = request.getParameter("riderFname"+i);
                    String tmpRiderLName = request.getParameter("riderLname"+i);
                    
                    String eventId = request.getParameter("eventId"+i);
                    String eventType = request.getParameter("eventType"+i);
                    String eventLevel = request.getParameter("eventLevel"+i);
                    String eventDivAma = request.getParameter("eventDivAma"+i);
                    String eventDivAge = request.getParameter("eventDivAge"+i);
                    String eventDivExp = request.getParameter("eventDivExp"+i);
                    String eventHrName = request.getParameter("eventHrName"+i);
                    String eventHrUsefId = request.getParameter("eventHrUsefId"+i);
                    String eventRFName = request.getParameter("eventRFName"+i);
                    String eventRLName = request.getParameter("eventRLName"+i);
                    
                    String eventRUsefId = request.getParameter("eventRUsefId"+i);
                    String eventOwnerFName = request.getParameter("eventOwnerFName"+i);
                    String eventOwnerLName = request.getParameter("eventOwnerLName"+i);
                    String eventOwnerUseaId = request.getParameter("eventOwnerUseaId"+i);
                    String eventOwnerUsefId = request.getParameter("eventOwnerUsefId"+i);
                    
                    String eventTempRegId = request.getParameter("eventTempRegId"+i);
                    String eventRiderMemberId = request.getParameter("eventRiderMemberId"+i);
                    String eventHorseMemberId = request.getParameter("eventHorseMemberId"+i);

                    
                    Debug.print("horseMemberId" + i + " Value is:" + tmpHorseId );
                    Debug.print("riderMemberId" + i + " Value is:" + tmpRiderId );                    
                    Debug.print("horseName" + i + " Value is:" + tmpHorseName );
                    Debug.print("tmpRiderFName" + i + " Value is:" + tmpRiderFName );
                    Debug.print("tmpRiderLName" + i + " Value is:" + tmpRiderLName );
                    
                    Debug.print("eventTempRegId" + i + " Value is:" + eventTempRegId );
                    
                    HLCCompRegVO compRegVO= new HLCCompRegVO();
                    compRegVO.setEventId(eventId);
                    compRegVO.setEventType(eventType);
                    compRegVO.setEventLevel(eventLevel);
                    compRegVO.setEventDivisionAmateur(eventDivAma);
                    compRegVO.setEventDivisionAge(eventDivAge);
                    compRegVO.setEventDivisionExperience(eventDivExp);
                    compRegVO.setHorseName(tmpHorseName);
                    
                    String voRname = eventRFName+" "+eventRLName;
                    String dbRname = tmpRiderFName+" "+tmpRiderLName;
                    
                    //String hId = eventHorseMemberId;
                    //Debug.print("Horse ID from VO:" + hId);
                    
                    compRegVO.setHorseMemberId(tmpHorseId);
                    compRegVO.setRiderMemberId(tmpRiderId);
                                      
                    //String rId = eventRiderMemberId;
                    //Debug.print("Rider ID from VO:" + rId);
                    if(!eventHorseMemberId.equalsIgnoreCase(tmpHorseId) || !eventRiderMemberId.equalsIgnoreCase(tmpRiderId) || !eventHrName.equalsIgnoreCase(tmpHorseName) || !voRname.equalsIgnoreCase(dbRname)){
                        compRegVO.setExceptionStatus(true);
                        Debug.print("Inside compRegVO.setExceptionStatus(true) block ");
                    }
                    
                    compRegVO.setRiderFirstName(tmpRiderFName);
                    compRegVO.setRiderLastName(tmpRiderLName);
                    
                    compRegVO.setHorseUsefId(eventHrUsefId);
                                        
                    compRegVO.setRiderUsefId(eventRUsefId);
                    compRegVO.setOwnerFirstName(eventOwnerFName);
                    compRegVO.setOwnerLastName(eventOwnerLName);
                    compRegVO.setOwnerUseaId(eventOwnerUseaId);
                    compRegVO.setOwnerUsefId(eventOwnerUsefId);
                    compRegVO.setCompResultId(null);
                    
                    compRegVO.setTmpRegistrationId(eventTempRegId);
                    compRegVO.setRegUploadId(uploadId);
                    valHrList.add(compRegVO);
                }
                
                Debug.print("valHrList size()" + valHrList.size());
                boolean result = vaigaiBean.validateHorseCompReg(valHrList);
                Debug.print("Final Result:" + result);
                if(result =true && uploadId!=null && uploadId.trim().length()!=0){
                    boolean uploadResult = vaigaiBean.updateValidationStatus(uploadId);
                    Debug.print("Update upload Result:" + uploadResult);
                }
                ArrayList compFileDetails = new ArrayList();
                compFileDetails = vaigaiBean.getUploadHorseRegDetails();
                Debug.print("compFileDetails.size() UploadRegDataAction in Servlet : "+compFileDetails.size());
                request.setAttribute("compFileDet",compFileDetails);
                return new ModelAndView("frmMemLstUploadReg");
            }
            
            else if(process.equalsIgnoreCase("exceptionResult")){
                Debug.print("ActionCompetitionRegistration.exceptionResult :");
                String eventId = request.getParameter("eventId");
                String upId = request.getParameter("upId");
                request.setAttribute("uploadId", upId);
                Debug.print("upload Id in Servlet:"+upId);
                Debug.print("ActionCompetitionRegistration.exceptionResult eventId:" + eventId);
                if(upId!=null && upId.trim().length()!=0){
                    ArrayList exceptionList = (ArrayList)vaigaiBean.getExceptionReportForResult(upId);
                    String eventTitle = vaigaiBean.getEventTitle(upId,eventId);
                    
                    request.setAttribute("eventTitle",eventTitle);
                    request.setAttribute("exceptionList", exceptionList);
                    Debug.print("ActionCompetitionRegistration.exceptionResult.size() :" + exceptionList.size());
                }
                return new ModelAndView("frmCompResultException");
            }
            
            else if(process.equalsIgnoreCase("validateResult")){
                Debug.print("ActionCompetitionRegistration.validateResult :");
                ArrayList valHrList = new ArrayList();
                boolean result1=false;
                int rCount = 0;
                String rSize = request.getParameter("rSize");
                String uploadId = request.getParameter("uploadId");
                String eventId="";
                String eventTypeId="";
                
                if(rSize!=null && rSize.trim().length()!=0) {
                    rCount = Integer.parseInt(rSize);
                }
                Debug.print("Record Size:" + rSize);
                
                for(int i=1; i<=rCount; i++){
                    String tmpHorseId = request.getParameter("horseMemberId"+i);
                    String tmpRiderId = request.getParameter("riderMemberId"+i);
                    String tmpHorseName = request.getParameter("horseName"+i);
                    String tmpRiderFName = request.getParameter("riderFname"+i);
                    String tmpRiderLName = request.getParameter("riderLname"+i);
                    
                    String tmp_result_id = request.getParameter("tmp_result_id"+i);
                     eventId = request.getParameter("eventId"+i);
                    String eventType = request.getParameter("eventType"+i);
                    String eventLevel = request.getParameter("eventLevel"+i);
                    String event_division = request.getParameter("event_division"+i);
                    //getting the event type ids,event level ids and event div ids.
                    String eventDetailId[]=vaigaiBean.getEventIds(eventType,eventLevel,event_division);
                     eventTypeId=eventDetailId[0];
                    String eventLevelId=eventDetailId[1];
                    String eventDivId=eventDetailId[2];
                    Debug.print("eventType :"+eventType+" "+"eventTypeId :"+eventTypeId);
                    Debug.print("eventLevel :"+eventLevel+" "+"eventLevelId :"+eventLevelId);
                    Debug.print("event_division :"+event_division+" "+"eventDivId :"+eventDivId);
                    String starters = request.getParameter("starters"+i);
                    String horse_name = request.getParameter("horse_name"+i);
                    String horse_member_id = request.getParameter("horse_member_id"+i);
                    String rider_member_id = request.getParameter("rider_member_id"+i);
                    String pinney_number = request.getParameter("pinney_number"+i);
                    String dressage_penalties = request.getParameter("dressage_penalties"+i);
                    
                    String dressage_place = request.getParameter("dressage_place"+i);
                    String xc_phaseD_jump_penalties = request.getParameter("xc_phaseD_jump_penalties"+i);
                    String xc_phaseD_elapsed_time = request.getParameter("xc_phaseD_elapsed_time"+i);
                    String xc_phaseD_time_penalties = request.getParameter("xc_phaseD_time_penalties"+i);
                    String show_jump_time_penalties = request.getParameter("show_jump_time_penalties"+i);
                    
                    String show_jump_jump_penalties = request.getParameter("show_jump_jump_penalties"+i);
                    String to_date_points = request.getParameter("to_date_points"+i);
                    String to_date_place = request.getParameter("to_date_place"+i);

                    String dangerous_riding_penalties = request.getParameter("dangerous_riding_penalties"+i);
                    String final_points = request.getParameter("final_points"+i);
                    String final_place = request.getParameter("final_place"+i);
                    String first_inspection = request.getParameter("first_inspection"+i);
                    String last_inspection = request.getParameter("last_inspection"+i);
                    
                    String phase_D_inspection = request.getParameter("phase_D_inspection"+i);
                    String road_and_track_A = request.getParameter("road_and_track_A"+i);
                    String road_and_track_C = request.getParameter("road_and_track_C"+i);

                    String steeplechase_jump_penalties = request.getParameter("steeplechase_jump_penalties"+i);
                    String steeplechase_time_penalties = request.getParameter("steeplechase_time_penalties"+i);
                    String hlc_points = request.getParameter("hlc_points"+i);
                    String rider_first_name = request.getParameter("rider_first_name"+i);
                    String rider_last_name = request.getParameter("rider_last_name"+i);
                    String event_sub_div = request.getParameter("event_sub_div"+i);
                    
                    Debug.print("horseMemberId" + i + " Value is:" + tmpHorseId );
                    Debug.print("riderMemberId" + i + " Value is:" + tmpRiderId );                    
                    Debug.print("horseName" + i + " Value is:" + tmpHorseName );
                    Debug.print("tmpRiderFName" + i + " Value is:" + tmpRiderFName );
                    Debug.print("tmpRiderLName" + i + " Value is:" + tmpRiderLName );
                    
                    Debug.print("Hidden horseMemberId" + i + " Value is:" + horse_member_id );
                    Debug.print("Hidden riderMemberId" + i + " Value is:" + rider_member_id );                    
                    Debug.print("Hidden horseName" + i + " Value is:" + horse_name );
                    Debug.print("Hidden tmpRiderFName" + i + " Value is:" + rider_first_name );
                    Debug.print("Hidden tmpRiderLName" + i + " Value is:" + rider_last_name );
                    
                    HLCCompResultVO compRegVO= new HLCCompResultVO();
                    compRegVO.setEvent_id(eventId);
                    if(eventTypeId!=null && eventTypeId.trim().length()!=0 && eventTypeId!=""){
                    compRegVO.setEvent_type_id(eventTypeId);    
                    }else{
                    compRegVO.setEvent_type_id(null);    
                    }
                    if(eventLevelId!=null && eventLevelId.trim().length()!=0 && eventLevelId!=""){
                    compRegVO.setEventLevelId(eventLevelId);
                    }else{
                    compRegVO.setEventLevelId(null);
                    }
                    if(eventDivId!=null && eventDivId.trim().length()!=0 && eventDivId!=""){
                     compRegVO.setEventDivId(eventDivId);
                    }else{
                     compRegVO.setEventDivId(null); 
                    }
                   
                    compRegVO.setEvent_level(eventLevel);
                    compRegVO.setEvent_type(eventType);
                    compRegVO.setEvent_division(event_division);
                    
                     if(starters.equalsIgnoreCase("null") || starters==""){
                        compRegVO.setStarters("NULL");
                    }else{
                        compRegVO.setStarters(starters);
                    }                  
                    
                    if(pinney_number.equalsIgnoreCase("null") || pinney_number==""){
                        compRegVO.setPinney_number("NULL");
                    }else{
                        compRegVO.setPinney_number(pinney_number);
                    }
                    if(dressage_penalties.equalsIgnoreCase("null") || dressage_penalties==""){
                        compRegVO.setDressage_penalties("NULL");
                    }else{
                         compRegVO.setDressage_penalties(dressage_penalties);
                    }
                    if(dressage_place.equalsIgnoreCase("null") || dressage_place==""){
                        compRegVO.setDressage_place("NULL");
                    }else{
                        compRegVO.setDressage_place(dressage_place);       
                    } 
                    if(xc_phaseD_jump_penalties.equalsIgnoreCase("null") || xc_phaseD_jump_penalties==""){
                        compRegVO.setXc_phaseD_jump_penalties("NULL");
                    }else{
                       compRegVO.setXc_phaseD_jump_penalties(xc_phaseD_jump_penalties);   
                    } 
                    if(xc_phaseD_elapsed_time.equalsIgnoreCase("null") || xc_phaseD_elapsed_time==""){
                        compRegVO.setXc_phaseD_elapsed_time("NULL");
                    }else{
                        compRegVO.setXc_phaseD_elapsed_time(xc_phaseD_elapsed_time); 
                    }
                    if(xc_phaseD_time_penalties.equalsIgnoreCase("null") || xc_phaseD_time_penalties==""){
                        compRegVO.setXc_phaseD_time_penalties("NULL");
                    }else{
                       compRegVO.setXc_phaseD_time_penalties(xc_phaseD_time_penalties);
                    }
                    if(show_jump_jump_penalties.equalsIgnoreCase("null") || show_jump_jump_penalties==""){
                        compRegVO.setShow_jump_jump_penalties("NULL");
                    }else{
                      compRegVO.setShow_jump_jump_penalties(show_jump_jump_penalties);
                    }
                    if(show_jump_time_penalties.equalsIgnoreCase("null") || show_jump_time_penalties==""){
                        compRegVO.setShow_jump_time_penalties("NULL");
                    }else{
                      compRegVO.setShow_jump_time_penalties(show_jump_time_penalties);
                    }
                   if(to_date_points.equalsIgnoreCase("null") || to_date_points==""){
                        compRegVO.setTo_date_points("NULL");
                    }else{
                      compRegVO.setTo_date_points(to_date_points);
                    }
                    if(to_date_place.equalsIgnoreCase("null") || to_date_place==""){
                        compRegVO.setTo_date_place("NULL");
                    }else{
                      compRegVO.setTo_date_place(to_date_place);
                    }
                    if(dangerous_riding_penalties.equalsIgnoreCase("null") || dangerous_riding_penalties==""){
                        compRegVO.setDangerous_riding_penalties("NULL");
                    }else{
                      compRegVO.setDangerous_riding_penalties(dangerous_riding_penalties);
                    }
                    if(final_points.equalsIgnoreCase("null") || final_points==""){
                        compRegVO.setFinal_points("NULL");
                    }else{
                      compRegVO.setFinal_points(final_points);
                    }
                    if(final_place.equalsIgnoreCase("null") || final_place==""){
                        compRegVO.setFinal_place("NULL");
                    }else{
                      compRegVO.setFinal_place(final_place);
                    }
                    if(first_inspection.equalsIgnoreCase("null") || first_inspection==""){
                        compRegVO.setFirst_inspection("NULL");
                    }else{
                      compRegVO.setFirst_inspection(first_inspection);
                    }
                    if(last_inspection.equalsIgnoreCase("null") || last_inspection==""){
                        compRegVO.setLast_inspection("NULL");
                    }else{
                      compRegVO.setLast_inspection(last_inspection);
                    }
                    if(phase_D_inspection.equalsIgnoreCase("null") || phase_D_inspection==""){
                        compRegVO.setPhase_D_inspection("NULL");
                    }else{
                       compRegVO.setPhase_D_inspection(phase_D_inspection);
                    }     
                     if(road_and_track_A.equalsIgnoreCase("null") || road_and_track_A==""){
                        compRegVO.setRoad_and_track_A("NULL");
                    }else{
                        compRegVO.setRoad_and_track_A(road_and_track_A);
                    }
                    if(road_and_track_C.equalsIgnoreCase("null") || road_and_track_C==""){
                        compRegVO.setRoad_and_track_C("NULL");
                    }else{
                       compRegVO.setRoad_and_track_C(road_and_track_C);  
                    }
                    if(steeplechase_jump_penalties.equalsIgnoreCase("null") || steeplechase_jump_penalties==""){
                        compRegVO.setSteeplechase_jump_penalties("NULL");
                    }else{
                       compRegVO.setSteeplechase_jump_penalties(steeplechase_jump_penalties); 
                    }
                    if(steeplechase_time_penalties.equalsIgnoreCase("null") || steeplechase_time_penalties==""){
                        compRegVO.setSteeplechase_time_penalties("NULL");
                    }else{
                       compRegVO.setSteeplechase_time_penalties(steeplechase_time_penalties);
                    }
                    if(hlc_points.equalsIgnoreCase("null") || hlc_points==""){
                        compRegVO.setUsea_points("NULL");
                    }else{
                       compRegVO.setUsea_points(hlc_points);
                    }                                  
            
                    String voRname = rider_first_name+" "+rider_last_name;
                    String dbRname = tmpRiderFName+" "+tmpRiderLName;
                    
                    compRegVO.setHorse_name(tmpHorseName);
                    compRegVO.setHorse_member_id(tmpHorseId);
                    compRegVO.setRider_member_id(tmpRiderId);
                    compRegVO.setRider_first_name(tmpRiderFName);
                    compRegVO.setRider_last_name(tmpRiderLName);
                    compRegVO.setTmp_result_id(tmp_result_id); 
                    if(event_sub_div.equalsIgnoreCase("null") || event_sub_div==""){
                        compRegVO.setEvent_sub_division("NULL");
                    }else{
                       compRegVO.setEvent_sub_division(event_sub_div);
                    }                       
                    compRegVO.setUpload_id(uploadId);
                    
                    
                    // for inserting the values and setting the exception status to true in the tblMeeCompResultDetails table.
                    if(tmpHorseId.equalsIgnoreCase("CAN") ||  tmpRiderId.equalsIgnoreCase("CAN") || tmpHorseId.equalsIgnoreCase("NR") ||  tmpRiderId.equalsIgnoreCase("NR")){
                        Debug.print("Inside compRegVO.setExceptionStatus(true) block ");
                        compRegVO.setExceptionStatus(true);
                        //boolean result = vaigaiBean.insertInvalidHorseCompResult(compRegVO);
                         result1 = vaigaiBean.insertValidHorseCompResult(compRegVO);
                        Debug.print("vaigaiBean.insertInvalidHorseCompResult(compRegVO) result :" + result1);                        
                    
                    }
                    else {
                         result1 = vaigaiBean.insertValidHorseCompResult(compRegVO);
                        Debug.print("vaigaiBean.insertValidHorseCompResult(compRegVO) result :" + result1);
                    }                   
                    
                    //valHrList.add(compRegVO);
                }
           // code starts here for Starter Count
                
               if(result1==true){                   
                     ArrayList starterList = new ArrayList();
                     ArrayList starterDetList = new ArrayList();                                          
                     String resGroupId = "";                     
                     starterList = vaigaiBean.getCompResultStarterCount(eventId,uploadId);
                     Debug.print("starterList in servlet :" + starterList);
                     //Debug.print("starterList size in servlet :" + starterList.size());
                     String startCnt="";
                     int i=0;
                     int j=0;
                     int pos=0;                   
                      int startSize=starterList.size();
                     //Debug.print("startSize in servlet"+startSize);                   
                     String tempStCnt1="";
                     String tempStartCnt0="";
                     String mergDiv="";
                     String eveLevel="";
                     String eveDivision="";
                     String eveSubDiv="";
                     String tmpMergDiv="";
                     String tmpeveDiv="";
                     String tmpSubDiv="";
                     String tmpMergDiv1="";
                     String tmpEveLevel="";
                     String eveDivisionId=null;
                     String eveLevelId=null;
                     int statCnt0=0;
                    if(starterList!=null){
                    Debug.print("inside starterList");
                    if(starterList.size()!=0){
                        Iterator itr = starterList.iterator();
                        while(itr.hasNext()){
                        startCnt =(String)itr.next();
                        eveDivision =(String)itr.next();
                        eveSubDiv =(String)itr.next();
                        mergDiv =(String)itr.next();
                        eveLevel=(String)itr.next();
                        if(i==0 && pos==0){                            
                            tempStartCnt0 =startCnt;
                            tmpeveDiv=eveDivision;
                            tmpSubDiv=eveSubDiv;
                            tmpMergDiv=mergDiv;
                            tmpEveLevel=eveLevel;
                            statCnt0=Integer.parseInt(tempStartCnt0);
                            /*Debug.print("tmpEveLevel in servlet"+tmpEveLevel);
                            Debug.print("tmpMergDiv in servlet"+tmpMergDiv);
                            Debug.print("tmpeveDiv in servlet"+tmpeveDiv);
                            Debug.print("tmpSubDiv in servlet"+tmpSubDiv);
                            Debug.print("statCnt0 in servlet"+statCnt0);                     
                            Debug.print("inside tempStartCnt0"+tempStartCnt0);*/
                 if(tempStartCnt0.length()!=0 && tmpMergDiv!=null && tmpMergDiv.trim().length()!=0){ 
                 //Debug.print("inside tempStartCnt0.length() tempStartCnt0 "+tempStartCnt0);
                 //Debug.print("inside tempStartCnt0.length() tempStartCnt0.length()"+tempStartCnt0.length());
                    starterDetList = vaigaiBean.getCompResultTempResIds(eventId,tmpMergDiv,uploadId);                  
                    Debug.print("starterDetList size in servlet for 0 :" + starterDetList.size());
                    if(tmpeveDiv!=null && tmpeveDiv.trim().length()!=0){
                     eveDivisionId=vaigaiBean.getEventDivisionId(tmpeveDiv);                    
                    }
                    if(eveDivisionId!=null && eveDivisionId.trim().length()!=0){
                        eveDivisionId=eveDivisionId;                        
                    }else{
                        eveDivisionId=null;
                    }
                    //Debug.print("eveDivisionId for startCnt 0 :" + eveDivisionId);
                    if(tmpEveLevel!=null && tmpEveLevel.trim().length()!=0){
                     eveLevelId=vaigaiBean.getEventLevelId(tmpEveLevel);                    
                    }
                    if(eveLevelId!=null && eveLevelId.trim().length()!=0){
                        eveLevelId=eveLevelId;                        
                    }else{
                        eveLevelId=null;
                    }
                    //Debug.print("eveLevelId for startCnt 0 :" + eveLevelId);
                    String resultId0="";                                  
                    resGroupId = vaigaiBean.getCompResultGroupId(eventId,starterDetList,tempStartCnt0,eveDivisionId,tmpSubDiv,eventTypeId,uploadId,eveLevelId);
                    Debug.print("resGroupId in tempStartCnt0"+resGroupId);                    
                    if(starterDetList!=null && starterDetList.size()!=0){ 
                         int e=0;
                         Iterator itr0 = starterDetList.iterator();
                        while(itr0.hasNext()){                        
                         resultId0 =(String)itr0.next();                            
                        boolean output1 = vaigaiBean.updateCompResultGrpDets(eventId,resultId0,resGroupId);
                        Debug.print("output1 in tempStartCnt0 "+output1);
                       e++;
                        }  
                    }
                }                           
                      }                                                
                     if(i>0 && pos>0){
                     Debug.print("inside i>0"+i);
                     //Debug.print("inside i>0"+pos);
                     int k=0;
                     if(i==1){
                          k=pos+4;
                         //Debug.print(" k value if i==1"+k);
                     }                    
                     else if(i>1){                                                  
                         k=pos*5;
                         //Debug.print(" k value if i!=1"+k);
                     }         
                                        
                      Object[] elements = starterList.toArray();
                      int tmpLength=elements.length;
                      //Debug.print("elements"+elements); 
                      Debug.print("tmpLength"+tmpLength);                     
                      
                if(k<tmpLength){
                          Debug.print("inside k<tmpLength if");   
                          String tmpeveDiv1="";
                          String tmpSubDiv1="";
                          String tmpeveLeve11="";
                          String eveDivisionId1=null;
                          String eveLevelId1=null;
                          String tempEventDivId=null;
                        for(int s=k; s==k ; s++){
                        //Debug.print("inside for loop&&&&&");                       
                           tempStCnt1=(String)elements[s];
                           tmpeveDiv1=(String)elements[s+1];
                           tmpSubDiv1=(String)elements[s+2];
                           tmpMergDiv1=(String)elements[s+3]; 
                           tmpeveLeve11=(String)elements[s+4];
                        
                       /* Debug.print("inside tempStCnt1 in i>0"+tempStCnt1);
                        Debug.print("inside tmpMergDiv1 in i>0"+tmpMergDiv1);
                        Debug.print("tmpeveLeve11 in tempStCnt1 in i>0"+tmpeveLeve11);
                        Debug.print("elements[s] in i>0"+elements[s]);     */          
                        }    
                 if(tempStCnt1.length()!=0 && tmpMergDiv1!=null && tmpMergDiv1.trim().length()!=0){
                //Debug.print("inside tempStCnt1.length()"+tempStCnt1);
                    starterDetList = vaigaiBean.getCompResultTempResIds(eventId,tmpMergDiv1,uploadId);                  
                    Debug.print("starterDetList size in servlet for k<tmpLength :" + starterDetList.size());
                    if(tmpeveDiv1!=null && tmpeveDiv1.trim().length()!=0){
                    eveDivisionId1=vaigaiBean.getEventDivisionId(tmpeveDiv1);
                    //Debug.print("eveDivisionId1 for startCnt k<tmpLength :" + eveDivisionId1);
                    }
                    if(eveDivisionId1!=null && eveDivisionId1.trim().length()!=0){
                        eveDivisionId1=eveDivisionId1;                        
                    }else{
                        eveDivisionId1=null;
                    }
                    if(tmpeveLeve11!=null && tmpeveLeve11.trim().length()!=0){
                     eveLevelId1=vaigaiBean.getEventLevelId(tmpeveLeve11);
                    }
                    if(eveLevelId1!=null && eveLevelId1.trim().length()!=0){
                        eveLevelId1=eveLevelId1;                        
                    }else{
                        eveLevelId1=null;
                    }
                   // Debug.print("eveLevelId1 for startCnt k<tmpLength:" + eveLevelId1);
                    String resultId1="";
                    String eveDiv1="";
                    String stCnt1=""; 
                    resGroupId = vaigaiBean.getCompResultGroupId(eventId,starterDetList,tempStCnt1,eveDivisionId1,tmpSubDiv1,eventTypeId,uploadId,eveLevelId1);
                    Debug.print("eveResDetForNewId in tempStCnt1 "+resGroupId);                    
                    if(starterDetList!=null && starterDetList.size()!=0){ 
                         int f=0;
                         Iterator itr1 = starterDetList.iterator();
                        while(itr1.hasNext()){
                         resultId1 =(String)itr1.next();                           
                        boolean output1 = vaigaiBean.updateCompResultGrpDets(eventId,resultId1,resGroupId);
                        Debug.print("output1 in tempStCnt1 "+output1);
                       f++;
                        }  
                    }                      
                } 
                  }                          
                        }
                        i++;
                        j++;
                        pos++;
                        }                            
                        }                    
                    }               
        
                }   
                // code Ends here for Starter Count   

                if(uploadId!=null && uploadId.trim().length()!=0){
                    boolean uploadResult = vaigaiBean.updateResultValidationStatus(uploadId);
                    Debug.print("Update upload Result:" + uploadResult);
                }
 
               return new ModelAndView("frmCompResultException_Conf");
            }
 
        } catch(Exception e){
           e.printStackTrace();
        }
        Debug.print("successfully return from ActionCompetitionRegistration");
        
       return null;
    }

    }





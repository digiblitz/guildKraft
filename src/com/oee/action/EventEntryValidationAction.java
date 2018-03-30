/*
 * EventEntryValidationAction.java
 *
 * Created on November 15, 2007, 2:10 PM
 */

package com.oee.action;

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCMemberVO;
import com.hlcutil.HLCCompRegistrationVO;
import com.hlcutil.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

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
 * @author Dhivya
 * @version
 */


	public class EventEntryValidationAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
        try{
            HttpSession session=request.getSession();
           
            HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
			HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            String cmd = request.getParameter("cmd");
            
            if(cmd!=null && cmd.equalsIgnoreCase("initValidation")){
                String horseMemberId = request.getParameter("horseMemberId");
                String userId = (String)session.getAttribute("userId");
                String cmpYear = (String)session.getAttribute("compYear");
                String horseName = (String)request.getAttribute("horseName");
                int cYear = 0;
                Calendar cal = Calendar.getInstance();
                if(cmpYear!=null && cmpYear.trim().length()!=0){
                    cYear = Integer.parseInt(cmpYear);
                }else{
                    cmpYear = ""+cal.get(Calendar.YEAR);
                    cYear = cal.get(Calendar.YEAR);
                }
                String riderId = request.getParameter("riderPrimeId");
                String eventId = (String)session.getAttribute("eventTypeId");
                boolean horseValidity = false;
                
                HLCCalendarVO calVO = (HLCCalendarVO)session.getAttribute("calVO");
                Date currentDate = new Date();
                java.util.Date beginDate = calVO.getBeginDate();
                ArrayList selectEventDetails = new ArrayList();
                
                if(eventId!=null && eventId.trim().length()!=0 ){
                    selectEventDetails=krishnaBean.searchEventDetailsListAdmin(eventId,null,null,cYear);
                }
                ArrayList eventLevelDetails = new ArrayList();
                ArrayList divisionDetails = new ArrayList();
                
                eventLevelDetails = membQualBean.getEventLevelDetailsWithChStatus(eventId, cmpYear);
                divisionDetails = krishnaBean.getDivisions();
                
                request.setAttribute("selectEventDetails",selectEventDetails);
                request.setAttribute("divisionDetails",divisionDetails);
                request.setAttribute("eventLevelDetails",eventLevelDetails);
                request.setAttribute("horseMemberId",horseMemberId);
                request.setAttribute("riderId",riderId);
                request.setAttribute("horseName",horseName);
                
                horseValidity = membQualBean.checkHorseAvailability(eventId, horseMemberId, cmpYear);
                if(horseValidity) request.setAttribute("horseCheck","registered");
                
                long currentTime = 0;
                long beginTime = 0;
                if(currentDate!=null) currentTime = currentDate.getTime();
                if(beginDate!=null) beginTime = beginDate.getTime();
                long diffTime = beginTime - currentTime;
                if(diffTime>0){
                    request.setAttribute("dateCheck","before");
                }
                return new ModelAndView("valid");
            }
            
            else if(cmd!=null && cmd.equalsIgnoreCase("startValidate")){
                String horseMemberId = request.getParameter("horseMemberId");
                String userId = (String)session.getAttribute("userId");
                String cmpYear = (String)session.getAttribute("compYear");
                String eventId = (String)session.getAttribute("eventId");
                String riderId = (String)session.getAttribute("memberId");
                String divId = request.getParameter("divisionId");
                String horseName = request.getParameter("horseName");
                
                ArrayList selectEventDetails = new ArrayList();
                ArrayList riderDetails = new ArrayList();
                ArrayList horseDetails = new ArrayList();
                ArrayList horseValidationDetails = new ArrayList();
                ArrayList riderValidationDetails = new ArrayList();
                ArrayList userDetails = new ArrayList();
                ArrayList eventLevelDetails = new ArrayList();
                ArrayList eventTypeDetails = new ArrayList();
                
                String horseMembId = "";
                String colorCode = "";
                String jumpPenalties = "0";
                String timePenalties = "0";
                String finalPoints ="0";
                String membTypeId = "";
                String membTypeName = "";
                String membPriority = "0";
                String yearFoaled = "0";
                
                String userTypeId = "";
                String evTypeId = "";
                String evLevelId = "";
                String eventDivisionId = "";
                String membershipTypeName = "";
                String minAge = "0";
                String eventLevelRank = "0";
                String qualificationPeriod = "0";
                String minRank = "0";
                String maxRank = "0";
                String minCount = "0";
                String jumpPenalty = "0";
                String timePenalty = "0";
                String membershipTypeId = "";
                String priority = "0";
                String divisionName = "";
                String maxAge = "0";
                
                String rEventId = "";
                String rEventTypeId = "";
                String rEventDivisionId = "";
                String rFinalPoints = "0";
                String rJumpPenalties = "0";
                String rTimePenalties = "0";
                String rMembershipTypeId = "";
                String rMembershipTypeName = "";
                String rMembershipPriority = "0";
                
                String evLvlChamp = request.getParameter("evLevel");
                String evLevel = evLvlChamp.substring(0,evLvlChamp.indexOf(":"));
                String eventLevelId = evLevel.substring(0,evLevel.indexOf("|"));
                String eventTypeId = evLevel.substring((1+evLevel.indexOf("|")),evLevel.length());
                String chStat = evLvlChamp.substring((1+evLvlChamp.indexOf(":")),evLvlChamp.length());
                String divisionId = divId.substring(0,divId.indexOf("|"));
                String divName = divId.substring((1+divId.indexOf("|")),divId.length());
                
                horseDetails = membQualBean.getHorseMemberValidationDetails(horseMemberId, divisionId);
                riderDetails = membQualBean.getRiderDetails(riderId, divisionId);
                userDetails = krishnaBean.getUserTypes();
                
                String horseUserTypeId = "";
                String riderUserTypeId = "";
                int horseAge = 0;
                int horseRecordCount = 0;
                int riderRecordCount = 0;
                if(eventId!=null && eventId.trim().length()!=0 ){
                    selectEventDetails=krishnaBean.searchEventDetailsListAdmin(eventId,null,null,Integer.parseInt(cmpYear));
                }
                
                if(userDetails!=null && userDetails.size()!=0){
                    Iterator itu = userDetails.iterator();
                    while(itu.hasNext()){
                        String [] userDet = (String[])itu.next();
                        String userTypId = userDet[0];
                        String userTypeName = userDet[1];
                        
                        if(userTypeName!=null && userTypeName.equalsIgnoreCase("Horse")) horseUserTypeId = userTypId;
                        else if(userTypeName!=null && userTypeName.equalsIgnoreCase("Human")) riderUserTypeId = userTypId;
                    }
                }
                
                int horseFlag = 0;
                int horseInt = horseDetails.size();
                if(horseUserTypeId!=null && horseUserTypeId.trim().length()!=0){
                    horseValidationDetails = membQualBean.getQualificationDetails(eventTypeId, eventLevelId, chStat, horseUserTypeId, divisionId);
                    if(horseDetails!=null && horseDetails.size()!=0){
                        Iterator itr = horseDetails.iterator();
                        while(itr.hasNext()){
                            String hDet[] = (String[])itr.next();
                            horseMembId = hDet[0];
                            colorCode = hDet[1];
                            jumpPenalties = hDet[2];
                            timePenalties = hDet[3];
                            finalPoints = hDet[4];
                            membTypeId = hDet[5];
                            membPriority = hDet[6];
                            yearFoaled = hDet[7];
                            
                            int jp = 0;
                            int tp = 0;
                            int fp = 0;
                            int horseValidationResult = 0;
                            int horseDesiredResult = 0;
                            
                            if(jumpPenalties!=null && jumpPenalties.trim().length()!=0) jp = Integer.parseInt(jumpPenalties);
                            if(timePenalties!=null && timePenalties.trim().length()!=0) tp = Integer.parseInt(timePenalties);
                            if(finalPoints!=null && finalPoints.trim().length()!=0) fp = Integer.parseInt(finalPoints);
                            
                            if(horseValidationDetails!=null && horseValidationDetails.size()!=0){
                                Iterator itv = horseValidationDetails.iterator();
                                while(itv.hasNext()){
                                    String vDet[] = (String[])itv.next();
                                    userTypeId = vDet[0];
                                    evTypeId = vDet[1];
                                    evLevelId = vDet[2];
                                    eventDivisionId = vDet[3];
                                    membershipTypeName = vDet[4];
                                    minAge = vDet[5];
                                    eventLevelRank = vDet[6];
                                    qualificationPeriod = vDet[7];
                                    minRank = vDet[8];
                                    maxRank = vDet[9];
                                    minCount = vDet[10];
                                    jumpPenalty = vDet[11];
                                    timePenalty = vDet[12];
                                    membershipTypeId = vDet[13];
                                    divisionName = vDet[14];
                                    maxAge = vDet[15];
                                    priority = vDet[16];
                                }
                            }
                            
                            if(eventDivisionId!=null && eventDivisionId.trim().length()!=0 && (!(eventDivisionId.equals("0")))){
                                horseDesiredResult++;
                            }
                            
                            if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(minRank!=null && minRank.trim().length()!=0 && (!(minRank.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(minAge!=null && minAge.trim().length()!=0 && (!(minAge.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(maxAge!=null && maxAge.trim().length()!=0 && (!(maxAge.equals("0")))){
                                horseDesiredResult++;
                            }
                            if(priority!=null && priority.trim().length()!=0 && (!(priority.equals("0")))){
                                horseDesiredResult++;
                            }
                            
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            
                            Calendar cal = Calendar.getInstance();
                            Date qualifyDate = cal.getTime();
                            int currentYear = cal.get(Calendar.YEAR);
                            int horseYear = 0;
                            if(yearFoaled!=null && yearFoaled.trim().length()!=0) horseYear = Integer.parseInt(yearFoaled);
                            horseAge = currentYear - horseYear;
                            
                            String dateToValidate = sdf.format(qualifyDate);
                            horseRecordCount = membQualBean.getRecordCountForHorse(qualificationPeriod, dateToValidate, horseMemberId);
                            
                            if(divisionId!=null && divisionId.trim().length()!=0 && eventDivisionId!=null && eventDivisionId.trim().length()!=0){
                                if(eventDivisionId.equalsIgnoreCase(divisionId))horseValidationResult++;
                            }
                            
                            if(membPriority!=null && membPriority.trim().length()!=0 && (!(membPriority.equalsIgnoreCase("0"))) && priority!=null && priority.trim().length()!=0 && (!(priority.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(membPriority)>=Integer.parseInt(priority)) horseValidationResult++;
                            }
                            
                            if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equalsIgnoreCase("0"))) && horseRecordCount!=0){
                                if(Integer.parseInt(minCount)>=horseRecordCount) horseValidationResult++;
                            }
                            
                            if(jumpPenalties!=null && jumpPenalties.trim().length()!=0 && (!(jumpPenalties.equalsIgnoreCase("0"))) && jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(jumpPenalties)<=Integer.parseInt(jumpPenalty)) horseValidationResult++;
                            }
                            
                            if(timePenalties!=null && timePenalties.trim().length()!=0 && (!(timePenalties.equalsIgnoreCase("0"))) && timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(timePenalties)<=Integer.parseInt(timePenalty)) horseValidationResult++;
                            }
                            
                            if(finalPoints!=null && finalPoints.trim().length()!=0 && (!(finalPoints.equalsIgnoreCase("0"))) && minRank!=null && minRank.trim().length()!=0 && (!(minRank.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(finalPoints)>=Integer.parseInt(minRank)) horseValidationResult++;
                            }
                            
                            if(finalPoints!=null && finalPoints.trim().length()!=0 && (!(finalPoints.equalsIgnoreCase("0"))) && maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(finalPoints)<=Integer.parseInt(maxRank)) horseValidationResult++;
                            }
                            
                            if(horseAge!=0 && minAge!=null && minAge.trim().length()!=0 && (!(minAge.equalsIgnoreCase("0")))){
                                if(horseAge>=Integer.parseInt(minAge)) horseValidationResult++;
                            }
                            
                            if(horseAge!=0 && maxAge!=null && maxAge.trim().length()!=0 && (!(maxAge.equalsIgnoreCase("0")))){
                                if(horseAge<=Integer.parseInt(maxAge)) horseValidationResult++;
                            }
                            
                            if(horseValidationResult==horseDesiredResult) horseFlag++;
                        }
                    }
                    if(horseFlag==horseInt) request.setAttribute("horseResult","success");
                    else request.setAttribute("horseResult","failed");
                }
                
                userTypeId = "";
                evTypeId = "";
                evLevelId = "";
                eventDivisionId = "";
                membershipTypeName = "";
                minAge = "";
                eventLevelRank = "";
                qualificationPeriod = "";
                minRank = "";
                maxRank = "";
                minCount = "";
                jumpPenalty = "";
                timePenalty = "";
                membershipTypeId = "";
                priority = "";
                divisionName = "";
                
                int riderFlag = 0;
                int riderInt = riderDetails.size();
                
                if(riderUserTypeId!=null && riderUserTypeId.trim().length()!=0){
                    riderValidationDetails = membQualBean.getQualificationDetails(eventTypeId, eventLevelId, chStat, riderUserTypeId, divisionId);
                    if(riderDetails!=null && riderDetails.size()!=0){
                        Iterator itr = riderDetails.iterator();
                        while(itr.hasNext()){
                            String hDet[] = (String[])itr.next();
                            rEventId = hDet[0];
                            rEventTypeId = hDet[1];
                            rEventDivisionId = hDet[2];
                            rFinalPoints = hDet[3];
                            rJumpPenalties = hDet[4];
                            rTimePenalties = hDet[5];
                            rMembershipTypeId = hDet[6];
                            rMembershipTypeName = hDet[7];
                            rMembershipPriority = hDet[8];
                            
                            int rjp = 0;
                            int rtp = 0;
                            int rfp = 0;
                            int riderValidationResult = 0;
                            int riderDesiredResult = 0;
                            
                            
                            if(rJumpPenalties!=null && rJumpPenalties.trim().length()!=0) rjp = Integer.parseInt(rJumpPenalties);
                            if(rTimePenalties!=null && rTimePenalties.trim().length()!=0) rtp = Integer.parseInt(rTimePenalties);
                            if(rFinalPoints!=null && rFinalPoints.trim().length()!=0) rfp = Integer.parseInt(rFinalPoints);
                            
                            if(riderValidationDetails!=null && riderValidationDetails.size()!=0){
                                Iterator itv = riderValidationDetails.iterator();
                                while(itv.hasNext()){
                                    String vDet[] = (String[])itv.next();
                                    userTypeId = vDet[0];
                                    evTypeId = vDet[1];
                                    evLevelId = vDet[2];
                                    eventDivisionId = vDet[3];
                                    membershipTypeName = vDet[4];
                                    minAge = vDet[5];
                                    eventLevelRank = vDet[6];
                                    qualificationPeriod = vDet[7];
                                    minRank = vDet[8];
                                    maxRank = vDet[9];
                                    minCount = vDet[10];
                                    jumpPenalty = vDet[11];
                                    timePenalty = vDet[12];
                                    membershipTypeId = vDet[13];
                                    priority = vDet[16];
                                    divisionName = vDet[14];
                                    maxAge = vDet[15];
                                }
                            }
                            
                            if(eventDivisionId!=null && eventDivisionId.trim().length()!=0 && (!(eventDivisionId.equals("0")))) riderDesiredResult++;
                            if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equals("0")))) riderDesiredResult++;
                            if(jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equals("0")))) riderDesiredResult++;
                            if(timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equals("0")))) riderDesiredResult++;
                            if(minRank!=null && minRank.trim().length()!=0 && (!(minRank.equals("0")))) riderDesiredResult++;
                            if(maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equals("0")))) riderDesiredResult++;
                            if(priority!=null && priority.trim().length()!=0 && (!(priority.equals("0")))) riderDesiredResult++;
                            
                            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                            Calendar cal = Calendar.getInstance();
                            Date qualifyDate = cal.getTime();
                            
                            String dateToValidate = sdf.format(qualifyDate);
                            riderRecordCount = membQualBean.getRecordCountForRider(qualificationPeriod, dateToValidate, riderId);
                            
                            if(divisionId!=null && divisionId.trim().length()!=0 && eventDivisionId!=null && eventDivisionId.trim().length()!=0){
                                if(eventDivisionId.equalsIgnoreCase(divisionId))riderValidationResult++;
                            }
                            
                            if(rMembershipPriority!=null && rMembershipPriority.trim().length()!=0 && (!(rMembershipPriority.equalsIgnoreCase("0"))) && priority!=null && priority.trim().length()!=0 && (!(priority.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(rMembershipPriority)>=Integer.parseInt(priority)) riderValidationResult++;
                            }
                            
                            if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equalsIgnoreCase("0"))) && riderRecordCount!=0){
                                if(Integer.parseInt(minCount)>=riderRecordCount) riderValidationResult++;
                            }
                            
                            if(rJumpPenalties!=null && rJumpPenalties.trim().length()!=0 && (!(rJumpPenalties.equalsIgnoreCase("0"))) && jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(rJumpPenalties)<=Integer.parseInt(jumpPenalty)) riderValidationResult++;
                            }
                            
                            if(rTimePenalties!=null && rTimePenalties.trim().length()!=0 && (!(rTimePenalties.equalsIgnoreCase("0"))) && timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(rTimePenalties)<=Integer.parseInt(timePenalty)) riderValidationResult++;
                            }
                            
                            if(rFinalPoints!=null && rFinalPoints.trim().length()!=0 && (!(rFinalPoints.equalsIgnoreCase("0"))) && minRank!=null && minRank.trim().length()!=0 && (!(minRank.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(rFinalPoints)>=Integer.parseInt(minRank)) riderValidationResult++;
                            }
                            
                            if(rFinalPoints!=null && rFinalPoints.trim().length()!=0 && (!(rFinalPoints.equalsIgnoreCase("0"))) && maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equalsIgnoreCase("0")))){
                                if(Integer.parseInt(rFinalPoints)<=Integer.parseInt(maxRank)) riderValidationResult++;
                            }
                            
                            if(riderValidationResult==riderDesiredResult) riderFlag++;
                        }
                    }
                    if(riderFlag==riderInt) request.setAttribute("riderResult","success");
                    else request.setAttribute("riderResult","failed");
                }
                
                eventLevelDetails = membQualBean.getEventLevelDetailsWithChStatus(eventId, cmpYear);
                ArrayList finalEventResults = new ArrayList();
                
                if(eventLevelDetails!=null && eventLevelDetails.size()!=0){
                    Iterator ied = eventLevelDetails.iterator();
                    while(ied.hasNext()){
                        String horseValid = "";
                        String riderValid = "";
                        String el[] = (String[])ied.next();
                        String eTId = el[0];
                        String eLId = el[1];
                        String eLName = el[2];
                        String eTName = el[3];
                        String cStatus = el[4];
                        String chStatus = "";
                        if(cStatus.equalsIgnoreCase("1")) chStatus = "true";
                        else chStatus = "false";
                        String[] horseDet = new String[7];
                        horseDet = getFinalEventResults(horseMemberId, riderId, eTId, eLId, eTName, eLName, chStatus, horseUserTypeId, 
                                riderUserTypeId, divisionId, horseDetails, riderDetails, request, response);
                        
                        finalEventResults.add(horseDet);
                    }
                }
                eventTypeDetails = membQualBean.getEventTypeDetails(eventId);
                String eventLevelName = membQualBean.getEventLevelName(eventLevelId);
                String eventTypeName = membQualBean.getEventTypeName(eventTypeId);
                
                request.setAttribute("selectEventDetails",selectEventDetails);
                session.setAttribute("divisionId",divId);
                request.setAttribute("eventLevelDetails",eventLevelDetails);
                request.setAttribute("eventTypeDetails",eventTypeDetails);
                request.setAttribute("horseMemberId",horseMemberId);
                request.setAttribute("riderId",riderId);
                request.setAttribute("horseDetails",horseDetails);
                request.setAttribute("riderDetails",riderDetails);
                request.setAttribute("horseValidationDetails",horseValidationDetails);
                request.setAttribute("riderValidationDetails",riderValidationDetails);
                request.setAttribute("horseRecordCount",(""+horseRecordCount));
                request.setAttribute("riderRecordCount",(""+riderRecordCount));
                request.setAttribute("divisionName",divName);
                request.setAttribute("eventLevelName",eventLevelName);
                request.setAttribute("eventTypeName",eventTypeName);
                request.setAttribute("divisionId",divId);
                request.setAttribute("evLevel",evLevel);
                request.setAttribute("championshipStatus",chStat);
                request.setAttribute("horseAge",""+horseAge);
                request.setAttribute("finalEventResults",finalEventResults);
                request.setAttribute("horseName",horseName);
                
                if(horseDetails.size()!=0 && riderDetails.size()!=0){
                    if(horseFlag==horseInt && riderFlag==riderInt) return new ModelAndView("toPayment");
                    else return new ModelAndView("validatedResult");
                }else{
                    return new ModelAndView("viewValidatedResult");
                }
            }
            
            else if(cmd!=null && cmd.equalsIgnoreCase("viewEventValidationDetails")){
                String horseMemberId = request.getParameter("horseMemberId");
                String userId = (String)session.getAttribute("userId");
                String cmpYear = (String)session.getAttribute("compYear");
                String eventId = (String)session.getAttribute("eventId");
                String riderId = (String)session.getAttribute("memberId");
                String divId = request.getParameter("divisionId");
                String horseAge = (String)request.getAttribute("horseAge");
                String horseName = request.getParameter("horseName");
                
                ArrayList selectEventDetails = new ArrayList();
                if(eventId!=null && eventId.trim().length()!=0 ){
                    selectEventDetails=krishnaBean.searchEventDetailsListAdmin(eventId,null,null,Integer.parseInt(cmpYear));
                }
                request.setAttribute("selectEventDetails",selectEventDetails);
                String divisionId = divId.substring(0,divId.indexOf("|"));
                String divName = divId.substring((1+divId.indexOf("|")),divId.length());
                String evLevel = request.getParameter("evLevel");
                
                String eventLevelId = evLevel.substring(0,evLevel.indexOf("|"));
                String eventTypeId = evLevel.substring((1+evLevel.indexOf("|")),evLevel.length());
                String chStat = request.getParameter("chStat");
                ArrayList riderDetails = new ArrayList();
                ArrayList horseDetails = new ArrayList();
                ArrayList horseValidationDetails = new ArrayList();
                ArrayList riderValidationDetails = new ArrayList();
                ArrayList userDetails = new ArrayList();
                
                String userTypeId = "";
                String evTypeId = "";
                String evLevelId = "";
                String eventDivisionId = "";
                String membershipTypeName = "";
                String minAge = "";
                String eventLevelRank = "";
                String qualificationPeriod = "";
                String minRank = "";
                String maxRank = "";
                String minCount = "";
                String jumpPenalty = "";
                String timePenalty = "";
                String membershipTypeId = "";
                String priority = "";
                String divisionName = "";
                String maxAge = "";
                
                horseDetails = membQualBean.getHorseMemberValidationDetails(horseMemberId, divisionId);
                riderDetails = membQualBean.getRiderDetails(riderId, divisionId);
                userDetails = krishnaBean.getUserTypes();
                
                String horseUserTypeId = "";
                String riderUserTypeId = "";
                int horseValidationResult = 0;
                int riderValidationResult = 0;
                int horseRecordCount = 0;
                int riderRecordCount = 0;
                
                if(userDetails!=null && userDetails.size()!=0){
                    Iterator itu = userDetails.iterator();
                    while(itu.hasNext()){
                        String [] userDet = (String[])itu.next();
                        String userTypId = userDet[0];
                        String userTypeName = userDet[1];
                        
                        if(userTypeName!=null && userTypeName.equalsIgnoreCase("Horse")) horseUserTypeId = userTypId;
                        else if(userTypeName!=null && userTypeName.equalsIgnoreCase("Human")) riderUserTypeId = userTypId;
                    }
                }
                
                if(horseUserTypeId!=null && horseUserTypeId.trim().length()!=0){
                    horseValidationDetails = membQualBean.getQualificationDetails(eventTypeId, eventLevelId, chStat, horseUserTypeId, divisionId);
                    
                    if(horseValidationDetails!=null && horseValidationDetails.size()!=0){
                        Iterator itv = horseValidationDetails.iterator();
                        while(itv.hasNext()){
                            String vDet[] = (String[])itv.next();
                            userTypeId = vDet[0];
                            evTypeId = vDet[1];
                            evLevelId = vDet[2];
                            eventDivisionId = vDet[3];
                            membershipTypeName = vDet[4];
                            minAge = vDet[5];
                            eventLevelRank = vDet[6];
                            qualificationPeriod = vDet[7];
                            minRank = vDet[8];
                            maxRank = vDet[9];
                            minCount = vDet[10];
                            jumpPenalty = vDet[11];
                            timePenalty = vDet[12];
                            membershipTypeId = vDet[13];
                            maxAge = vDet[15];
                            divisionName = vDet[14];
                        }
                    }
                    
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar cal = Calendar.getInstance();
                    Date qualifyDate = cal.getTime();
                    
                    String dateToValidate = sdf.format(qualifyDate);
                    horseRecordCount = membQualBean.getRecordCountForHorse(qualificationPeriod, dateToValidate, horseMemberId);
                }
                
                userTypeId = "";
                evTypeId = "";
                evLevelId = "";
                eventDivisionId = "";
                membershipTypeName = "";
                minAge = "";
                eventLevelRank = "";
                qualificationPeriod = "";
                minRank = "";
                maxRank = "";
                minCount = "";
                jumpPenalty = "";
                timePenalty = "";
                membershipTypeId = "";
                priority = "";
                divisionName = "";
                
                if(riderUserTypeId!=null && riderUserTypeId.trim().length()!=0){
                    riderValidationDetails = membQualBean.getQualificationDetails(eventTypeId, eventLevelId, chStat, riderUserTypeId, divisionId);
                    if(riderValidationDetails!=null && riderValidationDetails.size()!=0){
                        Iterator itv = riderValidationDetails.iterator();
                        while(itv.hasNext()){
                            String vDet[] = (String[])itv.next();
                            userTypeId = vDet[0];
                            evTypeId = vDet[1];
                            evLevelId = vDet[2];
                            eventDivisionId = vDet[3];
                            membershipTypeName = vDet[4];
                            minAge = vDet[5];
                            eventLevelRank = vDet[6];
                            qualificationPeriod = vDet[7];
                            minRank = vDet[8];
                            maxRank = vDet[9];
                            minCount = vDet[10];
                            jumpPenalty = vDet[11];
                            timePenalty = vDet[12];
                            membershipTypeId = vDet[13];
                            maxAge = vDet[15];
                            divisionName = vDet[14];
                        }
                    }
                    
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    Calendar cal = Calendar.getInstance();
                    Date qualifyDate = cal.getTime();
                    
                    String dateToValidate = sdf.format(qualifyDate);
                    riderRecordCount = membQualBean.getRecordCountForRider(qualificationPeriod, dateToValidate, riderId);
                }
                
                String eventLevelName = membQualBean.getEventLevelName(eventLevelId);
                String eventTypeName = membQualBean.getEventTypeName(eventTypeId);
                
                request.setAttribute("horseMemberId",horseMemberId);
                request.setAttribute("riderId",riderId);
                request.setAttribute("horseDetails",horseDetails);
                request.setAttribute("riderDetails",riderDetails);
                request.setAttribute("horseValidationDetails",horseValidationDetails);
                request.setAttribute("riderValidationDetails",riderValidationDetails);
                request.setAttribute("horseRecordCount",(""+horseRecordCount));
                request.setAttribute("riderRecordCount",(""+riderRecordCount));
                request.setAttribute("divisionName",divName);
                request.setAttribute("divisionId",divId);
                request.setAttribute("evLevel",evLevel);
                request.setAttribute("championshipStatus",chStat);
                request.setAttribute("eventLevelName",eventLevelName);
                request.setAttribute("eventTypeName",eventTypeName);
                request.setAttribute("horseAge",horseAge);
                request.setAttribute("horseName",horseName);
                
                return new ModelAndView("viewValidatedResult");
            }
            
            else if(cmd!=null && cmd.equalsIgnoreCase("selAnotherHorse")){
                String horseMemberId = request.getParameter("horseMemberId");
                String userId = (String)session.getAttribute("userId");
                String cmpYear = (String)request.getAttribute("compYear");
                String eventId = (String)session.getAttribute("eventId");
                String riderId = request.getParameter("riderId");
                String evLevel = request.getParameter("evLevel");
                String redir = request.getParameter("redir");
                String evLevelId = evLevel.substring(0,evLevel.indexOf("|"));
                String evTypeId = evLevel.substring((1+evLevel.indexOf("|")),evLevel.length());
                String chStat = request.getParameter("chStat");
                String evLevelName = membQualBean.getEventLevelName(evLevelId);
                String evTypeName = membQualBean.getEventTypeName(evTypeId);
                String divId = (String)session.getAttribute("divisionId");
                String divName = divId.substring((1+divId.indexOf("|")),divId.length());

                ArrayList fixedAmtDetails = new ArrayList();
                ArrayList userInfo = new ArrayList();
                ArrayList orgPriceDetails = new ArrayList();
                HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
                ArrayList selectEventDetails = new ArrayList();
                
                fixedAmtDetails = membQualBean.getFixedAmount(evTypeId, evLevelId, chStat);
                orgPriceDetails = membQualBean.getorganizerPriceDetails(eventId, chStat, evLevelId, evTypeId);
                
                ArrayList horseDetails = membQualBean.getHorseDetailsByHorseId(horseMemberId);
                HLCCalendarVO calVO = (HLCCalendarVO)session.getAttribute("calVO");
                HLCMemberVO memVO = membQualBean.getMemberDetails(riderId);
                ArrayList sessionVal = (ArrayList)session.getAttribute("sessionVal");
                if(userId!=null && userId.trim().length()!=0) userInfo = membQualBean.getAllHorseDetailsByOwnerId(userId);
                
                String memberId=(String)session.getAttribute("memberId");
                
                if(memberId!=null && memberId.trim().length()!=0){
                    memVO = membQualBean.getMemberDetails(memberId);
                    request.setAttribute("memDetails",memVO);
                    request.setAttribute("isMember","yes");
                }else request.setAttribute("isMember","no");
                
                String horseFirstName = "";
                String horseLastName = "";
                String horseOwnerId = "";
                String horseOwnerFirstName = "";
                String horseOwnerLastName = "";
                String horseRiderId = "";
                
                String horseRiderFirstName = "";
                String horseRiderLastName = "";
                
                String selEventId = "";
                String organizerId = "";
                int compYear = 0;
                String eventTypeId = "";
                String eventLevel = "";
                
                Date beginDate = null;
                Date endDate = null;
                Date extDate = null;
                
                int dueDatePriceValue = 0;
                int afterDueDatePriceValue = 0;
                int depositPriceValue = 0;
                int totalChargeablePrice = 0;
                totalChargeablePrice = Integer.parseInt((String)session.getAttribute("totalChargeablePrice").toString());
                
                if(fixedAmtDetails!=null && fixedAmtDetails.size()!=0){
                    Iterator it = fixedAmtDetails.iterator();
                    int[] prDet = (int[])it.next();
                    dueDatePriceValue = dueDatePriceValue+prDet[0];
                    afterDueDatePriceValue = afterDueDatePriceValue+prDet[1];
                    depositPriceValue = depositPriceValue+prDet[2];
                }
                
                if(orgPriceDetails!=null && orgPriceDetails.size()!=0){
                    Iterator itt = orgPriceDetails.iterator();
                    int[] prDet = (int[])itt.next();
                    dueDatePriceValue = dueDatePriceValue+prDet[0];
                    afterDueDatePriceValue = afterDueDatePriceValue+prDet[1];
                    depositPriceValue = depositPriceValue+prDet[2];
                }
                
                if(horseDetails!=null && horseDetails.size()!=0){
                    Iterator itr = horseDetails.iterator();
                    while(itr.hasNext()){
                        String [] horseDet = (String[])itr.next();
                        horseFirstName = horseDet[0];
                        horseLastName = horseDet[1];
                        horseRiderId = horseDet[2];
                        horseOwnerId = horseDet[3];
                        horseOwnerFirstName = horseDet[4];
                        horseOwnerLastName = horseDet[5];
                    }
                }
                
                if(calVO!=null){
                    selEventId = calVO.getEventId();
                    organizerId = calVO.getOrganizerId();
                    compYear = calVO.getCompYear();
                    eventTypeId = calVO.getEventTypeId();
                    eventLevel = calVO.getEventLevel();
                    beginDate = calVO.getEntryStrtDate();
                    endDate = calVO.getEntryEndDate();
                    extDate = calVO.getExtDueDate();
                }
                if(eventId!=null && eventId.trim().length()!=0 ) selectEventDetails=krishnaBean.searchEventDetailsListAdmin(eventId,null,null,compYear);
                Date currentDate = new Date();
                long currentTime = 0;
                long beginTime = 0;
                long endTime = 0;
                if(currentDate!=null) currentTime = currentDate.getTime();
                if(beginDate!=null) beginTime = beginDate.getTime();
                if(endDate!=null) endTime = endDate.getTime();
                
                long timeDiff = 0;
                timeDiff = endTime - currentTime;

                if(timeDiff<0){
                    totalChargeablePrice = totalChargeablePrice + afterDueDatePriceValue;
                }else if(endDate.getTime()-currentDate.getTime()>0){
                    totalChargeablePrice = totalChargeablePrice + dueDatePriceValue;
                }
                
                Debug.print("Total Chargeable Price: "+totalChargeablePrice);
                
                
                
                if(memVO!=null){
                    horseRiderFirstName = memVO.getFirstName();
                    horseRiderLastName = memVO.getLastName();
                }
                
                String horseFinalName = horseFirstName;
                if(horseLastName!=null && horseLastName.trim().length()!=0){
                    horseFinalName = horseFirstName+" "+horseLastName;
                }
                
                compVO.setEventId(selEventId);
                compVO.setOrganizerId(organizerId);
                compVO.setCompetitionYear(compYear);
                compVO.setEventType(evTypeName);
                compVO.setEventLevel(evLevelName);
                compVO.setHorseMemberId(horseMemberId);
                compVO.setHorseName(horseFinalName);
                compVO.setRiderMemberId(riderId);
                compVO.setRiderFirstName(horseRiderFirstName);
                compVO.setRiderLastName(horseRiderLastName);
                compVO.setOwnerFirstName(horseOwnerFirstName);
                compVO.setOwnerLastName(horseOwnerLastName);
                compVO.setRiderUserId(userId);
                compVO.setQualFilePath(null);
                compVO.setEventDivision(divName);
                
                ArrayList selectedHorseMemberIds = (ArrayList)session.getAttribute("selectedHorseMemberIds");
                selectedHorseMemberIds.add(horseMemberId);
                session.setAttribute("selectedHorseMemberIds",selectedHorseMemberIds);
                    
                sessionVal.add(compVO);
                session.setAttribute("sessionVal",sessionVal);
                session.setAttribute("totalChargeablePrice",Integer.valueOf(totalChargeablePrice));
                request.setAttribute("selectEventDetails",selectEventDetails);
                request.setAttribute("userInfo",userInfo);
                
                if(redir!=null && redir.equalsIgnoreCase("horse")) return new ModelAndView("selAnotherHorse");
                else if(redir!=null && redir.equalsIgnoreCase("payment")) return new ModelAndView("toFinalPayment");
            }
        } catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    public String[] getFinalEventResults(String horseMemberId, String riderId, String eTId, String eLId, String eTName,
            String eLName, String chStatus, String horseUserTypeId, String riderUserTypeId, String divisionId,
            ArrayList horseDetails, ArrayList riderDetails, HttpServletRequest request, HttpServletResponse response) throws Exception{
        
        String[] validDetails = new String[7];
        
        try{
        	 HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
 			HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
 			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
 			
            int hFlag = 0;
            int hInt = horseDetails.size();
            String horseMembId = "";
            String colorCode = "";
            String jumpPenalties = "0";
            String timePenalties = "0";
            String finalPoints ="0";
            String membTypeId = "";
            String membTypeName = "";
            String membPriority = "0";
            String yearFoaled = "0";
            
            String userTypeId = "";
            String evTypeId = "";
            String evLevelId = "";
            String eventDivisionId = "";
            String membershipTypeName = "";
            String minAge = "0";
            String eventLevelRank = "0";
            String qualificationPeriod = "0";
            String minRank = "0";
            String maxRank = "0";
            String minCount = "0";
            String jumpPenalty = "0";
            String timePenalty = "0";
            String membershipTypeId = "";
            String priority = "0";
            String divisionName = "";
            String maxAge = "0";
            
            String rEventId = "";
            String rEventTypeId = "";
            String rEventDivisionId = "";
            String rFinalPoints = "0";
            String rJumpPenalties = "0";
            String rTimePenalties = "0";
            String rMembershipTypeId = "";
            String rMembershipTypeName = "";
            String rMembershipPriority = "0";
            int horseAge = 0;
            int horseRecordCount = 0;
            int riderRecordCount = 0;
            String horseValid = "";
            String riderValid = "";
            
            if(horseUserTypeId!=null && horseUserTypeId.trim().length()!=0){
                ArrayList horseValidationDetails = membQualBean.getQualificationDetails(eTId, eLId, chStatus, horseUserTypeId, divisionId);
                if(horseDetails!=null && horseDetails.size()!=0){
                    Iterator itr = horseDetails.iterator();
                    while(itr.hasNext()){
                        String hDet[] = (String[])itr.next();
                        horseMembId = hDet[0];
                        colorCode = hDet[1];
                        jumpPenalties = hDet[2];
                        timePenalties = hDet[3];
                        finalPoints = hDet[4];
                        membTypeId = hDet[5];
                        membPriority = hDet[6];
                        yearFoaled = hDet[7];
                        
                        int jp = 0;
                        int tp = 0;
                        int fp = 0;
                        int horseValidationResult = 0;
                        int horseDesiredResult = 0;
                        
                        if(jumpPenalties!=null && jumpPenalties.trim().length()!=0) jp = Integer.parseInt(jumpPenalties);
                        if(timePenalties!=null && timePenalties.trim().length()!=0) tp = Integer.parseInt(timePenalties);
                        if(finalPoints!=null && finalPoints.trim().length()!=0) fp = Integer.parseInt(finalPoints);
                        
                        if(horseValidationDetails!=null && horseValidationDetails.size()!=0){
                            Iterator itv = horseValidationDetails.iterator();
                            while(itv.hasNext()){
                                String vDet[] = (String[])itv.next();
                                userTypeId = vDet[0];
                                evTypeId = vDet[1];
                                evLevelId = vDet[2];
                                eventDivisionId = vDet[3];
                                membershipTypeName = vDet[4];
                                minAge = vDet[5];
                                eventLevelRank = vDet[6];
                                qualificationPeriod = vDet[7];
                                minRank = vDet[8];
                                maxRank = vDet[9];
                                minCount = vDet[10];
                                jumpPenalty = vDet[11];
                                timePenalty = vDet[12];
                                membershipTypeId = vDet[13];
                                divisionName = vDet[14];
                                maxAge = vDet[15];
                                priority = vDet[16];
                            }
                        }
                        
                        if(eventDivisionId!=null && eventDivisionId.trim().length()!=0 && (!(eventDivisionId.equals("0")))){
                            horseDesiredResult++;
                        }
                        
                        if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(minRank!=null && minRank.trim().length()!=0 && (!(minRank.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(minAge!=null && minAge.trim().length()!=0 && (!(minAge.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(maxAge!=null && maxAge.trim().length()!=0 && (!(maxAge.equals("0")))){
                            horseDesiredResult++;
                        }
                        if(priority!=null && priority.trim().length()!=0 && (!(priority.equals("0")))){
                            horseDesiredResult++;
                        }
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        
                        Calendar cal = Calendar.getInstance();
                        Date qualifyDate = cal.getTime();
                        int currentYear = cal.get(Calendar.YEAR);
                        int horseYear = 0;
                        if(yearFoaled!=null && yearFoaled.trim().length()!=0) horseYear = Integer.parseInt(yearFoaled);
                        horseAge = currentYear - horseYear;
                        
                        String dateToValidate = sdf.format(qualifyDate);
                        horseRecordCount = membQualBean.getRecordCountForHorse(qualificationPeriod, dateToValidate, horseMemberId);
                        
                        if(divisionId!=null && divisionId.trim().length()!=0 && eventDivisionId!=null && eventDivisionId.trim().length()!=0){
                            if(eventDivisionId.equalsIgnoreCase(divisionId))horseValidationResult++;
                        }
                        
                        if(membPriority!=null && membPriority.trim().length()!=0 && (!(membPriority.equalsIgnoreCase("0"))) && priority!=null && priority.trim().length()!=0 && (!(priority.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(membPriority)>=Integer.parseInt(priority)) horseValidationResult++;
                        }
                        
                        if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equalsIgnoreCase("0"))) && horseRecordCount!=0){
                            if(Integer.parseInt(minCount)>=horseRecordCount) horseValidationResult++;
                        }
                        
                        if(jumpPenalties!=null && jumpPenalties.trim().length()!=0 && (!(jumpPenalties.equalsIgnoreCase("0"))) && jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(jumpPenalties)<=Integer.parseInt(jumpPenalty)) horseValidationResult++;
                        }
                        
                        if(timePenalties!=null && timePenalties.trim().length()!=0 && (!(timePenalties.equalsIgnoreCase("0"))) && timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(timePenalties)<=Integer.parseInt(timePenalty)) horseValidationResult++;
                        }
                        
                        if(finalPoints!=null && finalPoints.trim().length()!=0 && (!(finalPoints.equalsIgnoreCase("0"))) && minRank!=null && minRank.trim().length()!=0 && (!(minRank.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(finalPoints)>=Integer.parseInt(minRank)) horseValidationResult++;
                        }
                        
                        if(finalPoints!=null && finalPoints.trim().length()!=0 && (!(finalPoints.equalsIgnoreCase("0"))) && maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(finalPoints)<=Integer.parseInt(maxRank)) horseValidationResult++;
                        }
                        
                        if(horseAge!=0 && minAge!=null && minAge.trim().length()!=0 && (!(membPriority.equalsIgnoreCase("0")))){
                            if(horseAge>=Integer.parseInt(minAge)) horseValidationResult++;
                        }
                        
                        if(horseAge!=0 && maxAge!=null && maxAge.trim().length()!=0 && (!(membPriority.equalsIgnoreCase("0")))){
                            if(horseAge<=Integer.parseInt(maxAge)) horseValidationResult++;
                        }
                        if(horseValidationResult==horseDesiredResult) hFlag++;
                    }
                }
            }
            
            if(hFlag!=0 && hInt!=0 && hFlag==hInt) horseValid = "Yes";
            else horseValid = "No";
            
            userTypeId = "";
            evTypeId = "";
            evLevelId = "";
            eventDivisionId = "";
            membershipTypeName = "";
            minAge = "";
            eventLevelRank = "";
            qualificationPeriod = "";
            minRank = "";
            maxRank = "";
            minCount = "";
            jumpPenalty = "";
            timePenalty = "";
            membershipTypeId = "";
            priority = "";
            divisionName = "";
            int rFlag = 0;
            int rInt = riderDetails.size();
            
            if(riderUserTypeId!=null && riderUserTypeId.trim().length()!=0){
                ArrayList riderValidationDetails = membQualBean.getQualificationDetails(eTId, eLId, chStatus, riderUserTypeId, divisionId);
                if(riderDetails!=null && riderDetails.size()!=0){
                    Iterator itr = riderDetails.iterator();
                    while(itr.hasNext()){
                        String hDet[] = (String[])itr.next();
                        rEventId = hDet[0];
                        rEventTypeId = hDet[1];
                        rEventDivisionId = hDet[2];
                        rFinalPoints = hDet[3];
                        rJumpPenalties = hDet[4];
                        rTimePenalties = hDet[5];
                        rMembershipTypeId = hDet[6];
                        rMembershipTypeName = hDet[7];
                        rMembershipPriority = hDet[8];
                        
                        int rjp = 0;
                        int rtp = 0;
                        int rfp = 0;
                        int riderValidationResult = 0;
                        int riderDesiredResult = 0;
                        
                        if(rJumpPenalties!=null && rJumpPenalties.trim().length()!=0) rjp = Integer.parseInt(rJumpPenalties);
                        if(rTimePenalties!=null && rTimePenalties.trim().length()!=0) rtp = Integer.parseInt(rTimePenalties);
                        if(rFinalPoints!=null && rFinalPoints.trim().length()!=0) rfp = Integer.parseInt(rFinalPoints);
                        
                        if(riderValidationDetails!=null && riderValidationDetails.size()!=0){
                            Iterator itv = riderValidationDetails.iterator();
                            while(itv.hasNext()){
                                String vDet[] = (String[])itv.next();
                                userTypeId = vDet[0];
                                evTypeId = vDet[1];
                                evLevelId = vDet[2];
                                eventDivisionId = vDet[3];
                                membershipTypeName = vDet[4];
                                minAge = vDet[5];
                                eventLevelRank = vDet[6];
                                qualificationPeriod = vDet[7];
                                minRank = vDet[8];
                                maxRank = vDet[9];
                                minCount = vDet[10];
                                jumpPenalty = vDet[11];
                                timePenalty = vDet[12];
                                membershipTypeId = vDet[13];
                                priority = vDet[16];
                                divisionName = vDet[14];
                                maxAge = vDet[15];
                            }
                        }
                        
                        if(eventDivisionId!=null && eventDivisionId.trim().length()!=0 && (!(eventDivisionId.equals("0")))) riderDesiredResult++;
                        if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equals("0")))) riderDesiredResult++;
                        if(jumpPenalty!=null && jumpPenalty.trim().length()!=0 && (!(jumpPenalty.equals("0")))) riderDesiredResult++;
                        if(timePenalty!=null && timePenalty.trim().length()!=0 && (!(timePenalty.equals("0")))) riderDesiredResult++;
                        if(minRank!=null && minRank.trim().length()!=0 && (!(minRank.equals("0")))) riderDesiredResult++;
                        if(maxRank!=null && maxRank.trim().length()!=0 && (!(maxRank.equals("0")))) riderDesiredResult++;
                        if(priority!=null && priority.trim().length()!=0 && (!(priority.equals("0")))) riderDesiredResult++;
                        
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Calendar cal = Calendar.getInstance();
                        Date qualifyDate = cal.getTime();
                        
                        String dateToValidate = sdf.format(qualifyDate);
                        riderRecordCount = membQualBean.getRecordCountForRider(qualificationPeriod, dateToValidate, riderId);
                        
                        if(divisionId!=null && divisionId.trim().length()!=0 && eventDivisionId!=null && eventDivisionId.trim().length()!=0){
                            if(eventDivisionId.equalsIgnoreCase(divisionId))riderValidationResult++;
                        }
                        
                        if(rMembershipPriority!=null && rMembershipPriority.trim().length()!=0 && (!(rMembershipPriority.equalsIgnoreCase("0"))) && priority!=null && priority.trim().length()!=0 && (!(priority.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(rMembershipPriority)>=Integer.parseInt(priority)) riderValidationResult++;
                        }
                        
                        if(minCount!=null && minCount.trim().length()!=0 && (!(minCount.equalsIgnoreCase("0"))) && riderRecordCount!=0){
                            if(Integer.parseInt(minCount)>=riderRecordCount) riderValidationResult++;
                        }
                        
                        if(rJumpPenalties!=null && rJumpPenalties.trim().length()!=0 && (!(rJumpPenalties.equalsIgnoreCase("0"))) && jumpPenalty!=null && jumpPenalty.trim().length()!=0  && (!(jumpPenalty.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(rJumpPenalties)<=Integer.parseInt(jumpPenalty)) riderValidationResult++;
                        }
                        
                        if(rTimePenalties!=null && rTimePenalties.trim().length()!=0 && (!(rTimePenalties.equalsIgnoreCase("0"))) && timePenalty!=null && timePenalty.trim().length()!=0  && (!(timePenalty.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(rTimePenalties)<=Integer.parseInt(timePenalty)) riderValidationResult++;
                        }
                        
                        if(rFinalPoints!=null && rFinalPoints.trim().length()!=0 && (!(rFinalPoints.equalsIgnoreCase("0"))) && minRank!=null && minRank.trim().length()!=0  && (!(minRank.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(rFinalPoints)>=Integer.parseInt(minRank)) riderValidationResult++;
                        }
                        
                        if(rFinalPoints!=null && rFinalPoints.trim().length()!=0 && (!(rFinalPoints.equalsIgnoreCase("0"))) && maxRank!=null && maxRank.trim().length()!=0  && (!(maxRank.equalsIgnoreCase("0")))){
                            if(Integer.parseInt(rFinalPoints)<=Integer.parseInt(maxRank)) riderValidationResult++;
                        }
                        
                        if(riderValidationResult==riderDesiredResult) rFlag++;
                    }
                }
            }
            
            if(rFlag!=0 && rInt!=0 && rFlag==rInt) riderValid = "Yes";
            else riderValid = "No";
            
            String[] validResults = {eTId, eLId, eTName, eLName, horseValid, riderValid, chStatus};
            validDetails = validResults;
        }catch(Exception e){
            e.printStackTrace();
        }
        return validDetails;
    }
}
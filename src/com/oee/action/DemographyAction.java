/*
 * DemographyAction.java
 *
 * Created on November 12, 2007, 12:37 PM
 */

package com.oee.action;

import com.hlccommon.util.HLCHorseRegisterationVO;
import com.hlcevent.edu.HLCEducationalSessionBean;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemote;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemoteHome;

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
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcutil.HLCCalendarVO;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcutil.*;
import java.util.Date;

/**
 *
 * @author Vidhya
 * @version
 */
public class DemographyAction implements Controller {
    
    
    
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
           
          
            HLCMembershipQualificationMatrixBean qremote = new HLCMembershipQualificationMatrixBean();
            
            HLCKaverySessionBeanStatfulBean remote = new HLCKaverySessionBeanStatfulBean();
            
            HLCEducationalSessionBean eduRemote = new HLCEducationalSessionBean();
            
            HLCkaverystatelessBean remote1 = new HLCkaverystatelessBean();
            
            HLCKrishnaStatelessBean calRemote = new HLCKrishnaStatelessBean();
            
            HLCCalendarVO calVO = new HLCCalendarVO();
            String process=request.getParameter("process");
            HttpSession session = request.getSession(true);
            String userId=(String)session.getAttribute("userId");
            String memberId=(String)session.getAttribute("memberId");
            
            if(process!=null && process.equalsIgnoreCase("initDemoList")){
                ArrayList sessionVal = new ArrayList();
                ArrayList selectedHorseMemberIds = new ArrayList();
                int totalChargeablePrice = 0;
                session.setAttribute("totalChargeablePrice",Integer.valueOf(totalChargeablePrice));
                session.setAttribute("sessionVal",sessionVal);
                session.setAttribute("selectedHorseMemberIds",selectedHorseMemberIds);
                session.setAttribute("forEE","fromEventEntry");
                String eventTypeId = request.getParameter("eventTypeId");
                session.setAttribute("eventTypeId",eventTypeId);
                String compYear = request.getParameter("compYear");
                session.setAttribute("compYear",compYear);
                HLCMemberVO memDetails = new HLCMemberVO();
                calVO = qremote.selectEventDetails(eventTypeId, compYear);
                session.setAttribute("calVO",calVO);
                
                Debug.print("sessionVal Size: "+sessionVal.size());
                
                ArrayList userInfo = null;
                if(userId!=null && userId.trim().length()!=0) userInfo = qremote.getAllHorseDetailsByOwnerId(userId);
                request.setAttribute("userInfo",userInfo);
                
                boolean horseValidity= false;
                String eventId = (String)session.getAttribute("eventTypeId");
                String horseMemberId = request.getParameter("horseMemberId");
                String cmpYear = (String)session.getAttribute("compYear");
                horseValidity = qremote.checkHorseAvailability(eventId, horseMemberId, cmpYear);
                if(horseValidity) request.setAttribute("horseCheck","registered");
                
                HLCCalendarVO calVO1 = (HLCCalendarVO)session.getAttribute("calVO");
                Date currentDate = new Date();
                java.util.Date beginDate = calVO1.getBeginDate();
                long currentTime = 0;
                long beginTime = 0;
                if(currentDate!=null) currentTime = currentDate.getTime();
                if(beginDate!=null) beginTime = beginDate.getTime();
                long diffTime = beginTime - currentTime;
                if(diffTime>0){
                    request.setAttribute("dateCheck","before");
                }
                ArrayList eventLevelDetails = new ArrayList();
                ArrayList divisionDetails = new ArrayList();
                
                eventLevelDetails = qremote.getEventLevelDetailsWithChStatus(eventId, cmpYear);
                Debug.print("in initDemoList: "+eventLevelDetails);
                divisionDetails = calRemote.getDivisions();
               
                request.setAttribute("divisionDetails",divisionDetails);
                request.setAttribute("eventLevelDetails",eventLevelDetails);
                
                Debug.print("sessionVal Size: "+sessionVal.size());
               
                System.out.println("1");
                if(memberId!=null && memberId.trim().length()!=0){
					System.out.println("2");
                    memDetails = qremote.getMemberDetails(memberId);
                    request.setAttribute("isMember","yes");
                }else{
					System.out.println("3");
                    request.setAttribute("isMember","no");
                }
				System.out.println("4");
                request.setAttribute("memDetails",memDetails);
                session.setAttribute("compYear",compYear);
                session.setAttribute("eventId",eventTypeId);
                session.setAttribute("eventTypeId",eventTypeId);
                String orgId = "";
				System.out.println("5");
                ArrayList selectEventDetails = new ArrayList();
				System.out.println("6");
                if(eventTypeId!=null && eventTypeId.trim().length()!=0 ){
					System.out.println("7");
                    selectEventDetails=calRemote.searchEventDetailsListAdmin(eventTypeId,null,null,Integer.parseInt(compYear));
                }
				System.out.println("8");
                if(selectEventDetails!=null && selectEventDetails.size()!=0){
                    Iterator ior = selectEventDetails.iterator();
					System.out.println("9");
                    while(ior.hasNext()){
						System.out.println("10");
                        HLCCalendarVO clVO = (HLCCalendarVO)ior.next();
                        orgId = clVO.getOrganizerId();
						System.out.println("11");
                    }
                }
				System.out.println("12");
                String orgFirstName = "";
                String orgLastName = "";
                System.out.println("13");
                if(orgId!=null && orgId.trim().length()!=0){
                    HLCMemberVO meVO = qremote.getMemberDetails(orgId);
                    orgFirstName = meVO.getFirstName();
                    orgLastName = meVO.getLastName();
                }
				System.out.println("14");
                session.setAttribute("orgFirstName",orgFirstName);
                session.setAttribute("orgLastName",orgLastName);
                request.setAttribute("selectEventDetails",selectEventDetails);
				System.out.println("15");
				
				return new ModelAndView("frmDemographyDetList");
               }
            
            else if(process!=null && process.equalsIgnoreCase("UserListing")){
				System.out.println("1");
                String eventTypeId = (String)session.getAttribute("eventTypeId");
                String compYear = (String)session.getAttribute("compYear");
System.out.println("1");
                ArrayList userInfo = null;
                if(userId!=null && userId.trim().length()!=0) userInfo = qremote.getAllHorseDetailsByOwnerId(userId);
                request.setAttribute("userInfo",userInfo);
                System.out.println("1");
                HLCMemberVO memDetails = new HLCMemberVO();
                if(memberId!=null && memberId.trim().length()!=0){
					System.out.println("1");
                    memDetails = qremote.getMemberDetails(memberId);
                    request.setAttribute("isMember","yes");
                }else{
					System.out.println("1");
                    request.setAttribute("isMember","no");
                }
				System.out.println("1");
                ArrayList selectEventDetails = new ArrayList();
				System.out.println("1");
                if(eventTypeId!=null && eventTypeId.trim().length()!=0 ) selectEventDetails=calRemote.searchEventDetailsListAdmin(eventTypeId,null,null,Integer.parseInt(compYear));
                request.setAttribute("selectEventDetails",selectEventDetails);
                request.setAttribute("memDetails",memDetails);
				System.out.println("1");
				
				return new ModelAndView("frmDemographyDetList");
                
            }
            
            else if(process!=null && process.equalsIgnoreCase("chngdesc")){
				System.out.println("1");
                String eventTypeId = (String)session.getAttribute("eventTypeId");
                String memId = request.getParameter("memid");
                HLCHorseRegisterationVO HorseDet = null;
                System.out.println("1");
                if(memId!=null && memId.trim().length()!=0){
					System.out.println("1");
                    HorseDet = (HLCHorseRegisterationVO) remote.getHorseDetailsByHorseMemberId(memId);
                    String ownerId = HorseDet.getOwnerId();
                    String addownerId = HorseDet.getAddOwnerId();
                    String prevownerId = HorseDet.getPrevOwnerId();
                    String riderId = HorseDet.getRiderMemberId();
                    String prevRiderId = HorseDet.getPrevRiderMemberId();
                    String addRiderId = HorseDet.getAddRiderMemberId();
                    String paymentId= HorseDet.getPaymentId();
                    
                    if(ownerId!=null && ownerId.trim().length()!=0){
                        ArrayList ownerDetails = (ArrayList)remote1.getUserContactDetails(ownerId);
                        request.setAttribute("ownerDetails",ownerDetails);
                    } else{
                        request.setAttribute("ownerDetails",null);
                    }
                    
                    if(riderId!=null && riderId.trim().length()!=0){
                        ArrayList prevownerDet = (ArrayList)remote1.getMemberContactDetails(riderId);
                        request.setAttribute("riderInfoDetails",prevownerDet);
                    } else{
                        request.setAttribute("riderInfoDetails",null);
                    }
                    
                    ArrayList HorseDisp = (ArrayList) remote.getHorseRelationshipDetailsDetails(memId);
                    String[] paydet = (String[]) remote.getHorsePaymentDetails(paymentId);
                    float balamt = remote.getBalanceAmount(paymentId);
                    request.setAttribute("BalAmount",String.valueOf(balamt));
                    request.setAttribute("paydet",paydet);
                    request.setAttribute("ListVO",HorseDisp);
                    request.setAttribute("HorseDet",HorseDet);
                    request.setAttribute("err","");
                    
                    boolean pri_owner = false;
                    pri_owner = remote.isHorsePriOwnerExist(memId,userId);
                    
                    if(pri_owner == true){
                        request.setAttribute("primaryOwner","primaryOwner");
                    }
                    return new ModelAndView("UsrDegradeHorseRegi");
                    
                } else{
					System.out.println("1--> else");
					 return new ModelAndView("admin-horse-regi-listing");
                   
                }
            }
        } catch(Exception e){
			System.out.println("1 Exception block");
            e.printStackTrace();
        }
        return null;
    }
}
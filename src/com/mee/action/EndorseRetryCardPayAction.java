/*
 * EndorseRetryCardPayAction.java
 *
 * Created on January 4, 2008, 4:13 PM
 */

package com.mee.action;

import com.mee.actionform.FormEventOrgRenewal;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.naming.InitialContext;
import javax.naming.Context;

import com.hlcmro.util.*;
import com.hlcmro.org.HLCVaigaiSessionBean;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;
import java.util.Vector;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import com.hlccommon.util.Debug;
import com.hlcmro.renewal.*;
import com.hlcform.stateless.*;
import com.hlcmro.display.HLCVaigaiStatelessBean;


/**
 *
 * @author Dhivya
 * @version
 */

	public class EndorseRetryCardPayAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
             try{
            	 
            	 //HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            	 HLCVaigaiSessionBean vaigaiBean=new HLCVaigaiSessionBean();
                    HttpSession session = request.getSession(false);
                    HLCVaigaiStatelessBean vaigaiBean1=new HLCVaigaiStatelessBean();
                  
                    
                    FormEventOrgRenewal endForm=new FormEventOrgRenewal(); 
                    HLCRenewalOrganizerDetails objRenewalDet = new HLCRenewalOrganizerDetails();
                    HLCPaymentDetailsVO objPayDet = new HLCPaymentDetailsVO();
                    
                    
                    
                SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");

                Debug.print("Return from Nova");
                
                String sslResult = request.getParameter("ssl_result");
                String sslResultMessage =  request.getParameter("ssl_result_message");
                String sslTxnId =  request.getParameter("ssl_txn_id");
                String sslApprovalCode = request.getParameter("ssl_approval_code");
                String sslCvv2Response = request.getParameter("ssl_cvv2_response");
                String sslAvsResponse = request.getParameter("ssl_avs_response");
                String sslTransactionType =  request.getParameter("ssl_transaction_type");
                String sslInvoiceNo = request.getParameter("ssl_invoice_number");
                String sslEmail = request.getParameter("ssl_email");
                
                Debug.print("Sucessfully return from Nova sslResult:" + sslResult);
                Debug.print("Sucessfully return from Nova sslResultMessage:" + sslResultMessage);
                Debug.print("Sucessfully return from Nova sslTxnId:" + sslTxnId);
                Debug.print("Sucessfully return from Nova sslApprovalCode:" + sslApprovalCode);
                Debug.print("Sucessfully return from Nova sslCvv2Response:" + sslCvv2Response);
                Debug.print("Sucessfully return from Nova sslAvsResponse:" + sslAvsResponse);
                Debug.print("Sucessfully return from Nova sslTransactionType:" + sslTransactionType);
                Debug.print("Sucessfully return from Nova sslInvoiceNo:" + sslInvoiceNo);
                Debug.print("Sucessfully return from Nova sslEmail:" + sslEmail);
               
                
                objRenewalDet = (HLCRenewalOrganizerDetails) session.getAttribute("objRenewalDet");
                objPayDet = (HLCPaymentDetailsVO) session.getAttribute("objPaymentList");

                Debug.print("Sucessfully return from NOVA UserId:" + (String)session.getAttribute("userId"));
                Debug.print("Sucessfully return from Nova objActDet:" + objRenewalDet);
                Debug.print("Sucessfully return from Nova objPayDet:" + objPayDet);
                
                //if(sslResult.equals("0")){
                    if(objRenewalDet!=null && objPayDet!=null){
                        objPayDet.setSslResult(sslResult);
                        objPayDet.setSslResultMessage(sslResultMessage);
                        objPayDet.setSslTxnId(sslTxnId);
                        objPayDet.setSslApprovalCode(sslApprovalCode);
                        objPayDet.setSslCvv2Response(sslCvv2Response);
                        objPayDet.setSslAvsResponse(sslAvsResponse);
                        objPayDet.setSslTransactionType(sslTransactionType);
                        objPayDet.setSslInvoiceNo(sslInvoiceNo);
                        objPayDet.setSslEmail(sslEmail);
                        Debug.print("Activity Organizer  Sucessfully Getting Started:");
                       
                        boolean updateResult=false;
                        if(objPayDet.getPaymentId()!=null){
                        updateResult=vaigaiBean.updatePayment(objPayDet);
                        }
                        Debug.print("updateResult :"+updateResult);
                        session.setAttribute("objRenewalDet",null);
                        session.setAttribute("objPaymentList",null);
                        request.setAttribute("eventId",String.valueOf(objRenewalDet.getEventId())); 
                        if(sslResult.equals("0")){
                        request.setAttribute("paymentMode","card"); 
                        request.setAttribute("amount",String.valueOf(objPayDet.getAmount()));
                        
                        
                        System.out.println("Inside Organizer Reg form Action..........");
                        
                        Vector getAllMapRuleSubRule= new Vector();
                        
                        Vector distanceSpeedVect = new Vector();
                        Vector dressageHorseTrialsVect = new Vector();
                        ArrayList arenaSizeVect = new ArrayList();
                        ArrayList jdDet=new ArrayList();
                        
                      
                        getAllMapRuleSubRule=vaigaiBean1.getAllMapRuleSubRule();
                        jdDet=vaigaiBean1.selectJudgesDetails();
                        System.out.println("jdDet size in servlet :"+jdDet.size());
                        
                        dressageHorseTrialsVect = vaigaiBean1.selectDressageHorseTrials();
                        arenaSizeVect = vaigaiBean1.getAreaPriceMaster();//selectArenaSize();
                        
                        //request.setAttribute("allTypesVect", allTypesVect);
                        request.setAttribute("distanceSpeedVect",distanceSpeedVect);
                        request.setAttribute("getAllMapRuleSubRule",getAllMapRuleSubRule);
                        request.setAttribute("dressageHorseTrialsVect",dressageHorseTrialsVect);
                        request.setAttribute("arenaSizeVect",arenaSizeVect);
                        request.setAttribute("jdDet",jdDet);
                        
                    //for event title, event type and event level.
                    String eventId1="";
                    eventId1 = (String)request.getAttribute("eventId");//"10026";
                    Debug.print("eventId from getAttribute:"+eventId1);
                    String paramValue=request.getParameter("fromList");
                    Debug.print("paramValue :"+paramValue);
                    if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                    eventId1=request.getParameter("eventId");    
                    }
                    Debug.print("eventId from getParameter:"+eventId1);
                    String type = request.getParameter("type");
                    HLCEventRequestVO eventReqVO = new HLCEventRequestVO();
                    ArrayList areaDetails = new ArrayList();
                    if(eventId1!= null && eventId1.trim().length()!=0){
                        eventReqVO = vaigaiBean.getEventRequestDetails(eventId1);
                        areaDetails = vaigaiBean.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                    }
                    Debug.print("EventReqVO returned:"+eventReqVO.toString());
                    ArrayList stateDetails = new ArrayList();
                    Vector allTypesVect = new Vector();
                    stateDetails = vaigaiBean.getAllStates();
                    allTypesVect = vaigaiBean1.getAllMapTyLe();
                    Vector eventTypeDetails = new Vector();
                    HashMap hm = new HashMap();
                    HashMap eventTypeMap = new HashMap();
                    ArrayList subLevel = new ArrayList();
                    if(allTypesVect!=null ){
                        Enumeration e = allTypesVect.elements();
                        while(e.hasMoreElements()){
                            String[] typeDetails = (String[])e.nextElement();
                            String mapId = typeDetails[0];
                            String typeId = typeDetails[1];
                            String levelId = typeDetails[2];
                            String typeName = typeDetails[3];
                            String levelCode = typeDetails[4];
                            String levelName = typeDetails[5];
                            if(hm.containsKey(typeId)){
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }else{
                                subLevel = new ArrayList();
                                String[] subEntry = {mapId,levelId,levelCode,levelName};
                                subLevel.add(subEntry);
                                eventTypeMap.put(typeId,subLevel);
                            }
                            hm.put(typeId,typeName);
                        }
                        Set set = hm.keySet();
                        Iterator itr = set.iterator();
                        while(itr.hasNext()){
                            String keyId = (String)itr.next();
                            String valueName = (String)hm.get(keyId);
                            String[] eventTypeDet = {keyId,valueName};
                            eventTypeDetails.add(eventTypeDet);
                        }
                    }
                    if(areaDetails!=null && areaDetails.size()!=0){
                    Iterator arItr = areaDetails.iterator();
                    if(arItr.hasNext()){
                        String[] areaDet = (String[])arItr.next();
                        request.setAttribute("AREA_DETAILS",areaDet);
                    }
                    }
                    request.setAttribute("EVENT_REQUEST_VO",eventReqVO);
                    request.setAttribute("stateDetails",stateDetails);
                    request.setAttribute("eventTypeDetails",eventTypeDetails);
                    request.setAttribute("eventTypeMap",eventTypeMap);
                    //==============================================================
                    
                    String payMode=(String)request.getAttribute("paymentMode");
                    String amt=(String)request.getAttribute("amount");
                    request.setAttribute("amount",amt);
                    request.setAttribute("paymentMode",payMode);
                    String noPay="";
                    noPay=(String)request.getAttribute("noPayment");
                    if(paramValue!=null && paramValue.equalsIgnoreCase("fromList")){
                    noPay=request.getParameter("noPayment");    
                    }
                    Debug.print("noPay from getAttribute:"+noPay);
                    Debug.print("noPay from getParameter:"+noPay);
                    request.setAttribute("noPayment",noPay);
                    String eventID=request.getParameter("eventId");
                    Debug.print("eventID :"+eventID);
                    String secId=vaigaiBean.isOrgMainEventRegExist(eventID);
                    Debug.print("secId :"+secId);
                    String memberId=(String)session.getAttribute("memberId");
                        if(memberId != null && secId==null || secId=="") {
                        	return new ModelAndView("frmEventOrgUpdate");
                        } else if(memberId == null){
                        	return new ModelAndView("event-Org-Reg-Eligibility");
                        } else if(secId!= null){
                            request.setAttribute("alreadyExists","alreadyExists");
                            return new ModelAndView("event-Org-Reg-Eligibility");
                        }             
                 
                      
                        }else if(sslResult.equals("1")){
                        
                        request.setAttribute("paymentId",objPayDet.getPaymentId()); 
                        request.setAttribute("price",String.valueOf(objPayDet.getAmount()));
                        return new ModelAndView("frmMeeRenewalSuccess");    
                        }
                     }
                //}
                Debug.print("Payment Details are not inserted...");
                //request.setAttribute("eventId",String.valueOf(objRenewalDet.getEventId()));
                request.setAttribute("paymentId",objPayDet.getPaymentId());
                request.setAttribute("price",String.valueOf(objPayDet.getAmount()));
                return new ModelAndView("frmMeeRenewalSuccess");   
             }
             catch( Exception e ){
                e.printStackTrace();
            }
           
           return null;
    }
}

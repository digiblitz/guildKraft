/*
 * EndorseRetryPayAction.java
 *
 * Created on January 4, 2008, 3:32 PM
 */

package com.mee.action;

import com.hlcmro.display.HLCVaigaiStatelessBean;
import com.mee.actionform.FormEventOrgRenewal;
import javax.rmi.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import com.hlcmro.util.*;
import com.hlcmro.org.HLCVaigaiSessionBean;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Properties;
import java.util.Date;
import java.util.Set;
import java.util.Vector;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import java.util.*;
import com.hlccommon.util.Debug;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

//import com.hlcform.stateless.*;
import com.hlcform.util.HLCPaymentDetails;
/**
 *
 * @author Vidhya
 * @version
 */

	public class EndorseRetryPayAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
             try{
            	 HLCVaigaiStatelessBean vaigaiBean=new HLCVaigaiStatelessBean();
            	 HLCVaigaiSessionBean vaigaiBean1=new HLCVaigaiSessionBean();
            	 
                HttpSession session = request.getSession(false);
              
                FormEventOrgRenewal endForm=new FormEventOrgRenewal(); 
                HLCRenewalOrganizerDetails objRenewalDet = new HLCRenewalOrganizerDetails();
                HLCPaymentDetailsVO objPayDet = new HLCPaymentDetailsVO();
                HLCEndorsedFormVO objEndorseDet = new HLCEndorsedFormVO();
                
                String eventProcess = request.getParameter("eventProcess");
                Debug.print("eventProcess: " + eventProcess);
                
                if(eventProcess!=null){
                    if(eventProcess.equalsIgnoreCase("initRetryPayment")){
                    Debug.print("eventProcess in EndorseRetryPayAction :"+eventProcess);
                    String eveId=request.getParameter("eventId");
                    String payId=request.getParameter("paymentId");
                    String price=request.getParameter("amt");
                    String button=request.getParameter("butSbmt");
                    request.setAttribute("eventId",eveId);
                    request.setAttribute("paymentId",payId);
                    request.setAttribute("price",price);
                    if(button!=null){
                        if(button.equalsIgnoreCase("Retry Payment")){
                        	return new ModelAndView("frmEndorseRetryPayment"); 
                        }
                        else if(button.equalsIgnoreCase("Register OmniBus")){
                        request.setAttribute("noPayment","noPay");   
                        
                        System.out.println("Inside Organizer Reg form Action..........");
                        
                        Vector getAllMapRuleSubRule= new Vector();
                        
                        Vector distanceSpeedVect = new Vector();
                        Vector dressageHorseTrialsVect = new Vector();
                        ArrayList arenaSizeVect = new ArrayList();
                        ArrayList jdDet=new ArrayList();
                        
                      
                        getAllMapRuleSubRule=vaigaiBean.getAllMapRuleSubRule();
                        jdDet=vaigaiBean.selectJudgesDetails();
                        System.out.println("jdDet size in servlet :"+jdDet.size());
                        
                        dressageHorseTrialsVect = vaigaiBean.selectDressageHorseTrials();
                        arenaSizeVect = vaigaiBean.getAreaPriceMaster();//selectArenaSize();
                        
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
                        eventReqVO = vaigaiBean1.getEventRequestDetails(eventId1);
                        areaDetails = vaigaiBean1.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                    }
                    Debug.print("EventReqVO returned:"+eventReqVO.toString());
                    ArrayList stateDetails = new ArrayList();
                    Vector allTypesVect = new Vector();
                    stateDetails = vaigaiBean1.getAllStates();
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
                    String secId=vaigaiBean1.isOrgMainEventRegExist(eventID);
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
                                                    
                        }
                        else if(button.equalsIgnoreCase("Back To List")){
                        	return new ModelAndView("frmMeeOrgEventListings"); 
                        }
                    }
                     
                    }
                    if(eventProcess.equalsIgnoreCase("updatePayment")){
                    Debug.print("eventProcess in EndorseRetryPayAction :"+eventProcess);
                    
                    String payId=vaigaiBean1.getPaymtId();
                    //retrieve PaymentDetails Object set in Servlet 1
                    HLCPaymentDetails objPayment=(HLCPaymentDetails)session.getAttribute("objPayment");
                    objPayment.setPaymentId(payId);
                    
                    String reqIp=request.getRemoteAddr();
                    String eventId=request.getParameter("eventId");
                    //String payId=request.getParameter("paymentId");
                     
                    String eveTitle=request.getParameter("eveTitle");
                    SimpleDateFormat sdf = new SimpleDateFormat("mm/dd/yyy");
                    int  CcExpMonth = 0;
                    int CcExpYear = 0;
                    int CcCvvid =0;
                    double amount =0;
                    long CcNumber = 0;
                    long checkNumber=0;
                    Date check_date = null;
                    Date comp_date = null;
                    String ccType=null;
                    String ccName=null;
                    String  r11 = endForm.getR11();
                    System.out.print("Check Status :" + r11);
                    String userId=(String)session.getAttribute("userId");
                    Debug.print("userId in servlet :"+userId);
                    boolean insertResult=false;
                    
                    if(r11.equals("card")){
                        if(endForm.getCcNumber()==null || endForm.getCcNumber().equals("")){
                        CcNumber = 0;
                        objPayment.setCcNumber(endForm.getCcNumber());  
                        }else {
                        CcNumber = Long.parseLong(endForm.getCcNumber());
                        objPayment.setCcNumber(endForm.getCcNumber());  
                        }
                        if(endForm.getCcName()==null || endForm.getCcName().equals("")){
                        ccName ="";
                        objPayment.setCcName(ccName);
                        }else {
                        ccName=endForm.getCcName();
                        objPayment.setCcName(ccName);
                        }
                        if(!(endForm.getCcType().equals("")) && endForm.getCcType()!=null){
                        ccType = endForm.getCcType();  
                        objPayment.setCcType(ccType);
                        }
                        if(endForm.getCcExpMonth()==null || endForm.getCcExpMonth().equals("")){
                        CcExpMonth =0;
                        objPayment.setCcExpMonth(CcExpMonth);
                        }else {
                        CcExpMonth=Integer.parseInt(endForm.getCcExpMonth());
                        objPayment.setCcExpMonth(CcExpMonth);
                        }
                        if(endForm.getCcExpYear()==null || endForm.getCcExpYear().equals("")){
                        CcExpYear =0;
                        objPayment.setCcExpYear(CcExpYear);
                        }else{
                        CcExpYear = Integer.parseInt(endForm.getCcExpYear());
                        objPayment.setCcExpYear(CcExpYear);
                        }
                        if(endForm.getCcCvvid()==null || endForm.getCcCvvid().equals("")){
                        CcCvvid =0;
                        objPayment.setCcCvvid(CcCvvid);
                        }else{
                        CcCvvid = Integer.parseInt(endForm.getCcCvvid());
                        objPayment.setCcCvvid(CcCvvid);
                        }
                        session.setAttribute("cardselect",ccType);
                        session.setAttribute("objPayment",objPayment);
                        
                        check_date= null;
                        objPayDet.setPaymentStatus("card");
                    }
                    if(r11.equals("check")){
                        if(endForm.getCheckNumber()==null || endForm.getCheckNumber().equals("")){
                        checkNumber=0;
                        }else{
                        checkNumber= Long.parseLong(endForm.getCheckNumber());
                        }
                        if(endForm.getCheckDate().equals("")){
                        check_date= null;
                        }else{
                        check_date =(Date)sdf.parse(endForm.getCheckDate());
                        }
                        objPayDet.setPaymentStatus("Check");
                    }
                    
                    if(endForm.getAmount()==null || endForm.getAmount()=="" ){
                    amount=0; 
                    }else{
                    amount = Double.parseDouble(endForm.getAmount());
                    } 
                    objRenewalDet.setEventId(Integer.parseInt(eventId));
                    objPayDet.setUserId(userId);
                    objPayDet.setCcName(ccName);
                    objPayDet.setCcType(ccType);
                    objPayDet.setCcNumber(CcNumber);
                    objPayDet.setCcExpMonth(CcExpMonth);
                    objPayDet.setCcExpYear(CcExpYear);
                    objPayDet.setCcCvvid(CcCvvid);
                    objPayDet.setBankName(endForm.getBankName());
                    objPayDet.setCheckName(endForm.getNameOnchk());
                    objPayDet.setCheckDate(check_date);
                    objPayDet.setChkNumber(endForm.getCheckNumber());
                    objPayDet.setAmount(amount);
                    objPayDet.setPaymentDate(new Date());
                    objPayDet.setPaymentId(payId);
                    
                    System.out.println("paymenId" + objPayDet.getPaymentId());
                    
                    System.out.println("getBankName" +endForm.getBankName());
                    System.out.println("check_date" +check_date);
                    System.out.println("checkNumber" +checkNumber);
                    System.out.println("amount" +amount);
                    System.out.println("setPaymentDate" +new Date()); 
                
                   if(r11.equals("card")){
                        Debug.print("Sucessfully Redirect to Paypal");
                        //session.setAttribute("objRenewalDet",objRenewalDet);
                        //session.setAttribute("objPaymentList",objPayDet);
                       
                        Debug.print("Sucessfully Payment objRenewalDet:" + objRenewalDet.toString());
                        Debug.print("Sucessfully Payment objPaymentList:" + objPayDet.toString());
                       //===========================================
                        request.setAttribute("email","suryey@yahoo.co.in");
                        request.setAttribute("cardNo",String.valueOf(CcNumber));
                        String expMon = String.valueOf(CcExpMonth);
                        String expYear = String.valueOf(CcExpYear);
                        if(expMon.trim().length()==1) {
                             expMon = "0" + expMon;
                        }
                        Debug.print("expYear:" + expYear);
                        //expYear = expYear.substring(2);
                        Debug.print("expMon:" + expMon);
                        Debug.print("expYear:" + expYear);
                        String expDate = expMon + expYear;
                        request.setAttribute("expDate",expDate);
                        request.setAttribute("amount",String.valueOf(amount));
                        request.setAttribute("chkDigit",String.valueOf(CcCvvid));
                        session.setAttribute("eveTitle",eveTitle);
                        StringBuffer reqURL = request.getRequestURL();
                        int lastIndex = reqURL.lastIndexOf("/") ;
                        String url ="";
                        if(lastIndex!=-1){
                            url = reqURL.substring(0,lastIndex+1);
                        }
                        //String tmpNova  = mr.getMessage("orgRetryPayment.nova");
                        //String nova = url + tmpNova;

                        //request.setAttribute("nova",nova);
                        //PayPal Part ===========================================
                       // String inVoiceId1 = (String) session.getAttribute("inVoiceId1");
                         //System.out.println("inVoiceId1 in servlet********" + inVoiceId1);
                         String inVoiceId1="1";
                           int intVId = 0;
                        if (inVoiceId1.equalsIgnoreCase("0")) {
                            intVId = 1;
                        } else {
                            intVId = 1;
                        } 
                        session.setAttribute("sessionInvoiceId","1");    
                        request.setAttribute("AMT", (String)endForm.getAmount());
                        request.setAttribute("PAYMENTACTION", "Authorization");
                        request.setAttribute("CREDITCARDTYPE", (String)endForm.getCcType());
                        request.setAttribute("ACCT", (String)endForm.getCcNumber());
                        request.setAttribute("EXPDATE", expDate);
                        request.setAttribute("IPADDRESS", reqIp);
                        request.setAttribute("FIRSTNAME", (String)endForm.getCcName());
                        request.setAttribute("CVVNo", (String)endForm.getCcCvvid());
                        request.setAttribute("STREET", "1 Main St");
                        request.setAttribute("CITY", "San Jose");
                        request.setAttribute("STATE", "CA");
                        request.setAttribute("ZIP", "95131");
                        request.setAttribute("COUNTRYCODE", "US");
                        request.setAttribute("EMAIL", (String) session.getAttribute("emailId"));
                        //session.setAttribute("objPayment",objPayDet);
                         session.setAttribute("objPayment",objPayment);
                        session.setAttribute("cardselect",request.getParameter("ccType"));

                        //intVId++; 
                        request.setAttribute("intVId", String.valueOf(intVId));
                        System.out.println("intVId in servlet&&&&&&&" + intVId);
                        request.setAttribute("purpose", "endorsedForm"); 
                        return new ModelAndView("testpaypal");

                    }else{
                     boolean updateResult=false;
                     updateResult=vaigaiBean1.updatePayment(objPayDet);
                     Debug.print("updateResult :"+updateResult);
                     request.setAttribute("eventId",eventId);
                     if(updateResult==true){
                     request.setAttribute("paymentMode","check"); 
                     request.setAttribute("amount",String.valueOf(objPayDet.getAmount()));
                     
                     System.out.println("Inside Organizer Reg form Action..........");
                     
                     Vector getAllMapRuleSubRule= new Vector();
                     
                     Vector distanceSpeedVect = new Vector();
                     Vector dressageHorseTrialsVect = new Vector();
                     ArrayList arenaSizeVect = new ArrayList();
                     ArrayList jdDet=new ArrayList();
                     
                   
                     getAllMapRuleSubRule=vaigaiBean.getAllMapRuleSubRule();
                     jdDet=vaigaiBean.selectJudgesDetails();
                     System.out.println("jdDet size in servlet :"+jdDet.size());
                     
                     dressageHorseTrialsVect = vaigaiBean.selectDressageHorseTrials();
                     arenaSizeVect = vaigaiBean.getAreaPriceMaster();//selectArenaSize();
                     
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
                     eventReqVO = vaigaiBean1.getEventRequestDetails(eventId1);
                     areaDetails = vaigaiBean1.getZipcodeFromToOnStateId(eventReqVO.getCompetition_state(),eventReqVO.getCompetition_zip());
                 }
                 Debug.print("EventReqVO returned:"+eventReqVO.toString());
                 ArrayList stateDetails = new ArrayList();
                 Vector allTypesVect = new Vector();
                 stateDetails = vaigaiBean1.getAllStates();
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
                 String secId=vaigaiBean1.isOrgMainEventRegExist(eventID);
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
             
                     }else{
                     
                     request.setAttribute("paymentId",objPayDet.getPaymentId()); 
                     request.setAttribute("price",String.valueOf(objPayDet.getAmount()));    
                     return new ModelAndView("frmEndorseRetryPayment");    
                     }
                    }    
                          
            }//closing updatePayment   
            }//closing eventProcess!=null
        }catch(Exception e){
        e.printStackTrace();    
        }
  return null;  
  }  
}

/*
 * AddPriceAction.java
 *
 * Created on November 15, 2007, 1:08 PM
 */

package com.oee.action;

import com.db.GeneralDBAction;
import com.hlcaccounts.session.*;
import com.hlccommon.util.Debug;
import com.mrm.actionform.InsertHorseRegActionForm;
import com.hlcutil.HLCPriceMatrixVO;

import java.io.IOException;
import java.lang.Double;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.regex.*;
import java.lang.String;
import java.net.ProtocolException;

import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import java.util.Properties;
import java.util.Date;
import java.text.*;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
/**
 *
 * @author Dhivya
 * @version
 */

	public class AddPriceAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {

        try{
            HttpSession session=request.getSession();
            GeneralDBAction db=new GeneralDBAction();
			HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
	    	
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            
            HLCPriceMatrixVO priceVO= new HLCPriceMatrixVO();
            
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            Debug.print("cmd function:" + cmd);
            if(cmd!=null){
                if(cmd.equals("initPrice")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    Debug.print("eventId in AddPriceAction servlet: "+eventId);
                    String itemId=request.getParameter("itemId");
                    Debug.print("itemId in AddPriceAction servlet: "+itemId);
                    // for new item
                    String newItem=request.getParameter("newItem");
                    String itemName="";
                    String itemType="";
                    String chargeType="";
                    if(newItem!=null){
                        itemName=request.getParameter("txtItemName");
                        itemType=request.getParameter("selType");
                        chargeType=request.getParameter("varType");
                        boolean isExist=membQualBean.isItemNameExist(itemName);
                        
                        if(isExist==true){
                            request.setAttribute("err","st");
                            request.setAttribute("eventId","eventId");
                            return new ModelAndView("frmOEENewItemCreate");
                        }else{
                            itemId=membQualBean.insertNewPriceItem(itemName,"true");
                        }
                        //for new item
                        request.setAttribute("eventId","eventId");
                        request.setAttribute("newItem","newItem");
                        request.setAttribute("itemName",itemName);
                        request.setAttribute("itemType",itemType);
                        request.setAttribute("chargeType",chargeType);
                    }
                    request.setAttribute("itemId",itemId);
                    ArrayList itemDetails = new ArrayList();
                    ArrayList eventType = new ArrayList();
                    ArrayList eventTypeChamp = new ArrayList();
                    ArrayList eventLevel = new ArrayList();
                    ArrayList eventLevelChamp = new ArrayList();
                    
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    //eventType = membQualBean.getEventTypeDetWithoutChamp(eventId);
                    //Debug.print("eventType in AddPriceAction servlet:initPrice "+eventType.size());
                    //eventTypeChamp = membQualBean.getEventTypeDetailsForChamp(eventId);
                    //Debug.print("eventType in AddPriceAction servlet:initPrice "+eventTypeChamp.size());
                    eventLevel = membQualBean.getEventLevelDetWithoutChamp(eventId);
                    Debug.print("eventLevel in AddPriceAction servlet: initPrice"+eventLevel.size());
                    eventLevelChamp = membQualBean.getEventLevelDetWithChamp(eventId);
                    Debug.print("eventLevelChamp in AddPriceAction servlet: initPrice"+eventLevelChamp.size());
                    
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("itemDetails",itemDetails);  
                    request.setAttribute("eventLevel",eventLevel);
                    request.setAttribute("eventLevelChamp",eventLevelChamp);
                    
                    return new ModelAndView("frmOEEInsertPriceDetails");
                }
                
                if(cmd.equals("initNewItem")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    request.setAttribute("newItem","newItem");
                    request.setAttribute("eventId",eventId);
                    return new ModelAndView("frmOEENewItemCreate");
                }
                if(cmd.equals("insertPriceDetails")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    ArrayList itemDetails = new ArrayList();
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("selItem");
                    String itemType="fixed";
                    String chargeType=null;
                    String newItem=request.getParameter("newItem");
                    Debug.print("newItem: "+newItem);
                    if(newItem!=null && newItem.trim().length()!=0){
                        //String itemName=request.getParameter("itemName");
                        Debug.print("newItem inside if: "+newItem);
                        itemType=request.getParameter("itemType");
                        chargeType=request.getParameter("chargeType");
                        Debug.print("Inside New Item");
                        Debug.print("itemId in AddPriceAction: "+itemId);
                        Debug.print("itemType in AddPriceAction: "+itemType);
                        Debug.print("chargeType in AddPriceAction: "+chargeType);
                    }
                    boolean flag = true;
                    Debug.print("eventId in  AddPriceAction: "+eventId);
                    Debug.print("itemName in AddPriceAction: "+itemId);
                    int noChampSize = 0;
                    String noChSize = request.getParameter("noChampSize");
                    Debug.print("noChSize in AddPriceAction: "+noChSize);
                    
                    if(noChSize!=null && noChSize.trim().length()!=0){
                        noChampSize = Integer.parseInt(noChSize);
                    }
                    for(int i=1; i<=noChampSize; i++){
                        Debug.print("inside loop: "+i);
                       String eventTypeId=request.getParameter("eveTypId"+i);
                       Debug.print("eventTypeId AddPriceAction: "+eventTypeId);
                        
                        String eventLevelId=request.getParameter("eveLevId"+i);
                        Debug.print("eventLevelId AddPriceAction: "+eventLevelId);
                        String duePrice=request.getParameter("txtDue"+i);
                        String afterDuePrice=request.getParameter("txtAfterDue"+i);
                        String depAmt=request.getParameter("txtDepAmt"+i);
                        Debug.print("duePricein AddPriceAction: "+duePrice);
                        Debug.print("afterDuePricein AddPriceAction: "+afterDuePrice);
                        Debug.print("depAmtin AddPriceAction: "+depAmt);
                        //if(duePrice!=null && duePrice.trim().length()!=0 && afterDuePrice!=null && afterDuePrice.trim().length()!=0){
                            if(eventId!=null && eventId.trim().length()!=0) priceVO.setEventId(eventId);
                            else priceVO.setEventId(null);
                            
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            if(eventTypeId!=null && eventTypeId.trim().length()!=0) priceVO.setEventTypeId(eventTypeId);
                            else priceVO.setEventTypeId(null);
                            
                            if(eventLevelId!=null && eventLevelId.trim().length()!=0) priceVO.setEventLevelId(eventLevelId);
                            else priceVO.setEventLevelId(null);
                            
                            if(itemType!=null && itemType.trim().length()!=0) priceVO.setItemType(itemType);
                            else priceVO.setItemType(null);
                            
                            if(chargeType!=null && chargeType.trim().length()!=0) priceVO.setChargeType(chargeType);
                            else priceVO.setChargeType(null);
                            Debug.print("itemType : "+itemType);
                            Debug.print("chargeType : "+chargeType);
                            if(duePrice!=null && duePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(duePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(afterDuePrice!=null && afterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(afterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(depAmt!=null && depAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(depAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setChampionshipStatus(false);
                            boolean noChampResult=false;
                            boolean isexist=false;
                            isexist=membQualBean.isPriceMatrixExist(eventId,itemId,eventTypeId,eventLevelId);
                            if(isexist==true){
                                request.setAttribute("AlreadyExist","AlreadyExist");
                                request.setAttribute("eventId",eventId);
                                request.setAttribute("itemId",itemId);
                                request.setAttribute("itemDetails",itemDetails);
                                return new ModelAndView("frmOEEPriceDetailsSuccess");
                            }else{
                                noChampResult=membQualBean.insertPriceMatrixDetails(priceVO);
                            }
                            if(noChampResult==true){
                                 request.setAttribute("insertStatus","success");
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    int champSize = 0;
                    String chSize = request.getParameter("champSize");
                    Debug.print("chSize in AddPriceAction: "+chSize);
                    
                    if(chSize!=null && chSize.trim().length()!=0){
                        champSize = Integer.parseInt(chSize);
                    }
                    Debug.print("champSize in AddPriceAction: "+champSize);
                    for(int i=1;i<=champSize; i++){
                        Debug.print("inside Champ loop: "+i);
                        String CeventType=request.getParameter("eveTypIdC"+i);
                       Debug.print("CeventType AddPriceAction: "+CeventType);                       
                        String CeventLevel=request.getParameter("eveLevIdC"+i);
                        Debug.print("CeventLevel AddPriceAction: "+CeventLevel);
                        String CduePrice=request.getParameter("txtDueC"+i);
                        String CafterDuePrice=request.getParameter("txtAfterDueC"+i);
                        String CdepAmt=request.getParameter("txtDepAmtC"+i);
                        Debug.print("CduePricein AddPriceAction: "+CduePrice);
                        Debug.print("CafterDuePricein AddPriceAction: "+CafterDuePrice);
                        Debug.print("CdepAmtin AddPriceAction: "+CdepAmt);
                 //if(CduePrice!=null && CduePrice.trim().length()!=0 && CafterDuePrice!=null && CafterDuePrice.trim().length()!=0){
                            if(eventId!=null && eventId.trim().length()!=0) priceVO.setEventId(eventId);
                            else priceVO.setEventId(null);
                            
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            if(CeventType!=null && CeventType.trim().length()!=0) priceVO.setEventTypeId(CeventType);
                            else priceVO.setEventTypeId(null);
                            
                            if(CeventLevel!=null && CeventLevel.trim().length()!=0) priceVO.setEventLevelId(CeventLevel);
                            else priceVO.setEventLevelId(null);
                            
                            if(itemType!=null && itemType.trim().length()!=0) priceVO.setItemType(itemType);
                            else priceVO.setItemType(null);
                            
                            if(chargeType!=null && chargeType.trim().length()!=0) priceVO.setChargeType(chargeType);
                            else priceVO.setChargeType(null);
                            
                            if(CduePrice!=null && CduePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(CduePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(CafterDuePrice!=null && CafterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(CafterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(CdepAmt!=null && CdepAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(CdepAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setChampionshipStatus(true);
                            boolean noChampResult=false;
                            boolean isexist=false;
                            isexist=membQualBean.isPriceMatrixExist(eventId,itemId,CeventType,CeventLevel);
                            if(isexist==true){
                               request.setAttribute("AlreadyExistChmp","chmpExist");
                                request.setAttribute("eventId",eventId);
                                request.setAttribute("itemId",itemId);
                                request.setAttribute("itemDetails",itemDetails);
                                return new ModelAndView("frmOEEPriceDetailsSuccess");
                            }else{
                                noChampResult=membQualBean.insertPriceMatrixDetails(priceVO);
                            }
                            if(noChampResult==true){
                                request.setAttribute("chmpInsertStatus","chmpsuccess");
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    if(flag==true){
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("eventId",eventId);
                        request.setAttribute("itemId",itemId);
                        //request.setAttribute("insertStatus","success");
                        return new ModelAndView("frmOEEPriceDetailsSuccess");
                    }else{
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("eventId",eventId);
                        request.setAttribute("itemId",itemId);
                        //request.setAttribute("insertStatus","failed");
                        return new ModelAndView("frmOEEPriceDetailsSuccess");
                    }
                    
                    
                    
                }
                if(cmd.equals("initViewPrice")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    ArrayList itemDetails = new ArrayList();
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventId",eventId);
                    return new ModelAndView("frmOEEViewPriceDetails");
                }
                if(cmd.equals("viewPrice")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("selItem");
                    
                    ArrayList itemDetails = new ArrayList();
                    ArrayList eventType = new ArrayList();
                    ArrayList eventTypeChamp = new ArrayList();
                    ArrayList eventDetails = new ArrayList();
                    ArrayList champDetails = new ArrayList();
                    
                    eventType = membQualBean.getEventTypeDetailsByItemId(eventId,itemId);
                    eventTypeChamp = membQualBean.getEventTypeDetByItemIdForChamp(eventId,itemId);
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    eventDetails = membQualBean.getPriceMatrixDetails(eventId,itemId);
                    champDetails=membQualBean.getPriceMatrixDetailsForChamp(eventId,itemId);
                    
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTypeChamp",eventTypeChamp);
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("champDetails",champDetails);
                    request.setAttribute("enableButton","enableButton");
                    
                    return new ModelAndView("frmOEEViewPriceDetails");
                }
                if(cmd.equals("initOrgView")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    ArrayList itemDetails = new ArrayList();
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventId",eventId);
                    
                    return new ModelAndView("frmOEEOrgViewPriceDetails");
                }
                if(cmd.equals("orgViewPrice")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("selItem");
                    
                    ArrayList itemDetails = new ArrayList();
                    ArrayList eventType = new ArrayList();
                    ArrayList eventTypeChamp = new ArrayList();
                    ArrayList eventDetails = new ArrayList();
                    ArrayList champDetails = new ArrayList();
                    
                    eventType = membQualBean.getEventTypeDetailsByItemId(eventId,itemId);
                    eventTypeChamp = membQualBean.getEventTypeDetByItemIdForChamp(eventId,itemId);
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    eventDetails = membQualBean.getPriceMatrixDetails(eventId,itemId);
                    champDetails=membQualBean.getPriceMatrixDetailsForChamp(eventId,itemId);
                    
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTypeChamp",eventTypeChamp);
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("champDetails",champDetails);
                    //request.setAttribute("enableButton","enableButton");
                    
                    return new ModelAndView("frmOEEOrgViewPriceDetails");
                }
                if(cmd.equals("initOrgEditPrice")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("itemId");
                    
                    ArrayList itemDetails = new ArrayList();
                    ArrayList eventType = new ArrayList();
                    ArrayList eventTypeChamp = new ArrayList();
                    ArrayList eventDetails = new ArrayList();
                    ArrayList champDetails = new ArrayList();
                    
                    eventType = membQualBean.getEventTypeDetailsByItemId(eventId,itemId);
                    eventTypeChamp = membQualBean.getEventTypeDetByItemIdForChamp(eventId,itemId);
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    eventDetails = membQualBean.getPriceMatrixDetails(eventId,itemId);
                    champDetails=membQualBean.getPriceMatrixDetailsForChamp(eventId,itemId);
                    
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTypeChamp",eventTypeChamp);
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("champDetails",champDetails);
                    
                    return new ModelAndView("frmOEEOrgEditPriceDetails");
                }
                if(cmd.equals("initEditPriceDetails")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("itemId");
                    
                    ArrayList itemDetails = new ArrayList();
                    ArrayList eventType = new ArrayList();
                    ArrayList eventTypeChamp = new ArrayList();
                    ArrayList eventDetails = new ArrayList();
                    ArrayList champDetails = new ArrayList();
                    
                    eventType = membQualBean.getEventTypeDetailsByItemId(eventId,itemId);
                    eventTypeChamp = membQualBean.getEventTypeDetByItemIdForChamp(eventId,itemId);
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    eventDetails = membQualBean.getPriceMatrixDetails(eventId,itemId);
                    champDetails=membQualBean.getPriceMatrixDetailsForChamp(eventId,itemId);
                    
                    request.setAttribute("eventId",eventId);
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("itemDetails",itemDetails);
                    request.setAttribute("eventType",eventType);
                    request.setAttribute("eventTypeChamp",eventTypeChamp);
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("champDetails",champDetails);
                    
                    return new ModelAndView("frmOEEEditPriceDetails");
                }
                if(cmd.equals("updatePriceByOrg")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    ArrayList itemDetails = new ArrayList();
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("itemId");
                    boolean flag = true;
                    Debug.print("eventId in  AddPriceAction: "+eventId);
                    Debug.print("itemName in AddPriceAction: "+itemId);
                    int noChampSize = 0;
                    String noChSize = request.getParameter("noChampSize");
                    Debug.print("noChSize in AddPriceAction: "+noChSize);
                    
                    if(noChSize!=null && noChSize.trim().length()!=0){
                        noChampSize = Integer.parseInt(noChSize);
                    }
                    for(int i=1; i<=noChampSize; i++){
                        Debug.print("inside loop: "+i);
                        String priceId=request.getParameter("priceId"+i);
                        Debug.print("priceId in for loop : "+priceId);
                        String duePrice=request.getParameter("txtDue"+i);
                        String afterDuePrice=request.getParameter("txtAfterDue"+i);
                        String depAmt=request.getParameter("txtDepAmt"+i);
                        Debug.print("duePricein AddPriceAction: "+duePrice);
                        Debug.print("afterDuePricein AddPriceAction: "+afterDuePrice);
                        Debug.print("depAmtin AddPriceAction: "+depAmt);
                       //if(duePrice!=null && duePrice.trim().length()!=0 && afterDuePrice!=null && afterDuePrice.trim().length()!=0
                               //){
                            
                            if(priceId!=null && priceId.trim().length()!=0) priceVO.setPriceId(priceId);
                            else priceVO.setPriceId(null);
                            
                            if(duePrice!=null && duePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(duePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(afterDuePrice!=null && afterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(afterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(depAmt!=null && depAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(depAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setApproveStatus("pending");
                            priceVO.setApprovedBY(null);
                            
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updatePriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    int champSize = 0;
                    String chSize = request.getParameter("champSize");
                    Debug.print("chSize in AddPriceAction: "+chSize);
                    
                    if(chSize!=null && chSize.trim().length()!=0){
                        champSize = Integer.parseInt(chSize);
                    }
                    Debug.print("champSize in AddPriceAction: "+champSize);
                    for(int i=1;i<=champSize; i++){
                        Debug.print("inside Champ loop: "+i);
                        String CpriceId=request.getParameter("CpriceId"+i);
                        Debug.print("CpriceId in for loop : "+CpriceId);
                        String CduePrice=request.getParameter("txtDueC"+i);
                        String CafterDuePrice=request.getParameter("txtAfterDueC"+i);
                        String CdepAmt=request.getParameter("txtDepAmtC"+i);
                        Debug.print("CduePricein AddPriceAction: "+CduePrice);
                        Debug.print("CafterDuePricein AddPriceAction: "+CafterDuePrice);
                        Debug.print("CdepAmtin AddPriceAction: "+CdepAmt);
                       //if(CduePrice!=null && CduePrice.trim().length()!=0 && CafterDuePrice!=null && CafterDuePrice.trim().length()!=0
                                //){
                            
                            if(CpriceId!=null && CpriceId.trim().length()!=0) priceVO.setPriceId(CpriceId);
                            else priceVO.setPriceId(null);
                            
                            
                            if(CduePrice!=null && CduePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(CduePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(CafterDuePrice!=null && CafterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(CafterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(CdepAmt!=null && CdepAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(CdepAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setApproveStatus("pending");
                            priceVO.setApprovedBY(null);
                            
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updatePriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    if(flag==true){
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("eventId",eventId);
                        request.setAttribute("updateStatus","success");
                        return new ModelAndView("frmOEEPriceEditSuccess");
                    }else{
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("eventId",eventId);
                        request.setAttribute("updateStatus","failed");
                        return new ModelAndView("frmOEEPriceEditSuccess");
                    }
                }
                if(cmd.equals("updatePriceDetails")){
                    Debug.print("cmd in AddPriceAction :"+cmd);
                    ArrayList itemDetails = new ArrayList();
                    itemDetails = membQualBean.getAllItemNamesForOrg();
                    String eventId=request.getParameter("eventId");
                    String itemId=request.getParameter("itemId");
                    String itemType="fixed";
                    String chargeType=null;
                    String activeStatus=request.getParameter("acStatus");
                    String areaChairId=(String)session.getAttribute("userId");
                    boolean flag = true;
                    Debug.print("eventId in  AddPriceAction: "+eventId);
                    Debug.print("itemName in AddPriceAction: "+itemId);
                    int noChampSize = 0;
                    String noChSize = request.getParameter("noChampSize");
                    Debug.print("noChSize in AddPriceAction: "+noChSize);
                    
                    if(noChSize!=null && noChSize.trim().length()!=0){
                        noChampSize = Integer.parseInt(noChSize);
                    }
                    for(int i=1; i<=noChampSize; i++){
                        Debug.print("inside loop: "+i);
                        String eventTyAndLevel=request.getParameter("eventcnt"+i);
                        String priceId=request.getParameter("priceId"+i);
                        Debug.print("eventTyAndLevel in for loop: "+eventTyAndLevel);
                        Debug.print("priceId in for loop : "+priceId);
                        Pattern pat=Pattern.compile("#");
                        String eventTypeId="";
                        String eventLevelId="";
                        if(eventTyAndLevel!=null && eventTyAndLevel.trim().length()!=0){
                            String str[]=pat.split(eventTyAndLevel);
                            eventTypeId=str[0];
                            eventLevelId=str[1];
                            Debug.print("eventTypein AddPriceAction: "+eventTypeId);
                            Debug.print("eventLevelin AddPriceAction: "+eventLevelId);
                        }
                        String duePrice=request.getParameter("txtDue"+i);
                        String afterDuePrice=request.getParameter("txtAfterDue"+i);
                        String depAmt=request.getParameter("txtDepAmt"+i);
                        Debug.print("duePricein AddPriceAction: "+duePrice);
                        Debug.print("afterDuePricein AddPriceAction: "+afterDuePrice);
                        Debug.print("depAmtin AddPriceAction: "+depAmt);
                        //if(duePrice!=null && duePrice.trim().length()!=0 && afterDuePrice!=null && afterDuePrice.trim().length()!=0
                                //&& depAmt!=null && depAmt.trim().length()!=0){
                            
                            if(priceId!=null && priceId.trim().length()!=0) priceVO.setPriceId(priceId);
                            else priceVO.setPriceId(null);
                            
                            if(duePrice!=null && duePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(duePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(afterDuePrice!=null && afterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(afterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(depAmt!=null && depAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(depAmt));
                            else priceVO.setDepositPrice(0);
                            
                            if(activeStatus!=null && activeStatus.trim().length()!=0) priceVO.setApproveStatus(activeStatus);
                            else priceVO.setApproveStatus(null);
                            
                            if(areaChairId!=null && areaChairId.trim().length()!=0) priceVO.setApprovedBY(areaChairId);
                            else priceVO.setApprovedBY(null);
                           
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updatePriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    int champSize = 0;
                    String chSize = request.getParameter("champSize");
                    Debug.print("chSize in AddPriceAction: "+chSize);
                    
                    if(chSize!=null && chSize.trim().length()!=0){
                        champSize = Integer.parseInt(chSize);
                    }
                    Debug.print("champSize in AddPriceAction: "+champSize);
                    for(int i=1;i<=champSize; i++){
                        Debug.print("inside Champ loop: "+i);
                        String CeventTyAndLevel=request.getParameter("champcnt"+i);
                        String CpriceId=request.getParameter("CpriceId"+i);
                        Debug.print("CeventTyAndLevel in for loop: "+CeventTyAndLevel);
                        Debug.print("CpriceId in for loop : "+CpriceId);
                        String CeventType="";
                        String CeventLevel="";
                        if(CeventTyAndLevel!=null && CeventTyAndLevel.trim().length()!=0){
                            Pattern pat=Pattern.compile("#");
                            String str[]=pat.split(CeventTyAndLevel);
                            CeventType=str[0];
                            CeventLevel=str[1];
                            Debug.print("CCeventTypein AddPriceAction: "+CeventType);
                            Debug.print("CeventLevelin AddPriceAction: "+CeventLevel);
                        }
                        String CduePrice=request.getParameter("txtDueC"+i);
                        String CafterDuePrice=request.getParameter("txtAfterDueC"+i);
                        String CdepAmt=request.getParameter("txtDepAmtC"+i);
                        Debug.print("CduePricein AddPriceAction: "+CduePrice);
                        Debug.print("CafterDuePricein AddPriceAction: "+CafterDuePrice);
                        Debug.print("CdepAmtin AddPriceAction: "+CdepAmt);
                        //if(CduePrice!=null && CduePrice.trim().length()!=0 && CafterDuePrice!=null && CafterDuePrice.trim().length()!=0
                               // && CdepAmt!=null && CdepAmt.trim().length()!=0){
                            
                            if(CpriceId!=null && CpriceId.trim().length()!=0) priceVO.setPriceId(CpriceId);
                            else priceVO.setPriceId(null);
                            
                                                  
                            if(CduePrice!=null && CduePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(CduePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(CafterDuePrice!=null && CafterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(CafterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(CdepAmt!=null && CdepAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(CdepAmt));
                            else priceVO.setDepositPrice(0);
                            
                            if(activeStatus!=null && activeStatus.trim().length()!=0) priceVO.setApproveStatus(activeStatus);
                            else priceVO.setApproveStatus(null);
                            
                            if(areaChairId!=null && areaChairId.trim().length()!=0) priceVO.setApprovedBY(areaChairId);
                            else priceVO.setApprovedBY(null);
                            
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updatePriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                       // }
                    }
                    if(flag==true){
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("updateStatus","success");
                        return new ModelAndView("frmOEEPriceACEditSuccess");
                    }else{
                        request.setAttribute("itemDetails",itemDetails);
                        request.setAttribute("updateStatus","failed");
                        return new ModelAndView("frmOEEPriceACEditSuccess");
                    }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
}

/*
 * AddFixedPriceAction.java
 *
 * Created on November 26, 2007, 12:48 PM
 */

package com.oee.action;

import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlcutil.HLCPriceMatrixVO;

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
import java.io.IOException;
import java.net.ProtocolException;
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

	public class AddFixedPriceAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        try{
        	GeneralDBAction db=new GeneralDBAction();
			HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
	    	
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            
            HLCPriceMatrixVO priceVO= new HLCPriceMatrixVO();
            
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            if(cmd!=null){
                 if(cmd.equals("initViewPrice")){
                    Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    ArrayList allItem=new ArrayList();
                    Vector allEventType=new Vector();
                    ArrayList allArea=new ArrayList();
                    
                    allItem=membQualBean.getAllItemNamesForStaff();
                    allEventType=krishnaBean.getAllEventTypes();
                    allArea=krishnaBean.getAllAreaMasters();
                    
                    request.setAttribute("allItem",allItem);
                    request.setAttribute("allEventType",allEventType);
                    request.setAttribute("allArea",allArea);
                    
                    return new ModelAndView("frmOEEStaffViewPrice");
                }
                if(cmd.equals("staffViewPrice")){
                     Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    String itemId=request.getParameter("selItem");
                    String eventTypeId=request.getParameter("selType");
                    String areaId=request.getParameter("selArea");

                    ArrayList allItem=new ArrayList();
                    Vector allEventType=new Vector();
                    ArrayList allArea=new ArrayList();
                    ArrayList eventDetails=new ArrayList();
                    ArrayList eventDetailsChamp=new ArrayList();
                    
                    allItem=membQualBean.getAllItemNamesForStaff();
                    allEventType=krishnaBean.getAllEventTypes();
                    allArea=krishnaBean.getAllAreaMasters();
                    eventDetails=membQualBean.getFixedPriceMatrixDetails(itemId,eventTypeId);
                    eventDetailsChamp=membQualBean.getFixedPriceMatrixForChamp(areaId);
                    
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("eventTypeId",eventTypeId);
                    request.setAttribute("areaId",areaId);

                    request.setAttribute("allItem",allItem);
                    request.setAttribute("allEventType",allEventType);
                    request.setAttribute("allArea",allArea);
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("eventDetailsChamp",eventDetailsChamp);
                    request.setAttribute("enableButton","enableButton");
                    return new ModelAndView("frmOEEStaffViewPrice"); 
                } 
                 
                
                 if(cmd.equals("initEditPrice")){
                 Debug.print("cmd in AddFixedPriceAction :"+cmd);  
                    String itemId=request.getParameter("itemID");
                    String eventTypeId=request.getParameter("eventTypeId");
                    String areaId=request.getParameter("areaID");

                    ArrayList allItem=new ArrayList();
                    Vector allEventType=new Vector();
                    ArrayList allArea=new ArrayList();
                    ArrayList eventDetails=new ArrayList();
                    ArrayList eventDetailsChamp=new ArrayList();
                            
                    allItem=membQualBean.getAllItemNamesForStaff();
                    allEventType=krishnaBean.getAllEventTypes();
                    allArea=krishnaBean.getAllAreaMasters();
                    eventDetails=membQualBean.getFixedPriceMatrixDetails(itemId,eventTypeId);
                    eventDetailsChamp=membQualBean.getFixedPriceMatrixForChamp(areaId);
                    
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("eventTypeId",eventTypeId);
                    request.setAttribute("areaId",areaId);

                    request.setAttribute("allItem",allItem);
                    request.setAttribute("allEventType",allEventType);
                    request.setAttribute("allArea",allArea);
                    
                    request.setAttribute("eventDetails",eventDetails);
                    request.setAttribute("eventDetailsChamp",eventDetailsChamp);
                    
                    return new ModelAndView("frmOEEStaffEditPrice");   
                 } 
                   if(cmd.equals("updatePriceDetails")){
                    Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    String itemId=request.getParameter("itemID");
                    String eventTypeId=request.getParameter("eventTypeId");
                    String areaId=request.getParameter("areaID");
                    Debug.print("itemId in insertPriceDetails"+itemId);
                    Debug.print("eventTypeId in insertPriceDetails"+eventTypeId);
                    Debug.print("areaId in insertPriceDetails"+areaId);
                    boolean flag = true;
                    
                    int noChampSize = 0;
                    String noChSize = request.getParameter("noChampSize");
                    Debug.print("noChSize in AddFixedPriceAction: "+noChSize);
                    
                    if(noChSize!=null && noChSize.trim().length()!=0){
                        noChampSize = Integer.parseInt(noChSize);
                    }
                    for(int i=1; i<=noChampSize; i++){
                        Debug.print("inside loop: "+i);
                        String priceId=request.getParameter("priceId"+i);
                        String eventLevelId=request.getParameter("eventLevelId"+i);
                        String duePrice=request.getParameter("txtDue"+i);
                        String afterDuePrice=request.getParameter("txtAfterDue"+i);
                        String depAmt=request.getParameter("txtDepAmt"+i);
                        Debug.print("priceIdin AddFixedPriceAction: "+priceId);
                        Debug.print("eventLevelIdin AddFixedPriceAction: "+eventLevelId);
                        Debug.print("duePricein AddFixedPriceAction: "+duePrice);
                        Debug.print("afterDuePricein AddFixedPriceAction: "+afterDuePrice);
                        Debug.print("depAmtin AddFixedPriceAction: "+depAmt);
                        
                        //if(duePrice!=null && duePrice.trim().length()!=0 && afterDuePrice!=null && afterDuePrice.trim().length()!=0
                               // && depAmt!=null && depAmt.trim().length()!=0){
                            
                            if(priceId!=null && priceId.trim().length()!=0) priceVO.setPriceId(priceId);
                            else priceVO.setPriceId(null);
                                                       
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            if(eventTypeId!=null && eventTypeId.trim().length()!=0) priceVO.setEventTypeId(eventTypeId);
                            else priceVO.setEventTypeId(null);
                            
                            if(eventLevelId!=null && eventLevelId.trim().length()!=0) priceVO.setEventLevelId(eventLevelId);
                            else priceVO.setEventLevelId(null);
                            
                           
                            if(duePrice!=null && duePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(duePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(afterDuePrice!=null && afterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(afterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(depAmt!=null && depAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(depAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setChampionshipStatus(false);
                            priceVO.setAreaId(null);
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updateFixedPriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    int champSize = 0;
                    String chSize = request.getParameter("champSize");
                    Debug.print("chSize in AddFixedPriceAction: "+chSize);
                    
                    if(chSize!=null && chSize.trim().length()!=0){
                        champSize = Integer.parseInt(chSize);
                    }
                    Debug.print("champSize in AddFixedPriceAction: "+champSize);
                    for(int i=1;i<=champSize; i++){
                        Debug.print("inside Champ loop: "+i);
                        String CpriceId=request.getParameter("CpriceId"+i);
                        String CeventLevelId=request.getParameter("CeventLevelId"+i);
                        String CduePrice=request.getParameter("txtDueC"+i);
                        String CafterDuePrice=request.getParameter("txtAfterDueC"+i);
                        String CdepAmt=request.getParameter("txtDepAmtC"+i);
                        Debug.print("CpriceIdin AddFixedPriceAction: "+CpriceId);
                        Debug.print("CeventLevelIdin AddFixedPriceAction: "+CeventLevelId);
                        Debug.print("CduePricein AddFixedPriceAction: "+CduePrice);
                        Debug.print("CafterDuePricein AddFixedPriceAction: "+CafterDuePrice);
                        Debug.print("CdepAmtin AddFixedPriceAction: "+CdepAmt);
                       // if(CduePrice!=null && CduePrice.trim().length()!=0 && CafterDuePrice!=null && CafterDuePrice.trim().length()!=0
                                //&& CdepAmt!=null && CdepAmt.trim().length()!=0){
                            
                             if(CpriceId!=null && CpriceId.trim().length()!=0) priceVO.setPriceId(CpriceId);
                            else priceVO.setPriceId(null);
                            
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            priceVO.setEventTypeId(null);
                            
                            if(CeventLevelId!=null && CeventLevelId.trim().length()!=0) priceVO.setEventLevelId(CeventLevelId);
                            else priceVO.setEventLevelId(null);
                            
                            if(CduePrice!=null && CduePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(CduePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(CafterDuePrice!=null && CafterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(CafterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(CdepAmt!=null && CdepAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(CdepAmt));
                            else priceVO.setDepositPrice(0);
                            
                            if(areaId!=null && areaId.trim().length()!=0) priceVO.setAreaId(areaId);
                            else priceVO.setAreaId(null);
                            
                            priceVO.setChampionshipStatus(true);
                            
                            boolean noChampResult=false;
                            noChampResult=membQualBean.updateFixedPriceMatrixDetails(priceVO);
                            if(noChampResult==true){
                                flag=true;
                            }else{
                                flag=false;
                            }
                        //}
                    }
                    if(flag==true){
                        request.setAttribute("updateStatus","success");
                        return new ModelAndView("frmOEEStaffEditSuccess");
                    }else{
                        request.setAttribute("updateStatus","failed");
                        return new ModelAndView("frmOEEStaffEditSuccess");
                    }
         
                }
                 
                if(cmd.equals("initPrice")){
                    Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    String itemId=request.getParameter("itemID");
                    String eventTypeId=request.getParameter("eventTypeId");
                    String areaId=request.getParameter("areaID");

                    ArrayList allItem=new ArrayList();
                    Vector allEventType=new Vector();
                    ArrayList allArea=new ArrayList();
                    ArrayList eventLevelByType=new ArrayList();
                    ArrayList eventLevelByArea=new ArrayList();

                    allItem=membQualBean.getAllItemNamesForStaff();
                    allEventType=krishnaBean.getAllEventTypes();
                    allArea=krishnaBean.getAllAreaMasters();
                    eventLevelByType=krishnaBean.getEventLevelsBasedOnEventId(eventTypeId);
                    eventLevelByArea=krishnaBean.getEventLevelsForArea(areaId);

                    request.setAttribute("itemId",itemId);
                    request.setAttribute("eventTypeId",eventTypeId);
                    request.setAttribute("areaId",areaId);

                    request.setAttribute("allItem",allItem);
                    request.setAttribute("allEventType",allEventType);
                    request.setAttribute("allArea",allArea);
                    request.setAttribute("eventLevelByType",eventLevelByType);
                    request.setAttribute("eventLevelByArea",eventLevelByArea);
                    
                    return new ModelAndView("frmOEEStaffInsertPrice");
                } 
                if(cmd.equals("initPriceDetails")){
                    Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    String itemId=request.getParameter("selItem");
                    String eventTypeId=request.getParameter("selType");
                    String areaId=request.getParameter("selArea");
                    
                    ArrayList allItem=new ArrayList();
                    Vector allEventType=new Vector();
                    ArrayList allArea=new ArrayList();
                    ArrayList eventLevelByType=new ArrayList();
                    ArrayList eventLevelByArea=new ArrayList();
                    
                    allItem=membQualBean.getAllItemNamesForStaff();
                    allEventType=krishnaBean.getAllEventTypes();
                    allArea=krishnaBean.getAllAreaMasters();
                    eventLevelByType=krishnaBean.getEventLevelsBasedOnEventId(eventTypeId);
                    eventLevelByArea=krishnaBean.getEventLevelsForArea(areaId);
                    
                    request.setAttribute("itemId",itemId);
                    request.setAttribute("eventTypeId",eventTypeId);
                    request.setAttribute("areaId",areaId);
                    
                    request.setAttribute("allItem",allItem);
                    request.setAttribute("allEventType",allEventType);
                    request.setAttribute("allArea",allArea);
                    request.setAttribute("eventLevelByType",eventLevelByType);
                    request.setAttribute("eventLevelByArea",eventLevelByArea);
                    request.setAttribute("enableButton","enableButton");
                    return new ModelAndView("frmOEEStaffInsertPrice");
                }
                
                if(cmd.equals("insertPriceDetails")){
                    Debug.print("cmd in AddFixedPriceAction :"+cmd);
                    String itemId=request.getParameter("itemID");
                    String eventTypeId=request.getParameter("eventTypeId");
                    String areaId=request.getParameter("areaID");
                    Debug.print("itemId in insertPriceDetails"+itemId);
                    Debug.print("eventTypeId in insertPriceDetails"+eventTypeId);
                    Debug.print("areaId in insertPriceDetails"+areaId);
                    boolean flag = true;
                     boolean flag1 = true;
                    
                    int noChampSize = 0;
                    String noChSize = request.getParameter("noChampSize");
                    Debug.print("noChSize in AddFixedPriceAction: "+noChSize);
                    
                    if(noChSize!=null && noChSize.trim().length()!=0){
                        noChampSize = Integer.parseInt(noChSize);
                    }
                    for(int i=1; i<=noChampSize; i++){
                        Debug.print("inside loop: "+i);
                        String eventLevelId=request.getParameter("eventLevelId"+i);
                        String duePrice=request.getParameter("txtDue"+i);
                        String afterDuePrice=request.getParameter("txtAfterDue"+i);
                        String depAmt=request.getParameter("txtDepAmt"+i);
                        Debug.print("duePricein AddFixedPriceAction: "+duePrice);
                        Debug.print("afterDuePricein AddFixedPriceAction: "+afterDuePrice);
                        Debug.print("depAmtin AddFixedPriceAction: "+depAmt);
                                                                               
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            if(eventTypeId!=null && eventTypeId.trim().length()!=0) priceVO.setEventTypeId(eventTypeId);
                            else priceVO.setEventTypeId(null);
                            
                            if(eventLevelId!=null && eventLevelId.trim().length()!=0) priceVO.setEventLevelId(eventLevelId);
                            else priceVO.setEventLevelId(null);
                            
                           
                            if(duePrice!=null && duePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(duePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(afterDuePrice!=null && afterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(afterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(depAmt!=null && depAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(depAmt));
                            else priceVO.setDepositPrice(0);
                            
                            priceVO.setChampionshipStatus(false);
                            priceVO.setAreaId(null);
                            boolean noChampResult=false;
                            boolean isExist=false;
                            isExist=membQualBean.isFixedPriceMatrixExist(itemId,eventTypeId,eventLevelId,null);  
                            if(isExist==true){                          
                            request.setAttribute("AlreadyExist","exist");
                           // return new ModelAndView("frmOEEStaffPriceSuccess");
                            }else{
                            noChampResult=membQualBean.insertFixedPriceMatrix(priceVO);    
                            }
                            if(noChampResult==true){
                                request.setAttribute("insertStatus","success");
                                flag=true;
                            }else{
                                //request.setAttribute("insertStatus","failed");
                                flag=false;
                            }
                        
                    }
                    int champSize = 0;
                    String chSize = request.getParameter("champSize");
                    Debug.print("chSize in AddFixedPriceAction: "+chSize);
                    
                    if(chSize!=null && chSize.trim().length()!=0){
                        champSize = Integer.parseInt(chSize);
                    }
                    Debug.print("champSize in AddFixedPriceAction: "+champSize);
                    for(int i=1;i<=champSize; i++){
                        Debug.print("inside Champ loop: "+i);
                        String CeventLevelId=request.getParameter("CeventLevelId"+i);
                        String CduePrice=request.getParameter("txtDueC"+i);
                        String CafterDuePrice=request.getParameter("txtAfterDueC"+i);
                        String CdepAmt=request.getParameter("txtDepAmtC"+i);
                        Debug.print("CeventLevelIdin AddFixedPriceAction: "+CeventLevelId);
                        Debug.print("CduePricein AddFixedPriceAction: "+CduePrice);
                        Debug.print("CafterDuePricein AddFixedPriceAction: "+CafterDuePrice);
                        Debug.print("CdepAmtin AddFixedPriceAction: "+CdepAmt);
                        
                            
                            if(itemId!=null && itemId.trim().length()!=0) priceVO.setEntryItemId(itemId);
                            else priceVO.setEntryItemId(null);
                            
                            priceVO.setEventTypeId(null);
                            
                            if(CeventLevelId!=null && CeventLevelId.trim().length()!=0) priceVO.setEventLevelId(CeventLevelId);
                            else priceVO.setEventLevelId(null);
                            
                            if(CduePrice!=null && CduePrice.trim().length()!=0) priceVO.setDueDatePrice(Float.parseFloat(CduePrice));
                            else priceVO.setDueDatePrice(0);
                            
                            if(CafterDuePrice!=null && CafterDuePrice.trim().length()!=0) priceVO.setAfterDueDatePrice(Float.parseFloat(CafterDuePrice));
                            else priceVO.setAfterDueDatePrice(0);
                            
                            if(CdepAmt!=null && CdepAmt.trim().length()!=0) priceVO.setDepositPrice(Float.parseFloat(CdepAmt));
                            else priceVO.setDepositPrice(0);
                            
                            if(areaId!=null && areaId.trim().length()!=0) priceVO.setAreaId(areaId);
                            else priceVO.setAreaId(null);
                            
                            priceVO.setChampionshipStatus(true);
                            
                            boolean ChampResult=false;
                            boolean isExist=false;
                            isExist=membQualBean.isFixedPriceMatrixExist(itemId,null,CeventLevelId,areaId);  
                            if(isExist==true){
                            request.setAttribute("AlreadyExistChmp","chmpExist");
                            //return new ModelAndView("frmOEEStaffPriceSuccess");
                            }else{
                            ChampResult=membQualBean.insertFixedPriceMatrix(priceVO);    
                            }
                            if(ChampResult==true){
                                request.setAttribute("chmpInsertStatus","chmpsuccess");
                                flag=true;
                            }else{
                                //request.setAttribute("chmpInsertStatus","chmpfailed");
                                flag=false;
                            }
                        
                    }                    
                    if(flag==true){
                       
                        return new ModelAndView("frmOEEStaffPriceSuccess");
                    }else if(flag==false){
                        
                        return new ModelAndView("frmOEEStaffPriceSuccess");
                    }                   
                   
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
}

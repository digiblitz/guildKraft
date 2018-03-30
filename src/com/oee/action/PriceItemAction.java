/*
 * PriceItemAction.java
 *
 * Created on November 16, 2007, 1:47 PM
 */

/*
 * AddPriceAction.java
 *
 * Created on November 15, 2007, 1:08 PM
 */

package com.oee.action;

import com.hlcutil.Debug;
import java.util.ArrayList;
import java.util.Vector;

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
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
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

/**
 *
 * @author Vidhya
 * @version
 */

	public class PriceItemAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
        try{
            HttpSession session=request.getSession();
            HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();         
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            if(cmd!=null){
                if(cmd.equals("initCreateItem")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    return new ModelAndView("frmOEEPriceItemCreate");
                }
                if(cmd.equals("insertItem")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String itemName=request.getParameter("txtItemName");
                    String orgStatus=request.getParameter("orgStatus");
                    boolean createResult=false;
                    boolean isExist=membQualBean.isItemNameExist(itemName);  
                    if(isExist==true){
                        request.setAttribute("err","st");
                    return new ModelAndView("frmOEEPriceItemCreate");
                    }
                    else{
                    createResult=membQualBean.insertPriceItem(itemName,orgStatus);      
                    }
                    if(createResult==true){
                        return new ModelAndView("frmOEECreateConf");
                    }else{
                        return new ModelAndView("frmOEEPriceItemCreate");
                    }
                }
                if(cmd.equals("initListItem")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    //String status=request.getParameter("acStatus");
                    //request.setAttribute("status",status);                    
                    return new ModelAndView("frmOEEPriceItemList");
                }
                if(cmd.equals("listDetails")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String status=request.getParameter("acStatus");
                    Debug.print("status in servlet: "+status);
                    String result="";
                    if(status!=null && status.equalsIgnoreCase("Activate")){
                    result ="true";  
                    }else{
                    result ="false";   
                    }
                    ArrayList itemList=new ArrayList();
                    itemList=membQualBean.getAllPriceItems(result);
                    request.setAttribute("itemList",itemList);
                    request.setAttribute("status",status);
                    return new ModelAndView("frmOEEPriceItemList");
                }
                if(cmd.equals("activate")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String itemId=request.getParameter("itemId");
                    String status="true";
                    boolean statusResult=membQualBean.updatePriceItemstatus(itemId,status);
                    return new ModelAndView("frmOEEPriceItemList");
                }
                if(cmd.equals("deActivate")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String itemId=request.getParameter("itemId");
                    String status="false";
                    boolean statusResult=membQualBean.updatePriceItemstatus(itemId,status);
                    return new ModelAndView("frmOEEPriceItemList");
                }
                if(cmd.equals("initUpdateItem")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String itemId=request.getParameter("itemId");
                    ArrayList singleDet=new ArrayList();
                    singleDet=membQualBean.getSingleItemDetails(itemId);
                    request.setAttribute("singleDet",singleDet);
                    return new ModelAndView("frmOEEPriceItemEdit");
                }
                if(cmd.equals("updateItem")){
                    Debug.print("cmd in PriceItemAction :"+cmd);
                    String itemId=request.getParameter("itemId");
                    String itemName=request.getParameter("txtItemName");
                    String orgStatus=request.getParameter("orgStatus");
                    boolean updateResult=false;
                    boolean isExist =membQualBean.isEditItemNameExist(itemId,itemName);
                    if(isExist==true){
                    ArrayList singleDet=new ArrayList();
                    singleDet=membQualBean.getSingleItemDetails(itemId);
                    request.setAttribute("singleDet",singleDet);
                    request.setAttribute("err","st");
                    return new ModelAndView("frmOEEPriceItemEdit");
                    }
                    else{
                    updateResult=membQualBean.updatePriceItem(itemId,itemName,orgStatus);     
                    }
                   
                    if(updateResult==true){
                        return new ModelAndView("frmOEEPriceItemList");
                    }else{
                        return new ModelAndView("frmOEEPriceItemEdit");
                    }
                    
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
}

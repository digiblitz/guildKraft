/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.acc.action.itemMaster;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.xml.sax.SAXException;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.HLCItemMaster;


public class ItemMasterAction implements org.springframework.web.servlet.mvc.Controller {
	
	 private String encoding = "UTF-8";
	 
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		
		String process = request.getParameter("process");
		ArrayList serviceMaster = null;
		HttpSession session = request.getSession();
		
		HLCMahanadhiSessionBean mahaRemote = new HLCMahanadhiSessionBean();
		ArrayList accMaster = null;
		
		try{
		
		if(process != null && process.trim().equalsIgnoreCase("listAllMaster")){
            
			serviceMaster = mahaRemote.getServiceTypeMaster();
            request.setAttribute("serviceMaster",serviceMaster);
            request.setAttribute("subitemType",null);
            session.setAttribute("serviceType",null);
            
            return new ModelAndView("itemMasterAccounts/frmItemMasterList");
        }
		else if(process != null && process.trim().equalsIgnoreCase("listSubitems")){
            String servType = request.getParameter("servType");
                        
            ArrayList subservType = null;
            if(servType!=null && servType.trim().length()!=0){
                 subservType = mahaRemote.getSubItemName(servType);
                 //session.setAttribute("serviceType",servType);
            }
            serviceMaster = mahaRemote.getServiceTypeMaster();
            request.setAttribute("serviceMaster",serviceMaster);                      
            request.setAttribute("subitemType",subservType);
            session.setAttribute("serviceType",servType);
            
            return new ModelAndView("itemMasterAccounts/frmItemMasterList");
         }
		else if(process != null && process.trim().equalsIgnoreCase("editListMaster")){
            String itemId = request.getParameter("itemId");
            serviceMaster = mahaRemote.getServiceTypeMaster();
            accMaster = mahaRemote.selectAccountMaster();
            HLCItemMaster itemVO = mahaRemote.getItemDetails(itemId);
                                    
            request.setAttribute("HLCItemMaster",itemVO);    
            request.setAttribute("serviceMaster",serviceMaster);
            request.setAttribute("accMaster",accMaster);
             
            return new ModelAndView("itemMasterAccounts/frmEditItem");
            //("editItemMaster");
        }
		else if(process != null && process.trim().equalsIgnoreCase("addListMaster")){
			
            serviceMaster = mahaRemote.getServiceTypeMaster();
            accMaster = mahaRemote.selectAccountMaster();
            
            request.setAttribute("serviceMaster",serviceMaster);
            //request.setAttribute("HLCItemMaster",HLCItemMaster);
            request.setAttribute("accMaster",accMaster);
            
            return new ModelAndView("itemMasterAccounts/frmCreateItem");
		}
		 /*
         * Save to an Existing Item Master
         */
        else if(process != null && process.trim().equalsIgnoreCase("saveListMaster")){
            String servMasterName = request.getParameter("servMasterNo");
            String itemNameNumber = request.getParameter("itemNameNumber");
            String subItemNo = request.getParameter("subItemNo");
            String itemDescrption = request.getParameter("itemDescrption");
            String itemRate = request.getParameter("itemRate");
            String AccountNo = request.getParameter("AccountNo");
            String subItem = request.getParameter("subItem");
            System.out.println("Master Name "+servMasterName);
            System.out.println("Item Number"+itemNameNumber);
            System.out.println("Sub Item Number"+subItemNo);
            System.out.println("Item Description"+itemDescrption);
            System.out.println("Item Name"+itemRate);
            System.out.println("Account No "+AccountNo);
            
            if(servMasterName!=null && itemNameNumber!=null && itemDescrption!=null && AccountNo!=null ){
                HLCItemMaster itemVO = new HLCItemMaster();
                itemVO.setAccountNo(AccountNo);
                itemVO.setItemDesc(itemDescrption);
                itemVO.setItemNo(itemNameNumber);
                
                if(itemRate!=null && itemRate.trim().length()!=0){
                    itemVO.setRate(Float.parseFloat(itemRate));
                }
                
                itemVO.setServiceTypeName(servMasterName);
                
                if(subItem!=null){
                    if(subItemNo!=null && subItemNo.trim().length()!=0){
                        itemVO.setParentItemNo(subItemNo);
                    }
                }
                System.out.println("itemVO is \n"+itemVO);
                boolean createItem = mahaRemote.createAccItemDetails(itemVO);
                System.out.println("create Result is "+createItem);
                if(createItem==true){
                    return new ModelAndView("itemMasterAccounts/frmItemMasterConf");
                    //("itemMasterConf");                    
                }
            }
            else{
                serviceMaster = mahaRemote.getServiceTypeMaster();
                accMaster = mahaRemote.selectAccountMaster();
                
                request.setAttribute("serviceMaster",serviceMaster);
                request.setAttribute("accMaster",accMaster);                            
                
                return new ModelAndView("itemMasterAccounts/frmCreateItem");
                //("addItemMaster");
            }
        }
        else if(process != null && process.equalsIgnoreCase("subItemdisp")){
            String serviceTypeName = request.getParameter("serviceName");
            ArrayList subItems = mahaRemote.getSubItemName(serviceTypeName);
            System.out.println("subItems"+ subItems.size());

            String finalXML = null;
            StringBuffer xml = new StringBuffer();
            
                xml.append("<?xml version=\"1.0\"");
                if (encoding != null) {
                    xml.append(" encoding=\"");
                    xml.append(encoding);
                    xml.append("\"");
                }
                xml.append(" ?>\n");
                xml.append("<SubItem>\n");
                xml.append(subItemArray(subItems));
                xml.append("</SubItem>");
                
                response.setContentType("text/xml; charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                
                finalXML = xml.toString();
                //Debug.print("Final XML is "+finalXML);
                
                PrintWriter pw = response.getWriter();
                pw.write(finalXML);
                pw.close();                    
            }
        else if(process != null && process.trim().equalsIgnoreCase("addListMaster")){
            serviceMaster = mahaRemote.getServiceTypeMaster();
            accMaster = mahaRemote.selectAccountMaster();
            
            request.setAttribute("serviceMaster",serviceMaster);
            //request.setAttribute("HLCItemMaster",HLCItemMaster);
            request.setAttribute("accMaster",accMaster);
            
            return new ModelAndView("itemMasterAccounts/frmCreateItem");
            //("addItemMaster");
    }
        else if(process != null && process.trim().equalsIgnoreCase("listAllMaster")){
            serviceMaster = mahaRemote.getServiceTypeMaster();
            request.setAttribute("serviceMaster",serviceMaster);
            request.setAttribute("subitemType",null);
            session.setAttribute("serviceType",null);
            return new ModelAndView("itemMasterAccounts/frmItemMasterList");
            //("listItemMaster");
        }
		 /*
         * Update an existing Item Master
         */                    
        else if(process != null && process.trim().equalsIgnoreCase("updateListMaster")){
            String itemID =  request.getParameter("itemID");
            String serviceName = request.getParameter("servMasterNo");
            String itemNo =  request.getParameter("itemNameNumber");
            String parentItemNo = request.getParameter("subItemNo");     
            String itemDesc = request.getParameter("itemDescrption");
            String rate =  request.getParameter("itemRate");
            String accountNo = request.getParameter("AccountNo"); 
            float float_rate  = 0.0f;
            
            if(rate!=null && rate.trim().length()>0){
                float_rate = Float.parseFloat(rate);
            }
                        
            boolean udpate_Result = mahaRemote.updateAccItemDetails(itemID,serviceName,itemNo,parentItemNo, itemDesc, float_rate, accountNo);
            System.out.println("Update Result is "+udpate_Result);
            if(udpate_Result==true){
            	System.out.println("inside udpate_Result ");
                serviceMaster = mahaRemote.getServiceTypeMaster();
                request.setAttribute("serviceMaster",serviceMaster);
                request.setAttribute("subitemType",null);
                session.setAttribute("serviceType",null);
                //session.removeAttribute("serviceType");
                return new ModelAndView("itemMasterAccounts/frmItemMasterList");
                //("listItemMaster");
            }
            else{
            	
            	System.out.println("outside udpate_Result ");
                serviceMaster = mahaRemote.getServiceTypeMaster();
                accMaster = mahaRemote.selectAccountMaster();
                HLCItemMaster itemVO = mahaRemote.getItemDetails(itemID);
                
                request.setAttribute("HLCItemMaster",itemVO);    
                request.setAttribute("serviceMaster",serviceMaster);
                request.setAttribute("accMaster",accMaster);

                return new ModelAndView("itemMasterAccounts/frmEditItem");
                //("editItemMaster");                            
            }
        }
    
		
		
		
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	private String subItemArray(ArrayList arrList){
        StringBuffer xml = new StringBuffer();
        String itemId = null;
        String serviceTypeName = null;
        String itemNo = null;
        String parentItemNo = null;
        String itemDesc = null;
        float rate = 0.0f;
        String accountNo = null;   
        Iterator itr = arrList.iterator();
        
        while(itr.hasNext()){
            String subItemArray [] = (String[]) itr.next();
            itemId = subItemArray[0];
            serviceTypeName = subItemArray[1];
            itemNo = subItemArray[2];
            parentItemNo = subItemArray[3];
            itemDesc = subItemArray[4];
            accountNo = subItemArray[5];
            
            xml.append(" <subList> \n");
            xml.append("	<itemId>"+itemId+ "</itemId>\n");
            xml.append("	<serviceTypeName>"+serviceTypeName+"</serviceTypeName>\n");
            xml.append("	<itemNo>"+itemNo+"</itemNo>\n");
            xml.append("	<parentItemNo>"+parentItemNo+"</parentItemNo>\n");
            xml.append("	<itemDesc>"+itemDesc+"</itemDesc>\n");
            xml.append("	<accountNo>"+accountNo+"</accountNo>\n");
            xml.append(" </subList>\n");
        }
        return xml.toString();
    }
	

}

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
import java.net.ProtocolException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;

public class TransactProcess implements Controller{
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {

		String process = request.getParameter("process");
		System.out.println("process --> "+process);		
		
		HttpSession session=request.getSession();
		HLCMahanadhiSessionBean mahanadhiRemote = new HLCMahanadhiSessionBean();
		HLCAccTxnTypeDetailVO accTxnTypVO = new HLCAccTxnTypeDetailVO();
		
		try{
			
			if(process != null && process.trim().equalsIgnoreCase("listAllTransac")){
                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                request.setAttribute("classMaster",classMaster);
                request.setAttribute("listTransacItem",null);
                session.setAttribute("className",null);
                return new ModelAndView("itemMasterAccounts/frmLstTransacEntry");
                //("listtransac");
            }
			else if(process != null && process.trim().equalsIgnoreCase("edittransac")){
                String transId = request.getParameter("transId");
                
                
                ArrayList listTransacItem = null;

                if(transId!=null && transId.trim().length()!=0){
                    accTxnTypVO = mahanadhiRemote.selectAccTransactionTypeDetail(transId);    
                }
                
                ArrayList itemMaster = (ArrayList) mahanadhiRemote.getItemMaster();
                request.setAttribute("itemMaster",itemMaster);
                
                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                request.setAttribute("classMaster",classMaster);
                request.setAttribute("TransactionDet",accTxnTypVO);
                request.setAttribute("existStat","none");
                return new ModelAndView("itemMasterAccounts/frmEditTransacEntry");
                //("edittransac");                
            }
			else if(process != null && process.trim().equalsIgnoreCase("listtransac")){
                String className = request.getParameter("className");
                ArrayList listTransacItem = null;
                
                if(className!=null && className.trim().length()!=0){
                       listTransacItem = (ArrayList) mahanadhiRemote.listAccTxnTypeDetailsOnClass(className);
                       session.setAttribute("className",className);
                }
                
                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                request.setAttribute("classMaster",classMaster);                    
                request.setAttribute("listTransacItem",listTransacItem);
                
                return new ModelAndView("itemMasterAccounts/frmLstTransacEntry");
                //("listtransac");
            }
			else if(process != null && process.equalsIgnoreCase("mapTransac")){

                /*ArrayList accMaster = (ArrayList) mahanadhiRemote.selectAccountMaster();
                request.setAttribute("accMaster",accMaster);*/

                ArrayList itemMaster = (ArrayList) mahanadhiRemote.getItemMaster();
                request.setAttribute("itemMaster",itemMaster);

                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                request.setAttribute("classMaster",classMaster);
                return new ModelAndView("itemMasterAccounts/frmTransactionEntry");
                //("transacMap");
            }
			else if(process != null && process.equalsIgnoreCase("updateMap")){
                String fwd = "";
               
                String usrId=(String) session.getAttribute("userId");                        
                String transacName = request.getParameter("transacName");
                String transacType = request.getParameter("transacType");
                String transacAccNo = request.getParameter("transacAccNo");
                //String transacSubAccNo = request.getParameter("transacSubAccNo");
               // String transacItemNo = request.getParameter("transacItemNo");
                String transacClass = request.getParameter("transacClass");

                // Account Separation
                String parent_Sub_AcNo[] = transacAccNo.split("#");
                    String transacItemNo = parent_Sub_AcNo[0];                
                    String AccNo = parent_Sub_AcNo[1];
                    System.out.println("AccNo        "+AccNo);
                accTxnTypVO.setAccount_no(AccNo);

                /* Debug.print("parentAccNo  "+parentAccNo);
                if(parentAccNo==null || parentAccNo.equalsIgnoreCase("null")){
                    Debug.print("Inside parentAccNo == null");
                    accTxnTypVO.setAccount_no(AccNo);
                    accTxnTypVO.setSub_account_no(null);
                }
                else{
                    Debug.print("Inside parentAccNo != null");
                    accTxnTypVO.setAccount_no(parentAccNo);
                    accTxnTypVO.setSub_account_no(AccNo);  
                }*/

                String generatedItemNo = mahanadhiRemote.createItemNoFromAccMaster(transacItemNo);
                System.out.println("generatedItemNo :"+generatedItemNo);

                accTxnTypVO.setItem_no(generatedItemNo);
                accTxnTypVO.setClass_name(transacClass);
                //accTxnTypVO.setItem_no(transacItemNo);
                accTxnTypVO.setTransaction_name(transacName);
                accTxnTypVO.setTransaction_type(transacType);

                boolean stat = mahanadhiRemote.isTransactionExists(transacName,generatedItemNo,transacClass);

                if(stat)
                {     

                     ArrayList itemMaster = (ArrayList) mahanadhiRemote.getItemMaster();
                     request.setAttribute("itemMaster",itemMaster);

                     ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                     request.setAttribute("classMaster",classMaster);

                    request.setAttribute("existStat","yes");
                    fwd = "frmTransactionEntry";
                }
                else
                {
                    mahanadhiRemote.insertAccTxnTypeDetails(accTxnTypVO);
                    fwd = "frmTransactionEntryConf";                    
                }

                System.out.println("fwd path :"+fwd);

                return new ModelAndView("itemMasterAccounts/"+fwd);
                //(fwd);
            }
			else if(process.trim().equalsIgnoreCase("updatetransac")){
                String transName = request.getParameter("transacName");
                String transacType = request.getParameter("transacType");
                String transacAccNo = request.getParameter("transacAccNo");
                String itemNo  =request.getParameter("transacItemNo");
                String transId  = request.getParameter("transId");
                String className = request.getParameter("transacClass");

                System.out.println(" Transcat Name "+transName);
                System.out.println(" transacType Name "+transacType);
                System.out.println(" transacAccNo Name "+transacAccNo);
                System.out.println(" Transcat itemNo "+itemNo);
                System.out.println(" Transcat transId "+transId);
                System.out.println(" Transcat className "+className);
                
                if(transName!=null && transacType!=null && transacAccNo!=null && itemNo!=null && className!=null){
                    
                    if(transId!=null && transId.trim().length()!=0){
                        
                        accTxnTypVO = mahanadhiRemote.selectAccTransactionTypeDetail(transId);
                        String dbTransName = accTxnTypVO.getTransaction_name();
                        String dbTranstype = accTxnTypVO.getTransaction_type();
                        String dbItemNo = accTxnTypVO.getItem_no();
                        String dbTransId = accTxnTypVO.getTransaction_type_id();
                        String dbClassName = accTxnTypVO.getClass_name();
                        String dbAccNo = accTxnTypVO.getAccount_no();
                        
                        String finalValue = null;
                        String[] tempValue = itemNo.split("#");
                        String finalItemNo = null;
                        
                            if(tempValue.length>0){
                                finalValue = tempValue[0];
                            }
                            
                            System.out.println("itemNo is "+itemNo);

                            if(itemNo!=null || itemNo.trim().length()>0){
                                finalItemNo = mahanadhiRemote.createItemNoFromAccMaster(finalValue);
                            }
                            System.out.println("finalValue is "+finalValue);
                            System.out.println("Final Item No :"+finalItemNo);
                            System.out.println("Transac Type in DB is "+dbTranstype);
                            System.out.println("Transac Type in Form is "+transacType);
                            
                            if(dbTransName.equalsIgnoreCase(transName) && dbTranstype.equalsIgnoreCase(transacType)){
                            	System.out.println("Inside Equals of transName,transacType, transId");
                                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                                request.setAttribute("classMaster",classMaster);
                                request.setAttribute("listTransacItem",null);
                                session.setAttribute("className",null);
                                
                                accTxnTypVO.setAccount_no(transacAccNo);
                                accTxnTypVO.setClass_name(className);
                                accTxnTypVO.setItem_no(finalItemNo);
                                accTxnTypVO.setTransaction_name(transName);
                                accTxnTypVO.setTransaction_type(transacType);                            

                                boolean update_result = mahanadhiRemote.updateAccTxnTypeDetails(accTxnTypVO);
                                System.out.println("update Result is "+update_result);
                                
                                return new ModelAndView("itemMasterAccounts/frmLstTransacEntry");
                                //("listtransac");
                                
                            }
                            else{
                                
                                boolean transExists = mahanadhiRemote.isTransactionExists(transName,finalItemNo,dbClassName);
                                if(transExists==true){
                                    ArrayList listTransacItem = null;
                                    System.out.println("~~~~~~~~~~~~~~~transExists==true~~~~~~~~~~~~~~~~~");
                                    if(transId!=null && transId.trim().length()!=0){
                                        accTxnTypVO = mahanadhiRemote.selectAccTransactionTypeDetail(transId);    
                                    }

                                    ArrayList itemMaster = (ArrayList) mahanadhiRemote.getItemMaster();
                                    ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();

                                    request.setAttribute("itemMaster",itemMaster);
                                    request.setAttribute("classMaster",classMaster);
                                    request.setAttribute("TransactionDet",accTxnTypVO);
                                    request.setAttribute("existStat","yes");

                                    return new ModelAndView("itemMasterAccounts/frmEditTransacEntry");
                                    //("edittransac");                        
                                }
                                else{
                                	System.out.println("~~~~~~~~~~~~~~~transExists==FALSE~~~~~~~~~~~~~~~~~");
                                    if(transName!=null && transacType!=null && transacAccNo!=null && className!=null && finalItemNo!=null){

                                        accTxnTypVO.setAccount_no(transacAccNo);
                                        accTxnTypVO.setClass_name(className);
                                        accTxnTypVO.setItem_no(finalItemNo);
                                        accTxnTypVO.setTransaction_name(transName);
                                        accTxnTypVO.setTransaction_type(transacType);                            

                                        boolean update_result = mahanadhiRemote.updateAccTxnTypeDetails(accTxnTypVO);
                                        System.out.println("update Result is "+update_result);

                                            if(update_result==true){
                                                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();
                                                request.setAttribute("classMaster",classMaster);
                                                request.setAttribute("listTransacItem",null);
                                                session.setAttribute("className",null);
                                                return new ModelAndView("itemMasterAccounts/frmLstTransacEntry");
                                                //("listtransac");
                                            }
                                            else{
                                                ArrayList listTransacItem = null;

                                                if(transId!=null && transId.trim().length()!=0){
                                                    accTxnTypVO = mahanadhiRemote.selectAccTransactionTypeDetail(transId);    
                                                }

                                                ArrayList itemMaster = (ArrayList) mahanadhiRemote.getItemMaster();
                                                ArrayList classMaster = (ArrayList) mahanadhiRemote.selectClassMaster();

                                                request.setAttribute("itemMaster",itemMaster);
                                                request.setAttribute("classMaster",classMaster);
                                                request.setAttribute("TransactionDet",accTxnTypVO);
                                                request.setAttribute("existStat","yes");

                                                return new ModelAndView("itemMasterAccounts/frmEditTransacEntry");
                                                //("edittransac");                                  
                                            }
                                    }
                                }
                            }
                    }
                }

            }
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return null;
	}

}

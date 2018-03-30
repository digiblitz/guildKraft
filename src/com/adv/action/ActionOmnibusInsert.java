/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
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
/*  Program Name    : ActionOmnibusInsert.java
 *  Created Date    : September 9, 2006, 10:20 AM
 *  Author          : Punitha.R
 *  Version         : 1.20
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.adv.action;
import com.hlcadv.advertise.HLCAdvertiseSessionBean;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.HLCAdvertiserVO;
import com.hlccommon.util.Debug;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;
import com.adv.actionform.FormOmnibus;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlcpayment.HLCPaymentSessionBean;
import com.hlcpayment.HLCPaymentSessionRemote;
import com.hlcpayment.HLCPaymentSessionRemoteHome;

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

import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;


	public class ActionOmnibusInsert implements Controller {
		
	
     SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
     public ModelAndView handleRequest(HttpServletRequest request,
 			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
 			IOException, ParserConfigurationException, SAXException {
       try{
           
         /**
          * Getting the EJB Remote object to access the bean
          */
    	   HttpSession session = request.getSession();
    	   HLCAdvertiseSessionBean advBean=new HLCAdvertiseSessionBean();
    	   HLCPaymentSessionBean paymentBean =new HLCPaymentSessionBean();

     String advInsert = request.getParameter("advInsert");
    
      if(advInsert.equals("initLoad")){
          
 	try{	
                String mediaName = request.getParameter("mediaName");
                String mediaId = request.getParameter("mediaId");
                if(mediaId!=null && mediaId.trim().length()!=0){
                    Debug.print("ActionOmnibuInsert.initLoad Page() called ...."); 
                    //List freqList =(List)advBean.getFrequencyDetails("2459b5ca-af79-45d2-b006-2719865dd483");
                    List freqList =(List)advBean.getFrequencyDetails();                
                    request.setAttribute("dispFreqDetails", freqList);


                    //Vector issueType =(Vector)advBean.getIssueByMedia("2459b5ca-af79-45d2-b006-2719865dd483");
                    Vector issueType =(Vector)advBean.getIssueByMedia(mediaId);
                    request.setAttribute("dispIssueDetails", issueType);

                    /*
                     * based on media id display type details
                     *
                     */

                    //Vector displayType = (Vector)advBean.getMediaDisplayTypeDetails("2459b5ca-af79-45d2-b006-2719865dd483");
                    Vector displayType = (Vector)advBean.getMediaDisplayTypeDetails(mediaId);
                    request.setAttribute("DisplayTypeDetails" , displayType);
                    /*
                     * display dimension details
                     *
                     */
                    //Debug.print("ActionOmnibuInsert.initLoad Page() called ..2."); 
                    Vector dispDimensionType =(Vector)advBean.getAllDimensionDetails();
                    Debug.print("dispDimensionType "+ dispDimensionType );
                    request.setAttribute("DisplayDimensionDetails",dispDimensionType);
                    Debug.print("Advertisement page loaded Successfully ");
                    if(mediaName.equals("Omnibus")){
                        request.setAttribute("mediaId",mediaId);
                        return new ModelAndView("frmAdvOmnibus");
                    }
                    else if(mediaName.equalsIgnoreCase("Magazine")){
                        request.setAttribute("mediaId",mediaId);
                        return new ModelAndView("frmAdvMagazine");
                    }
                    else{
                    	return new ModelAndView("comingSoon");
                    }
            }
        }
        catch(Exception newPage){
            Debug.print("error occurs" + newPage);
        }
    }
    
     
     if(advInsert.equals("insert")){
        Debug.print("ActionOmnibuInsert.create() called ...."); 
        String selPlanDisp = request.getParameter("selPlanDisp");
        String mediaId = request.getParameter("mediaId");
        FormOmnibus omniForm = new FormOmnibus();
        HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
        String userId = (String)session.getAttribute("userId");
          
        // just for the readability 
                
	String  txtAdvName = omniForm.getTxtAdvName();
	String  txtAgencyName = omniForm.getTxtAgentName();
	String  txtFirstName = omniForm.getTxtFirstName();
	String  txtMidName = omniForm.getTxtMidName();
        String  txtLastName = omniForm.getTxtLastName();
	String  txtStreetName = omniForm.getTxtStreetName();
	String  txtSuiteName = omniForm.getTxtSuiteName();
	
        String  selConCountry = omniForm.getSelConCountry();
	String  selConState = omniForm.getSelConState();
	String  txtConCity = omniForm.getTxtConCity();
      	String  txtConZip = omniForm.getTxtConZip();
        
	String  txtConPhone = omniForm.getTxtConPhone();
	String  txtConFax = omniForm.getTxtConFax();
	String  txtConMail = omniForm.getTxtConMail();
        
	String  rdoQuest = omniForm.getRdoQuest();
        boolean rdoQu = false;
        if(rdoQuest.equals("yes")){
            rdoQu = true;
        }
        Debug.print("ActionOmnibuInsert.create() rdoQuest ...."); 
	String  txtYesDate = omniForm.getTxtYesDate();
        Debug.print("ActionOmnibuInsert.create() txtYesDate ...." + txtYesDate); 
        Date yesDate = null;
        if(txtYesDate==null || txtYesDate.equals("")){
            yesDate = null;
        }
        else{
            yesDate =(Date)sdf.parse(txtYesDate);
        }
        
        Debug.print("ActionOmnibuInsert.create() yesDate ...." + yesDate); 
	//String  txtAdName=omniForm.getTxtAdName();
        String  txtMatName = omniForm.getTxtMatName();
	
	String  rdoSupply = omniForm.getRdoSupply();
        Debug.print("ActionOmnibuInsert.create() rdoSupply ...."); 
	String  txtAreaIns = omniForm.getTxtAreaIns();
        Debug.print("ActionOmnibuInsert.create() txtAreaIns ...."); 
        String rdoAdvertising = omniForm.getRdoAdvertising();
        Debug.print("ActionOmnibuInsert.create() rdoAdvertising ...."); 
       //logging the inputs coming from the GUI
 	
        Debug.print("txtAdvName:         " + txtAdvName);
        Debug.print("txtAgencyName:       " + txtAgencyName);
        Debug.print("txtFirstName:      " + txtFirstName);
        Debug.print("txtMidName:          " + txtMidName);
        Debug.print("txtLastName:          " + txtLastName);
        Debug.print("txtStreetName:      " + txtStreetName);
        Debug.print("txtSuiteName:          " + txtSuiteName);

        Debug.print("selConCountry:        " + selConCountry);
        Debug.print("selConState:          " + selConState);
        Debug.print("txtConCity:         " + txtConCity);
        Debug.print("txtConZip:            " + txtConZip);
        Debug.print("txtConPhone:        " + txtConPhone);
        Debug.print("txtConFax:           " + txtConFax);
        Debug.print("txtConMail:         " + txtConMail);
     
        Debug.print("rdoAdvertising:    " + rdoAdvertising);
        Debug.print("rdoQuest:          " + rdoQuest);
        Debug.print("txtYesDate:      " + yesDate);
        Debug.print("selPlanDisp:    " + selPlanDisp);
        
    
        Date txtDetDate = null;
        if(omniForm.getTxtDetDate().equals("") || omniForm.getTxtDetDate()==null){
            txtDetDate= null;
        }
        else{
            txtDetDate =(Date)sdf.parse(omniForm.getTxtDetDate());
        }
        
        

        Debug.print("txtDetDate:      " + txtDetDate);
        Debug.print("txtMatName:    " + txtMatName);
        Debug.print("rdoSupply:     " + rdoSupply);
       // Debug.print("txtAreaIns:      " + txtAreaIns);
        
        HLCAdvertiserVO objAdvt = new HLCAdvertiserVO();
            //ArrayList issueList = new ArrayList();

      
        objAdvt.setUserId(userId);
        objAdvt.setMediaId(mediaId);
        objAdvt.setAdvertiser(txtAdvName);
        objAdvt.setAdAgency(txtAgencyName);
        objAdvt.setAgencyFirstName(txtFirstName);
        objAdvt.setAgencyMiddleName(txtMidName);
        objAdvt.setAgencyLastName(txtLastName);
        objAdvt.setAgencyAddress(txtStreetName);
        objAdvt.setAgencySuite(txtSuiteName);
        objAdvt.setAgencyPhone(txtConPhone);
        objAdvt.setAgencyFax(txtConFax); 
        objAdvt.setAgencyEmail(txtConMail);
        objAdvt.setAgencyCity(txtConCity);
        objAdvt.setAgencyState(selConState);
        objAdvt.setAgencyCountry(selConCountry);
        objAdvt.setAgencyZip(txtConZip);
        objAdvt.setInvoiceTo(rdoAdvertising);
        objAdvt.setComments(txtAreaIns);
        objAdvt.setAdvPosted(rdoQu);
        objAdvt.setAdvPostedDate(yesDate);
        objAdvt.setMaterialComingFrom(txtMatName);
        objAdvt.setMaterialComingDate(txtDetDate);
        objAdvt.setAdvSuppliedOn(rdoSupply);
        objAdvt.setSalesPersonId("");
        objAdvt.setRequestStatus("Pending");
        objAdvt.setActiveStatus(true);
  
        
//=============================================================================================
       try {
             if(selPlanDisp!=null && !selPlanDisp.equals("") && mediaId!=null && !mediaId.equals("")){
                int incVal = Integer.parseInt(selPlanDisp);
                    
                ArrayList al = new ArrayList();
                try{
                    for(int i = 1; i<=incVal;i++){
                        String chkIssue = request.getParameter("chkIssue" + i);
                        String selWinTypechkIssue = request.getParameter("selWinTypechkIssue" + i);
                        String selWinSubTypechkIssue = request.getParameter("selWinSubTypechkIssue" + i);
                        String selWinDimchkIssue = request.getParameter("selWinDimchkIssue" + i);
                        String placement = request.getParameter("txtWinPlace" + i);

                        Debug.print("Ajax chkIssue:" + chkIssue);
                        Debug.print("Ajax selWinTypechkIssue:" + selWinTypechkIssue);
                        Debug.print("Ajax selWinSubTypechkIssue:" + selWinSubTypechkIssue);
                        Debug.print("Ajax selWinDimchkIssue:" + selWinDimchkIssue);
                        ArrayList adsDet = new ArrayList();
                        ArrayList listFreq = new ArrayList();
                        if(mediaId!=null  && mediaId.trim().length()!=0 && selWinTypechkIssue!=null && selWinTypechkIssue.trim().length()!=0 && selWinSubTypechkIssue!=null && selWinSubTypechkIssue.trim().length()!=0){
                            
                            Debug.print("Ajax inside Loop:" + selWinSubTypechkIssue);
                            Debug.print("mediaId " + mediaId);
                            Debug.print("selWinTypechkIssue" + selWinTypechkIssue);
                            
                            listFreq = (ArrayList)advBean.getMapIdDetails(mediaId,selWinTypechkIssue,selWinSubTypechkIssue);
                            int cntRow = 1;
                            if(listFreq!=null && listFreq.size()!=0){
                                Iterator e = listFreq.iterator();
                                while(e.hasNext()){
                                    String mapPriceVal = (String) e.next();
                                    al.add(mapPriceVal);
                                    al.add(chkIssue);
                                    al.add(selWinDimchkIssue);
                                    al.add(placement);
                                    Debug.print("============" + cntRow++ +"================");
                                    Debug.print("mapPriceVal:" + mapPriceVal);
                                    Debug.print("chkIssue:" + chkIssue);
                                    Debug.print("selWinDimchkIssue:" + selWinDimchkIssue);
                                    Debug.print("placement:" + placement);
                                    Debug.print("===========================================");
                                }
                            }
                        }
                    }
                }
                catch(Exception e){
                    Debug.print("Exception in AjaxActionAdvertise:" + e.getMessage());
                }
                
                Debug.print("ArrayList al:" + al + "<br>");
                ArrayList adsDetails = new ArrayList();
                long totalPrice = 0;
                if(al!=null && al.size()!=0){
                    Hashtable ht = getMapIdFromUserRequest(al);
                    Debug.print("Size:" + ht.size());
                    Enumeration k = ht.keys();
                    while (k.hasMoreElements()) {
                        String key = (String) k.nextElement();
                        String[] storeVal = (String[])ht.get(key);
                        int value = Integer.parseInt(storeVal[4]);
                        int price = advBean.getPriceFromMap(key, value);
                        int localPrice = (price * value);
                        ArrayList adsDetLocal = new ArrayList();
                        adsDetLocal.add(storeVal[0]);
                        adsDetLocal.add(storeVal[1]);
                        adsDetLocal.add(storeVal[2]);
                        adsDetLocal.add(storeVal[3]);
                        adsDetLocal.add("0");
                        adsDetLocal.add(String.valueOf(price));
                        adsDetails.add(adsDetLocal);
                        
                        //Debug.print("adsDetLocal:" + adsDetLocal);
                        //{chkIssue,chkVal,selWinDimchkIssue,placement,String.valueOf(count)};
                        
                      /*
                        Debug.print("============" + cntRow +"================");
                        Debug.print("mapPriceVal:" + mapPriceVal);
                        Debug.print("chkIssue:" + chkIssue);
                        Debug.print("selWinDimchkIssue:" + selWinDimchkIssue);
                        Debug.print("placement:" + placement);
                        Debug.print("===========================================");
                        */
                        totalPrice = totalPrice + localPrice;
                        Debug.print("Price:" + price + "     = >>> Frequence : " + value + " =>>>>>>  Total :" +  localPrice + " <br>");
                    }
                }
                
                Debug.print("<br>=========================<br>");
                Debug.print("Grand Total:" + totalPrice + "<br>");
                Debug.print("=========================<br>");
          
            
            
            //objAdvt.setAdsDetails(adsDet);
            Debug.print("Ads Object:" + objAdvt.toString());
            ArrayList finalAdsDet = new ArrayList();
            int cntRow = 0;
            for (Iterator it = al.iterator(); it.hasNext();) {
                    String mapId = (String) it.next();
                    String chkIssue = (String) it.next();
                    String selWinDimchkIssue = (String) it.next();
                    String placement = (String) it.next();
                    
                    ArrayList tempAdsDet = new ArrayList();
                    tempAdsDet.add(chkIssue);
                    tempAdsDet.add(mapId);
                    tempAdsDet.add(selWinDimchkIssue);
                    tempAdsDet.add(placement);
                    tempAdsDet.add("0");
                    String price = "0";
                    if(adsDetails!=null && adsDetails.size()!=0){
                        for (Iterator itTemp = adsDetails.iterator(); itTemp.hasNext();) {
                            ArrayList tempAds = (ArrayList)itTemp.next();
                            if(tempAds!=null && tempAds.size()!=0){
                                for (Iterator it1 = tempAds.iterator(); it1.hasNext();) {
                                    String tempChkIssue = (String) it1.next();
                                    String tempMapId = (String) it1.next();
                                    String tempSelWinDimchkIssue = (String) it1.next();
                                    String tempPlacement = (String) it1.next();
                                    String tempDiscount = (String) it1.next();
                                    String tempPrice = (String) it1.next();
                                    if(mapId.equals(tempMapId)){
                                        price = tempPrice;
                                        Debug.print("   Matching Price:" + price);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                    
                    tempAdsDet.add(price);
                    Debug.print("*************" + cntRow++ +"*************");
                        Debug.print("chkIssue:" + chkIssue);
                        Debug.print("mapId:" + mapId);
                        Debug.print("selWinDimchkIssue:" + selWinDimchkIssue);
                        Debug.print("placement:" + placement);
                        Debug.print("price:" + price);
                    Debug.print("***************************************");
                    finalAdsDet.add(tempAdsDet);
                    Debug.print("Ads Size :" + finalAdsDet.size());
                    //{chkIssue,chkVal,selWinDimchkIssue,placement,String.valueOf(count)};
                    
            }
           
                    int  CcExpMonth = 0;
                    int CcExpYear = 0;
                    int CcCvvid =0;
                    double amount =0;
                    String CcNumber = "0";
                    String checkNumber="0";
                    Date check_date = null;
                    Date comp_date = null;
                    String ccType=null;
                    String ccName=null;

                //payment details
                    String  r11 = omniForm.getR11();
                    System.out.print("Check Status :" + r11);

                    if(r11.equals("card")){
                        if(omniForm.getCcNumber()==null || omniForm.getCcNumber().equals("")){
                            CcNumber ="0";
                        }
                        else {
                            CcNumber = omniForm.getCcNumber();
                        }
                        if(omniForm.getCcName()==null || omniForm.getCcName().equals("")){
                            ccName ="";
                        }
                        else {
                            ccName=omniForm.getCcName();
                        }
                        if(!(omniForm.getCcType().equals("")) && omniForm.getCcType()!=null){
                            ccType = omniForm.getCcType();  
                        }
                        if(omniForm.getCcExpMonth()==null || omniForm.getCcExpMonth().equals("")){
                            CcExpMonth =0;
                        }
                        else {
                            CcExpMonth=Integer.parseInt(omniForm.getCcExpMonth());
                        }
                        if(omniForm.getCcExpYear()==null || omniForm.getCcExpYear().equals("")){
                            CcExpYear =0;
                        }
                        else{
                            CcExpYear = Integer.parseInt(omniForm.getCcExpYear());
                        }
                        if(omniForm.getCcCvvid()==null || omniForm.getCcCvvid().equals("")){
                            CcCvvid =0;
                        }
                        else{
                            CcCvvid = Integer.parseInt(omniForm.getCcCvvid());
                        }
                        check_date= null;
                        objPayDet.setPaymentStatus("card");
                    }

                    if(r11.equals("check")){
                        if(omniForm.getCheckNumber()==null || omniForm.getCheckNumber().equals("")){
                        checkNumber="0";
                        }
                        else{
                        checkNumber=omniForm.getCheckNumber();
                        }
                        if(omniForm.getCheckDate().equals("")){
                        check_date= null;
                        }
                        else{
                        check_date =(Date)sdf.parse(omniForm.getCheckDate());
                        }
                        objPayDet.setPaymentStatus("Check");
                    }

                    if(omniForm.getAmount()==null || omniForm.getAmount()=="" ){
                        amount=0; 
                    }
                    else{
                        amount = Double.parseDouble(omniForm.getAmount());
                    } 

                   // Debug.print("User Id Setted In Servlet:" + userId);
                    Debug.print("Credit card Name:      " + ccName);

                    Debug.print("Credit card Type:    " + ccType);
                    Debug.print("Crdit card number:    " + CcNumber);
                    Debug.print("CcExpMonth Setted In Servlet:     " + CcExpMonth);
                    Debug.print("CcExpYear Setted In Servlet:   " + CcExpYear);
                    Debug.print("CcCvvid Setted In Servlet:     " + CcCvvid);
                    Debug.print("check_date Setted In Servlet:   " + check_date);
                    Debug.print("amount Setted In Servlet:   " + amount);
                    Debug.print("Bank name:::::::::::" + omniForm.getBankName());


                    objPayDet.setUserId(userId);
                    objPayDet.setCcName(ccName);
                    objPayDet.setCcType(ccType);
                    objPayDet.setCcNumber(CcNumber);
                    objPayDet.setCcExpMonth(CcExpMonth);
                    objPayDet.setCcExpYear(CcExpYear);
                    objPayDet.setCcCvvid(CcCvvid);
                    objPayDet.setBankName(omniForm.getBankName());
                    objPayDet.setCheckDate(check_date);
                    objPayDet.setCheckNumber(checkNumber);
                    objPayDet.setAmount(amount);
                    objPayDet.setPaymentDate(new Date());

                    Debug.print("Session UserId:" + session.getAttribute("userId"));
                    Debug.print("Payment Object:" + objPayDet.toString());
                    //advBean.getAllMapByMedDisTyDisSubType("","","","");
                    
                    if(r11.equals("card")){
                        Debug.print("Sucessfully Redirect to NoVa:");
                        session.setAttribute("objMediaDetail",objAdvt);
                        session.setAttribute("objPriceList",finalAdsDet);
                        session.setAttribute("objPaymentList",objPayDet);
                        Debug.print("Sucessfully Redirect objMediaDetail :" + finalAdsDet);
                        Debug.print("Sucessfully Payment objPriceList:" + objAdvt);
                        Debug.print("Sucessfully Payment objPaymentList:" + objPayDet.toString());
                         //=======================================
                            request.setAttribute("email","suryey@yahoo.co.in");
                            request.setAttribute("cardNo",String.valueOf(CcNumber));
                            String expMon = String.valueOf(CcExpMonth);
                            String expYear = String.valueOf(CcExpYear);
                            if(expMon.trim().length()==1) {
                                 expMon = "0" + expMon;
                            }
                           // if(expYear.trim().length()==1) {
                            Debug.print("expYear:" + expYear);
                            expYear = expYear.substring(2);
                            //
                            Debug.print("expMon:" + expMon);
                            Debug.print("expYear:" + expYear);

                            String expDate = expMon + expYear;
                            request.setAttribute("expDate",expDate);
                            request.setAttribute("amount",String.valueOf(amount));
                            request.setAttribute("chkDigit",String.valueOf(CcCvvid));
                            //===========================================
                            return new ModelAndView("frmAdvRedirNova");
                    }
                    else{
                        boolean result  = advBean.createAdvertiser(objAdvt, finalAdsDet);
                        Debug.print("Sucessfully Inserted:" + result);
                  //================================================================
                        boolean resultPay  = paymentBean.createPayment(objPayDet);
                        Debug.print("Sucessfully Payment Inserted:" + objPayDet.toString());
                  //================================================================
                        if(result == true && resultPay == true){
                           String toMailId = (String)session.getAttribute("emailId");
                           String toMailIds[] = {toMailId};
                            EmailContent email=new EmailContent();
                            email.setTo(toMailIds);
                            email.setFrom("info@hlc.com");
                            email.setSubject("Advertisement posted successfully!");

                            String content = "<table width=\"526\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:1px solid #999;\"> " +
                            " <tr>" +
                            " <td height=\"463\" valign=\"top\" bgcolor=\"#FCFBF0\" style=\"padding-top:10px; padding-bottom:10px; padding-left:10px; padding-right:10px;\">" +
                            " <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\"> " +
                            "<tr>" +
                            "<td height=\"70\" valign=\"top\"><img src=\"images/emailHeader.jpg\" alt=\"HLC Online Services Dashboard Email Template\" width=\"515\" height=\"55\" /></td> " +
                            " </tr>"+
                            "  <tr>"+
                            "<td valign=\"top\">"+
                            "<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">"+
                            "<tr>"+
                            "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopLeft.jpg\" width=\"13\" height=\"12\" /></td> " +
                            "<td valign=\"top\" bgcolor=\"#FBF2F2\"></td>" +
                            "<td width=\"13\" height=\"12\" valign=\"top\"><img src=\"images/cornerTopRght.jpg\" width=\"13\" height=\"12\" /></td>" +
                            "</tr>"+
                            "<tr>"+
                            "<td valign=\"top\" background=\"images/left.jpg\">&nbsp;</td>"+
                            "<td valign=\"top\" bgcolor=\"#FBF2F2\">"+
                            "<span class=\"boldTxt\">Dear User</span>,<br /><br />"+
 "<p>You have successfully posted an advertisement with HLC for the media type and issues you had selected."+
"Your application would be verified and approved within 24 hrs. <br/>"+

                            "------------------ <br />"+
                            "<span class=\"boldRedTxt\">HLC Team</span></td>"+
                            "<td valign=\"top\" background=\"images/Rght.jpg\">&nbsp;</td>"+
                            "</tr>"+
                            "<tr><td valign=\"top\" background=\"images/cornerBotLeft.jpg\">&nbsp;</td>"+
                            "<td valign=\"top\" background=\"images/cornerBot.jpg\">&nbsp;</td>"+
                            "<td valign=\"top\" background=\"images/cornerBotRght.jpg\">&nbsp;</td>"+
                            "</tr>"+
                            " </table>"+
                            "</td></tr>"+
                            "+<tr>"+
                            "<td valign=\"top\" style=\"padding:10px;\">"+
                            "<img src=\"images/pic.jpg\" width=\"272\" height=\"76\" style=\"float:right; padding-left:8px; padding-bottom:8px;\" />"+
                            "<p>The easiest way to access your day to day HLC activities online or offline where ever you are and when ever you want."+
                            "</p>If you are a NEW VISITOR, register now and ENJOY the following privileges:"+
                            "<ul>"+
                            "<li>Unlimited shopping online.</li>"+
                            "<li>Place advertisements online and/or on-site.</li>"+
                            "<li>Sponsor competitions held by HLC.</li>"+
                            "</ul>"+


                            "Also, REGISTER NOW! and become a member of HLC to access and 	enjoy the following privileges as per your Membership Type and as "+
                            "per your ‘Role’ assigned:"+

                            "<ul>"+
                            "<li>Compete in Equestrian Events held by HLC.</li>"+
                            "<li>Take part in other events like; Annual Meetings, Educational events,"+
                            "Activity Meetings held by HLC etc.</li>"+
                            "<li>Send Messages to other members.</li>"+
                            "<li>Create your own Distribution Lists.</li>"+
                            "<li>Create/Join a group and share your thoughts and common ideas.</li>"+
                            " <li>Unlimited Shopping online.</li>"+
                            " <li>Place advertisements online and/or on-site.</li>"+
                            " <li>Sponsor competitions held by HLC.</li>"+
                            "</ul>"+

                            "and much more..."+
                            "So go ahead and <a href=\"#\">REGISTER NOW!</a></td>"+
                            "</tr>"+
                            " <tr>"+
                            "<td style=\"border-top:1px solid #CC3333; padding-top:8px;\" align=\"right\"><img src=\"images/logo-eMailFooter.jpg\" width=\"63\" height=\"65\" /></td>"+
                            "</tr>"+
                            "</table>";

                            email.setBody(content);
                            //email.setAttachments();
                            EmailEngine emailEngine = new EmailEngine();
                            boolean emailFlag = emailEngine.sendMimeEmail(email);
                            Debug.print("Email sent sucessfully :"+emailFlag);
                        }
           
                }
                    return new ModelAndView("frmAdvMagPostConfirmation");
        }
    }
    catch(Exception e){
            Debug.print("Exception:" + e);
    }
//================================================================================================           
          }
     return new ModelAndView("frmAdvMagPostConfirmation");
//===========================================try end========================
        }
//==================================================      
      catch(Exception ecommon){
          Debug.print("" + ecommon);
      }
        return null;  
  }
     
 private Hashtable getMapIdFromUserRequest(ArrayList al){
        Hashtable ht = null;
        ArrayList chkArray = null;			
        if(al!=null && al.size()!=0){
            ht = new Hashtable();
            chkArray = al;
               for (Iterator it = al.iterator(); it.hasNext();) {
                    String chkVal = (String) it.next();
                    String chkIssue = (String) it.next();
                    String selWinDimchkIssue = (String) it.next();
                    String placement = (String) it.next();
                    int count = 0;
                    for (Iterator it1 = chkArray.iterator(); it1.hasNext();) {
                            String chkValAgaint = (String) it1.next();
                            if(chkVal.equals(chkValAgaint)){
                                    count++;
                            }
                    }
                    
                    if(!ht.containsKey(chkVal)){
                            String[]  storeVal = {chkIssue,chkVal,selWinDimchkIssue,placement,String.valueOf(count)};
                            Debug.print("Final Inserted Value:" + storeVal);
                            ht.put(chkVal, storeVal);
                   }
                }
        }
        return ht;
    }
}

//====================================THE END====================================================================================

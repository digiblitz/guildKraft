/*
 * AnnualAdditionalTckt.java
 *
 * Created on October 31, 2007, 1:02 PM
 */

package com.mee.action;

import com.hlcaccounts.session.HLCMahanadhiSessionBean;
import com.hlcaccounts.session.HLCMahanadhiSessionRemote;
import com.hlcaccounts.session.HLCMahanadhiSessionRemoteHome;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;

import com.hlcmeeting.session.HLCVaigaiSessionBean;

import com.hlcreg.util.Debug;
import com.mee.actionform.AnnRegPaymentForm;
import com.hlcmeeting.util.HLCAdditionalTcktVO;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;

import com.hlcpayment.HLCPaymentSessionBean;

import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import com.hlcreg.util.HLCPaymentVO;
import com.hlccommon.util.HLCPaymentDetailVO;
import com.hlcreg.util.HLCPaymentDetails;
import org.apache.struts.util.MessageResources;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.ejb.FinderException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;
/**
 *
 * @author hari
 * @version
 */


	public class AnnualAdditionalTckt implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
    
			 HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
        
			 HLCKaveryMembershipTypeSessionBean membTypBean =new HLCKaveryMembershipTypeSessionBean();
			 HLCPaymentSessionBean paymentBean=new HLCPaymentSessionBean();
        
        HLCPaymentDetailVO objPayDet = new HLCPaymentDetailVO();
        
        HttpSession session = request.getSession(true);
        HLCMahanadhiSessionBean mahanadhiBean=new HLCMahanadhiSessionBean();       
        String staff_user_id = (String) session.getAttribute("staff_user_id");
        HLCKaverySessionBeanStatfulBean kaveryStatfulBean=new HLCKaverySessionBeanStatfulBean();    
// Refund Feasibility       
        String execute = request.getParameter("execute");
        Debug.print("Execute is "+execute);
        
        String reqIp=request.getRemoteAddr();
        Debug.print(" Request IP :"+reqIp);
        
        if(execute!=null && execute.trim().length()!=0){
            if(execute.trim().equalsIgnoreCase("addTckt")){
                Debug.print("Execute is "+execute);
                Vector otherAct =  vaigaiMeetingBean.displayActivityTypeActivity();
                Vector memDet;
				try {
					  String memberId = (String)session.getAttribute("memberId");
		                String memberShipTypeID = "";
					memDet = membTypBean.displayAnnualMemberDetails();
					  if(memDet!=null && memDet.size()!=0){
		                    Enumeration eDet = memDet.elements();
		                    while(eDet.hasMoreElements()){
		                        String[] det = (String [])eDet.nextElement();
		                        String memId = det[0];
		                        String memName = det[1];
		                        if(memName.equals("USEA Member")){
		                            if(memberId!=null){
		                                memberShipTypeID = memId;
		                            }
		                        }
		                        if(memName.equals("Non Member")) {
		                            if(memberId==null){
		                                memberShipTypeID = memId;
		                                Debug.print("memName:" + memName);
		                            }
		                        }
		                    }
		                }
					  Debug.print("Membership Type Id "+memberShipTypeID);
		                request.setAttribute("memberShipTypeID",memberShipTypeID);
				} catch (FinderException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
                
              
              
                Debug.print("Set Attribute OTHER_ACTIVITY ");
                request.setAttribute("OTHER_ACTIVITY",otherAct);
                Debug.print("Set Attribute memberShipTypeID");
               
                Debug.print("Forward Now to addTcktpge");
                
                return new ModelAndView("frmMeeAnnualAddMoreTckts");
            }
            
            if(execute.trim().equalsIgnoreCase("insertAddTckt")){
                String actSize = request.getParameter("actSize");
                ArrayList addTktList = null;
                
                String addTktRegistrarName = request.getParameter("addTktRegistrarName");
                Debug.print("actSize:" + actSize);
                String actAddTkt = "";

                String sesUserId ="";
                String ticket="0";
                boolean tickStatus =false;
                int  CcExpMonth = 0;
                int CcExpYear = 0;
                int CcCvvid =0;
                double totalAmount =0;
                String CcNumber ="0";
                String checkNumber="0";
                Date check_date = null;
                Date comp_date = null;
                String ccType=null;
                String ccName=null;
                String nameoncheck = null;
                String bankname = null;
                ArrayList ids = new ArrayList();
                String memberShipTypeID = request.getParameter("memberShipTypeID");
                
                try{
                    if(actSize!=null){
                        int arrayLength = Integer.parseInt(actSize);
                        addTktList = new ArrayList();
                        for(int pId =0 ;pId <arrayLength;pId++){
                            String cnt = String.valueOf(pId+1);
                            // Debug.print("priceIdLen:" + priceIdLen);
                            String param = "actCheckBox" + cnt; // activityId
                            String param1 = "actVal" + cnt; //activityName
                            String param2 = "noofticket" + cnt; //no of tickets
                            String param5 = "calculAmt"+cnt; //TotalAmount
                            String param4 = "priceId" + cnt; //no of tickets
                            
                            Debug.print("param" + param);
                            Debug.print("param1" + param1);
                            Debug.print("param2" + param2);
                            Debug.print("param4" + param4);
                            Debug.print("param5" + param5);

                            
                            String actCheckBox = request.getParameter(param);
                            String actVal = request.getParameter(param1);
                            String actTkt = request.getParameter(param2);
                            String priceId = request.getParameter(param4);
                            String totTktAmt = request.getParameter(param5);

                            if(priceId!=null && priceId.trim().length()!=0 && !actTkt.equals("0") && actTkt.trim().length()!=0){
                               String tempAddTkt[] = {priceId, actTkt, totTktAmt};
                               ids.add(tempAddTkt);
                            }
                            
                            Debug.print("Size of ids "+ids.size());
                            
                            Debug.print("actCheckBox:" + actCheckBox);
                            Debug.print("actVal:" + actVal);
                            Debug.print("actTkt:" + actTkt);
                            Debug.print("totTktAmt" + totTktAmt);
                            
                            if(addTktRegistrarName!=null && addTktRegistrarName.trim().length()!=0 &&
                                    priceId!=null && priceId.trim().length()!=0 && actTkt!=null
                                    && !actTkt.equals("0") && actTkt.trim().length()!=0){
                                
                                String tempAddTkt[] = {priceId, actTkt, totTktAmt};
                                addTktList.add(tempAddTkt);
                            }
                            
                            String ConcatString = actVal +"#"+actTkt;
                            actAddTkt = actAddTkt + ConcatString +",";
                        }
                    }
                }
                
                catch(Exception e){
                    Debug.print("Ecxception while getting No of tickets:" + e.getMessage());
                }
                
                ticket = actAddTkt;
                tickStatus =true;
                sesUserId = (String)session.getAttribute("userId");
                String emailId = (String)session.getAttribute("emailId");
                
                AnnRegPaymentForm endForm=new AnnRegPaymentForm();
                //HLCPaymentVO objPayment = new HLCPaymentVO();
                HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                HLCPaymentVO objPayment = new HLCPaymentVO();
                SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
                
                String ipAddr = request.getRemoteAddr();
                objPayment.setIpAddress(ipAddr);
                
                String  r11 = endForm.getR11();
                System.out.print("Check Status :" + r11);
                
                if(r11.equals("card")){
                    if(endForm.getCcNumber()==null || endForm.getCcNumber().equals("")){
                        CcNumber = "0";
                    } else {
                        CcNumber = endForm.getCcNumber();
                    }
                    if(endForm.getCcName()==null || endForm.getCcName().equals("")){
                        ccName ="";
                    } else {
                        ccName=endForm.getCcName();
                    }
                    if(!(endForm.getCcType().equals("")) && endForm.getCcType()!=null){
                        ccType = endForm.getCcType();
                    }
                    if(endForm.getCcExpMonth()==null || endForm.getCcExpMonth().equals("")){
                        CcExpMonth =0;
                    } else {
                        CcExpMonth=Integer.parseInt(endForm.getCcExpMonth());
                    }
                    if(endForm.getCcExpYear()==null || endForm.getCcExpYear().equals("")){
                        CcExpYear =0;
                    } else{
                        CcExpYear = Integer.parseInt(endForm.getCcExpYear());
                    }
                    if(endForm.getCcCvvid()==null || endForm.getCcCvvid().equals("")){
                        CcCvvid =0;
                    } else{
                        CcCvvid = Integer.parseInt(endForm.getCcCvvid());
                    }
                    check_date= null;
                    objPayment1.setPaymentStatus("Credit Card");
                }
                
                if(r11.equals("check")){
                    if(endForm.getCheckNumber()==null || endForm.getCheckNumber().equals("")){
                        checkNumber="0";
                    } else{
                        checkNumber= endForm.getCheckNumber();
                    }
                    if(endForm.getCheckDate().equals("")){
                        check_date= null;
                    } else{
                        try {
							check_date =(Date)sdf.parse(endForm.getCheckDate());
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
                    }
                    objPayment.setPaymentStatus("Check");
                }
                if(endForm.getTotalAmount()==null || endForm.getTotalAmount()==""){
                    totalAmount=0;
                } else{
                    totalAmount = Double.parseDouble(endForm.getTotalAmount());
                }
                
                objPayment1.setUserId(sesUserId);
                objPayment1.setCcName(ccName);
                objPayment1.setCcType(ccType);
                objPayment1.setCcNumber(CcNumber);
                objPayment1.setCcExpMonth(CcExpMonth);
                objPayment1.setCcExpYear(CcExpYear);
                objPayment1.setCcCvvid(CcCvvid);
                //  if(bankname!=null){
                bankname =endForm.getBankName();
                // }
                //  if(nameoncheck!=null){
                nameoncheck =endForm.getNameCheck();
                //   }
                
                objPayDet.setBankName(bankname);
                objPayDet.setCheckName(nameoncheck);
                objPayDet.setCheckDate(check_date);
                objPayDet.setCheckNumber(checkNumber);
                objPayDet.setAmount(totalAmount);
                objPayDet.setPaymentDate(new Date());

                
                objPayDet.setUserId(sesUserId);
                objPayDet.setCcName(ccName);
                objPayDet.setCcType(ccType);
                objPayDet.setCcNumber(CcNumber);
                objPayDet.setCcExpMonth(CcExpMonth);
                objPayDet.setCcExpYear(CcExpYear);
                objPayDet.setCcCvvid(CcCvvid);
                
                //  if(bankname!=null){
                bankname =endForm.getBankName();
                // }
                //  if(nameoncheck!=null){
                nameoncheck =endForm.getNameCheck();
                //   }
                objPayment.setBankName(bankname);
                objPayment.setCheckName(nameoncheck);
                objPayment.setCheckDate(check_date);
                objPayment.setCheckNumber(checkNumber);
                objPayment.setAmount(totalAmount);
                objPayment.setPaymentDate(new Date());
                
                String paymentId = vaigaiMeetingBean.getNextId();
                Debug.print("New Payment Id generated is "+paymentId);                
                objPayDet.setPaymentId(paymentId);
                objPayment.setPaymentId(paymentId);
                
                if(r11.equals("card")){
                    Debug.print("Sucessfully Redirect to NoVa:");
                    
                    //boolean result1  = paymentBean.createPayment(objPayDet);
                    
                    String userId = (String) session.getAttribute("userId");
                    String totTckts = request.getParameter("totTckt");
                    String totAmt = request.getParameter("totalAmount");

                    
                    HLCAdditionalTcktVO tcktVO = new HLCAdditionalTcktVO();
                    tcktVO.setUser_id(userId);
                    tcktVO.setTickets(ticket);
                    tcktVO.setNo_of_tickets(totTckts);
                    tcktVO.setRegi_Amount(totAmt);
                    tcktVO.setMember_type_id(memberShipTypeID);
                    tcktVO.setPaymentId(paymentId);
                    tcktVO.setPriceIds(ids);                    
                    
                    session.setAttribute("tcktVO",tcktVO);
                    session.setAttribute("payId",paymentId);
                    session.setAttribute("amount",totAmt);
                    //=======================================
                    request.setAttribute("email",emailId);
                    request.setAttribute("cardNo",String.valueOf(CcNumber));
                    String expMon = String.valueOf(CcExpMonth);
                    String expYear = String.valueOf(CcExpYear);
                    if(expMon.trim().length()==1) {
                        expMon = "0" + expMon;
                    }
                    // if(expYear.trim().length()==1) {
                    Debug.print("expYear:" + expYear);
                    //expYear = expYear.substring(2);
                    
                    String expDate = expMon + expYear;
                    
                    session.setAttribute("amount",totAmt);
                    request.setAttribute("expDate",expDate);
                    request.setAttribute("amount",String.valueOf(totalAmount));
                    request.setAttribute("chkDigit",String.valueOf(CcCvvid));
                    //===========================================
                    String res[]={sesUserId,ticket,String.valueOf(totalAmount),"Pending"};
                    
                    String tktactivityId = request.getParameter("tktactivityId");
                    Debug.print("tktactivityId is "+tktactivityId);
                    if(tktactivityId!=null){
                        if(tktactivityId!=null || tktactivityId.trim().length()!=0){
                            
                            HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(tktactivityId);
                            HLCAccTransactionVO regiVO = new HLCAccTransactionVO();
                            
                            String accNo =  accTxnDet.getAccount_no();
                            String className = accTxnDet.getClass_name();
                            String itemNo = accTxnDet.getItem_no();
                            String subAccNo = accTxnDet.getSub_account_no();
                            String transName = accTxnDet.getTransaction_name();
                            String transType = accTxnDet.getTransaction_type();
                            
                            if(r11.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("ccType");
                                regiVO.setPayment_mode(cardselect);
                                regiVO.setActive_status(false);
                            }
                            
                            regiVO.setAmount(Float.parseFloat(totAmt));
                            regiVO.setDescription(transName);
                            regiVO.setClass_Typ(className);
                            regiVO.setAccount_no(accNo);
                            regiVO.setAccount_type("Income");
                            regiVO.setItem_no(itemNo);
                            regiVO.setSub_account_no(subAccNo);
                            regiVO.setPayment_id(paymentId);
                            
                            session.setAttribute("activityValue",regiVO);
                            Debug.print("activityValue set");
                        }
                    }                    
                    
                    
                    
                   /* boolean result =false;
                    StringBuffer reqURL = request.getRequestURL();
                    int lastIndex = reqURL.lastIndexOf("/") ;
                    String url ="";
                    if(lastIndex!=-1){
                        url = reqURL.substring(0,lastIndex+1);
                    }
                    String tmpNova = mr.getMessage("acmAddtnlTckt.nova");
                    String nova = url + tmpNova;
                    Debug.print("Nova Value: "+nova);
                    request.setAttribute("nova",nova);*/
                    
                                       
                     String inVId = request.getParameter("inVoiceId");
                System.out.println("inVId in servlet from request: " + inVId);
                int intVId = 1;
//                if (inVoiceId1.equalsIgnoreCase("0")) {
//                    intVId = 1;
//                } else {
//                    intVId = 1;
 //               }
                request.setAttribute("AMT", request.getParameter("totalAmount"));
                request.setAttribute("PAYMENTACTION", "Authorization");
                request.setAttribute("CREDITCARDTYPE", request.getParameter("ccType"));
                request.setAttribute("ACCT", request.getParameter("ccNumber"));
                request.setAttribute("EXPDATE", expDate);
                request.setAttribute("IPADDRESS", reqIp);
                request.setAttribute("FIRSTNAME", request.getParameter("ccName"));
                request.setAttribute("CVVNo", request.getParameter("ccCvvid"));
                request.setAttribute("STREET", "1 Main St");
                request.setAttribute("CITY", "San Jose");
                request.setAttribute("STATE", "CA");
                request.setAttribute("ZIP", "95131");
                request.setAttribute("COUNTRYCODE", "US");
                request.setAttribute("EMAIL", emailId);
                session.setAttribute("objPayment", objPayment1);

                request.setAttribute("purpose", "purchasingTickets");
                //intVId++; 
                request.setAttribute("intVId", String.valueOf(intVId));
                System.out.println("intVId in servlet InsertHorseRegAction &&&&&&&" + intVId);

                   session.setAttribute("objPaymentVO",objPayDet);
                   session.setAttribute("objPay",objPayment);
                    
               //     Debug.print("Sucessfully Payment objPaymentList:" + objPayment.toString());
                   
                   return new ModelAndView("testpaypal");
                    
                } 
                else{
                    String userId = (String) session.getAttribute("userId");
                    String totTckts = request.getParameter("totTckt");
                    String totAmt = request.getParameter("totalAmount");
                    //String paymentId = vaigaiMeetingBean.getNextId();
                    Debug.print("New Payment Id generated is "+paymentId);
                    HLCAdditionalTcktVO tcktVO = new HLCAdditionalTcktVO();
                    tcktVO.setUser_id(userId);
                    tcktVO.setTickets(ticket);
                    tcktVO.setNo_of_tickets(totTckts);
                    tcktVO.setRegi_Amount(totAmt);
                    tcktVO.setMember_type_id(memberShipTypeID);
                    tcktVO.setPaymentId(paymentId);
                    tcktVO.setPriceIds(ids);
                    
                    boolean result1  = paymentBean.createPayment(objPayDet);
                    String logBy="user";
                                     
                    String meetingId = vaigaiMeetingBean.registerAdditionalTickets(tcktVO);
                    Debug.print("Confirmation page "+meetingId);
                    session.setAttribute("amount",String.valueOf(totAmt));
                    session.setAttribute("payId",paymentId);
                    session.setAttribute("bdgeNme","N/A");
                    session.setAttribute("meetId",meetingId);
                    String tktactivityId = request.getParameter("tktactivityId");
                    Debug.print("tktactivityId is "+tktactivityId);
                    if(tktactivityId!=null){
                        if(tktactivityId!=null || tktactivityId.trim().length()!=0){
                            
                            HLCAccTxnTypeDetailVO accTxnDet = mahanadhiBean.selectAccTransactionTypeDetail(tktactivityId);
                            HLCAccTransactionVO regiVO = new HLCAccTransactionVO();
                            
                            String accNo =  accTxnDet.getAccount_no();
                            String className = accTxnDet.getClass_name();
                            String itemNo = accTxnDet.getItem_no();
                            String subAccNo = accTxnDet.getSub_account_no();
                            String transName = accTxnDet.getTransaction_name();
                            String transType = accTxnDet.getTransaction_type();
                            
                            if(r11.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("ccType");
                                regiVO.setPayment_mode(cardselect);
                                regiVO.setActive_status(false);
                            }
                            else{
                               // Setting staff user_id and ip_address 
                                if(session.getAttribute("loggedBy")!=null)
                                {
                                    String loggedBy="";
                                    loggedBy=(String)session.getAttribute("loggedBy");
                                    logBy=loggedBy;

                                       regiVO.setStaff_user_id(staff_user_id);
                                       regiVO.setStaff_ip_address(reqIp);
                                }
                                regiVO.setPayment_mode("check");
                                regiVO.setActive_status(false);                                
                                //End Setting staff_user_id and ip_address
                            }
                            
                            regiVO.setAmount(Float.parseFloat(totAmt));
                            regiVO.setDescription(transName);
                            regiVO.setClass_Typ(className);
                            regiVO.setAccount_no(accNo);
                            regiVO.setAccount_type("Income");
                            regiVO.setItem_no(itemNo);
                            regiVO.setSub_account_no(subAccNo);
                            regiVO.setPayment_id(paymentId);
                            
                            boolean insert_status = mahanadhiBean.insertAccountTxnDetails(regiVO);
                            Debug.print("Insert Status "+insert_status);                                
                        }
                    }
                    
                    if(session.getAttribute("loggedBy")!=null) {
                        String loggedBy="";
                        loggedBy=(String)session.getAttribute("loggedBy");
                        logBy=loggedBy;
                        
                            Debug.print("Inside admin login Section");
                            String chckAmount = request.getParameter("chkAmt");
                            String totalAmount1 = request.getParameter("totalAmount");
                            
                            if(chckAmount!=null && totalAmount1!=null){
                                Debug.print("!=null Section");
                                tcktVO.setRegi_Amount(chckAmount);
                                
                                if(chckAmount.trim().length()!=0 && totalAmount1.trim().length()!=0){
                                    float chkAmt = Float.parseFloat(chckAmount);
                                    float totAmt1 = Float.parseFloat(totalAmount1);
                                    float extraAmt = chkAmt - totAmt1;
                                    Debug.print("chkAmt is "+chkAmt);
                                    Debug.print("totAmt1 is "+totAmt1);
                                    Debug.print("extraAmt is "+extraAmt);
                                    
                                    if(extraAmt > 0){
                                        boolean update_refund = kaveryStatfulBean.updatePendingAmount(userId,paymentId,chkAmt);
                                        Debug.print("update_refund is "+update_refund);
                                        HLCAccTxnTypeDetailVO overpayDet = mahanadhiBean.getOverPayAccTransactionTypeDetail();
                                        HLCAccTransactionVO overpayfinalDet = new HLCAccTransactionVO();
                                        
                                        String accNo = overpayDet.getAccount_no();
                                        String accClassname = overpayDet.getClass_name();
                                        String accItemNo = overpayDet.getItem_no();
                                        String accAccNo = overpayDet.getSub_account_no();
                                        String accTranName = overpayDet.getTransaction_name();
                                        String accTyped = overpayDet.getTransaction_type();
                                        String accTypeId = overpayDet.getTransaction_type_id();
                                        String description = overpayDet.getTransaction_name();
                                        Debug.print("While getting"+ overpayDet.toString());
                                        
                                        overpayfinalDet.setAccount_no(accNo);
                                        overpayfinalDet.setAccount_type("Income");
                                        overpayfinalDet.setAccount_no(accNo);
                                        overpayfinalDet.setClass_Typ(accClassname);
                                        overpayfinalDet.setPayment_id(paymentId);
                                        overpayfinalDet.setSub_account_no(accAccNo);
                                        overpayfinalDet.setItem_no(accItemNo);
                                        overpayfinalDet.setAmount(extraAmt);
                                        overpayfinalDet.setTransaction_id(accTypeId);
                                        overpayfinalDet.setDescription(description);
                                        
                                        String pay_mode=request.getParameter("r11");
                                        
                                        if(pay_mode!=null && pay_mode.trim().length()>0){
                                            if(pay_mode.equalsIgnoreCase("check")){
                                                overpayfinalDet.setPayment_mode("check");
                                                overpayfinalDet.setActive_status(false);
                                            }
                                        }
                                        // Setting staff user_id and ip_address 
                                        overpayfinalDet.setStaff_user_id(staff_user_id);
                                        overpayfinalDet.setStaff_ip_address(reqIp);                                        
                                        //End Setting staff_user_id and ip_address                                        
                                        Debug.print("B4 insert "+ overpayfinalDet.toString());
                                        boolean extraPay = mahanadhiBean.insertAccountTxnDetails(overpayfinalDet);
                                    }
                                    
                                    if(extraAmt >= 0){
                                        if(paymentId!=null || paymentId.trim().length()!=0){
                                            boolean Update_Status = mahanadhiBean.updateRecouncilActiveStatusAccTxnDetails(paymentId);
                                            Debug.print("Update Status "+Update_Status);
                                        }
                                        //  meetingId,status,comments
                                        Debug.print("Status change for the annual meeting by admin loggin ");
                                        boolean status_Change = vaigaiMeetingBean.updateAnnualStatus(meetingId,"Active","HLC Staff Activation");
                                        Debug.print("status_Change is "+status_Change);
                                    }
                                }
                            }
                    }
                    
                    if(meetingId!=null && meetingId.trim().length()!=0){

                                         String toMailIds[] = {emailId};

                                        EmailContent email = new EmailContent();
                                        email.setTo(toMailIds);
                                        email.setFrom("info@hlc.com");
                                        email.setSubject("Annual Meeting & Convention Registration");

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
                                           "<p>Dear User,"+

                        "You have successfully registered with United States Eventing Association for all "+
                        "the Annual Convention Registration that are to be held! Your application would be verified and processed within"+
                        "24 hours."+
                        "Thank you for using this service.<p>"+

                                             "Thank You <br />"+
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
                                                    "per your �Role� assigned:"+

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
                                                    //boolean emailFlag = emailEngine.sendEmailWithAttachment(email);
                                                    Debug.print("Email sent sucessfully :"+emailFlag);
                                                    
                        session.setAttribute("paymode","CheckPay");
                        return new ModelAndView("frmAdditonalAnnualPayCnf");
                    }
                    else{
                    	return new ModelAndView("login");
                    }
                }
            }
        }
        return null;
    }
       
       
}

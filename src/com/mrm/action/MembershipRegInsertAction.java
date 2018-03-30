/*
 * MembershipRegInsertAction.java
 *
 * Created on October 8, 2006, 3:41 PM
 */

package com.mrm.action;

import com.hlcaccounts.session.*;
import com.hlcaccounts.util.HLCAccTransactionVO;
import com.hlcaccounts.util.HLCAccTxnTypeDetailVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcform.util.HLCMemberDetails;
import com.hlcform.util.HLCMemberHistoryDetail;
import com.hlcform.util.HLCPaymentDetails;
import com.hlccommon.util.Debug;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulBean;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemote;
import com.hlckavery.statful.HLCKaverySessionBeanStatfulRemoteHome;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemote;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemoteHome;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.StringTokenizer;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.aspectj.weaver.patterns.ParserException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcform.util.HLCUserMaster;
import com.hlcform.util.HLCContactDetails;
import com.hlcrole.management.*;

/**
 *
 * @author karthikeyan
 * @version
 */

public class MembershipRegInsertAction implements Controller{
    
    
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
			IOException, ParserConfigurationException, SAXException, ParseException{
        
        String fwd="";
        String actStat=null;
        Date act_date_card = new Date();
        //MessageResources mr=getResources(request);
        
        String reqIp=request.getRemoteAddr();
        Debug.print(" Request IP :"+reqIp);
        
        //String defrole=mr.getMessage("default.role");
        String defrole= "bc559b5e-3aaf-47c4-8560-d10197c86119";
        Debug.print("defrole :" +defrole);
        
        
        
        HLCMemberDetails objMember = new HLCMemberDetails();
        HLCPaymentDetails objPayment = new HLCPaymentDetails();
        HLCUserMaster objUserMaster=new HLCUserMaster();
        HLCContactDetails objContactDetail=new HLCContactDetails();
        
       
        HLCkaverystatelessBean remote = new HLCkaverystatelessBean();
        HLCKaverySessionBeanStatfulBean kaveryRemote = new HLCKaverySessionBeanStatfulBean();
        HLCKaveryMembershipTypeSessionBean memberRemote = new HLCKaveryMembershipTypeSessionBean();
        HLCBrahmaputraSessionBean roleRemote = new HLCBrahmaputraSessionBean();
        HLCMahanadhiSessionBean mahaRemote =new HLCMahanadhiSessionBean();
        
        HttpSession session=request.getSession();
        String userId=(String)session.getAttribute("userId");
        String membId=(String)session.getAttribute("memberId");
        
        String staff_user_id = (String) session.getAttribute("staff_user_id");
        
        String paymentId ="";      
        paymentId = remote.getNextId();
        Debug.print("paymentId in member insert servlet :"+paymentId);
        
        String membtypsel=request.getParameter("selDisp");
        System.out.println("membership Type Selected :" +membtypsel);
        
       /* String nonhlcTyp=request.getParameter("memType2");
        System.out.println("nonhlcmembership Type Selected :" +nonhlcTyp);
        
        String donAmtSel=request.getParameter("donAmt_sel");
        System.out.println("Donation Amt Selected :" +donAmtSel);
        
        String ctrymailSel=request.getParameter("mailAddr");
        System.out.println("Country Mail Type Selected :" +ctrymailSel);*/
        
        objPayment.setIpAddress(reqIp);
        
        String r11=request.getParameter("r11");
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
        String donAmt=null;
        
      
        
        ArrayList historyTable = new ArrayList();
        String sessfamembId = request.getParameter("famembId");
        Debug.print("sessfamembId   is   "+sessfamembId);
        session.setAttribute("sessfamembId",sessfamembId);
        String newMemberId = "";
        String[] memberType=null;
        String accMembTypeId=null;
        String MembTypeName = "";
        //String[] nonhlcmemberType=null;
        // String[] ctryMail=null;
        
        if(membtypsel!=null) {
            if(!membtypsel.equals("0")) {
                memberType=membtypsel.split("#");
                
                objMember.setMembershipTypeId(memberType[0]);
                objMember.setMembershipTypeName(memberType[1]);
                System.out.println("Inside membershipregInsertAction++++++++++++++++"+memberType[0]);
                Debug.print("objMember.setMembershipTypeId ",objMember.getMembershipTypeId());
                Debug.print("objMember.setMembershipTypeName ",objMember.getMembershipTypeName());
                
                accMembTypeId = memberType[0];
                MembTypeName = memberType[1];
            }
        }
        
       /* String amatCrd=request.getParameter("amatCrd");
        Debug.print("amatCrd :"+amatCrd);
        objMember.setUsefAmateur(amatCrd);*/
        
        String armbandQty=request.getParameter("armbandQty");
        Debug.print("armbandQty :"+armbandQty);
        objMember.setArmbandQty(armbandQty);
        Debug.print("objMember.setArmbandQty(armbandQty) :"+objMember.getArmbandQty());
        
        String nameAmatMemb=request.getParameter("nameAmat");
        Debug.print("nameAmatMemb :"+nameAmatMemb);
        
        String amatCrdPossMemb=request.getParameter("amatCrdPoss");
        Debug.print("amatCrdPossMemb :"+amatCrdPossMemb);
        
        boolean amatCrdPossMembStatus;
        
        if(amatCrdPossMemb!=null) {
            amatCrdPossMembStatus=true;
            
        } else {
            amatCrdPossMembStatus=false;
        }
        Debug.print("amatCrdPossMembStatus :"+amatCrdPossMembStatus);
        
        String amatCrdEligMemb=request.getParameter("amatCrdElig");
        Debug.print("amatCrdEligMemb :"+amatCrdEligMemb);
        
        boolean amatCrdEligMembStatus;
        
        if(amatCrdEligMemb!=null) {
            amatCrdEligMembStatus=true;
            Debug.print("amatCrdEligMembStatus :"+amatCrdEligMembStatus);
        } else {
            amatCrdEligMembStatus=false;
        }
        Debug.print("amatCrdEligMembStatus :"+amatCrdEligMembStatus);
        
        objMember.setAmateurName(nameAmatMemb);
        objMember.setAmateurDec1(amatCrdPossMembStatus);
        objMember.setAmateurDec2(amatCrdEligMembStatus);
        
       /* if(nonhlcTyp!=null)
        {
        if(!nonhlcTyp.equals("0"))
        {
             nonhlcmemberType=nonhlcTyp.split("#");
        
        }
        }
        
         if(ctrymailSel!=null)
        {
        if(!ctrymailSel.equals("0"))
        {
            ctryMail=ctrymailSel.split("#");
        
        }
        }*/
        
        /*
         * Insertion for Junior Member, Non-Competing Member, Family Member & Subscribing Member
         
         
        if(memberType[1].equalsIgnoreCase("Junior Member") || memberType[1].equalsIgnoreCase("Non-Competing Member") || memberType[1].equalsIgnoreCase("Subscribing Member") || memberType[1].equalsIgnoreCase("family member"))
        {*/
        
        String loginName=(String)session.getAttribute("loginName");
        Debug.print("loginName from session :"+loginName);
        
        objMember.setLoginName(loginName);
        
             /*String nonusesmemId=request.getParameter("nonhlcmemid");
              
               if(nonhlcTyp==null || nonhlcTyp.equals("0"))
               {
                    objMember.setNonUseaOrgMemberId(null);
                    objMember.setNonhlcOrgId(null);
                    objMember.setNonhlcOrgName(null);
              
               }
               else
               {
                  objMember.setNonUseaOrgMemberId(nonusesmemId);
                  objMember.setNonhlcOrgId(nonhlcmemberType[0]);
                  objMember.setNonhlcOrgName(nonhlcmemberType[1]);
               }
              
              if(donAmt!=null)
              {
                objMember.setEndowmentTrustAmount(donAmt);
              }
              else
              {
                objMember.setEndowmentTrustAmount("0");
              }*/
        
        if(request.getParameter("memberid")!=null && request.getParameter("memberid").trim().length()!=0) {
            String pmembId=request.getParameter("memberid");
            objMember.setParentMemberId(pmembId);
        } else {
            objMember.setParentMemberId(null);
        }
        
             /* if(ctrymailSel==null || ctrymailSel.equals("0"))
                {
                 objMember.setCountryMailTypeId(null);
                 objMember.setCountryMailTypeName(null);
              }
              else
              {
               objMember.setCountryMailTypeId(ctryMail[0]);
               objMember.setCountryMailTypeName(ctryMail[1]);
              }*/
        
        String emailIdSes=(String)session.getAttribute("emailId");
        objMember.setEmailId(emailIdSes);
        
        objMember.setUserId(userId);
        Debug.print("userId from session :"+userId);
        
              /*Vector usr=new Vector();
              usr=remote.getUserIdByLoginName(logName);
               
              String[] usrId=(String[])usr.elementAt(0);
              Debug.print("usrId for login name"+logName+" :"+usrId[0]);
              objMember.setUserId(usrId[0]);*/
        
        
                       /*
                        * payment details
                        */
        
        objMember.setPaymentId(paymentId);
        
        objPayment.setPaymentId(paymentId);
        session.setAttribute("histpayId",paymentId);
        
        double chk_amt=0;
        
        // -------------------------- choose for payment mode check -----------------------
        
        Date check_date=null;
        
        if(r11.equalsIgnoreCase("check")){
            
            if(request.getParameter("checkDate")!=null && request.getParameter("checkDate").trim().length()!=0) {
                check_date = (Date)sdf.parse(request.getParameter("checkDate"));
                Debug.print("check_date :"+check_date.toString());
            } else {
                check_date =null;
            }
            
            objPayment.setUserId(userId);
            objPayment.setCcName(null);
            objPayment.setCcType(null);
            objPayment.setCcNumber("0");
            objPayment.setCcExpMonth(0);
            objPayment.setCcExpYear(0);
            objPayment.setCcCvvid(0);
            objPayment.setBankName(request.getParameter("inFavorof"));
            objPayment.setCheckDate(check_date);
            
            if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                //objPayment.setCheckAmount(Float.valueOf(request.getParameter("chckAmount")).floatValue());
                
                Debug.print("request.getParameter(chckAmount) :"+request.getParameter("chckAmount"));
                
                chk_amt=Double.valueOf(request.getParameter("chckAmount")).doubleValue();
                Debug.print("Double.valueOf(request.getParameter(chckAmount)).doubleValue() :"+chk_amt);
                
                String comment="Excess Check Payment Done For Membership Registration";
                
                float chkAmt=Float.valueOf(request.getParameter("tot_amt")).floatValue();
                
                    /*boolean refundStat=kaveryRemote.createMembershipRefundDetails(userId,comment,chkAmt,objPayment.getCheckAmount());
                     
                    Debug.print("kaveryRemote.createMembershipRefundDetails() :"+refundStat);*/
                
            } else {
                objPayment.setCheckAmount(0);
            }
            
            if(request.getParameter("checkNo")!=null && request.getParameter("checkNo").trim().length()!=0) {
                objPayment.setCheckNumber(request.getParameter("checkNo"));
            } else {
                objPayment.setCheckNumber("0");
            }
            
            if(request.getParameter("tot_amt")!=null && request.getParameter("tot_amt").trim().length()!=0) {
                objPayment.setAmount(Double.valueOf(request.getParameter("tot_amt")).doubleValue());
            } else {
                objPayment.setAmount(0);
            }
            
            String nameOnchk=request.getParameter("nameOnchk");
            
            objPayment.setCheckName(nameOnchk);
            
            objPayment.setPaymentDate(new Date());
            
            objPayment.setPaymentStatus("check");
            
        }
        
        
        //------------------------- choose for payment mode card ------------------------
        
        int CcExpMonth = 0;
        int CcExpYear = 0;
        int CcCvvid =0;
        double amount =0;
        long CcNumber = 0;
        long checkNumber=0;
        
        
        
        Date comp_date = null;
        String ccType=null;
        String ccName=null;
        
        if(r11.equalsIgnoreCase("card")){
            
            
            objPayment.setUserId(userId);
            
            Debug.print("inside payment card select ......"+objPayment.getUserId());
            Debug.print("inside payment card select ......"+objPayment);
            
            if(request.getParameter("printName")!=null && request.getParameter("printName").trim().length()!=0) {
                objPayment.setCcName(request.getParameter("printName"));
            } else {
                objPayment.setCcName(null);
            }
            
            if(request.getParameter("cardselect")!=null && request.getParameter("cardselect").trim().length()!=0) {
                objPayment.setCcType(request.getParameter("cardselect"));
            } else {
                objPayment.setCcType(null);
                
            }
            
            if(request.getParameter("cardNo")!=null && request.getParameter("cardNo").trim().length()!=0) {
                objPayment.setCcNumber(request.getParameter("cardNo"));
            } else {
                objPayment.setCcNumber("0");
            }
            
            if(request.getParameter("expirymonth")!=null && request.getParameter("expirymonth").trim().length()!=0) {
                objPayment.setCcExpMonth(Integer.parseInt(request.getParameter("expirymonth")));
            } else {
                objPayment.setCcExpMonth(0);
            }
            
            if(request.getParameter("expiryyear")!=null && request.getParameter("expiryyear").trim().length()!=0) {
                objPayment.setCcExpYear(Integer.parseInt(request.getParameter("expiryyear")));
            } else {
                objPayment.setCcExpYear(0);
            }
            
            if(request.getParameter("cVVNo")!=null && request.getParameter("cVVNo").trim().length()!=0) {
                if(!request.getParameter("cVVNo").equals("")) {
                    objPayment.setCcCvvid(Integer.parseInt(request.getParameter("cVVNo")));
                    request.setAttribute("chkDigit",request.getParameter("cVVNo"));
                } else {
                    objPayment.setCcCvvid(0);
                    request.setAttribute("chkDigit","0");
                }
            } else {
                objPayment.setCcCvvid(0);
                request.setAttribute("chkDigit","0");
            }
            
            objPayment.setBankName(null);
            
            objPayment.setCheckDate(null);
            objPayment.setCheckNumber("0");
            objPayment.setCheckName(null);
            objPayment.setCheckAmount(0);
            
            if(request.getParameter("tot_amt")!=null && request.getParameter("tot_amt").trim().length()!=0) {
                objPayment.setAmount(Double.valueOf(request.getParameter("tot_amt")).doubleValue());
            } else {
                objPayment.setAmount(0);
            }
            
            objPayment.setPaymentDate(new Date());
            objPayment.setPaymentStatus("card");
            
            if(request.getParameter("activeDate2")!=null && request.getParameter("activeDate2").trim().length()!=0) {
                act_date_card = (Date)sdf.parse(request.getParameter("activeDate2"));
            }
            
            Debug.print("final act_date for card mode :"+act_date_card.toString());
            
            Debug.print("inside payment card final ......"+objPayment.getAmount());
            
            session.setAttribute("act_date",act_date_card);
        }
        
        
              /*
               * Block for Deleting Family Add-ons if request is from renewal form
               */
        String result ="";
        
        String renstat=request.getParameter("renstat");
        session.setAttribute("renstat",renstat);
        
        System.out.print("objPayment in servlet main :"+objPayment);
        
        if(renstat!=null) {
            System.out.println("inside member renewal block........ ");
            
            String renStat=request.getParameter("rr21");
            Debug.print("renStat :"+renStat);
            
            session.setAttribute("renStat",renStat);
            
            
            
            if(renStat.equalsIgnoreCase("renew")) {
                String renDate="Renewal Date :";
                session.setAttribute("regStatus",renDate);
            }
            
            if(renStat.equalsIgnoreCase("upgrade")) {
                String renDate="Upgrade Date :";
                session.setAttribute("regStatus",renDate);
            }
            
            if(renStat.equalsIgnoreCase("downgrade")) {
                String renDate="Downgrade Date :";
                session.setAttribute("regStatus",renDate);
            }
            
            if(renStat.equalsIgnoreCase("renew") || renStat.equalsIgnoreCase("downgrade")) {
                objMember.setRenewalStatus(true);
                Debug.print("::::::: objMember.setRenewalStatus(true) block ::::::::");
            } else {
                objMember.setRenewalStatus(false);
                Debug.print("::::::: objMember.setRenewalStatus(false) block ::::::::");
            }
            
            if(renStat.equalsIgnoreCase("renew")) {
                String mTypId=request.getParameter("memberTypeId");
                String mTypName=request.getParameter("membershipName");
                
                objMember.setMembershipTypeId(mTypId);
                objMember.setMembershipTypeName(mTypName);
                
                Debug.print("::::::: objMember.getMembershipTypeId(mTypId) for renewal ::::::::"+objMember.getMembershipTypeId());
                Debug.print("::::::: objMember.getMembershipTypeName(mTypName) for renewal ::::::::"+objMember.getMembershipTypeName());
                
                MembTypeName = mTypName;
            }
            
            if(r11.equalsIgnoreCase("check")) {
                
                boolean nonUseaStat=remote.deleteNonUseaPriceDetails(membId);
                Debug.print("remote.deleteNonUseaPriceDetails(membId) for member id :"+membId+" :" +nonUseaStat);
                
                
                    /*boolean delDonStat=remote.deleteDonationPriceDetails(userId);
                    Debug.print("remote.deleteDonationPriceDetails(userId) for userId :"+userId+" :" +delDonStat);*/
                
                boolean pubDelStat=remote.deletePublicationDetails(membId);
                Debug.print("remote.deletePublicationDetails(membId) for member id :"+membId+" :" +pubDelStat);
            }
            
            String[] pubId=request.getParameterValues("mailOpt1");
            Debug.print("pubId :" +pubId);
            
            ArrayList pubDet=new ArrayList();
            
            if(pubId!=null) {
                Debug.print("pubId.length :" +pubId.length);
                
                for(int i=0;i<pubId.length;i++) {
                    if(r11.equalsIgnoreCase("check")) {
                        boolean pubStat=remote.insertPublicationDetails(membId,pubId[i]);
                        Debug.print("remote.insertPublicationDetails() for member id :"+membId+" publication id : "+pubId[i]+" Status :" +pubStat);
                    }
                    
                    String[] pubIds={membId,pubId[i]};
                    pubDet.add(pubIds);
                }
            }
            
            String subsMailExist = request.getParameter("subsMailExist");
            Debug.print("subsMailExist "+subsMailExist);
            if(subsMailExist!=null){
                Debug.print("subsMailExist ! null");
                int val = Integer.parseInt(subsMailExist);
                Debug.print("val is "+val);
                if(val==1){
                    String[] publId = request.getParameterValues("submailOpt1");
                    if(publId!=null){
                        Debug.print(" publId length "+publId.length);
                        for(int i=0;i<publId.length;i++){
                            if(r11.equalsIgnoreCase("check")) {
                                boolean pubStat=remote.insertPublicationDetails(membId,publId[i]);
                                Debug.print("remote.insertPublicationDetails() for member id :"+membId+" publication id : "+publId[i]+" Status :" +pubStat);
                            }
                            Debug.print("member Id "+membId);
                            String[] pubIds={membId,publId[i]};
                            pubDet.add(pubIds);
                        }
                    }
                }
            }
            
            if(r11.equalsIgnoreCase("card")) {
                session.setAttribute("pubDet",pubDet);
            }
            
                    /*
                     * Family add-on upgrade / remove block
                     */
            
            if(objMember.getMembershipTypeName().equalsIgnoreCase("Full Member") || objMember.getMembershipTypeName().equalsIgnoreCase("Life Member")) {
                
                String count=request.getParameter("cbxct");
                
                ArrayList updateFam=new ArrayList();
                ArrayList delFam=new ArrayList();
                
                if(count!=null) {
                    
                    int cbxct=Integer.parseInt(count);
                    
                    for(int x=0;x<cbxct;x++) {
                        String cbname="cbx"+x;
                        Debug.print("cbname :"+cbname);
                        
                        String cbx=request.getParameter(cbname);
                        System.out.println("Inside loop of add-on Value Check bx Mem-Id :"+cbx);
                        
                        if(cbx==null) {
                            String mids="mid"+x;
                            String mid=request.getParameter(mids);
                            // System.out.println("mid :" +mid);
                            
                            
                            
                            System.out.println("Inside Delete Block on add-on for Member id :"+mid);
                            
                            if(r11.equalsIgnoreCase("check")) {
                                boolean stat=remote.deleteMemberDetail(mid);
                                System.out.println("Deletion of add-on "+x+" Status :" +stat);
                            }
                            
                            delFam.add(mid);
                            
                            
                            
                        } else {
                            System.out.println("Inside Update Block on add-on for Member id :" +cbx);
                            
                            if(r11.equalsIgnoreCase("check")) {
                                boolean sta=remote.updateFamilyMemeber(cbx,objMember.getPaymentId());
                                System.out.println("Update of add-on "+x+" Status :" +sta);
                                /// Update History Details
                                Debug.print("Line 696:");
                                
                                String famembId1 = request.getParameter("famembId");
                                Debug.print("famembId   is   "+famembId1);
                                String useId =remote.getUserIdBasedOnMemberId(cbx);
                                
                                String[] historyEntry = {renStat,useId,famembId1,"Family Member",cbx};
                                Debug.print("historyEntry 1: "+historyEntry);
                                historyTable.add(historyEntry);
                                
                                // End Update History Details
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                
                                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                        
                                        if(objPayment.getAmount()<=chk_amt) {
                                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                            
                                            boolean stat=memberRemote.editMemberStatus("Active",cbx);
                                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            
                                        }
                                        
                                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                        Debug.print("act_date :"+act_date.toString());
                                        
                                        boolean actDat=remote.updateApprovalDate(cbx,act_date);
                                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                        
                                    }
                                }
                                
                            }
                            updateFam.add(cbx);
                            
                            
                        }
                        
                        
                    }
                    
                    if(r11.equalsIgnoreCase("card")) {
                        session.setAttribute("delFam",delFam);
                        session.setAttribute("updateFam",updateFam);
                    }
                    
                }
                
                
            }
            
            objMember.setMemberId(membId);
            objMember.setUserId(userId);
            objMember.setFamilyAddOns("0");
            objMember.setPaymentId(paymentId);
            //session.setAttribute("histPayId",paymentId);
            Debug.print("objMember.setPaymentId(paymentId) :"+paymentId);
            
            session.setAttribute("objMember",objMember);
                     /* boolean udate=remote.editMemberDetail(objMember);
                      System.out.println("Updation of Member Detail Status :" +udate);*/
            String res=(String)session.getAttribute("memberId");
            
            if(r11.equals("card")){
                objPayment.setUserId(userId);
                session.setAttribute("objPayment",objPayment);
                session.setAttribute("objMember",objMember);
                
                System.out.println("Inside Edit Member Registration with Credit Card:");
                objMember.setPaymentId(paymentId);
                
                
                Debug.print("objMemDet.getAmateurName() : "+objMember.getAmateurName());
                Debug.print("objMemDet.isAmateurDec1() : "+objMember.isAmateurDec1());
                Debug.print("objMemDet.isAmateurDec2(): "+objMember.isAmateurDec2());
                
                Debug.print("remote.getExpiredDate(res)   :"+remote.getExpiredDate(res));
                //  boolean udate=remote.editMemberDetail(objMember);
                // System.out.println("Updation of Member Detail Status in credit card :" +udate);
                           /*if(request.getParameter("futurePrice")!=null && request.getParameter("futurePrice").trim().length()!=0){
                               Debug.print("res is "+res);
                               float futPrice = (Float.parseFloat(request.getParameter("futurePrice")));
                               if(futPrice>0){
                                    String newYear = request.getParameter("newYear");
                                    String[] dte = remote.getExpiredDate(res).split("-");
                                    dte[0] = newYear;
                                    String yr = dte[0]+"-"+dte[1]+"-"+dte[2];
                                    session.setAttribute("exp_date",yr);
                               }
                               else{
                                   session.setAttribute("exp_date",remote.getExpiredDate(res));
                               }
                           }
                           else{*/
                session.setAttribute("exp_date",remote.getExpiredDate(res));
                //  }
                session.setAttribute("objMember",objMember);
                
            } else{
                
                Debug.print("objMemDet.getAmateurName() : "+objMember.getAmateurName());
                Debug.print("objMemDet.isAmateurDec1() : "+objMember.isAmateurDec1());
                Debug.print("objMemDet.isAmateurDec2(): "+objMember.isAmateurDec2());
                
                boolean udate=remote.editMemberDetail(objMember);
                System.out.println("Updation of Member Detail Status :" +udate);
                String tempMid=(String)session.getAttribute("memberId");
                
                Debug.print("Line 803:");
                String memTId = objMember.getMembershipTypeId();
                String memTname = objMember.getMembershipTypeName();
                String useId = objMember.getUserId();
                String[] historyEntry = {renStat,useId,memTId,memTname,objMember.getMemberId()};
                Debug.print("historyEntry 2 "+historyEntry);
                historyTable.add(historyEntry);
                
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                
                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                        
                        if(objPayment.getAmount()<=chk_amt) {
                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                            
                            boolean stat=memberRemote.editMemberStatus("Active",tempMid);
                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                            
                            actStat="Active";
                            
                        }
                        
                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                        Debug.print("act_date :"+act_date.toString());
                        
                        boolean actDat=remote.updateApprovalDate(tempMid,act_date);
                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                        
                    }
                }
                
                boolean pstat=remote.addPaymentDetails(objPayment);
                System.out.println("Inside Edit Member Registration with Check:" + pstat);
                
                request.setAttribute("memberId",session.getAttribute("memberId"));
                request.setAttribute("membTyp",objMember.getMembershipTypeName());
                request.setAttribute("chk_no",objPayment.getCheckNumber());
                request.setAttribute("tot_amt",Double.toString(objPayment.getAmount()));
                request.setAttribute("actStat",actStat);
                
                session.setAttribute("exp_date",remote.getExpiredDate(res));
                
            }
        } else{
            System.out.print("objPayment in servlet 1 :"+objPayment.getAmount());
            
            if(r11.equals("card")){
                objPayment.setUserId(null);
                
                //result = remote.addMemberDetails(objMember,objPayment);
                
                //session.setAttribute("memberId",result);
                
                objPayment.setUserId(userId);
                session.setAttribute("objPayment",objPayment);
                session.setAttribute("objMember",objMember);
                
                System.out.print("objPayment in servlet :"+objPayment.getAmount());
                
                System.out.println("Inside Add New Member Registration with Credit Card:" + result);
                
                String[] pubId=request.getParameterValues("mailOpt1");
                Debug.print("pubId :" +pubId);
                
                ArrayList pubDet=new ArrayList();
                
                if(pubId!=null) {
                    Debug.print("pubId.length :" +pubId.length);
                    
                    for(int i=0;i<pubId.length;i++) {
                        
                               /*   if(r11.equalsIgnoreCase("check"))
                                {
                                  boolean pubStat=remote.insertPublicationDetails(result,pubId[i]);
                                  Debug.print("remote.insertPublicationDetails() for member id :"+result+" publication id : "+pubId[i]+" Status :" +pubStat);
                                }*/
                        
                        String[] pubIds={membId,pubId[i]};
                        pubDet.add(pubIds);
                    }
                    
                }
                
                String subsMailExist = request.getParameter("subsMailExist");
                Debug.print("subsMailExist 934 "+subsMailExist);
                if(subsMailExist!=null){
                    Debug.print("subsMailExist ! null");
                    int val = Integer.parseInt(subsMailExist);
                    Debug.print("val is "+val);
                    if(val==1){
                        String[] publId = request.getParameterValues("submailOpt1");
                        if(publId!=null){
                            Debug.print(" publId length "+publId.length);
                            for(int i=0;i<publId.length;i++){
                                if(r11.equalsIgnoreCase("check")) {
                                    boolean pubStat=remote.insertPublicationDetails(membId,publId[i]);
                                    Debug.print("remote.insertPublicationDetails() for member id :"+membId+" publication id : "+publId[i]+" Status :" +pubStat);
                                }
                                Debug.print("member Id "+membId);
                                String[] pubIds={membId,publId[i]};
                                pubDet.add(pubIds);
                            }
                        }
                    }
                }
                
                //session.setAttribute("exp_date",remote.getExpiredDate(result));
                session.setAttribute("pubDet",pubDet);
                
            } else{
                Debug.print("objMember memType Id "+objMember.getMembershipTypeId());
                Debug.print("objMember memType name "+objMember.getMembershipTypeName());
                MembTypeName = objMember.getMembershipTypeName();
                Debug.print("addMemberDetails 1");
                result = remote.addMemberDetails(objMember,objPayment);
                System.out.println("Inside Add  New Member Registration with Check mode :" + result);
                Debug.print("memID in servlet:"+result);
                String[] userDet=remote.getUserDetailsForEmail(userId);
                String memTypeName=objMember.getMembershipTypeName();
                if(result!=null){
                        String emailId = (String)session.getAttribute("emailId");
                        String toMailIds[] = {emailId};
                        EmailContent email=new EmailContent();
                        email.setTo(toMailIds);
                        email.setFrom("anandv@digiblitz.com");
                        email.setSubject("Your Registration Status");

                        if(memTypeName.equalsIgnoreCase("Full Member") || memTypeName.equalsIgnoreCase("Junior Member") || memTypeName.equalsIgnoreCase("Life Member")){
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
                                "<span class=\"boldTxt\">Dear User</span>,<br />"+
                                
                                "<p>Thank you for your application, your membership has been received and processed</p><br/>"+
                                "<p><strong>HLC Membership Details :</strong><br/><br />"+
                                "Your Membership ID:"+result+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(result)+ "<br/>"+
                                "First Name:"+userDet[1]+"<br/>"+
                                "Last Name: "+userDet[2]+"<br/>"+
                                "City:"+userDet[3]+ "<br/>"+ 
                                "State:"+userDet[4]+ "<br/></p>"+
                                "<p>Please allow 3-4 weeks for delivery of your membership card packet .</p> <br/>"+
                                "<p><span class=\"asterisk\"><strong>Note:</strong></span> All 2008 medical cards are WHITE and are downloadable from our website on regular paper . Please do not hesitate to contact the HLC Member Service Dept. if we can be of further assistance! </p><br/>"+
                                "<p><strong>HLC Member Service Department</strong></p><br/>"+
                                
                                " </table>"+
                                "</td></tr>"+
                                "</table>";
                                email.setBody(content);
                        }else if(memTypeName.equalsIgnoreCase("Subscribing Member") || memTypeName.equalsIgnoreCase("Non-Competing Member")){
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
                                "<span class=\"boldTxt\">Dear User</span>,<br />"+
                                
                                "<p>Thank you for your application, your membership has been received and processed</p><br/>"+
                                "<p><strong>HLC Membership Details :</strong><br/><br />"+
                                "Your Membership ID:"+result+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(result)+ "<br/>"+
                                "First Name:"+userDet[1]+"<br/>"+
                                "Last Name: "+userDet[2]+"<br/>"+
                                "City:"+userDet[3]+ "<br/>"+ 
                                "State:"+userDet[4]+ "<br/></p>"+
                                "<p>Your membership packet will arrive within 3-4 weeks.  </p> <br/>"+
                                "<p><span class=\"asterisk\"><strong>Special Note:</strong></span> Subscribers  & Non-Competing members , this membership does not provide competing privileges at any level of competition. </p><br/>"+
                                "<p>Please do not hesitate to contact the HLC Member Service Dept. if we can be of further assistance!</p><br/>"+
                                 "<p><strong>HLC Member Service Department</strong></p><br/>"+
                                
                                " </table>"+
                                "</td></tr>"+
                                "</table>";
                                email.setBody(content);   
                        }else if(memTypeName.equalsIgnoreCase("Family Member")){
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
                                "<span class=\"boldTxt\">Dear User</span>,<br />"+
                                
                                "<p>Thank you for your application, your membership has been received and processed</p><br/>"+
                                "<p><strong>HLC Membership Details :</strong><br/><br />"+
                                "Your Membership ID:"+result+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(result)+ "<br/>"+
                                "First Name:"+userDet[1]+"<br/>"+
                                "Last Name: "+userDet[2]+"<br/>"+
                                "City:"+userDet[3]+ "<br/>"+ 
                                "State:"+userDet[4]+ "<br/></p>"+
                                "<p>Your membership packet will arrive within 3-4 weeks.  </p> <br/>"+
                                "<p><span class=\"asterisk\"><strong>Special Note:</strong></span> This membership level allows you to compete from Beginner novice level thru Training. However, you must upgrade to a full or life member in order to compete at the preliminary level and above.  (Reminder, if you are moving up to the preliminary level do not forget to upgrade your horse!.)</p><br/>"+
                                "<p><span class=\"asterisk\"><strong>Note:</strong></span> All 2008 medical cards are WHITE and are downloadable from our website on regular paper .</p></br/>"+
                                "<p>Please do not hesitate to contact the HLC Member Service Dept. if we can be of further assistance!</p></br/>"+
                                "<p><strong>HLC Member Service Department</strong></p><br/>"+
                                
                                " </table>"+
                                "</td></tr>"+
                                "</table>";
                                email.setBody(content);
                        }
                                EmailEngine emailEngine = new EmailEngine();
                                boolean emailFlag = emailEngine.sendMimeEmail(email);
                                Debug.print("Email sent sucessfully :"+emailFlag);
                }
                Debug.print("!!!!!!!!!!!!!Line 903:!!!!!!!!!!!!!!");
                String usId = (String) session.getAttribute("userId");
                Debug.print("usId is "+usId);
                Debug.print("accMembTypeId is "+accMembTypeId);
                Debug.print("MembTypeName is "+MembTypeName);
                Debug.print("result member Id is "+result);
                String[] historyEntry = {"Register",usId,accMembTypeId,MembTypeName,result};
                 Debug.print("historyEntry 3 "+historyEntry);
                historyTable.add(historyEntry);
                
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                
                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                        
                        if(objPayment.getAmount()<=chk_amt) {
                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                            
                            boolean stat=memberRemote.editMemberStatus("Active",result);
                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                            
                            actStat="Active";
                        }
                        
                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                        Debug.print("act_date :"+act_date.toString());
                        
                        boolean actDat=remote.updateApprovalDate(result,act_date);
                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                        
                    }
                }
                
                String[] pubId=request.getParameterValues("mailOpt1");
                Debug.print("pubId :" +pubId);
                
                if(pubId!=null) {
                    Debug.print("pubId.length :" +pubId.length);
                    
                    for(int i=0;i<pubId.length;i++) {
                        
                        boolean pubStat=remote.insertPublicationDetails(result,pubId[i]);
                        Debug.print("remote.insertPublicationDetails() for member id :"+result+" publication id : "+pubId[i]+" Status :" +pubStat);
                        
                    }
                    
                }
                
                String subsMailExist = request.getParameter("subsMailExist");
                Debug.print("subsMailExist 1013"+subsMailExist);
                if(subsMailExist!=null){
                    Debug.print("subsMailExist ! null");
                    int val = Integer.parseInt(subsMailExist);
                    Debug.print("val is "+val);
                    if(val==1){
                        String[] publId = request.getParameterValues("submailOpt1");
                        if(publId!=null){
                            Debug.print(" publId length "+publId.length);
                            for(int i=0;i<publId.length;i++){
                                Debug.print("member Id "+result);
                                if(r11.equalsIgnoreCase("check")) {
                                    boolean pubStat=remote.insertPublicationDetails(result,publId[i]);
                                    Debug.print("remote.insertPublicationDetails() for member id :"+result+" publication id : "+publId[i]+" Status :" +pubStat);
                                }
                            }
                        }
                    }
                }
                
                request.setAttribute("memberId",result);
                request.setAttribute("membTyp",objMember.getMembershipTypeName());
                request.setAttribute("chk_no",objPayment.getCheckNumber());
                request.setAttribute("tot_amt",Double.toString(objPayment.getAmount()));
                request.setAttribute("actStat",actStat);
                session.setAttribute("exp_date",remote.getExpiredDate(result));
                
                session.setAttribute("memberId",result);
            }
            
            String renDate="Registration Date :";
            session.setAttribute("regStatus",renDate);
            
        }
        
        /*
         * update balance amt
         */
        
        if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
            
            boolean pendStat=kaveryRemote.updatePendingAmount(userId,paymentId,Float.valueOf(request.getParameter("chckAmount")).floatValue());
            Debug.print("kaveryRemote.updatePendingAmount() : "+pendStat);
            
        }
        
        /*
         * Donation Amt insertion block
         *
         
        String donCbxCt=request.getParameter("donCbxCt");
        int donCt=Integer.parseInt(donCbxCt);
        Debug.print("donCt :"+donCt);
         
         
         
        ArrayList donationDet=new ArrayList();
         
         for(int d=0;d<donCt;d++)
        {
         
            String doncbname="donCb"+d;
            String dontbname="donTb"+d;
            String donNametbname="donNametb"+d;
         
            System.out.print("dontbname :"+dontbname);
            System.out.print("doncbname :"+doncbname);
            System.out.print("donNametbname :"+donNametbname);
            Debug.print("userId from session :"+userId);
         
            String donChkVal=request.getParameter(doncbname);
            Debug.print("donChkVal :"+donChkVal);
         
            if(donChkVal!=null)
            {
                String[] DonId=donChkVal.split("#");
                Debug.print("DonId :"+DonId[0]);
         
                String donPrice=request.getParameter(dontbname);
                Debug.print("donPrice :"+donPrice);
         
                String donatorName=request.getParameter(donNametbname);
                Debug.print("donatorName :"+donatorName);
         
               if(r11.equalsIgnoreCase("check"))
               {
                    Debug.print("paymentId in servlet :"+paymentId);
         
                    boolean donstat=remote.insertDonationPriceDetails(userId,DonId[0],donPrice,donatorName,paymentId);
                    Debug.print("donation "+d+"insert status:"+donstat);
               }
         
                String[] donDet={userId,DonId[0],donPrice,donatorName};
                donationDet.add(donDet);
         
                //boolean donstat=remote.insertDonationPriceDetails(memberId,DonId[0],donPrice,donatorName);
                //Debug.print("donation "+d+"insert status:"+donstat);
         
            }
         }
         
         if(r11.equalsIgnoreCase("card"))
         {
             session.setAttribute("donationDet",donationDet);
         }*/
        
        /*
         * Non-Usea Amt insertion block
         */
        
        String memberId=remote.getParentMemberId(loginName);
        String parentId=remote.getParentMemberId(loginName);
        Debug.print("memberId from after reg :"+memberId);
        /*
        String orgCbxCt=request.getParameter("orgCbxCt");
        int orgCt=Integer.parseInt(orgCbxCt);
        Debug.print("orgCt :"+orgCt);
        
        ArrayList nonUseaDet=new ArrayList();
        
        for(int c=0;c<orgCt;c++) {
            String cbxName="orgNameCbx"+c;
            String tbName="orgNameTxt"+c;
            System.out.print("tbName :"+tbName);
            System.out.print("cbxName :"+cbxName);
            
            String chkVal=request.getParameter(cbxName);
            Debug.print("chkVal :"+chkVal);
            
            
            if(chkVal!=null) {
                String[] OrgTypId=chkVal.split("#");
                
                String orgMemId=request.getParameter(tbName);
                Debug.print("orgMemId :"+orgMemId);
                
                if(r11.equalsIgnoreCase("check")) {
                    if(memberId!=null && memberId.trim().length()!=0){
                        boolean nonstat=remote.insertNonUseaPriceDetails(memberId,OrgTypId[0],orgMemId);
                        Debug.print("non hlc "+c+"insert status :"+nonstat);
                    }
                }
                
                String[] nonUsea={memberId,OrgTypId[0],orgMemId};
                nonUseaDet.add(nonUsea);
            }
            
            
        }
        
        if(r11.equalsIgnoreCase("card")) {
            session.setAttribute("nonUseaDet",nonUseaDet);
        }*/
        
        /*
         * Insertion for Full Member, Life Member
         */
        
        String renStat=request.getParameter("rr21");
        Debug.print("renStat :"+renStat);
        // Added Here Hari
        ArrayList famIs = new ArrayList();
        
        if(renStat!=null) {
            if(!renStat.equalsIgnoreCase("renew")) {
                
                Debug.print("::::::::::: Inside Upgrade / Downgrade radio button click new add-on's Block :::::::::::");
                
                Vector addFamNonWeb=new Vector();
                Vector addFamWeb=new Vector();
                ArrayList addonMemb=new ArrayList();
                
                if(memberType[1].equalsIgnoreCase("full member") || memberType[1].equalsIgnoreCase("life member")) {
                    System.out.println("parentId :"+parentId);
                    
               /*
                * Block for Family Add-on insertion
                */
                    
                    if(!request.getParameter("famMemb").equals("0")) {
                        String ct=request.getParameter("famMemb");
                        int addct=Integer.parseInt(ct);
                        System.out.println("famMemb addon ct :"+addct);
                        
                        String famembId=request.getParameter("famembId");
                        HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                        
                        if(r11.equalsIgnoreCase("check")) {
                            boolean status=remote.updatMemberFamilyAddOns(parentId,addct);
                            Debug.print("remote.updatMemberFamilyAddOns(parentId,addct) :"+status);
                        }
                        
                        String[] updateAddct={parentId,String.valueOf(addct)};
                        
                        if(r11.equalsIgnoreCase("card")) {
                            session.setAttribute("updateAddct",updateAddct);
                        }
                        
                        //HttpServlet ser = getServlet();
                        
                        //ServletContext context=ser.getServletContext();
                        ServletContext context = request.getSession().getServletContext();

                        System.out.println("after ser.getServletContext() .....");
                        
                        for(int i=1;i<=addct;i++) {
                            
                            objMember = new HLCMemberDetails();
                            
                            objUserMaster=new HLCUserMaster();
                            objContactDetail=new HLCContactDetails();
                            HLCContactDetails objContactDetail1=new HLCContactDetails();
                            
                            String pre="sal"+i;
                            String fname="fname"+i;
                            String mname="mname"+i;
                            String lname="lname"+i;
                            String suffix="suffix"+i;
                            String gender="gender"+i;
                            String emailids="email"+i;
                            String phone="phone"+i;
                            String mobile="mobile"+i;
                            String fax="fax"+i;
                            String by="birthyear"+i;
                            String bd="birthday"+i;
                            String bm="birthmonth"+i;
                            String loginame="loginName"+i;
                            String famUser="famUser"+i;
                            String amatCrdPoss="amatCrdPoss"+i;
                            String amatCrdElig="amatCrdElig"+i;
                            String nameAmat="nameAmat"+i;
                            
                            // Test Print of Parameters
                            String pref=request.getParameter(pre);
                            String fname1=request.getParameter(fname);
                            String mname1=request.getParameter(mname);
                            String lname1=request.getParameter(lname);
                            String suffix1=request.getParameter(suffix);
                            String by1=request.getParameter(by);
                            String bm1=request.getParameter(bm);
                            String bd1=request.getParameter(bd);
                            String gender1=request.getParameter(gender);
                            String emailids1=request.getParameter(emailids);
                            String phone1=request.getParameter(phone);
                            String mobile1=request.getParameter(mobile);
                            String fax1=request.getParameter(fax);
                            String loginame1=request.getParameter(loginame);
                            String famUser1=request.getParameter(famUser);
                            String amatCrdPoss1=request.getParameter(amatCrdPoss);
                            String amatCrdElig1=request.getParameter(amatCrdElig);
                            String nameAmat1=request.getParameter(nameAmat);
                            
                            String finalPrimaryPh="";
                            
                            if(request.getParameter(phone)!=null) {
                                Debug.print("request.getParameter(phone) value:"+request.getParameter(phone));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(phone),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryPh=finalPrimaryPh+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary finalPrimaryPh :"+finalPrimaryPh);
                                
                                phone1 = finalPrimaryPh;
                                
                            }
                            
                            String finalPrimaryMob="";
                            
                            if(request.getParameter(mobile)!=null) {
                                Debug.print("request.getParameter(mobile) value:"+request.getParameter(mobile));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(mobile),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryMob=finalPrimaryMob+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary finalPrimaryMob :"+finalPrimaryMob);
                                
                                mobile1 = finalPrimaryMob;
                                
                            }
                            
                            String finalPrimaryFax="";
                            
                            if(request.getParameter(fax)!=null) {
                                Debug.print("request.getParameter(fax) value:"+request.getParameter(fax));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(fax),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryFax=finalPrimaryFax+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary finalPrimaryFax :"+finalPrimaryFax);
                                
                                fax1 = finalPrimaryFax;
                                
                            }
                            
                            boolean amatCrdPossMembStatus1;
                            
                            if(amatCrdPoss1!=null) {
                                amatCrdPossMembStatus1=true;
                                
                            } else {
                                amatCrdPossMembStatus1=false;
                            }
                            Debug.print("amatCrdPossMembStatus :"+amatCrdPossMembStatus1);
                            
                            boolean amatCrdEligMembStatus1;
                            
                            if(amatCrdElig1!=null) {
                                amatCrdEligMembStatus1=true;
                                
                            } else {
                                amatCrdEligMembStatus1=false;
                            }
                            Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                            
                            objMember.setAmateurName(nameAmat1);
                            objMember.setAmateurDec1(amatCrdPossMembStatus1);
                            objMember.setAmateurDec2(amatCrdEligMembStatus1);
                            objMember.setMembershipTypeName("Family Member");
                            
                            if(famUser1.equalsIgnoreCase("no")) {
                                
                                Debug.print("::::::: Inside family add-on "+i+"non web user block ::::::");
                                Debug.print("userId :"+userId);
                                
                                String bday =by1+"-"+bm1+"-"+bd1;
                                System.out.println("User DOB of user"+i+"  :"+bday);
                                
                                //objUserMaster.setLoginName(loginame1);
                                objUserMaster.setPrefix(pref);
                                objUserMaster.setFirstName(fname1);
                                objUserMaster.setMiddleName(mname1);
                                objUserMaster.setLastName(lname1);
                                objUserMaster.setSufix(suffix1);
                                
                                objUserMaster.setDob(bday);
                                objUserMaster.setGender(gender1);
                                objUserMaster.setEmailId(emailids1);
                                objUserMaster.setCommunicationAddress("Primary");
                                objUserMaster.setUserTypeName("Human");
                                
                                objContactDetail1=remote.getContactDetailBasedOnUserId(userId);
                                
                                Debug.print("           UserID" + objContactDetail1.getUserId());
                                objContactDetail.setAddress1(objContactDetail1.getAddress1());
                                objContactDetail.setAddress2(objContactDetail1.getAddress2());
                                objContactDetail.setCountry(objContactDetail1.getCountry());
                                objContactDetail.setCity(objContactDetail1.getCity());
                                objContactDetail.setState(objContactDetail1.getState());
                                objContactDetail.setZip(objContactDetail1.getZip());
                                
                                //objContactDetail.setUserId(userId);
                                objContactDetail.setPhoneNo(phone1);
                                objContactDetail.setMobileNo(mobile1);
                                objContactDetail.setFaxNo(fax1);
                                
                                String usrid="";
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    usrid=remote.addFamilyAddOn(objUserMaster,objContactDetail);
                                    System.out.println("after add-on "+i+" user details insertion usrid :"+usrid);
                                    
                        /*
                         Debug.print("Line 1379");
                        String tempmembId = remote.getMemberIdBasedOnUserId(usrid);
                        String[] historyEntry = {renStat,usrid,famembId,"Family Member",tempmembId};
                        historyTable.add(historyEntry);
                         */
                                }
                                
                                objMember.setEmailId(emailids1);
                                objMember.setEndowmentTrustAmount("0");
                                
                                objMember.setPaymentId(paymentId);
                                objMember.setParentMemberId(parentId);
                                objMember.setMembershipTypeId(famembId);
                                objMember.setLoginName(loginame1);
                                objMember.setUserId(usrid);
                                
                                String memb="";
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    Debug.print("addMemberDetails 2");
                                    memb=remote.addMemberDetails(objMember, objPayment1);
                                    System.out.println("after add-on "+i+" member details insertion member-Id :"+memb);
                                    Debug.print("Line 1392");
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    String[] historyEntry = {renStat,objContactDetail1.getUserId(),famembId1,"Family Member",memb};
                                     Debug.print("historyEntry 4 "+historyEntry);
                                    historyTable.add(historyEntry);
                                    
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",memb);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(memb,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                    
                                }
                                
                                ArrayList nonWebFam=new ArrayList();
                                
                                nonWebFam.add(objUserMaster);
                                nonWebFam.add(objContactDetail);
                                nonWebFam.add(objMember);
                                nonWebFam.add(objPayment1);
                                
                                addFamNonWeb.add(nonWebFam);
                                
                                Vector uid=new Vector();
                                
                                //uid=(Vector)remote.getUserIdByEmailId(request.getParameter("email"));
                   /* uid=(Vector)remote.getUserIdByLoginName(loginame1);
                    String usrId=(String)uid.elementAt(0);
                    Debug.print("usrId after reg :" +usrId);*/
                                
                   /* String usrId=remote.getUserIdBasedOnMemberId(memb);
                    Debug.print("remote.getUserIdBasedOnMemberId(memb) :"+usrId);*/
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    boolean rolestat=roleRemote.createDefaultRole(usrid,defrole);
                                    Debug.print("rolestatus :" +rolestat);
                                }
                                String[] usrVal={fname1,lname1,bm1,bd1,by1,memb,emailids1,""};
                                context.setAttribute("usrVal",usrVal);
                                
                                
                   /* String pass=remote.getPasswordByLoginName(loginame1);
                    Debug.print("auto gen pwd for add-on"+i+" :"+pass);*/
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {emailids1};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear " +fname1+"</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+memb+"<p> Your Parent Member Id : "+membId+"<p> ----------------------------<p>"+
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 1 :"+emailFlag);
                                }
                                
                            }
                            
                            if(famUser1.equalsIgnoreCase("yes")) {
                                Debug.print("::::::: Inside family add-on "+i+"existing web user block ::::::");
                                
                                String usrName="userNameId"+i;
                                Debug.print("generated usrName :"+usrName);
                                
                                String logName=request.getParameter(usrName);
                                
                                //objMember.setEmailId(emailids1);
                                objMember.setEndowmentTrustAmount("0");
                                
                                objMember.setParentMemberId(parentId);
                                objMember.setMembershipTypeId(famembId);
                                objMember.setLoginName(logName);
                                objMember.setPaymentId(paymentId);
                                
                                Vector usr=new Vector();
                                usr=remote.getUserIdByLoginName(logName);
                                
                                String usrId=(String)usr.elementAt(0);
                                Debug.print("usrId for login name"+logName+" :"+usrId);
                                objMember.setUserId(usrId);
                                
                                ArrayList famWeb=new ArrayList();
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    Debug.print("addMemberDetails 3");
                                    String memb=remote.addMemberDetails(objMember, objPayment1);
                                    System.out.println("add-on "+i+" existing member details insertion status :"+memb);
                                    Debug.print("Line 1580");
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    String[] historyEntry = {renStat,usrId,famembId1,"Family Member",memb};
                                     Debug.print("historyEntry 5 "+historyEntry);
                                    historyTable.add(historyEntry);
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",memb);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(memb,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                }
                                
                                famWeb.add(objMember);
                                famWeb.add(objPayment1);
                                
                                addFamWeb.add(famWeb);
                                
                                // getting member id after insert
                                
                                String mId=remote.getParentMemberId(usrName);
                                Debug.print("mId :"+mId);
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {emailids1};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+mId+"<p> Parent Member Id : "+membId+"<p> ----------------------------<p>"+
                                            
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 2:"+emailFlag);
                                    
                                }
                            }
                            
                            if(famUser1.equalsIgnoreCase("mem")) {
                                
                                Debug.print("::::::: Inside family add-on "+i+"existing member block ::::::");
                                
                                String mIdTxt="memberAdd"+i;
                                Debug.print("generated mIdTxt :"+mIdTxt);
                                
                                String exMid=request.getParameter(mIdTxt);
                                Debug.print("existing MemberId :"+exMid);
                                
                                String parId="";
                                parId=(String)session.getAttribute("memberId");
                                Debug.print("parentId :"+parId);
                                
                                Debug.print("amature name :"+nameAmat1);
                                Debug.print("amatCrdPossMembStatus1 :"+amatCrdPossMembStatus1);
                                Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                                
                                String[] addExMemb={exMid,nameAmat1,amatCrdPoss1,amatCrdElig1};
                                
                                addonMemb.add(addExMemb);
                                
                                String usrId=remote.getUserIdBasedOnMemberId(exMid);
                                Debug.print("remote.getUserIdBasedOnMemberId(exMid) :"+usrId);
                                
                                String toMailId="";
                                toMailId=remote.getEmailBasedOnUserId(usrId);
                                Debug.print("remote.getEmailBasedOnUserId(usrId) :"+toMailId);
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    boolean upStatus=remote.updateAddOnExistingMember(exMid,"Pending",parId,paymentId,famembId1);
                                    Debug.print("updateAddOnExistingMember(exMid,Pending,parId,paymentId) :"+upStatus);
                                    
                                    Debug.print("Line 1757:");
                                    
                                    String[] historyEntry = {renStat,usrId,famembId1,"Family Member",exMid};
                                     Debug.print("historyEntry 6 "+historyEntry);
                                    historyTable.add(historyEntry);
                                    
                                    boolean amatStat=remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1);
                                    Debug.print("remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1) :"+amatStat);
                                    
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",exMid);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(exMid,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {toMailId};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+exMid+"<p> Parent Member Id : "+parId+"<p> ----------------------------<p>"+
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 3:"+emailFlag);
                                    
                                }
                                
                            }
                            
                            
                        }
                        
                    }
                }
                if(r11.equalsIgnoreCase("card")) {
                    session.setAttribute("addFamNonWeb",addFamNonWeb);
                    session.setAttribute("addFamWeb",addFamWeb);
                    session.setAttribute("addonMemb",addonMemb);
                }
                
            }
            
            /*
             * For renew radio button click new add-on's
             */
            
            else {
                Debug.print("::::::::::: Inside renew radio button click new add-on's Block :::::::::::");
                
                Vector addFamNonWeb=new Vector();
                Vector addFamWeb=new Vector();
                ArrayList addonMemb=new ArrayList();
                
                String membershipName=request.getParameter("membershipName");
                Debug.print("membershipName of parent for add-on  renew :"+membershipName);
                
                if(membershipName.equalsIgnoreCase("full member") || membershipName.equalsIgnoreCase("life member")) {
                    
                    
                    
                    // String parentId=remote.getParentMemberId(email);
                    System.out.println("parentId :"+parentId);
                    
               /*
                * Block for Family Add-on insertion
                */
                    
                    if(!request.getParameter("famMemb").equals("0")) {
                        String ct=request.getParameter("famMemb");
                        int addct=Integer.parseInt(ct);
                        System.out.println("famMemb addon ct :"+addct);
                        
                        String famembId=request.getParameter("famembId");
                        HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                        
                        if(r11.equalsIgnoreCase("check")) {
                            boolean status=remote.updatMemberFamilyAddOns(parentId,addct);
                            Debug.print("remote.updatMemberFamilyAddOns(parentId,addct) :"+status);
                        }
                        
                        String[] updateAddct={parentId,String.valueOf(addct)};
                        
                        if(r11.equalsIgnoreCase("card")) {
                            session.setAttribute("updateAddct",updateAddct);
                        }
                        
                        //HttpServlet ser = getServlet();
                        
                        //ServletContext context=ser.getServletContext();
                        ServletContext context = request.getSession().getServletContext();
                        System.out.println("after ser.getServletContext() .....");
                        
                        for(int i=1;i<=addct;i++) {
                            
                            objMember = new HLCMemberDetails();
                            
                            objUserMaster=new HLCUserMaster();
                            objContactDetail=new HLCContactDetails();
                            HLCContactDetails objContactDetail1=new HLCContactDetails();
                            
                            String pre="sal"+i;
                            String fname="fname"+i;
                            String mname="mname"+i;
                            String lname="lname"+i;
                            String suffix="suffix"+i;
                            String gender="gender"+i;
                            String emailids="email"+i;
                            String phone="phone"+i;
                            String mobile="mobile"+i;
                            String fax="fax"+i;
                            String by="birthyear"+i;
                            String bd="birthday"+i;
                            String bm="birthmonth"+i;
                            String loginame="loginName"+i;
                            String famUser="famUser"+i;
                            String amatCrdPoss="amatCrdPoss"+i;
                            String amatCrdElig="amatCrdElig"+i;
                            String nameAmat="nameAmat"+i;
                            
                            // Test Print of Parameters
                            String pref=request.getParameter(pre);
                            String fname1=request.getParameter(fname);
                            String mname1=request.getParameter(mname);
                            String lname1=request.getParameter(lname);
                            String suffix1=request.getParameter(suffix);
                            String by1=request.getParameter(by);
                            String bm1=request.getParameter(bm);
                            String bd1=request.getParameter(bd);
                            String gender1=request.getParameter(gender);
                            String emailids1=request.getParameter(emailids);
                            String phone1=request.getParameter(phone);
                            String mobile1=request.getParameter(mobile);
                            String fax1=request.getParameter(fax);
                            String loginame1=request.getParameter(loginame);
                            String famUser1=request.getParameter(famUser);
                            String amatCrdPoss1=request.getParameter(amatCrdPoss);
                            String amatCrdElig1=request.getParameter(amatCrdElig);
                            String nameAmat1=request.getParameter(nameAmat);
                            
                            System.out.println("famUser :"+famUser+" pre :"+pre+"fname :"+fname+"mname :"+mname+"lname :"+lname+"suffix :"+suffix+"gender :"+gender+"emailids :"+emailids+"phone :"+phone+"mobile :"+mobile+"fax :"+fax+"loginame :"+loginame +"amatCrdPoss :"+amatCrdPoss+"amatCrdElig :"+amatCrdElig+"nameAmat :"+nameAmat);
                            
                            System.out.print("pref :" +pref);
                            System.out.print("fname1 :" +fname1);
                            System.out.print("mname1 :" +mname1);
                            System.out.print("lname1 :"+lname1);
                            System.out.print("suffix1 :" +suffix1);
                            System.out.print("by1 :" +by1);
                            System.out.print("bm1 :" +bm1);
                            System.out.print("bd1 :" +bd1);
                            System.out.print("gender1 :"+gender1);
                            System.out.print("emailids1 :" +emailids1);
                            System.out.print("phone1 :" +phone1);
                            System.out.print("mobile1 :" +mobile1);
                            System.out.print("fax1 :" +fax1);
                            System.out.print("loginame1 :" +loginame1);
                            System.out.print("famUser1 :" +famUser1);
                            System.out.print("nameAmat1 :" +nameAmat1);
                            System.out.print("amatCrdPoss1 :" +amatCrdPoss1);
                            System.out.print("amatCrdElig1 :" +amatCrdElig1);
                            
                            
                            String finalPrimaryPh="";
                            
                            if(request.getParameter(phone)!=null) {
                                Debug.print("request.getParameter(phone) value:"+request.getParameter(phone));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(phone),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryPh=finalPrimaryPh+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary phNo :"+finalPrimaryPh);
                                
                                phone1 = finalPrimaryPh;
                                
                            }
                            
                            String finalPrimaryMob="";
                            
                            if(request.getParameter(mobile)!=null) {
                                Debug.print("request.getParameter(mobile) value:"+request.getParameter(mobile));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(mobile),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryMob=finalPrimaryMob+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary finalPrimaryMob :"+finalPrimaryMob);
                                
                                mobile1 = finalPrimaryMob;
                                
                            }
                            
                            String finalPrimaryFax="";
                            
                            if(request.getParameter(fax)!=null) {
                                Debug.print("request.getParameter(fax) value:"+request.getParameter(fax));
                                
                                StringTokenizer strTkns = new StringTokenizer(request.getParameter(fax),"[](),.-{}");
                                
                                while(strTkns.hasMoreTokens()){
                                    try{
                                        String phNo = (String)strTkns.nextToken();
                                        
                                        if(phNo!=null && phNo.trim().length()!=0){
                                            Debug.print("ph no Added from Stokenizer:" + phNo);
                                            finalPrimaryFax=finalPrimaryFax+phNo;
                                        }
                                    } catch(Exception e){
                                        Debug.print("ph no tokanizing exception:" + e);
                                    }
                                }
                                
                                Debug.print("finally appended primary finalPrimaryFax :"+finalPrimaryFax);
                                
                                fax1 = finalPrimaryFax;
                                
                            }
                            
                            boolean amatCrdPossMembStatus1;
                            
                            if(amatCrdPoss1!=null) {
                                amatCrdPossMembStatus1=true;
                                
                            } else {
                                amatCrdPossMembStatus1=false;
                            }
                            Debug.print("amatCrdPossMembStatus1 :"+amatCrdPossMembStatus1);
                            
                            boolean amatCrdEligMembStatus1;
                            
                            if(amatCrdElig1!=null) {
                                amatCrdEligMembStatus1=true;
                                
                            } else {
                                amatCrdEligMembStatus1=false;
                            }
                            Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                            
                            objMember.setAmateurName(nameAmat1);
                            objMember.setAmateurDec1(amatCrdPossMembStatus1);
                            objMember.setAmateurDec2(amatCrdEligMembStatus1);
                            objMember.setMembershipTypeName("Family Member");
                            
                            if(famUser1.equalsIgnoreCase("no")) {
                                
                                Debug.print("::::::: Inside family add-on "+i+"non web user block ::::::");
                                Debug.print("userId :"+userId);
                                
                                String bday =by1+"-"+bm1+"-"+bd1;
                                System.out.println("User DOB of user"+i+"  :"+bday);
                                
                                //objUserMaster.setLoginName(loginame1);
                                objUserMaster.setPrefix(pref);
                                objUserMaster.setFirstName(fname1);
                                objUserMaster.setMiddleName(mname1);
                                objUserMaster.setLastName(lname1);
                                objUserMaster.setSufix(suffix1);
                                
                                objUserMaster.setDob(bday);
                                objUserMaster.setGender(gender1);
                                objUserMaster.setEmailId(emailids1);
                                objUserMaster.setCommunicationAddress("Primary");
                                objUserMaster.setUserTypeName("Human");
                                
                                objContactDetail1=remote.getContactDetailBasedOnUserId(userId);
                                
                                Debug.print("           UserID" + objContactDetail1.getUserId());
                                objContactDetail.setAddress1(objContactDetail1.getAddress1());
                                objContactDetail.setAddress2(objContactDetail1.getAddress2());
                                objContactDetail.setCountry(objContactDetail1.getCountry());
                                objContactDetail.setCity(objContactDetail1.getCity());
                                objContactDetail.setState(objContactDetail1.getState());
                                objContactDetail.setZip(objContactDetail1.getZip());
                                
                                //objContactDetail.setUserId(userId);
                                objContactDetail.setPhoneNo(phone1);
                                objContactDetail.setMobileNo(mobile1);
                                objContactDetail.setFaxNo(fax1);
                                
                                String usrid="";
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    usrid=remote.addFamilyAddOn(objUserMaster,objContactDetail);
                                    System.out.println("after add-on "+i+" user details insertion usrid :"+usrid);
                       /*
                        Debug.print("Line 2179:");
                        String famembId1 = request.getParameter("famembId");
                        String tempmemId = remote.getMemberIdBasedOnUserId(usrid);
                        Debug.print("famembId   is   "+famembId1);
                        String[] historyEntry = {renStat,usrid,famembId1,"Family Member",tempmemId};
                        historyTable.add(historyEntry);
                        */
                                }
                                
                                objMember.setEmailId(emailids1);
                                objMember.setEndowmentTrustAmount("0");
                                
                                objMember.setPaymentId(paymentId);
                                objMember.setParentMemberId(parentId);
                                objMember.setMembershipTypeId(famembId);
                                objMember.setLoginName(loginame1);
                                objMember.setUserId(usrid);
                                
                                String memb="";
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    objMember.setMembershipTypeId(famembId1);
                                    Debug.print("addMemberDetails 4");
                                    memb=remote.addMemberDetails(objMember, objPayment1);
                                    System.out.println("after add-on "+i+" member details insertion member-Id :"+memb);
                                    Debug.print("Line 2190:");
                                    String useId =remote.getUserIdBasedOnMemberId(memb);
                                    String[] historyEntry = {renStat,useId,famembId1,"Family Member",memb};
                                     Debug.print("historyEntry 7 "+historyEntry);
                                    historyTable.add(historyEntry);
                                    ///
                                    /// Member Id added here
                                    // Expiry Date Change Started
                     /*   String memName = request.getParameter("membershipName");
                          if(!memName.trim().equalsIgnoreCase("Subscribing Member")){
                              String stats = request.getParameter("status");
                              if(stats!=null){
                                  if(!stats.trim().equalsIgnoreCase("Active")){
                                      String renewOpt = request.getParameter("renewOpt");
                                      Debug.print("renewOpt is "+renewOpt);
                                      if(renewOpt.equalsIgnoreCase("nxtYr")){
                                           Debug.print("value is "+memb);
                                           remote.updateFutureExpDateByYear(memb);
                                      }
                                  }
                              }
                          }*/
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",memb);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(memb,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                    
                                }
                                
                                ArrayList nonWebFam=new ArrayList();
                                
                                nonWebFam.add(objUserMaster);
                                nonWebFam.add(objContactDetail);
                                nonWebFam.add(objMember);
                                nonWebFam.add(objPayment1);
                                
                                addFamNonWeb.add(nonWebFam);
                                
                                Vector uid=new Vector();
                                
                                //uid=(Vector)remote.getUserIdByEmailId(request.getParameter("email"));
                   /* uid=(Vector)remote.getUserIdByLoginName(loginame1);
                    String usrId=(String)uid.elementAt(0);
                    Debug.print("usrId after reg :" +usrId);*/
                                
                   /* String usrId=remote.getUserIdBasedOnMemberId(memb);
                    Debug.print("remote.getUserIdBasedOnMemberId(memb) :"+usrId);*/
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    boolean rolestat=roleRemote.createDefaultRole(usrid,defrole);
                                    Debug.print("rolestatus :" +rolestat);
                                    
                                    String[] usrVal={fname1,lname1,bm1,bd1,by1,memb,emailids1,""};
                                    context.setAttribute("usrVal",usrVal);
                                }
                                
                   /* String pass=remote.getPasswordByLoginName(loginame1);
                    Debug.print("auto gen pwd for add-on"+i+" :"+pass);*/
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {emailids1};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear " +fname1+"</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+memb+"<p> Your Parent Member Id : "+membId+"<p> ----------------------------<p>"+
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 4:"+emailFlag);
                                    
                                }
                            }
                            
                            if(famUser1.equalsIgnoreCase("yes")) {
                                Debug.print("::::::: Inside family add-on "+i+"existing web user block ::::::");
                                
                                String usrName="userNameId"+i;
                                Debug.print("generated usrName :"+usrName);
                                
                                String logName=request.getParameter(usrName);
                                
                                //objMember.setEmailId(emailids1);
                                objMember.setEndowmentTrustAmount("0");
                                
                                objMember.setParentMemberId(parentId);
                                objMember.setMembershipTypeId(famembId);
                                objMember.setLoginName(logName);
                                objMember.setPaymentId(paymentId);
                                
                                Vector usr=new Vector();
                                usr=remote.getUserIdByLoginName(logName);
                                
                                String usrId=(String)usr.elementAt(0);
                                Debug.print("usrId for login name"+logName+" :"+usrId);
                                objMember.setUserId(usrId);
                                
                                ArrayList famWeb=new ArrayList();
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    Debug.print("addMemberDetails 5");
                                    String memb=remote.addMemberDetails(objMember, objPayment1);
                                    System.out.println("add-on "+i+" existing member details insertion status :"+memb);
                                    ///
                                    // Hari Added
                                    Debug.print("Line 2396:");
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    String[] historyEntry = {renStat,usrId,famembId1,"Family Member",memb};
                                     Debug.print("historyEntry 8 "+historyEntry);
                                    historyTable.add(historyEntry);
                                    
                                    Debug.print("famUser1.equalsIgnoreCase(\"yes\") "+memb);
                                    famIs.add(memb);
                                    ///
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",memb);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(memb,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                    
                                }
                                
                                famWeb.add(objMember);
                                famWeb.add(objPayment1);
                                
                                addFamWeb.add(famWeb);
                                
                                // getting member id after insert
                                
                                String mId=remote.getParentMemberId(usrName);
                                Debug.print("mId :"+mId);
                                
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {emailids1};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+mId+"<p> Parent Member Id : "+membId+"<p> ----------------------------<p>"+
                                            
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 5:"+emailFlag);
                                    
                                }
                            }
                            
                            if(famUser1.equalsIgnoreCase("mem")) {
                                
                                Debug.print("::::::: Inside family add-on "+i+"existing member block ::::::");
                                
                                String mIdTxt="memberAdd"+i;
                                Debug.print("generated mIdTxt :"+mIdTxt);
                                
                                String exMid=request.getParameter(mIdTxt);
                                Debug.print("existing MemberId :"+exMid);
                                // Hari
                                Debug.print("famUser1.equalsIgnoreCase(\"mem\") "+exMid);
                                famIs.add(exMid);
                                //
                                String parId="";
                                parId=(String)session.getAttribute("memberId");
                                Debug.print("parentId :"+parId);
                                
                                Debug.print("amature name :"+nameAmat1);
                                Debug.print("amatCrdPossMembStatus1 :"+amatCrdPossMembStatus1);
                                Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                                
                                String[] addExMemb={exMid,nameAmat1,amatCrdPoss1,amatCrdElig1};
                                
                                addonMemb.add(addExMemb);
                                
                                String usrId=remote.getUserIdBasedOnMemberId(exMid);
                                Debug.print("remote.getUserIdBasedOnMemberId(exMid) :"+usrId);
                                
                                String toMailId="";
                                toMailId=remote.getEmailBasedOnUserId(usrId);
                                Debug.print("remote.getEmailBasedOnUserId(usrId) :"+toMailId);
                                
                                if(r11.equalsIgnoreCase("check")) {
                                    String famembId1 = request.getParameter("famembId");
                                    Debug.print("famembId   is   "+famembId1);
                                    boolean upStatus=remote.updateAddOnExistingMember(exMid,"Pending",parId,paymentId,famembId1);
                                    Debug.print("updateAddOnExistingMember(exMid,Pending,parId,paymentId) :"+upStatus);
                                    Debug.print("Line 2592:");
                                    
                                    String[] historyEntry = {renStat,usrId,famembId1,"Family Member",exMid};
                                     Debug.print("historyEntry 9 "+historyEntry);
                                    historyTable.add(historyEntry);
                                    
                                    boolean amatStat=remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1);
                                    Debug.print("remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1) :"+amatStat);
                                    
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                    
                                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                            //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                            
                                            if(objPayment.getAmount()<=chk_amt) {
                                                Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                                
                                                boolean stat=memberRemote.editMemberStatus("Active",exMid);
                                                Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                            }
                                            
                                            Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                            Debug.print("act_date :"+act_date.toString());
                                            
                                            boolean actDat=remote.updateApprovalDate(exMid,act_date);
                                            Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                            
                                        }
                                    }
                                    
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                    
                                    String toMailIds[] = {toMailId};
                                    EmailContent email=new EmailContent();
                                    email.setTo(toMailIds);
                                    email.setFrom("anandv@digiblitz.com");
                                    email.setSubject("Your Account Info !");
                                    
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
                                            "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                            "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+exMid+"<p> Parent Member Id : "+parId+"<p> ----------------------------<p>"+
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                                            "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                    Debug.print("Email sent sucessfully 6:"+emailFlag);
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                }
                if(r11.equalsIgnoreCase("card")) {
                    session.setAttribute("addFamNonWeb",addFamNonWeb);
                    session.setAttribute("addFamWeb",addFamWeb);
                    session.setAttribute("addonMemb",addonMemb);
                    Debug.print("Size of the family is "+famIs.size());
                    session.setAttribute("famIs",famIs);
                }
            }
            
            
            
        }
                /*
                 * New Member Reg Add-on's Block
                 */
        
        else {
            Debug.print(":::::: New Members Reg Family-Addon's Block :::::::::");
            
            Vector addFamNonWeb=new Vector();
            Vector addFamWeb=new Vector();
            ArrayList addonMemb=new ArrayList();
            
            if(memberType[1].equalsIgnoreCase("full member") || memberType[1].equalsIgnoreCase("life member")) {
                
                // String parentId=remote.getParentMemberId(email);
                System.out.println("parentId :"+parentId);
                
               /*
                * Block for Family Add-on insertion
                */
                
                if(!request.getParameter("famMemb").equals("0")) {
                    String ct=request.getParameter("famMemb");
                    int addct=Integer.parseInt(ct);
                    System.out.println("famMemb addon ct :"+addct);
                    
                    String famembId=request.getParameter("famembId");
                    HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                    
                    if(r11.equalsIgnoreCase("check")) {
                        boolean status=remote.updatMemberFamilyAddOns(parentId,addct);
                        Debug.print("remote.updatMemberFamilyAddOns(parentId,addct) :"+status);
                    }
                    
                    String[] updateAddct={parentId,String.valueOf(addct)};
                    
                    if(r11.equalsIgnoreCase("card")) {
                        session.setAttribute("updateAddct",updateAddct);
                    }
                    
                    //HttpServlet ser = getServlet();
                    ServletContext context = request.getSession().getServletContext();
                    //ServletContext context=ser.getServletContext();
                    System.out.println("after ser.getServletContext() .....");
                    
                    for(int i=1;i<=addct;i++) {
                        
                        objMember = new HLCMemberDetails();
                        
                        objUserMaster=new HLCUserMaster();
                        objContactDetail=new HLCContactDetails();
                        HLCContactDetails objContactDetail1=new HLCContactDetails();
                        
                        String pre="sal"+i;
                        String fname="fname"+i;
                        String mname="mname"+i;
                        String lname="lname"+i;
                        String suffix="suffix"+i;
                        String gender="gender"+i;
                        String emailids="email"+i;
                        String phone="phone"+i;
                        String mobile="mobile"+i;
                        String fax="fax"+i;
                        String by="birthyear"+i;
                        String bd="birthday"+i;
                        String bm="birthmonth"+i;
                        String loginame="loginName"+i;
                        String famUser="famUser"+i;
                        String amatCrdPoss="amatCrdPoss"+i;
                        String amatCrdElig="amatCrdElig"+i;
                        String nameAmat="nameAmat"+i;
                        
                        // Test Print of Parameters
                        String pref=request.getParameter(pre);
                        String fname1=request.getParameter(fname);
                        String mname1=request.getParameter(mname);
                        String lname1=request.getParameter(lname);
                        String suffix1=request.getParameter(suffix);
                        String by1=request.getParameter(by);
                        String bm1=request.getParameter(bm);
                        String bd1=request.getParameter(bd);
                        String gender1=request.getParameter(gender);
                        String emailids1=request.getParameter(emailids);
                        String phone1=request.getParameter(phone);
                        String mobile1=request.getParameter(mobile);
                        String fax1=request.getParameter(fax);
                        String loginame1=request.getParameter(loginame);
                        String famUser1=request.getParameter(famUser);
                        String amatCrdPoss1=request.getParameter(amatCrdPoss);
                        String amatCrdElig1=request.getParameter(amatCrdElig);
                        String nameAmat1=request.getParameter(nameAmat);
                        
                        System.out.println("famUser :"+famUser+" pre :"+pre+"fname :"+fname+"mname :"+mname+"lname :"+lname+"suffix :"+suffix+"gender :"+gender+"emailids :"+emailids+"phone :"+phone+"mobile :"+mobile+"fax :"+fax+"loginame :"+loginame +"amatCrdPoss :"+amatCrdPoss+"amatCrdElig :"+amatCrdElig+"nameAmat :"+nameAmat);
                        
                        System.out.print("pref :" +pref);
                        System.out.print("fname1 :" +fname1);
                        System.out.print("mname1 :" +mname1);
                        System.out.print("lname1 :"+lname1);
                        System.out.print("suffix1 :" +suffix1);
                        System.out.print("by1 :" +by1);
                        System.out.print("bm1 :" +bm1);
                        System.out.print("bd1 :" +bd1);
                        System.out.print("gender1 :"+gender1);
                        System.out.print("emailids1 :" +emailids1);
                        System.out.print("phone1 :" +phone1);
                        System.out.print("mobile1 :" +mobile1);
                        System.out.print("fax1 :" +fax1);
                        System.out.print("loginame1 :" +loginame1);
                        System.out.print("famUser1 :" +famUser1);
                        System.out.print("nameAmat1 :" +nameAmat1);
                        System.out.print("amatCrdPoss1 :" +amatCrdPoss1);
                        System.out.print("amatCrdElig1 :" +amatCrdElig1);
                        
                        String finalPrimaryPh="";
                        
                        if(request.getParameter(phone)!=null) {
                            Debug.print("request.getParameter(phone) value:"+request.getParameter(phone));
                            
                            StringTokenizer strTkns = new StringTokenizer(request.getParameter(phone),"[](),.-{}");
                            
                            while(strTkns.hasMoreTokens()){
                                try{
                                    String phNo = (String)strTkns.nextToken();
                                    
                                    if(phNo!=null && phNo.trim().length()!=0){
                                        Debug.print("ph no Added from Stokenizer:" + phNo);
                                        finalPrimaryPh=finalPrimaryPh+phNo;
                                    }
                                } catch(Exception e){
                                    Debug.print("ph no tokanizing exception:" + e);
                                }
                            }
                            
                            Debug.print("finally appended primary phNo :"+finalPrimaryPh);
                            
                            phone1 = finalPrimaryPh;
                            
                        }
                        
                        String finalPrimaryMob="";
                        
                        if(request.getParameter(mobile)!=null) {
                            Debug.print("request.getParameter(mobile) value:"+request.getParameter(mobile));
                            
                            StringTokenizer strTkns = new StringTokenizer(request.getParameter(mobile),"[](),.-{}");
                            
                            while(strTkns.hasMoreTokens()){
                                try{
                                    String phNo = (String)strTkns.nextToken();
                                    
                                    if(phNo!=null && phNo.trim().length()!=0){
                                        Debug.print("ph no Added from Stokenizer:" + phNo);
                                        finalPrimaryMob=finalPrimaryMob+phNo;
                                    }
                                } catch(Exception e){
                                    Debug.print("ph no tokanizing exception:" + e);
                                }
                            }
                            
                            Debug.print("finally appended primary finalPrimaryMob :"+finalPrimaryMob);
                            
                            mobile1 = finalPrimaryMob;
                            
                        }
                        
                        String finalPrimaryFax="";
                        
                        if(request.getParameter(fax)!=null) {
                            Debug.print("request.getParameter(fax) value:"+request.getParameter(fax));
                            
                            StringTokenizer strTkns = new StringTokenizer(request.getParameter(fax),"[](),.-{}");
                            
                            while(strTkns.hasMoreTokens()){
                                try{
                                    String phNo = (String)strTkns.nextToken();
                                    
                                    if(phNo!=null && phNo.trim().length()!=0){
                                        Debug.print("ph no Added from Stokenizer:" + phNo);
                                        finalPrimaryFax=finalPrimaryFax+phNo;
                                    }
                                } catch(Exception e){
                                    Debug.print("ph no tokanizing exception:" + e);
                                }
                            }
                            
                            Debug.print("finally appended primary finalPrimaryFax :"+finalPrimaryFax);
                            
                            fax1 = finalPrimaryFax;
                            
                        }
                        
                        boolean amatCrdPossMembStatus1;
                        
                        if(amatCrdPoss1!=null) {
                            amatCrdPossMembStatus1=true;
                            
                        } else {
                            amatCrdPossMembStatus1=false;
                        }
                        Debug.print("amatCrdPossMembStatus1 :"+amatCrdPossMembStatus1);
                        
                        boolean amatCrdEligMembStatus1;
                        
                        if(amatCrdElig1!=null) {
                            amatCrdEligMembStatus1=true;
                            
                        } else {
                            amatCrdEligMembStatus1=false;
                        }
                        Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                        
                        objMember.setAmateurName(nameAmat1);
                        objMember.setAmateurDec1(amatCrdPossMembStatus1);
                        objMember.setAmateurDec2(amatCrdEligMembStatus1);
                        objMember.setMembershipTypeName("Family Member");
                        
                        
                        if(famUser1.equalsIgnoreCase("no")) {
                            
                            Debug.print("::::::: Inside family add-on "+i+"non web user block ::::::");
                            Debug.print("userId :"+userId);
                            
                            String bday =by1+"-"+bm1+"-"+bd1;
                            System.out.println("User DOB of user"+i+"  :"+bday);
                            
                            //objUserMaster.setLoginName(loginame1);
                            objUserMaster.setPrefix(pref);
                            objUserMaster.setFirstName(fname1);
                            objUserMaster.setMiddleName(mname1);
                            objUserMaster.setLastName(lname1);
                            objUserMaster.setSufix(suffix1);
                            
                            objUserMaster.setDob(bday);
                            objUserMaster.setGender(gender1);
                            objUserMaster.setEmailId(emailids1);
                            objUserMaster.setCommunicationAddress("Primary");
                            objUserMaster.setUserTypeName("Human");
                            
                            objContactDetail1=remote.getContactDetailBasedOnUserId(userId);
                            
                            Debug.print("           UserID" + objContactDetail1.getUserId());
                            objContactDetail.setAddress1(objContactDetail1.getAddress1());
                            objContactDetail.setAddress2(objContactDetail1.getAddress2());
                            objContactDetail.setCountry(objContactDetail1.getCountry());
                            objContactDetail.setCity(objContactDetail1.getCity());
                            objContactDetail.setState(objContactDetail1.getState());
                            objContactDetail.setZip(objContactDetail1.getZip());
                            
                            //objContactDetail.setUserId(userId);
                            objContactDetail.setPhoneNo(phone1);
                            objContactDetail.setMobileNo(mobile1);
                            objContactDetail.setFaxNo(fax1);
                            
                            String usrid="";
                            
                            if(r11.equalsIgnoreCase("check")) {
                                usrid=remote.addFamilyAddOn(objUserMaster,objContactDetail);
                        /*Debug.print("Line 3005:");
                        String tempmembId = remote.getMemberIdBasedOnUserId(usrid);
                        String famembId1=request.getParameter("famembId");
                        Debug.print("New Family ID "+famembId1);
                        String[] historyEntry = {renStat,usrid,famembId1,"Family Member",tempmembId};
                        historyTable.add(historyEntry);     */
                                System.out.println("after add-on "+i+" user details insertion usrid :"+usrid);
                            }
                            
                            objMember.setEmailId(emailids1);
                            objMember.setEndowmentTrustAmount("0");
                            objMember.setPaymentId(paymentId);
                            
                            objMember.setParentMemberId(parentId);
                            objMember.setMembershipTypeId(famembId);
                            objMember.setLoginName(loginame1);
                            objMember.setUserId(usrid);
                            
                            String memb="";
                            
                            if(r11.equalsIgnoreCase("check")) {
                                Debug.print("addMemberDetails 6");
                                memb=remote.addMemberDetails(objMember, objPayment1);
                                System.out.println("after add-on "+i+" member details insertion member-Id :"+memb);
                                
                                Debug.print("Line 3015:");
                                String famembId1 = request.getParameter("famembId");
                                Debug.print("famembId   is   "+famembId1);
                                Debug.print("Memb is "+memb);
                                Debug.print("renStat is "+renStat);
                                Debug.print("usrid is "+usrid);
                                String[] historyEntry = {renStat,usrid,famembId1,"Family Member",memb};
                                 Debug.print("historyEntry 10 "+historyEntry);
                                historyTable.add(historyEntry);
                                
                                
                                Debug.print("famUser1.equalsIgnoreCase(\"yes\") "+memb);
                                famIs.add(memb);
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                
                                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                        
                                        if(objPayment.getAmount()<=chk_amt) {
                                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                            
                                            boolean stat=memberRemote.editMemberStatus("Active",memb);
                                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                        }
                                        
                                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                        Debug.print("act_date :"+act_date.toString());
                                        
                                        boolean actDat=remote.updateApprovalDate(memb,act_date);
                                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                        
                                    }
                                }
                                
                            }
                            
                            ArrayList nonWebFam=new ArrayList();
                            
                            nonWebFam.add(objUserMaster);
                            nonWebFam.add(objContactDetail);
                            nonWebFam.add(objMember);
                            nonWebFam.add(objPayment1);
                            
                            addFamNonWeb.add(nonWebFam);
                            
                            Vector uid=new Vector();
                            
                            //uid=(Vector)remote.getUserIdByEmailId(request.getParameter("email"));
                   /* uid=(Vector)remote.getUserIdByLoginName(loginame1);
                    String usrId=(String)uid.elementAt(0);
                    Debug.print("usrId after reg :" +usrId);*/
                            
                   /* String usrId=remote.getUserIdBasedOnMemberId(memb);
                    Debug.print("remote.getUserIdBasedOnMemberId(memb) :"+usrId);*/
                            
                            if(r11.equalsIgnoreCase("check")) {
                                boolean rolestat=roleRemote.createDefaultRole(usrid,defrole);
                                Debug.print("rolestatus :" +rolestat);
                                
                                String[] usrVal={fname1,lname1,bm1,bd1,by1,memb,emailids1,""};
                                context.setAttribute("usrVal",usrVal);
                            }
                            
                   /* String pass=remote.getPasswordByLoginName(loginame1);
                    Debug.print("auto gen pwd for add-on"+i+" :"+pass);*/
                            
                            if(r11.equalsIgnoreCase("check")) {
                                
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                
                                String toMailIds[] = {emailids1};
                                EmailContent email=new EmailContent();
                                email.setTo(toMailIds);
                                email.setFrom("anandv@digiblitz.com");
                                email.setSubject("Your Account Info !");
                                
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
                                        "<span class=\"boldTxt\">Dear " +fname1+"</span>,<br /><br />"+
                                        "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+memb+"<p> Your Parent Member Id : "+result+"<p> ----------------------------<p>"+
                                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                Debug.print("Email sent sucessfully 7:"+emailFlag);
                                
                            }
                        }
                        
                        if(famUser1.equalsIgnoreCase("yes")) {
                            Debug.print("::::::: Inside family add-on "+i+"existing web user block ::::::");
                            
                            String usrName="userNameId"+i;
                            Debug.print("generated usrName :"+usrName);
                            
                            String logName=request.getParameter(usrName);
                            
                            //objMember.setEmailId(emailids1);
                            objMember.setEndowmentTrustAmount("0");
                            
                            objMember.setParentMemberId(parentId);
                            objMember.setMembershipTypeId(famembId);
                            objMember.setLoginName(logName);
                            objMember.setPaymentId(paymentId);
                            
                            Vector usr=new Vector();
                            usr=remote.getUserIdByLoginName(logName);
                            
                            String usrId=(String)usr.elementAt(0);
                            Debug.print("usrId for login name"+logName+" :"+usrId);
                            objMember.setUserId(usrId);
                            
                            ArrayList famWeb=new ArrayList();
                            String memb="";
                            
                            if(r11.equalsIgnoreCase("check")) {
                                Debug.print("addMemberDetails 7");
                                memb=remote.addMemberDetails(objMember, objPayment1);
                                System.out.println("add-on "+i+" existing web user details insertion status :"+memb);
                                Debug.print("Line 3206:");
                                String famembId1 = request.getParameter("famembId");
                                Debug.print("famembId   is   "+famembId1);
                                Debug.print("memb is "+memb);
                                Debug.print("renStat is "+renStat);
                                Debug.print("usrId is "+usrId);
                                String[] historyEntry = {renStat,usrId,famembId1,"Family Member",memb};
                                 Debug.print("historyEntry 11 "+historyEntry);
                                historyTable.add(historyEntry);
                                //
                                // Member Id added here
                                
                                //
                                //
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                
                                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                        
                                        if(objPayment.getAmount()<=chk_amt) {
                                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                            
                                            boolean stat=memberRemote.editMemberStatus("Active",memb);
                                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                        }
                                        
                                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                        Debug.print("act_date :"+act_date.toString());
                                        
                                        boolean actDat=remote.updateApprovalDate(memb,act_date);
                                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                        
                                    }
                                }
                                
                            }
                            
                            famWeb.add(objMember);
                            famWeb.add(objPayment1);
                            
                            addFamWeb.add(famWeb);
                            
                            // getting member id after insert
                            
                            String mId=memb;
                            Debug.print("mId :"+mId);
                            
                            if(r11.equalsIgnoreCase("check")) {
                                
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                
                                String toMailIds[] = {emailids1};
                                EmailContent email=new EmailContent();
                                email.setTo(toMailIds);
                                email.setFrom("anandv@digiblitz.com");
                                email.setSubject("Your Account Info !");
                                
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
                                        "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                        "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+mId+"<p> Parent Member Id : "+result+"<p> ----------------------------<p>"+
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                Debug.print("Email sent sucessfully 8:"+emailFlag);
                                
                            }
                        }
                        
                        if(famUser1.equalsIgnoreCase("mem")) {
                            
                            Debug.print("::::::: Inside family add-on "+i+"existing member block ::::::");
                            
                            String mIdTxt="memberAdd"+i;
                            Debug.print("generated mIdTxt :"+mIdTxt);
                            
                            String exMid=request.getParameter(mIdTxt);
                            Debug.print("existing MemberId :"+exMid);
                            
                            String parId="";
                            parId=(String)session.getAttribute("memberId");
                            Debug.print("parentId :"+parId);
                            
                            Debug.print("amature name :"+nameAmat1);
                            Debug.print("amatCrdPossMembStatus1 :"+amatCrdPossMembStatus1);
                            Debug.print("amatCrdEligMembStatus1 :"+amatCrdEligMembStatus1);
                            
                            String[] addExMemb={exMid,nameAmat1,amatCrdPoss1,amatCrdElig1};
                            
                            addonMemb.add(addExMemb);
                            
                            String usrId=remote.getUserIdBasedOnMemberId(exMid);
                            Debug.print("remote.getUserIdBasedOnMemberId(exMid) :"+usrId);
                            
                            String toMailId="";
                            toMailId=remote.getEmailBasedOnUserId(usrId);
                            Debug.print("remote.getEmailBasedOnUserId(usrId) :"+toMailId);
                            
                            if(r11.equalsIgnoreCase("check")) {
                                String famembId1 = request.getParameter("famembId");
                                Debug.print("famembId   is   "+famembId1);
                                boolean upStatus=remote.updateAddOnExistingMember(exMid,"Pending",parId,paymentId,famembId1);
                                Debug.print("updateAddOnExistingMember(exMid,Pending,parId,paymentId) :"+upStatus);
                                Debug.print("Line 3384:");
                                String[] historyEntry = {"Register",usrId,famembId1,"Family Member",exMid};
                                 Debug.print("historyEntry 12"+historyEntry);
                                historyTable.add(historyEntry);
                                
                                boolean amatStat=remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1);
                                Debug.print("remote.updateAmatureStatus(exMid,nameAmat1,amatCrdPossMembStatus1,amatCrdEligMembStatus1) :"+amatStat);
                                
                                /*
                                 * if Logged by admin or hlc staff
                                 */
                                
                                if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                                    if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                                        //double diff=objPayment.getAmount()-objPayment.getCheckAmount();
                                        
                                        if(objPayment.getAmount()<=chk_amt) {
                                            Debug.print("inside objPayment.getAmount()<=objPayment.getCheckAmount() cond ..");
                                            
                                            boolean stat=memberRemote.editMemberStatus("Active",exMid);
                                            Debug.print("memberRemote.editMemberStatus(Active,cbx) :"+stat);
                                        }
                                        
                                        Date act_date = (Date)sdf.parse(request.getParameter("activeDate"));
                                        Debug.print("act_date :"+act_date.toString());
                                        
                                        boolean actDat=remote.updateApprovalDate(exMid,act_date);
                                        Debug.print("remote.updateApprovalDate(cbx,new Date()) :"+actDat);
                                        
                                    }
                                }
                                
                /* =====================================
                 *
                 * Sending confirmation E-mail
                 *
                 * ====================================*/
                                
                                String toMailIds[] = {toMailId};
                                EmailContent email=new EmailContent();
                                email.setTo(toMailIds);
                                email.setFrom("anandv@digiblitz.com");
                                email.setSubject("Your Account Info !");
                                
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
                                        "<span class=\"boldTxt\">Dear Member,</span>,<br /><br />"+
                                        "<p>Please save this email for your records. Your account information is as follows:.<p>"+"<p>----------------------------<p>"+"<p>Your Member Id :"+exMid+"<p> Parent Member Id : "+parId+"<p> ----------------------------<p>"+
                        /*"<p>Your account would be activated through your confirmation by visiting the following link: <p>"+
                        "<a href=http://192.168.3.98:8090/dashboad-war/uservalidate.do?email="+request.getParameter("email")+"> Click Here to Activate your Account </a>"+*/
                                        "Thank you for using the service provided by <span class=\"boldTxt\">United States Eventing Association</span>.</p>"+
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
                                Debug.print("Email sent sucessfully 9:"+emailFlag);
                                
                            }
                            
                            
                        }
                        
                    }
                    
                }
            }
            
            if(r11.equalsIgnoreCase("card")) {
                session.setAttribute("addFamNonWeb",addFamNonWeb);
                session.setAttribute("addFamWeb",addFamWeb);
                session.setAttribute("addonMemb",addonMemb);
            }
            
        }
        
///////  Phone Service Charge
        
        HLCAccTransactionVO PhaccTxnVO = null;
        HLCAccTransactionVO accTxnVO = new HLCAccTransactionVO();
        int si=0;
        String logBy="user";
        
        if(session.getAttribute("loggedBy")!=null) {
            String loggedBy="";
            loggedBy=(String)session.getAttribute("loggedBy");
            logBy=loggedBy;
            
            PhaccTxnVO = new HLCAccTransactionVO();
            String phoneCharge = request.getParameter("classification0");
            if(phoneCharge!=null){
                String phoneValue[] = phoneCharge.split("#");
                String phoneId = phoneValue[0];
                String phoneamt = phoneValue[2];
                
                HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getPhoneServChgAccTxnTypeDetails(phoneId);
                
                String accNo = accTxnDet.getAccount_no();
                String accClassname = accTxnDet.getClass_name();
                String accItemNo = accTxnDet.getItem_no();
                String accAccNo = accTxnDet.getSub_account_no();
                String accTranName = accTxnDet.getTransaction_name();
                String accTyped = accTxnDet.getTransaction_type();
                String accTypeId = accTxnDet.getTransaction_type_id();
                
                Debug.print("Inside Phone Account No "+accNo);
                Debug.print("Inside Phone Family Class Name "+accClassname);
                Debug.print("Inside Phone Item No "+accItemNo);
                Debug.print("Inside Phone Sub-Account No "+accAccNo);
                Debug.print("Inside Phone Transaction Name "+accTranName);
                Debug.print("Inside Phone Transaction Type "+accTyped);
                Debug.print("Inside Phone Transaction Type Id "+accTypeId);
                
                if(r11.equalsIgnoreCase("check")){
                    PhaccTxnVO.setPayment_mode("check");
                    PhaccTxnVO.setActive_status(false);
                    PhaccTxnVO.setStaff_user_id(staff_user_id);
                    PhaccTxnVO.setStaff_ip_address(reqIp);
                }
                if(r11.equalsIgnoreCase("card")){
                    String cardselect = request.getParameter("cardselect");
                    PhaccTxnVO.setPayment_mode(cardselect);
                    PhaccTxnVO.setActive_status(false);
                }
                PhaccTxnVO.setSub_account_no(accAccNo);
                PhaccTxnVO.setPayment_id(paymentId);
                PhaccTxnVO.setAccount_type("Income");
                PhaccTxnVO.setClass_Typ(accClassname);
                
                PhaccTxnVO.setAccount_no(accNo);
                PhaccTxnVO.setItem_no(accItemNo);
                PhaccTxnVO.setAmount(Float.parseFloat(phoneamt));
                PhaccTxnVO.setDescription(accTranName);
            }
        }
        
        if(r11.equals("check")){
            if(PhaccTxnVO!=null){
                boolean status = mahaRemote.insertAccountTxnDetails(PhaccTxnVO);
                Debug.print("mahaRemote.insertAccountTxnDetails(phoneVO) for Phone Service :"+status);
            }
        } else{
            Debug.print("mahaRemote.insertAccountTxnDetails(phoneVO) for Phone Service");
            session.setAttribute("PhoneVO",PhaccTxnVO);
        }
        
        String membTypeId= request.getParameter("selDisp");
        if(renStat!=null){
            Debug.print("renStat is "+renStat);
            if(renStat.equalsIgnoreCase("renew")){
                Debug.print("renStat is "+renStat);
                String memberTypeId = request.getParameter("memberTypeId");
                Debug.print("memberTypeId "+memberTypeId);
                session.setAttribute("membTypeId",memberTypeId);
            }
        } else if(membTypeId!=null && membTypeId.trim().length()!=0){
            String memTyp[] =membTypeId.split("#");
            Debug.print("memTypId[0] setting as attribute "+memTyp[0]);
            if(memTyp[0]!=null && memTyp[0].trim().length()!=0){
                session.setAttribute("membTypeId",memTyp[0]);
            }
        } else{
            Debug.print("Exceptional case ");
            Debug.print("renStat value is "+renStat);
        }
///////////////////// Publication Transaction Entries
        
//mailOptQuesti
        String mailOptQuesti = request.getParameter("mailOptQuesti");
        Debug.print("mailOptQuesti is : "+mailOptQuesti);
        if(mailOptQuesti==null){
            String[] pubId=request.getParameterValues("mailOpt1");
            Debug.print("pubId [] is "+pubId);
            if(pubId!=null){
                String ctryAmt = request.getParameter("ctryAmt");
                
                if(ctryAmt!=null && ctryAmt.trim().length()!=0){
                    float mailingAmt = Float.parseFloat(ctryAmt);
                    Debug.print(" mailingAmt  is  "+ mailingAmt);
                    if(mailingAmt > 0){
                        HLCAccTransactionVO transDetVO = new HLCAccTransactionVO();
                        HLCAccTxnTypeDetailVO transTxnDet = mahaRemote.getAccTransactionTypeDetailBasedOnTran_Name("Shipping Charges");
                        
                        String accNo = transTxnDet.getAccount_no();
                        String accClassname = transTxnDet.getClass_name();
                        String accItemNo = transTxnDet.getItem_no();
                        String accAccNo = transTxnDet.getSub_account_no();
                        String accTranName = transTxnDet.getTransaction_name();
                        String accTyped = transTxnDet.getTransaction_type();
                        String accTypeId = transTxnDet.getTransaction_type_id();
                        
                        transDetVO.setAmount(mailingAmt);
                        transDetVO.setPayment_id(paymentId);
                        transDetVO.setAccount_type("Income");
                        transDetVO.setClass_Typ(accClassname);
                        transDetVO.setAccount_no(accNo);
                        transDetVO.setItem_no(accItemNo);
                        transDetVO.setSub_account_no(accAccNo);
                        transDetVO.setDescription(accTranName);
                        
                        Debug.print("Transaction Detail VO "+ transDetVO);
                        if(r11!=null){
                            if(r11.equalsIgnoreCase("check")){
                                // Setting staff user_id and ip_address
                                if(session.getAttribute("loggedBy")!=null) {
                                    String loggedBy="";
                                    loggedBy=(String)session.getAttribute("loggedBy");
                                    logBy=loggedBy;
                                    
                                    transDetVO.setStaff_user_id(staff_user_id);
                                    transDetVO.setStaff_ip_address(reqIp);
                                }
                                //End Setting staff_user_id and ip_address
                                transDetVO.setPayment_mode("check");
                                transDetVO.setActive_status(false);
                            }
                            if(r11.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("cardselect");
                                transDetVO.setPayment_mode(cardselect);
                                transDetVO.setActive_status(false);
                            }
                            if(r11.equalsIgnoreCase("check")){
                                boolean status = mahaRemote.insertAccountTxnDetails(transDetVO);
                                Debug.print("mahaRemote.insertAccountTxnDetails(transDetVO) for Member addon no"+status);
                            }
                            if(r11.equalsIgnoreCase("card")){
                                Debug.print(" Session Attribute for mail options ");
                                session.setAttribute("mailOptions",transDetVO);
                            }
                        }
                    }
                }
            }
        }
        
// Subscribing Member Mail Options
        String mailOptQuestion = request.getParameter("mailOptQuestion");
        Debug.print("mailOptQuestion is : "+mailOptQuestion);
        if(mailOptQuestion==null){
            String[] pubId=request.getParameterValues("submailOpt1");
            Debug.print("pubId [] is "+pubId);
            if(pubId!=null){
                String ctryAmt = request.getParameter("ctryAmt");
                
                if(ctryAmt!=null && ctryAmt.trim().length()!=0){
                    float mailingAmt = Float.parseFloat(ctryAmt);
                    Debug.print(" mailingAmt  is  "+ mailingAmt);
                    if(mailingAmt > 0){
                        HLCAccTransactionVO transDetVO = new HLCAccTransactionVO();
                        HLCAccTxnTypeDetailVO transTxnDet = mahaRemote.getAccTransactionTypeDetailBasedOnTran_Name("Shipping Charges");
                        
                        String accNo = transTxnDet.getAccount_no();
                        String accClassname = transTxnDet.getClass_name();
                        String accItemNo = transTxnDet.getItem_no();
                        String accAccNo = transTxnDet.getSub_account_no();
                        String accTranName = transTxnDet.getTransaction_name();
                        String accTyped = transTxnDet.getTransaction_type();
                        String accTypeId = transTxnDet.getTransaction_type_id();
                        
                        transDetVO.setAmount(mailingAmt);
                        transDetVO.setPayment_id(paymentId);
                        transDetVO.setAccount_type("Income");
                        transDetVO.setClass_Typ(accClassname);
                        //armBandaccTxnVO.setUser_id(userId);
                        //armBandaccTxnVO.setIp_address(reqIp);
                        transDetVO.setAccount_no(accNo);
                        transDetVO.setItem_no(accItemNo);
                        transDetVO.setSub_account_no(accAccNo);
                        transDetVO.setDescription(accTranName);
                        
                        Debug.print("Transaction Detail VO "+ transDetVO);
                        if(r11!=null){
                            if(r11.equalsIgnoreCase("check")){
                                transDetVO.setPayment_mode("check");
                                transDetVO.setActive_status(false);
                            }
                            if(r11.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("cardselect");
                                transDetVO.setPayment_mode(cardselect);
                                transDetVO.setActive_status(false);
                            }
                            if(r11.equalsIgnoreCase("check")){
                                // Setting staff user_id and ip_address
                                if(session.getAttribute("loggedBy")!=null) {
                                    String loggedBy="";
                                    loggedBy=(String)session.getAttribute("loggedBy");
                                    logBy=loggedBy;
                                    
                                    transDetVO.setStaff_user_id(staff_user_id);
                                    transDetVO.setStaff_ip_address(reqIp);
                                }
                                //End Setting staff_user_id and ip_address
                                boolean status = mahaRemote.insertAccountTxnDetails(transDetVO);
                                Debug.print("mahaRemote.insertAccountTxnDetails(transDetVO) for Member addon no"+status);
                            }
                            if(r11.equalsIgnoreCase("card")){
                                Debug.print(" Session Attribute for mail options ");
                                session.setAttribute("mailOptions",transDetVO);
                            }
                        }
                    }
                }
            }
        }
///////////////////// ArmBand Transaction Entry
        HLCAccTransactionVO armBandaccTxnVO = new HLCAccTransactionVO();
        HLCAccTxnTypeDetailVO armBan_accTxnDet = mahaRemote.getArmBandAccTxnTypeDetails();
        String armband = request.getParameter("armband");
        float armbandQty1 =0;
        if(armband!=null || armband.trim().length()!=0){
            armbandQty1 = Float.parseFloat(armband);
        }
        if(armbandQty1>0){
            if(armBan_accTxnDet!=null){
                if(r11.equalsIgnoreCase("check")){
                    armBandaccTxnVO.setPayment_mode("check");
                    armBandaccTxnVO.setActive_status(false);
                    
                }
                if(r11.equalsIgnoreCase("card")){
                    String cardselect = request.getParameter("cardselect");
                    armBandaccTxnVO.setPayment_mode(cardselect);
                    armBandaccTxnVO.setActive_status(false);
                }
                
                String accNo = armBan_accTxnDet.getAccount_no();
                String accClassname = armBan_accTxnDet.getClass_name();
                String accItemNo = armBan_accTxnDet.getItem_no();
                String accAccNo = armBan_accTxnDet.getSub_account_no();
                String accTranName = armBan_accTxnDet.getTransaction_name();
                String accTyped = armBan_accTxnDet.getTransaction_type();
                String accTypeId = armBan_accTxnDet.getTransaction_type_id();
                
                armBandaccTxnVO.setAmount(armbandQty1);
                armBandaccTxnVO.setPayment_id(paymentId);
                armBandaccTxnVO.setAccount_type("Income");
                armBandaccTxnVO.setClass_Typ(accClassname);
                //armBandaccTxnVO.setUser_id(userId);
                //armBandaccTxnVO.setIp_address(reqIp);
                armBandaccTxnVO.setAccount_no(accNo);
                armBandaccTxnVO.setItem_no(accItemNo);
                armBandaccTxnVO.setSub_account_no(accAccNo);
                armBandaccTxnVO.setDescription(accTranName);
                
                if(r11.equalsIgnoreCase("check")){
                    // Setting staff user_id and ip_address
                    if(session.getAttribute("loggedBy")!=null) {
                        String loggedBy="";
                        loggedBy=(String)session.getAttribute("loggedBy");
                        logBy=loggedBy;
                        
                        
                        armBandaccTxnVO.setStaff_user_id(staff_user_id);
                        armBandaccTxnVO.setStaff_ip_address(reqIp);
                        
                    }
                    //End Setting staff_user_id and ip_address
                    boolean status = mahaRemote.insertAccountTxnDetails(armBandaccTxnVO);
                    Debug.print("mahaRemote.insertAccountTxnDetails(armBandaccTxnVO) for selected membership :"+status);
                }
                if(r11.equalsIgnoreCase("card")){
                    Debug.print("mahaRemote.insertAccountTxnDetails(armBandaccTxnVO) for selected membership :"+armBandaccTxnVO);
                    session.setAttribute("armBand",armBandaccTxnVO);
                }
            }
        }
        
///////////////////// Donation Transaction Entry
        HLCAccTransactionVO donaaccTxnVO = new HLCAccTransactionVO();
        String donCbxCt=request.getParameter("donCbxCt");
        if(donCbxCt!=null || donCbxCt.trim().length()!=0){
            int donCt=Integer.parseInt(donCbxCt);
            Debug.print("donCt :"+donCt);
            ArrayList donationDet=new ArrayList();
            ArrayList don_txnVO = new ArrayList();
            for(int d=0;d<donCt;d++) {
                donaaccTxnVO = new HLCAccTransactionVO();
                String doncbname="donCb"+d;
                String dontbname="donTb"+d;
                String donNametbname="donNametb"+d;
                String donPrice ="";
                
                System.out.print("dontbname :"+dontbname);
                System.out.print("doncbname :"+doncbname);
                System.out.print("donNametbname :"+donNametbname);
                Debug.print("userId from session :"+userId);
                
                String donChkVal=request.getParameter(doncbname);
                Debug.print("donChkVal :"+donChkVal);
                
                if(donChkVal!=null) {
                    String[] DonId=donChkVal.split("#");
                    Debug.print("DonId :"+DonId[0]);
                    
                    donPrice=request.getParameter(dontbname);
                    Debug.print("donPrice :"+donPrice);
                    
                    String donatorName=request.getParameter(donNametbname);
                    Debug.print("donatorName :"+donatorName);
                    
                    if(r11.equalsIgnoreCase("check")) {
                        Debug.print("paymentId in servlet :"+paymentId);
                        
                        boolean donstat=remote.insertDonationPriceDetails(userId,DonId[0],donPrice,donatorName,paymentId);
                        Debug.print("donation "+d+"insert status:"+donstat);
                    }
                    
                    String[] donDet={userId,DonId[0],donPrice,donatorName};
                    donationDet.add(donDet);
                    
                    //boolean donstat=remote.insertDonationPriceDetails(memberId,DonId[0],donPrice,donatorName);
                    //Debug.print("donation "+d+"insert status:"+donstat);
                    if(DonId[0]!=null || DonId[0].trim().length()!=0){
                        HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getDonationAccTxnTypeDetails(DonId[0]);
                        accTxnVO = new HLCAccTransactionVO();
                        
                        String accNo = accTxnDet.getAccount_no();
                        String accClassname = accTxnDet.getClass_name();
                        String accItemNo = accTxnDet.getItem_no();
                        String accAccNo = accTxnDet.getSub_account_no();
                        String accTranName = accTxnDet.getTransaction_name();
                        String accTyped = accTxnDet.getTransaction_type();
                        String accTypeId = accTxnDet.getTransaction_type_id();
                        
                        if(r11.equalsIgnoreCase("check")){
                            donaaccTxnVO.setPayment_mode("check");
                            donaaccTxnVO.setActive_status(false);
                        }
                        if(r11.equalsIgnoreCase("card")){
                            String cardselect = request.getParameter("cardselect");
                            donaaccTxnVO.setPayment_mode(cardselect);
                            donaaccTxnVO.setActive_status(false);
                        }
                        Debug.print("donPrice  "+donPrice);
                        
                        if(donPrice!=null && donPrice.trim().length()!=0){
                            Debug.print("Inside Donation Amount is "+donPrice);
                            donaaccTxnVO.setAmount(Float.parseFloat(donPrice));
                        } else{
                            Debug.print("Inside Donation Amount is "+donPrice);
                            donaaccTxnVO.setAmount(0);
                        }
                        
                        donaaccTxnVO.setAccount_type("Income");
                        donaaccTxnVO.setClass_Typ(accClassname);
                        donaaccTxnVO.setAccount_no(accNo);
                        donaaccTxnVO.setItem_no(accItemNo);
                        donaaccTxnVO.setDescription(accTranName);
                        donaaccTxnVO.setPayment_id(paymentId);
                        donaaccTxnVO.setSub_account_no(accAccNo);
                        
                        if(r11.equalsIgnoreCase("check")){
                            // Setting staff user_id and ip_address
                            if(session.getAttribute("loggedBy")!=null) {
                                String loggedBy="";
                                loggedBy=(String)session.getAttribute("loggedBy");
                                logBy=loggedBy;
                                
                                donaaccTxnVO.setStaff_user_id(staff_user_id);
                                donaaccTxnVO.setStaff_ip_address(reqIp);
                                
                            }
                            //End Setting staff_user_id and ip_address
                            boolean status = mahaRemote.insertAccountTxnDetails(donaaccTxnVO);
                            Debug.print("mahaRemote.insertAccountTxnDetails(donaaccTxnVO) for Member addon no"+status);
                        }
                        don_txnVO.add(donaaccTxnVO);
                    }
                }
            }
            if(r11.equalsIgnoreCase("card")){
                Debug.print("mahaRemote.insertAccountTxnDetails(donationNo) for Member addon no"+donaaccTxnVO);
                Debug.print("mahaRemote.insertAccountTxnDetails(donCt) for Member addon no"+donCt);
                session.setAttribute("donationNo",don_txnVO);
                session.setAttribute("donCt",String.valueOf(donCt));
            }
            if(r11.equalsIgnoreCase("card")){
                session.setAttribute("donationDet",donationDet);
            }
        }
        
///// renStat Is NULL
        if(renStat==null){
            Debug.print("renStat is null");
            
            String addCt = request.getParameter("famMemb");
            String famembId = request.getParameter("famembId");
            Debug.print("addon count for insertAccountTxnDetails :"+addCt);
            int addCount = 0;
            
            String addOnAmt = request.getParameter("addOnAmount");
            float addOnAmount = 0;
            
            String totDonaAmt = request.getParameter("totDonaAmt");
            Debug.print("totDonaAmt for insertAccountTxnDetails :"+totDonaAmt);
            addOnAmt="500";
            if(addOnAmt!=null && addOnAmt.trim().length()!=0) {
                addOnAmount = Float.parseFloat(addOnAmt);
            }
            if(addCt != null && addCt.trim().length()!=0) {
                addCount = Integer.parseInt(addCt);
            }
            HLCAccTransactionVO familyaccTxnVO = new HLCAccTransactionVO();
            ArrayList familyTxnVO = new ArrayList();
///////////////////// Family Transaction Entry
            for(int i=0;addCount>i;i++) {
                
                if(famembId!=null || famembId.trim().length()!=0){
                    
                    HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(famembId);
                    
                    String accNo = accTxnDet.getAccount_no();
                    String accClassname = accTxnDet.getClass_name();
                    String accItemNo = accTxnDet.getItem_no();
                    String accAccNo = accTxnDet.getSub_account_no();
                    String accTranName = accTxnDet.getTransaction_name();
                    String accTyped = accTxnDet.getTransaction_type();
                    String accTypeId = accTxnDet.getTransaction_type_id();
                    
                    if(r11.equalsIgnoreCase("check")){
                        familyaccTxnVO.setPayment_mode("check");
                        familyaccTxnVO.setActive_status(false);
                    }
                    if(r11.equalsIgnoreCase("card")){
                        String cardselect = request.getParameter("cardselect");
                        familyaccTxnVO.setPayment_mode(cardselect);
                        familyaccTxnVO.setActive_status(false);
                    }
                    familyaccTxnVO.setPayment_id(paymentId);
                    familyaccTxnVO.setAccount_type("Income");
                    familyaccTxnVO.setClass_Typ(accClassname);
                    //familyaccTxnVO.setUser_id(userId);
                    //familyaccTxnVO.setIp_address(reqIp);
                    familyaccTxnVO.setAccount_no(accNo);
                    familyaccTxnVO.setItem_no(accItemNo);
                    familyaccTxnVO.setAmount(addOnAmount);
                    familyaccTxnVO.setDescription(accTranName);
                    familyaccTxnVO.setSub_account_no(accAccNo);
                    
                    familyTxnVO.add(familyaccTxnVO) ;
                    Debug.print("familyTxnVO Size is "+familyTxnVO.size());
                    if(r11.equalsIgnoreCase("check")){
                        // Setting staff user_id and ip_address
                        if(session.getAttribute("loggedBy")!=null) {
                            String loggedBy="";
                            loggedBy=(String)session.getAttribute("loggedBy");
                            logBy=loggedBy;
                            
                            
                            familyaccTxnVO.setStaff_user_id(staff_user_id);
                            familyaccTxnVO.setStaff_ip_address(reqIp);
                            
                        }
                        //End Setting staff_user_id and ip_address
                        boolean status = mahaRemote.insertAccountTxnDetails(familyaccTxnVO);
                        Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO) for Donation :"+status);
                    }
                }
            }
            Debug.print("addCount is session "+addCount);
            Debug.print("Size of familyTxnVO session is "+familyTxnVO.size());
            
            session.setAttribute("addCount",String.valueOf(addCount));
            session.setAttribute("familyTxnVO",familyTxnVO);
            
            HLCAccTransactionVO membaccTxnVO = new HLCAccTransactionVO();
            String selDisp = request.getParameter("selDisp");
            if(selDisp != null) {
                String selTyp[] = selDisp.split("#");
                
                float memAmt = Float.parseFloat(selTyp[2]);
                accTxnVO.setDescription(selTyp[1]);
                accTxnVO.setAmount(memAmt);
                HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(accMembTypeId);
                
                if(r11.equalsIgnoreCase("check")){
                    membaccTxnVO.setPayment_mode("check");
                    membaccTxnVO.setActive_status(false);
                    
                }
                if(r11.equalsIgnoreCase("card")){
                    String cardselect = request.getParameter("cardselect");
                    membaccTxnVO.setPayment_mode(cardselect);
                    membaccTxnVO.setActive_status(false);
                }
                
                String amount_txt = request.getParameter("amount_txt");
                Debug.print("Amount_txt  is "+ amount_txt);
                if(amount_txt!=null || amount_txt.trim().length()!=0){
                    membaccTxnVO.setAmount(Float.parseFloat(amount_txt));
                } else{
                    membaccTxnVO.setAmount(0);
                }
                
                String accNo = accTxnDet.getAccount_no();
                String accClassname = accTxnDet.getClass_name();
                String accItemNo = accTxnDet.getItem_no();
                String accAccNo = accTxnDet.getSub_account_no();
                String accTranName = accTxnDet.getTransaction_name();
                String accTyped = accTxnDet.getTransaction_type();
                String accTypeId = accTxnDet.getTransaction_type_id();
                
                membaccTxnVO.setPayment_id(paymentId);
                membaccTxnVO.setAccount_type("Income");
                membaccTxnVO.setClass_Typ(accClassname);
                //membaccTxnVO.setUser_id(userId);
                //membaccTxnVO.setIp_address(reqIp);
                membaccTxnVO.setAccount_no(accNo);
                membaccTxnVO.setItem_no(accItemNo);
                membaccTxnVO.setSub_account_no(accAccNo);
                membaccTxnVO.setDescription(accTranName);
                
                if(r11.equalsIgnoreCase("check")){
                    // Setting staff user_id and ip_address
                    if(session.getAttribute("loggedBy")!=null) {
                        String loggedBy="";
                        loggedBy=(String)session.getAttribute("loggedBy");
                        logBy=loggedBy;
                        
                        
                        membaccTxnVO.setStaff_user_id(staff_user_id);
                        membaccTxnVO.setStaff_ip_address(reqIp);
                        
                    }
                    //End Setting staff_user_id and ip_address
                    boolean status = mahaRemote.insertAccountTxnDetails(membaccTxnVO);
                    Debug.print("mahaRemote.insertAccountTxnDetails(membaccTxnVO) for selected membership :"+status);
                }
                if(r11.equalsIgnoreCase("card")){
                    Debug.print("mahaRemote.insertAccountTxnDetails(membaccTxnVO) session variable "+membaccTxnVO);
                    session.setAttribute("member",membaccTxnVO);
                }
            }
        }
        
        ArrayList familyTxnVO = null;
        if(renStat != null){
            if(!renStat.equalsIgnoreCase("upgrade")){
                if(!renStat.equalsIgnoreCase("renew")){
                    Debug.print("Inside Check Section renSat Value is  "+renStat);
                    ArrayList familyrenewTxnVO = new ArrayList();
                    String addCt = request.getParameter("famMemb");
                    String famembId = request.getParameter("famembId");
                    Debug.print("addon count for insertAccountTxnDetails :"+addCt);
                    int addCount = 0;
                    
                    String addOnAmt = request.getParameter("addOnAmount");
                    float addOnAmount = 0;
                    
                    String totDonaAmt = request.getParameter("totDonaAmt");
                    Debug.print("totDonaAmt for insertAccountTxnDetails :"+totDonaAmt);
                    
                    if(addOnAmt!=null && addOnAmt.trim().length()!=0) {
                        addOnAmount = Float.parseFloat(addOnAmt);
                    }
                    if(addCt != null && addCt.trim().length()!=0) {
                        addCount = Integer.parseInt(addCt);
                    }
                    session.setAttribute("addCount",String.valueOf(addCount));
///////////////////// Family Transaction Entry
                    for(int i=0;addCount>i;i++) {
                        if(famembId!=null || famembId.trim().length()!=0){
                            
                            HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(famembId);
                            
                            String accNo = accTxnDet.getAccount_no();
                            String accClassname = accTxnDet.getClass_name();
                            String accItemNo = accTxnDet.getItem_no();
                            String accAccNo = accTxnDet.getSub_account_no();
                            String accTranName = accTxnDet.getTransaction_name();
                            String accTyped = accTxnDet.getTransaction_type();
                            String accTypeId = accTxnDet.getTransaction_type_id();
                            
                            if(r11.equalsIgnoreCase("check")){
                                accTxnVO.setPayment_mode("check");
                                accTxnVO.setActive_status(false);
                            }
                            if(r11.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("cardselect");
                                accTxnVO.setPayment_mode(cardselect);
                                accTxnVO.setActive_status(false);
                            }
                            accTxnVO.setPayment_id(paymentId);
                            accTxnVO.setAccount_type("Income");
                            accTxnVO.setClass_Typ(accClassname);
                            accTxnVO.setAccount_no(accNo);
                            accTxnVO.setItem_no(accItemNo);
                            accTxnVO.setAmount(addOnAmount);
                            accTxnVO.setDescription(accTranName);
                            accTxnVO.setSub_account_no(accAccNo);
                            
                            familyrenewTxnVO.add(accTxnVO) ;
                            
                            Debug.print("familyTxnVO Size is "+familyrenewTxnVO.size());
                            if(r11.equalsIgnoreCase("check")){
                                // Setting staff user_id and ip_address
                                if(session.getAttribute("loggedBy")!=null) {
                                    String loggedBy="";
                                    loggedBy=(String)session.getAttribute("loggedBy");
                                    logBy=loggedBy;
                                    
                                    
                                    accTxnVO.setStaff_user_id(staff_user_id);
                                    accTxnVO.setStaff_ip_address(reqIp);
                                    
                                }
                                //End Setting staff_user_id and ip_address
                                boolean status = mahaRemote.insertAccountTxnDetails(accTxnVO);
                                Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO) for Donation :"+status);
                            }
                        }
                    }
                    session.setAttribute("familyTxnVO",familyrenewTxnVO);
                }
            }
        }
        
//////For the whole Transaction Entries
///////////////////// Member Transaction Entry
        if(renStat!=null){
            if (!renStat.equalsIgnoreCase("renew")){
                HLCAccTransactionVO updownaccTxnVO = new HLCAccTransactionVO();
                Debug.print("Inside Check Section renSat Value is  "+renStat);
                String selDisp = request.getParameter("selDisp");
                
                if(selDisp != null) {
                    String selTyp[] = selDisp.split("#");
                    
                    float memAmt = Float.parseFloat(selTyp[2]);
                    // accTxnVO.setDescription(selTyp[1]);
                    //accTxnVO.setAmount(memAmt);
                    HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(accMembTypeId);
                    
                    if(r11.equalsIgnoreCase("check")){
                        updownaccTxnVO.setPayment_mode("check");
                        updownaccTxnVO.setActive_status(false);
                        
                    }
                    if(r11.equalsIgnoreCase("card")){
                        String cardselect = request.getParameter("cardselect");
                        updownaccTxnVO.setPayment_mode(cardselect);
                        updownaccTxnVO.setActive_status(false);
                    }
                    
                    String amount_txt = request.getParameter("amount_txt");
                    Debug.print("Amount_txt  is "+ amount_txt);
                    if(amount_txt!=null || amount_txt.trim().length()!=0){
                        updownaccTxnVO.setAmount(Float.parseFloat(amount_txt));
                    } else{
                        updownaccTxnVO.setAmount(0);
                    }
                    
                    String accNo = accTxnDet.getAccount_no();
                    String accClassname = accTxnDet.getClass_name();
                    String accItemNo = accTxnDet.getItem_no();
                    String accAccNo = accTxnDet.getSub_account_no();
                    String accTranName = accTxnDet.getTransaction_name();
                    String accTyped = accTxnDet.getTransaction_type();
                    String accTypeId = accTxnDet.getTransaction_type_id();
                    
                    updownaccTxnVO.setPayment_id(paymentId);
                    updownaccTxnVO.setAccount_type("Income");
                    updownaccTxnVO.setClass_Typ(accClassname);
                    //updownaccTxnVO.setUser_id(userId);
                    //updownaccTxnVO.setIp_address(reqIp);
                    updownaccTxnVO.setAccount_no(accNo);
                    updownaccTxnVO.setItem_no(accItemNo);
                    updownaccTxnVO.setSub_account_no(accAccNo);
                    updownaccTxnVO.setDescription(accTranName);
                    
                    if(r11.equalsIgnoreCase("check")){
                        // Setting staff user_id and ip_address
                        if(session.getAttribute("loggedBy")!=null) {
                            String loggedBy="";
                            loggedBy=(String)session.getAttribute("loggedBy");
                            logBy=loggedBy;
                            
                            
                            updownaccTxnVO.setStaff_user_id(staff_user_id);
                            updownaccTxnVO.setStaff_ip_address(reqIp);
                            
                        }
                        //End Setting staff_user_id and ip_address
                        boolean status = mahaRemote.insertAccountTxnDetails(updownaccTxnVO);
                        Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO) for selected membership :"+status);
                    } else{
                        session.setAttribute("member",updownaccTxnVO);
                    }
                }
            }
        }
        
///////Upgrade In Check
        HLCAccTransactionVO upgrdeaccTxnVO = new HLCAccTransactionVO();
        if(renStat!=null){
            if(renStat.equalsIgnoreCase("upgrade")){
                session.setAttribute("renStat",renStat);
                Debug.print("Inside Check Section renSat Value is  "+renStat);
                Debug.print("!!!!!!!!!!!!!!!!Inside Check Upgrade !!!!!!!!!!!!!!!!!!!!!");
                String pay_mode=request.getParameter("r11");
                String UpgrdmemberTypeId= request.getParameter("memberTypeId");
                Debug.print("Upgrade MemberTypeId is  "+UpgrdmemberTypeId);
                
                HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(UpgrdmemberTypeId);
                
                if(UpgrdmemberTypeId!=null || UpgrdmemberTypeId.trim().length()!=0) {
                    String subscribChrgStat = request.getParameter("subscribChrgStat");
                    Debug.print("subscribChrgStat status is "+subscribChrgStat);
                    if(subscribChrgStat!=null){
                        if(!subscribChrgStat.equalsIgnoreCase("chargable")){
                            if(pay_mode.equalsIgnoreCase("check")){
                                upgrdeaccTxnVO.setPayment_mode("check");
                                upgrdeaccTxnVO.setActive_status(false);
                            }
                            
                            if(pay_mode.equalsIgnoreCase("card")){
                                String cardselect = request.getParameter("cardselect");
                                upgrdeaccTxnVO.setPayment_mode(cardselect);
                                upgrdeaccTxnVO.setActive_status(false);
                            }
                            
                            String membershipAmount = request.getParameter("membershipAmount");
                            Debug.print("Membership Amount "+membershipAmount);
                            
                            if(membershipAmount!=null || membershipAmount.trim().length()!=0){
                                membershipAmount ="-"+membershipAmount;
                                upgrdeaccTxnVO.setAmount(Float.parseFloat(membershipAmount));
                            } else{
                                upgrdeaccTxnVO.setAmount(0);
                            }
                            
                            String accNo = accTxnDet.getAccount_no();
                            String accClassname = accTxnDet.getClass_name();
                            String accItemNo = accTxnDet.getItem_no();
                            String accAccNo = accTxnDet.getSub_account_no();
                            String accTranName = accTxnDet.getTransaction_name();
                            String accTyped = accTxnDet.getTransaction_type();
                            String accTypeId = accTxnDet.getTransaction_type_id();
                            
                            upgrdeaccTxnVO.setAccount_type("Income");
                            upgrdeaccTxnVO.setClass_Typ(accClassname);
                            //upgrdeaccTxnVO.setUser_id(userId);
                            //upgrdeaccTxnVO.setIp_address(reqIp);
                            upgrdeaccTxnVO.setAccount_no(accNo);
                            upgrdeaccTxnVO.setItem_no(accItemNo);
                            upgrdeaccTxnVO.setSub_account_no(accAccNo);
                            upgrdeaccTxnVO.setPayment_id(paymentId);
                            upgrdeaccTxnVO.setDescription(accTranName);
                            
                            if(pay_mode.equalsIgnoreCase("check")){
                                // Setting staff user_id and ip_address
                                if(session.getAttribute("loggedBy")!=null) {
                                    String loggedBy="";
                                    loggedBy=(String)session.getAttribute("loggedBy");
                                    logBy=loggedBy;
                                    
                                    
                                    upgrdeaccTxnVO.setStaff_user_id(staff_user_id);
                                    upgrdeaccTxnVO.setStaff_ip_address(reqIp);
                                    
                                }
                                //End Setting staff_user_id and ip_address
                                boolean Acc_status = mahaRemote.insertAccountTxnDetails(upgrdeaccTxnVO);
                                Debug.print("mahaRemote.insertAccountTxnDetails(upgrdeaccTxnVO) for selected membership :"+Acc_status);
                            }
                            if(pay_mode.equalsIgnoreCase("card")){
                                session.setAttribute("upgrdemember",upgrdeaccTxnVO);
                            }
                        }
                    }
                }
                
                Debug.print("Inside Check Section renSat Value is  "+renStat);
                ArrayList familyrenewTxnVO = new ArrayList();
                String addCt = request.getParameter("famMemb");
                String famembId = request.getParameter("famembId");
                Debug.print("addon count for insertAccountTxnDetails :"+addCt);
                int addCount = 0;
                
                String addOnAmt = request.getParameter("addOnAmount");
                float addOnAmount = 0;
                
                String totDonaAmt = request.getParameter("totDonaAmt");
                Debug.print("totDonaAmt for insertAccountTxnDetails :"+totDonaAmt);
                
                if(addOnAmt!=null && addOnAmt.trim().length()!=0) {
                    addOnAmount = Float.parseFloat(addOnAmt);
                }
                if(addCt != null && addCt.trim().length()!=0) {
                    addCount = Integer.parseInt(addCt);
                }
                session.setAttribute("addCount",String.valueOf(addCount));
///////////////////// Family Transaction Entry
                for(int i=0;addCount>i;i++) {
                    if(famembId!=null || famembId.trim().length()!=0){
                        
                        HLCAccTxnTypeDetailVO faaccTxnDet = mahaRemote.getMemberAccTxnTypeDetails(famembId);
                        
                        String accNo = faaccTxnDet.getAccount_no();
                        String accClassname = faaccTxnDet.getClass_name();
                        String accItemNo = faaccTxnDet.getItem_no();
                        String accAccNo = faaccTxnDet.getSub_account_no();
                        String accTranName = faaccTxnDet.getTransaction_name();
                        String accTyped = faaccTxnDet.getTransaction_type();
                        String accTypeId = faaccTxnDet.getTransaction_type_id();
                        
                        if(r11.equalsIgnoreCase("check")){
                            accTxnVO.setPayment_mode("check");
                            accTxnVO.setActive_status(false);
                        }
                        if(r11.equalsIgnoreCase("card")){
                            String cardselect = request.getParameter("cardselect");
                            accTxnVO.setPayment_mode(cardselect);
                            accTxnVO.setActive_status(false);
                        }
                        accTxnVO.setPayment_id(paymentId);
                        accTxnVO.setAccount_type("Income");
                        accTxnVO.setClass_Typ(accClassname);
                        //accTxnVO.setUser_id(userId);
                        //accTxnVO.setIp_address(reqIp);
                        accTxnVO.setAccount_no(accNo);
                        accTxnVO.setItem_no(accItemNo);
                        accTxnVO.setAmount(addOnAmount);
                        accTxnVO.setDescription(accTranName);
                        accTxnVO.setSub_account_no(accAccNo);
                        
                        familyrenewTxnVO.add(accTxnVO) ;
                        
                        
                        Debug.print("familyTxnVO Size is "+familyrenewTxnVO.size());
                        if(r11.equalsIgnoreCase("check")){
                            // Setting staff user_id and ip_address
                            if(session.getAttribute("loggedBy")!=null) {
                                String loggedBy="";
                                loggedBy=(String)session.getAttribute("loggedBy");
                                logBy=loggedBy;
                                
                                
                                accTxnVO.setStaff_user_id(staff_user_id);
                                accTxnVO.setStaff_ip_address(reqIp);
                                
                            }
                            //End Setting staff_user_id and ip_address
                            boolean status = mahaRemote.insertAccountTxnDetails(accTxnVO);
                            Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO) for Donation :"+status);
                        }
                    }
                }
                session.setAttribute("familyTxnVO",familyrenewTxnVO);
            }
        }
        
        
        if(renStat!=null){
            if(renStat.equalsIgnoreCase("renew")){
                
                Debug.print("!!!!!!!!!!!!!!!!!!!In the check renew section !!!!!!!!!!!!!!!!!!!!!");
                
                Debug.print("Inside card section renStat    " +renStat);
                
                String addCt = request.getParameter("famMemb");
                String famembId = request.getParameter("famembId");
                Debug.print("addon count for insertAccountTxnDetails :"+addCt);
                int addCount = 0;
                
                String addOnAmt = request.getParameter("addOnAmount");
                float addOnAmount = 0;
                
                String totDonaAmt = request.getParameter("totDonaAmt");
                Debug.print("totDonaAmt for insertAccountTxnDetails :"+totDonaAmt);
                
                if(addOnAmt!=null && addOnAmt.trim().length()!=0){
                    addOnAmount = Float.parseFloat(addOnAmt);
                }
                if(addCt != null && addCt.trim().length()!=0){
                    addCount = Integer.parseInt(addCt);
                }
                
                session.setAttribute("addCount",String.valueOf(addCount));
                HLCAccTransactionVO famaccTxnVO =  new HLCAccTransactionVO();
                familyTxnVO = null;
                ///////////////////// Family Transaction Entry
                for(int i=0;addCount>i;i++) {
                    if(famembId!=null || famembId.trim().length()!=0){
                        familyTxnVO = new ArrayList();
                        Debug.print("!!!!!!!!!!!!!!!!Family in card section!!!!!!!!!!!!!!!!!");
                        HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(famembId);
                        
                        String accNo = accTxnDet.getAccount_no();
                        String accClassname = accTxnDet.getClass_name();
                        String accItemNo = accTxnDet.getItem_no();
                        String accAccNo = accTxnDet.getSub_account_no();
                        String accTranName = accTxnDet.getTransaction_name();
                        String accTyped = accTxnDet.getTransaction_type();
                        String accTypeId = accTxnDet.getTransaction_type_id();
                        
                        if(r11.equalsIgnoreCase("check")){
                            famaccTxnVO.setPayment_mode("check");
                            famaccTxnVO.setActive_status(false);
                        }
                        if(r11.equalsIgnoreCase("card")){
                            String cardselect = request.getParameter("cardselect");
                            famaccTxnVO.setPayment_mode(cardselect);
                            famaccTxnVO.setActive_status(false);
                        }
                        
                        famaccTxnVO.setPayment_id(paymentId);
                        famaccTxnVO.setAccount_type("Income");
                        famaccTxnVO.setClass_Typ(accClassname);
                        famaccTxnVO.setAccount_no(accNo);
                        famaccTxnVO.setItem_no(accItemNo);
                        famaccTxnVO.setAmount(addOnAmount);
                        famaccTxnVO.setDescription(accTranName);
                        famaccTxnVO.setSub_account_no(accAccNo);
                        String familyAttr = "familyAttr"+i;
                        ///Attribute of family members
                        Debug.print("Family "+i+" is "+famaccTxnVO);
                        
                        familyTxnVO.add(famaccTxnVO);
                        
                        if(r11.equalsIgnoreCase("check")){
                            // Setting staff user_id and ip_address
                            if(session.getAttribute("loggedBy")!=null) {
                                String loggedBy="";
                                loggedBy=(String)session.getAttribute("loggedBy");
                                logBy=loggedBy;
                                
                                
                                famaccTxnVO.setStaff_user_id(staff_user_id);
                                famaccTxnVO.setStaff_ip_address(reqIp);
                                
                            }
                            //End Setting staff_user_id and ip_address
                            boolean Acc_status = mahaRemote.insertAccountTxnDetails(famaccTxnVO);
                            Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO) for selected membership :"+Acc_status);
                        }
                    }
                }
                if(r11.equalsIgnoreCase("card")){
                    session.setAttribute("familyTxnVO",familyTxnVO);
                }
                
                
                
                
                String pay_mode=request.getParameter("r11");
                String renewmemberTypeId= request.getParameter("memberTypeId");
                Debug.print("renewmemberTypeId is  "+renewmemberTypeId);
                
                HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(renewmemberTypeId);
                HLCAccTransactionVO accTxnVO1 = new HLCAccTransactionVO();
                
                if(renewmemberTypeId!=null || renewmemberTypeId.trim().length()!=0) {
                    if(pay_mode.equalsIgnoreCase("check")){
                        accTxnVO1.setPayment_mode("check");
                        accTxnVO1.setActive_status(false);
                    }
                    if(pay_mode.equalsIgnoreCase("card")){
                        String cardselect = request.getParameter("cardselect");
                        accTxnVO1.setPayment_mode(cardselect);
                        accTxnVO1.setActive_status(false);
                    }
                    String membershipAmount = request.getParameter("membershipAmount");
                    Debug.print("Membership Amount "+membershipAmount);
                              /*
                               
                               
                              String membershipName = request.getParameter("membershipName");
                              if(membershipName!=null){
                                  if(!membershipName.trim().equalsIgnoreCase("Subscribing Member")){
                                      String stats = request.getParameter("status");
                                      if(stats!=null){
                                          if(!stats.trim().equalsIgnoreCase("Active")){// ||
                                              String renewOpt = request.getParameter("renewOpt");
                                              Debug.print("renewOpt is "+renewOpt);
                                              if(renewOpt!=null){
                                                  if(renewOpt.equalsIgnoreCase("nxtYr")){
                                                      String fPrice = request.getParameter("futurePrice");
                                                      if(fPrice!=null || fPrice.trim().length()!=0){
                                                        accTxnVO1.setAmount(Float.parseFloat(fPrice));
                                                      }
                                                      else{
                                                          accTxnVO1.setAmount(Float.parseFloat(membershipAmount));
                                                      }
                                              }
                                                String sessionMid = request.getParameter("sessionMid");
                                                Debug.print("memberid is "+sessionMid);
                                                if(sessionMid!=null && sessionMid.trim().length()!=0){
                                                    remote.updateFutureExpDateByYear(sessionMid);
                                                }
                                          }
                                          else{
                                              accTxnVO1.setAmount(Float.parseFloat(membershipAmount));
                                          }
                                      }
                                  }
                                  }
                                  else{
                               
                                  }
                              }*/
                    
                    if(membershipAmount!=null || membershipAmount.trim().length()!=0){
                        accTxnVO1.setAmount(Float.parseFloat(membershipAmount));
                    } else{
                        accTxnVO1.setAmount(0);
                    }
                    String accNo = accTxnDet.getAccount_no();
                    String accClassname = accTxnDet.getClass_name();
                    String accItemNo = accTxnDet.getItem_no();
                    String accAccNo = accTxnDet.getSub_account_no();
                    String accTranName = accTxnDet.getTransaction_name();
                    String accTyped = accTxnDet.getTransaction_type();
                    String accTypeId = accTxnDet.getTransaction_type_id();
                    float amountt = accTxnVO1.getAmount();
                    
                    accTxnVO1.setAccount_type("Income");
                    accTxnVO1.setClass_Typ(accClassname);
                    //accTxnVO1.setUser_id(userId);
                    //accTxnVO1.setIp_address(reqIp);
                    accTxnVO1.setAccount_no(accNo);
                    accTxnVO1.setItem_no(accItemNo);
                    accTxnVO1.setSub_account_no(accAccNo);
                    accTxnVO1.setPayment_id(paymentId);
                    accTxnVO1.setDescription(accTranName);
                    
                    if(pay_mode.equalsIgnoreCase("check")){
                        
                        // Setting staff user_id and ip_address
                        if(session.getAttribute("loggedBy")!=null) {
                            String loggedBy="";
                            loggedBy=(String)session.getAttribute("loggedBy");
                            logBy=loggedBy;
                            
                            accTxnVO1.setStaff_user_id(staff_user_id);
                            accTxnVO1.setStaff_ip_address(reqIp);
                        }
                        //End Setting staff_user_id and ip_address
                        
                        boolean Acc_status = mahaRemote.insertAccountTxnDetails(accTxnVO1);
                        Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO1) for selected membership :"+Acc_status);
                    }
                    if(pay_mode.equalsIgnoreCase("card")){
                        Debug.print("mahaRemote.insertAccountTxnDetails(accTxnVO1) card:\n"+accTxnVO1);
                        session.setAttribute("member",accTxnVO1);
                    }
                }
//////////////For the Check Box renewal
                String cbxct = request.getParameter("cbxct");
                ArrayList renew_fam = new ArrayList();
                HLCMemberDetails membDet = new HLCMemberDetails();
                session.setAttribute("cbxct",cbxct);
                HLCAccTxnTypeDetailVO renew_accTxnDet = new HLCAccTxnTypeDetailVO();
                HLCAccTransactionVO renew_accTxnVO = new HLCAccTransactionVO();
                if(cbxct!=null || cbxct.trim().length()!=0){
                    int chkbxcnt = Integer.parseInt(cbxct);
                    renew_fam = new ArrayList();
                    for(int x=0;x<chkbxcnt;x++){
                        String value = request.getParameter("cbx"+x);
                        if(value!=null){
                            if(value.trim().length()!=0){
                                
                                String renew_famembId = request.getParameter("famembId");
                                String renew_addOnAmount = request.getParameter("addOnAmount");
                                renew_accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(renew_famembId);
                                
                                String accNo = renew_accTxnDet.getAccount_no();
                                String accClassname = renew_accTxnDet.getClass_name();
                                String accItemNo = renew_accTxnDet.getItem_no();
                                String accAccNo = renew_accTxnDet.getSub_account_no();
                                String accTranName = renew_accTxnDet.getTransaction_name();
                                String accTyped = renew_accTxnDet.getTransaction_type();
                                String accTypeId = renew_accTxnDet.getTransaction_type_id();
                                
                                if(pay_mode.equalsIgnoreCase("check")){
                                    renew_accTxnVO.setPayment_mode("check");
                                    renew_accTxnVO.setActive_status(false);
                                }
                                if(pay_mode.equalsIgnoreCase("card")){
                                    String cardselect = request.getParameter("cardselect");
                                    renew_accTxnVO.setPayment_mode(cardselect);
                                    renew_accTxnVO.setActive_status(false);
                                }
                                // Expiry Date Change Started
                                String membershipName = request.getParameter("membershipName");
                                if(!membershipName.trim().equalsIgnoreCase("Subscribing Member")){
                                    String stats = request.getParameter("status");
                                    if(stats!=null){
                                        if(!stats.trim().equalsIgnoreCase("Active")){
                                            String renewOpt = request.getParameter("renewOpt");
                                            Debug.print("renewOpt is "+renewOpt);
                                            if(renewOpt.equalsIgnoreCase("nxtYr")){
                                                Debug.print("value is "+value);
                                                remote.updateFutureExpDateByYear(value);
                                            }
                                        }
                                    }
                                }
                                // Expiry Date Change Ended
                                renew_accTxnVO.setAccount_type("Income");
                                renew_accTxnVO.setClass_Typ(accClassname);
                                //renew_accTxnVO.setUser_id(userId);
                                //renew_accTxnVO.setIp_address(reqIp);
                                renew_accTxnVO.setAccount_no(accNo);
                                renew_accTxnVO.setItem_no(accItemNo);
                                renew_accTxnVO.setSub_account_no(accAccNo);
                                renew_accTxnVO.setPayment_id(paymentId);
                                renew_accTxnVO.setDescription(accTranName);
                                renew_accTxnVO.setAmount(Float.parseFloat(renew_addOnAmount));
                                
                                renew_fam.add(renew_accTxnVO);
                                
                                if(pay_mode.equalsIgnoreCase("check")){
                                    // Setting staff user_id and ip_address
                                    if(session.getAttribute("loggedBy")!=null) {
                                        String loggedBy="";
                                        loggedBy=(String)session.getAttribute("loggedBy");
                                        logBy=loggedBy;
                                        
                                        
                                        renew_accTxnVO.setStaff_user_id(staff_user_id);
                                        renew_accTxnVO.setStaff_ip_address(reqIp);
                                    }
                                    //End Setting staff_user_id and ip_address
                                    boolean Acc_status = mahaRemote.insertAccountTxnDetails(renew_accTxnVO);
                                    Debug.print("mahaRemote.insertAccountTxnDetails(renew_accTxnVO) for selected membership :"+Acc_status);
                                }
                            }
                        }
                    }
                    if(pay_mode.equalsIgnoreCase("card")){
                        Debug.print("mahaRemote.insertAccountTxnDetails(renew_accTxnVO) card:\n"+renew_fam.size());
                        session.setAttribute("renewFamilyMemb",renew_fam);
                    }
                }
//////////////Ending Check Box renewal
            }
        }
        
        int update_family = 0;
        String tempMid1=(String)session.getAttribute("memberId");
        if(renstat!=null){
            if(tempMid1!=null && tempMid1.trim().length()!=0){
                if(renStat.equalsIgnoreCase("renew")){
                    Debug.print("Inside Renew ");
                    String renewSect = request.getParameter("renewSect");
                    Debug.print("Inside renewSect "+renewSect);
                    if(renewSect!=null && renewSect.trim().length()!=0){
                        int renval = Integer.parseInt(renewSect);
                        if(renval==0){
                            String renewOpt = request.getParameter("renewOpt");
                            Debug.print("renewOpt is "+renewOpt);
                            if(renewOpt.equalsIgnoreCase("nxtYr")){
                                Debug.print("MembTypeName is "+MembTypeName);
                                boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                                session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                Debug.print("Inside renew Update opt "+update_future);
                                update_family = 1;
                                session.setAttribute("changeExp",tempMid1);
                            }
                        }
                        String onActive  = request.getParameter("onActive");
                        Debug.print("onActive "+onActive);
                        if(renval==1){
                            if(onActive!=null && onActive.trim().length()!=0)  {
                                if(onActive.equalsIgnoreCase("ActiveStat")){
                                    Debug.print("MembTypeName is "+MembTypeName);
                                    if(!MembTypeName.equalsIgnoreCase("Subscribing Member")){
                                        Debug.print("Active Stat enabled for the new year ");
                                        boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                                        session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                        session.setAttribute("changeExp",tempMid1);
                                        update_family = 1;
                                    }
                                }
                            }
                        }
                    }
                    Debug.print("Inside renew update_family is "+update_family);
                } else if(renStat.equalsIgnoreCase("downgrade")){
                    Debug.print("Inside Renew ");
                    String downSect = request.getParameter("downSect");
                    Debug.print("Inside downSect "+downSect);
                    if(downSect!=null && downSect.trim().length()!=0){
                        int downval = Integer.parseInt(downSect);
                        if(downval==0){
                            String downOpt = request.getParameter("downOpt");
                            Debug.print("nxt Year is "+downOpt);
                            if(downOpt.equalsIgnoreCase("nxtYr")){
                                Debug.print("MembTypeName is "+MembTypeName);
                                boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                                Debug.print("Inside renew Update opt "+update_future);
                                Debug.print("Inisde Card of downgrade");
                                session.setAttribute("changeExp",tempMid1);
                                session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                update_family = 1;
                            }
                        }
                    }
                } else if(renStat.equalsIgnoreCase("upgrade")){
                    Debug.print("Inside Upgrade ");
                    String upgrdSect = request.getParameter("upgrdSect");
                    Debug.print("Inside upgrdSect "+upgrdSect);
                    if(upgrdSect!=null && upgrdSect.trim().length()!=0){
                        int upgrdval = Integer.parseInt(upgrdSect);
                        Debug.print("upgrdval is "+upgrdval);
                        Debug.print("!!!!!!!!  MembTypeName is "+MembTypeName);
                        if(upgrdval==0){
                            boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                            Debug.print("Inside upgrade Update opt "+update_future);
                            Debug.print("Inisde Card of upgrade");
                            session.setAttribute("changeExp",tempMid1);
                            session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                            update_family = 1;
                        }
                        String onActive  = request.getParameter("updActive");
                        Debug.print("updActive "+onActive);
                        if(onActive!=null){
                            if(onActive.equalsIgnoreCase("ActiveStat")){
                                update_family = 1;
                                Debug.print("Active Stat enabled for the new year upgrade");
                                Debug.print("r11.equalsIgnoreCase(\"card\")"+r11);
                                Debug.print("!!!!!!!!  MembTypeName is "+MembTypeName);
                                if(r11.equalsIgnoreCase("card")){
                                    session.setAttribute("changeExp",tempMid1);
                                    session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                } else{
                                    boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                                    session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                    Debug.print("Inside upgrade Update opt "+update_future);
                                    update_family = 1;
                                    Debug.print("Inisde Card of upgrade");
                                }
                            }
                        }
                        if(upgrdval==1){
                            if(onActive!=null && onActive.trim().length()!=0)  {
                                Debug.print("!!!!!!!!  MembTypeName is "+MembTypeName);
                                if(onActive.equalsIgnoreCase("ActiveStat")){
                                    Debug.print("Active Stat enabled for the new year upgrade");
                                    boolean update_future = remote.updateFutureExpDateByYear(tempMid1);
                                    Debug.print("Inside upgrade Update opt "+update_future);
                                    Debug.print("Inisde Card of upgrade");
                                    session.setAttribute("changeExp",tempMid1);
                                    session.setAttribute("exp_date",remote.getExpiredDate(tempMid1));
                                    update_family = 1;
                                }
                            }
                        }
                    }
                } else{
                    Debug.print("Problem in selecting renStat "+renStat);
                }
            }
        }
        
        //// New User Registration Page
        if(renStat==null){
            Debug.print("New User Registration update expriry date");
            
            String newId = (String) session.getAttribute("memberId");
            String regiSect = request.getParameter("regiSect");
            String regiYear = request.getParameter("regiYear");
            Debug.print("Regi Year is "+regiYear);
            Debug.print("regiSect is "+regiSect+" newId "+newId);
            
            java.util.Calendar toDay = java.util.Calendar.getInstance();
            int newyear = toDay.get(Calendar.YEAR);
            int new_month = toDay.get(Calendar.MONTH);
            String regiAct = request.getParameter("regiAct");
            Debug.print("regiAct is "+regiAct);
            if(regiSect!=null && regiSect.trim().length()!=0){
                int regiStat_val = Integer.parseInt(regiSect);
                Debug.print("regiStat_val is "+regiStat_val);
                
                if(regiAct!=null && regiAct.trim().length()!=0){
                    if((!MembTypeName.equalsIgnoreCase("Life Member"))){
                        if(!MembTypeName.equalsIgnoreCase("Subscribing Member")){
                            if(r11.equals("card")){
                                Debug.print("Card for new user Registration");
                                session.setAttribute("updateFuture","update");
                                session.setAttribute("exp_date",remote.getExpiredDate(newId));
                            } else{
                                if(Integer.parseInt(regiYear)>newyear){
                                    boolean update_addons = remote.updateFutureExpDateByYear(newId);
                                    Debug.print(" New User exp date update "+update_addons);
                                    session.setAttribute("exp_date",remote.getExpiredDate(newId));
                                    Debug.print("Set the value for new user family regi");
                                    update_family =1;
                                }
                            }
                        }
                    }
                }
            }
            
            if(regiAct!=null && regiAct.trim().length()!=0){
                if(regiAct.equalsIgnoreCase("Active")){
                    if((!MembTypeName.equalsIgnoreCase("Life Member"))){
                        if(!MembTypeName.equalsIgnoreCase("Subscribing Member")){
                            if(Integer.parseInt(regiYear)>newyear){
                                boolean update_addons = remote.updateFutureExpDateByYear(newId);
                                Debug.print(" New User exp date update "+update_addons);
                                session.setAttribute("exp_date",remote.getExpiredDate(newId));
                                Debug.print("Set the value for new user family regi");
                                update_family =1;
                            }
                        }
                    }
                }
            }
            tempMid1 = newId;
        }
        //}
        //// End User Registration Page
        // update exp date for the family members if any.
        if(!r11.equals("card")){
            Debug.print("For the family member Detail");
            Debug.print("Value for the update_family "+update_family);
            if(update_family==1) {
                if(historyTable.size()>0){
                    Iterator itr = historyTable.iterator();
                    if(itr.hasNext()){
                        while(itr.hasNext()){
                            String[] historyEntry = (String[]) itr.next();
                            String memTypNme = historyEntry[3];
                            String tempMembId = historyEntry[4];
                            if(memTypNme!=null && memTypNme.trim().length()!=0){
                                if(memTypNme.equalsIgnoreCase("Family Member"))   {
                                    if(tempMembId!=null && tempMembId.trim().length()!=0){
                                        boolean update_addons = remote.updateFutureExpDateByYear(tempMembId);
                                        Debug.print(" Update on the family member  "+update_addons);
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else{
            String regiAct = request.getParameter("regiAct");
            Debug.print("regiAct is "+regiAct);
            if(regiAct!=null && regiAct.trim().length()!=0){
                if(regiAct.equalsIgnoreCase("Active")){
                    session.setAttribute("newfamily",tempMid1);
                }
            }
        }
        //// History Table Entries
        Debug.print("History Table Entries");
        Debug.print("Size of the history is "+historyTable.size());
        if(historyTable.size()>0){
            Iterator itr = historyTable.iterator();
            if(itr.hasNext()){
                
                HLCMemberHistoryDetail detailVO = new HLCMemberHistoryDetail();
                while(itr.hasNext()){
                    String[] historyEntry = (String[]) itr.next();
                    Debug.print("historyEntry Main "+historyEntry);
                    String regiTyp = "";
                    String statid= "";
                    String useId = "";
                    String memTyeId = "";
                    String memTypNme = "";
                    String tempMembId= "";
                    String zipCode = "";
                    //String amateurName = request.getParameter("nameAmat");
                    //String amatChk1 = request.getParameter("amatCrdPoss");
                    //String amatChk2 = request.getParameter("amatCrdElig");
                 
                    
                    if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0){
                        if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                            chk_amt=Double.valueOf(request.getParameter("chckAmount")).doubleValue();
                            if(objPayment.getAmount()<=chk_amt) {
                                statid=remote.getStatusIBasedOnStatus("Active");
                            } else{
                                statid=remote.getStatusIBasedOnStatus("Pending");
                            }
                        }
                    } else{
                        statid=remote.getStatusIBasedOnStatus("Pending");
                    }
                    
                    
                    if(historyEntry[0]==null){
                        regiTyp = "Register";
                    } else{
                        regiTyp = historyEntry[0];
                    }
                    useId = historyEntry[1];
                    memTyeId = historyEntry[2];
                    memTypNme = historyEntry[3];
                    tempMembId = historyEntry[4];
                    
                    Date new_year = remote.getExpiredDate(tempMembId);
                    
                    String temp = new_year.toString();
                    Debug.print("temp is "+new_year.toString());
                    //2008-11-30
                    String[] splitr = temp.split("-");
                    System.out.println("splitr[0]"+splitr[0]);
                    
                    String histPay_id = (String) session.getAttribute("histpayId");
                    
                    int newVal = 0;
                    if(splitr[0]!=null){
                        newVal = Integer.parseInt(splitr[0]);
                    }
                    
                    if(useId!=null && useId.trim().length()!=0){
                        zipCode = remote.getZipCodeOnUserId(useId);
                    } else{
                        zipCode = "";
                    }
                    
                    /*boolean amatDec1Stat;
                    boolean amatDec2Stat;

                    if(amatChk1!=null) {
                    amatDec1Stat=true;

                    } else {
                    amatDec1Stat=false;
                    }
                    
                    if(amatChk2!=null) {
                    amatDec2Stat=true;

                    } else {
                    amatDec2Stat=false;
                    }*/
                    
                    detailVO.setTo_year(newVal);
                    detailVO.setPayment_id(histPay_id);
                    detailVO.setMemberId(tempMembId);
                    detailVO.setMembership_action(regiTyp);
                    detailVO.setMembership_type_id(memTyeId);
                    detailVO.setMembership_type_name(memTypNme);
                    detailVO.setZip_code(zipCode);
                    detailVO.setStatus_id(statid);
                    detailVO.setUser_id(useId);
                    detailVO.setAmatName(objMember.getAmateurName());
                    detailVO.setAmatDec1(objMember.isAmateurDec1());
                    detailVO.setAmatDec2(objMember.isAmateurDec2());
                   
                    
                    Debug.print("History Updat Status in membershipRegInsertAction");
                    
                    boolean historyUpdate = remote.insertMemberHistoryDetails(detailVO);
                    Debug.print("historyUpdate "+historyUpdate);
                }
            }
        }
        Debug.print("End History Entries");
        
/// Update Active Status
        
        
        
        //// End History Table Entries
        
        if(r11.equals("card")){
            Debug.print("Sucessfully Redirect to NoVa:");
            //=======================================
            String emailid = (String) session.getAttribute("emailId");
            
            if(request.getParameter("expirymonth")==null){
                CcExpMonth =0;
            } else {
                CcExpMonth=Integer.parseInt(request.getParameter("expirymonth"));
            }
            
            if(request.getParameter("expiryyear")==null){
                CcExpYear =0;
            } else{
                CcExpYear = Integer.parseInt(request.getParameter("expiryyear"));
            }
            
            if(request.getParameter("cVVNo")==null && request.getParameter("cVVNo").trim().length()==0){
                CcCvvid =0;
            } else if(!request.getParameter("cVVNo").equals("") && request.getParameter("cVVNo").trim().length()!=0){
                CcCvvid = Integer.parseInt(request.getParameter("cVVNo"));
            } else {
                CcCvvid =0;
            }
            
            if(request.getParameter("cardNo")==null){
                CcNumber =0;
            } else{
                CcNumber = Long.parseLong(request.getParameter("cardNo"));
            }
            
            if(request.getParameter("tot_amt")!=null && request.getParameter("tot_amt").trim().length()!=0) {
                amount = Double.valueOf(request.getParameter("tot_amt")).doubleValue();
            } else {
                amount = 0.00;
            }
            
            // Setting Parent member id in session after creating a member for payment rollback
             int intVId = 0;
            String inVoiceId1="1";
            if (inVoiceId1.equalsIgnoreCase("0")) {
                intVId = 1;
            } else {
                intVId = 1;
            }
             String expYear = request.getParameter("expiryyear");

            String expDate = request.getParameter("expirymonth") + expYear;
            session.setAttribute("parentId",parentId);
              session.setAttribute("sessionInvoiceId","1");
            request.setAttribute("AMT", request.getParameter("tot_amt"));
            request.setAttribute("PAYMENTACTION", "Authorization");
            request.setAttribute("CREDITCARDTYPE", request.getParameter("cardselect"));
            request.setAttribute("ACCT", request.getParameter("cardNo"));
            request.setAttribute("EXPDATE", expDate);
            request.setAttribute("IPADDRESS", reqIp);
            request.setAttribute("FIRSTNAME", request.getParameter("printName"));
            request.setAttribute("CVVNo", request.getParameter("cVVNo"));
            request.setAttribute("STREET", "1 Main St");
            request.setAttribute("CITY", "San Jose");
            request.setAttribute("STATE", "CA");
            request.setAttribute("ZIP", "95131");
            request.setAttribute("COUNTRYCODE", "US");
            request.setAttribute("EMAIL", emailid);
            session.setAttribute("objPayment", objPayment);
            session.setAttribute("URLPATH", "MembershipReg.do?process=reg");
            
               request.setAttribute("intVId", String.valueOf(intVId));
            System.out.println("intVId in servlet&&&&&&&" + intVId);
            request.setAttribute("purpose", "memberregistration");
            /*request.setAttribute("email",emailid);
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
            //request.setAttribute("chkDigit",String.valueOf(CcCvvid));
            StringBuffer reqURL = request.getRequestURL();
            int lastIndex = reqURL.lastIndexOf("/") ;
            String url ="";
            if(lastIndex!=-1){
                url = reqURL.substring(0,lastIndex+1);
            }
            String tmpNova  = mr.getMessage("humanreg.nova");
            String nova = url + tmpNova;
            Debug.print("succsssullll from app file nova........::" + nova);
            Debug.print("succsssullll from app file tmpNova ........::" + tmpNova);
            request.setAttribute("nova",nova);
            return mapping.findForward("novaPage");*/
             return new ModelAndView("testpaypal");
            //return mapping.findForward("successInsertRedirHuman");
        } else{
            String sessionMid= "";
                    /*if(renstat!=null && renstat.trim().length()!=0){
                        sessionMid = request.getParameter("sessionMid");
                        if(sessionMid!=null && sessionMid.trim().length()!=0){
                            session.setAttribute("sessionMid",sessionMid);
                            boolean update_member_hist = remote.updateMemberHistoryDetail(sessionMid);
                            Debug.print("update_member_hist "+update_member_hist );
                        }
                    }*/
            
            //// Start History Table
                /*    MemberHistoryDetail detailVO = new MemberHistoryDetail();
                    String statid= "";
                    String zipCde = "";
                    String memTyp = "";
                 
                    statid=remote.getStatusIBasedOnStatus("Pending");
                    Debug.print("membTypeId " + membTypeId);
                 
                        if(membTypeId!=null && membTypeId.trim().length()!=0){
                            memTyp = (String) session.getAttribute("membTypeId");
                        }
                 
                        if(userId!=null && userId.trim().length()!=0){
                            zipCde = remote.getZipCodeOnUserId(userId);
                        }
                        if(renStat!=null){
                            if(renStat.equalsIgnoreCase("renew")){
                                Debug.print("renStat is "+renStat);
                                String memberTypeId = request.getParameter("memberTypeId");
                                detailVO.setMembership_type_id(memberTypeId);
                            }
                        }
                        else{
                            detailVO.setMembership_type_id(memTyp);
                        }
                        //detailVO.setFrom_date(new Date());
                        //Debug.print("New Date is "+detailVO.getFrom_date());
                        detailVO.setMemberId(sessionMid);
                        detailVO.setStatus_id(statid);
                        detailVO.setZip_code(zipCde);
                 
                        boolean historyUpdate = remote.insertMemberHistoryDetails(detailVO);
                        Debug.print("historyUpdate "+historyUpdate);*/
            //// End History Table
            
            
            if(session.getAttribute("loggedBy")!=null) {
                String loggedBy="";
                loggedBy=(String)session.getAttribute("loggedBy");
                logBy=loggedBy;
                
                // Making the active Status and reconcile status as true on full payment
                
                //Setting the reconcile & active Status TRUE
                String chckAmount = request.getParameter("chckAmount");
                String totalAmount = request.getParameter("tot_amt");
                
                if(chckAmount!=null && totalAmount!=null){
                    if(chckAmount.trim().length()!=0 && totalAmount.trim().length()!=0){
                        double chkAmt = Double.parseDouble(chckAmount);
                        double totAmt = Double.parseDouble(totalAmount);
                        double extraAmt = chkAmt - totAmt;
                        
                        if(extraAmt > 0){
                            String StrextraAmt = String.valueOf(extraAmt);
                            HLCAccTxnTypeDetailVO overpayDet = mahaRemote.getOverPayAccTransactionTypeDetail();
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
                            overpayfinalDet.setAmount(Float.parseFloat(StrextraAmt));
                            overpayfinalDet.setTransaction_id(accTypeId);
                            overpayfinalDet.setDescription(description);
                            
                            // Setting staff user_id and ip_address
                            overpayfinalDet.setStaff_user_id(staff_user_id);
                            overpayfinalDet.setStaff_ip_address(reqIp);
                            //End Setting staff_user_id and ip_address
                            
                            String pay_mode=request.getParameter("r11");
                            
                            if(pay_mode!=null && pay_mode.trim().length()>0){
                                if(pay_mode.equalsIgnoreCase("check")){
                                    overpayfinalDet.setPayment_mode("check");
                                    overpayfinalDet.setActive_status(false);
                                }
                            }
                            Debug.print("B4 insert "+ overpayfinalDet.toString());
                            boolean extraPay = mahaRemote.insertAccountTxnDetails(overpayfinalDet);
                        }
                        
                        if(chkAmt>=totAmt){
                            if(paymentId!=null || paymentId.trim().length()!=0){
                                boolean Update_Status = mahaRemote.updateRecouncilActiveStatusAccTxnDetails(paymentId);
                                Debug.print("Update Status "+Update_Status);
                            }
                        }
                        
                    }
                }
                // End Of Status change
            }
            
           
            return new ModelAndView("desc-membership-status");
        }
        
    }
      
}
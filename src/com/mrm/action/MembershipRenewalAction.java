/*
 * MembershipRenewalAction.java
 *
 * Created on November 5, 2007, 5:50 PM
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlcform.util.HLCUserMaster;
import com.hlcform.util.HLCContactDetails;
import com.hlcrole.management.*;
/**
 *
 * @author hari
 * @version
 */

public class MembershipRenewalAction implements Controller {
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException, ParseException{
    
   
        String fwd="";
        String actStat=null;
        Date act_date_card = new Date();
        
        //MessageResources mr=getResources(request);
        
        String reqIp=request.getRemoteAddr();
        Debug.print(" Request IP :"+reqIp);
        
        String defrole= "bc559b5e-3aaf-47c4-8560-d10197c86119";
        Debug.print("defrole :" +defrole);
         
        HLCMemberDetails objMember = new HLCMemberDetails();
        HLCPaymentDetails objPayment = new HLCPaymentDetails();
        HLCUserMaster objUserMaster=new HLCUserMaster();
        HLCContactDetails objContactDetail=new HLCContactDetails();
        
        HLCkaverystatelessBean remote = new HLCkaverystatelessBean();;
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
        
        objPayment.setIpAddress(reqIp);
        
        String r11=request.getParameter("r11");
        
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat("MM-dd-yyyy");
        String donAmt=null;
        
        
        ArrayList historyTable = new ArrayList();
        String sessfamembId = request.getParameter("famembId");
        Debug.print("sessfamembId   is   "+sessfamembId);
        session.setAttribute("sessfamembId",sessfamembId);
        String newMemberId = "";
        String[] memberType = null;
        String accMembTypeId=null;
        String MembTypeName = "";
        
        if(membtypsel!=null) {
            memberType=membtypsel.split("#");
            
            objMember.setMembershipTypeId(memberType[0]);
            objMember.setMembershipTypeName(memberType[1]);
            
            Debug.print("objMember.setMembershipTypeId ",objMember.getMembershipTypeId());
            Debug.print("objMember.setMembershipTypeName ",objMember.getMembershipTypeName());
            
            accMembTypeId = memberType[0];
            MembTypeName = memberType[1];
            Debug.print("accMembTypeId is  "+accMembTypeId);
            Debug.print("MembTypeName is  "+MembTypeName);
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
        
        if(amatCrdPossMemb!=null){
            amatCrdPossMembStatus=true;
        } else{
            amatCrdPossMembStatus=false;
        }
        
        Debug.print("amatCrdPossMembStatus :"+amatCrdPossMembStatus);
        
        String amatCrdEligMemb=request.getParameter("amatCrdElig");
        Debug.print("amatCrdEligMemb :"+amatCrdEligMemb);
        
        boolean amatCrdEligMembStatus;
        
        if(amatCrdEligMemb!=null){
            amatCrdEligMembStatus=true;
            Debug.print("amatCrdEligMembStatus :"+amatCrdEligMembStatus);
        } else{
            amatCrdEligMembStatus=false;
        }
        
        Debug.print("amatCrdEligMembStatus :"+amatCrdEligMembStatus);
        
        objMember.setAmateurName(nameAmatMemb);
        objMember.setAmateurDec1(amatCrdPossMembStatus);
        objMember.setAmateurDec2(amatCrdEligMembStatus);
        
        String loginName=(String)session.getAttribute("loginName");
        Debug.print("loginName from session :"+loginName);
        
        objMember.setLoginName(loginName);
        
        
        if(request.getParameter("memberid")!=null && request.getParameter("memberid").trim().length()!=0){
            String pmembId=request.getParameter("memberid");
            objMember.setParentMemberId(pmembId);
        } else{
            objMember.setParentMemberId(null);
        }
        
        String emailIdSes=(String)session.getAttribute("emailId");
        objMember.setEmailId(emailIdSes);
        
        objMember.setUserId(userId);
        Debug.print("userId from session :"+userId);
        
        
        objMember.setPaymentId(paymentId);
        
        objPayment.setPaymentId(paymentId);
        session.setAttribute("histpayId",paymentId);
        
        double chk_amt=0;
        
        
        Date check_date=null;
        
        if(r11.equalsIgnoreCase("check")){
            if(request.getParameter("checkDate")!=null && request.getParameter("checkDate").trim().length()!=0){
                check_date = (Date)sdf.parse(request.getParameter("checkDate"));
                Debug.print("check_date :"+check_date.toString());
            } else{
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
            
            if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0){
                //objPayment.setCheckAmount(Float.valueOf(request.getParameter("chckAmount")).floatValue());
                
                Debug.print("request.getParameter(chckAmount) :"+request.getParameter("chckAmount"));
                
                chk_amt=Double.valueOf(request.getParameter("chckAmount")).doubleValue();
                Debug.print("Double.valueOf(request.getParameter(chckAmount)).doubleValue() :"+chk_amt);
                
                String comment="Excess Check Payment Done For Membership Registration";
                
                float chkAmt=Float.valueOf(request.getParameter("tot_amt")).floatValue();
            } else{
                objPayment.setCheckAmount(0);
            }
            
            if(request.getParameter("checkNo")!=null && request.getParameter("checkNo").trim().length()!=0){
                objPayment.setCheckNumber(request.getParameter("checkNo"));
            } else{
                objPayment.setCheckNumber("0");
            }
            
            if(request.getParameter("tot_amt")!=null && request.getParameter("tot_amt").trim().length()!=0){
                objPayment.setAmount(Double.valueOf(request.getParameter("tot_amt")).doubleValue());
            } else{
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
            
            if(request.getParameter("printName")!=null && request.getParameter("printName").trim().length()!=0){
                objPayment.setCcName(request.getParameter("printName"));
            } else{
                objPayment.setCcName(null);
            }
            
            if(request.getParameter("cardselect")!=null && request.getParameter("cardselect").trim().length()!=0){
                objPayment.setCcType(request.getParameter("cardselect"));
            } else{
                objPayment.setCcType(null);
            }
            
            if(request.getParameter("cardNo")!=null && request.getParameter("cardNo").trim().length()!=0){
                objPayment.setCcNumber(request.getParameter("cardNo"));
            } else{
                objPayment.setCcNumber("0");
            }
            
            if(request.getParameter("expirymonth")!=null && request.getParameter("expirymonth").trim().length()!=0){
                objPayment.setCcExpMonth(Integer.parseInt(request.getParameter("expirymonth")));
            } else{
                objPayment.setCcExpMonth(0);
            }
            
            if(request.getParameter("expiryyear")!=null && request.getParameter("expiryyear").trim().length()!=0){
                objPayment.setCcExpYear(Integer.parseInt(request.getParameter("expiryyear")));
            } else{
                objPayment.setCcExpYear(0);
            }
            
            if(request.getParameter("cVVNo")!=null && request.getParameter("cVVNo").trim().length()!=0){
                if(!request.getParameter("cVVNo").equals("")){
                    objPayment.setCcCvvid(Integer.parseInt(request.getParameter("cVVNo")));
                    request.setAttribute("chkDigit",request.getParameter("cVVNo"));
                } else{
                    objPayment.setCcCvvid(0);
                    request.setAttribute("chkDigit","0");
                }
            } else{
                objPayment.setCcCvvid(0);
                request.setAttribute("chkDigit","0");
            }
            
            objPayment.setBankName(null);
            
            objPayment.setCheckDate(null);
            objPayment.setCheckNumber("0");
            objPayment.setCheckName(null);
            objPayment.setCheckAmount(0);
            
            if(request.getParameter("tot_amt")!=null && request.getParameter("tot_amt").trim().length()!=0){
                objPayment.setAmount(Double.valueOf(request.getParameter("tot_amt")).doubleValue());
            } else{
                objPayment.setAmount(0);
            }
            
            objPayment.setPaymentDate(new Date());
            objPayment.setPaymentStatus("card");
            
            if(request.getParameter("activeDate2")!=null && request.getParameter("activeDate2").trim().length()!=0){
                act_date_card = (Date)sdf.parse(request.getParameter("activeDate2"));
            }
            
            Debug.print("final act_date for card mode :"+act_date_card.toString());
            Debug.print("inside payment card final ......"+objPayment.getAmount());
            session.setAttribute("act_date",act_date_card);
        }
        
        if(r11.equalsIgnoreCase("check")){
            Debug.print("Line 392");
            
            boolean nonUseaStat=remote.deleteNonUseaPriceDetails(membId);
            Debug.print("remote.deleteNonUseaPriceDetails(membId) for member id :"+membId+" :" +nonUseaStat);
            
            boolean pubDelStat=remote.deletePublicationDetails(membId);
            Debug.print("remote.deletePublicationDetails(membId) for member id :"+membId+" :" +pubDelStat);
        }
        
        String[] pubId=request.getParameterValues("mailOpt1");
        Debug.print("pubId :" +pubId);
        
        ArrayList pubDet=new ArrayList();
        
        if(pubId!=null) {
            Debug.print("pubId.length :" +pubId.length);
            Debug.print("Line 408");
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
                    Debug.print("Line 429");
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
        if(r11.equalsIgnoreCase("card")){
            session.setAttribute("pubDet",pubDet);
        }
        
        /*
         * Family add-on upgrade / remove block
         */
        
        if(objMember.getMembershipTypeName().equalsIgnoreCase("Full Member") || objMember.getMembershipTypeName().equalsIgnoreCase("Life Member")){
            
            String count=request.getParameter("cbxct");
            
            ArrayList updateFam=new ArrayList();
            ArrayList delFam=new ArrayList();
            
            if(count!=null){
                
                int cbxct=Integer.parseInt(count);
                
                for(int x=0;x<cbxct;x++){
                    String cbname="cbx"+x;
                    Debug.print("cbname :"+cbname);
                    
                    String cbx=request.getParameter(cbname);
                    System.out.println("Inside loop of add-on Value Check bx Mem-Id :"+cbx);
                    
                    if(cbx==null){
                        String mids="mid"+x;
                        String mid=request.getParameter(mids);
                        
                        System.out.println("Inside Delete Block on add-on for Member id :"+mid);
                        
                        if(r11.equalsIgnoreCase("check")){
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
                            Debug.print("Line 487:");
                            
                            String famembId1 = request.getParameter("famembId");
                            Debug.print("famembId   is   "+famembId1);
                            String useId =remote.getUserIdBasedOnMemberId(cbx);
                            
                            String[] historyEntry = {"renew",useId,famembId1,"Family Member",cbx};
                            historyTable.add(historyEntry);
                            String selYear = request.getParameter("selYear");
                            Debug.print("Inside Check Box of the family add on "+selYear);
                            if(selYear!=null){
                                int sel_year = Integer.parseInt(selYear);
                                java.util.Calendar toDay = java.util.Calendar.getInstance();
                                int newyear = toDay.get(Calendar.YEAR);
                                int new_month = toDay.get(Calendar.MONTH);
                                if(sel_year != newyear){
                                    remote.updateFutureExpDateByYear(cbx);
                                }
                            }
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
        Debug.print("objMember.setPaymentId(paymentId) :"+paymentId);
        
        session.setAttribute("objMember",objMember);
        
        // Start of Individual member edit status changes
        
        String res=(String)session.getAttribute("memberId");
        
        if(r11.equals("card")){
            //for sub expiry date
            String subExpDate1=null;
            String prDat =request.getParameter("prDat");
            Debug.print("Parameter :"+prDat);
            if(prDat.equalsIgnoreCase(" Registration Good thru ")){
            Debug.print("prDat inside 1:"+prDat);
            subExpDate1=request.getParameter("expdate");
            //Date subExDt=(Date)sdf1.parse(subExpDate1);
            objMember.setSubExpDate(subExpDate1);
            Debug.print("Subscribing Expiry Date near editMemberDetail 1:" + objMember.getSubExpDate());
            }
            else{
            Debug.print("prDat inside 2:"+prDat);   
            java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
            String attactDate = String.valueOf(tempDate).substring(0,4)+"-"+String.valueOf(tempDate).substring(5,7)+"-"+String.valueOf(tempDate).substring(8,10);
            Debug.print("current date inside 2:"+attactDate); 
            objMember.setSubExpDate(attactDate);
            Debug.print("Subscribing Expiry Date near editMemberDetail 2:" + objMember.getSubExpDate());
            }
            Debug.print("Subscribing Expiry Date near editMemberDetail 3:" + objMember.getSubExpDate());
            
            objPayment.setUserId(userId);
            session.setAttribute("objPaymentList",objPayment);
            session.setAttribute("objMember",objMember);
            
            System.out.println("Inside Edit Member Registration with Credit Card:");
            objMember.setPaymentId(paymentId);
            
            
            Debug.print("objMemDet.getAmateurName() : "+objMember.getAmateurName());
            Debug.print("objMemDet.isAmateurDec1() : "+objMember.isAmateurDec1());
            Debug.print("objMemDet.isAmateurDec2(): "+objMember.isAmateurDec2());
            
            Debug.print("remote.getExpiredDate(res)   :"+remote.getExpiredDate(res));
            session.setAttribute("exp_date",remote.getExpiredDate(res));
            session.setAttribute("objMember",objMember);
        } else{
            
            Debug.print("objMemDet.getAmateurName() : "+objMember.getAmateurName());
            Debug.print("objMemDet.isAmateurDec1() : "+objMember.isAmateurDec1());
            Debug.print("objMemDet.isAmateurDec2(): "+objMember.isAmateurDec2());
            objMember.setRenewalStatus(true);
            String subExpDate1=null;
            String prDat =request.getParameter("prDat");
            Debug.print("Parameter :"+prDat);
            if(prDat.equalsIgnoreCase(" Registration Good thru ")){
            Debug.print("prDat inside 1:"+prDat);
            subExpDate1=request.getParameter("expdate");
            //Date subExDt=(Date)sdf1.parse(subExpDate1);
            objMember.setSubExpDate(subExpDate1);
            Debug.print("Subscribing Expiry Date near editMemberDetail 1:" + objMember.getSubExpDate());
            }
            else{
            Debug.print("prDat inside 2:"+prDat);   
            java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
            String attactDate = String.valueOf(tempDate).substring(0,4)+"-"+String.valueOf(tempDate).substring(5,7)+"-"+String.valueOf(tempDate).substring(8,10);
            Debug.print("current date inside 2:"+attactDate); 
            objMember.setSubExpDate(attactDate);
            Debug.print("Subscribing Expiry Date near editMemberDetail 2:" + objMember.getSubExpDate());
            }
            Debug.print("Subscribing Expiry Date near editMemberDetail 3:" + objMember.getSubExpDate());
            boolean udate=remote.editMemberDetail(objMember);
            System.out.println("Updation of Member Detail Status :" +udate);
            String tempMid=(String)session.getAttribute("memberId");
            
            Debug.print("Line 570:");
            String memTId = objMember.getMembershipTypeId();
            String memTname = objMember.getMembershipTypeName();
            String useId = objMember.getUserId();
            String[] historyEntry = {"renew",useId,memTId,memTname,objMember.getMemberId()};
            historyTable.add(historyEntry);
            
            // Update of Future Year
            if(!memTname.equalsIgnoreCase("Life Member")){
                if(!memTname.equalsIgnoreCase("Subscribing Member")){
                    String selYear = request.getParameter("selYear");
                    Debug.print("selYear is "+selYear);
                    Debug.print("memTname is "+memTname);
                    Debug.print("tempMid is "+tempMid);
                    if(selYear!=null){
                        int sel_year = Integer.parseInt(selYear);
                        java.util.Calendar toDay = java.util.Calendar.getInstance();
                        int newyear = toDay.get(Calendar.YEAR);
                        int new_month = toDay.get(Calendar.MONTH);
                        if(sel_year != newyear){
                            remote.updateFutureExpDateByYear(tempMid);
                        }
                    }
                }
            }
            // End update of next year
            
            /*
             * if Logged by admin or hlc staff
             */
            
            if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
                if(request.getParameter("activeDate")!=null && request.getParameter("activeDate").trim().length()!=0) {
                    
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
            String memID = (String) session.getAttribute("memberId");
            String[] userDet=remote.getUserDetailsForEmail(userId);
            String memTypeName=objMember.getMembershipTypeName();
            if(pstat==true){
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
                                "Your Membership ID:"+objMember.getMemberId()+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(memID)+ "<br/>"+
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
                                "Your Membership ID:"+objMember.getMemberId()+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(memID)+ "<br/>"+
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
                                "Your Membership ID:"+objMember.getMemberId()+" <br/>"+
                                "Membership Type:"+objMember.getMembershipTypeName()+ "<br/>"+
                                "Expiration Date:"+remote.getExpiredDate(memID)+ "<br/>"+
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
            request.setAttribute("memberId",session.getAttribute("memberId"));
            request.setAttribute("membTyp",objMember.getMembershipTypeName());
            request.setAttribute("chk_no",objPayment.getCheckNumber());
            request.setAttribute("tot_amt",Double.toString(objPayment.getAmount()));
            request.setAttribute("actStat",actStat);
            
            session.setAttribute("exp_date",remote.getExpiredDate(res));
        }
        
        /*
         * Non-Usea Amt insertion block
         */
        
        String memberId=remote.getParentMemberId(loginName);
        Debug.print("memberId from after reg :"+memberId);
        String orgCbxCt=request.getParameter("orgCbxCt");
        int orgCt=Integer.parseInt(orgCbxCt);
        Debug.print("orgCt :"+orgCt);
        
        ArrayList nonUseaDet=new ArrayList();
        
        for(int c=0;c<orgCt;c++){
            String cbxName="orgNameCbx"+c;
            String tbName="orgNameTxt"+c;
            System.out.print("tbName :"+tbName);
            System.out.print("cbxName :"+cbxName);
            
            String chkVal=request.getParameter(cbxName);
            Debug.print("chkVal :"+chkVal);
            
            if(chkVal!=null){
                String[] OrgTypId=chkVal.split("#");
                
                String orgMemId=request.getParameter(tbName);
                Debug.print("orgMemId :"+orgMemId);
                
                if(r11.equalsIgnoreCase("check")){
                    
                    boolean nonstat=remote.insertNonUseaPriceDetails(memberId,OrgTypId[0],orgMemId);
                    Debug.print("non hlc "+c+"insert status :"+nonstat);
                }
                
                String[] nonUsea={memberId,OrgTypId[0],orgMemId};
                nonUseaDet.add(nonUsea);
            }
        }
        
        if(r11.equalsIgnoreCase("card")){
            session.setAttribute("nonUseaDet",nonUseaDet);
        }
        
        String parentId=remote.getParentMemberId(loginName);
        
        ArrayList famIs = new ArrayList();
        
        System.out.println("parentId :"+parentId);
        
       /*
        * Block for Family Add-on insertion
        */
        
        Vector addFamNonWeb=new Vector();
        Vector addFamWeb=new Vector();
        ArrayList addonMemb=new ArrayList();
        
        if(memberType[1].equalsIgnoreCase("full member") || memberType[1].equalsIgnoreCase("life member")){
            
            System.out.println("parentId :"+parentId);
            
            if(!request.getParameter("famMemb").equals("0")) {
                String ct=request.getParameter("famMemb");
                int addct=Integer.parseInt(ct);
                System.out.println("famMemb addon ct :"+addct);
                
                String famembId=request.getParameter("famembId");
                HLCPaymentDetails objPayment1 = new HLCPaymentDetails();
                
                if(r11.equalsIgnoreCase("check")){
                    boolean status=remote.updatMemberFamilyAddOns(parentId,addct);
                    Debug.print("remote.updatMemberFamilyAddOns(parentId,addct) :"+status);
                }
                
                String[] updateAddct={parentId,String.valueOf(addct)};
                
                if(r11.equalsIgnoreCase("card")){
                    session.setAttribute("updateAddct",updateAddct);
                }
                
               // HttpServlet ser = getServlet();
                
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
                        
                        Debug.print("UserID" + objContactDetail1.getUserId());
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
                        
                        if(r11.equalsIgnoreCase("check")){
                            usrid=remote.addFamilyAddOn(objUserMaster,objContactDetail);
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
                            memb=remote.addMemberDetails(objMember, objPayment1);
                            System.out.println("after add-on "+i+" member details insertion member-Id :"+memb);
                            Debug.print("Line 963");
                            String famembId1 = request.getParameter("famembId");
                            Debug.print("famembId   is   "+famembId1);
                            
                            String membUsrId = remote.getUserIdBasedOnMemberId(memb);
                            
                            String[] historyEntry = {"register",membUsrId,famembId1,"Family Member",memb};
                            historyTable.add(historyEntry);
                            
                            String selYear = request.getParameter("selYear");
                            Debug.print("Inside famUser1.equalsIgnoreCase(\"no\") "+selYear);
                            if(selYear!=null){
                                int sel_year = Integer.parseInt(selYear);
                                java.util.Calendar toDay = java.util.Calendar.getInstance();
                                int newyear = toDay.get(Calendar.YEAR);
                                int new_month = toDay.get(Calendar.MONTH);
                                if(sel_year != newyear){
                                    remote.updateFutureExpDateByYear(memb);
                                }
                            }
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
                        
                        if(r11.equalsIgnoreCase("card")){
                            session.setAttribute("addFamNonWeb",addFamNonWeb);
                            session.setAttribute("addFamWeb",addFamWeb);
                            session.setAttribute("addonMemb",addonMemb);
                        }
                        
                        if(r11.equalsIgnoreCase("check")){
                            boolean rolestat=roleRemote.createDefaultRole(usrid,defrole);
                            Debug.print("rolestatus :" +rolestat);
                        }
                        
                        String[] usrVal={fname1,lname1,bm1,bd1,by1,memb,emailids1,""};
                        context.setAttribute("usrVal",usrVal);
                        
                        if(r11.equalsIgnoreCase("check")){
                            
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
                            Debug.print("Email sent sucessfully :"+emailFlag);
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
                        
                        if(r11.equalsIgnoreCase("check")){
                            String memb=remote.addMemberDetails(objMember, objPayment1);
                            System.out.println("add-on "+i+" existing member details insertion status :"+memb);
                            Debug.print("Line 1155");
                            String famembId1 = request.getParameter("famembId");
                            Debug.print("famembId   is   "+famembId1);
                            
                            String[] historyEntry = {"renew",usrId,famembId1,"Family Member",memb};
                            historyTable.add(historyEntry);
                            
                            String selYear = request.getParameter("selYear");
                            Debug.print("Inside famUser1.equalsIgnoreCase \"YES\") "+selYear);
                            if(selYear!=null){
                                int sel_year = Integer.parseInt(selYear);
                                java.util.Calendar toDay = java.util.Calendar.getInstance();
                                int newyear = toDay.get(Calendar.YEAR);
                                int new_month = toDay.get(Calendar.MONTH);
                                if(sel_year != newyear){
                                    remote.updateFutureExpDateByYear(memb);
                                }
                            }
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
                        
                        if(r11.equalsIgnoreCase("check")){
                            
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
                            Debug.print("Email sent sucessfully :"+emailFlag);
                            
                        }
                    }
                    
                    if(famUser1.equalsIgnoreCase("mem")){
                        
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
                        
                        if(r11.equalsIgnoreCase("check")){
                            String famembId1 = request.getParameter("famembId");
                            Debug.print("famembId   is   "+famembId1);
                            boolean upStatus=remote.updateAddOnExistingMember(exMid,"Pending",parId,paymentId,famembId1);
                            Debug.print("updateAddOnExistingMember(exMid,Pending,parId,paymentId) :"+upStatus);
                            
                            Debug.print("Line 1333:");
                            
                            String[] historyEntry = {"renew",usrId,famembId1,"Family Member",exMid};
                            historyTable.add(historyEntry);
                            
                            String selYear = request.getParameter("selYear");
                            Debug.print("Inside famUser1.equalsIgnoreCase(\"mem\") "+selYear);
                            if(selYear!=null){
                                int sel_year = Integer.parseInt(selYear);
                                java.util.Calendar toDay = java.util.Calendar.getInstance();
                                int newyear = toDay.get(Calendar.YEAR);
                                int new_month = toDay.get(Calendar.MONTH);
                                if(sel_year != newyear){
                                    remote.updateFutureExpDateByYear(exMid);
                                }
                            }
                            
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
                            Debug.print("Email sent sucessfully :"+emailFlag);
                            
                        }
                    }
                }
            }
        }
       /*
        // Update Future Year for the members
        if(historyTable!=null && selYear!=null){
            Debug.print("Size of the history is "+historyTable.size());
        
            int sel_year = Integer.parseInt(selYear);
            java.util.Calendar toDay = java.util.Calendar.getInstance();
            int newyear = toDay.get(Calendar.YEAR);
            int new_month = toDay.get(Calendar.MONTH);
            if(historyTable.size()>0){
                if(sel_year != newyear){
                    Iterator itr = historyTable.iterator();
                    if(itr.hasNext()){
                        String[] historyEntry4 = (String[]) itr.next();
                        String tmpMemId = historyEntry4[4];
                        String memTypNme = historyEntry4[3];
                        Debug.print("Member Type Name "+memTypNme);
                        Debug.print("Itertaion is");
                        if(!memTypNme.equalsIgnoreCase("Subscribing Member") && (!memTypNme.equalsIgnoreCase("Life Member"))){
                            remote.updateFutureExpDateByYear(tmpMemId);
                        }
                    }
                }
            }
        }*/
        
        String sesMemId = (String) session.getAttribute("memberId");
        Debug.print("sesMemId is "+sesMemId);
        if(sesMemId!=null){
            session.setAttribute("exp_date",remote.getExpiredDate(sesMemId));
        }
        HLCAccTransactionVO PhaccTxnVO = null;
        HLCAccTransactionVO accTxnVO = new HLCAccTransactionVO();
        int si=0;
        String logBy="user";
        
        if(session.getAttribute("loggedBy")!=null) {
            String loggedBy="";
            loggedBy=(String)session.getAttribute("loggedBy");
            logBy=loggedBy;
            
            if(loggedBy.equalsIgnoreCase("Admin")){
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
                        
                        //End Setting staff_user_id and ip_address
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
                
                if(r11.equals("check")){
                    if(PhaccTxnVO!=null){
                        boolean status = mahaRemote.insertAccountTxnDetails(PhaccTxnVO);
                        Debug.print("mahaRemote.insertAccountTxnDetails(phoneVO) for Phone Service :"+status);
                    }
                } else{
                    Debug.print("mahaRemote.insertAccountTxnDetails(phoneVO) for Phone Service");
                    session.setAttribute("PhoneVO",PhaccTxnVO);
                }
                
            }
        }
        
        
        
        
//mailOptQuesti
        String mailOptQuesti = request.getParameter("mailOptQuesti");
        Debug.print("mailOptQuesti is : "+mailOptQuesti);
        if(mailOptQuesti==null){
            String[] pubId1=request.getParameterValues("mailOpt1");
            Debug.print("pubId1 [] is "+pubId1);
            if(pubId1!=null){
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
        
// Subscribing Member Mail Options
        String mailOptQuestion = request.getParameter("mailOptQuestion");
        Debug.print("mailOptQuestion is : "+mailOptQuestion);
        if(mailOptQuestion==null){
            String[] pubId2=request.getParameterValues("submailOpt1");
            Debug.print("pubId2 [] is "+pubId2);
            if(pubId2!=null){
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
                        //donaaccTxnVO.setUser_id(userId);
                        //donaaccTxnVO.setIp_address(reqIp);
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
            /*
             *  For the Family membership type
             */
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
        
            /*
             *  For the current membership type
             */
        HLCAccTransactionVO updownaccTxnVO = new HLCAccTransactionVO();
        String selDisp = request.getParameter("selDisp");
        if(selDisp != null) {
            String selTyp[] = selDisp.split("#");
            
            float memAmt = Float.parseFloat(selTyp[2]);
            
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
        
        String upgradeOpt = request.getParameter("upgradeOpt");
        Debug.print("upgradeOpt is "+upgradeOpt);
        if(upgradeOpt!=null && upgradeOpt.trim().length()!=0){
            int upgradeVal = Integer.parseInt(upgradeOpt);
            if(upgradeVal==1){
                String pay_mode=request.getParameter("r11");
                String UpgrdmemberTypeId= request.getParameter("currmemberTypeId");
                Debug.print("Upgrade MemberTypeId is  "+UpgrdmemberTypeId);
                
                HLCAccTransactionVO upgrdeaccTxnVO = new HLCAccTransactionVO();
                HLCAccTxnTypeDetailVO accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(UpgrdmemberTypeId);
                String currmembershipName = request.getParameter("currmembershipName");
                Debug.print("currmembershipName " +currmembershipName);
                if(currmembershipName!=null){
                    if(!currmembershipName.equalsIgnoreCase("Subscribing Member")){
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
                    } else{
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
                    }
                }
            }
        }
        
        Debug.print("!!!!!!!!!!!!!!!!!!!In the check renew section !!!!!!!!!!!!!!!!!!!!!");
        
        //////////////For the Check Box renewal
        String cbxct = request.getParameter("cbxct");
        Debug.print("cbxct is "+cbxct);
        ArrayList renew_fam = new ArrayList();
        String pay_mode=request.getParameter("r11");
        HLCMemberDetails membDet = new HLCMemberDetails();
        session.setAttribute("cbxct",cbxct);
        HLCAccTxnTypeDetailVO renew_accTxnDet = new HLCAccTxnTypeDetailVO();
        HLCAccTransactionVO familyChckBox = new HLCAccTransactionVO();
        ArrayList txnDetails = new ArrayList();
        if(cbxct!=null || cbxct.trim().length()!=0){
            int chkbxcnt = Integer.parseInt(cbxct);
            Debug.print("&&&&&&&&&&&&&&&&&&&&&&chkbxcnt is "+chkbxcnt);
            renew_fam = new ArrayList();
            for(int x=0;x<chkbxcnt;x++){
                String value = request.getParameter("cbx"+x);
                Debug.print("&&&&&&&&&&&&&&&&&&&&value: "+value);
                if(value!=null){
                    if(value.trim().length()!=0){
                        
                        String renew_famembId = request.getParameter("famembId");
                        String renew_addOnAmount = request.getParameter("addOnAmount");
                        renew_accTxnDet = mahaRemote.getMemberAccTxnTypeDetails(renew_famembId);
                        float amt = 0.0f;
                        
                        if(renew_addOnAmount!=null && renew_addOnAmount.trim().length()!=0){
                            amt = Float.parseFloat(renew_addOnAmount);
                        }
                        String accNo = renew_accTxnDet.getAccount_no();
                        String accClassname = renew_accTxnDet.getClass_name();
                        String accItemNo = renew_accTxnDet.getItem_no();
                        String accAccNo = renew_accTxnDet.getSub_account_no();
                        String accTranName = renew_accTxnDet.getTransaction_name();
                        String accTyped = renew_accTxnDet.getTransaction_type();
                        String accTypeId = renew_accTxnDet.getTransaction_type_id();
                        
                        familyChckBox.setAccount_type("Income");
                        familyChckBox.setClass_Typ(accClassname);
                        familyChckBox.setAccount_no(accNo);
                        familyChckBox.setItem_no(accItemNo);
                        familyChckBox.setSub_account_no(accAccNo);
                        familyChckBox.setPayment_id(paymentId);
                        familyChckBox.setDescription(accTranName);
                        familyChckBox.setAmount(amt);
                        
                        if(pay_mode.equalsIgnoreCase("check")){
                            familyChckBox.setPayment_mode("check");
                            familyChckBox.setActive_status(false);
                            // Setting staff user_id and ip_address
                            if(session.getAttribute("loggedBy")!=null) {
                                String loggedBy="";
                                loggedBy=(String)session.getAttribute("loggedBy");
                                logBy=loggedBy;
                                
                                familyChckBox.setStaff_user_id(staff_user_id);
                                familyChckBox.setStaff_ip_address(reqIp);
                            }
                            //End Setting staff_user_id and ip_address
                            boolean Acc_status = mahaRemote.insertAccountTxnDetails(familyChckBox);
                            Debug.print("mahaRemote.insertAccountTxnDetails(familyChckBox) for selected membership :"+Acc_status);
                        }
                        if(pay_mode.equalsIgnoreCase("card")){
                            String cardselect = request.getParameter("cardselect");
                            familyChckBox.setPayment_mode(cardselect);
                            familyChckBox.setActive_status(false);
                            txnDetails.add(familyChckBox);
                            session.setAttribute("familyChckBox",txnDetails);
                        }
                    }
                    
                    
                }
            }
        }
        if(request.getParameter("chckAmount")!=null && request.getParameter("chckAmount").trim().length()!=0) {
            boolean pendStat=kaveryRemote.updatePendingAmount(userId,paymentId,Float.valueOf(request.getParameter("chckAmount")).floatValue());
            Debug.print("kaveryRemote.updatePendingAmount() : "+pendStat);
        }
        if(r11.equalsIgnoreCase("card")){
            String selYear =request.getParameter("selYear");
            session.setAttribute("selYear",selYear);
        }
//////////////Ending Check Box renewal
        //// History Table Entries
        Debug.print("History Table Entries");
        Debug.print("Size of the history is "+historyTable.size());
        if(historyTable.size()>0){
            Iterator itr = historyTable.iterator();
            if(itr.hasNext()){
                
                HLCMemberHistoryDetail detailVO = new HLCMemberHistoryDetail();
                while(itr.hasNext()){
                    String[] historyEntry = (String[]) itr.next();
                    
                    String regiTyp = "";
                    String statid= "";
                    String useId = "";
                    String memTyeId = "";
                    String memTypNme = "";
                    String tempMembId= "";
                    String zipCode = "";
                    
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
                    
                    //for subscribing member expiry date
                    /*String subExpDate1=request.getParameter("expdate");
                    Date subExDt=(Date)sdf1.parse(subExpDate1);
                    detailVO.setSubExpDate(subExpDate1);*/
                    String subExpDate1=null;
                    String prDat =request.getParameter("prDat");
                    Debug.print("Parameter :"+prDat);
                    if(prDat.equalsIgnoreCase(" Registration Good thru ")){
                    Debug.print("prDat inside 1:"+prDat);
                    subExpDate1=request.getParameter("expdate");
                    //Date subExDt=(Date)sdf1.parse(subExpDate1);
                    detailVO.setSubExpDate(subExpDate1);
                    Debug.print("Subscribing Expiry Date near insertMemberHistoryDetails 1:" + detailVO.getSubExpDate());
                    }
                    else{
                    Debug.print("prDat inside 2:"+prDat);   
                    java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
                    String attactDate = String.valueOf(tempDate).substring(0,4)+"-"+String.valueOf(tempDate).substring(5,7)+"-"+String.valueOf(tempDate).substring(8,10);
                    Debug.print("current date inside 2:"+attactDate); 
                    detailVO.setSubExpDate(attactDate);
                    Debug.print("Subscribing Expiry Date near insertMemberHistoryDetails 2:" + detailVO.getSubExpDate());
                    }
                    Debug.print("Subscribing Expiry Date near insertMemberHistoryDetails 3:" + detailVO.getSubExpDate());
                                      
                    boolean historyUpdate = remote.insertMemberHistoryDetails(detailVO);
                    Debug.print("historyUpdate "+historyUpdate);
                }
            }
        }
        Debug.print("End History Entries");
        
        
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
            
            session.setAttribute("parentId",parentId);
            
            request.setAttribute("email",emailid);
            request.setAttribute("cardNo",String.valueOf(CcNumber));
            String expMon = String.valueOf(CcExpMonth);
            String expYear = String.valueOf(CcExpYear);
            if(expMon.trim().length()==1) {
                expMon = "0" + expMon;
            }
            // if(expYear.trim().length()==1) {
            Debug.print("expYear:" + expYear);
            //expYear = expYear.substring(2);
            //
            Debug.print("expMon:" + expMon);
            Debug.print("expYear:" + expYear);
            
            String expDate = expMon + expYear;
            request.setAttribute("expDate",expDate);
            request.setAttribute("amount",String.valueOf(amount));
            //request.setAttribute("chkDigit",String.valueOf(CcCvvid));
            /* StringBuffer reqURL = request.getRequestURL();
            int lastIndex = reqURL.lastIndexOf("/") ;
            String url ="";
            
            if(lastIndex!=-1){
                url = reqURL.substring(0,lastIndex+1);
            }
            
            String tmpNova  = mr.getMessage("humanrenewal.nova");
            String nova = url + tmpNova;
            Debug.print("succsssullll from app file nova........::" + nova);
            Debug.print("succsssullll from app file tmpNova ........::" + tmpNova);
            request.setAttribute("nova",nova);
            return mapping.findForward("novaPage");*/
            String inVId = request.getParameter("inVoiceId");
                    System.out.println("inVId in servlet from request: " + inVId);
                    int intVId = 0;
                    String inVoiceId1="1";
                    if (inVoiceId1.equalsIgnoreCase("0")) {
                        intVId = 1;
                    } else {
                        intVId = 1;
                    }
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

                    request.setAttribute("purpose", "membershiprenewal");
                    //intVId++; 
                    request.setAttribute("intVId", String.valueOf(intVId));
                    System.out.println("intVId in servlet InsertHorseRegAction &&&&&&&" + intVId);
                     return new ModelAndView("testpaypal");
            
            //return mapping.findForward("successInsertRedirHuman");
        } else{
            String sessionMid= "";
            
            if(session.getAttribute("loggedBy")!=null) {
                String loggedBy="";
                loggedBy=(String)session.getAttribute("loggedBy");
                logBy=loggedBy;
                
                if(loggedBy.equalsIgnoreCase("Admin")){
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
                                
                                if(pay_mode!=null && pay_mode.trim().length()>0){
                                    if(pay_mode.equalsIgnoreCase("check")){
                                        overpayfinalDet.setPayment_mode("check");
                                        overpayfinalDet.setActive_status(false);
                                    }
                                }
                                Debug.print("B4 insert "+ overpayfinalDet.toString());
                                boolean extraPay = mahaRemote.insertAccountTxnDetails(overpayfinalDet);
                                //Debug.print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&Before Callinh Refund Details+++++++++++++++++++++++++++++++++++++++");
                                //boolean refundStatus = mahaRemote.insertMembershipRefundDetails(userId, StrextraAmt, overpayfinalDet.getAmount());
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
            }
            
            fwd="desc-membership-status";
            return new ModelAndView(fwd);
        }
    }
    
}

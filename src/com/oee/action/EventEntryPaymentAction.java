/*
 * EventEntryPaymentAction.java
 *
 * Created on November 23, 2007, 12:55 PM
 */

package com.oee.action;

import com.db.GeneralDBAction;
import com.hlcentitybean.ujanidam.HLCUjaniDamEntityLocal;
import com.hlcentitybean.ujanidam.HLCUjaniDamEntityLocalHome;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.oee.actionform.EventEntryPaymentForm;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCalendarVO;
import com.hlcutil.HLCCompRegistrationVO;
import com.hlcutil.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import com.hlcutil.HLCPaymentDetailVO;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;
/**
 *
 * @author Ellamaran
 * @version
 */


	public class EventEntryPaymentAction implements Controller {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
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
			IOException, ParserConfigurationException, SAXException {
        try{
            HttpSession session=request.getSession();
           
            HLCPaymentDetailVO paymentVO = new HLCPaymentDetailVO();
            GeneralDBAction db=new GeneralDBAction();
			HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
			HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			         
            EventEntryPaymentForm fbean=new EventEntryPaymentForm();
            String userId = (String)session.getAttribute("userId");
            String emailId = (String)session.getAttribute("emailId");
            String paymentId= null;
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            String cmd = request.getParameter("cmd");
            String horseMemberId = request.getParameter("horseMemberId");
            String eventId = (String)session.getAttribute("eventId");
            
            if(cmd!=null && cmd.equalsIgnoreCase("eventPayment")){
                
                String addr = request.getRemoteAddr();
                HLCPaymentDetailVO payDetVO = new HLCPaymentDetailVO();
                String totalAmount1 = request.getParameter("totalAmount");
                
                int CcExpMonth = 0;
                int CcExpYear = 0;
                int CcCvvid =0;
                double totalAmount =0;
                float checkAmount =0;
                String CcNumber ="0";
                String checkNumber="0";
                Date check_date = null;
                Date comp_date = null;
                String ccType=null;
                String ccName=null;
                String nameoncheck = null;
                String bankname = null;
                String r11 = fbean.getR11();
                
                if(r11.equals("card")){
                    if(fbean.getCcNumber()==null || fbean.getCcNumber().equals("")) CcNumber = "0";
                    else CcNumber = fbean.getCcNumber();
                    
                    if(fbean.getCcName()==null || fbean.getCcName().equals("")) ccName ="";
                    else ccName=fbean.getCcName();
                    
                    if(!(fbean.getCcType().equals("")) && fbean.getCcType()!=null) ccType = fbean.getCcType();
                    
                    if(fbean.getCcExpMonth()==null || fbean.getCcExpMonth().equals("")) CcExpMonth =0;
                    else CcExpMonth=Integer.parseInt(fbean.getCcExpMonth());
                    
                    if(fbean.getCcExpYear()==null || fbean.getCcExpYear().equals("")) CcExpYear =0;
                    else CcExpYear = Integer.parseInt(fbean.getCcExpYear());
                    
                    if(fbean.getCcCvvid()==null || fbean.getCcCvvid().equals("")) CcCvvid =0;
                    else CcCvvid = Integer.parseInt(fbean.getCcCvvid());
                    
                    check_date= null;
                    payDetVO.setPaymentStatus("card");
                }
                
                if(r11.equals("check")){
                    if(fbean.getCheckNumber()==null || fbean.getCheckNumber().equals("")) checkNumber="0";
                    else checkNumber= fbean.getCheckNumber();
                    
                    if(fbean.getCheckDate().equals("")) check_date= null;
                    else check_date =(Date)sdf.parse(fbean.getCheckDate());
                    
                    payDetVO.setPaymentStatus("Check");
                }
                
                paymentId = membQualBean.getNextIdforPayment();
                bankname =fbean.getBankName();
                nameoncheck =fbean.getNameCheck();
                
                payDetVO.setUserId(userId);
                payDetVO.setCcName(ccName);
                payDetVO.setCcType(ccType);
                payDetVO.setCcNumber(CcNumber);
                payDetVO.setCcExpMonth(CcExpMonth);
                payDetVO.setCcExpYear(CcExpYear);
                payDetVO.setCcCvvid(CcCvvid);
                payDetVO.setBankName(bankname);
                payDetVO.setCheckName(nameoncheck);
                payDetVO.setCheckDate(check_date);
                payDetVO.setCheckNumber(checkNumber);
                payDetVO.setAmount(Integer.parseInt(totalAmount1));
                payDetVO.setPaymentDate(new Date());
                payDetVO.setIpAddress(addr);
                payDetVO.setPaymentId(paymentId);
                
                if(r11.equals("card")){
                    String expMon = String.valueOf(CcExpMonth);
                    String expYear = String.valueOf(CcExpYear);
                    
                    if(expMon.trim().length()==1) expMon = "0" + expMon;
                    expYear = expYear.substring(2);
                    String expDate = expMon + expYear;
                    
                    request.setAttribute("expDate",expDate);
                    request.setAttribute("email",emailId);
                    request.setAttribute("cardNo",String.valueOf(CcNumber));
                    request.setAttribute("amount",String.valueOf(totalAmount1));
                    request.setAttribute("chkDigit",String.valueOf(CcCvvid));
                    session.setAttribute("payVOList",payDetVO);
                    session.setAttribute("totalAmount",totalAmount1);
                    session.setAttribute("paymentId",paymentId);
                    
                    StringBuffer reqURL = request.getRequestURL();
                    int lastIndex = reqURL.lastIndexOf("/") ;
                    String url ="";
                    if(lastIndex!=-1){
                        url = reqURL.substring(0,lastIndex+1);
                    }
                    String tmpNova  = "paymentConfirm.do";
                    String nova = url + tmpNova;
                    
                    request.setAttribute("nova",nova);
                    return new ModelAndView("novaPage");
                }
                
                else{
                    
                    boolean updBal=false;
                    boolean statusChange = false;
                    boolean activeStatus = false;
                    boolean activateDateStatus = false;
                    String oePaymentId = membQualBean.createPayment(payDetVO);
                    String tempPaymentId = null;
                    boolean flag = false;
                    
                    ArrayList sessionVal = (ArrayList)session.getAttribute("sessionVal");
                    if(sessionVal!=null && sessionVal.size()!=0){
                        Iterator its = sessionVal.iterator();
                        while(its.hasNext()){
                            HLCCompRegistrationVO compVO = (HLCCompRegistrationVO)its.next();
                            boolean result = membQualBean.insertEventRegistrationDetails(compVO, oePaymentId);
                            if(result) flag = true;
                            else flag = false;
                        }
                    }
                    if(flag) request.setAttribute("payResult","success");
                    else request.setAttribute("payResult","failure");
                    return new ModelAndView("paymentSuccess");
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
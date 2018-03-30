/*
 * IcpOrgRegAction.java
 *
 * Created on September 22, 2006, 9:26 PM
 */

package com.mee.action;

import com.db.GeneralDBAction;
import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.hlcmeeting.util.HLCInstructorDetails;
import com.hlcmeeting.util.HLCPaymentDetails;
import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import com.util.email.EmailContent;
import com.util.email.EmailEngine;

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
/**
 *
 * @author karthikeyan
 * @version
 */


	public class IcpOrgRegAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
        
        String fwd="";
        String fac_cbx="";
         SimpleDateFormat formatter = new SimpleDateFormat("MM-dd-yyyy");
        try {
        	HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            String process=request.getParameter("process");
            HttpSession session=request.getSession();
            GeneralDBAction db=new GeneralDBAction();
            System.out.println("\n after InitialContext inside icp org reg list action...\n");

                if(process.equalsIgnoreCase("disp")) {
                    System.out.println("\n inside icp org reg page display...\n");
                    Vector area=new Vector();
                    area = vaigaiMeetingBean.displayUseaArea();
                    request.setAttribute("area",area);
                    return new ModelAndView("frmMeeOrgICPAssessRegi");
                }
                
                         /*
                          * Redirection to Registration Insert
                          */
                
                if(process.equalsIgnoreCase("insert")) {
                    System.out.println("\n inside icp org reg page insert...\n");
                    
                    HLCInstructorDetails objInstDetail = new HLCInstructorDetails();
                    String memberId=(String)session.getAttribute("memberId");
                    String emailId=(String)session.getAttribute("emailId");
                    String userId=(String)session.getAttribute("userId"); 
                    
                    //objInstDetail.setIcpMeetingId(String icpMeetingId);
                    //objInstDetail.setNoOfDays("10");
                    // objInstDetail.setLandOwnerCountry("INDAI");
                   
           
           
                    String assesLevel=request.getParameter("assesLevel");
                    String dat=request.getParameter("dat");
                    String days=request.getParameter("days");
                    String hlcArea=request.getParameter("hlcArea");
                    String location=request.getParameter("location");
                    String hostid=request.getParameter("hostid");
                    String fname=request.getParameter("fname");
                    String lname=request.getParameter("lname");
                    String addr=request.getParameter("addr");
                    String ctry=request.getParameter("ctry");
                    String state=request.getParameter("state");
                    String city=request.getParameter("city");
                    String zip=request.getParameter("zip");
                    String phone=request.getParameter("phone");
                    String fax=request.getParameter("fax");
                    String email=request.getParameter("email");
                    String acessdet=request.getParameter("acessdet");
                    String cctry=request.getParameter("cctry");
                    String rclinic=request.getParameter("rclinic");
                    String stab=request.getParameter("stab");
                    String cbx_other=request.getParameter("cbx_other");
                    String others=request.getParameter("others");
                    String lownernam=request.getParameter("lownernam");
                    String busname=request.getParameter("busname");
                    String laddr=request.getParameter("laddr");
                    String ctry_sel=request.getParameter("ctry_sel");
                    String stat_sel=request.getParameter("stat_sel");
                    String lcity=request.getParameter("lcity");
                    String lzip=request.getParameter("lzip");
                    String lph=request.getParameter("lph");
                    String lfax=request.getParameter("lfax");
                    String accept=request.getParameter("accept");
                    String tot_amt=request.getParameter("tot_amt");
                    String payment=request.getParameter("payment");
                    String chkno=request.getParameter("chkno");
                    String chkdat=request.getParameter("chkdat");
                    String infav=request.getParameter("infav");
                    String cardno=request.getParameter("cardno");
                    String cvvno=request.getParameter("cvvno");
                    String ctyp=request.getParameter("ctyp");
                    String pname=request.getParameter("pname");
                    String expirymonth=request.getParameter("expirymonth");
                    String expiryyear=request.getParameter("expiryyear");
                    String nameOnCheck = request.getParameter("nameCheck");
                    
                    System.out.println(memberId);
                    System.out.println(request.getParameter("assesLevel"));
                    System.out.println(request.getParameter("dat"));
                    System.out.println(request.getParameter("days"));
                    System.out.println(request.getParameter("hlcArea"));
                    System.out.println(request.getParameter("location"));
                    System.out.println(request.getParameter("hostid"));
                    System.out.println(request.getParameter("fname"));
                    System.out.println(request.getParameter("lname"));
                    System.out.println(request.getParameter("addr"));
                    System.out.println(request.getParameter("ctry"));
                    System.out.println(request.getParameter("state"));
                    System.out.println(request.getParameter("city"));
                    System.out.println(request.getParameter("zip"));
                    System.out.println(request.getParameter("phone"));
                    System.out.println(request.getParameter("fax"));
                    System.out.println(request.getParameter("email"));
                    System.out.println(request.getParameter("acessdet"));
                    System.out.println(request.getParameter("cctry"));
                    System.out.println(request.getParameter(" rclinic"));
                    System.out.println(request.getParameter("stab"));
                    System.out.println(request.getParameter("cbx_other"));
                    System.out.println(request.getParameter("others"));
                    System.out.println(request.getParameter("lownernam"));
                    System.out.println(request.getParameter("busname"));
                    System.out.println(request.getParameter("laddr"));
                    System.out.println(request.getParameter("ctry_sel"));
                    System.out.println(request.getParameter("stat_sel"));
                    System.out.println(request.getParameter("lcity"));
                    System.out.println(request.getParameter("lzip"));
                    System.out.println(request.getParameter("lph"));
                    System.out.println(request.getParameter("lfax"));
                    System.out.println(request.getParameter("accept"));
                    System.out.println(request.getParameter("tot_amt"));
                    System.out.println(request.getParameter("payment"));
                    System.out.println(request.getParameter("chkno"));
                    System.out.println(request.getParameter("chkdat"));
                    System.out.println(request.getParameter("infav"));
                    System.out.println(request.getParameter("cardno"));
                    System.out.println(request.getParameter("cvvno"));
                    System.out.println(request.getParameter("ctyp"));
                    System.out.println(request.getParameter("pname"));
                    System.out.println(request.getParameter("expirymonth"));
                    System.out.println(request.getParameter("expiryyear"));
                    System.out.print("nameOnCheck:" + nameOnCheck);
                    
                    String[] adat=(String[])dat.split("-");
                    for(int i=0;i<adat.length;i++){
                    	System.out.println("adat value in servlet ::::::"+adat[i]);
                    }
                    
                    
                    String acessdat=adat[2]+"-"+adat[0]+"-"+adat[1];
                    
                    System.out.println("acess dat :" +acessdat);
                    objInstDetail.setAssesmentLevel(assesLevel);
                    objInstDetail.setAssesmentDate(acessdat);
                    objInstDetail.setUseaAreaId(hlcArea);
                    // objInstDetail.setAreaName(hlcArea);
                    objInstDetail.setLocation(location);
                    objInstDetail.setInstructorId(memberId);
                    objInstDetail.setHostMemberId(hostid);
                    //objInstDetail.setShippingTypeId("100011");
                    objInstDetail.setAssessor(acessdet);
                    
                    if(cctry!=null) {
                        fac_cbx=cctry+"#";
                    }
                    else
                    {
                        fac_cbx=cctry+"#";
                    }
                    if(rclinic!=null) {
                        fac_cbx=fac_cbx+rclinic+"#";
                    }
                    else
                    {
                        fac_cbx=fac_cbx+rclinic+"#";
                    }
                    if(stab!=null) {
                        fac_cbx=fac_cbx+stab+"#";
                    }
                    else
                    {
                         fac_cbx=fac_cbx+stab+"#";
                    }
                    if(cbx_other!=null) {
                        
                        fac_cbx=fac_cbx+request.getParameter("others");
                    }
                    else
                    {
                         fac_cbx=fac_cbx+request.getParameter("others");
                    }
                    
                    objInstDetail.setFacilities(fac_cbx);
                    objInstDetail.setLandOwnerName(lownernam);
                    objInstDetail.setLandOwnerBusinessName(busname);
                    objInstDetail.setLandOwnerFax(lfax);
                    objInstDetail.setLandOwnerEmail(email);
                    objInstDetail.setLandOwnerAddress(laddr);
                    objInstDetail.setLandOwnerCity(lcity);
                    objInstDetail.setLandOwnerState(stat_sel);
                    objInstDetail.setLandOwnerZip(lzip);
                    objInstDetail.setLandOwnerPhone(lph);
                    objInstDetail.setLandOwnerCountry(ctry_sel);
                    objInstDetail.setNoOfDays(days);
                    objInstDetail.setEmail(email);
                    HLCPaymentDetails objPayment = new HLCPaymentDetails();
                    
                    int  CcExpMonth = 0;
                    int CcExpYear = 0;
                    int CcCvvid =0;
                    double amount =0;
                    String CcNumber= null;
                    String checkNumber= null;
                    Date check_date = null;
                    Date comp_date = null;
                    String ccType=null;
                    String ccName=null;
                    String bankname = null;
                    String nameoncheck = null;
                if(payment.equalsIgnoreCase("card")){
                  
                    if(cardno==null || cardno.equals("")){
                        CcNumber = "0";
                    }
                    else {
                        CcNumber = cardno;
                    }
                    if(pname==null || pname.equals("")){
                        ccName ="";
                    }
                    else {
                        ccName=pname;
                    }
                    if(!(ctyp.equals("")) && ctyp!=null){
                        ccType = ctyp;  
                    }
                    if(expirymonth==null || expirymonth.equals("")){
                        CcExpMonth =0;
                    }
                    else {
                        CcExpMonth=Integer.parseInt(expirymonth);
                    }
                    if(expiryyear==null || expiryyear.equals("")){
                        CcExpYear =0;
                    }
                    else{
                        CcExpYear = Integer.parseInt(expiryyear);
                    }
                    if(cvvno==null || cvvno.equals("")){
                        CcCvvid =0;
                    }
                    else{
                        CcCvvid = Integer.parseInt(cvvno);
                    }
                    check_date= null;
                    objPayment.setPaymentStatus("card");
                }
                if(payment.equalsIgnoreCase("check")){
                    if(chkno==null || chkno.equals("")){
                        checkNumber= "0";
                    }
                    else{
                        checkNumber=  chkno;
                    }
                    if(chkdat.equals("")){
                        check_date= null;
                    }
                    else{
                        check_date =(Date)formatter.parse(chkdat);
                    }
                    
                    objPayment.setPaymentStatus("Check");
                }
   
                if(tot_amt==null || tot_amt==""){
                    amount=0; 
                }
                else{
                    amount = Double.parseDouble(tot_amt);
                }  
               
                objPayment.setBankName(infav);
                objPayment.setCheckName(nameOnCheck);
                objPayment.setCheckDate(check_date);
                objPayment.setCheckNumber(checkNumber);
                objPayment.setUserId(userId);
                objPayment.setCcName(ccName);
                objPayment.setCcType(ccType);
                objPayment.setCcNumber(CcNumber);
                objPayment.setCcExpMonth(CcExpMonth);
                objPayment.setCcExpYear(CcExpYear);
                objPayment.setCcCvvid(CcCvvid);
                objPayment.setAmount(amount);
                objPayment.setPaymentDate(new Date());
          
           Debug.print("payment status:" + payment);
             if(payment.equals("card")){
                Debug.print("Sucessfully Redirect to NoVa:");
                session.setAttribute("objPaymentList",objPayment);
                session.setAttribute("objInstDetail",objInstDetail);
            
                Debug.print("Sucessfully Payment objPaymentList:" + objPayment.toString());
           
                request.setAttribute("email",emailId);
                session.setAttribute("amount",String.valueOf(amount));
                request.setAttribute("cardNo",String.valueOf(CcNumber));
                String expMon = String.valueOf(CcExpMonth);
                String expYear = String.valueOf(CcExpYear);
               if(expMon.trim().length()==1) {
                     expMon = "0" + expMon;
                }
                Debug.print("expYear:" + expYear);
                expYear = expYear.substring(2);
                Debug.print("expMon:" + expMon);
                Debug.print("expYear:" + expYear);
                String expDate = expMon + expYear;
                request.setAttribute("expDate",expDate);
                request.setAttribute("expDate",expDate);
                request.setAttribute("amount",String.valueOf(amount));
                request.setAttribute("chkDigit",String.valueOf(CcCvvid));
                return new ModelAndView("frmMMSIcpRegiNova");
             }
            else{
                String pymtId = vaigaiMeetingBean.getPaymtId();
                objPayment.setPaymentId(pymtId);
                objInstDetail.setPaymentId(pymtId);
                Debug.print(" ICP.paymentId:" + pymtId); 
           
                 boolean bol = db.addInstructorDetails(objInstDetail, objPayment);
                 Debug.print("ICP Organizer INserted Sucessfully:"+bol);
                 if(bol == true){        
                 
                String toMailIds[] = {emailId};
                EmailContent emailObj=new EmailContent();
                emailObj.setTo(toMailIds);
                emailObj.setFrom("info@hlc.com");
                emailObj.setSubject("ICP Registration confirmation.");

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
                   "<p>Dear Organizer,"+

                    "You have successfully registered with United States Eventing Association for all "+
                    "the ICP Activities that are to be held! Your application would be verified and processed within"+
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
                    emailObj.setBody(content);
                    EmailEngine emailEngine = new EmailEngine();
                    boolean emailFlag = emailEngine.sendMimeEmail(emailObj);
                    Debug.print("Email sent sucessfully :"+emailFlag);
                }
                 request.setAttribute("amount",String.valueOf(amount));
                 return new ModelAndView("mee-confirmation-icp-org-regi");
                }
                }
            
            
        } 
        catch (Exception ex) {
            System.err.println("Caught an exception."+ex.getMessage());
            ex.printStackTrace();
        }
        return null;
        
    }
}

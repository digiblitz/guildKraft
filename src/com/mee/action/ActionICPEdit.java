/*
 * ActionICPEdit.java
 *
 * Created on December 18, 2006, 3:56 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.hlcmeeting.util.HLCInstructorDetails;
import java.util.*;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import javax.naming.Context;
import javax.naming.InitialContext;
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
 * @author punitha
 * @version
 */


	public class ActionICPEdit implements Controller {
    
  
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
         String fwd="";
        String fac_cbx="";
         SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
        try {
            /*
            * Service Locator for ejb/HLCVaigaiSessionJNDI
             */
            
        	HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            
            String process=request.getParameter("process");
            HttpSession session=request.getSession();
            
            
             if(process.equalsIgnoreCase("edit")) {
                    
                    System.out.println("\n inside icp org reg page edit...\n");
                    
                    Vector area=new Vector();
                    area = vaigaiMeetingBean.displayUseaArea();
                    request.setAttribute("area",area);
                    String icpMeetingId=(String)request.getParameter("icpMeetingId");
                    System.out.println("icpMeetingId :" +icpMeetingId);
                    
                    //String icpMeetingId="10000";
                    Vector dispReg=new Vector();
                    dispReg=vaigaiMeetingBean.displayICPRegBasedOnMeetingId(icpMeetingId);
                    request.setAttribute("dispReg",dispReg);
                    System.out.println("dispReg :" +dispReg.size());
                    int i=0;
                    if(dispReg!=null && dispReg.size()!=0) {
                        Enumeration en=dispReg.elements();
                        int i1=0;
                        while(en.hasMoreElements()) {
                        String[] icpVal = (String[])en.nextElement();
                        Debug.print(i1+" is "+ icpVal[i1]);
                        i1++;
                        }
                    Debug.print("Disp Reg is "+dispReg.toString());
                    return new ModelAndView("frmOrgICPAssessEDITRegi");
                }
             }
                
             /*
              * Update Registration Details
              */
                
                if(process.equalsIgnoreCase("update"))
                {
                     System.out.println("\n inside icp org reg page update...\n");
                    String eId=(String)session.getAttribute("emailId");
                     System.out.println("eid :" +eId);
                    HLCInstructorDetails objInstDetail = new HLCInstructorDetails();
                    String meetid=request.getParameter("mid");
                    //String meetid="10000";
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
                    System.out.println(request.getParameter("srclinic"));
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
                    
                     String[] adat=(String[])dat.split("/");
                    String acessdat=adat[2]+"-"+adat[0]+"-"+adat[1];
                    
                    System.out.println("acess dat :" +acessdat);
                    objInstDetail.setAssesmentLevel(assesLevel);
                    objInstDetail.setAssesmentDate(acessdat);
                    objInstDetail.setUseaAreaId(hlcArea);
                    // objInstDetail.setAreaName(hlcArea);
                    objInstDetail.setLocation(location);
                    String memberId = (String) session.getAttribute("userId");
                    Debug.print("User ID"+memberId);
                    memberId = (String) session.getAttribute("memberId");
                    Debug.print("Member ID"+memberId);                    
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
                    //objInstDetail.setLandOwnerEmail("ram@yahoo.com");
                    objInstDetail.setLandOwnerAddress(laddr);
                    objInstDetail.setLandOwnerCity(lcity);
                    objInstDetail.setLandOwnerCountry(ctry_sel);
                    objInstDetail.setLandOwnerState(stat_sel);
                    objInstDetail.setLandOwnerZip(lzip);
                    objInstDetail.setLandOwnerPhone(lph);
                   
                    objInstDetail.setNoOfDays(days);
                    objInstDetail.setRequestStatus("Pending");
                    objInstDetail.setIcpMeetingId(meetid);
                    objInstDetail.setEmail(eId);
                                        
                    boolean bol = vaigaiMeetingBean.editInstructorDetails(objInstDetail);
                    Debug.print("Result of update ActionICPEdit"+bol);
                    return new ModelAndView("frmMeeICPOrgRegiConf");
                    
                }
      
    } catch (Exception ex) {
            System.err.println("Caught an exception."+ex.getMessage());
            ex.printStackTrace();
        }
        return null;
        
    }
}

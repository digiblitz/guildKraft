/*
 * EventRegPriceAction.java
 *
 * Created on December 27, 2007, 12:22 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;

import com.hlcutil.Debug;
import java.util.ArrayList;

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
import java.util.Date;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author Vidhya
 * @version
 */

	public class EventRegPriceAction implements Controller {
    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
      try{
            HttpSession session=request.getSession();
            HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            if(cmd!=null){
                if(cmd.equals("initCreatePrice")){
                    Debug.print("cmd in EventRegPriceAction :"+cmd);
                    ArrayList priceList=new ArrayList();
                    ArrayList seasonList=new ArrayList();
                    
                    priceList=vaigaiMeetingBean.getAllPriceTypes();
                    seasonList=vaigaiMeetingBean.getAllSeasons();
                    
                    request.setAttribute("priceList",priceList);
                    request.setAttribute("seasonList",seasonList);
                    
                    return new ModelAndView("frmMeeEventRegPriceAdd");
                }
                else if(cmd.equals("insertPrice")){
                    Debug.print("cmd in EventRegPriceAction :"+cmd);
                    String priceId=request.getParameter("selPriceType");
                    String seasonId=request.getParameter("selSeason");
                    String duePrice=request.getParameter("duePrice");
                    String afterPrice=request.getParameter("afterPrice");
                    float dueAmt=0;
                    float aftAmt=0;
                    if(duePrice!=null && duePrice.trim().length()!=0){
                    dueAmt=Float.parseFloat(duePrice);    
                    }
                    if(afterPrice!=null && afterPrice.trim().length()!=0){
                    aftAmt=Float.parseFloat(afterPrice);    
                    }
                    boolean createResult=false;
                    boolean isExist=vaigaiMeetingBean.isEventRegPriceExist(priceId,seasonId);  
                    if(isExist==true){
                        
                        ArrayList priceList=new ArrayList();
                        ArrayList seasonList=new ArrayList();

                        priceList=vaigaiMeetingBean.getAllPriceTypes();
                        seasonList=vaigaiMeetingBean.getAllSeasons();

                        request.setAttribute("priceList",priceList);
                        request.setAttribute("seasonList",seasonList);
                        request.setAttribute("err","st");
                        
                    return new ModelAndView("frmMeeEventRegPriceAdd");
                    }
                    else{
                    createResult=vaigaiMeetingBean.insertEventRegPriceDetails(priceId,seasonId,dueAmt,aftAmt);      
                    }
                    if(createResult==true){
                    	return new ModelAndView("frmMeeEventRegPriceAddConf");
                    }else{
                    	return new ModelAndView("frmMeeEventRegPriceAdd");
                    }
                }
                else if(cmd.equals("initListPrice")){
                    Debug.print("cmd in EventRegPriceAction :"+cmd);
                    ArrayList priceList=new ArrayList();
                    priceList=vaigaiMeetingBean.getAllPriceTypes();
                    request.setAttribute("priceList",priceList);
                             
                    return new ModelAndView("frmMeeEventRegPriceList");
                }
                else if(cmd.equals("listDetails")){
                    Debug.print("cmd in EventRegPriceAction :"+cmd);
                    String priceTypeId=request.getParameter("selPriceType");
                    ArrayList allPriceList=new ArrayList();
                    ArrayList priceList=new ArrayList();
                    
                    allPriceList=vaigaiMeetingBean.getAllPriceDetails(priceTypeId);
                    priceList=vaigaiMeetingBean.getAllPriceTypes();
                    
                    request.setAttribute("priceList",priceList);
                    request.setAttribute("allPriceList",allPriceList);
                    request.setAttribute("priceTypeId",priceTypeId);
                    return new ModelAndView("frmMeeEventRegPriceList");
                }
                else if(cmd.equals("viewEditPriceList")){
                Debug.print("cmd in EventRegPriceAction :"+cmd);
                
                String btnSubmit = request.getParameter("btnSubmit");
                String priceId = request.getParameter("priceId");
                
                ArrayList singlePriceDetail=new ArrayList();
                ArrayList priceList=new ArrayList();
                ArrayList seasonList=new ArrayList();

                priceList=vaigaiMeetingBean.getAllPriceTypes();
                seasonList=vaigaiMeetingBean.getAllSeasons();
                singlePriceDetail=vaigaiMeetingBean.getSinglePriceDetails(priceId);
                
                request.setAttribute("priceList",priceList);
                request.setAttribute("seasonList",seasonList);             
                request.setAttribute("singlePriceDetail",singlePriceDetail);
                if(btnSubmit.equals("Edit")){
                	return new ModelAndView("frmMeeEventRegPriceEdit");
                }
                else if(btnSubmit.equals("View")){
                	return new ModelAndView("frmMeeEventRegPriceView");
                }
               Debug.print("sucessfully comes from viewEditPriceList");
               return new ModelAndView("frmMeeEventRegPriceList");
            }
             if(cmd.equals("updatePrice")){
                    Debug.print("cmd in EventRegPriceAction :"+cmd);
                    ArrayList priceList=new ArrayList();
                    priceList=vaigaiMeetingBean.getAllPriceTypes();
                    request.setAttribute("priceList",priceList);
               
                    String priceId = request.getParameter("priceId");
                    String priceTypeId=request.getParameter("selPriceType");
                    String seasonId=request.getParameter("selSeason");
                    String duePrice=request.getParameter("duePrice");
                    String afterPrice=request.getParameter("afterPrice");
                    float dueAmt=0;
                    float aftAmt=0;
                    if(duePrice!=null && duePrice.trim().length()!=0){
                    dueAmt=Float.parseFloat(duePrice);    
                    }
                    if(afterPrice!=null && afterPrice.trim().length()!=0){
                    aftAmt=Float.parseFloat(afterPrice);    
                    }
                    boolean updateResult=false;
                    updateResult=vaigaiMeetingBean.updateEventRegPriceDetails(priceId,priceTypeId,seasonId,dueAmt,aftAmt);     
                    
                    if(updateResult==true){
                        request.setAttribute("priceTypeId",priceTypeId);
                        ArrayList allPriceList=new ArrayList();
                        allPriceList=vaigaiMeetingBean.getAllPriceDetails(priceTypeId);
                        request.setAttribute("allPriceList",allPriceList);
                        return new ModelAndView("frmMeeEventRegPriceList");
                    }else{
                    	return new ModelAndView("frmMeeEventRegPriceEdit");
                    }
                    
                }
                else if(cmd.equals("initSetDate")){
                Debug.print("cmd in EventRegPriceAction :"+cmd);
                
                ArrayList seasonList=new ArrayList();
                seasonList=vaigaiMeetingBean.getAllSeasons();
                request.setAttribute("seasonList",seasonList);
                
                return new ModelAndView("frmEventRegSetDate"); 
                }
                else if(cmd.equals("dateDetails")){
                Debug.print("cmd in EventRegPriceAction :"+cmd);
                String issueId=request.getParameter("season");
                String tempYear=request.getParameter("year");
                int year=0;
                ArrayList dateDetails =new ArrayList();
                ArrayList seasonList=new ArrayList();
                if(tempYear!=null && tempYear.trim().length()!=0){
                year=Integer.parseInt(tempYear);    
                }
                dateDetails=vaigaiMeetingBean.getEventRegDateDetails(issueId,year);
                seasonList=vaigaiMeetingBean.getAllSeasons();
                
                request.setAttribute("year",tempYear);
                request.setAttribute("issueId",issueId);
                request.setAttribute("seasonList",seasonList);
                request.setAttribute("dateDetails",dateDetails);
                return new ModelAndView("frmEventRegSetDate"); 
                }
                else if(cmd.equals("insertDateDetails")){
                Debug.print("cmd in EventRegPriceAction :"+cmd);
                String seasonId=request.getParameter("selSeason");
                String regDateId=request.getParameter("regDateId");
                String txtDue=request.getParameter("txtDue");
                String txtGrace=request.getParameter("txtGrace");
                String tempYear=request.getParameter("selYear");
                int year=0;
                if(tempYear!=null && tempYear.trim().length()!=0){
                year=Integer.parseInt(tempYear);    
                }
                Date dueDate=null;
                Date graceDate=null;
                if(txtDue!=null && txtDue.trim().length()!=0){
                dueDate=(Date)sdf.parse(txtDue);
                }
                if(txtGrace!=null && txtGrace.trim().length()!=0){
                graceDate=(Date)sdf.parse(txtGrace);
                }
                Debug.print("regDateId :"+regDateId);
                Debug.print("seasonId :"+seasonId);
                Debug.print("txtDue :"+txtDue);
                Debug.print("txtGrace :"+txtGrace);
                Debug.print("year :"+year);
                boolean result=false;
                result=vaigaiMeetingBean.insertEventRegDateDetails(regDateId,seasonId,dueDate,graceDate,year);
                if(result==true){
                	return new ModelAndView("frmMeeEventRegDateAddConf");    
                }else{
                	return new ModelAndView("frmEventRegSetDate");
                }
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }
  return null;    
  } 
   
}

/*
 * ActionEventLevel.java
 *
 * Created on December 22, 2006, 5:28 PM
 */

package com.mee.action.master;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hlcmro.org.HLCVaigaiSessionBean;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlccommon.util.Debug;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;
/**
 *
 * @author punitha
 * @version
 */

	
		public class ActionEventLevel implements Controller {
    /* forward name="success" path="" */
    private final static String SUCCESS = "EditHorseRegistration";
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
    try{
               
    	HLCVaigaiSessionBean vaigaiBean =new HLCVaigaiSessionBean();
            
            String process= (String) request.getParameter("process");
            Debug.print("Process in Servlet "+process);
             
            HttpSession session = request.getSession(true);


//=============================Add New Event Type=========================================================               
            
            
            if(process.equals("newEventLevel")){
                return new ModelAndView("frmMeeEventLevelAdd");
            }
           
            else if(process.equals("addLevel")){
                boolean result = false;
                String eventlevel = request.getParameter("eventlevel");
                String eventcode= request.getParameter("eventcode");
                String jumpinterface = request.getParameter("jumping");
                System.out.print("eventlevel:" + eventlevel);
                System.out.print("eventcode:" + eventcode);
                System.out.print("jumpinterface:" + jumpinterface);
                 if(eventlevel!=null){
                      eventlevel = eventlevel.trim();
                 }
                result =vaigaiBean.insertEventLevelMaster(eventlevel,eventcode,jumpinterface);
                    if(result==true){
                        return new ModelAndView("frmMeeEventLevelConf");
                    }
                    else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeEventLevelAdd");
                    }
            }
            
            else if(process.equals("lstEventLevel")){
              
                return new ModelAndView("frmMeeEventLevelList");
            }
 
//f//=============================Edit & Delete Event level=========================================================
            else if(process.equals("manupLevel")){
                String prolevel = request.getParameter("opType");
                String levelId = request.getParameter("levelId");
                System.out.print("prolevel:" + prolevel);
                System.out.print("levelId:" + levelId);
                    if(prolevel.equals("Edit")){
                        Vector levelObj = (Vector)vaigaiBean.displayEventLevelMaster(levelId);
                        request.setAttribute("editeventlevel",levelObj);
                        return new ModelAndView("frmMeeEventLevelEdit");
                    }
                    else if(prolevel.equals("Delete")){
                        Vector levelObj = (Vector)vaigaiBean.displayEventLevelMaster(levelId);
                        request.setAttribute("deleteEventLevel",levelObj);
                        return new ModelAndView("frmMeeEventLevelDelete");
                    }
            }
//=============================Edit Exist Event Level=========================================================
            else if(process.equals("editLevel")){
                 boolean result = false;
                    String eventlevelid= request.getParameter("edLeId");
                    String eventlevel = request.getParameter("eventlevel");
                    String eventcode= request.getParameter("eventcode");
                    String jumpinterface = request.getParameter("jumping");
                    System.out.print("eventlevelid:" + eventlevelid);
                    System.out.print("eventlevel:" + eventlevel);
                    System.out.print("eventcode:" + eventcode);
                    System.out.print("jumpinterface:" + jumpinterface);
                    result = vaigaiBean.updateEventLevelMaster(eventlevelid,eventlevel,eventcode,jumpinterface);
                    if(result==true){
                       return new ModelAndView("frmMeeEventLevelList"); 
                    }
                    else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeEventLevelEdit");
                    }
            }
            
             else if(process.equals("confirmDelete")){
                    String eventlevelid= request.getParameter("edLeId");
                    System.out.print("eventlevelid:" + eventlevelid);
                    boolean resultDelete = vaigaiBean.deleteEventLevelMaster(eventlevelid);
                    if(resultDelete == true){
                        return new ModelAndView("frmMeeEventLevelList"); 
                    }
                    else{
                        request.setAttribute("err","st");
                        return new ModelAndView("frmMeeEventLevelList"); 
                   }
             }
  //=================================Delete Event Level====================================================================
        }
        catch(Exception e){
            System.out.print("Exception :" + e.getMessage());
        }
 
 return null;
        
    }
}

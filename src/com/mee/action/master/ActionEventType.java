/*
 * ActionEventType.java
 *
 * Created on December 23, 2006, 2:32 PM
 */

package com.mee.action.master;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hlcmro.org.HLCVaigaiSessionBean;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
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
 * @author dhivya
 * @version
 */


	public class ActionEventType implements Controller {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
     
       try{
        
    	   HLCVaigaiSessionBean vaigaiBean =new HLCVaigaiSessionBean();
            Debug.print("Inital servlet process....");
            String process= (String) request.getParameter("process");
            Debug.print("Process in Servlet "+process);

             
            HttpSession session = request.getSession(true);

//=============================Add New Event Type=========================================================               
      
          
            if(process.equals("newEventType")){
            	return new ModelAndView("frmMeeEventTypeAdd");
                 }
                  if(process.equals("addType")){
                    try{
                        Debug.print("\n Inside Event Type Adding...\n"); 
                        String eventName=request.getParameter("eventName");
                        boolean bol=false;
                        Debug.print("eventName:"+eventName);
                        if(eventName!=null && eventName.trim().length()!=0){
                            eventName = eventName.trim();
                            bol = vaigaiBean.insertEventTypeMaster(eventName);
                        }
                        Debug.print("Boolean bol="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Inserted : "+bol);
                            return new ModelAndView("frmMeeEventTypeConf");          
                        }
                        else {   
                            request.setAttribute("err","st");
                            return new ModelAndView("frmMeeEventTypeAdd");
                        }
                     }
                    catch (Exception e){
                        Debug.print(" Error : "+e.getMessage());
                    }
                  }
//=============================Delete Event Type=========================================================   
                  
                  else if(process.equals("deactivate")){
                    try{
                        Debug.print("\n Inside Event Type deactivating...\n"); 
                        String eventId =request.getParameter("eventId");
                        System.out.println("eventId  ="+eventId );
                        boolean bol = vaigaiBean.deleteEventTypeMaster(eventId);
                         System.out.println("bol ="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Deactivated : "+bol);
                            return new ModelAndView("frmMeeEventTypeListConf");                        
                        }
                        else {
                          request.setAttribute("err","st");
                          return new ModelAndView("frmMeeEventTypeDelete");
                        }
                   }
                    catch(Exception e){
                        Debug.print("Error: "+e.getMessage());                      
                    }
                  }
                 
//==================================Update=================================================      
                  
                   else if(process.equals("update")){
                        try{
                            Debug.print("\n Inside Event Type Updating...\n"); 
                            String eventId=request.getParameter("eventId");
                            String eventName=request.getParameter("eventName");
                            
                            Debug.print(" Event Id in Servlet:" + eventId);
                            Debug.print(" eventName in Servlet:" + eventName);
                            
                            if(eventId!=null && eventId.trim().length()!=0 && eventName!=null && eventName.trim().length()!=0){
                                boolean bol = vaigaiBean.updateEventTypeMaster(eventName,eventId);
                                Debug.print("   Result :" + bol);
                                if (bol == true){
                                    Debug.print(" Succeffully Updated : "+bol);
                                    return new ModelAndView("frmMeeEventTypeUpdateConf");                        
                                }
                                else {
                                    String[] s=new String[4];
                                    Vector vObja = (Vector)vaigaiBean.displayEventTypeMaster(eventId);
                                    Enumeration e = vObja.elements();
                                    if(e.hasMoreElements()){
                                         s = (String [])e.nextElement();                                    
                                        System.out.println("Hello Test123");
                                        System.out.println(""+s[0]+":"+s[1]+":"+s[2]+":"+s[3]);                           
                                    }
                                       request.setAttribute("EventTypedet",s);
                                       request.setAttribute("eventId",s[0]);
                                       request.setAttribute("eventName",s[1]); 
                                  request.setAttribute("err","st");
                                  return new ModelAndView("frmMeeEventTypeEdit");
                                }
                            }
                           
                        }
                        catch (Exception e){
                            Debug.print(" Error : "+e.getMessage());
                        }
                  }
//============================================View Event Type=====================================
                   else if(process.equals("view")){
                        try{ 
                                
                        String eventId=request.getParameter("eventId");
                        String eventStatus = request.getParameter("btnSubmit");
                                String[] s=new String[4];
                                Vector vObja = (Vector)vaigaiBean.displayEventTypeMaster(eventId);
                                Enumeration e = vObja.elements();
                                if(e.hasMoreElements()){
                                     s = (String [])e.nextElement();                                    
                                    System.out.println("Hello Test123");
                                    System.out.println(""+s[0]+":"+s[1]+":"+s[2]+":"+s[3]);                           
                                }
                             
                                    request.setAttribute("EventTypedet",s);
                                    request.setAttribute("eventId",s[0]);
                                    request.setAttribute("eventName",s[1]);
                        if(eventStatus.equals("Activate")){
                        	return new ModelAndView("frmMeeEventTypeListConf"); 
                        }
                        else if(eventStatus.equals("Edit")){
                        	return new ModelAndView("frmMeeEventTypeEdit");
                        }
                        else if(eventStatus.equals("Deactivate")){
                        	return new ModelAndView("frmMeeEventTypeListConf");
                        }
                        }
                        catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
//===========================================List Event Type=============================
                   /*else if(process.equals("list")){
                        try{
                            Debug.print("\n Inside Event Type List all ....\n");
                           Vector vObj = (Vector)vaigaiBean.displayAllEventTypeMaster();
                           request.setAttribute("EventTypeAllList",vObj);
                            return mapping.findForward("frmMeeEventTypeList");
                           }
                            catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }*/
            
            
            if(process.equals("list")){
            	return new ModelAndView("frmMeeEventTypeList");
                 }
            
             else if(process.equals("initList")){
             
                        try{
                            Debug.print("\n Inside Event Type List all ....\n");
                            boolean result = false;
                         
                              Vector vObj = (Vector)vaigaiBean.displayAllEventTypeMaster(result);
                               //request.setAttribute("status",eventStatus);
                                request.setAttribute("EventTypeAllList",vObj);
                                return new ModelAndView("frmMeeEventTypeList");
                           }
                            catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
            
            
                    
 //======================================Activate=======================================                                  
                         
                       
                   else if(process.equals("activate")){
                        try{
                            Debug.print("\n Inside Event Type Activate  ....\n");
                            String eventId=request.getParameter("eventId");
                            boolean bol = vaigaiBean.activateEventTypeMaster(eventId);
                            if (bol == true){
                                Debug.print(" Succeffully Activated : "+bol);
                                return new ModelAndView("frmMeeEventTypeListConf");                        
                            }
                            else {
                              request.setAttribute("err","st");
                              return new ModelAndView("frmMeeEventTypeActivate");
                            }
                            
                        }
                        catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
              }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
}
      
            
            
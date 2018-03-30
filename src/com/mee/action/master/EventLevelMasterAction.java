/*
 * DivisionEventTypeMasterAction.java
 *
 * Created on December 23, 2006, 2:04 PM
 */

package com.mee.action.master;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.naming.Context;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hlcmro.org.*;

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
 * @author vidhya
 * @version
 */

	public class EventLevelMasterAction implements Controller {
    
		 public ModelAndView handleRequest(HttpServletRequest request,
					HttpServletResponse response) throws ServletException, IOException,ProtocolException,
					IOException, ParserConfigurationException, SAXException {
			 
			 try{
				 HLCVaigaiSessionBean vaigaiBean =new HLCVaigaiSessionBean();
				 
            HttpSession session = request.getSession(true);
            String process = request.getParameter("process");              
            System.out.println("Process is "+process);
                    
                /*  Add 
                 *
                 *      Process flow directed to insert Event Level Master details JSP page
                 */                  
                 if(process.equals("add")){
                 return new ModelAndView("frmMeeEventLevelCreate"); //
                 }
                  if(process.equals("insert")){
                    try{
                        Debug.print("\n Inside Refund Rule Adding...\n"); 
                        String eventlevel=request.getParameter("eventlevel");
                        String eventcode=request.getParameter("eventcode");
                        String jumpinterface=null;
                        boolean bol=false;
                        Debug.print(" eventlevel:"+eventlevel);
                        if(eventlevel!=null && eventlevel.trim().length()!=0 && eventcode!=null && eventcode .trim().length()!=0){
                            eventlevel = eventlevel.trim();
                            eventcode  =eventcode.trim();
			    bol = vaigaiBean.insertEventLevelMaster(eventlevel,eventcode,jumpinterface);
                        }
                        Debug.print("Boolean bol="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Inserted : "+bol);
                            return new ModelAndView("frmMeeEventLevelConf");          
                        }
                        else {   
                            request.setAttribute("err","st");
                            return new ModelAndView("frmMeeEventLevelCreate");
                        }
                     }
                    catch (Exception e){
                        Debug.print(" Error : "+e.getMessage());
                    }
                  }
                 /*  Delete 
                 *
                 *      Process flow directed to delete Event Level Master  details JSP page
                 */  
                  
                  else if(process.equals("deactivate")){
                    try{
                        Debug.print("\n Inside Division Event Name Deleting...\n"); 
                        String eventId=request.getParameter("eventId");
                        System.out.println("eventId ="+eventId);
                       	boolean bol = vaigaiBean.deleteEventLevelMaster(eventId);
                         System.out.println("bol ="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Deleted : "+bol);
                            return new ModelAndView("frmMeeEventLevelStatusConf");                        
                        }
                        else {
                          request.setAttribute("err","st");
                          return new ModelAndView("frmMeeEventLevelDelete");
                        }
                   }
                    catch(Exception e){
                        Debug.print("Error: "+e.getMessage());                      
                    }
                  }
                 /*  Update 
                 *
                 *      Process flow directed to Update Event Level Master details JSP page
                 */  
                        

            else if(process.equals("update")){
                        try{
                            Debug.print("\n Inside Event Type Updating...\n"); 
                            String eventId=request.getParameter("eventId");
                            String eventlevel=request.getParameter("eventlevel");
                            String eventcode=request.getParameter("eventcode");
                            String jumpinterface=null;
                            Debug.print(" Event Id in Servlet:" + eventId);
                            Debug.print(" eventlevel in Servlet:" + eventlevel);
                            Debug.print(" eventcode in Servlet:" + eventcode);
                            
                            if(eventId!=null && eventId.trim().length()!=0 && eventlevel!=null && eventlevel.trim().length()!=0 && eventcode!=null && eventcode.trim().length()!=0){
                                boolean bol = vaigaiBean.updateEventLevelMaster(eventlevel,eventcode,jumpinterface,eventId);
                                Debug.print("   Result :" + bol);
                                if (bol == true){
                                    Debug.print(" Succeffully Updated : "+bol);
                                    return new ModelAndView("frmMeeEventLevelEditConf");                        
                                }
                                else {
                                    String[] s=new String[4];
                                    Vector vObja = (Vector)vaigaiBean.displayEventLevelMaster(eventId);
                                    Enumeration e = vObja.elements();
                                    if(e.hasMoreElements()){
                                         s = (String [])e.nextElement();                                    
                                        System.out.println("Hello Test123");
                                        System.out.println(""+s[0]+":"+s[1]+":"+s[2]+":"+s[3]);                           
                                    }
                                       request.setAttribute("EventDetail",s);
                                       request.setAttribute("eventId",s[0]);
                                        request.setAttribute("eventlevel",s[1]); 
                                        request.setAttribute("eventcode",s[2]); 
                                  request.setAttribute("err","st");
                                  return new ModelAndView("frmMeeEventLevelEdit");
                                }
                            }
                          
                        }
                        catch (Exception e){
                            Debug.print(" Error : "+e.getMessage());
                        }
                  }
 //=========================================For View===============================
            
             else if(process.equals("view")){
                        try{ 
                        
                        String eventId=request.getParameter("eventId");
                        String eventStatus = request.getParameter("btnSubmit");
                                String[] s=new String[4];
                                Vector vObja = (Vector)vaigaiBean.displayEventLevelMaster(eventId);
                                Enumeration e = vObja.elements();
                                if(e.hasMoreElements()){
                                     s = (String [])e.nextElement();                                    
                                    System.out.println("Hello Test123");
                                    System.out.println(""+s[0]+":"+s[1]+":"+s[2]+":"+s[3]);                           
                                }
                             
                                    request.setAttribute("EventDetail",s);
                                    request.setAttribute("eventId",s[0]);
                                    request.setAttribute("eventlevel",s[1]);
                                    request.setAttribute("eventcode",s[2]);
                        if(eventStatus.equals("Activate")){
                           return new ModelAndView("frmMeeEventLevelStatusConf"); 
                        }
                        else if(eventStatus.equals("Edit")){
                           return new ModelAndView("frmMeeEventLevelEdit");
                        }
                        else if(eventStatus.equals("Deactivate")){
                           return new ModelAndView("frmMeeEventLevelStatusConf");
                        }
                        }
                        catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
//===========================List============================
                  
                  if(process.equals("list")){
                 return new ModelAndView("frmMeeEventLevelList");
                 }
             else if(process.equals("initList")){
                        try{
                            Debug.print("\n Inside Event Level List all ....\n");
                            boolean result = false;
                          
                             Vector vObj = (Vector)vaigaiBean.displayAllEventLevelMaster(result);
                             
                                request.setAttribute("EventAllList",vObj);
                                return new ModelAndView("frmMeeEventLevelList");
                           }
                            catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
            
   //================================                                                
                         
                       
                   else if(process.equals("activate")){
                        try{
                            Debug.print("\n Inside Division Event Activate  ....\n");
                            String eventId=request.getParameter("eventId");
                            
                	    boolean bol = vaigaiBean.activateEventLevelMaster(eventId);
                            if (bol == true){
                                Debug.print(" Succeffully Activated : "+bol);
                                return new ModelAndView("frmMeeEventLevelStatusConf");                        
                            }
                            else {
                              request.setAttribute("err","st");
                              return new ModelAndView("frmMeeEventLevelActivate");
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


/*
 * EventLvlTypMapAction.java
 *
 * Created on April 10, 2007, 1:10 PM
 */

package com.mrm.action;

import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemote;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemoteHome;
import com.hlcmro.display.*;
import com.hlcmro.org.*; 
import com.hlccommon.util.Debug;

import java.io.IOException;
import java.net.ProtocolException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletException;
import javax.servlet.http.*;
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
 * @author Hari
 * @version
 */

public class EventLvlTypMapAction implements Controller {

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
         try {
           
            HttpSession session=request.getSession();
         
            HLCkaverySessionBeanStatlessBean horseremote = new HLCkaverySessionBeanStatlessBean();

            
            HLCVaigaiStatelessBean vaigaiRemote = new HLCVaigaiStatelessBean(); 

            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");

            String process = request.getParameter("process");
            Debug.print("Process in Servlet " + process);
            
            /*
             *Mapping event Level to codes
             */
            if(process.equalsIgnoreCase("ListEvntLevel")){
                Debug.print("Listing the Mapping Event to Level Codes");
                Vector allTypesVect = (Vector)vaigaiRemote.getAllTypes();
                Vector allLvlsVect = (Vector)vaigaiRemote.getAllLevels();
                request.setAttribute("allTypesVect",allTypesVect);
                request.setAttribute("allLvlsVect",allLvlsVect);
                request.setAttribute("eventTypeId",null);
                return new ModelAndView("frmMemEventTypeMap");
            }
            
            /*
             * Selecting the appropriate Mapping Information to particular event Level
             */
            if(process.equalsIgnoreCase("MapEvntLevel")){
                Debug.print("Mapping Event to Level Codes");
                try{
                    String eventTypeId = request.getParameter("eventTypeId");
                    Debug.print("Event Type ID "+eventTypeId);
                    if(eventTypeId!=null || eventTypeId.trim().length()!=0){
                        ArrayList eventLevelList = horseremote.getMappingDetailsForEventTypeAndEventLevels(eventTypeId);
                        Vector allTypesVect = (Vector)vaigaiRemote.getAllTypes();
                        Vector allLvlsVect = (Vector)vaigaiRemote.getAllLevels();
                        request.setAttribute("allTypesVect",allTypesVect);
                        request.setAttribute("allLvlsVect",allLvlsVect);                
                        request.setAttribute("eventLevelList",eventLevelList);
                        request.setAttribute("eventTypeId",eventTypeId);
                        return new ModelAndView("frmMemEventTypeMap");                                    
                    }
                }
                catch(Exception eDisp){
                        Debug.print("while getting roleEntSelect:" + eDisp);
                }
            }
            
             /*
             * Update Mapping Information mapping to particular event Level
             */
            if(process.equalsIgnoreCase("insertEvntLevel")){
                Debug.print("Updating the Mapping Event Type to Level Codes");
                ArrayList eventLevelList = new ArrayList();
                String eventTypeId = request.getParameter("eventTypeId");
                Debug.print("Event Type ID "+eventTypeId);

                String entityIds = request.getParameter("entityIds");
                Debug.print("entityIds:" + entityIds);
                StringTokenizer strTkns = new StringTokenizer(entityIds,"#");
                boolean result = false;
                
                while(strTkns.hasMoreTokens()){
                    try{
                        String entityId = (String)strTkns.nextToken();
                        if(entityId!=null && entityId.trim().length()!=0){
                            Debug.print("ActionRoleMangement.mappingRoleEnt() Added from Stokenizer:" + entityId);
                            eventLevelList.add(entityId);
                        }
                    }
                    catch(Exception e){
                        Debug.print("Exception while spliting privilegeIds ActionRoleMangement.mappingRoleEnt() :" + e);
                    }
                }
                if(eventTypeId!=null || eventTypeId.trim().length()!=0){
                    boolean insert_map = horseremote.generateMappingEventTypeWithEventLevels(eventTypeId,eventLevelList);
                    Debug.print("Mapping Insert Result "+insert_map);                   
                    if(insert_map==true){
                        Debug.print("ActionRoleMangement.mappingRoleEnt() sucessfully comes from servlet.");
                        Vector allTypesVect = (Vector)vaigaiRemote.getAllTypes();
                        Vector allLvlsVect = (Vector)vaigaiRemote.getAllLevels();
                        eventLevelList = horseremote.getMappingDetailsForEventTypeAndEventLevels(eventTypeId);
                        request.setAttribute("allTypesVect",allTypesVect);
                        request.setAttribute("allLvlsVect",allLvlsVect); 
                        request.setAttribute("eventTypeId",eventTypeId);
                        request.setAttribute("eventLevelList",eventLevelList);
                        return new ModelAndView("frmMemEventTypeMap");
                    }else{
                       Debug.print("ActionRoleMangement.mappingRoleEnt() sucessfully comes from servlet.");
                        Vector allTypesVect = (Vector)vaigaiRemote.getAllTypes();
                        Vector allLvlsVect = (Vector)vaigaiRemote.getAllLevels();
                        eventLevelList = horseremote.getMappingDetailsForEventTypeAndEventLevels(eventTypeId);
                        request.setAttribute("allTypesVect",allTypesVect);
                        request.setAttribute("allLvlsVect",allLvlsVect); 
                        request.setAttribute("eventTypeId",eventTypeId);
                        request.setAttribute("eventLevelList",eventLevelList);
                        return new ModelAndView("frmMemEventTypeMap"); 
                    }
                    
                }
            }
          } 
         catch(Exception e){
            System.out.println("Exception in MemEventLevelMapAction Action: " + e.toString());
        }
        return null;
      
    }
}



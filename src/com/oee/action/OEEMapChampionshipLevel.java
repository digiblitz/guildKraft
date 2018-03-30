/*
 * OEEMapChampionshipLevel.java
 *
 * Created on November 16, 2007, 1:49 PM
 */

package com.oee.action;

import com.hlccommon.util.Debug;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemote;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessRemoteHome;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.StringTokenizer;
import java.util.Vector;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import com.hlcutil.HLCValidationVO;
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
 * @author Dhivya
 * @version
 */


	public class OEEMapChampionshipLevel implements Controller {
    
  
    
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
           
        	HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
            String cmd = request.getParameter("cmd");
            HttpSession session = request.getSession(true);
            HLCValidationVO validVO = new HLCValidationVO();
            
            
            
            if(cmd!=null && cmd.equalsIgnoreCase("intChmpLevel")){
                Debug.print("OEEMapChampionshipLevel intChmpLevel process:");
                ArrayList areaDetails = new ArrayList();
                Vector eventTypeDetails = null;
                
                areaDetails = krishnaBean.getAllAreaMasters();
                eventTypeDetails = krishnaBean.getAllEventTypes();
                String eventType="";
                String areaId="";
                request.setAttribute("areaDetails",areaDetails);
                request.setAttribute("eventTypeDetails",eventTypeDetails);
                request.setAttribute("eventType",eventType);
                request.setAttribute("areaId",areaId);
                return new ModelAndView("frmChampLevelMap");
            }
            
            else if(cmd!=null && cmd.equalsIgnoreCase("eveLevel")){
                String eventType=request.getParameter("eveType");
                String areaId=request.getParameter("selArea");
                ArrayList areaDetails = new ArrayList();
                ArrayList eventLevelAreaDets = new ArrayList();
                Vector eventTypeDetails = null;
                
                ArrayList eventLevelDetails = new ArrayList();
                areaDetails = krishnaBean.getAllAreaMasters();
                eventTypeDetails = krishnaBean.getAllEventTypes();
                eventLevelDetails = krishnaBean.getAllEventLevels();
                eventLevelAreaDets = krishnaBean.getEventLevelsBasedOnAreaId(areaId);
                
                request.setAttribute("areaDetails",areaDetails);
                request.setAttribute("eventTypeDetails",eventTypeDetails);
                request.setAttribute("eventType",eventType);
                request.setAttribute("eventLevelAreaDets",eventLevelAreaDets);
                request.setAttribute("eventLevelDetails",eventLevelDetails);
                request.setAttribute("areaId",areaId);
                return new ModelAndView("frmChampLevelMap");
            }
            
            else if(cmd!=null && cmd.equalsIgnoreCase("mapLevel")){
                
                boolean output=false;
                boolean flag = true;
                ArrayList areaDetails = new ArrayList();
                areaDetails = krishnaBean.getAllAreaMasters();
                ArrayList eventLevelDetails = new ArrayList();
                String areaId=request.getParameter("selArea");
                Debug.print("Area ID in OEEMapChampionshipLevel: "+areaId);
                String chkdEveLevels = request.getParameter("chkdEveLevels");
                Debug.print("chkdEveLevel:" + chkdEveLevels);
                StringTokenizer strTkns = new StringTokenizer(chkdEveLevels,"#");
                boolean result = false;
                boolean output1 = false;
                String chkdEveLevel="";
                while(strTkns.hasMoreTokens()){
                    try{
                        chkdEveLevel = (String)strTkns.nextToken();
                        if(chkdEveLevel!=null && chkdEveLevel.trim().length()!=0){
                            Debug.print("OEEMapChampionshipLevel added levels:" + chkdEveLevel);
                            eventLevelDetails.add(chkdEveLevel);
                        }
                    } catch(Exception e){
                        Debug.print("Exception while spliting eventlevel OEEMapChampionshipLevel:" + e);
                    }
                }
                
                if(areaId!=null || areaId.trim().length()!=0){
                    output = krishnaBean.mappingAreaWithEventLevel(areaId,eventLevelDetails);
                    Debug.print("output in OEEMapChampionshipLevel"+output);
                    
                    if(output==true){
                        Debug.print("ActionRoleMangement.mappingRoleEnt() sucessfully comes from servlet.");
                        ArrayList eventLevelAreaDets = new ArrayList();
                        areaDetails = krishnaBean.getAllAreaMasters();
                        eventLevelDetails = krishnaBean.getAllEventLevels();
                        eventLevelAreaDets = krishnaBean.getEventLevelsBasedOnAreaId(areaId);
                        request.setAttribute("areaDetails",areaDetails);
                        request.setAttribute("eventLevelAreaDets",eventLevelAreaDets);
                        request.setAttribute("eventLevelDetails",eventLevelDetails);
                        request.setAttribute("areaId",areaId);
                        return new ModelAndView("frmChampLevelMap");
                    }
                }
                
            }
            
        } catch(Exception e){
            Debug.print("Exception in OEEMapChampionshipLevel" +e);
        }
        
        return null;
        
    }
}

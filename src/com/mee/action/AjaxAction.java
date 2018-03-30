/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.mee.action;

import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemote;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemoteHome;
import com.hlccommon.util.Debug;
import com.hlcevent.edu.HLCEducationalSessionRemote;
import com.hlcevent.edu.HLCEducationalSessionRemoteHome;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmro.display.HLCVaigaiStatelessRemote;
import com.hlcmro.display.HLCVaigaiStatelessRemoteHome;
import com.hlcmro.org.HLCVaigaiSessionBean;
import com.hlcmsg.session.HLCMessageSessionRemote;
import com.hlcmsg.session.HLCMessageSessionRemoteHome;
import com.util.OptionsBuilder;
import java.io.*;
import java.net.ProtocolException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import com.hlchorse.form.display.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import javax.naming.Context;
import javax.naming.InitialContext;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.MessageResources;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author vijitha
 */
public class AjaxAction implements Controller{
   
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
        Debug.print("Ajax Action executing....");
        Debug.print("areaZipValidation executing....");
        System.out.println("Ajax >>-------------->");
        String process=request.getParameter("method");
        
        if(process!=null) {
            if(process.equalsIgnoreCase("areaZipValidation")){
        String  stateId = request.getParameter("stateId");
        String zipValue = request.getParameter("zip");
        Debug.print("State Id from input: "+stateId);
        
        
        HLCVaigaiSessionBean vgai  = new HLCVaigaiSessionBean();
        if(stateId!=null && zipValue!=null && stateId.trim().length()!=0 && zipValue.trim().length()!=0) {
            Debug.print("Area and Zip validation in ajax action executing....");
            //ArrayList memberDetails = eduRemote.getMemberContactDetails(memberId);
            ArrayList areaDetails = vgai.getZipcodeFromToOnStateId(stateId,zipValue);
            String encoding = "UTF-8";
            StringBuffer xml = new StringBuffer();
            if(areaDetails!=null && areaDetails.size()!=0){
                Iterator itr = areaDetails.iterator();
                xml.append("<?xml version=\"1.0\"");
                if (encoding != null) {
                    xml.append(" encoding=\"");
                    xml.append(encoding);
                    xml.append("\"");
                }
                xml.append(" ?>\n");
                
                while(itr.hasNext()){
                    String[] areaStr = (String[])itr.next();
                    String areaId = areaStr[0];
                    String areaName = areaStr[1];
                    xml.append("<AreaDetails>"+areaId+"#"+areaName+"</AreaDetails>");
                }
            }
            // Set content to xml
            response.setContentType("text/xml; charset=UTF-8");
            response.setHeader("Cache-Control", "no-cache");
            PrintWriter pw = response.getWriter();
            Debug.print("XmlContent = "+xml);
            pw.write(xml.toString());
            pw.close();
            return null;
        } else{
            return null;
        }
    }
    
        }
		return null;
        
    }
}

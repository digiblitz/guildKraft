/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
/*  Program Name    : AjaxActionAdvertise.java
 *  Created Date    : September 4, 2006, 4:24 PM
 *  Author          : Shiva Kumar Subbiaha
 *  Version         : 1.8
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */
package com.adv.action;
import com.hlcadv.advertise.HLCAdvertiseSessionRemote;
import com.hlcadv.advertise.HLCAdvertiseSessionRemoteHome;
import com.hlccommon.util.Debug;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemote;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemoteHome;
import com.hlcrole.management.HLCBrahmaputraSessionRemote;
import com.hlcrole.management.HLCBrahmaputraSessionRemoteHome;
import com.util.OptionsBuilder;
import javax.naming.NamingException;
import javax.servlet.http.*;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;
import java.io.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import java.util.*;

public class AjaxActionAdvertise  extends DispatchAction {
   
     private HLCAdvertiseSessionRemote advRemote = null;
    
         /**
          *  To load the drop down list for media type and dimension type   
          */
     
        public final ActionForward mediaDimType(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
		Debug.print("mediaDimType method is calling...........");
                HLCAdvertiseSessionRemote advRemote  = initializeEJB(request); 
                Vector dispMediaType = (Vector)advRemote.getAllMediaDetails();
                ArrayList disMediaList = getDropDown(dispMediaType);
                Debug.print("All media Types :"+disMediaList);
                request.setAttribute("DisplayMediaDetails",disMediaList);
                Vector dispDimensionType =(Vector)advRemote.getAllDimensionDetails();
                 ArrayList disDimList = getDropDown(dispDimensionType);
                Debug.print("All Dimension Types :"+disDimList);
                request.setAttribute("DispDimensionDetails",disDimList);
              
                return mapping.findForward("frmAdvDimensionDetailsAdd");               
	}
       
     
         /**
          *  To load the drop down list for display type against mediatype
          */
        public final ActionForward advType(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {
		Debug.print("advType method is calling...........");
                HLCAdvertiseSessionRemote advRemote  = initializeEJB(request);
                String mid = request.getParameter("mid");
                Debug.print("Servlet mid" + mid);                            
		Vector displayType = (Vector)advRemote.getMediaDisplayTypeDetails(mid);  
		return getXmlContent(request,response,displayType);
	}
	
        /**
          *  To load the drop down list for displaySubtype against displayType
          */
	public final ActionForward advSubType(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {		
                         Debug.print("advSubType method is calling...........");
                        HLCAdvertiseSessionRemote advRemote  = initializeEJB(request);
                        String dispId = request.getParameter("dispId");
                        Vector dispSubType = (Vector)advRemote.getDisplayTypeFromSubType(dispId);
			return getXmlContent(request,response,dispSubType);
	}
        
        public final ActionForward advGetAmount(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
            HttpServletResponse response) throws Exception {		
            
            Debug.print("advGetAmount method is calling...........");
            Debug.print("Ajax After GetWriter:" );

            HLCAdvertiseSessionRemote advRemote  = initializeEJB(request);
            Debug.print("Ajax After AdvertiseSessionRemote:" );
            
            String selPlanDisp = request.getParameter("selPlanDisp");
            String mediaId = request.getParameter("mediaId");

            Debug.print("Ajax mediaId:" + mediaId);
            Debug.print("Ajax selPlanDisp:" + selPlanDisp);
               
            if(selPlanDisp!=null && !selPlanDisp.equals("") && mediaId!=null && !mediaId.equals("")){
                int incVal = Integer.parseInt(selPlanDisp);
                    
                ArrayList al = new ArrayList();
                try{
                    for(int i = 1; i<=incVal;i++){
                        //String chkIssue = request.getParameter("chkIssueId" + i);
                        String selWinTypechkIssue = request.getParameter("selWinTypeIdchkIssue" + i);

                        String selWinSubTypechkIssue = request.getParameter("selWinSubTypeIdchkIssue" + i);
                        //String selWinDimchkIssue = request.getParameter("selWinDimchkIssue" + i);
                        //String placement = request.getParameter("txtWinPlace" + i);

                        //Debug.print("Ajax chkIssue:" + chkIssue);
                        Debug.print("Ajax selWinTypechkIssue:" + selWinTypechkIssue);
                        Debug.print("Ajax selWinSubTypechkIssue:" + selWinSubTypechkIssue);
                        //Debug.print("Ajax selWinDimchkIssue:" + selWinDimchkIssue);
                        ArrayList listFreq = new ArrayList();
                        if(selWinTypechkIssue!=null && !selWinTypechkIssue.equals("") && selWinSubTypechkIssue!=null && !selWinSubTypechkIssue.equals("")){
                            Debug.print("Ajax inside Loop:" + selWinSubTypechkIssue);
                            listFreq = (ArrayList)advRemote.getMapIdDetails(mediaId,selWinTypechkIssue,selWinSubTypechkIssue);
                        
                            if(listFreq!=null && listFreq.size()!=0){
                                Iterator e = listFreq.iterator();
                                while(e.hasNext()){
                                    String mapPriceVal = (String) e.next();
                                    al.add(mapPriceVal);
                                }
                            }
                        }
                    }
                }
                catch(Exception e){
                    Debug.print("Exception in AjaxActionAdvertise:" + e.getMessage());
                }
                
                long totalPrice = 0;
                if(al!=null && al.size()!=0){
                    Hashtable ht = getMapIdFromUserRequest(al);
                    Debug.print("Size:" + ht.size());
                    Enumeration k = ht.keys();
                    while (k.hasMoreElements()) {
                        String key = (String) k.nextElement();
                        int value = ((Integer) ht.get(key)).intValue();
                        int price = advRemote.getPriceFromMap(key, value);
                        int localPrice = (price * value);
                        totalPrice = totalPrice + localPrice;
                        Debug.print("Price:" + price + "     = >>> Frequence : " + value + " =>>>>>>  Total :" +  localPrice + " <br>");
                    }
                }
                Debug.print("<br>=========================<br>");
                Debug.print("Grand Total:" + totalPrice + "<br>");
                Debug.print("=========================<br>");
                //pw.write("<price><![CDATA[" + totalPrice + "]]></price>");
                String xml = null;
                try {
                    xml = new OptionsBuilder().getAmountContent(totalPrice);
                    Debug.print("Price XmlContent  = "+xml); 		   		     
                } catch (Exception ex) {
                    // Send back a 500 error code.
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
                    return null;
                }
                // Set content to xml
                response.setContentType("text/xml; charset=UTF-8");
                response.setHeader("Cache-Control", "no-cache");
                PrintWriter pw = response.getWriter();
                pw.write(xml);
                pw.close();
            }
        return null;
    }
        
     
        
         private Hashtable getMapIdFromUserRequest(ArrayList al){
            Hashtable ht = null;
            ArrayList chkArray = null;			
            if(al!=null && al.size()!=0){
                ht = new Hashtable();
                chkArray = al;
                   for (Iterator it = al.iterator(); it.hasNext();) {
                        String chkVal = (String) it.next();
                        int count = 0;
                        for (Iterator it1 = chkArray.iterator(); it1.hasNext();) {
                                String chkValAgaint = (String) it1.next();
                                if(chkVal.equals(chkValAgaint)){
                                        count++;
                                }
                        }

                        if(!ht.containsKey(chkVal)){
                                ht.put(chkVal,new Integer(count));
                       }
                    }
            }
            return ht;
        }
        
        
        
        
         /**
          *  To load the drop down list for displaySubtype against displayType
          */
                        public final ActionForward advSubTypeIssues(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {		
                         Debug.print("advSubType method is calling...........");
                         HLCAdvertiseSessionRemote advRemote  = initializeEJB(request);
                        String mid = request.getParameter("mid");
                        Vector issuetype = (Vector)advRemote.getIssueByMedia(mid);
                        Vector dispType = (Vector)advRemote.getMediaDisplayTypeDetails(mid);
			return getIssueContent(request,response,issuetype,dispType);
	}
	 /**
          *  return the xml content for the given drop down
          */
	public final ActionForward getXmlContent(HttpServletRequest request,HttpServletResponse response,Vector vec) throws Exception {
		 String xml = null;
		    try {
                       xml = new OptionsBuilder().getContent(vec);
                       Debug.print("XmlContent = "+xml); 		   		     
		    } catch (Exception ex) {
		      // Send back a 500 error code.
		      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
		      return null;
		    }
		    // Set content to xml
		    response.setContentType("text/xml; charset=UTF-8");
		    response.setHeader("Cache-Control", "no-cache");
		    PrintWriter pw = response.getWriter();
		    pw.write(xml);
		    pw.close();
		    return null;     
	}
        
        
     
        
         /**
          *  return the xml content for the given drop down
          */
        public final ActionForward getIssueContent(HttpServletRequest request,HttpServletResponse response,Vector issueType,Vector dispType) throws Exception {
		 String xml = null;
		    try {
                       xml = new OptionsBuilder().getIssueContent(issueType,dispType);
                       Debug.print("XmlContent = "+xml); 		   		     
		    } catch (Exception ex) {
		      // Send back a 500 error code.
		      response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Can not create response");
		      return null;
		    }
		    // Set content to xml
		    response.setContentType("text/xml; charset=UTF-8");
		    response.setHeader("Cache-Control", "no-cache");
		    PrintWriter pw = response.getWriter();
		    pw.write(xml);
		    pw.close();
		    return null;     
	}
        
        //================Dhivya Here:LOBs Loading============================
        /**
         *  To load the drop down list for LOBs based on view point Id
         */
	public final ActionForward lobsList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
			HttpServletResponse response) throws Exception {		
                        Debug.print("lobsList method is calling...........");
                        HLCBrahmaputraSessionRemote roleRemote  = initializeEJBs(request);
                       String viewPntId = request.getParameter("viewPntId");
                       Debug.print("lobsList(): viewPntId..........."+viewPntId);
                       Vector lobsObj = (Vector)roleRemote.getLOBs(viewPntId);
                       
                       Debug.print("lobsList() LOBs size..........."+lobsObj.size());
			return getXmlContent(request,response,lobsObj);
	}
	
	
	 //================Dhivya Here:Views & Groups Loading============================
    /**
     *  To load the drop down list for LOBs based on view point Id, LOB Id
     */
public final ActionForward viewGrpList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
		HttpServletResponse response) throws Exception {		
                    Debug.print("viewGrpList method is calling...........");
                    HLCBrahmaputraSessionRemote roleRemote  = initializeEJBs(request);
                   String viewPntId = request.getParameter("viewPntId");
                   String lobId = request.getParameter("lobId");
                   
                   Debug.print("viewGrpList(): viewPntId..........."+viewPntId);
                   Debug.print("viewGrpList(): lobId..........."+lobId);
                   
                   Vector viewsObj = (Vector)roleRemote.getViews(viewPntId,lobId);
                   Vector grpsObj = (Vector)roleRemote.getGroups(viewPntId,lobId);
                   
                   Debug.print("viewGrpList() view size..........."+viewsObj.size());
                   Debug.print("viewGrpList() grp size..........."+grpsObj.size());
		return getIssueContent(request,response,viewsObj,grpsObj);
}


//================Dhivya Here:Process/Domains Loading============================
/**
 *  To load the drop down list for Process/Domains based on view point Id, LOB Id,Grp Id
 */
public final ActionForward processDomainList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
	HttpServletResponse response) throws Exception {		
                Debug.print("processDomainList method is calling...........");
                HLCBrahmaputraSessionRemote roleRemote  = initializeEJBs(request);
               String viewPntId = request.getParameter("viewPntId");
               String lobId = request.getParameter("lobId");
               String grpId = request.getParameter("grpId");
               Debug.print("processDomainList(): viewPntId..........."+viewPntId);
               Debug.print("processDomainList(): lobId..........."+lobId);
               Debug.print("processDomainList(): grpId..........."+grpId);
               
               Vector proDomObj = (Vector)roleRemote.getProcessDomain(viewPntId,lobId,grpId);
               
               Debug.print("processDomainList() procDom size..........."+proDomObj.size());
	return getXmlContent(request,response,proDomObj);
}

//================Dhivya Here:ArtifactExistsStatus============================
/**
*  To check the existence of the Mapped record
*/
public final ActionForward MappingDetExists(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
	 Debug.print("MappingDetExists method is calling...........");
     HLCBrahmaputraSessionRemote roleRemote  = initializeEJBs(request);
        
    
        
        String viewPntId = request.getParameter("viewPntId");
        String lobId = request.getParameter("lobId");
        String viewId = request.getParameter("viewId");
        String grpId = request.getParameter("grpId");
        String domProcId = request.getParameter("domProcId");
        String artifactId = request.getParameter("artifactId");
       
        boolean output = (boolean)roleRemote.artifactMapExists(viewPntId,lobId,viewId,grpId,domProcId,artifactId);
        
              
        String finalStr = String.valueOf(output);
        
        Debug.print("Final String is "+finalStr);
        
        PrintWriter out = response.getWriter();
        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");            
        
        out.println("<outValue>"+finalStr+"</outValue>");
        
        return null;
 }
    //=======================Dhivya Ends Here:=======================================    
        
       
//================Base Location Loading Block============================
/**
 *  To load the drop down list for Base Location based on Country
 */
public final ActionForward baseLocList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
	HttpServletResponse response) throws Exception {		
                Debug.print("baseLocList method is calling...........");
                HLCkaverystatelessRemote remote  = initializeKavEJBs(request);
               String cntId = request.getParameter("cId");
               Debug.print("cntList: cId..........."+cntId);
               Vector locsObj = (Vector)remote.selectLocBasedOnCId(cntId);
               
               Debug.print("baseLocList() locsObj size..........."+locsObj.size());
	return getXmlContent(request,response,locsObj);
}

//End

//================Base Location Loading Block============================
/**
*  To load the drop down list for Dept list based on LOB
*/
public final ActionForward depList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
	HttpServletResponse response) throws Exception {		
              Debug.print("depList method is calling...........");
              HLCkaverystatelessRemote remote  = initializeKavEJBs(request);
              String roleSpilt = request.getParameter("role");         
              String cntValue[] = roleSpilt.split("#");
              String roleGrade = cntValue[1];             
              String depIds="";
             String[] lobId = request.getParameterValues("lobId");
             String[] depId = request.getParameterValues("depId");
             String lobIds=displayAsString(lobId);
             Debug.print("depList: lobIds..........."+lobIds);
             if(depId!=null)
             {
              depIds=displayAsString(depId);
             }
             Debug.print("depList: depIds..........."+depIds);
             Vector depObj=new Vector();
             
             /*for (int i = 0; i < lobId.length; i++) {
                 Debug.print("depList checked records: " + lobId[i]);
             }*/
             if(lobId !=null && depId==null)
            		 {
            	  depObj = (Vector)remote.selectDeptSuperVisorBasedOnCId(lobIds, null,roleGrade);
            		 }
             else
             {
            	  depObj = (Vector)remote.selectDeptSuperVisorBasedOnCId(lobIds, depIds,roleGrade);
             }
            // Debug.print("depList: lobId..........."+lobId);
             
             
             Debug.print("depList() depObj size..........."+depObj.size());
	return getXmlContent(request,response,depObj);
}

//End


/**
//================Dhivya Here:Viewpoint Mappings Exists Status============================
/**
*  To check the existence of the Mapped record
*/
public final ActionForward mappingExist(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
		HttpServletResponse response) throws Exception {
	 Debug.print("MappingDetExists method is calling...........");
   HLCBrahmaputraSessionRemote roleRemote  = initializeEJBs(request);
      
  
      
      String viewPntId = request.getParameter("viewPntId");
      String lobId = request.getParameter("lobId");
      String viewId = request.getParameter("viewId");
      String grpId = request.getParameter("grpId");
      String domProcId = request.getParameter("domProcId");
     
     
      boolean output = (boolean)roleRemote.viewPointMapExists(viewPntId,lobId,viewId,grpId,domProcId);
      
            
      String finalStr = String.valueOf(output);
      
      Debug.print("Final String is "+finalStr);
      
      PrintWriter out = response.getWriter();
      
      response.setContentType("text/xml; charset=UTF-8");
      response.setHeader("Cache-Control", "no-cache");            
      
      out.println("<outValue>"+finalStr+"</outValue>");
      
      return null;
}







    //=======================Dhivya Ends Here:=======================================    
/**
 *  To load the drop down list for LOB  based on Country
 */
public final ActionForward callLobList(ActionMapping mapping, ActionForm form, HttpServletRequest request, 
	HttpServletResponse response) throws Exception {		
                Debug.print("callLobList method is calling...........");
                HLCkaverystatelessRemote remote  = initializeKavEJBs(request);
               String bId = request.getParameter("bId");
               String cId = request.getParameter("cId");
               Debug.print("callLobList: bId..........."+bId+"=====cId===="+cId);
               Vector lobsObj = (Vector)remote.selectLOBBasedOnCId(bId,cId);
               
               Debug.print("callLobList() lobsObj size..........."+lobsObj.size());
	return getXmlContent(request,response,lobsObj);
}

//End

         /**
          * Getting the EJB Remote object to access the bean
          */
        
        private HLCAdvertiseSessionRemote initializeEJB(HttpServletRequest request) throws Exception{  
            
                MessageResources mr=getResources(request);                
                String namingfactory=mr.getMessage("ejbclient.namingfactory");
                String contextfactory=mr.getMessage("ejbclient.contextfactory");
                String urlprovider=mr.getMessage("ejbclient.urlprovider");
                String lookupip=mr.getMessage("ejbclient.ip");
                String jndiname=mr.getMessage("jndi.advertise");

                System.setProperty(namingfactory,contextfactory);
                System.setProperty(urlprovider,lookupip);
                Context jndiContext = new InitialContext();
                Object objref = jndiContext.lookup(jndiname); 
                HLCAdvertiseSessionRemoteHome advHome = (HLCAdvertiseSessionRemoteHome)PortableRemoteObject
                        .narrow(objref,HLCAdvertiseSessionRemoteHome.class);
                HLCAdvertiseSessionRemote advRemote  = advHome.create();
                
              return advRemote;  
          
        }
        
 private HLCBrahmaputraSessionRemote initializeEJBs(HttpServletRequest request) throws Exception{  
            
            MessageResources mr=getResources(request);                
            String namingfactory=mr.getMessage("ejbclient.namingfactory");
            String contextfactory=mr.getMessage("ejbclient.contextfactory");
            String urlprovider=mr.getMessage("ejbclient.urlprovider");
            String lookupip=mr.getMessage("ejbclient.ip");
            String jndiname=mr.getMessage("jndi.rolemanagement");

            System.setProperty(namingfactory,contextfactory);
            System.setProperty(urlprovider,lookupip);
            Context jndiContext = new InitialContext();
            Object objref = jndiContext.lookup(jndiname); 
            HLCBrahmaputraSessionRemoteHome advHome = (HLCBrahmaputraSessionRemoteHome)PortableRemoteObject
                    .narrow(objref,HLCBrahmaputraSessionRemoteHome.class);
            HLCBrahmaputraSessionRemote roleRemote  = advHome.create();
            
          return roleRemote;  
      
    }
 
 //To access a Method which belongs to HLCkaverystatelessRemote
 private HLCkaverystatelessRemote initializeKavEJBs(HttpServletRequest request) throws Exception{  
     
     MessageResources mr=getResources(request);                
     String namingfactory=mr.getMessage("ejbclient.namingfactory");
     String contextfactory=mr.getMessage("ejbclient.contextfactory");
     String urlprovider=mr.getMessage("ejbclient.urlprovider");
     String lookupip=mr.getMessage("ejbclient.ip");
     String jndiname=mr.getMessage("jndi.usrreg");

     System.setProperty(namingfactory,contextfactory);
     System.setProperty(urlprovider,lookupip);
     Context jndiContext = new InitialContext();
     Object objref = jndiContext.lookup(jndiname); 
     
     HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome)
     javax.rmi.PortableRemoteObject.narrow(objref,HLCkaverystatelessRemoteHome.class);
     HLCkaverystatelessRemote remote = home.create();
   return remote;  

}
//End
        
    private ArrayList getDropDown(Vector mediaLists){
        
        ArrayList dropDwonLists = new ArrayList();
                  for (Iterator it = mediaLists.iterator(); it.hasNext();) {
                      String[] keyValue = (String[]) it.next();
                     dropDwonLists.add(new LabelValueBean(keyValue[1],keyValue[0]));                  
                  }    
       return dropDwonLists; 
     }   
     public String displayAsString(String[] value)
     {
    	/* StringBuffer stBuffer=new StringBuffer();
    	 int chkCount = 1;
         //Base Country List 
         for (int i = 0; i < value.length; i++) {
        	 if(chkCount<value.length)
        	 {
        		 stBuffer=stBuffer.append('\'').append(value[i]).append('\'').append(",");
        	
        	 }
        	 else
        	 {
        		 stBuffer = stBuffer.append('\'').append(value[i]).append('\'');
        	 }
        	 chkCount++;
        	 
         }
         return stBuffer.toString();*/
    	
    	 StringBuffer stBuffer=new StringBuffer();
    	 StringTokenizer stTok=new StringTokenizer(value[0].toString(),",");
    	 int chkCount = 1;
         while(stTok.hasMoreTokens()){
        	 if(chkCount<stTok.countTokens())
        	 {
        		Debug.print("Inside if loop");
        		 stBuffer=stBuffer.append('\'').append(stTok.nextToken().toString()).append('\'').append(",");
        	
        	 }
        	 else
        	 {
        		 Debug.print("Inside else loop");
        		 stBuffer = stBuffer.append('\'').append(stTok.nextToken().toString()).append('\'');
        	 }
        	 chkCount++;
         }
         return stBuffer.toString();
     }
     
   
    
}
//====================================THE END====================================================================================                   

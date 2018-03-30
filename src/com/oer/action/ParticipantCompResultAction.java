/*
 * ParticipantCompResultAction.java
 *
 * Created on November 29, 2007, 11:35 AM
 */

package com.oer.action;

import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCompResultVO;
import com.hlcutil.Debug;
import java.util.ArrayList;
import java.util.Iterator;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import java.util.Date;
import java.io.IOException;
import java.net.ProtocolException;
import java.text.*;
import java.util.regex.*;
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


	public class ParticipantCompResultAction implements Controller {
    
  
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
            HttpSession session=request.getSession();
            HLCKrishnaStatelessBean krishnaBean=new HLCKrishnaStatelessBean();
	    	
			HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			 
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            //String filePath=mr.getMessage("horseComp_uploadPath");
            HLCCompResultVO compVO= new HLCCompResultVO();
            if(cmd!=null){
                
           if(cmd.equals("initResultList")){
                Debug.print("cmd in ParticipantCompResultAction :"+cmd);
                return new ModelAndView("frmOERParticipantCompResList");         
           }
           else if(cmd.equals("eveTitleList")){               
                    Debug.print("cmd in ParticipantCompResultAction :"+cmd);
                    ArrayList myCompRegDetails=new ArrayList();
                    String year = request.getParameter("year");
                    Debug.print("year in Servlet:"+year);
                    int tempYear=Integer.parseInt(year);
                    Debug.print("tempYear in ParticipantCompRegListAction:"+tempYear);
                    Debug.print("year in ParticipantCompRegListAction.participantList :"+year);
                    String riderUserId=(String)session.getAttribute("userId");
                    myCompRegDetails=membQualBean.getMyEventTiles(tempYear,riderUserId);
                     String tempEveTypName="";
                     String tempeventId="";
                       
                    request.setAttribute("year",year);
                    request.setAttribute("tempeventId",tempeventId);
                    request.setAttribute("myCompRegDetails",myCompRegDetails);
                    return new ModelAndView("frmOERParticipantCompResList");               
           }
           else if(cmd.equals("resultList")){
               Debug.print("cmd in ParticipantCompResultAction :"+cmd);
                    String year = request.getParameter("year");
                    Debug.print("year in Servlet:"+year);
                    int tempYear=Integer.parseInt(year);
                    Debug.print("tempYear in ParticipantCompRegListAction:"+tempYear);
                    Debug.print("year in ParticipantCompRegListAction.resultList :"+year);
                    String tempeventId=request.getParameter("selTitle"); 
                    Debug.print("tempeventId in ParticipantCompRegListAction.resultList :"+tempeventId);
                    String riderUserId=(String)session.getAttribute("userId");   
                                     
                    ArrayList myCompRegDetails=new ArrayList();
                    ArrayList eventcompResList=new ArrayList();                                
                    myCompRegDetails=membQualBean.getMyEventTiles(tempYear,riderUserId);                                                       
                    eventcompResList=membQualBean.getMyCompResultList(riderUserId,tempeventId,tempYear);
                    Debug.print("list in ParticipantCompResultAction.resultList :"+eventcompResList);
                    
                    request.setAttribute("myCompRegDetails",myCompRegDetails);
                    request.setAttribute("year",year);
                    request.setAttribute("tempeventId",tempeventId);                  
                    request.setAttribute("eventcompResList",eventcompResList);
                    return new ModelAndView("frmOERParticipantCompResList");   
           } 
           
           else if(cmd!=null && cmd.equalsIgnoreCase("myCompResultView")){
                    Debug.print("ParticipantCompRegListAction calling Process:myCompRegView...."); 
                     HLCCompResultVO objRegVO= new HLCCompResultVO();
                    String compResultId = request.getParameter("compResultId");
                    Debug.print("compResultId in ParticipantCompResultAction :"+compResultId);
                    
                    if(compResultId!=null && compResultId.trim().length()!=0){
                        objRegVO = membQualBean.getMyCompResultView(compResultId);
                        Debug.print("objRegVO in ParticipantCompResultAction :"+objRegVO);
                    }
                    request.setAttribute("objRegVO",objRegVO);
                    return new ModelAndView("frmOERParticipantCompResView");
                }
     
            }
       }catch(Exception e){           
           Debug.print("Exception in ParticipantCompResultAction: "+e);           
       }
       return null;
    }
}

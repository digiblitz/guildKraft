/*
 * OfficialsDetAction.java
 *
 * Created on December 20, 2006, 1:01 PM
 */

package com.mee.action.master;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

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
/**
 *
 * @author hari
 * @version
 */


	public class OfficialsDetAction implements Controller {
	    
   private final static String SUCCESS = "success";
    
   
   
   public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
    

	   HLCVaigaiSessionBean vaigaiBean =new HLCVaigaiSessionBean();

            String offProcess= (String) request.getParameter("offProcess");
            Debug.print("Process in Servlet "+offProcess);
        
            if(offProcess.equals("add")){
                Debug.print("Inside Add Of Official Details");
                return new ModelAndView("frmOfficialsDetCreate");
            }
            if(offProcess.equals("create")){   
                Debug.print("Inside Create Process.");
                try{
                    String judgeTypeName = request.getParameter("judgeName");
                    Debug.print("Judge Name:"+judgeTypeName);
                
                    boolean result = vaigaiBean.insertOficial(judgeTypeName);
                    if(result==true){
                        return new ModelAndView("frmOfficialsDetConf"); 
                    }
                    else {   
                        request.setAttribute("err","st");
                        return new ModelAndView("frmOfficialsDetCreate");
                    }
                }
                catch(Exception e){
                    System.out.println("Exception while adding Judge Name" + e);
                }
            }
            if(offProcess.equals("list")){
                Debug.print("Inside List Of Divisions Details");
                boolean result = false;
                String status = (String)request.getParameter("status");
                Debug.print("status:"+status);
                if(status.equals("activate")){
                    result =true;
                Vector allTypesVect = new Vector();
                allTypesVect = vaigaiBean.displayAllJudgetype(result);
                request.setAttribute("status",status);
                request.setAttribute("DispOfficialDet",allTypesVect);
                return new ModelAndView("frmOfficialsDetList");
                }
                if(status.equals("deactivate")){
                    result =false;
                Vector allTypesVect = new Vector();
                allTypesVect = vaigaiBean.displayAllJudgetype(result);
                request.setAttribute("status",status);
                request.setAttribute("DispOfficialDet",allTypesVect);
                return new ModelAndView("frmOfficialsDetList");
                }
                else{
                    request.setAttribute("err","st");
                    return new ModelAndView("frmOfficialsDetList");
                }
            }
            if(offProcess.equals("Edit")){
                Debug.print("\n Inside Edit Divisions Details\n");
                String judgetypeId = request.getParameter("judgetypeId");
                String judgeName = request.getParameter("judgeTypeName");
                request.setAttribute("judgeType",judgetypeId);
                request.setAttribute("judgeName",judgeName);
                Debug.print("judge Id:"+judgetypeId);
                Debug.print("judge Name:"+judgeName);
                return new ModelAndView("frmOfficialsDetEdit");
            }
            if(offProcess.equals("confirmEdit")){
                Debug.print("\n Inside Confirmation Edit Divisions Details\n");
                String judgetypeId = request.getParameter("judgetypeId");
                Debug.print("judge Id:"+judgetypeId);
                String judgeName = request.getParameter("judgeTypeName");
                Debug.print("judge Name:"+judgeName);
                boolean result = vaigaiBean.updateOfficial(judgeName,judgetypeId);
                Debug.print("after result");
                if(result==true){
                    Debug.print("inside result");
                    return new ModelAndView("frmOfficialsUpdateConf");
                }
                else {
                    request.setAttribute("err","st");
                    request.setAttribute("judgeType",judgetypeId);
                    request.setAttribute("judgeName",judgeName);
                    return new ModelAndView("frmOfficialsDetEdit");
                }
            }
            if(offProcess.equals("Deactivate")){
                Debug.print("\n Inside Edit Divisions Details\n");
                String judgetypeId = request.getParameter("judgetypeId");
                String judgeName = request.getParameter("judgeTypeName");
                request.setAttribute("judgeType",judgetypeId);
                request.setAttribute("judgeName",judgeName);
                Debug.print("judge Id:"+judgetypeId);
                Debug.print("judge Name:"+judgeName);
                return new ModelAndView("frmOfficialsDetDelete");
            }
            if(offProcess.equals("Activate")){
                Debug.print("\n Inside Edit Divisions Details\n");
                String judgetypeId = request.getParameter("judgetypeId");
                String judgeName = request.getParameter("judgeTypeName");
                request.setAttribute("judgeType",judgetypeId);
                request.setAttribute("judgeName",judgeName);
                Debug.print("judge Id:"+judgetypeId);
                Debug.print("judge Name:"+judgeName);
                return new ModelAndView("frmOfficialsDetActivate");
            }
            if(offProcess.equals("conDeactivateOfficial")){
                String judgetypeId = request.getParameter("judgetypeId");
                String judgeName = request.getParameter("judgeTypeName");
                boolean result = vaigaiBean.deleteOfficial(judgetypeId);
                if(result==true){
                    return new ModelAndView("frmOfficialsUpdateConf");
                }
            }
            if(offProcess.equals("conActivateOfficial")){
                String judgetypeId = request.getParameter("judgetypeId");
                String judgeName = request.getParameter("judgeTypeName");
                boolean result = vaigaiBean.activateJudgeType(judgetypeId);
                if(result==true){
                    return new ModelAndView("frmOfficialsUpdateConf");
                }       
            }
            return null;
        }

    private Context getInitialContext() {
        return null;
    }
}

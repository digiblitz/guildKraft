/*
 * ActionRefundRuleOne.java
 *
 * Created on December 23, 2006, 2:04 PM
 */

package com.mee.action.master;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
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
 * @author Ganapathy
 * @version
 */

	public class ActionRefundRuleOne implements Controller {
    
    /* forward name="success" path="" */
    private final static String SUCCESS = "success";
    
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
                 *      Process flow directed to insert Refund Rule Level One details JSP page
                 */                  
                 if(process.equals("add")){
                	 return new ModelAndView("frmMeeRefundLeveOneCreate");
                 }
                  if(process.equals("insert")){
                    try{
                        Debug.print("\n Inside Refund Rule Adding...\n"); 
                        String refundName=request.getParameter("refundName");
                        boolean bol=false;
                        Debug.print("      refundName:"+refundName);
                        if(refundName!=null && refundName.trim().length()!=0){
                            refundName = refundName.trim();
                            bol = vaigaiBean.insertRefundRuleMaster(refundName);
                        }
                        Debug.print("Boolean bol="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Inserted : "+bol);
                            return new ModelAndView("frmRefundTypeConfirmation");          
                        }
                        else {   
                            request.setAttribute("err","st");
                            return new ModelAndView("frmMeeRefundLeveOneCreate");
                        }
                     }
                    catch (Exception e){
                        Debug.print(" Error : "+e.getMessage());
                    }
                  }
                 /*  Delete 
                 *
                 *      Process flow directed to delete Refund Rule Level One details JSP page
                 */  
                  
                  else if(process.equals("deactivate")){
                    try{
                        Debug.print("\n Inside Refund Rule deactivating...\n"); 
                        String refundId=request.getParameter("refundId");
                        System.out.println("refundId ="+refundId);
                        boolean bol = vaigaiBean.deleteRefundRuleMaster(refundId);
                         System.out.println("bol ="+bol);
                        if (bol == true){
                            Debug.print(" Succeffully Deactivated : "+bol);
                            return new ModelAndView("frmRefundTypeUpdation");                        
                        }
                        else {
                          request.setAttribute("err","st");
                          return new ModelAndView("frmMeeRefunfLevelOneDelete");
                        }
                   }
                    catch(Exception e){
                        Debug.print("Error: "+e.getMessage());                      
                    }
                  }
                 /*  Update 
                 *
                 *      Process flow directed to delete Refund Rule Level One details JSP page
                 */  
                  
                   else if(process.equals("update")){
                        try{
                            Debug.print("\n Inside Refund Rule Updating...\n"); 
                            String refundId=request.getParameter("refundId");
                            String refundName=request.getParameter("refundName");
                            boolean bol = vaigaiBean.updateRefundRuleMaster(refundName,refundId);
                            if (bol == true){
                                Debug.print(" Succeffully Updated : "+bol);
                                return new ModelAndView("frmRefundTypeUpdation");                        
                            }
                            else {
                              request.setAttribute("err","st");
                              String[] s=new String[4];
                                Vector vObja = (Vector)vaigaiBean.displayRefundRule(refundId);
                                 Enumeration e = vObja.elements();
                                if(e.hasMoreElements()){
                                     s = (String [])e.nextElement();   }
                               request.setAttribute("refundDetail",s);
                              return new ModelAndView("frmMeeRefunfLevelOneEdit");
                            }
                   }
                            catch (Exception e){
                                Debug.print(" Error : "+e.getMessage());
                            }
                  }
                   else if(process.equals("view")){
                        try{                                                      
                        String refundId=request.getParameter("refundId");
                        String refundStatus = request.getParameter("btnSubmit");
                                String[] s=new String[4];
                                Vector vObja = (Vector)vaigaiBean.displayRefundRule(refundId);
                                Enumeration e = vObja.elements();
                                if(e.hasMoreElements()){
                                     s = (String [])e.nextElement();                                    
                                    System.out.println("Hello Test123");
                                    System.out.println(""+s[0]+":"+s[1]+":"+s[2]+":"+s[3]);                           
                                }
                                    request.setAttribute("refundDetail",s);
                                   
                        if(refundStatus.equals("Activate")){
                           return new ModelAndView("frmMeeRefunfLevelOneActivate"); 
                        }
                        else if(refundStatus.equals("Edit")){
                           return new ModelAndView("frmMeeRefunfLevelOneEdit");
                        }
                        else if(refundStatus.equals("Deactivate")){
                           return new ModelAndView("frmMeeRefunfLevelOneDelete");
                        }
                        }
                        catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
                   else if(process.equals("list")){
                        try{
                            Debug.print("\n Inside Refund Rules List all ....\n");
                            boolean result = false;
                            String refundstatus = (String)request.getParameter("status");
                            if(refundstatus.equals("activate")){
                               result =true;
                               Vector vObj = (Vector)vaigaiBean.displayAllRefundRule(result);
                               request.setAttribute("status",refundstatus);
                                request.setAttribute("RefundAllList",vObj);
                                return new ModelAndView("frmMeeRefundLevelOneList");
                            }
                            if(refundstatus.equals("deactivate")){
                               result =false;
                               Vector vObj = (Vector)vaigaiBean.displayAllRefundRule(result);
                               request.setAttribute("status",refundstatus);
                                request.setAttribute("RefundAllList",vObj);
                                return new ModelAndView("frmMeeRefundLevelOneList");
                            }
                            else {
                              request.setAttribute("err","st");
                             return new ModelAndView("frmMeeRefundLevelOneList");
                            }
                           }
                            catch(Exception e){
                            Debug.print("Error: "+e.getMessage());
                        }
                   }
            
                    
                                   
                         
                       
                   else if(process.equals("activate")){
                        try{
                            Debug.print("\n Inside Refund Rules Activate  ....\n");
                            String refundId=request.getParameter("refundId");
                            boolean bol = vaigaiBean.activateRefundRuleType(refundId);
                            if (bol == true){
                                Debug.print(" Succeffully Activated : "+bol);
                                return new ModelAndView("frmRefundTypeUpdation");                        
                            }
                            else {
                              request.setAttribute("err","st");
                              return new ModelAndView("frmMeeRefunfLevelOneActivate");
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

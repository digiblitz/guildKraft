/*
 * ParticipantCompRegListAction.java
 *
 * Created on November 26, 2007, 4:09 PM
 */

package com.oem.action;

import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixBean;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemote;
import com.hlcsessionbean.qualificationmatrix.HLCMembershipQualificationMatrixRemoteHome;
import com.hlcutil.HLCCompRegistrationVO;
import com.hlcutil.Debug;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
 * @author Dhivya
 * @version
 */


	public class ParticipantCompRegListAction implements Controller {
    
    
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
            HLCMembershipQualificationMatrixBean membQualBean=new HLCMembershipQualificationMatrixBean();
			
            String cmd = request.getParameter("cmd");
            Debug.print("cmd function:" + cmd);
            String filePath="C:/horse_comp_result_excel";
            
            if(cmd!=null){
                if(cmd.equals("initPartiList")){
                    //String compYear="";
                    Debug.print("cmd in ParticipantCompRegListAction :"+cmd);
                    //request.setAttribute("compYear",compYear);
                    return new ModelAndView("frmOEMParticipantList");
                }
                if(cmd.equals("partList")){
                    Debug.print("cmd in ParticipantCompRegListAction :"+cmd);
                    ArrayList myCompRegDetails=new ArrayList();
                    String year = request.getParameter("year");
                    Debug.print("year in Servlet:"+year);
                    int tempYear=Integer.parseInt(year);
                    Debug.print("tempYear in ParticipantCompRegListAction:"+tempYear);
                    Debug.print("year in ParticipantCompRegListAction.participantList :"+tempYear);
                    String nonMembId=(String)session.getAttribute("userId");
                    myCompRegDetails=membQualBean.getMyCompRegList(tempYear,nonMembId);
                    request.setAttribute("year",year);
                    request.setAttribute("myCompRegDetails",myCompRegDetails);
                    return new ModelAndView("frmOEMParticipantList");
                } else if(cmd!=null && cmd.equalsIgnoreCase("myCompRegView")){
                    Debug.print("ParticipantCompRegListAction calling Process:myCompRegView....");
                    HLCCompRegistrationVO objRegVO = new HLCCompRegistrationVO();
                    String registrationId = request.getParameter("registrationId");
                    Debug.print("registrationId in OrgCompRegListAction :"+registrationId);
                    
                    if(registrationId!=null && registrationId.trim().length()!=0){
                        objRegVO = membQualBean.getMySingleCompRegDetails(registrationId);
                    }
                    request.setAttribute("singleCompRegDetails",objRegVO);
                    return new ModelAndView("frmOEMParticipantView");
                }
                
                else if(cmd.equals("uplView")){
                    String filePath1 = request.getParameter("fPath");
                    Debug.print("filePath1" + filePath1);
                     int lastIndex = filePath1.lastIndexOf("\\") ;
                    String url ="";
                    if(lastIndex!=-1){
                        url = filePath1.substring(lastIndex+1,filePath1.length());
                        Debug.print("url in servlet" + url);
                    }
                    String type = filePath1.substring(filePath1.lastIndexOf(".")+1,filePath1.length());
                    Debug.print("type" + type);                 
                    String dirPath = filePath;//get it from the configuration
                    String tempPath = dirPath + "/"+ url;
                    Debug.print("tempPath" + tempPath);
                    File file = new File(tempPath);
                    Debug.print("file" + file);
                    outputImage(file,filePath1,response);
                    return null;
                }
                
            }
        }catch(Exception e){
            Debug.print("Exception in ParticipantCompRegListAction "+e);
        }
        return null;
        
    }
    public void outputImage(File thumbfile, String filePath1, HttpServletResponse response) throws FileNotFoundException, IOException {
        if (thumbfile == null) {
            Debug.print("Extra path info was null; should be a resource to view");
        }
        
        //response.reset();
        //response.setContentType("text/plain");
        response.setContentType("application/octet-stream");
        //response.setContentType("application/" + type);
        response.setHeader("Content-Disposition", "attachment;filename=\"" + filePath1 + "\"");
        //response.setHeader("Content-Disposition","attachment; filename=\"" + thumbfile + "\"");
        
        OutputStream os = response.getOutputStream();
        FileInputStream fin = new FileInputStream(thumbfile);
        byte[] buf = new byte[4096];
        int count = 0;
        while(true) {
            //  byte[] buf = new byte[4 * 1024]; // 4K buffer
            // int bytesRead;
            // while ((bytesRead = in.read(buf)) != -1) {
            //out.write(buf, 0, bytesRead);
            
            int n = fin.read(buf);
            if(n == -1) {
                break;
            }
            count = count + n;
            os.write(buf,0,n);
        }
        os.flush();
        os.close();
        fin.close();
    }
    
}

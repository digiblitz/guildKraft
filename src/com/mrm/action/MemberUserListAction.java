/*
 * MemberUserListAction.java
 *
 * Created on September 11, 2006, 6:20 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mrm.action;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessBean;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemote;
import com.hlcHorse.Form.Display.HLCkaverySessionBeanStatlessRemoteHome;
import com.hlchorse.form.util.Debug;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionBean;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemote;
import com.hlcmember.type.stateless.HLCKaveryMembershipTypeSessionRemoteHome;

import java.io.IOException;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.Context;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import java.util.regex.*;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.hlchorse.form.util.HLCUserRegVO;
import com.hlchorse.form.display.*;
/**
 *
 * @author harmohan
 */
public class MemberUserListAction implements Controller {
    
    Vector vObj = new Vector();
    
   
        
        
    	public ModelAndView handleRequest(HttpServletRequest request,
    			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
    			IOException, ParserConfigurationException, SAXException {
       
      try {

              HLCKaverySessionStatefulBean remote = new HLCKaverySessionStatefulBean();
            
              HLCKaveryMembershipTypeSessionBean memberRemote = new HLCKaveryMembershipTypeSessionBean();
              
            HLCUserRegVO userregvo=new HLCUserRegVO();
            Vector vObj = new Vector();
            Vector nobj = new Vector();
            String memProcess = request.getParameter("memProcess");
          //  String memProcess1 = request.getParameter("memProcess1");
            Debug.print("MemeberShip Name In Servlet:" + memProcess);
             nobj = memberRemote.displayUserTypeDetails();
            Debug.print("Size:" + nobj.size());
            request.setAttribute("userTypeVect",nobj);
              
             // Debug.print("userTypeVect" + userTypeVect);
              if(memProcess==null){
                Debug.print(" memProcess is null ");
                                
                String userTypeId = remote.getHumanUserTypeId(); //request.getParameter("selMemTypeId");
                
                int rCnt =0;
                int pNo =1;
                String pageNo = request.getParameter("pn");

                if(pageNo!=null){
                    pNo = Integer.parseInt(pageNo);
                }
                Debug.print("Page NO :"+pNo);
                if(userTypeId!=null && userTypeId.trim().length()>0) {
                    Debug.print("memberId:" + userTypeId);
                    rCnt = remote.userRowCount(userTypeId);
                    vObj = (Vector) remote.displayMemberUserList(userTypeId,pNo);
                    request.setAttribute("dispStr",vObj);
                    request.setAttribute("userTypeId",userTypeId);
                    request.setAttribute("rCnt", String.valueOf(rCnt));
                    request.setAttribute("pNo", String.valueOf(pNo));
                }
                
               // return mapping.findForward("displayMemberUserList");
                return new ModelAndView("membership-user-list");
              }
              else if(memProcess!=null && memProcess.trim().equalsIgnoreCase("uList")){
                String userTypeId = remote.getHumanUserTypeId();//request.getParameter("selMemTypeId");
                int rCnt =0;
                int pNo =1;
                String pageNo = request.getParameter("pn");

                if(pageNo!=null){
                    pNo = Integer.parseInt(pageNo);
                }
                Debug.print("Page NO :"+pNo);
                if(userTypeId!=null && userTypeId.trim().length()>0) {
                    Debug.print("memberId:" + userTypeId);
                    rCnt = remote.userRowCount(userTypeId);
                    vObj = (Vector) remote.displayMemberUserList(userTypeId,pNo);
                    request.setAttribute("dispStr",vObj);
                    request.setAttribute("userTypeId",userTypeId);
                    request.setAttribute("rCnt", String.valueOf(rCnt));
                    request.setAttribute("pNo", String.valueOf(pNo));
                } 
                return new ModelAndView("membership-user-list");
              }
              else if(memProcess!=null && memProcess.equals("updateStatus")){
                    String userId = request.getParameter("userId");
                    System.out.println("USER ID : "+userId);
                    //For Debug Starts
                    //String activeStat = "False";
                    String activeStat = request.getParameter("activeStatus");
                    //For Debug Ends
		    //public boolean editActiveStatus(String activeStat, String userId) throws RemoteException
                    boolean bol1 = remote.editActiveStatus(activeStat, userId);
                    System.out.println("Status is : "+bol1);

                    String userTypeId = remote.getHumanUserTypeId(); //request.getParameter("selMemTypeId");
                    
                    int rCnt =0;
                    int pNo =1;
                    String pageNo = request.getParameter("pn");
                    
                    if(pageNo!=null){
                        pNo = Integer.parseInt(pageNo);
                    }
                    Debug.print("Page NO :"+pNo);
                    if(userTypeId!=null && userTypeId.trim().length()>0) {
                        Debug.print("memberId:" + userTypeId);
                        rCnt = remote.userRowCount(userTypeId);
                        vObj = (Vector) remote.displayMemberUserList(userTypeId,pNo);
                        request.setAttribute("dispStr",vObj);
                        request.setAttribute("userTypeId",userTypeId);
                        request.setAttribute("rCnt", String.valueOf(rCnt));
                        request.setAttribute("pNo", String.valueOf(pNo));
                    }
                    
                    return new ModelAndView("membership-user-list");
             }
             else if(memProcess!=null && memProcess.equals("viewMember")){
                String userId = request.getParameter("userId");
                System.out.println("userId In Servlet : "+userId);

                userregvo = (HLCUserRegVO)remote.displayUserRegistrationFormOnUserId(userId);
                Debug.print("Vector element in Servlet : "+vObj);
                request.setAttribute("viewMember",userregvo);
                //String activeStat = "False";
                //public boolean editActiveStatus(String activeStat, String userId) throws RemoteException
               // boolean bol1 = remote.editActiveStatus(activeStat, userId);
               // System.out.println("Status is : "+bol1);

                HLCkaverySessionBeanStatlessBean remote3 = new HLCkaverySessionBeanStatlessBean();

                Debug.print("userregvo.getUserId() :"+userregvo.getUserId());

                ArrayList donSelect=new ArrayList();
                donSelect=remote3.getMemberDonationDetails(userregvo.getUserId());
                request.setAttribute("donSelect",donSelect);

                return new ModelAndView("membership-user-detail");
            }
            }
        catch(Exception e){
                /* this will most likely be because the customer already exists in the database. */
       // System.out.print("Client Exception :" + e);
            e.printStackTrace();
        }
      return new ModelAndView("membership-user-list");
   }
   
   public static Context getInitialContext()
        throws javax.naming.NamingException {
        Properties p =new Properties();
        p.setProperty( "java.naming.factory.initial", "org.jnp.interfaces.NamingContextFactory" );
        p.setProperty( "java.naming.factory.url.pkgs", "org.jboss.naming:org.jnp.interfaces" );
        p.setProperty( "java.naming.provider.url", "localhost:11199" );
        return new javax.naming.InitialContext(p);
    }
    
}

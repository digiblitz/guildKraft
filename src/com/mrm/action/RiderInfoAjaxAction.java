/*
 * RiderInfoAjaxAction.java
 *
 * Created on September 2, 2006, 10:44 AM
 */

package com.mrm.action;

import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlchorse.form.display.HLCKaverySessionStatefulBean;
import com.hlchorse.form.display.HLCKaverySessionStatefulRemote;
import com.hlchorse.form.display.HLCKaverySessionStatefulRemoteHome;
import com.hlcreg.util.Debug;
import java.io.*;
import java.net.ProtocolException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;

/**
 *
 * @author karthikeyan
 * @version
 */

public class RiderInfoAjaxAction implements Controller{
   
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
      //set the content type 
        response.setContentType("text/xml"); 
         
        response.setHeader("Cache-Control", "no-cache"); 
        
         
         
        //get the PrintWriter object to write the html page 
        PrintWriter writer = response.getWriter(); 
         
       /* //get parameters store into the hashmap 
        HashMap paramsMap = new HashMap(); 
        Enumeration paramEnum = request.getParameterNames(); 
        while(paramEnum.hasMoreElements()) 
        { 
            String paramName = (String)(paramEnum.nextElement()); 
            paramsMap.put(paramName, request.getParameter(paramName)); 
        } 
        //get the author name passed 
        String rid= (String)paramsMap.get("rid"); */
        
         try {   
                                      
                    
                     HLCKaverySessionStatefulBean remote =new HLCKaverySessionStatefulBean();
                     
                     HLCkaverystatelessBean usrremote =new  HLCkaverystatelessBean();
                     
                     String names="";
                     String eid=null;
                     String mid=null;
                     String hid=null;
                     
                     Enumeration en=request.getParameterNames();
                     while(en.hasMoreElements())
                     {
                     names=en.nextElement().toString();
                     System.out.println(" queries :" +names);
                     }
                     
                     if(names.equals("rid"))
                     {
                         
                     Vector RidDetVect=new Vector();
                     String rid=null;
                     rid= request.getParameter("rid"); 
                     System.out.println("value of rid :" +rid);
                     String val=null;
                     String[] rdet=null;
                     
                     
                     if(rid!=null&&!(rid.equals("")))
                     {
                     RidDetVect=remote.getRiderDetails(rid);
                     
                     rdet=(String[]) RidDetVect.elementAt(0);
                                                     
                     System.out.println("Servlet Called.........");
                     System.out.println("size :" +rdet.length);
                     
                     val=rdet[0]+"#"+rdet[1]+"#"+rdet[2]+"#"+rdet[3]+"#"+rdet[4]+"#"+rdet[5]+"#"+rdet[6]+"#"+rdet[7]+"#"+rdet[8]+"#"+rdet[9]+"#"+rdet[10]+"#"+rdet[11]+"#"+rdet[12]+"#"+rdet[14]+"#"+rdet[15]; 
                     
                     }
                                                             
                     //get the author profile by quering the AuthorsBean by passing author name 
                     
                      writer.println("<salutation>"+ val + "</salutation>"); 
                     }
                     
                     if(names.equals("prid"))
                     {
                     String prid=null;
                     String[] prdet=null;
                     String prval=null;
                     prid= request.getParameter("prid");
                     
                     if(prid!=null&&!(prid.equals("")))
                     {
                      
                     Vector PridNamVect=new Vector();
                     PridNamVect=remote.getRiderDetails(prid);
                     
                     prdet=(String[]) PridNamVect.elementAt(0);
                                                     
                     System.out.println("Servlet Called.........");
                      prval=prdet[0]+"#"+prdet[1]+"#"+prdet[2]+"#"+prdet[3]+"#"+prdet[4]+"#"+prdet[5];
                    // prval=prdet[1]+"#"+prdet[2]+"#"+prdet[3]; 
                     }                  
                     //get the author profile by quering the AuthorsBean by passing author name 
                     
                      writer.println("<prname><![CDATA[" + prval + "]]></prname>"); 
                     }
                     
                     if(names.equals("arid"))
                     {
                     String arid=null;
                     String[] ardet=null;
                     String arval=null;
                     arid= request.getParameter("arid"); 
                     
                     if(arid!=null&&!(arid.equals("")))
                     {
                     Vector AridNamVect=new Vector();
                     AridNamVect=remote.getRiderDetails(arid);
                     
                     ardet=(String[]) AridNamVect.elementAt(0);
                                                     
                     System.out.println("Servlet Called.........");
                     arval=ardet[1]+"#"+ardet[2]+"#"+ardet[3]; 
                     }                   
                     //get the author profile by quering the AuthorsBean by passing author name 
                     
                      writer.println("<arname><![CDATA[" + arval + "]]></arname>"); 
                     }
                     
                     if(names.equals("oid"))
                     {
                      
                     String oid=null;
                     String[] odet=null;
                     String oval=null;
                     oid= request.getParameter("oid"); 
                     
                     if(oid!=null&&!(oid.equals("")))
                     {
                     Vector oDetVect=new Vector();
                     oDetVect=remote.getOwnerDetails(oid);
                     
                     odet=(String[]) oDetVect.elementAt(0);
                                                     
                     System.out.println("Servlet Called.........");
                     oval=odet[0]+"#"+odet[1]+"#"+odet[2]+"#"+odet[3]+"#"+odet[5]+"#"+odet[6]+"#"+odet[7]+"#"+odet[8]+"#"+odet[9]+"#"+odet[10]+"#"+odet[11]+"#"+odet[12]; 
                     Debug.print("remote.getOwnerDetails(oid) :"+oval);
                     
                     }                  
                     //get the author profile by quering the AuthorsBean by passing author name 
                     
                      writer.println("<oname>"+ oval + "</oname>"); 
                     }
                     
                     // Email 
                     
                     if(names.equals("userName"))
                     {
                        eid= request.getParameter("userName"); 
                        String stat=null;
                        System.out.println("ajax servlet :"+eid);
                        
                        if(eid!=null&&!(eid.equals("")))
                        {
                        Vector usrtyp=new Vector();
                        //usrtyp=usrremote.getUserIdByEmailId(eid);
                        usrtyp=usrremote.getUserIdByLoginName(eid);
                                              
                        System.out.println("size :"+usrtyp.size());
                        stat=(String)usrtyp.elementAt(0);
                        System.out.println("Servlet Called.........");
                        System.out.println("User Name Existance :"+stat);
                        
                        }
                      //get the email esisting or not status and respond 
                     
                      writer.println("<email><![CDATA[" + stat + "]]></email>"); 

                     }
                     
                     // Validate Member id existance
                     
                     if(names.equals("memberid"))
                     {
                         
                        mid= request.getParameter("memberid"); 
                       
                        System.out.println("ajax servlet :"+mid);
                        boolean membstatus=false;
                        
                        if(mid!=null&&!(mid.equals("")))
                        {
                            
                              System.out.println("Servlet Called for validating member id existance .........");
                              membstatus=usrremote.isMemberIdExist(mid);
                              System.out.println("member id existance status :" +membstatus);
                        }
                        
                         //get the member id existing or not status and respond 
                     
                      writer.println("<memberstatus><![CDATA[" + membstatus + "]]></memberstatus>"); 
                      
                     }
                     
                      if(names.equals("horseDetail"))
                     {
                         
                        hid= request.getParameter("horseName"); 
                       
                        System.out.println("ajax servlet :"+hid);
                        boolean horsestatus=false;
                        
                        if(mid!=null&&!(mid.equals("")))
                        {
                            
                              System.out.println("Servlet Called for validating member id existance .........");
                              horsestatus=usrremote.isMemberIdExist(mid);
                              System.out.println("member id existance status :" +horsestatus);
                        }
                        
                         //get the member id existing or not status and respond 
                     
                      writer.println("<horsestatus><![CDATA[" + horsestatus + "]]></horsestatus>"); 
                      
                     }
                     
                     /*
                      * Member Existance Based on User Name 
                      */
                     
                      if(names.equals("userMember"))
                     {
                        String userName= request.getParameter("userMember"); 
                        String stat=null;
                        boolean existance=false;
                        
                        System.out.println("ajax servlet userName passed :"+userName);
                        
                        if(userName!=null&&!(userName.equals("")))
                        {
                        Vector usrtyp=new Vector();
                        //usrtyp=usrremote.getUserIdByEmailId(eid);
                        usrtyp=usrremote.getUserIdByLoginName(userName);
                                             
                        System.out.println("usrremote.getUserIdByLoginName(userName) size :"+usrtyp.size());
                        stat=(String)usrtyp.elementAt(0);
                        System.out.println("Servlet Called.........");
                        System.out.println("User ID :"+stat);
                        
                        existance=usrremote.isMemberExist(stat);
                        Debug.print("userMember existance Status :"+existance); 
                        
                        }
                      //get the email esisting or not status and respond 
                     
                      writer.println("<existance><![CDATA[" + existance + "]]></existance>"); 

                     }
                     
                      //close the write 
                      writer.close();              
                     
            }
        
         catch(Exception e)
         {
             System.out.println(e);
         }
        return null;
    }
}

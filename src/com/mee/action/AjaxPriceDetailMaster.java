/*
 * AjaxPriceDetailMaster.java
 *
 * Created on September 22, 2006, 11:10 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */
package com.mee.action;

import com.hlcform.stateless.HLCkaverystatelessRemote;
import com.hlcform.stateless.HLCkaverystatelessRemoteHome;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.hlcmeeting.util.Debug;
import com.util.OptionsBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.*;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForward;
import org.apache.struts.actions.DispatchAction;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;

import java.io.*;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import java.util.*;

/**
 *
 * @author harmohan
 */
public class AjaxPriceDetailMaster extends DispatchAction {

    private HLCVaigaiSessionRemote activityRemote = null;

    /**
     *  To load the drop down list for media type and dimension type   
     */
    public final ActionForward mediaDimType(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Debug.print("mediaDimType method is calling...........");
        HLCVaigaiSessionRemote activityRemote = initializeEJB(request);
        HLCkaverystatelessRemote activityRemote1 = initializeKaveryEJB(request);

        Vector nobj = (Vector) activityRemote.displayEventRegistrationTypeMaster();
        Debug.print("DisplayActivityCatgory Details arel" + nobj);
        request.setAttribute("meeCataTypeVect", nobj);

        Vector vObj = (Vector) activityRemote1.displayMemberType();

        Debug.print("DisplayUserDetails arel" + vObj);
        request.setAttribute("userTypeVec", vObj);

        return mapping.findForward("ajaxPriceDetailMaster");
    }

    /**
     *  To load the drop down list for display type against mediatype
     */
    public final ActionForward advType(ActionMapping mapping, ActionForm form, HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        Debug.print("advType method is calling...........");
        HLCVaigaiSessionRemote activityRemote = initializeEJB(request);
        String meeCatagoryTypeId = request.getParameter("meeCatagoryTyp");

        Debug.print("Activity Id : " + meeCatagoryTypeId);

        Vector specificationType = (Vector) activityRemote.displaySpecification1();
        return getXmlContent(request, response, specificationType);
    }

    /**
     *  return the xml content for the given drop down
     */
    public final ActionForward getXmlContent(HttpServletRequest request, HttpServletResponse response, Vector vec) throws Exception {
        String xml = null;
        try {
            xml = new OptionsBuilder().getContent(vec);
            Debug.print("XmlContent = " + xml);
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
     * Getting the EJB Remote object to access the bean
     */
    private HLCVaigaiSessionRemote initializeEJB(HttpServletRequest request) throws Exception {

        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        //String jndiname=mr.getMessage("jndi.advertise");

        String jndiname = "ejb/HLCVaigaiSessionJNDI";

        System.setProperty(namingfactory, contextfactory);
        System.setProperty(urlprovider, lookupip);
        Context jndiContext = new InitialContext();
        Object objref = jndiContext.lookup(jndiname);
        HLCVaigaiSessionRemoteHome home = (HLCVaigaiSessionRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref, HLCVaigaiSessionRemoteHome.class);
        HLCVaigaiSessionRemote remote = home.create();

        return remote;

    }

    private ArrayList getDropDown(Vector mediaLists) {

        ArrayList dropDwonLists = new ArrayList();
        for (Iterator it = mediaLists.iterator(); it.hasNext();) {
            String[] keyValue = (String[]) it.next();
            dropDwonLists.add(new LabelValueBean(keyValue[1], keyValue[0]));
        }
        return dropDwonLists;
    }

    private HLCkaverystatelessRemote initializeKaveryEJB(HttpServletRequest request) throws Exception {

        MessageResources mr = getResources(request);
        String namingfactory = mr.getMessage("ejbclient.namingfactory");
        String contextfactory = mr.getMessage("ejbclient.contextfactory");
        String urlprovider = mr.getMessage("ejbclient.urlprovider");
        String lookupip = mr.getMessage("ejbclient.ip");
        //String jndiname=mr.getMessage("jndi.advertise");
        Context jndiContext = new InitialContext();
        String jndiname1 = mr.getMessage("jndi.usrreg");
        Object objref1 = jndiContext.lookup(jndiname1);

        HLCkaverystatelessRemoteHome home = (HLCkaverystatelessRemoteHome) javax.rmi.PortableRemoteObject.narrow(objref1, HLCkaverystatelessRemoteHome.class);
        HLCkaverystatelessRemote remote1 = home.create();
        return remote1;

    }
}

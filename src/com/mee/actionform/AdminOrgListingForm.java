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
package com.mee.actionform;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author Shiva Kumar Subbiaha
 * @version
 */

public class AdminOrgListingForm implements Serializable{
    
    private String  status;
    private String comments;
    private String meetingId;
    
    
    private String orgId;
    private String accessLevel;
    private String dtOfEvent;
    private String dtOfReg;
    private String approvStatus;
    
    
    
     private List results;
    
    public AdminOrgListingForm(){}
    
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        
        return null;
    }
    
   
    public void setResults(List results) {
        this.results = results;
    }
    

    
    // Reset form fields.
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.status = null;
        this.comments = null;
        this.meetingId = null;
        this.results = null;
    }

    public void setOrgId(String orgId) {
        this.orgId = orgId;
    }
    
    public String getOrgId() {
        return orgId;
    }
    
    public void setAccessLevel(String accessLevel) {
        this.accessLevel = accessLevel;
    }
    
    public String getAccessLevel() {
        return accessLevel;
    }
    
    public void setDtOfEvent(String dtOfEvent) {
        this.dtOfEvent = dtOfEvent;
    }
    
    public String getDtOfEvent() {
        return dtOfEvent;
    }
    
    public void setDtOfReg(String dtOfReg) {
        this.dtOfReg = dtOfReg;
    }
    
    public String getDtOfReg() {
        return dtOfReg;
    }
    
    public void setApprovStatus(String approvStatus) {
        this.approvStatus = approvStatus;
    }
    
    public String getApprovStatus() {
        return approvStatus;
    }


    
    
    
    
    

    
    
    public void setStatus(String status) {
        this.status = status;
    }

    public List getResults() {
        return results;
    }

    public String getStatus() {
        return status;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getComments() {
        return comments;
    }

    public void setMeetingId(String meetingId) {
        this.meetingId = meetingId;
    }

    public String getMeetingId() {
        return meetingId;
    }
}

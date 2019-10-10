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
/*  Program Name    : SearchAdvtForm.java
 *  Created Date    : September 1, 2006, 10:25 AM
 *  Author          : Punitha.R
 *  Version         : 1.1
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.adv.actionform;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;

public class SearchAdvtForm implements Serializable{
    
    private String  selMediaType;
    private String  selDisplayType;
    private List results;
    
    public SearchAdvtForm(){}
    
    
    
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
        
        return null;
    }
    
    
    public String getSelDisplayType() {
        return selDisplayType;
    }
    
    
    public String getSelMediaType() {
        return selMediaType;
    }
    
    public void setSelMediaType(String selMediaType) {
        this.selMediaType = selMediaType;
    }
    
    public void setSelDisplayType(String selDisplayType) {
        this.selDisplayType = selDisplayType;
    }
    
    public void setResults(List results) {
        this.results = results;
    }
    
    public List getResults() {
        return results;
    }
    
    // Reset form fields.
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        selMediaType = null;
        selDisplayType = null;
        results = null;
    }
}

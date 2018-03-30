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
/*  Program Name    : FormAdvertisement.java
 *  Created Date    : September 1, 2006, 10:25 AM
 *  Author          : Punitha.R
 *  Version         : 1.6
 *  CopyrightInformation:
    (c)2006,digiBlitz Technologies Inc/digiBlitz Technologies (P) Ltd. All rights reserved.
    916 W. Broad Street Suite 205, FallsChurch, VA 22046.
    
    This document is protected by copyright. No part of this document may be reproduced in any form by any means without
    prior written authorization of Sun and its licensors. if any.
 
    The information described in this document may be protected by one or more U.S.patents.foreign patents,or
    pending applications.
 */

package com.adv.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;
import org.springframework.web.servlet.ModelAndView;


public class FormAdvertisement implements Serializable{
    private String  dimensionId;
    private String  selMediaType;
    private String  selDisplayType;
    private String  selDisplaySubType;
    private String  selDimensionType;
    private String  txtDimensionalName;
    private String  txtAdvHeight;
    private String  txtAdvWidth;
    private String  txtDimensionalUnit;
    private String  imagePath;
    private transient FormFile fileUpload;

    public FormAdvertisement(){}

    public void reset(ModelAndView mapping, HttpServletRequest request) {
        //super.reset(mapping,request);
        this.dimensionId=null;
        this.selMediaType=null;
        this.selDisplayType=null;
        this.selDisplaySubType=null;
        this.selDimensionType=null;
        this.txtDimensionalName=null;
        this.txtAdvHeight=null;
        this.txtAdvWidth=null;
        this.txtDimensionalUnit=null;
        this.imagePath=null;
        this.fileUpload=null;
    }
  
    

    public ActionErrors validate(ModelAndView mapping, HttpServletRequest request) {
       
        
        return null;
    }

    public FormFile getFileUpload() {
        return fileUpload;
    }

    public String getSelDimensionType() {
        return selDimensionType;
    }
 
    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getSelDisplayType() {
        return selDisplayType;
    }

public String getDimensionId() {
        return dimensionId;
    }

    public void setDimensionId(String dimensionId) {
        this.dimensionId = dimensionId;
    }
  
	

    public String getSelMediaType() {
        return selMediaType;
    }

    public String getTxtAdvHeight() {
        return txtAdvHeight;
    }

    public String getTxtAdvWidth() {
        return txtAdvWidth;
    }

    public String getTxtDimensionalName() {
        return txtDimensionalName;
    }

    public String getTxtDimensionalUnit() {
        return txtDimensionalUnit;
    }

    public void setFileUpload(FormFile fileUpload) {
        this.fileUpload = fileUpload;
    }

    public void setSelDimensionType(String selDimensionType) {
        this.selDimensionType = selDimensionType;
    }

    public void setSelDisplaySubType(String selDisplaySubType) {
        this.selDisplaySubType = selDisplaySubType;
    }

    public void setSelMediaType(String selMediaType) {
        this.selMediaType = selMediaType;
    }

    public void setTxtAdvHeight(String txtAdvHeight) {
        this.txtAdvHeight = txtAdvHeight;
    }

    public void setTxtAdvWidth(String txtAdvWidth) {
        this.txtAdvWidth = txtAdvWidth;
    }

    public void setTxtDimensionalName(String txtDimensionalName) {
        this.txtDimensionalName = txtDimensionalName;
    }

    public String getSelDisplaySubType() {
        return selDisplaySubType;
    }

    public void setTxtDimensionalUnit(String txtDimensionalUnit) {
        this.txtDimensionalUnit = txtDimensionalUnit;
    }

    public void setSelDisplayType(String selDisplayType) {
        this.selDisplayType = selDisplayType;
    }
   
    
  public String toString(){
  
   StringBuffer buffer = new StringBuffer()
   .append("DimensionId="+this.dimensionId+",")
   .append("MediaType="+this.selMediaType+",")
   .append("DisplayType="+this.selDisplayType+",")
   .append("DisplaySubType="+this.selDisplaySubType+",")
   .append("DimensionType="+this.selDimensionType+",")
   .append("DimensionalName="+this.txtDimensionalName+",")
   .append("Height="+this.txtAdvHeight+",")
   .append("Width"+this.txtAdvWidth+",")
   .append("DimensionalUnit="+this.txtDimensionalUnit+",")
   .append("ImagePath="+this.imagePath);
  
  return buffer.toString();
  }
}

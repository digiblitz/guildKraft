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
/*  Program Name    : AdvertisementFormVO.java
 *  Created Date    : September 4, 2006, 4:24 PM
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

import java.io.Serializable;


public class AdvertisementFormVO implements Serializable{

    private String  dimensionId;
    private String  mediaType;
    private String  displayType;
    private String  displaySubType;
    private String  dimensionType;
    private String  dimensionalName;
    private String  height;
    private String  width;
    private String  dimensionalUnit;
    private String  imagePath;


    public AdvertisementFormVO(){}

    public String getDimensionId() {
        return dimensionId;
    }

    public String getDimensionalName() {
        return dimensionalName;
    }

    public String getDisplaySubType() {
        return displaySubType;
    }

    public String getDimensionType() {
        return dimensionType;
    }

    public String getDisplayType() {
        return displayType;
    }

    public String getHeight() {
        return height;
    }

    public String getImagePath() {
        return imagePath;
    }

    public String getMediaType() {
        return mediaType;
    }

    public String getWidth() {
        return width;
    }

    public String getDimensionalUnit() {
        return dimensionalUnit;
    }

    public void setDimensionId(String dimensionId) {
        this.dimensionId = dimensionId;
    }

    public void setDimensionType(String dimensionType) {
        this.dimensionType = dimensionType;
    }

    public void setDimensionalName(String dimensionalName) {
        this.dimensionalName = dimensionalName;
    }

    public void setDimensionalUnit(String dimensionalUnit) {
        this.dimensionalUnit = dimensionalUnit;
    }

    public void setDisplaySubType(String displaySubType) {
        this.displaySubType = displaySubType;
    }

    public void setDisplayType(String displayType) {
        this.displayType = displayType;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    public void setMediaType(String mediaType) {
        this.mediaType = mediaType;
    }

    public void setWidth(String width) {
        this.width = width;
    }
  
  public String toString(){
  
   StringBuffer buffer = new StringBuffer()
   .append("DimensionId="+this.dimensionId+",")
   .append("MediaType="+this.mediaType+",")
   .append("DisplayType="+this.displayType+",")
   .append("DisplaySubType="+this.displaySubType+",")
   .append("DimensionType="+this.dimensionType+",")
   .append("DimensionalName="+this.dimensionalName+",")
   .append("Height="+this.height+",")
   .append("Width"+this.width+",")
   .append("DimensionalUnit="+this.dimensionalUnit+",")
   .append("ImagePath="+this.imagePath);
  
  return buffer.toString();
  }
}

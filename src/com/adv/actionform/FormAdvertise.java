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
/*  Program Name    : FormAdvertise.java
 *  Created Date    : September 8, 2006, 12:35 AM
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
import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class FormAdvertise implements Serializable{
 
	private String  userId;
	private String  mediaId;

	private String  txtAdvName;
	private String  txtAgentName;
	private String  txtFirstName;
	private String  txtMidName;
	private String  txtLastName;
	private String  txtConPhone;
	private String  txtConFax;
	private String  txtConMail;
	private String  txtStreetName;
	private String  txtSuiteName;
	private String  txtConCity;
	private String  selConState;
	private String  selConCountry;
	private String  txtConZip;
	
/*txtAdName
txtDetDate
txtYesDate
selFreqRate
selDisplayType*/
        
        private String  invoiceTo;
	private String  comments;
	private String  advPosted;
	private String    advPostedDate;
	private String   materialComingFrom;
	private String     materialComingDate;
	private String   advSuppliedOn;
	private String   salesPersonId;
	private String   requestStatus;
	private boolean  activeStatus;    
    /**
     *payment status credit card details
     */
        private String ccName;
        private String selCardType;
        private String txtCcNumber;
        private String selExpiryMonth;
        private String selExpiryYear;
        private String txtCvvNumber;
    /**
     *check details
     */   
        private String txtChNumber;
        private String txtChDate;
        private String txtFav;
        
        private String amount;
        private String insertProcess;
        private String paymentDate;
        private String paymentStatus;   
       
        
        
    public FormAdvertise() {
        super();
        // TODO Auto-generated constructor stub
    }
 
        public String getUserId() {
            return  userId;
        }
        
        public String getMediaId(){
            return mediaId;
        }
   
        public String getTxtAdvName() {
            return  txtAdvName;
        }
        
        public String getTxtAgentName() {
            return  txtAgentName;
        }
        public String getTxtFirstName() {
            return  txtFirstName;
        }
        
        public String getTxtMidName(){
            return txtMidName;
        }
        
        public String getTxtLastName() {
            return  txtLastName;
        }
        
        public String getTxtConPhone() {
            return  txtConPhone;
        }
        
        public String getTxtConMail() {
            return txtConMail;
        }
         public String getTxtConFax() {
            return txtConFax;
        }
	public String getTxtStreetName() {
            return  txtStreetName;
        }
        
        public String getTxtSuiteName() {
            return txtSuiteName;
        }
         public String getTxtConCity() {
            return txtConCity;
        }
	public String getSelConState() {
            return  selConState;
        }
        
        public String getSelConCountry() {
            return selConCountry;
        }
         public String getTxtConZip() {
            return txtConZip;
        }
        //setter methods
      
          public void setUserId(String userId) {
            this. userId=userId;
        }
        
        public void setMediaId(String mediaId){
           this. mediaId=mediaId;
        }
   
        public void setTxtAdvName(String txtAdvName) {
           this.txtAdvName = txtAdvName;
        }
        
        public void setTxtAgentName(String txtAgentName) {
           this.txtAgentName =txtAgentName;
        }
        public void setTxtFirstName(String txtFirstName) {
           this.txtFirstName =txtFirstName;
        }
        
        public void setTxtMidName(String txtMidName){
            this.txtMidName =txtMidName;
        }
        
        public void setTxtLastName(String txtLastName) {
            this.txtLastName = txtLastName;
        }
        
        public void setTxtConPhone(String  txtConPhone) {
            this.txtConPhone =txtConPhone;
        }
        
        public void setTxtConMail() {
           this.txtConMail = txtConMail; 
        }
         public void setTxtConFax(String txtConFax) {
            this.txtConFax = txtConFax; 
        }
	public void setTxtStreetName() {
           this.txtStreetName =txtStreetName;
        }
        
        public void setTxtSuiteName() {
         this.txtSuiteName = txtSuiteName;
        }
         public void setTxtConCity() {
            this.txtConCity = txtConCity;
        }
	public void setSelConState() {
           this.selConState = selConState;
        }
        
        public void setSelConCountry() {
            this.selConCountry = selConCountry; 
        }
         public void setTxtConZip() {
            this.txtConZip= txtConZip;
        }
	
       public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
             
        return null;
    }
  
}

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

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;

import org.apache.struts.action.ActionForward;

import java.util.*;
import java.util.Date;
import java.io.Serializable;


public class FormEventOrgRenewal {
    
     public FormEventOrgRenewal() {
        super();
     }
    
    
         private String ccName;
        private String ccType;
        private String ccNumber;
        private String ccExpMonth;
        private String ccExpYear;
        private String ccCvvid;
        private String bankName;
      
        private String checkDate;
        private String checkNumber;
        private String amount;
        private String insertProcess;
        private String paymentDate;
        private String paymentStatus;
        private String nameOnchk;
        //end of payment
        
        private String competitionName;
        private String competitionLocation;
        private String competitionCity;
        private String competitionState;
        private String competitionCountry;
        private String competitionZip;
        private String competitionDate;
        private String championshipArea;
        private String comManagementName;
        private String comManagementAddress;
        private String comManagementAddress2;
        private String comManagementCity;
        private String comManagementState;
        private String comManagementCountry;
        private String comManagementZip;
        private String comManagementPhone;
        private String comManagementFax;
        private String comManagementEmail;
        private String managerUsefMemberId;
        private String managerUseaMemberId;
        private String managerName;
        private String secretaryUsefMemberId;
        private String secretaryName;
        
        private String r11;
        
        // getters
         public String getCcName() {
            return ccName;
        }
        public String getR11() {
            return r11;
        } 
        public String getCcType() {
            return ccType;
        }
        public String getCcNumber() {
            return ccNumber;
        }
        public String getCcExpMonth() {
            return ccExpMonth;
        }
        public String getCcExpYear() {
        return ccExpYear;
        }
        public String getCcCvvid() {
            return ccCvvid;
        }
        public String getBankName() {
            return bankName;
        }
        public String getCheckDate() {
            return checkDate;
        }
        public String getCheckNumber() {
            return checkNumber;
        }
        public String getAmount() {
            return amount;
        }
        public String getPaymentDate() {
            return paymentDate;
        }
        public String getPaymentStatus() {
            return paymentStatus;
        }
        public String getCompetitionName() {
           return competitionName;
        }
        public String getCompetitionLocation() {
          return competitionLocation;
        }
        public String getCompetitionCity() {
           return competitionCity;
        }
        public String getCompetitionState() {
            return competitionState;
        }
        public String getCompetitionCountry() {
           return competitionCountry;
        }
        public String getCompetitionZip() {
          return competitionZip;
        }
        
       public String getCompetitionDate() {
            return competitionDate;
        } 
        public String getChampionshipArea() {
            return championshipArea;
        }
        
        public String getComManagementName() {
            return comManagementName;
        }
        public String getComManagementAddress() {
            return comManagementAddress;
        }
        public String getComManagementCity() {
            return comManagementCity;
        }
        public String getComManagementState() {
            return comManagementState;
        }
        public String getComManagementCountry() {
            return comManagementCountry;
        }
        public String getComManagementZip() {
            return comManagementZip;
        }
        
         public String getComManagementPhone() {
            return comManagementPhone;
        }
         
        public String getComManagementFax() {
            return comManagementFax;
        }
      
        public String getManagerUsefMemberId() {
            return managerUsefMemberId;
        }
        public String getManagerUseaMemberId() {
            return managerUseaMemberId;
        }

        public String getManagerName() {
            return managerName;
        }
        
        public String getSecretaryUsefMemberId() {
            return secretaryUsefMemberId;
        }
        
        public String getSecretaryName() {
            return secretaryName;
        }
        public String getInsertProcess() {
            return insertProcess;
        }
   
    //Setters methods
      
                
        public void setR11(String r11) {
            this.r11 = r11;
        }
      
        
        public void setInsertProcess(String insertProcess) {
            this.insertProcess = insertProcess;
        }
      
        public void setCcName(String ccName) {
            this.ccName = ccName;
        }
        public void setCcType(String ccType) {
            this.ccType = ccType;
        }
        public void setCcNumber(String ccNumber) {
            this.ccNumber = ccNumber;
        }
        public void setCcExpMonth(String ccExpMonth) {
            this.ccExpMonth = ccExpMonth;
        }
        public void setCcExpYear(String ccExpYear) {
            this.ccExpYear = ccExpYear;
        }
        public void setCcCvvid(String ccCvvid) {
            this.ccCvvid = ccCvvid;
        }
        public void setBankName(String bankName) {
            this.bankName = bankName;
        }
        public void setCheckDate(String checkDate) {
            this.checkDate = checkDate;
        }
        public void setCheckNumber(String checkNumber) {
            this.checkNumber = checkNumber;
        }
        public void setAmount(String amount) {
            this.amount = amount;
        }
        public void setPaymentDate(String paymentDate) {
            this.paymentDate = paymentDate;
        }
        public void setPaymentStatus(String paymentStatus) {
            this.paymentStatus = paymentStatus;
        }
   
      //*=====================================Payment End=======================================*\     
        
        public void setCompetitionName(String competitionName) {
            this.competitionName = competitionName;
        }
        public void setCompetitionLocation(String competitionLocation) {
            this.competitionLocation = competitionLocation;
        }
        public void setCompetitionCity(String competitionCity) {
            this.competitionCity = competitionCity;
        }
        public void setCompetitionState(String competitionState) {
            this.competitionState = competitionState;
        }
        public void setCompetitionCountry(String competitionCountry) {
            this.competitionCountry = competitionCountry;
        }
        public void setCompetitionZip(String competitionZip) {
            this.competitionZip = competitionZip;
        }
        
        public void setCompetitionDate(String competitionDate) {
            this.competitionDate = competitionDate;
        }
      
        
        public void setChampionshipArea(String championshipArea) {
            this.championshipArea = championshipArea;
        }
            
        public void setComManagementName(String comManagementName) {
            this.comManagementName = comManagementName;
        }
        public void setComManagementAddress(String comManagementAddress) {
            this.comManagementAddress = comManagementAddress;
        }
        public void setComManagementCity(String comManagementCity) {
            this.comManagementCity = comManagementCity;
        }
        public void setComManagementState(String comManagementState) {
            this.comManagementState = comManagementState;
        }
        public void setComManagementCountry(String comManagementCountry) {
            this.comManagementCountry = comManagementCountry;
        }
        public void setComManagementZip(String comManagementZip) {
            this.comManagementZip = comManagementZip;
        }
        
        public void setComManagementPhone(String comManagementPhone) {
            this.comManagementPhone = comManagementPhone ;
        }
         
        public void setComManagementFax(String comManagementFax) {
            this.comManagementFax = comManagementFax ;
        }
     
        public void setManagerUsefMemberId(String managerUsefMemberId) {
            this.managerUsefMemberId = managerUsefMemberId;
        }
        public void setManagerUseaMemberId(String managerUseaMemberId) {
            this.managerUseaMemberId = managerUseaMemberId;
        }

        public void setManagerName(String managerName) {
            this.managerName = managerName;
        }
        
        public void setSecretaryUsefMemberId(String secretaryUsefMemberId) {
            this.secretaryUsefMemberId = secretaryUsefMemberId;
        }
        
        public void setSecretaryName(String secretaryName) {
            this.secretaryName = secretaryName;
        }
        
        public String getNameOnchk() {
            return nameOnchk;
        }

        public void setNameOnchk(String nameOnchk) {
            this.nameOnchk = nameOnchk;
        }

    public String getComManagementEmail() {
        return comManagementEmail;
    }

    public void setComManagementEmail(String comManagementEmail) {
        this.comManagementEmail = comManagementEmail;
    }

    public String getComManagementAddress2() {
        return comManagementAddress2;
    }

    public void setComManagementAddress2(String comManagementAddress2) {
        this.comManagementAddress2 = comManagementAddress2;
    }
}
   
    
    

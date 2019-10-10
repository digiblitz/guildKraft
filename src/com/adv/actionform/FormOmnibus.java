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
/*  Program Name    : FormOmnibus.java
 *  Created Date    : September 8, 2006, 7:08 PM
 *  Author          : Punitha.R
 *  Version         : 1.2
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

public class FormOmnibus {
    
  

	private String  txtAdvName;
	private String  txtAgentName;
	private String  txtFirstName;
	private String  txtMidName;
	private String  txtLastName;
	private String  txtStreetName;
	private String  txtSuiteName;
	private String  selConCountry;
	private String  selConState;
	private String  txtConCity;
	
	private String  txtConZip;
	private String  txtConPhone;
	private String  txtConFax;
	private String  txtConMail;
        
	private String  rdoAdvertising ;
	private String  rdoQuest;
        
	private String  txtYesDate;
	private String  selPlanDisp;
        
        

        
        private String  txtMatName;
        private String  txtAdName;
	private String  txtDetDate;
	private String  rdoSupply;
	private String  txtAreaIns;
	private String  amount;
        
	private String ccName;
        private String ccType;
        private String ccNumber;
        private String ccExpMonth;
        private String ccExpYear;
        private String ccCvvid;
        private String bankName;
      
        private String checkDate;
        private String checkNumber;
       
        private String insertProcess;
        private String paymentDate;
        private String paymentStatus;
        private String r11;


	public String getTxtAdvName() {
		return txtAdvName;
	}

	public String getTxtAgentName() {
		return txtAgentName;
	}

	public String getTxtFirstName() {
		return txtFirstName;
	}

	public String getTxtMidName() {
		return txtMidName;
	}

	public String getTxtLastName() {
		return txtLastName;
	}

	public String getTxtStreetName() {
		return txtStreetName;
	}

	public String getTxtSuiteName() {
		return txtSuiteName;
	}

	public String getSelConCountry() {
		return selConCountry;
	}

	public String getSelConState() {
		return selConState;
	}

	public String getTxtConCity() {
		return txtConCity;
	}

	
	public String getTxtConZip() {
		return txtConZip;
	}

	public String getTxtConPhone() {
		return txtConPhone;
	}

	public String getTxtConFax() {
		return txtConFax;
	}

	public String getTxtConMail() {
		return txtConMail;
	}

	public String getRdoAdvertising () {
		return rdoAdvertising ;
	}

	public String getRdoQuest() {
		return rdoQuest;
	}

	public String getTxtYesDate() {
		return txtYesDate;
	}

	public String getSelPlanDisp() {
		return selPlanDisp;
	}
/*
	public String getChkIssueOne() {
		return chkIssueOne;
	}

	public String getChkIssueTwo() {
		return chkIssueTwo;
	}

	public String getChkIssueThree() {
		return chkIssueThree;
	}

	public String getChkIssueFour() {
		return chkIssueFour;
	}

	public String getSelWinType() {
		return selWinType;
	}

	public String getSelWinSubType() {
		return selWinSubType;
	}

	public String getSelWinDim() {
		return selWinDim;
	}

	public String getTxtWinPlace() {
		return txtWinPlace;
	}

	public String getSelSprType() {
		return selSprType;
	}

	public String getSelSprSubType() {
		return selSprSubType;
	}

	public String getSelSprDim() {
		return selSprDim;
	}

	public String getTxtSprPlace() {
		return txtSprPlace;
	}

public String getSelSumType() {
		return selSumType;
	}

	public String getSelSumSubType() {
		return selSumSubType;
	}

	public String getSelSumDim() {
		return selSumDim;
	}

	public String getTxtSumPlace() {
		return txtSumPlace;
	}
	public String getSelFallType() {
		return selFallType;
	}

	public String getSelFallSubType() {
		return selFallSubType;
	}

	public String getSelFallDim() {
		return selFallDim;
	}

	public String getTxtFallPlace() {
		return txtFallPlace;
	}
  */
	public String getTxtAdName() {
		return txtAdName;
	}
	public String getTxtDetDate() {
		return txtDetDate;
	}

	public String getRdoSupply() {
		return rdoSupply;
	}

	public String getTxtAreaIns() {
		return txtAreaIns;
	}

	public String getAmount() {
		return amount;
	}

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
      
        public String getPaymentDate() {
            return paymentDate;
        }
        public String getPaymentStatus() {
            return paymentStatus;
        }
        
        
         public void setR11(String r11) {
            this.r11 = r11;
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



    public String getTxtMatName() {
        return txtMatName;
    }



 //Setters methods

    public void setTxtAdvName(String txtAdvName) {
        this.txtAdvName = txtAdvName;
    }


 	public void setTxtAgentName(String txtAgentName)  {
	 	this.txtAgentName = txtAgentName;
  	}

	public void setTxtFirstName(String txtFirstName) {
	 	this.txtFirstName =  txtFirstName;
 	}
 	public void setTxtMidName(String txtMidName)   {
	    this.txtMidName =  txtMidName;
    }
	public void setTxtLastName(String txtLastName) {
	   this.txtLastName =  txtLastName;
    }
    public void setTxtStreetName(String txtStreetName) {
	   this.txtStreetName = txtStreetName;
    }
    public void setTxtSuiteName(String txtSuiteName) {
	   this.txtSuiteName = txtSuiteName;
    }
    public void setSelConCountry(String selConCountry) {
        this.selConCountry = selConCountry;
    }


 	public void setSelConState(String selConState)  {
	 	this.selConState = selConState;
  	}

	public void setTxtConCity(String txtConCity) {
	 	this.txtConCity =  txtConCity;
 	}
 	
	public void setTxtConZip(String txtConZip) {
	   this.txtConZip =  txtConZip;
    }
    public void setTxtConPhone(String txtConPhone) {
	   this.txtConPhone = txtConPhone;
    }
    public void setTxtConFax(String txtConFax) {
	   this.txtConFax = txtConFax;
    }
    public void setTxtConMail(String txtConMail) {
        this.txtConMail = txtConMail;
    }


 	public void setRdoAdvertising (String rdoAdvertising )  {
	 	this.rdoAdvertising  = rdoAdvertising ;
  	}

	public void setRdoQuest(String rdoQuest) {
	 	this.rdoQuest =  rdoQuest;
 	}
 	public void setTxtYesDate(String txtYesDate)   {
	    this.txtYesDate =  txtYesDate;
    }
	public void setSelPlanDisp(String selPlanDisp) {
	   this.selPlanDisp =  selPlanDisp;
    }
        
/*        
    public void setChkIssueOne(String chkIssueOne) {
	   this.chkIssueOne = chkIssueOne;
    }
    public void setChkIssueTwo(String chkIssueTwo) {
	   this.chkIssueTwo = chkIssueTwo;
    }
    public void setChkIssueThree(String chkIssueThree) {
        this.chkIssueThree = chkIssueThree;
    }


 	public void setChkIssueFour(String chkIssueFour)  {
	 	this.chkIssueFour = chkIssueFour;
  	}

	public void setSelWinType(String selWinType) {
	 	this.selWinType =  selWinType;
 	}
 	public void setSelWinSubType(String selWinSubType)   {
	    this.selWinSubType =  selWinSubType;
    }
	public void setSelWinDim(String selWinDim) {
	   this.selWinDim =  selWinDim;
    }
    public void setTxtWinPlace(String txtWinPlace) {
	   this.txtWinPlace = txtWinPlace;
    }
    public void setSelSprType(String selSprType) {
	   this.selSprType = selSprType;
    }
    public void setSelSprSubType(String selSprSubType) {
        this.selSprSubType = selSprSubType;
    }


 	public void setSelSprDim(String selSprDim)  {
	 	this.selSprDim = selSprDim;
  	}

	public void setTxtSprPlace(String txtSprPlace) {
	 	this.txtSprPlace =  txtSprPlace;
 	}
 	public void setSelSumType(String selSumType)   {
	    this.selSumType =  selSumType;
    }
	public void setSelSumSubType(String selSumSubType) {
	   this.selSumSubType =  selSumSubType;
    }
    public void setSelSumDim(String selSumDim) {
	   this.selSumDim = selSumDim;
    }
    public void setTxtSumPlace(String txtSumPlace) {
	   this.txtSumPlace = txtSumPlace;
    }
    public void setSelFallType(String selFallType) {
        this.selFallType = selFallType;
    }


 	public void setSelFallSubType(String selFallSubType)  {
	 	this.selFallSubType = selFallSubType;
  	}

	public void setSelFallDim(String selFallDim) {
	 	this.selFallDim =  selFallDim;
 	}
 	
        public void setTxtFallPlace(String txtFallPlace) {
	    this.txtFallPlace =  txtFallPlace;
        }
        
*/
 public void setTxtAdName(String txtAdName) {
	   this.txtAdName =  txtAdName;
        }
    public void setTxtDetDate(String txtDetDate) {
	   this.txtDetDate = txtDetDate;
    }
    public void setRdoSupply(String rdoSupply) {
	   this.rdoSupply = rdoSupply;
    }
    public void setTxtAreaIns(String txtAreaIns) {
        this.txtAreaIns = txtAreaIns;
    }
 
    public void setTxtMatName(String txtMatName) {
        this.txtMatName = txtMatName;
    }


}
   
  

/*
 * FormMadhurai.java
 *
 * Created on September 18, 2006, 11:09 AM
 */

package com.mee.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;

/**
 *
 * @author punitha
 * @version
 */


   public class FormMadhurai implements Serializable{
       
/*
* just for declaration of educational activity organiser details
*/  
        
	private String  activityName;
	private String  activityDate;
	private String  noOfDays;
	private String  hlcAreaId;
	private String  location;
	private String  state;
	private String  hlcNo;
	private String  selActivityId;
	private String  otherActivityType;
	private String  activityFees;
	private String  instructorsCoaches;
	private String  chkFac1;
        private String  chkFac2;
        private String  chkFac3;
        private String  chkFac4;
    	private String  otherFacilities;
	private String  landOwnerName;
	private String  landOwnerBusinessName;
	private String  landOwnerAddress;
	private String  landOwnerCity;
	private String  landOwnerState;
	private String  landOwnerCountry;
	private String  landOwnerZip;
	private String  landOwnerPhone;
         private String  landOwnerFax;

    public String getLandOwnerEmail() {
        return landOwnerEmail;
    }

    public void setLandOwnerEmail(String landOwnerEmail) {
        this.landOwnerEmail = landOwnerEmail;
    }

    public String getLandOwnerFax() {
        return landOwnerFax;
    }

    public void setLandOwnerFax(String landOwnerFax) {
        this.landOwnerFax = landOwnerFax;
    }
        private String  landOwnerEmail;

       // private boolean  additionalSites;
        private String  additionalSites;
        private String  approvedBy;
        private String  hlcArea;
        private String comments;
  
        private String areaStatus;
        private String emailLogo;
        private String radioCompMail;
        private String radioSendMail;
        private String radioSortMail;
        private String areaState;
        private String noOfCopies;
/*
* just for declaration of payment details
*/
        
        private String ccName;
        private String ccType;
        private String ccNumber;
        private String ccExpMonth;
        private String ccExpYear;
        private String ccCvvid;
        private String bankName;
        private String nameCheck;

        private String checkDate;
        private String checkNumber;
        private String amount;
        private String insertProcess;
        private String checkAmount;

    public String getCheckAmount() {
        return checkAmount;
    }

    public void setCheckAmount(String checkAmount) {
        this.checkAmount = checkAmount;
    }
        private String paymentDate;
        private String paymentStatus;
        private String r11;
        
   public FormMadhurai(){
         
        }
   public void reset(ActionMapping mapping, HttpServletRequest request) {
        //super.reset(mapping,request);
           
	this.activityName=null;
	this.activityDate=null;
	this.noOfDays=null;
	this.hlcAreaId=null;
	this.location=null;
	this.state=null;
	this.hlcNo=null;
	this.selActivityId=null;
	this.otherActivityType=null;
	this.activityFees=null;
	this.instructorsCoaches=null;
	this.chkFac1=null;
        this.chkFac2=null;
        this.chkFac3=null;
        this.chkFac4=null; 
    	this.otherFacilities=null;
	this.landOwnerName=null;
	this.landOwnerBusinessName=null;
	this.landOwnerAddress=null;
	this.landOwnerCity=null;
	this.landOwnerState=null;
	this.landOwnerCountry=null;
	this.landOwnerZip=null;
	this.landOwnerPhone=null;
         this.landOwnerFax=null;
        this.landOwnerEmail=null;
       // private boolean  additionalSites;
       this.additionalSites=null;
       this.approvedBy=null;
        this.hlcArea=null;
       this.comments=null;
       this.areaState=null;
      this.areaStatus=null;
      this.checkAmount = null;
    }    
/*
 *  getter methods for publication details
 */   
   
     public String getUserArea() {
        return hlcArea;
    }    
    public String getComments() {
        return comments;
    }        
    public String getEmailLogo() {
        return emailLogo;
    }

    public String getNoOfCopies() {
        return noOfCopies;
    }

    public String getRadioCompMail() {
        return radioCompMail;
    }

    public String getRadioSendMail() {
        return radioSendMail;
    }

    public String getRadioSortMail() {
        return radioSortMail;
    }
  
        
/*
 * getter methods for education activity orgainiser details
 */     
       

	public String getActivityName() {
		return activityName;
	}

	public String getActivityDate() {
		return activityDate;
	}

	public String getNoOfDays() {
		return noOfDays;
	}

	public String getIadAreaId() {
		return hlcAreaId;
	}

	public String getLocation() {
		return location;
	}

	public String getState() {
		return state;
	}
	public String getUseaNo() {
                return hlcNo;
	}

	public String getSelActivityId() {
                return selActivityId;
	}

	public String getOtherActivityType() {
		return otherActivityType;
	}
 
	public String getActivityFees() {
		return activityFees;
	}
	public String getInstructorsCoaches() {
		return instructorsCoaches;
	}
	public String getChkFac1() {
		return chkFac1;
	}
        public String getChkFac2() {
		return chkFac2;
	}
        public String getChkFac3() {
		return chkFac3;
	}
        public String getChkFac4() {
		return chkFac4;
	}
	public String getOtherFacilities() {
		return otherFacilities;
	}
	public String getLandOwnerName() {
		return landOwnerName;
	}
	public String getLandOwnerBusinessName() {
		return landOwnerBusinessName;
	}
	public String getLandOwnerAddress() {
		return landOwnerAddress;
	}
	public String getLandOwnerCity() {
		return landOwnerCity;
	}
	public String getLandOwnerState() {
		return landOwnerState;
	}
	public String getLandOwnerCountry() {
		return landOwnerCountry;
	}
	public String getLandOwnerZip() {
		return landOwnerZip;
	}
	public String getLandOwnerPhone() {
		return landOwnerPhone;
	}
        
	/*public boolean isAdditionalSites() {
		return additionalSites;
	}*/
        public String getAdditionalSites(){
		return additionalSites;
	}
        public String getApprovedBy() {
		return approvedBy;
	}
        

 
    
/*
* getter methods for payment details
*/         
        
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
        
   /*
    * setter methods for payment details
    */     
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
         public void setComments(String comments) {
            this.comments = comments;
        }
/*
 * setter methods for education activity orgainiser details
 */        
     
        public void setActivityName(String activityName)  {
        this.activityName = activityName;
        }
        public void setActivityDate(String activityDate)  {
        this.activityDate = activityDate;
        }

        public void setNoOfDays(String noOfDays) {
        this.noOfDays =  noOfDays;
        }
        public void setIadAreaId(String hlcAreaId)   {
            
        this.hlcAreaId =  hlcAreaId;
        }
        public void setLocation(String location) {
        this.location =  location;
        }
        public void setState(String state) {
        this.state = state;
        }
        public void setUseaNo(String hlcNo) {
        this.hlcNo = hlcNo;
        }
       public void setSelActivityId(String selActivityId) {
        this.selActivityId = selActivityId;
        }
        public void setOtherActivityType(String otherActivityType)  {
        this.otherActivityType = otherActivityType;
        }

        public void setActivityFees(String activityFees) {
        this.activityFees =  activityFees;
        }
        public void setInstructorsCoaches(String instructorsCoaches)   {
        this.instructorsCoaches =  instructorsCoaches;
        }
      
        public void setOtherFacilities(String otherFacilities) {
        this.otherFacilities = otherFacilities;
        }
       
        public void setLandOwnerName(String landOwnerName) {
        this.landOwnerName = landOwnerName;
        }
        public void setLandOwnerBusinessName(String landOwnerBusinessName)  {
        this.landOwnerBusinessName = landOwnerBusinessName;
        }

        public void setLandOwnerAddress(String landOwnerAddress) {
        this.landOwnerAddress =  landOwnerAddress;
        }
        public void setLandOwnerCity(String landOwnerCity)   {
        this.landOwnerCity =  landOwnerCity;
        }
        public void setLandOwnerState(String landOwnerState) {
        this.landOwnerState =  landOwnerState;
        }
        public void setLandOwnerCountry(String landOwnerCountry) {
        this.landOwnerCountry = landOwnerCountry;
        }
        public void setLandOwnerZip(String landOwnerZip) {
        this.landOwnerZip = landOwnerZip;
        }

        public void setLandOwnerPhone(String landOwnerPhone)  {
        this.landOwnerPhone = landOwnerPhone;
        }
        
       /*public void setAdditionalSites(boolean additionalSites) {
            this.additionalSites = additionalSites;
	}*/
       public void setAdditionalSites(String additionalSites) {
            this.additionalSites = additionalSites;
	}
       public void setApprovedBy(String ApprovedBy) {
            this.approvedBy =  approvedBy;
        }
        

        public void setChkFac1(String chkFac1) {
            this.chkFac1 = chkFac1;
        }

        public void setChkFac2(String chkFac2) {
            this.chkFac2 = chkFac2;
        }

        public void setChkFac3(String chkFac3) {
            this.chkFac3 = chkFac3;
        }

        public void setChkFac4(String chkFac4) {
            this.chkFac4 = chkFac4;
        }
  
        public void setEmailLogo(String emailLogo) {
            this.emailLogo = emailLogo;
        }

        public void setNoOfCopies(String noOfCopies) {
            this.noOfCopies = noOfCopies;
        }

        public void setRadioCompMail(String radioCompMail) {
            this.radioCompMail = radioCompMail;
        }

        public void setRadioSendMail(String radioSendMail) {
            this.radioSendMail = radioSendMail;
        }

        public void setRadioSortMail(String radioSortMail) {
            this.radioSortMail = radioSortMail;
        }
         public void setUseaArea(String hlcArea) {
            this.hlcArea = hlcArea;
        }

    public void setNameCheck(String nameCheck) {
        this.nameCheck = nameCheck;
    }

    public String getNameCheck() {
        return nameCheck;
    }

    public void setAreaState(String areaState) {
        this.areaState = areaState;
    }

    public String getAreaState() {
        return areaState;
    }

    public String getAreaStatus() {
        return areaStatus;
    }

    

    public void setAreaStatus(String areaStatus) {
        this.areaStatus = areaStatus;
    }
      
         
  
}

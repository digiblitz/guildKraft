/*
 * AdminOrgVO.java
 *
 * Created on September 20, 2006, 7:39 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;


import com.mee.actionform.MemberContactDetails;
import java.io.Serializable;

/**
 *
 * @author vijitha
 */
public class AdminOrgVO  implements Serializable{

    /** Creates a new instance of AdminOrgVO */
    public AdminOrgVO() {
    }
    
	private String  icpMeetingId;
	private String  assesmentLevel;
	private String  assesmentDate;
        private String  noOfDays;
	private String  hlcAreaId;
        private String  areaName;
	private String  location;
	private String  instructorId;
	private String  hostMemberId;
	private String  shippingTypeId;
	private String  assessor;
	private String  facilities="";
	private String  landOwnerName;
        private String landOwnerBusinessName;
	private String  landOwnerAddress;
	private String  landOwnerCity;
	private String  landOwnerState;
        private String  landOwnerCountry;
	private String  landOwnerZip;
	private String  landOwnerPhone;
        private String landOwnerFax;
        private String landOwnerEmail;
	private String  addDate;
	private String  approvedBy;
	private String  approvedDate;
	private String  postingType;
	private String  requestStatus;
        private String comments;
        private String email;
        private String hlcName;
        
        private String ccName;
        private String ccType;
        private String ccNumber;
        private String ccCvvid;
        private String bankName;
        private String checkDate;
        private String checkNumber;
        private String checkName;
        private String amount;
        private String paymentDate;
        private String paymentStatus;
        
        private MemberContactDetails memberContactDetails;
    

//getteremail
    public String getEmail(){return email; }
    public String getComments(){return comments; }
    public String getLandOwnerCountry(){return landOwnerCountry; }
    public String getNoOfDays() { return noOfDays; }
    public String getIcpMeetingId() { return icpMeetingId; }
    public String getAssesmentLevel() { return assesmentLevel; }
    public String getAssesmentDate() {        return assesmentDate;     }
    public String getUseaAreaId() {return hlcAreaId; }
    
    public String getAreaName() {return areaName; }
    public String getLocation() {return location;}
    public String getInstructorId() { return instructorId; }
    public String getHostMemberId() {return hostMemberId;}
    public String getShippingTypeId() {return shippingTypeId; }
    public String getAssessor() {return assessor;}
    public String getFacilities() {return facilities; }
    public String getLandOwnerName() {return landOwnerName; }
    public String getLandOwnerBusinessName() {return landOwnerBusinessName; }
    public String getLandOwnerFax(){return landOwnerFax; }
    public String getLandOwnerEmail() {return landOwnerEmail; }
    public String getLandOwnerAddress() {return landOwnerAddress; }
    public String getLandOwnerCity() {return landOwnerCity; }
    public String getLandOwnerState() {return landOwnerState; }
    public String getLandOwnerZip() {return landOwnerZip; }
    public String getLandOwnerPhone() {return landOwnerPhone; }
    public String getAddDate() {return addDate;}
    public String getApprovedBy() {return approvedBy; }
    public String getApprovedDate() { return approvedDate; }
    public String getPostingType() { return postingType; }
    public String getRequestStatus() {return requestStatus;}

    public String getBankName() {        return bankName;    }
    public String getAmount() {        return amount;    }
    public String getCcCvvid() {        return ccCvvid;    }
    public String getCheckDate() {        return checkDate;    }
    public String getCcName() {        return ccName;    }
    public String getCheckNumber() {        return checkNumber;    }
    public String getCcType() {        return ccType;    }
    public String getCcNumber() {        return ccNumber;    }
    public String getPaymentDate() {        return paymentDate;    }
    public String getPaymentStatus() {        return paymentStatus;    }
    public String getCheckName() {        return checkName;    }
    public String getUseaName() {   return hlcName;  }
    
    //Setters methods email
    public void setEmail(String email){this.email = email; }
    public void setComments(String comments){this.comments = comments; }
    public void setLandOwnerCountry(String landOwnerCountry){this.landOwnerCountry = landOwnerCountry; }
    public void setNoOfDays(String noOfDays){this.noOfDays = noOfDays; }
    public void setIcpMeetingId(String icpMeetingId) {this.icpMeetingId = icpMeetingId; }
    public void setAssesmentLevel(String assesmentLevel)  { this.assesmentLevel = assesmentLevel; }
    public void setAssesmentDate(String assesmentDate) {this.assesmentDate =  assesmentDate; }
    public void setUseaAreaId(String hlcAreaId) {this.hlcAreaId =  hlcAreaId; }
    public void setAreaName(String areaName) {this.areaName =  areaName; }
    public void setLocation(String location) {this.location =  location; }
    public void setInstructorId(String instructorId) {this.instructorId = instructorId;}
    public void setHostMemberId(String hostMemberId) {this.hostMemberId = hostMemberId; }
    public void setShippingTypeId(String shippingTypeId) {this.shippingTypeId = shippingTypeId; }
    public void setAssessor(String assessor) {this.assessor = assessor;}
    public void setFacilities(String facilities) {this.facilities = facilities;}
    public void setLandOwnerName(String landOwnerName) {this.landOwnerName = landOwnerName; }
    public void setLandOwnerBusinessName(String landOwnerBusinessName) {this.landOwnerBusinessName = landOwnerBusinessName; }
    public void setLandOwnerFax(String landOwnerFax){this.landOwnerFax = landOwnerFax; }
    public void setLandOwnerEmail(String landOwnerEmail) {this.landOwnerEmail = landOwnerEmail; }
    public void setLandOwnerAddress(String landOwnerAddress) { this.landOwnerAddress = landOwnerAddress; }
    public void setLandOwnerCity(String landOwnerCity) { this.landOwnerCity = landOwnerCity; }
    public void setLandOwnerState(String landOwnerState) {this.landOwnerState = landOwnerState;}
    public void setLandOwnerZip(String landOwnerZip) {this.landOwnerZip = landOwnerZip; }
    public void setLandOwnerPhone(String landOwnerPhone) { this.landOwnerPhone = landOwnerPhone; }
    public void setAddDate(String addDate) { this.addDate = addDate; }
    public void setApprovedBy(String approvedBy) { this.approvedBy = approvedBy;}
    public void setApprovedDate(String approvedDate) {this.approvedDate = approvedDate; }
    public void setPostingType(String postingType) {this.postingType = postingType; }
    public void setRequestStatus(String requestStatus) {this.requestStatus = requestStatus; }
//Payment Info      
    public void setCheckName(String checkName) {            this.checkName = checkName;     }
    public void setAmount(String amount) {        this.amount = amount;    }
    public void setBankName(String bankName) {        this.bankName = bankName;    }
    public void setCcCvvid(String ccCvvid) {        this.ccCvvid = ccCvvid;    }
    public void setCcName(String ccName) {        this.ccName = ccName;    }
    public void setCcNumber(String ccNumber) {        this.ccNumber = ccNumber;    }
    public void setCheckDate(String checkDate) {        this.checkDate = checkDate;    }
    public void setCheckNumber(String checkNumber) {        this.checkNumber = checkNumber;    }
    public void setPaymentDate(String paymentDate) {        this.paymentDate = paymentDate;    }
    public void setPaymentStatus(String paymentStatus) {        this.paymentStatus = paymentStatus;}
    public void setCcType(String ccType) {       this.ccType = ccType;    }
    public void setUseaName(String hlcName) {       this.hlcName = hlcName;   }
    
    public void setMemberContactDetails(MemberContactDetails memberContactDetails) {
        this.memberContactDetails = memberContactDetails;
    }
    
     public MemberContactDetails getMemberContactDetails() {
        return this.memberContactDetails;
    }
     
     
      public String toString(){
  
        StringBuffer buffer = new StringBuffer()
        .append("noOfDays :"+this.noOfDays+",")
	.append("hlcAreaId :"+this.hlcAreaId+",")
        .append("areaName:"+this.areaName+",")
	.append("location :"+this.location+",")
	.append("instructorId :"+this.instructorId+",")
	.append("hostMemberId :"+this.hostMemberId+",")
	.append("shippingTypeId :"+this.shippingTypeId+",")
	.append("assessor :"+this.assessor+",")
	.append(" facilities:"+this.facilities+",")
	.append("landOwnerName :"+this.landOwnerName+",")
        .append("landOwnerBusinessName:"+this.landOwnerBusinessName+",")
	.append(" landOwnerAddress:"+this.landOwnerAddress+",")
	.append("landOwnerCity :"+this.landOwnerCity+",")
	.append(" landOwnerState:"+this.landOwnerState+",")
        .append("landOwnerCountry :"+this.landOwnerCountry+",")
	.append("landOwnerZip :"+this.landOwnerZip+",")
	.append("landOwnerPhone :"+this.landOwnerPhone+",")
        .append("landOwnerFax :"+this.landOwnerFax+",")
        .append("landOwnerEmail :"+this.landOwnerEmail+",")
	.append("addDate :"+this.addDate+",")
	.append(" approvedBy:"+this.approvedBy+",")
	.append("approvedDate :"+this.approvedDate+",")
	.append("postingType :"+this.postingType+",")
	.append("requestStatus :"+this.requestStatus+",")
        .append(" comments:"+this.comments+",")
       .append("email :"+this.email+",")
        .append("MemberContactDetails"+ this.memberContactDetails+",");
  
  return buffer.toString();
  }
}

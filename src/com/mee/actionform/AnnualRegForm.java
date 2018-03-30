/*
 * AnnualRegForm.java
 *
 * Created on September 25, 2006, 10:15 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

/**
 *
 * @author harmohan
 */
public class AnnualRegForm {
	
	private String userId;
	private String hlcArea;
	private String badge;
	private String totalAmount;
	private String checkNo;
	private String checkDate;
	private String favorOf;
	private String cardNo;
	private String cardCvvNo;
	private String cardType;
	private String cardName;
	private String expiryMonth;
	private String expiryYear;
        private String regType;
        private String regMemberType;  
	private String[] meetingDates;
	private String[] memberTypes;
        private String[] activities;
	private String[] tickets;
        private String[] specIds;
        private String[] priceIds;

        
        public String[] getPriceIds() {
           return priceIds;
        }
        
       public void setPriceIds(String[] priceIds) {
		this.priceIds = priceIds;
	}
        
        
        public String getRegMemberType() {
           return regMemberType;
        }
      
	public String[] getMemberTypes() {
		return memberTypes;
	}
	public void setMemberTypes(String[] memberTypes) {
		this.memberTypes = memberTypes;
	}
	public String getBadge() {
		return badge;
	}
	public void setBadge(String badge) {
		this.badge = badge;
	}
	public String getCardCvvNo() {
		return cardCvvNo;
	}
	public void setCardCvvNo(String cardCvvNo) {
		this.cardCvvNo = cardCvvNo;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public String getCardType() {
		return cardType;
	}
	public void setCardType(String cardType) {
		this.cardType = cardType;
	}
	public String getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(String checkDate) {
		this.checkDate = checkDate;
	}
	public String getCheckNo() {
		return checkNo;
	}
	public void setCheckNo(String checkNo) {
		this.checkNo = checkNo;
	}
	public String getExpiryMonth() {
		return expiryMonth;
	}
	public void setExpiryMonth(String expiryMonth) {
		this.expiryMonth = expiryMonth;
	}
	public String getExpiryYear() {
		return expiryYear;
	}
	public void setExpiryYear(String expiryYear) {
		this.expiryYear = expiryYear;
	}
	public String getFavorOf() {
		return favorOf;
	}
	public void setFavorOf(String favorOf) {
		this.favorOf = favorOf;
	}
	public String[] getMeetingDates() {
		return meetingDates;
	}
	public void setMeetingDates(String[] meetingDates) {
		this.meetingDates = meetingDates;
	}

	public String[] getTickets() {
		return tickets;
	}
	public void setTickets(String[] tickets) {
		this.tickets = tickets;
	}
	public String getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}
	public String getUseaArea() {
		return hlcArea;
	}
	public void setUseaArea(String hlcArea) {
		this.hlcArea = hlcArea;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}

    public void setActivities(String[] activities) {
        this.activities = activities;
    }

    public String[] getActivities() {
        return activities;
    }

    public void setSpecIds(String[] specIds) {
        this.specIds = specIds;
    }

    public String[] getSpecIds() {
        return specIds;
    }

  
     public void reset(ActionMapping mapping, HttpServletRequest request) {
    	this. userId=null;
	this. hlcArea=null;
	this. badge=null;
	this. totalAmount=null;
	this. checkNo=null;
	this. checkDate=null;
	this. favorOf=null;
	this. cardNo=null;
	this. cardCvvNo=null;
	this. cardType=null;
	this. cardName=null;
	this. expiryMonth=null;
	this. expiryYear=null;
       this. regType=null;
       this. regMemberType=null;  
	this. meetingDates=null;
	this. memberTypes=null;
       this. activities=null;
	this. tickets=null;
       this. specIds=null;
       this. priceIds=null;
    }

 public String toString(){
     
   StringBuffer buffer = new StringBuffer()
   	.append(" userId :"+ userId+"\t\t")
	.append(" hlcArea :"+ hlcArea+"\t\t")
	.append(" badge :"+ badge+"\t\t")
	.append(" priceIds :"+getAsString(priceIds)+"\t\t")
	.append(" meetingDates :"+getAsString(meetingDates)+"\t\t")
	.append(" memberTypes :"+getAsString(memberTypes)+"\t\t")
        .append(" activities :"+getAsString(activities)+"\t\t")
	.append(" tickets :"+getAsString(tickets)+"\t\t")
        .append(" specIds :"+getAsString(specIds)+"\t\t")
	.append(" totalAmount :"+ totalAmount+"\t\t")
	.append(" checkNo :"+ checkNo+"\t\t")
	.append(" checkDate :"+ checkDate+"\t\t")
	.append(" favorOf :"+ favorOf+"\t\t")
	.append(" cardNo :"+ cardNo+"\t\t")
	.append(" cardCvvNo :"+ cardCvvNo+"\t\t")
	.append(" cardType :"+ cardType+"\t\t")
	.append(" cardName :"+ cardName+"\t\t")
	.append(" expiryMonth :"+ expiryMonth+"\t\t")
	.append(" expiryYear :"+ expiryYear+"\t\t");
  return buffer.toString();
  }
     
     
    private String getAsString(String[] arr)  {
           if(arr==null)
               return null;       
         StringBuffer buffer = new StringBuffer();
         int len =  (arr.length-1);
         for (int i = 0; i < len; i++) {
             buffer.append(arr[i]+",");
         }
         if(arr.length>0)
            buffer.append(arr[arr.length-1]); 
         //buffer.append();
      return buffer.toString();
    }

    public void setRegType(String regType) { this.regType = regType; }
    public String getRegType() { return regType; }
    public void setRegMemberType(String regMemberType) { this.regMemberType = regMemberType; }

}


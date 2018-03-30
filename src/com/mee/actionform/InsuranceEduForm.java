/*
 * InsuranceEduForm.java
 *
 * Created on September 20, 2006, 1:42 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.actionform;

import org.apache.struts.action.ActionForm;

/**
 *
 * @author Shiva Kumar Subbiaha
 */

public class InsuranceEduForm {
    private String orgMeetingId;
    private String activityName;
    private String hlcArea;
    private String dateHeld;
    private String location;
    private String state;
    private String memberId; 
    private String participantName; 
    private String address;
    private String country;
    private String participantState;
    private String city;
    private String zipcode;
    private String fax;
    private String emailId;
    private String horseNo;
    private String ridingLevel;
    private boolean isUseaMember;
    private String memberShipNo;
    
    
    public String getActivityName() {
        return activityName;
    }
    
    public String getAddress() {
        return address;
    }
    
    public String getCity() {
        return city;
    }
    
    public String getCountry() {
        return country;
    }
    
    public String getDateHeld() {
        return dateHeld;
    }
    
    public String getEmailId() {
        return emailId;
    }
    
    public String getFax() {
        return fax;
    }
    
    public String getHorseNo() {
        return horseNo;
    }
    
    public boolean isUseaMember() {
        return isUseaMember;
    }
    
    public String getLocation() {
        return location;
    }
    
    public String getMemberId() {
        return memberId;
    }
    
    public String getMemberShipNo() {
        return memberShipNo;
    }
    
    public String getParticipantName() {
        return participantName;
    }
    
    public String getParticipantState() {
        return participantState;
    }
    
    public String getRidingLevel() {
        return ridingLevel;
    }
    
    public String getState() {
        return state;
    }
    
    public String getUseaArea() {
        return hlcArea;
    }
    
    public String getZipcode() {
        return zipcode;
    }
    
    public void setActivityName(String activityName) {
        this.activityName = activityName;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    
    public void setCity(String city) {
        this.city = city;
    }
    
    public void setCountry(String country) {
        this.country = country;
    }
    
    public void setDateHeld(String dateHeld) {
        this.dateHeld = dateHeld;
    }
    
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }
    
    public void setFax(String fax) {
        this.fax = fax;
    }
    
    public void setHorseNo(String horseNo) {
        this.horseNo = horseNo;
    }
    
    public void setIsUseaMember(boolean isUseaMember) {
        this.isUseaMember = isUseaMember;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    public void setMemberId(String memberId) {
        this.memberId = memberId;
    }
    
    public void setMemberShipNo(String memberShipNo) {
        this.memberShipNo = memberShipNo;
    }
    
    public void setParticipantName(String participantName) {
        this.participantName = participantName;
    }
    
    public void setParticipantState(String participantState) {
        this.participantState = participantState;
    }
    
    public void setRidingLevel(String ridingLevel) {
        this.ridingLevel = ridingLevel;
    }
    
    public void setState(String state) {
        this.state = state;
    }
    
    public void setUseaArea(String hlcArea) {
        this.hlcArea = hlcArea;
    }
    
    public void setZipcode(String zipcode) {
        this.zipcode = zipcode;
    }
     public String getOrgMeetingId() {
        return orgMeetingId;
    }

    public void setOrgMeetingId(String orgMeetingId) {
        this.orgMeetingId = orgMeetingId;
    }
    
     public String toString(){
  
   StringBuffer buffer = new StringBuffer()
   .append("Activity Name="+this. activityName+"\n")
    .append(" HLC Area ="+this. hlcArea+"\n")
    .append(" Date held ="+this. dateHeld+"\n")
    .append(" Location ="+this. location+"\n")
    .append(" state = "+this. state+"\n")
    .append(" memberId= "+this. memberId+"\n") 
    .append(" participant Name:"+this. participantName+"\n") 
    .append(" Address :"+this. address+"\n")
    .append(" country:"+this. country+"\n")
    .append(" parState:"+this. participantState+"\n")
    .append(" city = "+this. city+"\n")
    .append(" zipcode="+this. zipcode+"\n")
    .append(" fax="+this. fax+"\n")
    .append(" emailId"+this. emailId+"\n")
    .append(" horseNo="+this. horseNo+"\n")
    .append(" ridingLevel="+this. ridingLevel+"\n")
    .append(" isUseaMember ="+isUseaMember+"\n")
    .append(" MEmberShipNo="+this. memberShipNo+"\n")
    .append(" orgMeetingId="+this.orgMeetingId+"\n");
  return buffer.toString();
  }

   
    
}

/*
 * HLCContactDetails.java
 *
 * Created on August 24, 2006, 12:54 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.actionform;
import java.io.*;
import java.util.*;
/**
 *
 * @author harmohan
 */
public class MemberContactDetails implements Serializable {
private String contactId;
private String contactType;
private String contactTypeId;
private String userId;
private String suite;
private String address1;
private String address2;
private String city;
private String state;
private String country;
private String zip;
private String phoneNo;
private String mobileNo;
private String faxNo;
private String firstName;
private String lastName;
private String middleName;
private String emailId;
    
    /** Creates a new instance of HLCContactDetails */
    public MemberContactDetails() {
    }
    


    public String getContactId(){return contactId;}
    public String getContactType(){return contactType; }
    public String getContactTypeId(){return contactTypeId;}
    public String getUserId(){return userId;}
    public String getSuite(){return suite; }
    public String getAddress1(){return address1;}
    public String getAddress2(){return address2;}
    public String getCity(){return city;}
    public String getState(){return state;}
    public String getCountry(){return country;}
    public String getZip(){return zip;}
    public String getPhoneNo(){return phoneNo;}
    public String getMobileNo(){return mobileNo;}
    public String getFaxNo(){return faxNo;}

    public void setContactId(String contactId){this.contactId=contactId;}
    public void setContactType(String contactType){this.contactType = contactType; }
    public void setContactTypeId(String contactTypeId){this.contactTypeId=contactTypeId;}
    public void setUserId(String userId){this.userId=userId;}
    public void setSuite(String suite){this.suite=suite;}
    public void setAddress1(String address1){this.address1=address1;}
    public void setAddress2(String address2){this.address2=address2;}
    public void setCity(String city){this.city=city;}
    public void setState(String state){this.state=state;}
    public void setCountry(String country){this.country=country;}
    public void setZip(String zip){this.zip=zip;}
    public void setPhoneNo(String phoneNo){this.phoneNo=phoneNo;}
    public void setMobileNo(String mobileNo){this.mobileNo=mobileNo;}
    public void setFaxNo(String faxNo){this.faxNo=faxNo;}

    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public String getMiddleName() { return middleName;  }
    public void setFirstName(String firstName) { this.firstName = firstName; }
    public void setLastName(String lastName) { this.lastName = lastName; }
    public void setMiddleName(String middleName) { this.middleName = middleName; }
    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getEmailId() {
        return emailId;
    }



}

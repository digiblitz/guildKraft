/*
 * EventEntryPaymentForm.java
 *
 * Created on November 23, 2007, 12:53 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.oee.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author Ellamaran
 */
public class EventEntryPaymentForm extends org.apache.struts.action.ActionForm {
    
    /** Creates a new instance of EventEntryPaymentForm */
    public EventEntryPaymentForm() {
        super();
    }
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
    private String totalAmount;
    private String insertProcess;
    private String paymentDate;
    private String paymentStatus;
    private String r11;
    
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
    public String getTotalAmount() {
        return totalAmount;
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
    public void setTotalAmount(String totalAmount) {
        this.totalAmount = totalAmount;
    }
    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }
    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }
    public String getNameCheck() {
        return nameCheck;
    }
    
    public void setNameCheck(String nameCheck) {
        this.nameCheck = nameCheck;
    }
    
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.ccName=null;
        this.ccType=null;
        this.ccNumber=null;
        this.ccExpMonth=null;
        this.ccExpYear=null;
        this.ccCvvid=null;
        this.bankName=null;
        this.nameCheck=null;
        this.checkDate=null;
        this.checkNumber=null;
        this.totalAmount=null;
        this.insertProcess=null;
        this.paymentDate=null;
        this.paymentStatus=null;
        this.r11=null;
    }
    public String toString(){
        
        StringBuffer buffer = new StringBuffer()
        
        .append(" ccName :"+ ccName+"\n")
        .append(" ccType :"+ ccType+"\n")
        .append(" ccNumber :"+ ccNumber+"\n")
        .append(" ccExpMonth :"+ ccExpMonth+"\n")
        .append(" ccExpYear :"+ ccExpYear+"\n")
        .append(" ccCvvid :"+ ccCvvid+"\n")
        .append(" nameCheck :"+ nameCheck+"\n")
        .append(" bankName :"+ bankName+"\n")
        .append(" checkDate :"+ checkDate+"\n")
        .append(" checkNumber :"+ checkNumber+"\n")
        .append(" totalAmount :"+ totalAmount+"\n");
        
        return buffer.toString();
    }
}

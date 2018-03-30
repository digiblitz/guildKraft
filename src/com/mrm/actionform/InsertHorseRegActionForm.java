/*
 * InsertHorseRegActionForm.java
 *
 * Created on August 22, 2006, 8:54 PM
 */

package com.mrm.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;


public class InsertHorseRegActionForm {
    
private String feeDisp;
private String fee_txt;
private String changed;
private String classification;
private String horseName;
private String registeredName;
private String breedAssoc;
private String pastName;
private String hlcNo;
private String rName;
private String rStreet;
private String rselect;
private String rCity;
private String rState;
private String rZipcode;
private String rPhone;
private String rCell;
private String rEmail;
private String previousRider;
private String PrhlcNo;
private String additionalRider;
private String ArhlcNo;
private String regFor;
private String addRStreet;
private String addRCity;
private String addRState;
private String addRZipcode;
private String addRPhone;
private String addRCell;
private String addREmail;

private String oName;
private String oStreet;
private String oselect;
private String oCity;
private String oState;
private String oZipcode;
private String oPhone;
private String oCell;
private String oEmail;
private String additionalOwner;


private String previousOwner;
private String colorselect;
private String genderselect;
private String height;
private String yearfoaled;
private String breed;
private String breedTwo;
private String countryOrigin;
private String sireName;
private String sireBreed;
private String sireBreedTwo;
private String damName;
private String damBreed;
private String damBreedTwo;
private String importedFrom;
private String foreignPoints;
private String foreignGrade;
private String assignedPoints;
private String assignedGrade;
private String dateImported;
private String notes;
private String specialNotes;
private String phoneCharge;

 


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

 
public String getSireBreedTwo() {
    return sireBreedTwo;
}
public String getSpecialNotes() {
    return specialNotes;
} 
public String getBreedTwo() {
    return breedTwo;
}
  public String getDamBreedTwo() {
    return damBreedTwo;
}

public String getNotes() {
    return notes;
}

public String getColorselect() {
    return colorselect;
}

public String getFeeDisp(){
    return feeDisp;
}
public String getFee_txt(){
    return fee_txt;
}
public String getChanged(){
    return changed;
}
public String getClassification(){
    return classification;
}
public String getHorseName(){
    return horseName;
}
public String getRegisteredName(){
    return registeredName;
}
public String getBreedAssoc(){
    return breedAssoc;
}
public String getPastName(){
    return pastName;
}
public String getUseaNo(){
    return hlcNo;
}
public String getRName(){
    return rName;
}
public String getRStreet(){
    return rStreet;
}
public String getRselect(){
    return rselect ;
}
public String getRCity(){
    return rCity;
}
public String getRState(){
    return rState;
}
public String getRZipcode(){
    return rZipcode;
}
public String getRPhone(){
    return rPhone;
}
public String getRCell(){
    return rCell;
}
public String getREmail(){
    return rEmail;
}
public String getPreviousRider(){
    return previousRider;
}
public String getPrhlcNo(){
    return PrhlcNo;
}
public String getAdditionalRider(){
    return additionalRider;
}
public String getArhlcNo(){
    return ArhlcNo ;
}
public String getOName(){
    return oName;
}
public String getOStreet(){
    return oStreet;
}
public String getOselect(){
    return oselect ;
}
public String getOCity(){
    return oCity;
}
public String getOState(){
    return oState;
}
public String getOZipcode(){
    return oZipcode;
}
public String getOPhone(){
    return oPhone;
}
public String getOCell(){
    return oCell;
}
public String getOEmail(){
    return oEmail;
}
public String getAdditionalOwner(){
    return additionalOwner;
}
public String getPreviousOwner(){
    return previousOwner;
}
public String getColorSelect(){
    return colorselect;
}
public String getGenderselect(){
    return genderselect;
}
public String getHeight(){
    return height;
}
public String getYearfoaled(){
    return yearfoaled;
}
public String getBreed(){
    return breed;
}
public String getCountryOrigin(){
    return countryOrigin ;
}
public String getSireName(){
    return sireName;
}
public String getSireBreed(){
    return sireBreed;
}
public String getDamName(){
    return damName;
}
public String getDamBreed(){
    return damBreed;
}
 public String getImportedFrom(){
    return importedFrom;
} 
public String getForeignPoints(){
    return foreignPoints;
}
public String getAssignedPoints(){
    return assignedPoints ;
}
public String getForeignGrade(){
    return foreignGrade;
}
public String getAssignedGrade(){
    return assignedGrade;
}
public String getDateImported(){
    return dateImported;
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
public String getTotalAmount() {
    return totalAmount;
}
public String getPaymentDate() {
    return paymentDate;
}
public String getPaymentStatus() {
    return paymentStatus;
} 
public String getAddRCell() {
    return addRCell;
}

public String getAddRCity() {
    return addRCity;
}

public String getAddREmail() {
    return addREmail;
}

public String getAddRPhone() {
    return addRPhone;
}

public String getAddRState() {
    return addRState;
}

public String getAddRStreet() {
    return addRStreet;
}

public String getAddRZipcode() {
    return addRZipcode;
}
  

//==========================================Setter Methods=======================================
public void setFeeDisp(String  feeDisp){
    this.feeDisp =feeDisp ;
}
public void setFee_tx(String fee_txt ){
    this.fee_txt = fee_txt;
}
public void setChanged(String  changed){
    this.changed =changed ;
}
public void setClassification(String classification  ){
    this.classification =classification ;
}
public void setHorseName(String horseName ){
    this.horseName =horseName ;
}
public void setRegisteredName(String registeredName ){
    this.registeredName =registeredName ;
}
public void setBreedAssoc(String  breedAssoc){
    this.breedAssoc = breedAssoc;
}
public void setPastName(String pastName ){
    this.pastName = pastName;
}
public void setUseaNo(String hlcNo){
    this.hlcNo= hlcNo ;
}
public void setRName(String rName  ){
    this.rName =rName ;
}
public void setRStreet(String  rStreet){
    this.rStreet =rStreet ;
}
public void setRselect(String rselect ){
    this.rselect=rselect ;
}
public void setRCity(String rCity ){
    this.rCity  =rCity ;
}
public void setRState(String rState ){
    this.rState =rState ;
}
public void setRZipcode(String rZipcode ){
    this.rZipcode  = rZipcode;
}
public void setRPhone(String rPhone ){
    this.rPhone =rPhone ;
}
public void setRCell(String rCell ){
    this.rCell = rCell;
}
public void setREmail(String  rEmail){
    this.rEmail =rEmail ;
}
public void setPreviousRider(String previousRider ){
    this.previousRider  =previousRider ;
}
public void setPrhlcNo(String PrhlcNo  ){
    this.PrhlcNo  =PrhlcNo ;
}
public void setAdditionalRider(String additionalRider ){
    this.additionalRider = additionalRider;
}
public void setArhlcNo(String ArhlcNo ){
    this.ArhlcNo  =ArhlcNo ;
}
public void setOName(String  oName){ 
    this.oName =oName ;
}
public void setOStreet(String oStreet ){
    this.oStreet  =oStreet ;
}
public void setOselect(String oselect ){
    this.oselect =oselect ;
}
public void setOCity(String oCity ){
    this.oCity =oCity ;
}
public void setOState(String oState ){
    this.oState =oState ;
}
public void setOZipcode(String  oZipcode){
    this.oZipcode  =oZipcode ;
}
public void setOPhone(String oPhone ){
    this.oPhone = oPhone;
}
public void setOCell(String oCell ){
    this.oCell  = oCell;
}
public void setOEmail(String oEmail ){
    this.oEmail  = oEmail;
}
public void setAdditionalOwner(String additionalOwner ){
    this.additionalOwner  =additionalOwner ;
}
public void setPreviousOwner(String previousOwner ){
    this.previousOwner  =previousOwner ;
}
public void setColorselect(String colorselect ){
    this.colorselect = colorselect;
}
public void setGenderselect(String genderselect ){
    this.genderselect = genderselect;
}
 
public void setYearfoaled(String yearfoaled ){
    this.yearfoaled  =yearfoaled ;
}
public void setBreed(String breed ){
    this.breed  = breed;
}
public void setCountryOrigin(String countryOrigin  ){
    this.countryOrigin = countryOrigin;
}
public void setSireName(String  sireName){
    this.sireName =sireName ;
}
public void setSireBreed(String  sireBreed){
    this.sireBreed = sireBreed;
}
public void setDamName(String damName ){
    this.damName =damName ;
}
public void setDamBreed(String damBreed  ){
    this.damBreed  =damBreed ;
}
 public void setImportedFrom(String importedFrom ){
    this.importedFrom =importedFrom ;
} 
public void setForeignPoints(String  foreignPoints){
    this.foreignPoints  = foreignPoints;
}
public void setAssignedPoints(String assignedPoints ){
    this.assignedPoints  = assignedPoints;
}
public void setForeignGrade(String foreignGrade ){
    this.foreignGrade = foreignGrade;
}
public void setAssignedGrade(String assignedGrade ){
    this.assignedGrade  =assignedGrade ;
}
public void setDateImported(String  dateImported){
    this.dateImported  = dateImported;
}
public void setFee_txt(String fee_txt) {
    this.fee_txt = fee_txt;
}
    public void setPhoneCharge(String phoneCharge) {
        this.phoneCharge = phoneCharge;
    }

    public String getPhoneCharge() {
        return phoneCharge;
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
         
  

    public void setAddRCell(String addRCell) {
        this.addRCell = addRCell;
    }

    public void setAddRCity(String addRCity) {
        this.addRCity = addRCity;
    }

    public void setAddREmail(String addREmail) {
        this.addREmail = addREmail;
    }

    public void setAddRPhone(String addRPhone) {
        this.addRPhone = addRPhone;
    }

    public void setAddRState(String addRState) {
        this.addRState = addRState;
    }

    public void setAddRStreet(String addRStreet) {
        this.addRStreet = addRStreet;
    }

    public void setAddRZipcode(String addRZipcode) {
        this.addRZipcode = addRZipcode;
    }
    public void setHeight(String height) {
        this.height = height;
    }
     public void setNotes(String notes) {
        this.notes = notes;
    }

    public void setBreedTwo(String breedTwo) {
        this.breedTwo = breedTwo;
    }
    public void setSpecialNotes(String specialNotes) {
        this.specialNotes = specialNotes;
    }

     public void setSireBreedTwo(String sireBreedTwo) {
        this.sireBreedTwo = sireBreedTwo;
    }
 
    public void setDamBreedTwo(String damBreedTwo) {
        this.damBreedTwo = damBreedTwo;
    }
 public void reset(ActionMapping mapping, HttpServletRequest request) {
this.feeDisp=null;
this.fee_txt=null;
this.changed=null;
this.classification=null;
this.horseName=null;
this.registeredName=null;
this.breedAssoc=null;
this.pastName=null;
this.hlcNo=null;
this.rName=null;
this.rStreet=null;
this.rselect=null;
this.rCity=null;
this.rState=null;
this.rZipcode=null;
this.rPhone=null;
this.rCell=null;
this.rEmail=null;
this.previousRider=null;
this.PrhlcNo=null;
this.additionalRider=null;
this.ArhlcNo=null;
this.addRStreet=null;
this.addRCity=null;
this.addRState=null;
this.addRZipcode=null;
this.addRPhone=null;
this.addRCell=null;
this.addREmail=null;

this.oName=null;
this.oStreet=null;
this.oselect=null;
this.oCity=null;
this.oState=null;
this.oZipcode=null;
this.oPhone=null;
this.oCell=null;
this.oEmail=null;
this.additionalOwner=null;
this.previousOwner=null;
this.colorselect=null;
this.genderselect=null;
this.height=null;
this.yearfoaled=null;
this.breed=null;
this.countryOrigin=null;
this.sireName=null;
this.sireBreed=null;
this.damName=null;
this.damBreed=null;
this.importedFrom=null;
this.foreignPoints=null;
this.assignedPoints=null;
this.foreignGrade=null;
this.assignedGrade=null;
this.dateImported=null; 
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
this. totalAmount=null;
this.insertProcess=null;
this.paymentDate=null;
this.paymentStatus=null;
this.r11=null;
this.sireBreedTwo=null;
this.damBreedTwo=null;
this.notes=null;
this.specialNotes=null;
this.phoneCharge=null;
 
}
  public String toString(){
     
   StringBuffer buffer = new StringBuffer()
 
   	 
        .append(" feeDisp :"+ feeDisp+"\n")
	.append(" fee_txt :"+ fee_txt+"\n")
	.append(" changed :"+ changed+"\n")
	.append(" classification :"+ classification+"\n")
	.append(" horseName :"+ horseName+"\n")
	.append(" registeredName :"+ registeredName+"\n")
	.append(" breedAssoc :"+ breedAssoc+"\n")
        .append(" pastName :"+ pastName+"\n")
	.append(" hlcNo :"+ hlcNo+"\n")
	.append(" rName :"+ rName+"\n")
        .append(" rStreet :"+ rStreet+"\n")
	.append(" rselect :"+ rselect+"\n")
	.append(" rCity :"+ rCity+"\n")
	.append(" rState :"+ rState+"\n")
        .append(" rZipcode :"+ rZipcode+"\n")
     	.append(" rPhone :"+ rPhone+"\n")
	.append(" rCell :"+ rCell+"\n")
	.append(" rEmail :"+ rEmail+"\n")
        .append(" damBreedTwo :"+ damBreedTwo+"\n")
	.append(" sireBreedTwo :"+ sireBreedTwo+"\n")
	.append(" specialNotes :"+ specialNotes+"\n")
        .append(" notes :"+ notes+"\n")
        
        .append(" previousRider :"+ previousRider+"\n")
	.append(" PrhlcNo :"+ PrhlcNo+"\n")
	.append(" additionalRider :"+ additionalRider+"\n")
        .append(" ArhlcNo :"+ ArhlcNo+"\n")
        .append(" addRStreet :"+ addRStreet+"\n")
        .append(" addRCity :"+ addRCity+"\n")
	.append(" addRState :"+ addRState+"\n")
	.append(" addRZipcode :"+ addRZipcode+"\n")
	.append(" rState :"+ rState+"\n")
        .append(" addRPhone :"+ addRPhone+"\n")
     	.append(" rPhone :"+ rPhone+"\n")
	.append(" addRCell :"+ addRCell+"\n")
	.append(" addREmail :"+ addREmail+"\n")
        .append(" phoneCharge :"+ phoneCharge+"\n")
        .append(" additionalOwner :"+ additionalOwner+"\n")
	.append(" previousOwner :"+ previousOwner+"\n")
	.append(" colorselect :"+ colorselect+"\n")
	.append(" genderselect :"+ genderselect+"\n")
	.append(" height :"+ height+"\n")
	.append(" yearfoaled :"+ yearfoaled+"\n")
	.append(" breed :"+ breed+"\n")
        .append(" countryOrigin :"+ countryOrigin+"\n")
	.append(" sireName :"+ sireName+"\n")
	.append(" sireBreed :"+ sireBreed+"\n")
        .append(" damName :"+ damName+"\n")
	.append(" damBreed :"+ damBreed+"\n")
        .append(" importedFrom :"+ importedFrom+"\n")
	.append(" foreignPoints :"+ foreignPoints+"\n")
	.append(" assignedPoints :"+ assignedPoints+"\n")
	.append(" genderselect :"+ genderselect+"\n")
	.append(" foreignGrade :"+ foreignGrade+"\n")
	.append(" assignedGrade :"+ assignedGrade+"\n")
	.append(" dateImported :"+ dateImported+"\n")
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
    

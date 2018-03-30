/*
 * AnnualRegActionForm.java
 *
 * Created on November 2, 2006, 8:13 PM
 */

package com.mee.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

/**
 *
 * @author punitha
 * @version
 */

public class AnnualRegActionForm {
   
    public AnnualRegActionForm() {
        super();
      // TODO Auto-generated constructor stub
    }
    private String userName;
    private String uName;
    private String fName;
    private String lName;
    private String firstName;
    private String lastName;
    private String newFirstName;
    private String newLastName;
    private String newBirthmonth;
    private String newBirthday;
    private String newBirthyear;
    private String sex;
    private String newEmail;
    private String newPhone;
    private String mobileNo;
    private String newFax;
    private String newAddress;
    private String newCity;
    private String newState;
    private String newCountry;
    private String newZip;
    private String membershipTypeId;
    
    private String newBadge;

   
    private String newRegTypeId;
    private double regAmount;

    private String pclub;
    private String newClub;
    private String newClubName;

    private String accom;
    private String accomodation;

    private boolean memberstat;
    private boolean juniorMember;
    private boolean nonMember;
    private double activityAmount;
    private String[] meetingDates;
   // private String[] actCheckBox;
   // private String[] tickets;
   // private String[] specIds;
    private String[] priceIds;
    private String userId;
    private String dob;
    private String age;
    private String regPriceId;
    private String areaIv;
    private String luncheon;
    private String fameDinner;
   
    private String memberName;

   // public String[] getActCheckBox() {
    //  return actCheckBox;
  //  }

   // public void setActCheckBox(String[] actCheckBox) {
     //   this.actCheckBox = actCheckBox;
   // }
     public String getMembershipTypeId() {
        return membershipTypeId;
    }

    public void setMembershipTypeId(String membershipTypeId) {
        this.membershipTypeId = membershipTypeId;
    }
     public boolean isJuniorMember() {
            return juniorMember;
        }

        public boolean isMemberstat() {
            return memberstat;
        }

        public boolean isNonMember() {
            return nonMember;
        }

    public String getUName() {
        return uName;
    }
    public String[] getMeetingDates() {
		return meetingDates;
	}
    public String getUserName() {
        return userName;
    }
        public String getNewFirstName() {
        return newFirstName;
        }

        public String getNewLastName() {
             return newLastName;
        }
        public String getSex() {
            return sex;
        }
        public String getNewBirthmonth() {
            return newBirthmonth;
        }
        public String getNewBirthday() {
            return newBirthday;
        }
        public String getNewBirthyear() {
             return newBirthyear;
        }
        public String getNewAddress() {
        return newAddress;
        }
        public String getNewCity() {
            return newCity;
        }
        public String getNewCountry() {
            return newCountry;
        }
        public String getNewState() {
            return newState;
        }
        public String getNewZip() {
            return newZip;
        }
        public String getNewEmail() {
            return newEmail;
        }
        public String getNewPhone() {
            return newPhone;
        }
        public String getNewFax() {
            return newFax;
        }
        public String getNewBadge() {
             return newBadge;
        }
        public String getNewRegTypeId() {
             return newRegTypeId;
        }
        public double getRegAmount() {
             return regAmount;
        }

        public String getPclub() {
             return pclub;
        }
 
     /*   public String[] getActCheckBox() {
            return actCheckBox;
        }*/
 
        public String getNewClub() {
            return newClub;
        }
        public String getNewClubName() {
            return newClubName;
        }
        public String getAccom() {
            return accom;
        }

        public String getAccomodation() {
            return accomodation;
        }
      public double getActivityAmount() {
            return activityAmount;
        }

    public String getUserId() {
        return userId;
    }
    public String getAge() {
        return age;
    }

    public String getDob() {
        return dob;
    }

    public String getMemberName() {
        return memberName;
    }
      public String getRegPriceId() {
        return regPriceId;
    }

    public String getFameDinner() {
        return fameDinner;
    }

    public String getLuncheon() {
        return luncheon;
    }
    public String getAreaIv() {
        return areaIv;
    }
 
//-------------------------------------setter methods-----------------------------------------------
  public void setMeetingDates(String[] meetingDates) {
		this.meetingDates = meetingDates;
	}
  public void setActivityAmount(double activityAmount) {
        this.activityAmount = activityAmount;
    }
    public void setJuniorMember(boolean juniorMember) {
        this.juniorMember = juniorMember;
    }

    public void setMemberstat(boolean memberstat) {
        this.memberstat = memberstat;
    }
     public void setNonMember(boolean nonMember) {
        this.nonMember = nonMember;
    }
     
    
    public void setUName(String uName) {
        this.uName = uName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    } 
     public void setNewFirstName(String newFirstName) {
        this.newFirstName = newFirstName;
    }

    public void setNewLastName(String newLastName) {
        this.newLastName = newLastName;
    }
    
    public void setSex(String sex) {
        this.sex = sex;
    }
    public void setNewBirthday(String newBirthday) {
        this.newBirthday = newBirthday;
    }

    public void setNewBirthmonth(String newBirthmonth) {
        this.newBirthmonth = newBirthmonth;
    }

    public void setNewBirthyear(String newBirthyear) {
        this.newBirthyear = newBirthyear;
    }

    public void setNewCity(String newCity) {
        this.newCity = newCity;
    }
    
    public void setNewAddress(String newAddress) {
        this.newAddress = newAddress;
    }
    public void setNewCountry(String newCountry) {
        this.newCountry = newCountry;
    }
    
    public void setNewState(String newState) {
        this.newState = newState;
    }
    public void setNewZip(String newZip) {
        this.newZip = newZip;
    }
    public void setNewEmail(String newEmail) {
        this.newEmail = newEmail;
    }

    public void setNewFax(String newFax) {
        this.newFax = newFax;
    }

    public void setNewPhone(String newPhone) {
        this.newPhone = newPhone;
    }

    public void setNewBadge(String newBadge) {
        this.newBadge = newBadge;
    }
    public void setNewClub(String newClub) {
        this.newClub = newClub;
    }
    public void setPclub(String pclub) {
        this.pclub = pclub;
    }
    public void setNewClubName(String newClubName) {
        this.newClubName = newClubName;
    }
    public void setRegAmount(double regAmount) {
        this.regAmount = regAmount;
    }
     public void setNewRegTypeId(String newRegTypeId) {
        this.newRegTypeId = newRegTypeId;
    }
     
    public void setAccom(String accom) {
        this.accom = accom;
    }

    public void setAccomodation(String accomodation) {
        this.accomodation = accomodation;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }


    public void setAge(String age) {
        this.age = age;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    
        public String[] getPriceIds() {
           return priceIds;
        }
 
       public void setPriceIds(String[] priceIds) {
		this.priceIds = priceIds;
	}
     public void setAreaIv(String areaIv) {
        this.areaIv = areaIv;
    }
     public void setRegPriceId(String regPriceId) {
        this.regPriceId = regPriceId;
    }

    public void setFameDinner(String fameDinner) {
        this.fameDinner = fameDinner;
    }

    public void setLuncheon(String luncheon) {
        this.luncheon = luncheon;
    }
   /* public void setActCheckBox(String[] actCheckBox) {
        this.actCheckBox = actCheckBox;
    }*/
     public void setFName(String fName) {
        this.fName = fName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getFName() {
        return fName;
    }
    public String getLName() {
        return lName;
    }
   public void setLName(String lName) {
        this.lName = lName;
    } 
    
    
    public String getFirstName() {
        return firstName;
    }
    public String getLastName() {
        return lastName;
    }

  
    
    

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    
//===========================================================
      
    
            

     public void reset(ActionMapping mapping, HttpServletRequest request) {
        this.fName=null;
        this.lName=null;
        this.firstName=null;
        this.lastName=null;
        this.newFirstName=null;
        this.userName=null;
        this.uName=null;
        this.newLastName=null;
        this.newBirthmonth=null;
        this.newBirthday=null;
        this.newBirthyear=null;
        this.sex=null;
        this.newEmail=null;
        this.newPhone=null;
        this.mobileNo=null;
        this.newFax=null;
        this.newAddress=null;
        this.newCity=null;
        this.newState=null;
        this.newCountry=null;
        this.newZip=null;
        this.newBadge=null;
        this.newRegTypeId=null;
        this.activityAmount=0;
        this.regAmount=0;
        this.pclub=null;
        this.newClub=null;
        this.newClubName=null;
        this.accom=null;
        this.accomodation=null;
      //  this.actCheckBox=null;
        this.juniorMember=false;
        this.memberstat=false;
        this. meetingDates=null;
       // this. tickets=null;
       // this. specIds=null;
        this. priceIds=null;
        this.userId=null;
        this.dob=null;
        this.age=null;
        this.regPriceId=null;
        this.areaIv=null;
        this.luncheon=null;
        this.fameDinner=null;
        this.memberName=null;
    }

 public String toString(){
   
   StringBuffer buffer = new StringBuffer()
            .append(" userId :"+ userId+"\t")
            .append(" dob :"+ dob+"\t")
            .append(" age :"+ age+"\t")
            .append(" priceIds :"+getAsString(priceIds)+"\t\t")
            .append(" fName :"+ fName+"\t")
            .append(" lName :"+ lName+"\t")
            .append(" firstName :"+ firstName+"\t")
            .append(" lastName :"+lastName+"\t\t")
            .append(" meetingDates :"+getAsString(meetingDates)+"\t\t")
            .append(" memberName :"+ memberName +"\t")
            .append(" newFirstName :"+ newFirstName+"\t")
            .append(" newLastName :"+ newLastName+"\t")
            .append(" newBirthmonth :"+ newBirthmonth+"\t")
            .append(" newBirthday :"+ newBirthday +"\t")
            .append(" newBirthyear :"+ newBirthyear +"\t")
            .append(" sex :"+ sex+"\t")
            .append(" newAddress :"+ newAddress+"\t")
            .append(" newCity :"+ newCity+"\t")
            .append(" newCountry :"+ newCountry+"\t")
            .append(" newState :"+ newState+"\t")
            .append(" newZip :"+ newZip+"\t")
            .append(" newEmail :"+ newEmail+"\t")
            .append(" newPhone :"+ newPhone+"\t")
            .append(" newFax :"+ newFax+"\t")
            .append(" pclub :"+ pclub+"\t")
            .append(" newClub :"+ newClub+"\t")
            .append(" newClubName :"+ newClubName+"\t")
            .append(" newBadge :"+ newBadge+"\t")
            .append(" newRegTypeId :"+ newRegTypeId+"\t")
            .append(" regAmount :"+ regAmount+"\t")
            .append(" regPriceId :"+ regPriceId+"\t")
            .append(" areaIv :"+ areaIv+"\t")
            .append(" luncheon :"+ luncheon+"\t")
            .append(" fameDinner :"+ fameDinner+"\t")
            .append("activityAmount :"+ activityAmount+"\t")

            .append(" accom :"+ accom+"\t")
            .append(" accomodation :"+ accomodation+"\t\t");

	
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

   
}


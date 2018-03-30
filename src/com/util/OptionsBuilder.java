/*
 * OptionsBuilder.java
 *
 * Created on September 6, 2006, 8:57 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.util;

import java.util.Iterator;
import java.util.List;
import java.util.*;

/**
 *
 * @author punitha
 */
public class OptionsBuilder {
    
    /** Creates a new instance of OptionsBuilder */
    public OptionsBuilder() {
    }
	private String encoding = "UTF-8";

	public String getContent(Vector vec) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
		xml.append("<options>\n");
                xml.append(getEntry(vec));
		xml.append("</options>");
		
		return xml.toString();
	}
        public String getMemberContent(ArrayList vec) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
		xml.append("<options>\n");
                xml.append(getMemberEntry(vec));
		xml.append("</options>");
		
		return xml.toString();
	}
        
        
        public String getAmountContent(float amount) {
            int count = 0;

            StringBuffer xml = new StringBuffer();
            xml.append("<?xml version=\"1.0\"");
            if(encoding != null) {
                    xml.append(" encoding=\"");
                    xml.append(encoding);
                    xml.append("\"");
            }
            xml.append(" ?>\n");
            xml.append("<amounts>\n");
            xml.append("<price>\n");
            xml.append(amount);
            xml.append("</price>\n");
            xml.append("</amounts>");

            return xml.toString();
        }
        
        public String getIssueContent(Vector issueType,Vector disType) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<options>\n");
		
                xml.append(" <issueType>\n");
                xml.append(getEntry(issueType));		
		xml.append(" </issueType>");
                
                xml.append(" <displayType>\n");
                xml.append(getEntry(disType));		
		xml.append(" </displayType>\n");
                
                xml.append("</options>");
		
		return xml.toString();
	}
        
        
        public String getStateZipContent(List stateZip) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<options>\n");		
                xml.append(getZipEntry(stateZip));               
                xml.append("</options>");
		
		return xml.toString();
	}
        
        
         private String getMemberEntry(ArrayList disType){
        
        StringBuffer xml = new StringBuffer();
            for (Iterator iter = disType.iterator(); iter.hasNext(); ) {
			String[] strArray = (String[]) iter.next();
                                      
                        String finalMemType = strArray[0] +"#"+ strArray[1] +"#"+strArray[2] ;
                        
                        xml.append(" <entry> \n");
			xml.append("	<optionValue>"+finalMemType + "</optionValue>\n");
			xml.append("	<optionText>"+strArray[1]+"</optionText>\n");
			xml.append(" </entry>\n");
		}
        
                    System.out.println("xml.toString() :"+xml.toString());
                    
        return xml.toString();
            
        }    
         
     private String getEntry(Vector disType){
        
        StringBuffer xml = new StringBuffer();
            for (Iterator iter = disType.iterator(); iter.hasNext(); ) {
			String[] strArray = (String[]) iter.next();
			xml.append(" <entry> \n");
			xml.append("	<optionValue>"+strArray[0] + "</optionValue>\n");
			xml.append("	<optionText>"+strArray[1]+"</optionText>\n");
			xml.append(" </entry>\n");
		}
        
        return xml.toString();
            
        }    
        private String getZipEntry(List disType){
        
        StringBuffer xml = new StringBuffer();
            for (Iterator iter = disType.iterator(); iter.hasNext(); ) {
			String[] strArray = (String[]) iter.next();
			xml.append(" <entry> \n");
			xml.append("	<stateId>"+strArray[0] + "</stateId>\n");
			xml.append("	<stateName>"+strArray[1]+"</stateName>\n");
                        xml.append("	<stateCode>"+strArray[2]+"</stateCode>\n");
                        xml.append("	<zipCodeFrom>"+strArray[3] + "</zipCodeFrom>\n");
			xml.append("	<zipCodeTo>"+strArray[4]+"</zipCodeTo>\n");
			xml.append(" </entry>\n");
		}
        
        return xml.toString();
            
        }    

		    
        public String getUserDetails(String[] userDetails) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<memberDetails>\n"); 
                xml.append(getMemberDetails(userDetails));		                
                xml.append("</memberDetails>");
		
		return xml.toString();
	}
        
        public String getUserDet(String[] memberDetails) {
		int count = 0;
		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<memberDetailsBYDOB>\n"); 
                xml.append(getMemberDetailsBYDOB(memberDetails));		                
                xml.append("</memberDetailsBYDOB>");
		return xml.toString();
	}
              private String getMemberDetailsBYDOB(String[] memberDetails){
                       StringBuffer xml = new StringBuffer();
				if(memberDetails[0]==null || memberDetails[0].trim().length()==0){
                                memberDetails[0]= "NA";
                         }
                         if(memberDetails[1]==null || memberDetails[1].trim().length()==0){
                                memberDetails[1]= "NA";
                         }
                         if(memberDetails[2]==null || memberDetails[2].trim().length()==0){
                                memberDetails[2]= "NA";
                         }
                         if(memberDetails[3]==null || memberDetails[3].trim().length()==0){
                                memberDetails[3]= "NA";
                         }
                         if(memberDetails[4]==null || memberDetails[4].trim().length()==0){
                                memberDetails[4]= "NA";
                         }
                        if(memberDetails[5]==null || memberDetails[5].trim().length()==0){
                                memberDetails[5]= "NA";
                         }
                         if(memberDetails[6]==null || memberDetails[6].trim().length()==0){
                                memberDetails[6]= "NA";
                         }
                         if(memberDetails[7]==null || memberDetails[7].trim().length()==0){
                                memberDetails[7]= "NA";
                         }
                         if(memberDetails[8]==null || memberDetails[8].trim().length()==0){
                                memberDetails[8]= "NA";
                         }
                        if(memberDetails[9]==null || memberDetails[9].trim().length()==0){
                                memberDetails[9]= "NA";
                         }
                        if(memberDetails[10]==null || memberDetails[10].trim().length()==0){
                                memberDetails[10]= "NA";
                         }
                         if(memberDetails[11]==null || memberDetails[11].trim().length()==0){
                                memberDetails[11]= "NA";
                         }
                         if(memberDetails[12]==null || memberDetails[12].trim().length()==0){
                                memberDetails[12]= "NA";
                         }
                         if(memberDetails[13]==null || memberDetails[13].trim().length()==0){
                                memberDetails[13]= "NA";
                         }
                         if(memberDetails[14]==null || memberDetails[14].trim().length()==0){
                                memberDetails[14]= "NA";
                         }
                        if(memberDetails[15]==null || memberDetails[15].trim().length()==0){
                                memberDetails[15]= "NA";
                         }
                         if(memberDetails[16]==null || memberDetails[16].trim().length()==0){
                                memberDetails[16]= "NA";
                         }
                         if(memberDetails[17]==null || memberDetails[17].trim().length()==0){
                                memberDetails[17]= "NA";
                         }
                         if(memberDetails[18]==null || memberDetails[18].trim().length()==0){
                                memberDetails[18]= "NA";
                         }
                         if(memberDetails[19]==null || memberDetails[19].trim().length()==0){
                                memberDetails[19]= "NA";
                         }
                         
    
				xml.append(" <prefix>"+memberDetails[0] + "</prefix>\n");
				xml.append(" <firstName>"+memberDetails[1]+"</firstName>\n");
				xml.append(" <middleName>"+memberDetails[2] + "</middleName>\n");
				xml.append(" <lastName>"+memberDetails[3]+"</lastName>\n");
				xml.append(" <sufix>"+memberDetails[4]+"</sufix>\n");
				xml.append(" <emailId>"+memberDetails[5]+"</emailId>\n");
				xml.append(" <suite>"+memberDetails[6] + "</suite>\n");
				xml.append(" <address1>"+memberDetails[7]+"</address1>\n");
				xml.append(" <address2>"+memberDetails[8] + "</address2>\n");
				xml.append(" <city>"+memberDetails[9]+"</city>\n");
				xml.append(" <state>"+memberDetails[10] + "</state>\n");
				xml.append(" <country>"+memberDetails[11]+"</country>\n");
				xml.append(" <zip>"+memberDetails[12]+"</zip>\n");			
				xml.append(" <phone>"+memberDetails[13] + "</phone>\n");
               /*    if(memberDetails[14].equals("") || memberDetails[0].equals("null")){
                        memberDetails[14]=null;
                        xml.append(" <mobile>"+memberDetails[14]+"</mobile>\n");
                        System.out.print(" memberDetails[14]  " +  memberDetails[14]);
                }
                else{
                    
                     System.out.print(" memberDetails[14] else " +  memberDetails[14]);
                }*/
				xml.append(" <mobile>"+memberDetails[14]+"</mobile>\n");  
				xml.append(" <faxNo>"+memberDetails[15]+"</faxNo>\n");
                                xml.append(" <userId>"+memberDetails[16]+"</userId>\n");
				xml.append(" <dob>"+memberDetails[17]+"</dob>\n");
                                xml.append(" <age>"+memberDetails[18]+"</age>\n");
                                xml.append(" <status>"+memberDetails[19]+"</status>\n");
                                
                                System.out.print("xml.toString():" + xml.toString());
                         return xml.toString();
                         
            
                 }    
              
               public String getUserDetail(String[] userDetails) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<userDetailsBYDOB>\n"); 
                xml.append(getUserDetailsBYDOB(userDetails));		                
                xml.append("</userDetailsBYDOB>");
		
		return xml.toString();
	}
              private String getUserDetailsBYDOB(String[] userDetails){
        
               StringBuffer xml = new StringBuffer();
				xml.append(" <userprefix>"+userDetails[0] + "</userprefix>\n");
				xml.append(" <userfirstName>"+userDetails[1]+"</userfirstName>\n");
				xml.append(" <usermiddleName>"+userDetails[2] + "</usermiddleName>\n");
				xml.append(" <userlastName>"+userDetails[3]+"</userlastName>\n");
				xml.append(" <usersufix>"+userDetails[4]+"</usersufix>\n");
				xml.append(" <useremailId>"+userDetails[5]+"</useremailId>\n");
				xml.append(" <usersuite>"+userDetails[6] + "</usersuite>\n");
				xml.append(" <useraddress1>"+userDetails[7]+"</useraddress1>\n");
				xml.append(" <useraddress2>"+userDetails[8] + "</useraddress2>\n");
				xml.append(" <usercity>"+userDetails[9]+"</usercity>\n");
				xml.append(" <userstate>"+userDetails[10] + "</userstate>\n");
				xml.append(" <usercountry>"+userDetails[11]+"</usercountry>\n");
				xml.append(" <userzip>"+userDetails[12]+"</userzip>\n");			
				xml.append(" <userphone>"+userDetails[13] + "</userphone>\n");
				xml.append(" <usermobile>"+userDetails[14]+"</usermobile>\n");
				xml.append(" <userfaxNo>"+userDetails[15]+"</userfaxNo>\n");
                                xml.append(" <useruserId>"+userDetails[16]+"</useruserId>\n");
				xml.append(" <userdob>"+userDetails[17]+"</userdob>\n");
                                xml.append(" <userage>"+userDetails[18]+"</userage>\n");

        
                         return xml.toString();
            
                 }
            private String getMemberDetails(String[] userDetails){
        
               StringBuffer xml = new StringBuffer();
				xml.append(" <prefix>"+userDetails[0] + "</prefix>\n");
				xml.append(" <firstName>"+userDetails[1]+"</firstName>\n");
				xml.append(" <middleName>"+userDetails[2] + "</middleName>\n");
				xml.append(" <lastName>"+userDetails[3]+"</lastName>\n");
				xml.append(" <sufix>"+userDetails[4]+"</sufix>\n");
				xml.append(" <emailId>"+userDetails[5]+"</emailId>\n");
				xml.append(" <suite>"+userDetails[6] + "</suite>\n");
				xml.append(" <address1>"+userDetails[7]+"</address1>\n");
				xml.append(" <address2>"+userDetails[8] + "</address2>\n");
				xml.append(" <city>"+userDetails[9]+"</city>\n");
				xml.append(" <state>"+userDetails[10] + "</state>\n");
				xml.append(" <country>"+userDetails[11]+"</country>\n");
				xml.append(" <zip>"+userDetails[12]+"</zip>\n");			
				xml.append(" <phone>"+userDetails[13] + "</phone>\n");
				xml.append(" <mobile>"+userDetails[14]+"</mobile>\n");
				xml.append(" <faxNo>"+userDetails[15]+"</faxNo>\n");
               return xml.toString();
            }    
 
         public String getMemberInfo(boolean status) {
		int count = 0;

		StringBuffer xml = new StringBuffer();
		xml.append("<?xml version=\"1.0\"");
		if (encoding != null) {
			xml.append(" encoding=\"");
			xml.append(encoding);
			xml.append("\"");
		}
		xml.append(" ?>\n");
               
                xml.append("<memberInfo>\n"); 
               	 xml.append("<status>"+status+"</status>"); 	                
                xml.append("</memberInfo>");
		
		return xml.toString();
	}
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element; 
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;
import org.jasypt.util.text.BasicTextEncryptor;
/**
 *
 * @author parteek
 */
public class XMLParser {
    public  static String readXMLCreated(String imageFilePath){
		 StringBuffer contents=new StringBuffer();
		 BufferedReader input=null;
	      try {
	    	   input =  new BufferedReader(new FileReader(imageFilePath));
	        String line = null; //not declared within while loop
	        /*
	        * readLine is a bit quirky :
	        * it returns the content of a line MINUS the newline.
	        * it returns null only for the END of the stream.
	        * it returns an empty String if two newlines appear in a row.
	        */
	        while (( line = input.readLine()) != null){
	          contents.append(line);
	          contents.append(System.getProperty("line.separator"));
	        }
	      }
	      catch(Exception e)
	      {
	    	  e.printStackTrace();
	      }
	      finally {
	        try {
				input.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	      }
	    
	   
	    return contents.toString();
			
			
		}
    public static String decryptFileContent(String encrptedContent)
    {
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("sa");
        String  originalContent=textEncryptor.decrypt(encrptedContent);
        return originalContent;
        
    }
    public static int readFromXMLUsers(String originalContent)
    {
        String no_of_users=null;
        SAXBuilder builder = new SAXBuilder();
          Document doc;
			try {
	           doc = builder.build(new ByteArrayInputStream(originalContent.getBytes()));
		   Element license=doc.getRootElement();
		    List ls=license.getChildren();
		   //System.out.println(""+ls.size());
		    for(int i=0;i<ls.size();i++)
		    	
		    {
		       Element ele=(Element)ls.get(i);
		       if(ele.getName().equalsIgnoreCase("no-of-users"))
                               no_of_users=ele.getText();
                    }
                        }
                        catch (JDOMException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            return Integer.parseInt(no_of_users);
    }
    
   
    
 
    public static boolean readXMLDecryptedContent(String originalContent)
    {
         SAXBuilder builder = new SAXBuilder();
         String license_start_date=null;
         String license_end_date=null;
         String daysValid=null;
		// Get the root element
		    Document doc;
			try {
	           doc = builder.build(new ByteArrayInputStream(originalContent.getBytes()));
		   Element license=doc.getRootElement();
		    List ls=license.getChildren();
		   //System.out.println(""+ls.size());
		    for(int i=0;i<ls.size();i++)
		    	
		    {
		         Element ele=(Element)ls.get(i);
		       if(ele.getName().equalsIgnoreCase("license-start-date"))
                               license_start_date=ele.getText();
                        if(ele.getName().equalsIgnoreCase("license-end-date"))
                               license_end_date=ele.getText();
                         if(ele.getName().equalsIgnoreCase("days-validity"))
                             daysValid=ele.getText();
		    }
		    	
		   // Element ele=license.getChild("days-validity");
		    //System.out.println("Name is"+ele.getName()+"test"+ele.getText());
		    //System.out.println("Size"+lt.size());
		    
			} catch (JDOMException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
                    //if(license_start_date!=null && license_end_date!=null)
                        return XMLParser.validateLicense(license_start_date, license_end_date,daysValid);
                    
                    
    }
  public static ArrayList totalXMLUsers(String originalContent)
             {
            ArrayList aa=new ArrayList();
        String no_of_users=null;
        String license_start_date=null;
        String license_end_date=null;
        String daysValid=null;
        SAXBuilder builder = new SAXBuilder();
          Document doc;
			try {
                            doc = builder.build(new ByteArrayInputStream(originalContent.getBytes()));
		   Element license=doc.getRootElement();
//	           doc = (Document) builder.build(new ByteArrayInputStream(originalContent.getBytes()));
//		   Element license=(Element) doc.getDocumentElement();
		    List ls=license.getChildren();
		   //System.out.println(""+ls.size());
		    for(int i=0;i<ls.size();i++)
		    	
		    {
		       Element ele=(Element)ls.get(i);
		       if(ele.getName().equalsIgnoreCase("no-of-users"))
                               no_of_users=ele.getText();
                         
                      if(ele.getName().equalsIgnoreCase("license-start-date"))
                        
                               license_start_date=ele.getText();
                      
                       
                       if(ele.getName().equalsIgnoreCase("license-end-date"))
                               license_end_date=ele.getText();
                             //System.out.println("End date of File"+license_end_date);
                         if(ele.getName().equalsIgnoreCase("days-validity"))
                             
                             daysValid=ele.getText();
                    
                    }
                       aa.add(no_of_users);
                        aa.add(license_start_date);
                         aa.add(license_end_date);
                          aa.add(daysValid);
                    // System.out.println("NO of user"+no_of_users);
                     //System.out.println("license Sttart"+license_start_date);
                      // System.out.println("license end"+license_end_date);
                       // System.out.println("days valid"+daysValid);
                        }
                        catch (JDOMException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
         // System.out.println("NO of user "+no_of_users);
//            return Integer.parseInt(no_of_users);
     return aa;
        }
 
    
    public static boolean validateLicense(String lic_start_date,String lic_end_date,String days_valid)
    {
                //String start="10-08-2009 13:09:30";
		//String end="10-08-2009 23:40:30";
		Date endDate=null,startDate=null;
                startDate=new Date();
                
                boolean output=true;
		SimpleDateFormat sdf=new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
		    try {
                //System.out.println("License start date1 "+startDate);
                        //startDate=sdf.parse(lic_start_date);
                        
                          endDate=sdf.parse(lic_end_date);
                       // System.out.println("License end date "+endDate);
		   } catch (ParseException e){
							// TODO Auto-generated catch block
				e.printStackTrace();
					}   
		//Date currentDate=new Date();
        Calendar calendar1 = Calendar.getInstance();
	    Calendar calendar2 = Calendar.getInstance();
            /*System.out.println("Current Year"+(startDate.getYear()+1900));
            System.out.println("Current Month"+(startDate.getMonth()+1));
            System.out.println("Current day "+startDate.getDate());
            System.out.println("Current hours"+startDate.getHours());
            System.out.println("Current minutess"+startDate.getMinutes());
            System.out.println("Current seconds"+startDate.getSeconds());
            System.out.println("End Year"+(endDate.getYear()+1900));
            System.out.println("End Month"+(endDate.getMonth()+1));
            System.out.println("nd day "+endDate.getDate());
            System.out.println("End hours"+endDate.getHours());
            System.out.println("End minutess"+endDate.getMinutes());
            System.out.println("End seconds"+endDate.getSeconds());*/
	    calendar1.set((startDate.getYear()+1900),(startDate.getMonth()+1),startDate.getDate(),startDate.getHours(),startDate.getMinutes(),startDate.getSeconds());
	    calendar2.set((endDate.getYear()+1900),(endDate.getMonth()+1),endDate.getDate(),endDate.getHours(),endDate.getMinutes(),endDate.getSeconds());
	    long milliseconds1 = calendar1.getTimeInMillis();
	    long milliseconds2 = calendar2.getTimeInMillis();
	    long diff = milliseconds2 - milliseconds1;
	    //long diffSeconds = diff / 1000;
	    long diffMinutes = diff / (60 * 1000);
	    long diffHours = diff / (60 * 60 * 1000);
	    long diffDays = diff / (24 * 60 * 60 * 1000);
            //System.out.println("Minutes "+diffMinutes+"  Hours"+diffHours+" diffDays"+diffDays);
            if(diffDays>0)
                return output;
            
            else if(diffDays==0)
            {
                if(diffHours>0)
                    return output;
                else if(diffHours==0)
                {
                    if(diffMinutes<0)
                         return output=false;
                    else if(diffMinutes==0)
                        return output=false;
                    else if(diffMinutes>0)
                         return output;
                    
                }
                else 
                    return output=false;
                
            }
            else
                return output=false;
            
           return output; 
            
    }

}

/*
 * EmailEngine.java
 *
 * Created on September 30, 2006, 8:59 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.util.email;

import com.hlccommon.util.Debug;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import org.apache.commons.mail.*;


/**
 *
 * @author Shiva Kumar Subbiaha
 */
public final class EmailEngine {
    
   private final Properties properties;    
   
   InputStream inputStream;
   public static final String mail_prop_file = "mail.properties";
 
    /** Creates a new instance of EmailEngine */
    public EmailEngine()  {  
    	
    	properties = new Properties();  
    	inputStream = getClass().getClassLoader().getResourceAsStream(mail_prop_file);
    	
    	try{
    	
    	if (inputStream != null) {
    		properties.load(inputStream);
		} else {
			throw new FileNotFoundException("property file '" + mail_prop_file + "' not found in the classpath");
		}
    	
    	}catch(Exception e){
    		e.printStackTrace();
    	}
    	
              
       /* String fileName = System.getProperty("user.home")+File.separator+"mail.properties";
        Debug.print("FileName path:"+fileName);
       // InputStream in = this.getClass().getClassLoader().getResourceAsStream(fileName);
        try {               
                properties.load(new FileInputStream("mail.properties"));
            } catch (Exception e) {
                try {
                  properties.load(new FileInputStream("mail.properties"));
                }catch(Exception ee) {
                   Debug.print("Could not load the mail.properties");
                }
            }*/
    }
         
     
    public boolean sendEmail(EmailContent emailContent)  {    
      boolean success = false;
      String hostName = "smtp.gmail.com";
      String userName = "dhivya.ab@gmail.com";
      String passWord = "mmbalraaj"; 
      Debug.print("Mail Configuration :\n"+"HostName :"+hostName+" " +
          "UserName:"+userName+" Password:"+passWord); 
       //Debug.print("Email Content :"+emailContent);
        SimpleEmail email = new SimpleEmail();        
        try {
        	
            //set if debug is enabled;
            if(emailContent.isDebug()) {
             email.setDebug(true);
            }
            
            email.setHostName(hostName);
            //email.setAuthentication(userName,passWord);       
            for (int i = 0; i < emailContent.getTo().length; i++) {
                email.addTo(emailContent.getTo()[i]);
            }                   
            email.setFrom(emailContent.getFrom());
            email.setSubject(emailContent.getSubject());
            email.setSentDate(new Date());
            email.setMsg(emailContent.getBody());           
            email.send();
            success = true;
         } catch (EmailException ex) {
            ex.printStackTrace();           
        }

       return success;
    }   
    
     public boolean sendMimeEmail(EmailContent emailContent)  {    
    	 
      boolean success = false;
      String hostName = properties.getProperty("mail.host");
      String userName = properties.getProperty("mail.username");
      String passWord = properties.getProperty("mail.password"); 
       Debug.print("Mail Configuration :\n"+"HostName :"+hostName+" " +
          "UserName:"+userName+" Password:"+passWord); 
      // Debug.print("Email Content :"+emailContent);
       HtmlEmail email = new HtmlEmail();     
        try {
            
            //set if debug is enabled;
            if(emailContent.isDebug()) {
             email.setDebug(true);
            }
            
            email.setHostName(hostName);
            email.setAuthentication(userName,passWord); 
           
            for (int i = 0; i < emailContent.getTo().length; i++) {
            	System.out.println("emailContent.getTo()"+emailContent.getTo());
                email.addTo(emailContent.getTo()[i]);
            }                   
            email.setFrom(emailContent.getFrom());
            email.setSubject(emailContent.getSubject());
            email.setSentDate(new Date());
            email.setHtmlMsg(emailContent.getBody());      
            email.setTextMsg("Your email client does not support HTML messages");
            email.send();
            success = true;
         } catch (EmailException ex) {
            ex.printStackTrace();           
        }

       return success;
    }   


    
    
    
    
     public boolean sendEmailWithAttachment(EmailContent emailContent)  {    
      boolean success = false;
      String hostName = properties.getProperty("mail.host");
      String userName = properties.getProperty("mail.username");
      String passWord = properties.getProperty("mail.password"); 
      Debug.print("Mail Configuration :\n"+"HostName :"+hostName+" " +
          "UserName:"+userName+" Password:"+passWord); 
       //Debug.print("Email Content :"+emailContent);
        MultiPartEmail  email = new MultiPartEmail();        
        try {
            
            //set if debug is enabled;
            if(emailContent.isDebug()) {
             email.setDebug(true);
            }
            
            email.setHostName(hostName);
            //email.setAuthentication(userName,passWord);       
            for (int i = 0; i < emailContent.getTo().length; i++) {
                email.addTo(emailContent.getTo()[i]);
            }                   
            email.setFrom(emailContent.getFrom());
            email.setSubject(emailContent.getSubject());
            email.setSentDate(new Date());
            email.setMsg(emailContent.getBody());  
            
            for (Iterator iterate = emailContent.getAttachments().iterator(); iterate.hasNext(); ) {
                EmailAttachment  attachment = (EmailAttachment) iterate.next();
                email.attach(attachment);                
            }           
           // add the attachment  
            email.send();
            success = true;
         } catch (EmailException ex) {
            ex.printStackTrace();           
        }

       return success;
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
     
     public static void main(String[] args) throws Exception{
      //sending simple email
      /*
         EmailContent emailContent = new EmailContent();
         emailContent.setSubject("Test Mail");
         emailContent.setFrom("guru_devp@yahoo.com");
         emailContent.setTo(new String[]{"spidershiva@gmail.com","guru_devp@yahoo.com"} );
         emailContent.setBody("Test mail from shiva ...............");
         EmailEngine emailEngine = new EmailEngine();
         boolean flag = emailEngine.sendEmail(emailContent);
         System.out.println("Mail sent Successfully . Status="+flag );
       */
       //sending email with attachment
       List attachmentList = new ArrayList();
       EmailAttachment attachment = new EmailAttachment();
       attachment.setURL(new URL("http://www.apache.org/images/asf_logo_wide.gif"));
       //attachment.setPath("d:/Ad_Hoc_Query_Tool_3-26-02.ppt");
       //for attachment as a file
       attachment.setDisposition(EmailAttachment.ATTACHMENT);
       //for inline attachment
       //attachment.setDisposition(EmailAttachment.INLINE);        
       attachment.setDescription("Picture of John");
       attachment.setName("John");       
       attachmentList.add(attachment);
       EmailContent emailContent = new EmailContent();
       emailContent.setSubject("Test Mail");
       emailContent.setFrom("guru_devp@yahoo.com");
       emailContent.setTo(new String[]{"spidershiva@gmail.com","guru_devp@yahoo.com"} );
       emailContent.setBody("Test mail from shiva ...............");
       //setting the attachment
       emailContent.setAttachments(attachmentList);
       EmailEngine emailEngine = new EmailEngine();
       boolean flag = emailEngine.sendEmailWithAttachment(emailContent);
       System.out.println("Mail sent Successfully . Status="+flag);
       

         
     }
}

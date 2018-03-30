/*******************************************************************************
 * Copyright: 2018 digiBlitz Foundation
 * 
 * License: digiBlitz Public License 1.0 (DPL) 
 * Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
 * 
 * Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
 * 
 * Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
 * 
 * "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
 ******************************************************************************/
package com.util.email;
//testing
import com.hlccommon.util.Debug;
import com.user.action.KlgUserAction;

import java.util.Date;
import java.util.Properties;
import org.apache.commons.mail.*;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.MailSender;  
import org.springframework.mail.SimpleMailMessage;  
   
public final class MailMail{  
    private MailSender mailSender;  
    private final Properties properties; 
   
    public MailMail()  {  
    	   
  
     /** Creates a new instance of EmailEngine */
    properties = new Properties();        
    String fileName = System.getProperty("user.home")+File.separator+"mail.properties";
    Debug.print("FileName path:"+fileName);
   // InputStream in = this.getClass().getClassLoader().getResourceAsStream(fileName);
    try {               
            properties.load(new FileInputStream(fileName));
        } catch (Exception e) {
            try {
              properties.load(new FileInputStream("mail.properties"));
            }catch(Exception ee) {
               Debug.print("Could not load the mail.properties");
            }
        }
    }
    
    
    
    public void setMailSender(MailSender mailSender) {  
        this.mailSender = mailSender;  
    }  
   
    public boolean sendMail(String emailid) {  
    	
    	  final String username= properties.getProperty("mail.user");
    	  final String password = properties.getProperty("mail.password");
    	  properties.getProperty("mail.host");
    	  properties.getProperty("mail.port");
    	  properties.getProperty("mail.smtp.starttls.enable");
    	  properties.getProperty("mail.smtp.auth");
    	  properties.getProperty("mail.transport.protocol");
    	 
    	  Session session = Session.getInstance(properties,
    	    new javax.mail.Authenticator() {
    	   protected PasswordAuthentication getPasswordAuthentication() {
    	    return new PasswordAuthentication(username, password);
    	   }
    	    });
    	 
    	  try {
    	 
    	   Message message = new MimeMessage(session);
    	   message.setFrom(new InternetAddress(""));
           String email=emailid;

    	   message.setRecipients(Message.RecipientType.TO,
    	    InternetAddress.parse(email));
    	   message.setSubject("Your Account Details");
    	   message.setText("Dear");
    	 
    	   Transport.send(message);
    	 
    	   System.out.println("Done");
    	   return true;
    	  } catch (MessagingException e) {
    	   throw new RuntimeException(e);
    	  }
    }
    
    /*
     * Dhivya Here: Mail Send
     * 
     */
    public boolean sendMimeEmail(EmailContent emailContent)  {    
        boolean success = false;
        String hostName = properties.getProperty("mail.host");
        final  String userName = properties.getProperty("mail.user");
        final  String passWord = properties.getProperty("mail.password"); 
         Debug.print("Mail Configuration :\n"+"HostName :"+hostName+" " +
            "UserName:"+userName+" Password:"+passWord); 
       
         Session session = Session.getInstance(properties,
      			  new javax.mail.Authenticator() {
      				protected PasswordAuthentication getPasswordAuthentication() {
      					return new PasswordAuthentication(userName, passWord);
      				}
      			  });
         
       
         Message email = new MimeMessage(session); 
         
         
          try {
           
              for (int i = 0; i < emailContent.getTo().length; i++) {
              	System.out.println("emailContent.getTo()"+emailContent.getTo());
                  email.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(emailContent.getTo()[i]));
              }                   
              email.setFrom(new InternetAddress(emailContent.getFrom()));
              email.setSubject(emailContent.getSubject());
              email.setSentDate(new Date());
              
              setHTMLContent(email,emailContent.getBody());
            
            // email.setText("Your email client does not support HTML messages");
              
              Transport.send(email);
              
            
              success = true;
           } catch (MessagingException ex) {
              ex.printStackTrace();           
          }

         return success;
      }  
    
    

    // Set a single part html content.
       // Sending data of any type is similar.
       public static void setHTMLContent(Message msg, String content) throws MessagingException {
    
           // HTMLDataSource is a static nested class
           msg.setDataHandler(new DataHandler(new HTMLDataSource(content)));
       }
    
    
       /*
        * Static nested class to act as a JAF datasource to send HTML e-mail content
        */
       static class HTMLDataSource implements DataSource {
           private String html;
    
           public HTMLDataSource(String htmlString) {
               html = htmlString;
           }
    
           // Return html string in an InputStream.
           // A new stream must be returned each time.
           public InputStream getInputStream() throws IOException {
               if (html == null) throw new IOException("Null HTML");
               return new ByteArrayInputStream(html.getBytes());
           }
    
           public OutputStream getOutputStream() throws IOException {
               throw new IOException("This DataHandler cannot write HTML");
           }
    
           public String getContentType() {
               return "text/html";
           }
    
           public String getName() {
               return "JAF text/html dataSource to send e-mail only";
           }
       }


}






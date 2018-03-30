/*
 * EmailContent.java
 *
 * Created on September 30, 2006, 9:37 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.util.email;

import java.util.List;

/**
 *
 * @author Shiva Kumar Subbiaha
 */
public class EmailContent {
    
    /** Creates a new instance of EmailContent */
    public EmailContent() {
    }
    
    private String from;
    private String[] to;
    private String subject;
    private String body;
    private boolean debug;
    private List attachments;
   
   
    public void setBody(String body) {
        this.body = body;
    }

    public String getBody() {
        return body;
    }

    public String getFrom() {
        return from;
    }

    public String[] getTo() {
        return to;
    }

    public void setFrom(String from) {
        this.from = from;
    }

    public void setTo(String[] to) {
        this.to = to;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }
    
    public String toString(){
        
        StringBuffer buffer = new StringBuffer()
        .append(" From :"+ from+"\t\t")
        .append(" To :"+ getAsString(to)+"\t\t")
        .append(" subject :"+ subject+"\t\t")
        .append(" message :"+body+"\t\t");
        
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

    public boolean isDebug() {
        return debug;
    }

    public void setDebug(boolean debug) {
        this.debug = debug;
    }

    public void setAttachments(List attachments) {
        this.attachments = attachments;
    }

    public List getAttachments() {
        return attachments;
    }
    
}

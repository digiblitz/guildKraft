/*
 * HorseCompDataMapActionForm.java
 *
 * Created on March 27, 2007, 12:01 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.actionform;

/**
 *
 * @author karthikeyan
 */

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;


public class HorseCompDataMapActionForm implements Serializable{
    
    private transient FormFile fileUpload;

    public HorseCompDataMapActionForm(){}

    public void reset(ActionMapping mapping, HttpServletRequest request) {
        //super.reset(mapping,request);
        
        this.fileUpload=null;
    }
  
    public ActionErrors validate(ActionMapping mapping, HttpServletRequest request) {
      
        return null;
    }

    public FormFile getFileUpload() {
        return fileUpload;
    }

    public void setFileUpload(FormFile fileUpload) {
        this.fileUpload = fileUpload;
    }
   
    
  public String toString(){
  
   StringBuffer buffer = new StringBuffer()
   .append("  ");
  
  return buffer.toString();
  }
}


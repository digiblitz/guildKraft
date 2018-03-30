/*
 * UploadResultsActionForm.java
 *
 * Created on November 22, 2007, 6:49 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.oee.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;
/**
 *
 * @author Ellamaran
 */
public class UploadResultsActionForm extends org.apache.struts.action.ActionForm implements Serializable{
    
    /** Creates a new instance of UploadResultsActionForm */
    public UploadResultsActionForm() {}
    private transient FormFile fileUpload;
    
    public void reset(ActionMapping mapping, HttpServletRequest request) {
        super.reset(mapping,request);
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
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mrm.actionform;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import java.io.Serializable;
import org.apache.struts.upload.FormFile;
/**
 *
 * @author parteek
 */
public class ReportActionForm  extends org.apache.struts.action.ActionForm {
    
    private String reportTitle;
     private String chartType;
    private  FormFile xlsFile;

    public String getChartType() {
        return chartType;
    }

    public void setChartType(String chartType) {
        this.chartType = chartType;
    }

    public String getReportTitle() {
        return reportTitle;
    }

    public void setReportTitle(String reportTitle) {
        this.reportTitle = reportTitle;
    }

    public FormFile getXlsFile() {
        return xlsFile;
    }

    public void setXlsFile(FormFile xlsFile) {
        this.xlsFile = xlsFile;
    }

   
   
    

}

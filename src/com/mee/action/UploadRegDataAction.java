/*
 * UploadRegDataAction.java
 *
 * Created on April 11, 2007, 1:17 PM
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;

import com.hlcmeeting.util.HLCMapHorseRegVO;
import com.mee.actionform.UploadRegDataActionForm;
import com.hlcmro.display.HLCVaigaiStatelessBean;
import com.hlcmsg.util.Debug;
import java.io.*;
import java.net.ProtocolException;
import java.util.*;
import javax.naming.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.action.*;
import org.apache.struts.upload.*;
import org.apache.struts.util.MessageResources;

import java.sql.*;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

/**
 *
 * @author Punitha
 * @version
 */



	public class UploadRegDataAction implements Controller {

    String fwd=""  ;
    
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
        try {
            HttpSession session = request.getSession();
            
            HLCVaigaiStatelessBean vaigaiBean1=new HLCVaigaiStatelessBean(); 
            HLCVaigaiSessionBean vaigaiMeetingBean =new HLCVaigaiSessionBean();
           
            UploadRegDataActionForm  uploadRegForm = new UploadRegDataActionForm();
            FormFile fileUpload = uploadRegForm.getFileUpload();
            String process = request.getParameter("process");
            Debug.print("process :"+process);
            if(process!=null && process.trim().length()!=0){
                
                if(process!=null && process.equalsIgnoreCase("viewUpload")) {
                    Vector allTypesVect = (Vector)vaigaiBean1.getAllTypes();
                    request.setAttribute("allTypesVect", allTypesVect);
                    return new ModelAndView("frmMemUploadHorseReg");
                }
                
                if(process.equalsIgnoreCase("upload")) {
                    //upload the  file
                    
                    String directoryTemp="C:/horse_excel_regdetaiil";
                    String fullFilePath = "";
                    
                    String eventId = uploadRegForm.getEventId();
                    Debug.print("eventId :"+eventId);
                    String eventType = request.getParameter("eventTypeId");
                    String fileName = fileUpload.getFileName();
                    Debug.print("fileName :"+fileName);
                    Debug.print("eventType :"+eventType);
                    
                    java.util.Date d = new java.util.Date();
                    long tmpDate = d.getTime();
                    
                    
                    System.out.print("d" + d);
                    fileName = tmpDate+" "+ fileName;
                    Debug.print("final Time Stamped fileName :"+fileName);
                    
                    Debug.print("directoryTemp="+directoryTemp);
                    BufferedOutputStream outFile = null;
                    String imageFilePath = directoryTemp+File.separator+fileName;
                    Debug.print("imageFilePath :"+imageFilePath);
                    String regUploadId =null;
                    try {
                        //creating the temp dir if not exists
                        File fDir = new File(directoryTemp);
                        if (!fDir.exists()) {
                            if (!fDir.mkdir()) {
                                throw new IOException("Cannot create tmpdir for dimension file");
                            }
                        }
                        File newFile = new File(imageFilePath);
                        fullFilePath = newFile.getAbsolutePath();
                        
                        
                        regUploadId = vaigaiMeetingBean.createHorseRegUploadDetails(eventId,eventType,fullFilePath);
                        System.out.print("Upload Id in UploadRegDataAction" + regUploadId);
                        Debug.print("vaigaiMeetingBean.createHorseRegUploadDetails(eventId,fullFilePath) uploadId :"+regUploadId);
                        Debug.print("NewFilePath ="+newFile.getAbsolutePath());
                        outFile = new BufferedOutputStream(new FileOutputStream(newFile));
                        outFile.write(fileUpload.getFileData());
                        request.setAttribute("regUploadId",regUploadId);
                        
                    } catch (IOException ie) {
                        Debug.print("Error while writing into the file" + ie.getMessage());
                    } finally {
                        if(outFile!=null){
                            outFile.flush();
                            outFile.close();
                        }
                    }
                    
                    request.setAttribute("fileName",fullFilePath);
                    Debug.print("regUploadId in upload: " + regUploadId);
                    if(regUploadId!=null){
                        request.setAttribute("eventId",eventId);
                        return new ModelAndView("frmMemUploadRegConfirm");
                    } else{
                    	return new ModelAndView("index");
                    }
                }
                
                if(process.equalsIgnoreCase("listUploadDetails")) {
                    Debug.print("inside listUploadDetails block :");
                    ArrayList compFileDetails = new ArrayList();
                    compFileDetails = vaigaiMeetingBean.getUploadHorseRegDetails();
                    Debug.print("compFileDetails.size() UploadRegDataAction in Servlet : "+compFileDetails.size());
                    request.setAttribute("compFileDet",compFileDetails);
                    return new ModelAndView("frmMemLstUploadReg");
                }
                
                if(process.equalsIgnoreCase("dispDataMapping")) {
                    String butName = request.getParameter("butValue");
                    Debug.print("butName in UploadRegDataAction :" + butName);
                    /*
                     * insert block.......
                     */
                    if(butName!=null && butName.equalsIgnoreCase("map")){
                        Vector excel = new Vector();
                        ArrayList excelHead = new ArrayList();
                        String stringValue="";
                        
                        String fileName = (String)request.getParameter("fileName");
                        Debug.print("fileName :"+fileName);
                        
                        String regUploadId = (String)request.getParameter("uploadId");
                        Debug.print("regUploadId :"+ regUploadId);
                        
                        session.setAttribute("regUploadId",regUploadId);
                        
                        String eventId = request.getParameter("eventId");
                        Debug.print("event id from jsp page.:" + eventId);
                        if(eventId!=null && eventId.trim().length()!=0){
                            request.setAttribute("eventId",eventId);
                        }

                        try {
                            
                            InputStream input = new FileInputStream(fileName);
                            //InputStream input = HorseCompDataMapping.class.getResourceAsStream(fileName);
                            POIFSFileSystem fs = new POIFSFileSystem(input);
                            HSSFWorkbook wb = new HSSFWorkbook(fs);
                            HSSFSheet sheet = wb.getSheetAt(0);
                            
                            // Iterate over each row in the sheet
                            Iterator rows = sheet.rowIterator();
                            int j = 0;
                            
                            while( rows.hasNext() ) {
                                HSSFRow row = (HSSFRow) rows.next();
                                Integer rowNumber = new Integer(row.getRowNum());
                         
                                int i = rowNumber.intValue();
                                
                                // Iterate over each cell in the row and print out the cell's content
                                Iterator cells = row.cellIterator();
                               // System.out.print("rowNumber.intValue" + i);
                                if(i!=0){
                                    
                                   // System.out.print("inside the loop rowNumber.intValue" + i);
                                    ArrayList excelAdd = new ArrayList();
                                    
                                    while(cells.hasNext()) {
                                        
                                        HSSFCell cell = (HSSFCell)cells.next();
                                        Integer cellNumber = new Integer(cell.getCellNum());
                                        int c = cellNumber.intValue();
                                       // Debug.print("cellNumber.intValue() for rows :"+cellNumber.intValue());
                                        
                                        switch (cell.getCellType()) {
                                            case HSSFCell.CELL_TYPE_NUMERIC:
                                                Double numericValue = new Double(cell.getNumericCellValue());
                                                int tempNum = numericValue.intValue();
                                                Debug.print("tempNum value:" + tempNum);
                                                stringValue = String.valueOf(tempNum);
                                                if(stringValue.trim()==""){
                                                    stringValue = null;
                                                }
                                                //excel.add(numericValue);
                                                break;
                                                
                                            case HSSFCell.CELL_TYPE_STRING:
                                                stringValue = (String)cell.getStringCellValue();
                                                //excel.add(stringValue);
                                                 if(stringValue.trim()==""){
                                                    stringValue = null;
                                                }
                                                break;
                                                
                                            case HSSFCell.CELL_TYPE_BLANK:
                                                stringValue = null;
                                                
                                                //excel.add(strValue);
                                                
                                            default:
                                                //System.out.println("unsuported Cell type in Rows");
                                                break;
                                        }
                                        //Debug.print("j value:"+j);
                                        //excelAdd[j] = stringValue;
                                        //j++;
                                        excelAdd.add(stringValue);
                                        Debug.print("excelAdd.size() :"+excelAdd.size());
                                    }
                                    
                                    excel.add(excelAdd);
                                }
                                if(i==0){
                                    while(cells.hasNext()) {
                                        HSSFCell cell = (HSSFCell) cells.next();
                                        switch (cell.getCellType()) {
                                            case HSSFCell.CELL_TYPE_NUMERIC:
                                                Double numericValue = new Double(cell.getNumericCellValue());
                                                int tempNum = numericValue.intValue();
                                                Debug.print("tempNum value:" + tempNum);
                                                 stringValue = String.valueOf(tempNum);
                                                 if(stringValue.trim()==""){
                                                    stringValue = null;
                                                }
                                                excelHead.add(stringValue);
                                                break;
                                                
                                            case HSSFCell.CELL_TYPE_STRING:
                                                stringValue = (String)cell.getStringCellValue();
                                                 if(stringValue.trim()==""){
                                                    stringValue = null;
                                                 }
                                                excelHead.add(stringValue);
                                                break;
                                                
                                            case HSSFCell.CELL_TYPE_BLANK:
                                                stringValue = null;
                                                excelHead.add(stringValue);
                                                
                                            default:
                                                System.out.println("unsuported Cell type in Column");
                                                break;
                                        }
                                    }
                                }
                            }
                            
                            Debug.print("columns excelHead.size() :"+excelHead.size());
                            Debug.print("rows excel.size() :"+excel.size());
                            
                            ArrayList tblDetails = new ArrayList();
                            tblDetails = vaigaiMeetingBean.getHorseRegMappingTableDetails();
                            Debug.print("tblDetails.size() in servlet : "+tblDetails.size());
                            
                            request.setAttribute("tblDetails",tblDetails);
                            
                            request.setAttribute("excelHead",excelHead);
                            request.setAttribute("excelRows",excel);
                            //request.setAttribute("excelRows",excel);
                            return new ModelAndView("frmMemHorseRegExcelMapping");
                            
                        }
                        catch(Exception e) {
                            Debug.print("Exception while retrieving data frm Excel :"+e);
                            return new ModelAndView("uploadHorseCompExcel_format_error");
                        }
                    }
                     /*
                      * Delete block.............
                      */
                    
                   if(butName!=null && butName.equalsIgnoreCase("Delete")){
                        Debug.print("inside process Delete block :");
                        
                        try {
                            String fileName =  request.getParameter("fileName");
                            Debug.print("fileName :"+fileName);
                            String regUploadId =  request.getParameter("uploadId");
                            Debug.print("uploadId :"+regUploadId);
                             String eventId =  request.getParameter("eventId");
                             request.setAttribute("eventId",eventId);
                            Debug.print("uploadId :"+regUploadId);
                            session.setAttribute("regUploadId",regUploadId);
                            File fd = new File(fileName);
                            boolean delStat = fd.delete();
                            Debug.print("file delete status :"+delStat);
                            boolean stat1 = vaigaiMeetingBean.deleteCompRegDetails(regUploadId);
                            Debug.print("deleteCompRegDetails(eventId) status in servlet :"+stat1);
                            boolean stat2 = vaigaiMeetingBean.deleteCompRegMappedDatas(regUploadId);
                            Debug.print("deleteCompResultMappedDatas(uploadId) status in servlet :"+stat2);
                            boolean stat = vaigaiMeetingBean.deleteCompRegFileDetails(regUploadId);
                            Debug.print("deleteCompResultFileDetails(uploadId) status in servlet :"+stat);
                            
                            if(stat2==true || stat==true){
                             // A File object to represent the filename
                             File f = new File(fileName);
                             
                             // Make sure the file or directory exists and isn't write protected
                             if (!f.exists())
                                 throw new IllegalArgumentException(
                                         "Delete: no such file or directory: " + fileName);
                             
                             if (!f.canWrite())
                                 throw new IllegalArgumentException("Delete: write protected: "+ fileName);
                             
                             // If it is a directory, make sure it is empty
                             if (f.isDirectory()) {
                                 String[] files = f.list();
                                 if (files.length > 0)
                                     throw new IllegalArgumentException(
                                             "Delete: directory not empty: " + fileName);
                             }
                             // Attempt to delete it
                             boolean success = f.delete();
                             
                             if (!success)
                                 throw new IllegalArgumentException("Delete: deletion failed");
                            }
                        } catch(Exception e) {
                            Debug.print("caught an exception in servlet : "+e);
                        }
                        
                        return new ModelAndView("frmMapDelConfirm");
                    }
                }
           
            /*
             * insert excel values and table columns into table
             *
             */
            
            if(process.equalsIgnoreCase("insertMapDatas")) {
                Debug.print("inside insertMapDatas block :");
                
                String regUploadId = (String)session.getAttribute("regUploadId");
                Debug.print("session.getAttribute(uploadId) :"+ regUploadId);
                String eventId = request.getParameter("eventId");
                Debug.print("eventId in insertMapDatas block::::::" + eventId);
                try {
                    
                    int dropCt = Integer.parseInt(request.getParameter("dropCt"));
                    Debug.print("drop down count is :"+dropCt);
                    
                    String[] dropValue = new String[dropCt];
                    
                    for(int i=0;i<dropCt;i++) {
                        String dropName = "colSel"+String.valueOf(i);
                        Debug.print("dropName :"+dropName);
                        
                        dropValue[i] = request.getParameter(dropName);
                        Debug.print("dropValue :"+dropValue[i]);
                    }
                    
                    Vector excelRows = new Vector();
                    ArrayList excelRow = new ArrayList();
                    
                    excelRows = (Vector)session.getAttribute("excelRows");
                    Debug.print("excelRows.size() in Servlet : "+excelRows.size());
                    
                    
                    
                    HLCMapHorseRegVO HLCCompResultVO = null;
                    boolean status = false;
                    
                    for(int k=0;k<excelRows.size();k++) {
                        HLCCompResultVO = new HLCMapHorseRegVO();
                        status = false;
                        
                        excelRow = (ArrayList)excelRows.get(k);
                        Debug.print("excel Row "+ k +" contents size :"+ excelRow.size());
                       
                        HLCCompResultVO.setEventId(eventId);
                        
                        
                        if(dropValue[0] != null && dropValue[0].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[0]);
                            String eventType = (String)excelRow.get(pos);
                            HLCCompResultVO.setEventType(eventType);
                        }
                        
                        if(dropValue[1] != null && dropValue[1].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[1]);
                            String eventLevel = (String)excelRow.get(pos);
                            HLCCompResultVO.setEventLevel(eventLevel);
                        }
                        
                        if(dropValue[2] != null && dropValue[2].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[2]);
                            String eventDivisionAmateur = (String)excelRow.get(pos);
                            HLCCompResultVO.setEventDivisionAmateur(eventDivisionAmateur);
                        }
                        
                        if(dropValue[3] != null && dropValue[3].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[3]);
                            String eventDivisionAge = (String)excelRow.get(pos);
                            HLCCompResultVO.setEventDivisionAge(eventDivisionAge);
                        }
                        if(dropValue[4] != null && dropValue[4].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[4]);
                            String eventDivisionExp = (String)excelRow.get(pos);
                            HLCCompResultVO.setEventDdivisionExperience(eventDivisionExp);
                        }
                        
                        if(dropValue[5] != null && dropValue[5].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[5]);
                            String horseName = (String)excelRow.get(pos);
                            HLCCompResultVO.setHorseName(horseName);
                        }
                        
                        if(dropValue[6] != null && dropValue[6].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[6]);
                            String horseMemberId = (String)excelRow.get(pos);
                            HLCCompResultVO.setHorseMemberId(horseMemberId);
                        }
                        
                        if(dropValue[7] != null && dropValue[7].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[7]);
                            String horseUsefId = (String)excelRow.get(pos);
                            HLCCompResultVO.setHorseUsefId(horseUsefId);
                        }
                        if(dropValue[8] != null && dropValue[8].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[8]);
                            String riderFirstName = (String)excelRow.get(pos);
                            HLCCompResultVO.setRiderFirstName(riderFirstName);
                        }
                        if(dropValue[9] != null && dropValue[9].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[9]);
                            String riderLastName = (String)excelRow.get(pos);
                            HLCCompResultVO.setRiderLastName(riderLastName);
                        }
                        if(dropValue[10] != null && dropValue[10].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[10]);
                            String riderMemberId = (String)excelRow.get(pos);
                            HLCCompResultVO.setRiderMemberId(riderMemberId);
                        }
                        if(dropValue[11] != null && dropValue[11].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[11]);
                            String riderUsefId = (String)excelRow.get(pos);
                            HLCCompResultVO.setRiderUsefId(riderUsefId);
                        }
                     /*   if(dropValue[12] != null && dropValue[12].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[12]);
                            String horseUsaEq = (String)excelRow.get(pos);
                            HLCCompResultVO.setHorseUsaEq(horseUsaEq);
                        }
                      
                        if(dropValue[13] != null && dropValue[13].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[13]);
                            String riderUsaEq = (String)excelRow.get(pos);
                            HLCCompResultVO.setRiderUsaEq(riderUsaEq);
                        }*/
                        
                        if(dropValue[12] != null && dropValue[12].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[12]);
                            String ownerFirstName = (String)excelRow.get(pos);
                            HLCCompResultVO.setOwnerFirstName(ownerFirstName);
                        }
                        if(dropValue[13] != null && dropValue[13].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[13]);
                            String ownerLastName = (String)excelRow.get(pos);
                            HLCCompResultVO.setOwnerLastName(ownerLastName);
                        }
                        
                        if(dropValue[14] != null && dropValue[14].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[14]);
                            String ownerUseaId = (String)excelRow.get(pos);
                            HLCCompResultVO.setOwnerUseaId(ownerUseaId);
                        }
                        if(dropValue[15] != null && dropValue[15].trim().length()!=0) {
                            int pos = Integer.parseInt(dropValue[15]);
                            String ownerUsefId = (String)excelRow.get(pos);
                            HLCCompResultVO.setOwnerUsefId(ownerUsefId);
                        }
                        if(regUploadId!=null && regUploadId.trim().length()!=0){
                            Debug.print("session regUploadId is:" + regUploadId);
                            HLCCompResultVO.setRegUploadId(regUploadId);
                        }
                        status = vaigaiMeetingBean.createHorseRegMapData(HLCCompResultVO);
                        Debug.print("vaigaiMeetingBean.insertCompMapData(HLCCompResultVO) row count "+k+" status :"+status);
                        
                    }
                    if(status==true){
                        boolean stat = vaigaiMeetingBean.changeMapStatus(regUploadId);
                        Debug.print("changeEventMapStatus(uploadId) :"+stat);
                        return new ModelAndView("comp_mapping_errorPage");
                    }
                    
                } catch(Exception e) {
                    Debug.print("generel exception in servlet insertMapDatas block :" + e.getMessage());
                    e.printStackTrace();
                    boolean stat2 = vaigaiMeetingBean.deleteCompRegMappedDatas(regUploadId);
                    return new ModelAndView("comp_mapping_errorPage");
                }
            }
   }
    } catch(Exception e) {
        Debug.print("caught an exception in servlet : "+e);
        
    }
 
    
   

 

    
    
    return null;
}

}

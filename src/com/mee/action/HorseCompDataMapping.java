/*
 * HorseCompDataMapping.java
 *
 * Created on March 27, 2007, 11:47 AM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package com.mee.action;

import com.hlcmeeting.session.HLCVaigaiSessionBean;
import com.hlcmeeting.session.HLCVaigaiSessionRemote;
import com.hlcmeeting.session.HLCVaigaiSessionRemoteHome;
import com.mee.actionform.HorseCompDataMapActionForm;
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
 * @author karthikeyan
 */


	public class HorseCompDataMapping implements Controller {
    
    String fwd="";
    
    public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
        
        try {
            HttpSession session = request.getSession();
            
            HLCVaigaiSessionBean vaigaiMeetingBean=new HLCVaigaiSessionBean();
            HorseCompDataMapActionForm  horseCompForm = new HorseCompDataMapActionForm();
            FormFile fileUpload = horseCompForm.getFileUpload();
            String process = request.getParameter("process");
            Debug.print("process :"+process);
            
            if(process.equalsIgnoreCase("viewUpload")) {
                ArrayList eventDetails = new ArrayList();
                
                eventDetails = vaigaiMeetingBean.getEventTypeDetails();
                Debug.print("eventDetails.size() in servlet :"+eventDetails.size());
                
                request.setAttribute("eventDetails",eventDetails);
                
                fwd = "uploadHorseCompExcel";
                
            }
            
            if(process.equalsIgnoreCase("upload")) {
                //upload the  file
                
                String imagePath="C:/horse_comp_result_excel";
                String fullFilePath = "";
                
                String eventId = request.getParameter("eventId");
                String eventName = request.getParameter("eventName");
                String eventTypeId = request.getParameter("eventType");
                
                Debug.print("eventId :"+eventId);
                Debug.print("eventName :"+eventName);
                Debug.print("eventTypeId :"+eventTypeId);
                
              
                String fileName = fileUpload.getFileName();
                Debug.print("fileName :"+fileName);
                
                String[] tmpFileName = fileName.split("\\.");
                String finalFileName = "";
                
                Debug.print("tmpFileName.length :"+tmpFileName.length);
                
                for(int i=0;i<tmpFileName.length-1;i++) {
                    Debug.print("splitted file names :"+tmpFileName[i]);
                    
                    if(finalFileName.trim().length() != 0) {
                        finalFileName = finalFileName+"."+tmpFileName[i];
                    } else {
                        finalFileName = tmpFileName[i];
                    }
                }
                
                Debug.print("concatinated file name :"+finalFileName);
                
                java.util.Date curDat = new java.util.Date();
                fileName = finalFileName+" "+curDat.getTime()+"."+tmpFileName[tmpFileName.length-1];
                Debug.print("final Time Stamped fileName :"+fileName);
                
                Debug.print("ImagePath="+imagePath);
                BufferedOutputStream outFile = null;
                String imageFilePath = imagePath+File.separator+fileName;
                Debug.print("imageFilePath :"+imageFilePath);
                
                try {
                    //creating the temp dir if not exists
                    File fDir = new File(imagePath);
                    if (!fDir.exists()) {
                        if (!fDir.mkdir()) {
                            throw new IOException("Cannot create tmpdir for dimension file");
                        }
                    }
                    File newFile = new File(imageFilePath);
                    fullFilePath = newFile.getAbsolutePath();
                    Debug.print("NewFilePath ="+newFile.getAbsolutePath());
                    outFile = new BufferedOutputStream(
                            new FileOutputStream(newFile));
                    outFile.write(fileUpload.getFileData());
                    
                    String uploadId = vaigaiMeetingBean.insertCompResultUploadDetails(eventId,eventName,fullFilePath,eventTypeId);
                    Debug.print("remote.insertCompResultUploadDetails(eventId,eventName,fullFilePath) uploadId :"+uploadId);
                    request.setAttribute("uploadId",uploadId);
                    
                } catch (IOException ie) {
                    Debug.print("Error while writing into the file");
                } finally {
                    if(outFile!=null){
                        outFile.flush();
                        outFile.close();
                    }
                }
                
                request.setAttribute("fileName",fullFilePath);
                fwd="uploadHorseCompExcel_conf";
                
            }
            
            if(process.equalsIgnoreCase("Map")) {
                Vector excel = new Vector();
                Vector excelHead = new Vector();
                String stringValue="";
                
                String fileName = (String)request.getParameter("fileName");
                Debug.print("fileName :"+fileName);
                
                String uploadId = (String)request.getParameter("uploadId");
                Debug.print("uploadId :"+uploadId);
                
                session.setAttribute("uploadId",uploadId);
                
                InputStream input = new FileInputStream(fileName);
                
                try {
                    
           
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
                        //Debug.print("               Row Number "+i);
                        if(i!=0){
                            
                            //String[] excelAdd = new String[c];
                            ArrayList excelAdd = new ArrayList();
                            
                            while( cells.hasNext() ) {
                                
                                HSSFCell cell = (HSSFCell) cells.next();
                                Integer cellNumber = new Integer(cell.getCellNum());
                                int c = cellNumber.intValue();
                                //Debug.print("cellNumber.intValue() for rows :"+cellNumber.intValue());
                                
                                switch (cell.getCellType()) {
                                    case HSSFCell.CELL_TYPE_NUMERIC:
                                        Double numericValue = new Double(cell.getNumericCellValue());
                                        //Debug.print("Numeric Value "+numericValue);
                                        stringValue = String.valueOf(numericValue);
        
                                      
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_STRING:
                                        stringValue = (String)cell.getStringCellValue();
                                        //excel.add(stringValue);
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_FORMULA:
                                        stringValue = "";//(String)cell.getCellFormula();
                                        //excel.add(stringValue);
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_BOOLEAN:
                                        stringValue = String.valueOf(cell.getBooleanCellValue());
                                        //excel.add(stringValue);
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_BLANK:
                                        stringValue = "";
                                        //excel.add(strValue);
                                        
                                    default:
                                        //System.out.println("unsuported Cell type in Rows");
                                        break;
                                        
                                        
                                }
                                //Debug.print("j value:"+j);
                                //excelAdd[j] = stringValue;
                                //j++;
                                excelAdd.add(stringValue);
                                
                                Debug.print("               stringValue "+stringValue);
                                //Debug.print("excelAdd.size() :"+excelAdd.size());
                            }
                            
                            excel.add(excelAdd);
                        }
                        if(i==0){
                            while( cells.hasNext() ) {
                                HSSFCell cell = (HSSFCell) cells.next();
                                switch (cell.getCellType()) {
                                    case HSSFCell.CELL_TYPE_NUMERIC:
                                        Double numericValue = new Double(cell.getNumericCellValue());
                                        
                                        int value = numericValue.intValue();
                                        stringValue = String.valueOf(value);
                                        
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_STRING:
                                        stringValue = (String)cell.getStringCellValue();
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_FORMULA:
                                        stringValue = "";//(String)cell.getCellFormula();
                                        //excel.add(stringValue);
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_BOOLEAN:
                                        stringValue = String.valueOf(cell.getBooleanCellValue());
                                        //excel.add(stringValue);
                                        break;
                                        
                                    case HSSFCell.CELL_TYPE_BLANK:
                                        stringValue = "";
                                        
                                    default:
                                        System.out.println("unsuported Cell type in Column");
                                        break;
                                }
                                
                                excelHead.add(stringValue);
                                Debug.print("head stringValue added :"+stringValue);
                                
                            }
                        }
                    }
                    
                    Debug.print("columns excelHead.size() :"+excelHead.size());
                    Debug.print("rows excel.size() :"+excel.size());
                    
                    ArrayList tblDetails = new ArrayList();
                    tblDetails = vaigaiMeetingBean.getCompResultMappingTableDetails(uploadId);
                    Debug.print("tblDetails.size() in servlet : "+tblDetails.size());
                    
                    request.setAttribute("tblDetails",tblDetails);
                    
                    request.setAttribute("excelHead",excelHead);
                    request.setAttribute("excelRows",excel);
                    
                    fwd = "HorseCompExcel_mapping";
                    
                } catch(Exception e) {
                    fwd = "uploadHorseCompExcel_format_error";
                    Debug.print("Exception while retrieving data frm Excel :"+e);
                }
                
                finally {
                    input.close();
                }
            }
            
            if(process.equalsIgnoreCase("listUploadDetails")) {
                Debug.print("inside listUploadDetails block :");
                
                String dispStat = request.getParameter("dispStat");
                Debug.print("dispStat :"+dispStat);
                ArrayList compFileDetails = new ArrayList();
                String year = request.getParameter("year");
                
                if(dispStat == null) {
                    compFileDetails = vaigaiMeetingBean.listCompResultUploadDetails();
                } else {
                    compFileDetails = vaigaiMeetingBean.listCompResultUploadDetailsOnYear(year);
                }
                
                Debug.print("compFileDetails.size() in Servlet : "+compFileDetails.size());
                request.setAttribute("compFileDet",compFileDetails);
                request.setAttribute("year",year);
                
                fwd = "list-uploaded-exceldetails";
            }
            
            if(process.equalsIgnoreCase("insertMapDatas")) {
                Debug.print("inside insertMapDatas block :");
                
                String uploadId = (String)session.getAttribute("uploadId");
                Debug.print("session.getAttribute(uploadId) :"+uploadId);
                
                try {
                    
                    int dropCt = Integer.parseInt(request.getParameter("dropCt"));
                    Debug.print("drop down count is :"+dropCt);
                    
                    String[] dropValue = new String[dropCt];
                    String[] dBValue = new String[dropCt];
                    String dBNameValue ="";
                    
                    for(int i=0;i<dropCt;i++) {
                        String dropName = "colSel"+String.valueOf(i);
                        Debug.print("dropName :"+dropName);
                        
                        dropValue[i] = request.getParameter(dropName);
                        Debug.print("dropValue :"+dropValue[i]);
                        
                        dBNameValue = "dbVal"+String.valueOf(i);
                        Debug.print("dBName :"+dBNameValue);
                        
                        dBValue[i] = request.getParameter(dBNameValue);
                        Debug.print("dBValue :"+dBValue[i]);
                    }
                    
                    Vector excelRows = new Vector();
                    ArrayList excelRow = new ArrayList();
                    
                    excelRows = (Vector)session.getAttribute("excelRows");
                    Debug.print("excelRows.size() in Servlet : "+excelRows.size());
                    
                    for(int k=0;k<excelRows.size();k++) {
                        excelRow = (ArrayList)excelRows.get(k);
                        Debug.print("excel Row "+k+" contents size :"+excelRow.size());
                        
                        StringBuffer query = new StringBuffer();
                        
                        if(dBValue!=null && dBValue.length!=0){
                            
                            query.append("insert into tblMeeTempCompResults (upload_id, "+dBValue[0]);
                            
                            for(int j=1;j<dBValue.length;j++) {
                                query.append(", "+dBValue[j]);
                            }
                            query.append(") values (\'"+uploadId+"\',");
                            
                        }
                        
                        if(dropValue!=null &&dropValue.length!=0 && excelRows.size()!=0) {
                            if(dropValue[0]!=null && dropValue[0].trim().length()!=0) {
                                //ArrayList firstRow = (ArrayList)excelRows.get(k);
                                
                                int pos = Integer.parseInt(dropValue[0]);
                                Debug.print("Postion is "+pos);
                                String tmpValue = (String)excelRow.get(pos);
                                Debug.print("                       First Value To Query   "+tmpValue);
                                query.append("\'"+tmpValue.replaceAll("'","''")+"\'");
                            } else {
                                query.append("\' \'");
                            }
                        }
                        
                        for(int x=1;x<dropValue.length;x++) {
                            
                            String positionValue ="";
                            
                            if(dropValue[x] != null && dropValue[x].trim().length()!=0) {
                                int pos = Integer.parseInt(dropValue[x]);
                                positionValue = (String)excelRow.get(pos);
                                
                                query.append(",\'"+positionValue.replaceAll("'","''")+"\'");
                            } else {
                                query.append(",\' \'");
                                //query.append(""+null+"");
                            }
                        }
                        query.append(")");
                        
                        String finalQuery = query.toString();
                        // Debug.print(" Generated Query in servlet :"+finalQuery);
                        
                        boolean stat1 = vaigaiMeetingBean.insertCompResultDetailsByQuery(finalQuery);
                        Debug.print("insertCompResultDetailsByQuery(finalQuery) statue in servlet for record no -"+k+" :"+stat1);
                        
                    }
                    
              
                    boolean status = vaigaiMeetingBean.updateCompResultEventDet(uploadId);
                    Debug.print("updateCompResultEventDet(uploadId) in servlet:"+status);
                    
                    boolean stat = vaigaiMeetingBean.changeEventMapStatus(uploadId);
                    Debug.print("changeEventMapStatus(uploadId) :"+stat);
                    
                    fwd = "comp_mapping_success_conf";
                } catch(Exception e) {
                    Debug.print("generel exception in servlet insertMapDatas block :");
                    e.printStackTrace();
                    
                    boolean stat2 = vaigaiMeetingBean.deleteCompResultMappedDatas(uploadId);
                    Debug.print("deleteCompResultMappedDatas(uploadId) status in servlet while exception caught :"+stat2);
                    
                    fwd = "comp_mapping_errorPage";
                    
                }
            }
            
            if(process.equalsIgnoreCase("Delete")) {
                Debug.print("inside process Delete block :");
                
                try {
                    String fileName = (String)request.getParameter("fileName");
                    Debug.print("fileName :"+fileName);
                    
                    String uploadId = (String)request.getParameter("uploadId");
                    Debug.print("uploadId :"+uploadId);
                    
                    File fd = new File(fileName);
                    boolean delStat = fd.delete();
                    Debug.print("file delete status :"+delStat);
                                       
                    boolean stat1 = vaigaiMeetingBean.deleteCompResultDetails(uploadId);
                    Debug.print("deleteCompResultFileDetails(uploadId) status in servlet :"+stat1);
                    
                    boolean grpStat = vaigaiMeetingBean.deleteGroupResultDetails(uploadId);
                    Debug.print("deleteGroupResultDetails(uploadId) status in servlet :"+grpStat);
                    
                    boolean stat2 = vaigaiMeetingBean.deleteCompResultMappedDatas(uploadId);
                    Debug.print("deleteCompResultMappedDatas(uploadId) status in servlet :"+stat2);
                    
                    boolean stat = vaigaiMeetingBean.deleteCompResultFileDetails(uploadId);
                    Debug.print("deleteCompResultFileDetails(uploadId) status in servlet :"+stat);
                    
                } catch(Exception e) {
                    Debug.print("caught an exception in servlet : "+e);
                }
                
                fwd = "comp_mapping_delConf";
            }
            
        } catch(Exception e) {
            Debug.print("caught an exception in servlet : "+e);
            
        }
        
        return new ModelAndView(fwd);
    }
    
}

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.report.action;

import com.hlccommon.util.*;

import com.mrm.actionform.ReportActionForm;
import java.io.*;
import java.net.ProtocolException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.upload.FormFile;
import java.util.*;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;


import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;

/**
 *
 * @author parteek
 */

	public class ActionReport implements Controller {


		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
			
        String msg = request.getParameter("message");
        System.out.println("Message cmg ============="+msg);
         HttpSession session = request.getSession(true);
         //System.out.println("before the Error point");
        if (msg.equalsIgnoreCase("xlsToGraph") && msg != null) {
        	System.out.println("ater the error point");
            //String fileName = null;
            //ReportActionForm fbean = new ReportActionForm();
            //String reportTitle = fbean.getReportTitle();
            String reportTitle = "";
            //System.out.println("Report title:::::::::::::::"+reportTitle);
            //FormFile uploadFile = (FormFile) fbean.getXlsFile();

            //String chartType = fbean.getChartType();
            String chartType ="";
            //System.out.println("chartype" +chartType);
            
          //Multiple file upload Start here-----------------------------------------------	
            String paramName = "";
            List<FilePart> fileList = new ArrayList<FilePart>();
            String uploadFilePath ="";
            String directoryTemp = "C:\\upload\\";
			 String fileSavePath =  directoryTemp;/*save uploaded files to a 'Upload' directory in the web app*/
		        if (!(new File(fileSavePath)).exists()) {
		            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
		        }
		    

		    
		        String resp = "";
		        int i = 1;
		        
		        resp += "<br>Here is information about uploaded files.<br>";
		        try {
		            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
		            Part _part;
		            System.out.println("Inside multipart::::::::::::::::::");
		            //int k=0;
		            while ((_part = parser.readNextPart()) != null) {
		            	System.out.println("LOOP START"+_part.getName());
		            	paramName = _part.getName();
		            	
		            	
		            	
		                if (_part.isFile()) {
		                	System.out.println("File Uploadddd");
		                    FilePart fPart = (FilePart) _part;  // get some info about the file
		                    String uploadFileName = fPart.getFileName();
//		                    fileList = (List) fPart;
		                    fileList.add(fPart);
		                    //InputStream in = fPart.getInputStream();
		                    
		             
		                    
		                    if (uploadFileName != null) {
		                        long fileSize = fPart.writeTo(new File(fileSavePath));
		                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
		                        uploadFilePath=fileSavePath+uploadFileName;
			                    //db5.adddocumentfromstudent(user_id,name,saveFile);
		                        String status = "";
					             //db.adddocumentfromcustomer(userId,name,saveFile);
					             status = "success";
					             System.out.println("status from servlet : "+status);
					             request.setAttribute("status",status);
		                    } else {
		                        resp = "<br>The user did not upload a file for this part.";
		                    }
		                }
		                
		                if(_part.isParam()){
		                	System.out.println("Inside paramPart");
		                	ParamPart paramPart = (ParamPart)_part;
		                	if(paramName.equals("reportTitle")){
		                		reportTitle = paramPart.getStringValue();
		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
		                		
		                		//artiCnt = artiLength;
			                     
			                	 System.out.println("Report title in servlet : "+reportTitle);
			                	 
			                     
			                    /* if(artiCnt!=null && artiCnt.trim().length()!=0){
			                   	  artiSize = Integer.parseInt(artiCnt);
			                   	  System.out.println("artifact size is :::"+artiSize);
			                     }*/
		                	}
		                	
		                		//String artiFact = "artiFact"+k;
		                		//System.out.println("Check artifact in servlet"+artiFact);
		                	if(paramName.equals("chartType")){
		                		System.out.println("Inside chartType :::::::::::: ");
		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
		                		//factlist[k] = paramPart.getStringValue();
		                		chartType =paramPart.getStringValue();
		                		//factList.add(value);
		                		System.out.println("chartType in servlet :::::::::::: "+chartType);
		                		
		                		
		                		//k++;
		                	}
		                	
		                	
		                }
		                
		            }// end while 
		        } catch (java.io.IOException ioe) {
		            resp = ioe.getMessage();
		        }
        
//Multiple file upload end here-----------------------------------------------		
		    	                	 
		    	                	 
		    	                	 
          
                
                
                Vector dataHolder=xlsDataExtractor(uploadFilePath);
                                 
                //Print the data read
                System.out.println("Data Holder"+dataHolder.size());
    	        Vector patientNumber=printCellDataToConsole(dataHolder);
                 System.out.println("Number of patients"+patientNumber);
                session.setAttribute("patient",patientNumber);
                System.out.println("Size of patient"+patientNumber.size());
                session.setAttribute("title",reportTitle);
                System.out.println("Chart Type---------"+chartType);
               if (chartType.equalsIgnoreCase("Bar"))
               {
                    System.out.println("Inside Bar");
                  
                   return new ModelAndView("generateBarFromXLS");   	 
               }
                else if(chartType.equalsIgnoreCase("Pie"))
                {
                     System.out.println("Inside Pie");
                     return new ModelAndView("showGraph");
                }
                else if(chartType.equalsIgnoreCase("3D Pie")) {
                    System.out.println("Inside 3D");
                     return new ModelAndView("generate3DFromXLS"); }
                else if(chartType.equalsIgnoreCase("WaterFall"))
                {
                    ArrayList dataHolderNew= (ArrayList)xlsDataExtractorForLine(uploadFilePath);
                     session.setAttribute("dataholder",dataHolderNew);
                    return new ModelAndView("generateWaterFallFromXLS");
                }
                else 
                {
                     
                      ArrayList dataHolderNew= (ArrayList)xlsDataExtractorForLine(uploadFilePath);
                      ArrayList arr=(ArrayList)fetchingForXYLineFromXLS(dataHolderNew);
                      session.setAttribute("dataholder",dataHolderNew);
                      
                     return new ModelAndView("generateXYLineFromXLS");
                }
                
            }
            
 return null;
    }
	
         
    
         public Vector xlsDataExtractor(String filePath)
         {
              /** --Define a Vector
    	 	--Holds Vectors Of Cells
    	 */
        System.out.println("FilePath is:In action:"+filePath);   
             
    	Vector cellVectorHolder = new Vector();

    	try{
    	/** Creating Input Stream**/
    	
    	FileInputStream myInput = new FileInputStream(filePath);

    	/** Create a POIFSFileSystem object**/
    	POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);

    	/** Create a workbook using the File System**/
         HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);

         /** Get the first sheet from workbook**/
        HSSFSheet mySheet = myWorkBook.getSheetAt(0);

        /** We now need something to iterate through the cells.**/
          Iterator rowIter = mySheet.rowIterator(); 

          while(rowIter.hasNext()){
        	  HSSFRow myRow = (HSSFRow) rowIter.next();
        	  Iterator cellIter = myRow.cellIterator();
        	  Vector cellStoreVector=new Vector();
        	  while(cellIter.hasNext()){
        		  HSSFCell myCell = (HSSFCell) cellIter.next();
        		  cellStoreVector.addElement(myCell);
        	  }
        	  cellVectorHolder.addElement(cellStoreVector);
          }
    	}catch (Exception e){e.printStackTrace(); }
    	return cellVectorHolder;
              
             
         }
         private static Vector printCellDataToConsole(Vector dataHolder) {

		Vector patients=new Vector();
             for (int i=0;i<dataHolder.size(); i++){
                   Vector cellStoreVector=(Vector)dataHolder.elementAt(i);
			for (int j=0; j < cellStoreVector.size();j++){
                            System.out.println("CellStorevectro"+cellStoreVector.size());
				HSSFCell myCell = (HSSFCell)cellStoreVector.elementAt(j);
				String stringCellValue = myCell.toString();
                                System.out.println(stringCellValue+"\t");
                                patients.add(cellStoreVector);
				
			}
                   System.out.println();
			
		}
                return patients;
         }
         
              private static ArrayList fetchingForXYLineFromXLS(ArrayList dataHolder) {

		ArrayList patients=new ArrayList();
             for (int i=0;i<dataHolder.size(); i++){
                   ArrayList cellStoreVector=(ArrayList)dataHolder.get(i);
			for (int j=0; j < cellStoreVector.size();j++){
                            System.out.println("CellStorevectro"+cellStoreVector.size());
				HSSFCell myCell = (HSSFCell)cellStoreVector.get(j);
				String stringCellValue = myCell.toString();
                                System.out.println(stringCellValue+"\t");
                                patients.add(cellStoreVector);
				
			}
                   System.out.println();
			
		}
                return patients;
         }
               public ArrayList xlsDataExtractorForLine(String filePath)
         {
              /** --Define a Vector
    	 	--Holds Vectors Of Cells
    	 */
        System.out.println("FilePath is:In action:"+filePath);   
             
    	ArrayList cellVectorHolder = new ArrayList();

    	try{
    	/** Creating Input Stream**/
    	
    	FileInputStream myInput = new FileInputStream(filePath);

    	/** Create a POIFSFileSystem object**/
    	POIFSFileSystem myFileSystem = new POIFSFileSystem(myInput);

    	/** Create a workbook using the File System**/
         HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);

         /** Get the first sheet from workbook**/
        HSSFSheet mySheet = myWorkBook.getSheetAt(0);

        /** We now need something to iterate through the cells.**/
          Iterator rowIter = mySheet.rowIterator(); 

          while(rowIter.hasNext()){
        	  HSSFRow myRow = (HSSFRow) rowIter.next();
        	  Iterator cellIter = myRow.cellIterator();
        	  ArrayList cellStoreVector=new ArrayList();
        	  while(cellIter.hasNext()){
        		  HSSFCell myCell = (HSSFCell) cellIter.next();
        		  cellStoreVector.add(myCell);
        	  }
        	  cellVectorHolder.add(cellStoreVector);
          }
    	}catch (Exception e){e.printStackTrace(); }
    	return cellVectorHolder;
              
             
         }
}
         
         
         
   



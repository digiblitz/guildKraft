/*******************************************************************************
 * Copyright: 2019 digiBlitz Foundation
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
package com.external.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.login.action.KlgLoginAction;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.Part;

public class ExternalApplicationAction implements Controller  {
static Logger log = Logger.getLogger(ExternalApplicationAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
		Properties logProp = new Properties();      
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);	      
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled");
		try{
			GeneralDBAction db=new GeneralDBAction(); 
		String process = request.getParameter("process");
    	String appName = request.getParameter("app");
    	
    	
    	if(process.equalsIgnoreCase("extApp"))
    	{        		
    	
    		String fmurl = request.getParameter("fmurl");
    	String url = db.getExternalAppURL(appName);
    	request.setAttribute("urlName", appName);
    	
    	log.info("URL==============>"+url);
    	request.setAttribute("url", url);
    	request.setAttribute("fmurl", fmurl);
    	
    	//response.setHeader("X-Frame-Options", "SAMEORIGIN");	
    	//response.addHeader("x-frame-options", "sameorigin");	
    	//response.addCookie(null);
    	
    	 return new ModelAndView("frmExternalApp");
    //	return mapping.findForward("frmExternalApp");
    	}    
    	else if(process.equalsIgnoreCase("upLoadButton"))
    	{ 
    		 return new ModelAndView("uploaddocument");
    	}
    	
    	
    	 else if(process!=null && process.equalsIgnoreCase("uploaddocument")){
			 String userId = request.getParameter("userId"); 
			 //log.info("userId in upload document : "+userId);
			 
			 //String OUTPUT_FOLDER ="c:\\userdocuments\\";
			 String fileSavePath;
			 String UPLOAD_DIRECTORY ="c:\\userdocuments\\";
			 List<String> fileList = new ArrayList<String>();
// Single file upload start here--------------------------------------------------
/*
			 File fDir = new File(OUTPUT_FOLDER);
			 if (!fDir.exists()) {
			     fDir.mkdir();
			        
			     }

			       String saveFile = "";
			       String contentType = request.getContentType();
			       if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
			             DataInputStream in = new DataInputStream(request.getInputStream());
			             int formDataLength = request.getContentLength();
			             
			             byte dataBytes[] = new byte[formDataLength];
			             int byteRead = 0;
			             int totalBytesRead = 0;
			             while (totalBytesRead < formDataLength) {
			                   byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
			                   totalBytesRead += byteRead;
			             }
			             String file = new String(dataBytes);
			             saveFile = file.substring(file.indexOf("filename=\"") + 10);
			             saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			             saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
			             int lastIndex = contentType.lastIndexOf("=");
			             String boundary = contentType.substring(lastIndex + 1, contentType.length());
			             int pos;
			             pos = file.indexOf("filename=\"");
			             pos = file.indexOf("\n", pos) + 1;
			             pos = file.indexOf("\n", pos) + 1;
			             pos = file.indexOf("\n", pos) + 1;
			             int boundaryLocation = file.indexOf(boundary, pos) - 4;
			             int startPos = ((file.substring(0, pos)).getBytes()).length;
			             int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			           String fileename=saveFile;
			           	saveFile = OUTPUT_FOLDER +"\\"+ saveFile;
			           	log.info(saveFile);
			             File ff = new File(saveFile);
			             FileOutputStream fileOut = new FileOutputStream(ff);
			             fileOut.write(dataBytes, startPos, (endPos - startPos));
			             fileOut.flush();
			             fileOut.close();
			             
			             String status = "";
			             db.adddocumentfromcustomer(userId,fileename,saveFile);
			             status = "success";
			             log.info("status fro servlet : "+status);
			             request.setAttribute("status",status);
			       }
			       */
		//Single file upload end here-----------------------------------------
			     //Multiple file upload Start here-----------------------------------------------	
             //File files;

					 fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
				        if (!(new File(fileSavePath)).exists()) {
				            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
				        }
				    

				    
				        String resp = "";
				        int i = 1;
				        resp += "<br>Here is information about uploaded files.<br>";
				        try {
				            MultipartParser parser = new MultipartParser(request, 1024 * 1024 * 1024);  /* file limit size of 1GB*/
				            Part _part;
				            while ((_part = parser.readNextPart()) != null) {
				                if (_part.isFile()) {
				                    FilePart fPart = (FilePart) _part;  // get some info about the file
				                    String name = fPart.getFileName();
				                    fileList.add(name);
				                    
				                    //fPart.
				                    
				                    
				                    if (name != null) {
				                        long fileSize = fPart.writeTo(new File(fileSavePath));
				                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
				                        String saveFile=fileSavePath+name;
					                    //db5.adddocumentfromstudent(user_id,name,saveFile);
				                        String status = "";
							             db.adddocumentfromcustomer(userId,name,saveFile);
							             status = "success";
							             log.info("status fro servlet : "+status);
							             request.setAttribute("status",status);
				                    } else {
				                        resp = "<br>The user did not upload a file for this part.";
				                    }
				                }
				            }// end while 
				            if(fileList.isEmpty()== true){
				            	log.info("FileList is emplty-------");
				            }else{
				            	log.info("FileList is Not empty its length is "+fileList.size());
				            }
				           
				     
				        } catch (java.io.IOException ioe) {
				            resp = ioe.getMessage();
				        }
		//Multiple file upload end here-----------------------------------------------	
			     
			 //return new ModelAndView("uploadsuccess");	
			       return new ModelAndView("uploaddocument");
		 }
    	
    	 else if(process.equalsIgnoreCase("processList"))
     	{ 
    		 
    		 ArrayList<String> firstNameList = new ArrayList<String>();
    		 ArrayList<String> lastNameList = new ArrayList<String>();
    		 ArrayList<String> fileNameList = new ArrayList<String>();
    		 ArrayList<String> filePathList = new ArrayList<String>();
    		 db.getProcessList(firstNameList,lastNameList,fileNameList,filePathList);
    		 request.setAttribute("firstNameList" ,firstNameList);
    		 request.setAttribute("lastNameList" ,lastNameList);
    		 request.setAttribute("fileNameList" ,fileNameList);
    		 request.setAttribute("firstNameList" ,firstNameList);
             request.setAttribute("filePathList" ,filePathList);
    		 
     		 return new ModelAndView("processList");
     	}
    	
    	 else if(process!=null && process.equalsIgnoreCase("initdownloadfile")){
			  final int BUFFER_SIZE = 4096;
	             
			  String filename = request.getParameter("filename"); 
			  String pathname = request.getParameter("pathname"); 
			     String filePath =pathname;
			     log.info("pathname = " + filePath);
			  // get absolute path of the application
			     ServletContext context = request.getSession().getServletContext();
			       // String appPath = context.getRealPath("");
			       // log.info("appPath = " + appPath);
			 
			        // construct the complete absolute path of the file
			        String fullPath =filePath;      
			        File downloadFile = new File(fullPath);
			        FileInputStream inputStream = new FileInputStream(downloadFile);
			         
			        // get MIME type of the file
			        String mimeType = context.getMimeType(fullPath);
			        if (mimeType == null) {
			            // set to binary type if MIME mapping not found
			            mimeType = "application/octet-stream";
			        }
			        log.info("MIME type: " + mimeType);
			 
			        // set content attributes for the response
			        response.setContentType(mimeType);
			        response.setContentLength((int) downloadFile.length());
			 
			        // set headers for the response
			        String headerKey = "Content-Disposition";
			        String headerValue = String.format("attachment; filename=\"%s\"",
			                downloadFile.getName());
			        response.setHeader(headerKey, headerValue);
			 
			        // get output stream of the response
					
			        OutputStream outStream = response.getOutputStream();
			 
			        byte[] buffer = new byte[BUFFER_SIZE];
			        int bytesRead = -1;
			 
			        // write bytes read from the input stream into the output stream
			        while ((bytesRead = inputStream.read(buffer)) != -1) {
			            outStream.write(buffer, 0, bytesRead);
			        }
			 
			        outStream.flush();
			        inputStream.close();
			        outStream.close();
			    
			 
			 return null;//new ModelAndView("approvenroll");	 
		 }
    	 else if(process!=null && process.equalsIgnoreCase("initQB")){
    		 
    		 return new ModelAndView("QBConnection");
    	 }
    	
		} catch(Exception exp){
            exp.printStackTrace();
         }
    	
		return null;
	}	
	
	

}

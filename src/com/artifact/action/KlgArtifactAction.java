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
package com.artifact.action;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.struts.upload.FormFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.hlccommon.util.Debug;
import com.hlccommon.util.HLCMenuListVO;
import com.hlcform.stateless.HLCkaverystatelessBean;
import com.hlcmsg.groups.HLCMessageSessionBean;
import com.hlcrole.management.HLCBrahmaputraSessionBean;
import com.hlcsessionbean.krishna.HLCKrishnaStatelessBean;
import com.oreilly.servlet.multipart.FilePart;
import com.oreilly.servlet.multipart.MultipartParser;
import com.oreilly.servlet.multipart.ParamPart;
import com.oreilly.servlet.multipart.Part;
import com.svm.session.SatlujBean;
import com.systinet.info.SystinetStatelessBean;
//import com.view.action.viewActionForm;

public class KlgArtifactAction implements Controller {


		String userId = null;
	    Vector vObj = new Vector();
	    String status=null;
	    
		public ModelAndView handleRequest(HttpServletRequest request,
				HttpServletResponse response) throws ServletException, IOException,ProtocolException,
				IOException, ParserConfigurationException, SAXException {
		
	         HLCkaverystatelessBean humanMemb=new HLCkaverystatelessBean();
	         HLCMessageSessionBean msgBean=new HLCMessageSessionBean();
	         HLCBrahmaputraSessionBean roleBean=new HLCBrahmaputraSessionBean(); 
	         HLCKrishnaStatelessBean krishnaBean =new HLCKrishnaStatelessBean();
	         GeneralDBAction db=new GeneralDBAction();
	         SatlujBean artiftBean=new SatlujBean();
	        
	         HttpSession session=request.getSession(true); 
	         String process = request.getParameter("artiMapProcess");
	         Debug.print("KlgArtifactAction.process:" + process);
	         HLCMenuListVO objMap = new HLCMenuListVO();
	         HLCMenuListVO objArti = new HLCMenuListVO();
	         java.util.List artifactsList = null;
	         try
	         {
	         /*if(process.equals("orgLevel"))
	         {
	             artifactsList = artiftBean.displayOrgLevelArtifacts();
	             request.setAttribute("artifactsList", artifactsList);
	             Debug.print("KlgArtifactAction.displayOrgLevelArtifacts() sucessfully comes from servlet.");
	            
	             return new ModelAndView("strategicHome");   
	         }
	         
	         if(process.equals("bscLevel"))
	         {
	             artifactsList = artiftBean.displayBSCArtifacts();
	             request.setAttribute("artifactsList", artifactsList);
	             Debug.print("KlgArtifactAction.displayBSCArtifacts() sucessfully comes from servlet.");
	             return new ModelAndView("strategicBSC");  
	            
	         }
	         
	         if(process.equals("orderLevel"))
	         {
	             artifactsList = artiftBean.displayOrderArtifacts();
	             request.setAttribute("artifactsList", artifactsList);
	             Debug.print("KlgArtifactAction.displayOrderArtifacts() sucessfully comes from servlet.");
	           
	             return new ModelAndView("strategicOrder"); 
	         }
	         if(process.equals("orderToCashLevel"))
	         {
	             artifactsList = artiftBean.displayOrderToCashArtifacts();
	             request.setAttribute("artifactsList", artifactsList);
	             Debug.print("KlgArtifactAction.displayOrderToCashArtifacts() sucessfully comes from servlet.");
	           
	             return new ModelAndView("strategicOrderToCash"); 
	         }
	         if(process.equals("orderEntryLevel"))
	         {
	             artifactsList = artiftBean.displayOrderEntryArtifacts();
	             request.setAttribute("artifactsList", artifactsList);
	             Debug.print("KlgArtifactAction.displayOrderEntryArtifacts() sucessfully comes from servlet.");
	           
	             return new ModelAndView("strategicOrderEntry"); 
	         }
	         
	         if(process.equals("initAddArtifact"))
	            
	         
	         return new ModelAndView("frmAddArtifact");
	         try
	         {
	             if(process.equals("addOrgLevel"))
	             {
	                 String name = request.getParameter("name");
	                 System.out.print((new StringBuilder()).append("name ################").append(name).toString());
	                 String path = request.getParameter("filename");
	                 String level = request.getParameter("level");
	                 String type = request.getParameter("type");
	                 String desc = request.getParameter("desc");
	                 String newPath = "";
	                 int count = 0;
	                 (new File("c:/cvsArtifacts/artifacts")).mkdirs();
	                 if(path != null)
	                 {
	                     ArrayList arr = new ArrayList();
	                     for(StringTokenizer st = new StringTokenizer(path, "\\"); st.hasMoreTokens();)
	                     {
	                         arr.add(count, st.nextToken());
	                         count++;
	                     }

	                     newPath = (new StringBuilder()).append("c:/cvsArtifacts/artifacts/").append(arr.get(count - 1)).toString();
	                     FileInputStream fis = new FileInputStream(path);
	                     FileOutputStream fos = new FileOutputStream(newPath);
	                     int c;
	                     while((c = fis.read()) != -1) 
	                         fos.write((char)c);
	                 }
	                 artiftBean.addStrategicOrgLevelAtrifact(name, newPath, type, desc, level);
	                 request.setAttribute("added", "true");
	                 Debug.print("KlgArtifactAction.addStrategicOrgLevelAtrifact() sucessfully comes from servlet.");
	               
	                 return new ModelAndView("frmAddArtifact");
	             }
	             
	             

	             String userId = (String) session.getAttribute("userId");
	           
	            
	           //=============Dhivya Starts Here===================================  
	           //==================================================initArtifact Artifact Management =====================================================================================
	             if(process.equals("initCreateArtifact")){
	             	String mainArtifactName=request.getParameter("mainArtifactName");
	             	String mainArtiId=request.getParameter("mainArtiId");
	                  Debug.print("KlgArtifactAction.initCreateArtifact() sucessfully comes from servlet.");
	                  request.setAttribute("mainArtifactName",mainArtifactName);
	                  request.setAttribute("mainArtiId",mainArtiId);
	                 
	                  return new ModelAndView("frmAddArtifact");
	              }
	 //==================================================create Artifact Management =====================================================================================
	              else if(process.equals("createArtifact")){
	                  Debug.print("StrategicViewManagement.createArtifact()");
	                  String mainArtiname = request.getParameter("mainArtiname");
	 		
	                   String subArtiName = request.getParameter("subArtiName");
	                   String mainArtiId = request.getParameter("mainArtiId");
	                  
	                  Debug.print("KlgArtifactAction.createSubArtifact() subArtiName:" + subArtiName);
	                  
	                  if(mainArtiname!=null && subArtiName!=null && mainArtiId!=null){
	 		
	                      boolean result = roleBean.createSubArtifact(mainArtiname,subArtiName,mainArtiId);
	 		
	                      Debug.print("KlgArtifactAction.createSubArtifact()");
	                      if(result){
	 		
	                     	 request.setAttribute("mainArtiId",mainArtiId);
	                     	
	                        
	                          return new ModelAndView("frmRedrListArtifacts");
	 		
	                      }
	                      else{
	                     	 request.setAttribute("mainArtifactName",mainArtiname);
	                     	 request.setAttribute("mainArtiId",mainArtiId);
	                       
	                          return new ModelAndView("errRedirArtifact");
	                      }
	                  }
	                  Debug.print("KlgArtifactAction.createArtifact() sucessfully comes from servlet.");
	              }
	             
	              else if(process.equals("artifactList")){
	                  Debug.print("KlgArtifactAction.artifactList()");
	                  ArrayList artifactList = new ArrayList();
	                  String mapPerId=null;
	                  String retPrivViewId=null;
	                  ArrayList viewDrop = new ArrayList();
	                  
	                  
	                  if(request.getParameter("viewId")!=null){
	                 String viewId= request.getParameter("viewId");
	                 String viewName=roleBean.getViewName(viewId);
	                  session.setAttribute("viewVal", viewName);
	                  request.setAttribute("viewId", viewId);
	                  }        
	                  
	                  String sessionEntityId = (String)session.getAttribute("entityId");
	                  String sessionRoleId = (String)session.getAttribute("roleId");
	                  
	                  viewDrop = roleBean.getMyPrivilegesListForHeader(sessionRoleId, sessionEntityId);
	                  
	                  

	                   if(request.getParameter("mapId")!=null){
	                 	  mapPerId=request.getParameter("mapId");
	                   }else{
	                 	  mapPerId=(String) request.getAttribute("mainArtiId");  
	                   }
	                   Debug.print("KlgArtifactAction.artifactList mapPerId:" + mapPerId);
	                  
	                  artifactList = (ArrayList)roleBean.getAllSubArtifacts(mapPerId);
	                  String artifactName=roleBean.getArtifactName(mapPerId);

	                  request.setAttribute("allartifactList",null);
	                  request.setAttribute("allartifactList",artifactList);
	                  request.setAttribute("artifactName",artifactName);
	                  request.setAttribute("mapPerId",mapPerId);
	                  request.setAttribute("viewDrop",viewDrop);
	                  request.setAttribute("retPrivViewId",retPrivViewId);

	                  Debug.print("KlgArtifactAction.artifactList() sucessfully comes from servlet.");
	                  return new ModelAndView("frmListArtifacts");
	                  
	              }
	             
	              else if(process.equals("initeditArtifact")){
	                  Debug.print("KlgArtifactAction.initeditArtifact()");
	                  String artifactId = request.getParameter("artifactId");
	                  String mainArtifactName=request.getParameter("mainArtifactName");
	              	String mainArtiId=request.getParameter("mainArtiId");
	  
	                  if(artifactId!=null){
	                      String  subArti = roleBean.getSubArtifactName(artifactId);
	                      request.setAttribute("subArtifact",subArti);
	                  }
	                  request.setAttribute("mainArtifactName",mainArtifactName);
	                  request.setAttribute("mainArtiId",mainArtiId);
	                  request.setAttribute("artifactId",artifactId);
	                  
	                  Debug.print("KlgArtifactAction.initeditArtifact() sucessfully comes from servlet.");
	                 
	                  return new ModelAndView("frmEditArtifact");
	              } else if(process.equals("editArtifact")){
	                  Debug.print("KlgArtifactAction.editArtifact()");
	                 
	                  String artifactId = request.getParameter("artifactId");
	                  String mainArtifactName=request.getParameter("mainArtifact");
	              	String mainArtiId=request.getParameter("mainArtiId");
	              	
	              	String subArtifact=request.getParameter("subArtifact");
	 		
	                  boolean result = false;
	                
	                  if(artifactId!=null && artifactId.trim().length()!=0 && subArtifact!=null){
	 		
	                      result = roleBean.editSubArtifact(artifactId,subArtifact);
	 		
	                      Debug.print("KlgArtifactAction.editArtifact() result:" + result);
	                      if(result==true){
	                          Debug.print("KlgArtifactAction.editArtifact() result:" + result);
	                          if(artifactId!=null){
	                              String  subArti = roleBean.getSubArtifactName(artifactId);
	                              request.setAttribute("subArtifact",subArti);
	                          }
	                          request.setAttribute("mainArtifactName",mainArtifactName);
	                          request.setAttribute("mainArtiId",mainArtiId);
	                          request.setAttribute("artifactId",artifactId);
	                         
	                          return new ModelAndView("frmListArtifacts");
	                        
	                      }
	                      else{
	                          Debug.print("KlgArtifactAction.editArtifact() result:" + result);
	                          if(artifactId!=null){
	                              String  subArti = roleBean.getSubArtifactName(artifactId);
	                              request.setAttribute("subArtifact",subArti);
	                          }
	                         
	                          request.setAttribute("subArtifact", subArtifact);
	                          request.setAttribute("mainArtifactName",mainArtifactName);
	                          request.setAttribute("mainArtiId",mainArtiId);
	                          request.setAttribute("artifactId",artifactId);
	                          
	                          return new ModelAndView("frmEditArtifact");
	                      }
	                  }
	                  Debug.print("KlgArtifactAction.editArtifact() sucessfully comes from servlet.");
	              }
	             
	             
	             
	              else if(process.equals("deleteArtifact")){
	                  Debug.print("StrategicViewManagement.deleteArtifact()");
	                  String roleId = request.getParameter("roleId");
	                  String rolename = request.getParameter("rolename");
	                  String roledesc =request.getParameter("roledesc");
	                  
	                  String status = request.getParameter(roleId);
	                  String chkRoleIdArr[] = request.getParameterValues("chk");

	                  for(int i=0;i<chkRoleIdArr.length;i++)
	                  Debug.print("KlgArtifactAction.deleteArtifact() checked records: "+chkRoleIdArr[i]);

	                  boolean result = false;
	                  Debug.print("KlgArtifactAction.deleteArtifact() values:" + roleId+"==="+rolename+"==="+roledesc+status);

	                  if(chkRoleIdArr!=null){
	                    
	                      result = roleBean.deleteRole(chkRoleIdArr);
	                      Debug.print("KlgArtifactAction.deleteArtifact() result:" + result);
	                      if(result==true){
	                          Debug.print("KlgArtifactAction.deleteArtifact() result:" + result);
	                        
	                          if(chkRoleIdArr!=null){
	                              String[]  resultString = roleBean.getRole(chkRoleIdArr[0]);
	                              request.setAttribute("roleDetails",resultString);
	                          }
	                       
	                          return new ModelAndView("frmListArtifacts");
	                      }
	                      else{
	                          Debug.print("KlgArtifactAction.deleteArtifact() result:" + result);
	                        
	                          if(chkRoleIdArr!=null){
	                              String[]  resultString = roleBean.getRole(chkRoleIdArr[0]);
	                              request.setAttribute("roleDetails",resultString);
	                          }

	                          
	                          return new ModelAndView("frmEditArtifact");
	                      }
	                  }
	                  Debug.print("KlgArtifactAction.deleteArtifact() sucessfully comes from servlet");
	              } 
	             
	             
	             
	             
	             
	             
	             //=======================Dhivya Ends Here==========================================
	             */
	             
	               if(process.equals("loadArtifact")){
	                	
	                	ArrayList viewPntList = (ArrayList)db.getAllViews();                	
	                	ArrayList cntList = (ArrayList)db.getCount();
	
	                	if(request.getAttribute("errorMsg")!=null){
	                	String errorMsg=(String) request.getAttribute("errorMsg");
	                	request.setAttribute("errorMsg",errorMsg);
	                	}
	                                	
	                     request.setAttribute("viewPntList",viewPntList);	 	                    
	                     request.setAttribute("cntList",cntList);
	                     
	                     return new ModelAndView("frmArtifactMapList");
	                     
	                 }
	               
	              /* if(process.equals("beforeMapArtiDets")){ 
	            	   try{
	            	   
	                	 String viewPntId=request.getParameter("viewPntId");
	                	 System.out.println("viewPntId in servlet :::: "+viewPntId);
	                	 
	                	 String lobId=request.getParameter("lobId");
	                	 System.out.println("lobId in servlet :::: "+lobId);
	                	 
	                	 String viewId=request.getParameter("viewId");
	                	 System.out.println("viewId in servlet :::: "+viewId);
	                	 
	                	 String grpId=request.getParameter("grpId");
	                	 System.out.println("grpId in servlet :::: "+grpId);
                	 
	                	 String domProcId=request.getParameter("domProcId");
	                	 System.out.println("domProcId in servlet :::: "+domProcId);
	                	 
	                	 request.setAttribute("viewPntId", viewPntId);
	                	 request.setAttribute("lobId", lobId);
	                	 request.setAttribute("viewId", viewId);
	                	 request.setAttribute("grpId", grpId);
	                	 request.setAttribute("domProcId", domProcId);
	                	 
	                	 
	                	 ArrayList cntList = (ArrayList)db.getCount();
	                	 request.setAttribute("cntList", cntList);
	                	 
	                	 System.out.println("cntlist ArrayList in servlet "+cntList.size());
	                	 return new ModelAndView("frmArtifactMapList");
	                	 
	            	   }catch(Exception e){
	            		   e.printStackTrace();
	            	   }
	                	 
	                	 
	                 }
	                 
	        */
	               
	               else if(process.equals("mapArtiDets")){
	                	 
	                	/* String viewPntId=(String)request.getAttribute("viewPntId");
	                	 String lobId=(String)request.getAttribute("lobId");
	                	 String viewId=(String)request.getAttribute("viewId");
	                	 String grpId=(String)request.getAttribute("grpId");
	                	 String domProcId=(String)request.getAttribute("domProcId");
	                	 
	                	 System.out.println("viewPntId in servlet ::: "+viewPntId);
	                	 System.out.println("lobId in servlet ::: "+lobId);
	                	 System.out.println("viewId in servlet ::: "+viewId);
	                	 System.out.println("grpId in servlet ::: "+grpId);
	                	 System.out.println("domProcId in servlet ::: "+domProcId);*/
	                	 
	                	 
	                	String viewPntId = null;
	                	 String lobId=null;
	                	 String viewId=null;
	                	 String grpId=null;
	                	 String domProcId=null;
	                	 
	                	 //viewActionForm uploadForm = new viewActionForm(); 
	                	 
	                	 //userForm.
	                	// viewActionForm uploadForm=(viewActionForm)form;
	                	 System.out.println("1");
	                	 //List myFiles =(List) uploadForm.getUploads();
	                	 System.out.println("2");
	                	 //String filePath ="C:\\download";
	                	 
	                	 String fileSavePath;
	        			 String UPLOAD_DIRECTORY ="c:\\userdocuments\\";
	        			 List<FilePart> fileList = new ArrayList<FilePart>();
	      //File Upload start here---------------------------------------       
	                	 
	             /*
	                	 
	                	 for(int i=0;i<myFiles.size();i++){
	                		 System.out.println("3");
	                		 if(myFiles.get(i)!=null){
	                			 System.out.println("4");
	                	       FormFile myFile =(FormFile)myFiles.get(i) ;
	                	       System.out.println("5");
	                	       System.out.println("file---------------"+myFile.getFileName());
	                	       
	                	       
	                	      //write file
	                	       String uploadFileName = myFile.getFileName();
	                           String contentType = myFile.getContentType();     
	                           String tempFileName = myFile.getFileName();           
	                           int mid = uploadFileName.lastIndexOf(".");          
	                           String ext = uploadFileName.substring(mid + 1, uploadFileName.length());         
	                              
	                               int fileSize = myFile.getFileSize();
	                               byte[] fileData = myFile.getFileData();
	                             
	                               
	                               new File(filePath).mkdirs();
	                               File destDirectory = new File(filePath);
	                               boolean exists = (destDirectory.exists());
	                               if (!exists) {
	                                  
	                                   destDirectory.mkdirs();
	                               }

	                              System.out.println("after dir creation");
	                               
	                               if (!uploadFileName.equals("")) {
	                                  
	                                   File fileToCreate = new File(filePath, uploadFileName);
	                                  
	                                   System.out.println("after fileToCreate creation");
	                                   System.out.println("after fileToCreate creation"+fileToCreate.getName());
	                                   if (!fileToCreate.exists()) {
	                                       try {
	                                           FileOutputStream fileOutStream = new FileOutputStream(fileToCreate);
	                                           fileOutStream.write(myFile.getFileData());
	                                           fileOutStream.flush();
	                                           fileOutStream.close();
	                                          
	                                           System.out.println("after full write ");
	                                           
	                                          
	                                                                     
	                                       }    catch (Exception e) {
	                                       }
	                                
	                	   
	                                   }
	                               }
	                		 }
	                	 } 
	                	 
	                	 */
	    //File upload end here      
	                	 
	    //Test file upload start here------------------------
	                	//Multiple file upload Start here-----------------------------------------------	
	        			String artiName = "";
	        			String artiLength = "";
	        			String artiCnt = "";
	        			int artiSize = 0;
	        			String factlist[] = null;
	        			List<String> factList = new ArrayList<String>();
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
	        		            int k=0;
	        		            while ((_part = parser.readNextPart()) != null) {
	        		            	System.out.println("LOOP START"+_part.getName());
	        		            	artiName = _part.getName();
	        		            	
	        		            	
	        		            	
	        		                if (_part.isFile()) {
	        		                	System.out.println("File Uploadddd");
	        		                    FilePart fPart = (FilePart) _part;  // get some info about the file
	        		                    String name = fPart.getFileName();
//	        		                    fileList = (List) fPart;
	        		                    fileList.add(fPart);
	        		                    //InputStream in = fPart.getInputStream();
	        		                    
	        		             
	        		                    
	        		                    if (name != null) {
	        		                        long fileSize = fPart.writeTo(new File(fileSavePath));
	        		                        resp += i++ + ". " + fPart.getFilePath() + "[" + fileSize / 1024 + " KB]<br>";
	        		                        String saveFile=fileSavePath+name;
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
	        		                	if(artiName.equals("artiCnt")){
	        		                		artiLength = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                		
	        		                		artiCnt = artiLength;
	        			                     
	        			                	 System.out.println("artiCnt(Length) in servlet : "+artiCnt);
	        			                	 
	        			                     
	        			                     if(artiCnt!=null && artiCnt.trim().length()!=0){
	        			                   	  artiSize = Integer.parseInt(artiCnt);
	        			                   	  System.out.println("artifact size is :::"+artiSize);
	        			                     }
	        		                	}
	        		                	
	        		                		String artiFact = "artiFact"+k;
	        		                		System.out.println("Check artifact in servlet"+artiFact);
	        		                	if(artiName.equals(artiFact)){
	        		                		System.out.println("Inside for if : ");
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                		//factlist[k] = paramPart.getStringValue();
	        		                		String value =paramPart.getStringValue();
	        		                		factList.add(value);
	        		                		System.out.println("artifact list value in List  factlist["+k+"] :: "+factList.get(k));
	        		                		
	        		                		
	        		                		k++;
	        		                	}
	        		                	
	        		                	if(artiName.equals("viewPntId")){
	        		                		viewPntId = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                	}
	        		                	if(artiName.equals("lobId")){
	        		                		lobId = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                	}
	        		                	if(artiName.equals("viewId")){
	        		                		viewId = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                	}
	        		                	if(artiName.equals("grpId")){
	        		                		grpId = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                	}
	        		                	if(artiName.equals("domProcId")){
	        		                		domProcId = paramPart.getStringValue();
	        		                		System.out.println("Inside param :::: "+paramPart.getStringValue());
	        		                	}
	        		                }
	        		                
	        		            }// end while 
	        		        } catch (java.io.IOException ioe) {
	        		            resp = ioe.getMessage();
	        		        }
	        //Multiple file upload end here-----------------------------------------------		
	        			       
	   //Test file upload end here-----------------------------------
	                	 if(fileList.isEmpty()){
	                		 System.out.println("File list is Empty----------------");
	                	 }else{
	                		 System.out.println("File is not Empty");
	                	 }
	        		        
	                	 System.out.println("viewPntId in servlet ::: "+viewPntId);
   	                	 System.out.println("lobId in servlet ::: "+lobId);
   	                	 System.out.println("viewId in servlet ::: "+viewId);
   	                	 System.out.println("grpId in servlet ::: "+grpId);
   	                	 System.out.println("domProcId in servlet ::: "+domProcId);   
	                	 
	                	 Debug.print("ViewAction.grpId:" + grpId);
	                	 Debug.print("ViewAction.domProcId:" + domProcId);
	                	 boolean result =false;
	                	 String errorMsg=null;
	                	 objArti.setViewPtId(viewPntId);
	                	 if(lobId.equals("")){
	                		 System.out.println("inside lobId == null");
	                	 objArti.setLobLayerId(null);
	                	 }else{
	                		 System.out.println("inside lobId == Not null");
	                		 objArti.setLobLayerId(lobId); 
	                		 
	                	 }
	                	 if(viewId.equals("")){
	                		 System.out.println("inside viewId == null");
	                	 objArti.setViewId(null);
	                	 }
	                	 else{
	                		 System.out.println("inside viewId == Not null");
	                		 objArti.setViewId(viewId);
	                	 }
	                	 if(grpId.equals("")){
	                		 System.out.println("inside grpId == null");
	                		 objArti.setGroupsId(null);
	                		 
	                		 }
	                		 else{
	                			 System.out.println("inside grpId == Not null");
	                			 objArti.setGroupsId(grpId);
	                		 }
	                	 if(domProcId.equals("")){
	                		 System.out.println("inside domProcId == null");
	                		 objArti.setProcessDomainId(null);
	                		 }
	                		 else{
	                			 System.out.println("inside domProcId == Not null");
	                			 objArti.setProcessDomainId(domProcId);
	                		 }
	                	 System.out.println("objArti.getProcessDomainId() in servlet :::::"+objArti.getProcessDomainId());
	                	 System.out.println("objArti.getGroupsId() in servlet :::::"+objArti.getGroupsId());
	                	 System.out.println("objArti.getViewId() in servlet :::::"+objArti.getViewId());
	                	 System.out.println("objArti.getLobLayerId() in servlet :::::"+objArti.getLobLayerId());
	                	 System.out.println("objArti.getViewPtId() in servlet :::::"+objArti.getViewPtId());
	                	 
	                 
	                	 //String artiCnt = (String)request.getAttribute("artiCnt"); 
	                	   
	                     
	                     for(int j=0; j<artiSize; j++){
	                    	 System.out.println("Inside for loop in Servlet------------");
	                    	 String artiFact = "artiFact"+j;
	                    	 //String artiId=(String) request.getAttribute(artiFact);
	                    	// factlist[j] = factList.get(j);
	                    	 System.out.println("value of "+artiFact+" in servlet :: "+factList.get(j));
	                     	//if(request.getAttribute(artiFact)!=null && request.getAttribute(artiFact)!=""){  
	                     		if(factList.get(j)!=null && factList.get(j)!=""){  
	                     		 //FormFile myFile =(FormFile)myFiles.get(j) ;
	                     		FilePart fPart = (FilePart)fileList.get(j);
	                    //String artifactId=(String) request.getAttribute(artiFact);
	                    String artifactId=factList.get(j);
	                    String txtArtiDesc=request.getParameter("txtArtiDesc"+j);
	                    String filepath1=UPLOAD_DIRECTORY+"\\"+fPart.getFileName();
	                    System.out.println("file path------------------"+filepath1);
	                    objArti.setArtifactId(artifactId);
	                    objArti.setArtifactDesc(filepath1);
	                    
	                     result = db.insertArtifactMapDetails(objArti);           
	                    
	                     		
	                     	}
	                     }
	                     
	                     if(result==true){
	                    	 System.out.println("Inside Sucess part in Servlet--------------");
	                    	 return new ModelAndView("frmArtiMapSucess");
	                    
	                     }else{
	                    	 
	                    	 System.out.println("Inside else part in servlet-------------------");
	                    	  errorMsg="yes";
	                    	 request.setAttribute("errorMsg",errorMsg);
	                    	 ArrayList viewList = (ArrayList)db.getAllViews();
	 	                	ArrayList grpList = (ArrayList)db.getAllGroup();
	 	                	ArrayList grpDetList = (ArrayList)db.getGrpDetails();
	 	                	ArrayList cntList = (ArrayList)db.getCount();
	 	
	 	                
	 	                	
	 	                     request.setAttribute("viewList",viewList);	 
	 	                     request.setAttribute("grpDetList",grpDetList);	
	 	                     request.setAttribute("grpList",grpList);	
	 	                     request.setAttribute("cntList",cntList);	
	 	                     request.setAttribute("viewPointId",null);
	                    	 return new ModelAndView("frmViewPointMapping");
	                    	 	 
	                     }
           
	                 }
	             
	             if(process.equals("initArtifactMap")){
	                	
	                	ArrayList viewList = (ArrayList)db.getAllViews();
	                	ArrayList grpList = (ArrayList)db.getAllGroup();
	                	ArrayList grpDetList = (ArrayList)db.getGrpDetails();
	                	ArrayList cntList = (ArrayList)db.getCount();
	
	                
	                	
	                     request.setAttribute("viewList",viewList);	 
	                     request.setAttribute("grpDetList",grpDetList);	
	                     request.setAttribute("grpList",grpList);	
	                     request.setAttribute("cntList",cntList);	
	                     request.setAttribute("viewPointId",null);	
	                     return new ModelAndView("frmViewPointMapping");
	                  
	                 }
	             
	             else if(process.equals("listViewPointMap")){
            		 ArrayList viewList = (ArrayList)db.getAllViews();
            		
            		 String viewPointId=request.getParameter("viewPoint");
            		/*ArrayList userMapPointList=(ArrayList)roleRemote.getAllViewMapList();
            		 request.setAttribute("userMapPointList",userMapPointList);*/	
            		 request.setAttribute("viewList",viewList);	 
            		 request.setAttribute("viewPointId",viewPointId);
            		 return new ModelAndView("frmMappedViewPointList");
            		
             } 
	             else if(process.equals("searchMappedGroup")){
              	   ArrayList viewList = (ArrayList)db.getAllViews();
              	 String viewPointId=request.getParameter("viewPoint");
              		ArrayList userMapPointList=(ArrayList)db.getAllViewMapList(viewPointId);
              		 request.setAttribute("userMapPointList",userMapPointList);	
              		 request.setAttribute("viewPointId",viewPointId);	
              		 request.setAttribute("viewList",viewList);	 
              		return new ModelAndView("frmMappedViewPointList");
               }
	             else if(process.equals("listViewBasedOnViewPoint")){
                	 
                	 String viewPointId=request.getParameter("selVPointId");
                	 ArrayList viewList = (ArrayList)db.getAllViews();
	                	ArrayList grpList = (ArrayList)db.getAllGroup();
	                	ArrayList grpDetList = (ArrayList)db.getGrpDetails();
	                	ArrayList cntList = (ArrayList)db.getCount();
	                ArrayList viewPointList=(ArrayList)db.getAllViewsBasedOnViewPoint(viewPointId);
                		 request.setAttribute("viewPointList",viewPointList);	
                		 request.setAttribute("viewPointId",viewPointId);	
                		   request.setAttribute("viewList",viewList);	 
		                     request.setAttribute("grpDetList",grpDetList);	
		                     request.setAttribute("grpList",grpList);	
		                     request.setAttribute("cntList",cntList);
		                     return new ModelAndView("frmViewPointMapping");
                		 
                 }
	             
	             
	             
	             if(process.equals("initGroupView")){
	                	
	                	String masterId=request.getParameter("masterId");
	                   	ArrayList groupList =krishnaBean.getGroupValues();	                	
	                	request.setAttribute("groupList", groupList);	                	
	                	request.setAttribute("groupId", masterId);	                	
	                	 return new ModelAndView("frmAddListgroups");
	                   
	                }else if(process.equals("AddGroups")){
	                	String masterId=request.getParameter("masterId");
	                	ArrayList groupList =krishnaBean.getGroupValues();	                	
	                	request.setAttribute("groupList", groupList);
	                	request.setAttribute("groupId", masterId);
	                	return new ModelAndView("frmAddGroups");
	                
	                }
	                
	                else if(process.equals("createGroups")){
	                	
	                	String masterId=request.getParameter("masterId");
	                	String groupDet=request.getParameter("groupDet");
	                	boolean existStatus=krishnaBean.alreadyExistCheck(masterId,groupDet);
	                	if(existStatus==false){
	                	boolean status=krishnaBean.insertGroupDetails(masterId,groupDet);
	                
	                	ArrayList groupList =krishnaBean.getGroupValues();
	                	ArrayList viewGroupList =krishnaBean.getViewGroupValues(masterId);
	                	request.setAttribute("viewGroupList", viewGroupList);
	                
	                	request.setAttribute("groupList", groupList);
	                   	request.setAttribute("groupId", masterId);
	                   	return new ModelAndView("frmAddListgroups");
	                
	                	}else{
	                		
		                ArrayList groupList =krishnaBean.getGroupValues();		                		                	
		                request.setAttribute("groupList", groupList);
		                request.setAttribute("groupId", masterId);		                	
	                	request.setAttribute("status", "error");
	                	return new ModelAndView("frmAddGroups");
	                	 
	                	}
	                	
	                }
	                else if(process.equals("searchList")){
	                	
	                	String masterId=request.getParameter("masterId");
	                	String groupDet=request.getParameter("groupDet");	                  
	                	ArrayList groupList =krishnaBean.getGroupValues();
	                	ArrayList viewGroupList =krishnaBean.getViewGroupValues(masterId);
	                	request.setAttribute("viewGroupList", viewGroupList);	                	
	                	request.setAttribute("groupList", groupList);	                	
	                	request.setAttribute("groupId", masterId);
	                	return new ModelAndView("frmAddListgroups");
	                }
	                else if(process.equals("EditGroups")){
	                	
	                	String layer_value_id=request.getParameter("layer_value_id");
	                	String masterId=request.getParameter("masterId");
	                	ArrayList groupList =krishnaBean.getGroupValues();	
	                	String layerValue =krishnaBean.getGroupEditList(layer_value_id);	 
	                	request.setAttribute("layerValue", layerValue);
	                	request.setAttribute("groupList", groupList);
	                	request.setAttribute("groupId", masterId);
	                	return new ModelAndView("frmEditGroups");
	                }
	                else if(process.equals("update")){
	                	
	                	String masterId=request.getParameter("masterId");
	                	String groupDet=request.getParameter("groupDet");
	                	String layerId=request.getParameter("layerId");	                   	
	                	ArrayList groupList =krishnaBean.getGroupValues();
	                	boolean existStatus=krishnaBean.alreadyExistCheck(masterId,groupDet);
	                	if(existStatus==false){
	                	boolean status=krishnaBean.updateGroupDetails(layerId,masterId,groupDet);
	                	ArrayList viewGroupList =krishnaBean.getViewGroupValues(masterId);
	                	request.setAttribute("viewGroupList", viewGroupList);	                	
	                	request.setAttribute("groupList", groupList);	              
	                	request.setAttribute("groupId", masterId);
	                	return new ModelAndView("frmAddListgroups");
	                	
	                	}else{
	                		request.setAttribute("groupList", groupList);	      	              
		                	request.setAttribute("groupId", masterId);		                
		                	 request.setAttribute("status", "error");
		                	 return new ModelAndView("frmEditGroups");
		                	 
		                	}
	                	
	                }
	                else if(process.equals("deleteGroups")){
	                	String viewId=null;
	                	String masterId=null;
	                	String chkIds[]=request.getParameterValues("chk");
	                	 
	                	System.out.println("viewId---------"+viewId);
	                	 masterId=request.getParameter("masterId");
	                	 if(viewId==null){
	                		 viewId=request.getParameter("srchViewId");
	                	 }
	                	 if( masterId==null){
	                		 masterId=request.getParameter("srchMasterId");
	                	 }
	                	String groupDet=request.getParameter("groupDet");
	                 	System.out.println("masterId---------"+masterId+"------"+groupDet);
	                	 if(chkIds!=null){
	                         boolean delStatus=krishnaBean.deleteGroupValues(chkIds);
	                        }
	                	  
		                	ArrayList groupList =krishnaBean.getGroupValues();
		                	ArrayList viewGroupList =krishnaBean.getViewGroupValues(masterId);
		                	request.setAttribute("viewGroupList", viewGroupList);
		                	
		                	request.setAttribute("groupList", groupList);
		                	request.setAttribute("viewId", viewId);
		                	request.setAttribute("groupId", masterId);
		                	return new ModelAndView("frmAddListgroups");
		                	
	                }else if(process.equals("viewRoles"))
	                {
	                	String viewRoleId=request.getParameter("viewRoleId");
	                	ArrayList viewRoleList =krishnaBean.getViewRelatedRoles();
	                	ArrayList viewRoleLOBList =krishnaBean.getviewRoleLOB(viewRoleId);
	                 	ArrayList viewRoleUserList =krishnaBean.getViewRelatedRoleUsers(viewRoleId);
	                 	ArrayList viewUserLobList = krishnaBean.getUserMapLOBList();
	                	request.setAttribute("viewsRelatedRoleList", viewRoleList);
	                	request.setAttribute("viewRoleUserList", viewRoleUserList);
	                	request.setAttribute("viewRoleLOBList", viewRoleLOBList);
	                	request.setAttribute("viewRoleId", viewRoleId);
	                	request.setAttribute("viewUserLobList", viewUserLobList);
	                	return new ModelAndView("frmListViewsRoleUser");
	                	
	                }else if(process.equals("LobViewpointMapping"))
	                {
	                	String viewRoleId=request.getParameter("viewRoleId");
	                	String viewUserId=request.getParameter("userId");
	                	ArrayList viewRoleLOBList =krishnaBean.getviewRoleLOB(viewRoleId);
	                	ArrayList viewRoleViewpointList =krishnaBean.getviewRoleViewPoint();
	                	request.setAttribute("viewRoleLOBList", viewRoleLOBList);
	                	request.setAttribute("viewRoleViewpointList", viewRoleViewpointList);
	                	request.setAttribute("viewRoleId", viewRoleId);
	                	request.setAttribute("viewUserId", viewUserId);
	                	return new ModelAndView("frmListLobViewPoint");
	                	
	                }else if(process.equals("insertLobViewpointMapping"))
	                {
	                /*	String viewRoleId=request.getParameter("viewId");
	                	String viewUserId=request.getParameter("userId");
	                	String viewLobId=request.getParameter("lobId");*/
	                	String viewRoleId=request.getParameter("viewRoleId");
	                	String viewUserId=request.getParameter("userId");
	                	String viewLobId=request.getParameter("lobId");
	                	String[] viewPointId=request.getParameterValues("viewPointId");
	                	boolean insertStatus=krishnaBean.insertLobViewpointMap(viewRoleId,viewUserId,viewLobId,viewPointId);
	                	ArrayList viewRoleList =krishnaBean.getViewRelatedRoles();
	                	ArrayList viewRoleLOBList =krishnaBean.getviewRoleLOB(viewRoleId);
	                 	ArrayList viewRoleUserList =krishnaBean.getViewRelatedRoleUsers(viewRoleId);
	                	ArrayList viewRoleViewpointList =krishnaBean.getviewRoleViewPoint();
	                	ArrayList viewUserLobList = krishnaBean.getUserMapLOBList();
	                	request.setAttribute("viewRoleLOBList", viewRoleLOBList);
	                	request.setAttribute("viewRoleViewpointList", viewRoleViewpointList);
	                	request.setAttribute("viewUserLobList", viewUserLobList);
	                	request.setAttribute("viewRoleUserList", viewRoleUserList);
	                	request.setAttribute("viewsRelatedRoleList", viewRoleList);
	                	request.setAttribute("viewRoleId", viewRoleId);
	                	request.setAttribute("viewUserId", viewUserId);
	                	request.setAttribute("viewLobId", viewLobId);
	                	return new ModelAndView("frmListViewsRoleUser");
	                	
	                }
	                
	             //==================================================create Artifact Management =====================================================================================
	                 else if(process.equals("insertArtifactMap")){
	                     Debug.print("ViewAction.insertArtifactMap()");
	                     String view_point_Id = request.getParameter("viewId");
	    		
	                      String grpCnt = request.getParameter("grpSize");
	                      String artiCnt = request.getParameter("artiCnt");
	                      
	                      boolean result=false;
	                      int grpSize = 0;
	                      if(grpCnt!=null && grpCnt.trim().length()!=0){
	                    	  grpSize = Integer.parseInt(grpCnt);
	                      }    
	                      
	                      int artiSize = 0;
	                      if(artiCnt!=null && artiCnt.trim().length()!=0){
	                    	  artiSize = Integer.parseInt(artiCnt);
	                      }    
	                 
	                      int tmpSize=0;
	                      int tempSize=0;
	                      
	                      String lobMasterId="";
	                      String viewMasterId="";
	                      String groupsId ="";
	                      String processMasterId ="";
	                      String  domainMasterId = ""; 
	                      
	                      for(int i=0; i<grpSize; i++){
	                    	if(request.getParameter("grpsDet"+i)!=null && request.getParameter("grpsDet"+i)!=""){  
	               String grpDet = request.getParameter("grpsDet"+i);
	               String tempGrpDet="";
	                              
                
                  // tmpSize=0;
                   if(grpDet!=null && lobMasterId==""){
               	 String cntValue[] = grpDet.split("#");
                     lobMasterId = cntValue[0];
                    String lobLayerId = cntValue[1];
                   // String grpSequence = cntValue[2]; 
                	
                   // objMap.setMasterId(lobMasterId);
                    objMap.setLobLayerId(lobLayerId);
                   // objMap.setSequence(Integer.parseInt(grpSequence));
                    
                  }
                   else if(grpDet!=null && viewMasterId == "" && lobMasterId != ""){
                    	 String cntValue[] = grpDet.split("#");
                    	viewMasterId = cntValue[0];
                      String viewLayerId = cntValue[1];
                    // String orgAsstSequence = cntValue[2]; 
           		
                     // objMap.setMasterId(orgAsstMasterId);
                      objMap.setViewPtId(viewLayerId);
                     // objMap.setSequence(Integer.parseInt(orgAsstSequence));   
                        
                       }
                   else if(grpDet!=null && groupsId == "" && viewMasterId!="" && lobMasterId != ""){
                  	 String cntValue[] = grpDet.split("#");
                     groupsId = cntValue[0];
                    String groupsIdLayerId = cntValue[1];
                  // String orgAsstSequence = cntValue[2]; 
         		
                   // objMap.setMasterId(orgAsstMasterId);
                    objMap.setGroupsId(groupsIdLayerId);
                   // objMap.setSequence(Integer.parseInt(orgAsstSequence));   
                      
                     }
                  
                   else if(grpDet!=null && processMasterId == "" && groupsId != "" && lobMasterId != ""){
            		   
            		   String cntValue[] = grpDet.split("#");
                        processMasterId = cntValue[0];
                       String processLayerId = cntValue[1];
                    //   String processSequence = cntValue[2]; 
            		
                    //   objMap.setMasterId(processMasterId);
                       objMap.setProcessDomainId(processLayerId);
                     //  objMap.setSequence(Integer.parseInt(processSequence));       		   
                   }
                  /* else if(grpDet!=null && domainMasterId == "" && processMasterId != "" && orgAsstMasterId != "" && lobMasterId != ""){
            		   
            		   String cntValue[] = grpDet.split("#");
                        domainMasterId = cntValue[0];
                       String domainLayerId = cntValue[1];
                     // String domainSequence = cntValue[2]; 
            		
                      // objMap.setMasterId(domainMasterId);
                       objMap.setDomainId(domainLayerId);
                     //  objMap.setSequence(Integer.parseInt(domainSequence));   
            		   
            	   }*/
	      
	                      }
	                      }
	                      result = db.insertFrameworkMapDetails(view_point_Id,objMap,objArti); 	           
	                      
	                            
	        
						        if(result){       
						        	ArrayList viewList = (ArrayList)db.getAllViews();
				                	ArrayList grpList = (ArrayList)db.getAllGroup();
				                	ArrayList grpDetList = (ArrayList)db.getGrpDetails();
				                	ArrayList cntList = (ArrayList)db.getCount();
				
				                
				                	
				                     request.setAttribute("viewList",viewList);	 
				                     request.setAttribute("grpDetList",grpDetList);	
				                     request.setAttribute("grpList",grpList);	
				                     request.setAttribute("cntList",cntList);	
				                     request.setAttribute("viewPointId",null);	
				                     request.setAttribute("success","success");
				                    
				                     return new ModelAndView("frmViewPointMapping");
					  	//return mapping.findForward("frmArtifactMapSucess");           
						        }else{
						        	return new ModelAndView("frmRedArtifactMapList");    	
						        }
	                 }      
	             
	             
	             
	         }
	         catch(Exception exp)
	         {
	             Debug.print((new StringBuilder()).append("In KlgArtifactAction :").append(exp.getMessage()).toString());
	         }
	         
	         
	         
	     //    return mapping.findForward("LoginSuccess");
	         
	         //return new ModelAndView("LoginSuccess"); 
	    
		return null;	
		}	
	
	
	

}

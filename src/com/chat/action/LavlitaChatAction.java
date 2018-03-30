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
package com.chat.action;



import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;


import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.xmlrpc.XmlRpcException;
import org.jasypt.util.text.BasicTextEncryptor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.xml.parsers.DocumentBuilder;
//import javax.xml.parsers.DocumentBuilderFactory;



import com.google.gson.Gson;
import com.infusionejb.session.InfusionSessionBean;
//import com.user.action.KlgUserAction;
/*import java.io.File;
 import com.db.GeneralDBAction;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;*/
@Controller
public  class LavlitaChatAction  {

static Logger log = Logger.getLogger(LavlitaChatAction.class.getName());
	
	public static final String LOG_FILE = "Log4j.properties";
	InputStream is;
	Properties properties = new Properties();
	
	
	private InfusionSessionBean obj1;
	{
		try{
			obj1 = new InfusionSessionBean();
		}catch(Exception e){
			 throw new RuntimeException(e);
		}
	}
	
	static LavlitaChatAction lavitaChatAction = new LavlitaChatAction();
	
	/*@RequestMapping("/changePassword.html")
	public ModelAndView ViewChatBox1(HttpServletRequest request,
			HttpServletResponse response) throws RemoteException{
		
		String password = request.getParameter("password");
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword("sa");
        String  decryptPwd=textEncryptor.decrypt(password);
		System.out.println("decryptPwd --> "+decryptPwd);
		
		return new ModelAndView("frmHome");
	}
	*/
	
	@RequestMapping("/ViewChatBox.html")
	public ModelAndView ViewChatBox(HttpServletRequest request,
			HttpServletResponse response) throws RemoteException{
		return new ModelAndView("LavlitaChatApp/jsp/LavlitaFullwindowChatBox");
	}
	
	@RequestMapping("/storeChatMessages.html")
	public ModelAndView storeChatMessages(HttpServletRequest request,
			HttpServletResponse response) throws IOException{
		//=====================Properties log file configuration started here==============================
		
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      logProp.load(is); 
	      PropertyConfigurator.configure(logProp);      
	      log.info("Logging enabled"); 
	      properties.load(getClass().getClassLoader().getResourceAsStream("/chatConfig.properties"));
	      properties.load(getClass().getClassLoader().getResourceAsStream("/tagconfig.properties"));

	      //=====================Properties log file configuration started here==============================
	
	      
		
		String chatProcess = request.getParameter("chatProcess");
		String user = request.getParameter("user");
		String message = request.getParameter("message");
		String email = request.getParameter("email");
		System.out.println("user----------->"+user);
		System.out.println("message-------->"+message);
		
		if(chatProcess != null && chatProcess.equals("storeChatMessages")){
			
			String json = null;
			
			String fileSavePath;
		    final String UPLOAD_DIRECTORY = properties.getProperty("chatConfig.chatHistoryLoc");
		    String searchGregFilePath = properties.getProperty("chatConfig.searchGregFilePath");
		    String searchMarkFilePath = properties.getProperty("chatConfig.searchMarkFilePath");
		    String searchTagFilePath = properties.getProperty("tagconfig.searchTagFilePath");
		    String searchGeneralFilePath = properties.getProperty("chatConfig.searchGeneralFilePath");
		 

		    
		    String tempGregStore = null;
		    String tempMarkStore = null;
		    String tempGeneralStore = null;

		    try{
		          fileSavePath =  UPLOAD_DIRECTORY;/*save uploaded files to a 'Upload' directory in the web app*/
		        if (!(new File(fileSavePath)).exists()) {
		            (new File(fileSavePath)).mkdir();    // creates the directory if it does not exist        
		        }
		        
		        SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss a");				
				Date date = new Date();
				String strDate = formatter.format(date);				
				System.out.println("str ---> "+strDate);
				
				SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");	
				String fileDate = formatter1.format(date);
		        System.out.println("File date"+fileDate);
		        File newTextFile = new File(properties.getProperty("chatConfig.chatHistoryLoc")+email+".txt");
		        File chatHistTemp = new File(properties.getProperty("chatConfig.chatHistoryLoc")+email+"_temp"+".txt");
		        File chatReport = new File(properties.getProperty("chatConfig.chatReportLoc"));
		        boolean exists = newTextFile.exists();
		        FileWriter fw = null;
		        boolean existsTemp = chatHistTemp.exists();
		        FileWriter fwTemp = null;
		        boolean existsTempReport = chatReport.exists();
		        FileWriter fwTempReport = null;
		        
		        if(!exists && !existsTemp && !existsTempReport){
		        	System.out.println("from exixts");
		        	fw = new FileWriter(newTextFile);	
		        	fw.write(System.getProperty("line.separator"));
		        	fw.write(user+"-");
		        	fw.write(System.getProperty("line.separator"));
		        	fw.write(strDate);
		        	fw.write("   ");
		            fw.write(message);
		            fw.write(System.getProperty("line.separator"));
		            fw.close();
		            
		            System.out.println("from existsTemp");
		            fwTemp = new FileWriter(chatHistTemp);	
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.write(user+"-");
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.write(strDate);
		            fwTemp.write("   ");
		            fwTemp.write(message);
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.close();
		            
		            System.out.println("from existsTempReport");
		            fwTempReport = new FileWriter(chatReport);	
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.write(user+"-");
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.write(strDate);
		            fwTempReport.write("   ");
		            fwTempReport.write(message);
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.close();
		            
		        }else{
		        	/*if(user.equalsIgnoreCase("user")){
		        	clearTheFile(properties.getProperty("chatConfig.chatHistoryLoc")+email+"_temp"+".txt");
		        	}else{
		        		System.out.println("history file not cleared");
		        	}*/
		        	System.out.println("from else");
		            fw = new FileWriter(newTextFile,true); //the true will append the new data
		            fw.write(System.getProperty("line.separator"));
		            fw.write(user+"-");
		        	fw.write(System.getProperty("line.separator"));
		            fw.write(strDate);
		            fw.write("   ");
		            fw.write(message);//appends the string to the file
		            fw.write(System.getProperty("line.separator"));
		            fw.close();
		            
		            System.out.println("from else");
		            fwTemp = new FileWriter(chatHistTemp,true); //the true will append the new data
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.write(user+"-");
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.write(strDate);
		            fwTemp.write("   ");
		            fwTemp.write(message);//appends the string to the file
		            fwTemp.write(System.getProperty("line.separator"));
		            fwTemp.close();
		            
		            System.out.println("from else");
		            fwTempReport = new FileWriter(chatReport,true); //the true will append the new data
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.write(user+"-");
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.write(strDate);
		            fwTempReport.write("   ");
		            fwTempReport.write(message);//appends the string to the file
		            fwTempReport.write(System.getProperty("line.separator"));
		            fwTempReport.close();
		        }
		        
		       
	            
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
		    
		    try{
		        File gregFile = new File(searchGregFilePath);
		        boolean gregExists = gregFile.exists();
		        File markFile = new File(searchMarkFilePath);
		        boolean markExists = markFile.exists();
		        File generalFile = new File(searchGeneralFilePath);
		        boolean GeneralExists = generalFile.exists();
		        
		        
		        ArrayList returnSearch = null;
		        
		        if(gregExists && markExists&& GeneralExists && user.equalsIgnoreCase("user")){
		        	tempGregStore = readFile(searchGregFilePath);
		        	tempMarkStore = readFile(searchMarkFilePath);
		        	tempGeneralStore = readFile(searchGeneralFilePath);
		        	
		        	System.out.println("read file from greg------------------->"+tempGregStore);
		        	System.out.println("read file from mark------------------->"+tempMarkStore);
		        	System.out.println("read file from General------------------->"+tempGeneralStore);
		        	
		        	if((scanFile(message, searchGregFilePath) != null) && (scanFile(message, searchGregFilePath) != "") && !(scanFile(message, searchGregFilePath)).isEmpty()){
		        		
			        	if((scanFile(message, searchMarkFilePath) != null) && (scanFile(message, searchMarkFilePath) != "") && !(scanFile(message, searchMarkFilePath)).isEmpty()){
		        			System.out.println("search present in both greg & mark");
		        			String[] resMsg = {"both", scanFile(message, searchGregFilePath),scanFile(message, searchMarkFilePath), scanTagFile(message, searchTagFilePath)};
		        			
		        			returnSearch = new ArrayList();
		        			returnSearch.add(resMsg);
			        			json = new Gson().toJson(returnSearch);				 
			    	             response.setContentType("application/json");	             
			    	             response.getWriter().write(json);	
		        		}else{
		        			
		        			String[] resMsg = {"greg", scanFile(message, searchGregFilePath), scanTagFile(message, searchTagFilePath)};		        			
		        			returnSearch = new ArrayList();
		        			returnSearch.add(resMsg);
			        			System.out.println("search present in only greg");
			        			json = new Gson().toJson(returnSearch);				 
			    	             response.setContentType("application/json");	             
			    	             response.getWriter().write(json);
			        	}
		        	}else if((scanFile(message, searchMarkFilePath) != null) && (scanFile(message, searchMarkFilePath) != "") && !(scanFile(message, searchMarkFilePath)).isEmpty()){

		        		System.out.println("read file from mark------------------->"+tempMarkStore);

		        		System.out.println("search present in only mark");
		        		
		        		String[] resMsg = {"mark", scanFile(message, searchMarkFilePath), scanTagFile(message, searchTagFilePath)};	        			
	        			returnSearch = new ArrayList();
	        			returnSearch.add(resMsg);
		        			json = new Gson().toJson(returnSearch);				 
		    	             response.setContentType("application/json");	             
		    	             response.getWriter().write(json);
		        	
		        	}else if((scanFile(message, searchGeneralFilePath) != null) && (scanFile(message, searchGeneralFilePath) != "") && !(scanFile(message, searchGeneralFilePath)).isEmpty()){
		        		
		        		System.out.println("read file from general------------------->"+tempGeneralStore);
		        		System.out.println("search present in only general file");
		        		String[] resMsg = {"general", scanFile(message, searchGeneralFilePath), scanTagFile(message, searchGeneralFilePath)};
		        		
	        			returnSearch = new ArrayList();
	        			returnSearch.add(resMsg);
		        			json = new Gson().toJson(returnSearch);				 
		    	             response.setContentType("application/json");	             
		    	             response.getWriter().write(json);
		        	}
		        	else{
			        		System.out.println("search was not present in both greg & mark");
			        		String[] resMsg = {"notfound"};
		        			
		        			returnSearch = new ArrayList();
		        			returnSearch.add(resMsg);
			        			json = new Gson().toJson(returnSearch);				 
			    	             response.setContentType("application/json");	             
			    	             response.getWriter().write(json);
				    }
		        }else{
		        		System.out.println("greg & mark file was not found");
		        		String[] resMsg = {"notfound"};
	        			
	        			returnSearch = new ArrayList();
	        			returnSearch.add(resMsg);
		        			json = new Gson().toJson(returnSearch);				 
		    	             response.setContentType("application/json");	             
		    	             response.getWriter().write(json);
		        }
		    	
		    }catch (Exception e) {
		    	e.printStackTrace();
			}
		    
		}
		
		return null;
	}
	
	@RequestMapping("/sendChatMessages.html")
	public ModelAndView sendChatMessages(HttpServletRequest request,
			HttpServletResponse response) throws XmlRpcException, IOException{
		
		System.out.println("inside send msg------->");
		//=====================Properties log file configuration started here==============================
		
				Properties logProp = new Properties();  
			      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
			      logProp.load(is); 
			      PropertyConfigurator.configure(logProp);      
			      log.info("Logging enabled"); 
			      properties.load(getClass().getClassLoader().getResourceAsStream("/chatConfig.properties"));
			      //=====================Properties log file configuration started here==============================
		
		String chatProcess = request.getParameter("chatProcess");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String searchType = request.getParameter("searchType");
		String tagSearchVal = request.getParameter("tagSearchVal");
		System.out.println("tagSearchVal---"+tagSearchVal);
		String msgFileLoc = null;
		String chatHistory = null;
		System.out.println("searchType------------->"+searchType);
		System.out.println("Chat history--------------------->"+properties.getProperty("chatConfig.chatHistoryLoc"));
		String groupId;
		int contactId;
		if(chatProcess != null && chatProcess.equals("sendChatMessages")){
			
			Date date = new Date();
			SimpleDateFormat formatter1 = new SimpleDateFormat("dd-MM-yyyy");	
			String fileDate = formatter1.format(date);
			msgFileLoc = properties.getProperty("chatConfig.chatHistoryLoc")+email+"_temp"+".txt";
			chatHistory = readFile(msgFileLoc);
			
		 /*=========================Create Contact in infusion soft=================================*/
        boolean email_optinStatus = false;
        
        contactId= obj1.createContactInfusion(fname, lname, email);
      // contactId = obj1.createAndCheckDuplicateContact(fname, lname, email);
    	email_optinStatus = obj1.optin_outEmail(email);
    	System.out.println("Email optin status in infusionsoft---------------->"+email_optinStatus);
    	/*=========================Create Contact in infusion soft=================================*/
    	
    	
    	if(searchType.equalsIgnoreCase("greg") ){
			obj1.sendEmail(properties.getProperty("chatConfig.fromGregAddress"), email, properties.getProperty("chatConfig.ccAddress"), properties.getProperty("chatConfig.bccAddress"), "text", "Lavlita Chat History", "", chatHistory);
	    		//groupId = properties.getProperty("chatConfig.gregGroup");
			if(tagSearchVal != "" && tagSearchVal != null && !(tagSearchVal.isEmpty())){
	    		String []tagSplit = tagSearchVal.split("-");
	    		//System.out.println(tagSplit[0]);
	
	    		for(int i=0;i<tagSplit.length;i++){
	    			System.out.println("tagSplit[i]----"+tagSplit[i]);
	    			System.out.println(properties.getProperty("tagconfig."+tagSplit[i]));
	    		groupId = properties.getProperty("tagconfig."+tagSplit[i]);
	    		
	    		System.out.println("group id"+groupId);
	    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
	        	}
	    	//request.setAttribute("status", "init");
    		//return new ModelAndView("frmContacts");
			}else{
				groupId = properties.getProperty("chatConfig.gregGroup");
	    		
	    		System.out.println("group id"+groupId);
	    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
	    		//request.setAttribute("status", "init");
	    		//return new ModelAndView("frmContacts");
			}

    	}else if(searchType.equalsIgnoreCase("mark")){
        	obj1.sendEmail(properties.getProperty("chatConfig.fromMarkAddress"), email, properties.getProperty("chatConfig.ccAddress"), properties.getProperty("chatConfig.bccAddress"), "text", "Lavlita Chat History", "", chatHistory);
    		//groupId = properties.getProperty("chatConfig.markGroup");
        	
        	if(tagSearchVal != "" && tagSearchVal != null && !(tagSearchVal.isEmpty())){
    		String []tagSplit = tagSearchVal.split("-");
    		System.out.println("tagSplit array-----"+tagSplit);
    		
	    		for(int i=0;i<tagSplit.length;i++){
	    			System.out.println("tagSplit[i]----"+tagSplit[i]);
	    			System.out.println(properties.getProperty("tagconfig."+tagSplit[i]));
	    		groupId = properties.getProperty("tagconfig."+tagSplit[i]);
	    		System.out.println("group id"+groupId);
	
	    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
	    		}
	    		//request.setAttribute("status", "init");
	    		//return new ModelAndView("frmContacts");
				}else{
					groupId = properties.getProperty("chatConfig.markGroup");
		    		
		    		System.out.println("group id"+groupId);
		    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
		    		//request.setAttribute("status", "init");
		    		//return new ModelAndView("frmContacts");
				}
    	}else{
        	obj1.sendEmail(properties.getProperty("chatConfig.fromSalesAddress"), email, properties.getProperty("chatConfig.ccAddress"), properties.getProperty("chatConfig.bccAddress"), "text", "Lavlita Chat History", "", chatHistory);
        	groupId = properties.getProperty("chatConfig.gregGroup");
    		
    		System.out.println("group id"+groupId);
    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
    		//request.setAttribute("status", "init");
    		//return new ModelAndView("frmContacts");
    	}
    	clearTheFile(properties.getProperty("chatConfig.chatHistoryLoc")+email+"_temp"+".txt");
    	
    	
		}else if(chatProcess != null && chatProcess.equals("triggerforNoResponse")){
			contactId= obj1.createContactInfusion(fname, lname, email);
			if(tagSearchVal != "" && tagSearchVal != null && !(tagSearchVal.isEmpty())){
	    		String []tagSplit = tagSearchVal.split("-");
	    		System.out.println("tagSplit array-----"+tagSplit);
	    		
		    		for(int i=0;i<tagSplit.length;i++){
		    			System.out.println("tagSplit[i]----"+tagSplit[i]);
		    			System.out.println(properties.getProperty("tagconfig."+tagSplit[i]));
		    		groupId = properties.getProperty("tagconfig."+tagSplit[i]);
		    		System.out.println("group id"+groupId);
		    		if(groupId == null){
		    			groupId = properties.getProperty("chatConfig.gregGroup");
		    		}
		    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
		    		}
		    		//request.setAttribute("status", "init");
		    		//return new ModelAndView("frmContacts");
					}else{
						groupId = properties.getProperty("chatConfig.gregGroup");
			    		
			    		System.out.println("group id"+groupId);
			    		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
			    		//request.setAttribute("status", "init");
			    		//return new ModelAndView("frmContacts");
					}
		}
			
		return null;
	}
	
	String readFile(String fileName) throws IOException {
	    BufferedReader br = new BufferedReader(new FileReader(fileName));
	    try {
	    	
	        StringBuilder sb = new StringBuilder();
	        String line = br.readLine();

	        while (line != null) {
	        	System.out.println("inside while===="+line);
	            sb.append(line);
	            sb.append("\n");
	            line = br.readLine();
	        }
	      
	        return sb.toString();
	    } finally {
	        br.close();
	    }
	}
	
	public static String scanFile(String sentence, String searchFile) throws IOException {
		 // Scanner lineScan = new Scanner(new File("C:\\LavlitaSearch\\greg.txt"));
        //ArrayList<String> mylist = new ArrayList<String>();
        
        FileInputStream fstream = new FileInputStream(searchFile);
        BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
        
        String result = "";
        String strLine;
        while ((strLine = br.readLine()) != null)   {
        	  // Print the content on the console
        	 if (sentence.contains(strLine)) {
        		 //mylist.add(strLine);
        		 System.out.println ("inside loop---"+strLine);
        		 result = result + strLine+" AND ";
        		 System.out.println ("inside loop result---"+result);
        	 }
        }
        System.out.println("result.length() - 2-------------->"+(result.length() - 2));
        System.out.println("result.length() - 3-------------->"+(result.length() - 3));
        System.out.println("result.length() - 4-------------->"+(result.length() - 4));
        if(!(result.isEmpty()) || result != "" || !(result.equalsIgnoreCase(""))){
        result = result.substring(0, result.length() - 4);
        //System.out.println("length===="+mylist.size());
        System.out.println("scanFile-------------->"+result);
        }
        return result;
		
		
    }
	
	public static String scanTagFile(String sentence, String searchFile) throws IOException {
		 // Scanner lineScan = new Scanner(new File("C:\\LavlitaSearch\\greg.txt"));
      //ArrayList<String> mylist = new ArrayList<String>();
      
      FileInputStream fstream = new FileInputStream(searchFile);
      BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
      
      String result = "";
      String strLine;
      while ((strLine = br.readLine()) != null)   {
      	  // Print the content on the console
      	 if (sentence.contains(strLine)) {
      		 //mylist.add(strLine);
      		 //System.out.println (strLine);
      		 result = result + strLine+"-";
      	 }
      }

      //System.out.println("length===="+mylist.size());
      System.out.println(result);
      return result;
		
		
  }
	
	public static void clearTheFile(String FileName) throws IOException {
        FileWriter fwOb = new FileWriter(FileName, false); 
        PrintWriter pwOb = new PrintWriter(fwOb, false);
        pwOb.flush();
        pwOb.close();
        fwOb.close();
    }
	
	@RequestMapping("/filterSolrResponse.html")
	public ModelAndView filterSolrResponse(HttpServletRequest request,
			HttpServletResponse response) throws RemoteException{
		
		String solrResponse  = request.getParameter("solrResponse");
		String keywords = request.getParameter("keywords");
		solrResponse = solrResponse.replace("[", "");
		solrResponse = solrResponse.replace("]", "");
		solrResponse = solrResponse.replace("\n", "");
		solrResponse = solrResponse.replace("\t", "");
		solrResponse = solrResponse.replace("\"", "");
		System.out.println("solrResponse---------------------->"+solrResponse);
		System.out.println("keywords------------------->"+keywords);
		return null;
	}
	
	@RequestMapping("/sendNoResponseToSupportTeam.html")
	public ModelAndView sendNoResponseToSupportTeam(HttpServletRequest request,
			HttpServletResponse response) throws RemoteException, XmlRpcException{
		
		String firstName  = request.getParameter("firstName");
		String lastName  = request.getParameter("lastName");
		String email  = request.getParameter("email");
		String userQuery  = request.getParameter("userQuery");
		
		/*=========================Create Contact in infusion soft=================================*/
        boolean email_optinStatus = false;
        int contactId;
        contactId= obj1.createContactInfusion(firstName, lastName, email);
      // contactId = obj1.createAndCheckDuplicateContact(firstName, lastName, email);
    	email_optinStatus = obj1.optin_outEmail(email);
    	System.out.println("Email optin status in infusionsoft---------------->"+email_optinStatus);
    	/*=========================Create Contact in infusion soft=================================*/
    	String groupId;
    	obj1.sendEmail(properties.getProperty("chatConfig.fromSalesAddress"), properties.getProperty("chatConfig.careAddress"), properties.getProperty("chatConfig.ccAddress"), properties.getProperty("chatConfig.bccAddress"), "text", "Lavlita Chat History", "", userQuery);
    	groupId = properties.getProperty("chatConfig.personTag");
		
		System.out.println("group id"+groupId);
		obj1.addContactToGroupInfusion(contactId,Integer.parseInt(groupId));
		
		return null;
	}
	
	boolean flag = true;
	String ReportFilePath = null;
	String AIReport=null;
	
	public void sendChatReport(){
		Properties logProp = new Properties();  
	      is = (InputStream) getClass().getClassLoader().getResourceAsStream(LOG_FILE);
	      try {
	    	  
			  logProp.load(is);
			  PropertyConfigurator.configure(logProp);      
		      log.info("Logging enabled"); 
		      properties.load(getClass().getClassLoader().getResourceAsStream("/chatConfig.properties"));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} 
	   
	      ReportFilePath = properties.getProperty("chatConfig.chatReportLoc");
		System.out.println("Report file path---------------"+ReportFilePath);
		Thread t = new Thread() {
		 public void run(){  
			 
			 while(flag){
				 
			 System.out.println("Inside while loop==========");
			try {
				
				 File file = new File(ReportFilePath);
				 if(file.length() > 0){
					 AIReport = readFile(ReportFilePath);
				 }
				 else {
					AIReport = "No conversation report for this time period.";
				}
				  System.out.println("Printing the chat histry" +AIReport );
				  
				System.out.println("===================="+properties.getProperty("chatConfig.fromReportAddress")); 
				  
				  InfusionSessionBean.sendEmail(properties.getProperty("chatConfig.fromReportAddress"), properties.getProperty("chatConfig.toReportAddress"),properties.getProperty("chatConfig.ccReportAddress"), properties.getProperty("chatConfig.bccReportAddress"), "text", "guildKraft AI Report", "","Dear all,\n\n\t\t\t\t"+AIReport );
				  clearTheFile(ReportFilePath);
				  
		          Thread.sleep(2*60*60*1000);
		            
		            System.out.println("Thread sleep ======================" );
		          
		        } catch (Exception e) {
		        	flag=false;
		            e.printStackTrace();
		            
		        }
			
			 }
		 }  
	
	};
	
	t.start();
	}
	
	static{
	
		lavitaChatAction.sendChatReport();
	}
		
	
	
	/*@RequestMapping("/SearchGeneralMsg.html")
	public ModelAndView SearchGeneralMsg(HttpServletRequest request,
			HttpServletResponse response) throws RemoteException, XmlRpcException{
		String output = null;
		String str = null;
		
		   String search = request.getParameter("ques");
		   System.out.println("----------------"+ search);
		   String searchGeneralQuestionPath = properties.getProperty("chatConfig.searchGeneralQuestionPath");
		   
		try {	
			
			 File inputFile = new File(searchGeneralQuestionPath);
		        boolean GeneralXmlExists = inputFile.exists();
		 
		 if(GeneralXmlExists){
	         DocumentBuilderFactory dbFactory 
	            = DocumentBuilderFactory.newInstance();
	         DocumentBuilder dBuilder = dbFactory.newDocumentBuilder();
	         Document doc = dBuilder.parse(inputFile);
	         doc.getDocumentElement().normalize();
	         System.out.println("Root element :" 
	            + doc.getDocumentElement().getNodeName());
	         NodeList nList = doc.getElementsByTagName("doc");
	         System.out.println("----------------------------");
	         for (int temp = 0; temp < nList.getLength(); temp++) {
	            Node nNode = nList.item(temp);
	            System.out.println("\nCurrent Element :" 
	               + nNode.getNodeName());
	            if (nNode.getNodeType() == Node.ELEMENT_NODE) {
	               Element eElement = (Element) nNode;
	                str= eElement.getElementsByTagName("field").item(1).getTextContent();
	               if(str.contains(search)){
	            	    output = eElement.getElementsByTagName("field").item(2).getTextContent();
	            	   System.out.println("Question contain "+ str );
	            	  break;
	               }
	             
	                  
	              
	            }
	            //System.out.println("Answer "+ output );
	           
	         }
	         generalsearch = new ArrayList();
	         generalsearch.add(resMsg);
     			String json = new Gson().toJson(output);				 
 	             response.setContentType("application/json");	             
 	             response.getWriter().write(json);
	         System.out.println("Question : "+ str );
	         System.out.println("Answer "+ output );
		}}catch (Exception e) {
	         e.printStackTrace();
	      }
		return null;
	}*/
	
}

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
package com.hpsystinet.action;


import java.io.IOException;
import java.net.ProtocolException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.parsers.ParserConfigurationException;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
import org.xml.sax.SAXException;

import com.db.GeneralDBAction;
import com.form.SystinetRequestVo;
import com.systinet.info.SystinetStatelessBean;

import com.hp.systinet.lifecycle.remote.model.ApprovalVoter;
import com.hp.systinet.lifecycle.remote.model.Principal;
import com.hp.systinet.lifecycle.remote.model.StageCategory;
import com.hp.systinet.lifecycle.remote.model.VotingStatus;

public class KlgHpSystinetAction implements Controller {
	
	
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException,ProtocolException,
			IOException, ParserConfigurationException, SAXException {
	
	         SystinetStatelessBean hpsysBean=new SystinetStatelessBean();
	         GeneralDBAction db=new GeneralDBAction();	 
	        
	         HttpSession session=request.getSession(true); 
	         String sysProcess=request.getParameter("process");	
	         
	      
	        	/*  if(sysProcess!=null && sysProcess.equalsIgnoreCase("initArtadd")){	
	 			
	 			Map<String,String> artifactType=new HashMap();
	 	        
	 	    	 artifactType.put("hpsoaProjectArtifact", "Project");  
	 	    	 artifactType.put("hpsoaApplicationArtifact", "Application");
	 	    	 artifactType.put("businessServiceArtifact", "Service");  
	 	    	 artifactType.put("implementationArtifact", "Implementaion");
	 	    	 artifactType.put("hpsoaProcessArtifact", "Business Process");  
	 	    		     	
	 	    	ArrayList StageCycle=new ArrayList();
	 	    	StageCycle.add( "1");  
	 	    	StageCycle.add( "2");
	 	    	StageCycle.add( "3");  
	 	    	StageCycle.add( "4");  
	 	    	StageCycle.add( "5");
	 	    	
	 	    	ArrayList lifeCycle=new ArrayList();
	 	    	lifeCycle.add( "1");  
	 	    	lifeCycle.add( "2");
	 	    	lifeCycle.add( "3");  
	 	    	lifeCycle.add( "4");  
	 	    	lifeCycle.add( "5");
	 	    	
	 	    	ArrayList numberVoters=new ArrayList();
	 	    	numberVoters.add( "1");  
	 	    	numberVoters.add( "2");
	 	    	numberVoters.add( "3");  
	 	    	numberVoters.add( "4");  
	 	    	numberVoters.add( "5");
	 	    	
	 	    	Map<String,String> votesReq=new HashMap();
	 	    	votesReq.put(" Project_Managers "," Project Managers ");  
	 	    	votesReq.put( "BusinessAnalyst","BusinessAnalyst");
	 	    	votesReq.put(" Service_Providers ", "Service Providers");  	
	 			
	 	    	request.setAttribute("artifactType", artifactType);
	 		       request.setAttribute("lifeCycle", lifeCycle);
	 		       request.setAttribute("StageCycle", StageCycle);
	 		       request.setAttribute("numberVoters", numberVoters);
	 		       request.setAttribute("votesReq", votesReq);	
	 			
	 			
	 		      return new ModelAndView("SystinetArtifactadd");  
	 		} */ 
	         if(sysProcess!=null && sysProcess.equalsIgnoreCase("callArtadd")){
	 	    	
	 	    
	 	    	
	 	    	ArrayList addArtifact=new ArrayList();
	 	    	
	 	    	
	 	    	String addArtifacttype=request.getParameter("SelArtifacttype");
	 	    	String lifecycleProName=request.getParameter("txtLifeProcees");
	 	    	String numofStage=request.getParameter("selNolifeStage");
	 	    	String dateofCreation=request.getParameter("frmDate");
	 	    	String createdBy=request.getParameter("fullName");
	 	    	String stage=request.getParameter("selStages");
	 	    	String StageName=request.getParameter("txtstagename");
	 	    	String input=request.getParameter("txtInput");
	 	    	String process=request.getParameter("txtprocess");
	 	    	String voters=request.getParameter("selVotes");
	 	    	String output=request.getParameter("txtOutput");
	 	    	String descripition=request.getParameter("txtDesc");
	 	    	String vote=request.getParameter("selControls");
	 	    
	 			  if(session.getAttribute("artifactData")!=null){
	 				  addArtifact = (ArrayList) session.getAttribute("artifactData");
	 			  }
	 			  
	 			  
	 			  if(lifecycleProName != null && lifecycleProName.length()> 0){
	 			    	String [] artifactName = {lifecycleProName,numofStage,dateofCreation,createdBy,stage,StageName,input,process,voters,output,descripition,addArtifacttype,vote};
	 			    	
	 			    	addArtifact.add(artifactName);
	 			  }
	 			  
	 		  
	 	    	System.out.println("artifactName"+addArtifact+"inputID");
	 	    	System.out.println("lifecycleProName"+lifecycleProName+"numofStage"+numofStage+"dateofCreation"+dateofCreation+"createdBy"+createdBy+"stage"+stage+"input"+input+"process"+process+"control"+voters+"output"+output+"descripition"+descripition);
	 	    	
	 	    	
	 	    	Map<String,String> artifactType=new HashMap();
	 	        
	 	    	 artifactType.put("hpsoaProjectArtifact", "Project");  
	 	    	 artifactType.put("hpsoaApplicationArtifact", "Application");
	 	    	 artifactType.put("businessServiceArtifact", "Service");  
	 	    	 artifactType.put("implementationArtifact", "Implementaion");
	 	    	 artifactType.put("hpsoaProcessArtifact", "Business Process");  
	 	    	

	 	    	 
	 	    	
	 	    	
	 	    	ArrayList StageCycle=new ArrayList();
	 	    	StageCycle.add( "1");  
	 	    	StageCycle.add( "2");
	 	    	StageCycle.add( "3");  
	 	    	StageCycle.add( "4");  
	 	    	StageCycle.add( "5");
	 	    	
	 	    	ArrayList lifeCycle=new ArrayList();
	 	    	lifeCycle.add( "1");  
	 	    	lifeCycle.add( "2");
	 	    	lifeCycle.add( "3");  
	 	    	lifeCycle.add( "4");  
	 	    	lifeCycle.add( "5");
	 	    	
	 	    	ArrayList numberVoters=new ArrayList();
	 	    	numberVoters.add( "1");  
	 	    	numberVoters.add( "2");
	 	    	numberVoters.add( "3");  
	 	    	numberVoters.add( "4");  
	 	    	numberVoters.add( "5");
	 	    	
	 	    	Map<String,String> votesReq=new HashMap();
	 	    	votesReq.put(" Project_Managers "," Project Managers ");  
	 	    	votesReq.put( "BusinessAnalyst","BusinessAnalyst");
	 	    	votesReq.put(" Service_Providers ", "Service Providers");  
	 	    	
	 	    	
	 	    	
	 	       session.setAttribute("artifactType", artifactType);
	 	       session.setAttribute("lifeCycle", lifeCycle);
	 	       session.setAttribute("StageCycle", StageCycle);
	 	       session.setAttribute("numberVoters", numberVoters);
	 		   session.setAttribute("votesReq", votesReq);
	 		   session.setAttribute("artifactData", addArtifact);
	 		   
	 		   
	 		   request.setAttribute("lifecycleProName", lifecycleProName);
	 		   
	 		   request.setAttribute("numofStage",numofStage);
	 		  
	 		   request.setAttribute("dateofCreation",dateofCreation);
	 		 
	 		   request.setAttribute("addArtifacttype",addArtifacttype);
	 		   
	 		   
		 		  return new ModelAndView("SystinetArtifactadd");    
	 	    }
	 		
	 	
	         
	         if(sysProcess!=null && sysProcess.equalsIgnoreCase("systinetLifecycle")){
	 			
	 			
	 			 ArrayList artifactName=(ArrayList)session.getAttribute("artifactData");			
	 			 ArrayList stageList=new ArrayList();
	 			 boolean output1=false;
	 			 String processId=null;
	 			 String stageName="";
	 			 String tmpStage=""; 
	 	    	 String nextStage="";
	 	    	 String tmpvoter="";
	 	    	 String tempvotes="";
	 	    	 VotingStatus votedef= new VotingStatus();
	 				
	 				ApprovalVoter approverLsit =new ApprovalVoter();
	 				Principal prin =new Principal();
	 				
	 			 int k=1;
	 			 if (artifactName != null && artifactName.size() != 0) { 
	 		    	 Iterator evotesartifactName = artifactName.iterator();
	 		    	
	 		    	 while (evotesartifactName.hasNext()) {
	 		             String strType[] = (String[]) evotesartifactName.next();
	 		         	
	 				String lifecycleProName=strType[0]; System.out.println(" lifecycleProName : "+lifecycleProName);
	 		    	String numofStage=strType[1];System.out.println(" numofStage : "+numofStage);
	 		    	String dateofCreation=strType[2];System.out.println(" dateofCreation : "+dateofCreation);
	 		    	String createdBy=strType[3];System.out.println(" createdBy : "+createdBy);
	 		    	String stage=strType[4];System.out.println(" stage : "+stage);
	 		    	 stageName=strType[5];System.out.println(" stageName : "+stageName);
	 		    	String input=strType[6]; 
	 		    	String process=strType[7];System.out.println(" process : "+process);
	 		    	String voter=strType[8];System.out.println(" voter : "+voter);
	 		    	String output=strType[9];System.out.println(" output : "+output);
	 		    	String descripition=strType[10];System.out.println(" descripition : "+descripition);
	 		        String rootArtifact=strType[11]; System.out.println(" rootArtifact : "+rootArtifact);
	 		        String votes=strType[12];System.out.println(" votes : "+votes);
	 		        
	 		        String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName.trim().toLowerCase(); 
	 		        
	 		        String[] strArray = {""};
	 		    	Collection<String> subArti = Arrays.asList(strArray);
	 		    	
	 		    	 
	 		    	if(stage!=null && stage.equalsIgnoreCase("1")){
	 		    		
	 		    		StageCategory initialStage = new StageCategory(stageName.trim(),stageNameValue);
	 		    			        
	 		         processId=hpsysBean.createLifecycleinSystinet(lifecycleProName,descripition,rootArtifact,subArti,initialStage);
	 		               	        
	 		    	}
	 		    	
	 		    	session.setAttribute("processId",processId);
	 		    			  		    	
	 		    	    	
	 		    	String stages[]={stageName,voter,votes};
	 		    	stageList.add(stages);
	 		    	
	 			    if(k==1){
	 			    	
	 			    	 tmpStage=stageName;
	 			    	
	 			    	  System.out.println(" stage 1 : "+tmpStage);
	 			    	
	 			    }else if(k==2){
	 			  		    	
	 			    
	 			    	 
	 			    	String frmstageName=tmpStage;
	 		        	  String toStageName=stageName;
	 		        	  String frmStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageName.toLowerCase(); 
	 		        	  String toStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+toStageName.toLowerCase(); 
	 			    	
	 		        			        	 
	 		        	  System.out.println(" toStageNameValue : "+toStageNameValue);	        	  	        	  
	 		        		        	  
	 			    	 StageCategory frmStage=new StageCategory(frmstageName,frmStageNameValue);	
	 			    	 	
	 				      StageCategory toStage = new StageCategory(toStageName,toStageNameValue);				    		
	 	    		
	 				    		Collection<StageCategory> toStageV = Arrays.asList(toStage);
	 				    			    		
	 				    		 output1=hpsysBean.addStageToProcess(processId, frmStage, toStageV);	  	
	 			    	
	 				    		 System.out.println(" artifactName.size() : "+artifactName.size());
	 				    		 System.out.println(" output1 : "+output1);
	 				    		 if(artifactName.size()==k && output1==true){	
	 			    	 StageCategory dddStage = new StageCategory(toStageName,toStageNameValue);
	 			    	 
	 			    	 StageCategory toStagess = new StageCategory("","");
	 			    		
	 			    		Collection<StageCategory> toStageVss = Arrays.asList(toStagess);
	 			    		
	 			    		
	 			    	 output1=hpsysBean.addStageToProcess(processId, dddStage, toStageVss);	 
	 			    	 
	 		    	 } 
	 			    	 
	 			    	 nextStage=toStageName;
	 			    	 
	 			 
	 			    	 			    	 			    			    			    	
	 			 
	 			    	 
	 			    }else if(k==3){
	 			    	
	 			    	
	 			    	 String f3Voter=voter;
	 			    	 String f3Votes=votes;
	 			    	 
	 			    	String frmstageName=nextStage;
	 		        	  String toStageName=stageName;
	 		        	  String frmStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageName.toLowerCase(); 
	 		        	  String toStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+toStageName.toLowerCase(); 
	 			    	
	 			    	 StageCategory frmStage=new StageCategory(frmstageName,frmStageNameValue);	
	 			    	 	
	 				      StageCategory toStage = new StageCategory(toStageName,toStageNameValue);				    		
	 				    		    		
	 				    		Collection<StageCategory> toStageV = Arrays.asList(toStage);
	 				    			    		
	 				    		 output1=hpsysBean.addStageToProcess(processId, frmStage, toStageV);		    	
	 			    	
	 			    	
	 			    	  if(artifactName.size()==k && output1==true){	 
	 			    		  StageCategory dddStage = new StageCategory(toStageName,toStageNameValue);
	 					    	 
	 					    	 StageCategory toStagess = new StageCategory("","");
	 					    		
	 					    		Collection<StageCategory> toStageVss = Arrays.asList(toStagess);
	 					    		
	 					    		
	 					    	 output1=hpsysBean.addStageToProcess(processId, dddStage, toStageVss);	 
	 					    	 
	 						    	
	 					    }
	 			    	  
	 			    	  nextStage=stageName;
	 				    	
	 			    	  
	 			    	  System.out.println(" stage 3 : "+nextStage);
	 			    	 
	 				    
	 			    }else if(k==4){
	 			    	
	 			    		
	 			    	  
	 			    	  String f4Voter=voter;
	 				    	 String f4Votes=votes;
	 			    	String frmstageName=nextStage;
	 		        	  String toStageName=stageName;
	 		        	  String frmStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageName.toLowerCase(); 
	 		        	  String toStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+toStageName.toLowerCase(); 
	 			    	
	 			    	 StageCategory frmStage=new StageCategory(frmstageName,frmStageNameValue);	
	 			    	 	
	 				      StageCategory toStage = new StageCategory(toStageName,toStageNameValue);				    		
	 				    		    		
	 				    		Collection<StageCategory> toStageV = Arrays.asList(toStage);
	 				    			    		
	 				    		 output1=hpsysBean.addStageToProcess(processId, frmStage, toStageV);	  	
	 			    	
	 				    		 
	 				    		  if(artifactName.size()==k && output1==true){	 
	 					    		  StageCategory dddStage = new StageCategory(toStageName,toStageNameValue);
	 							    	 
	 							    	 StageCategory toStagess = new StageCategory("","");
	 							    		
	 							    		Collection<StageCategory> toStageVss = Arrays.asList(toStagess);
	 							    		
	 							    		
	 							    	 output1=hpsysBean.addStageToProcess(processId, dddStage, toStageVss);	 
	 							    	 
	 								    	
	 							    }
	 			   			    	
	 			    	nextStage=stageName;
	 			    	
	 			    	 System.out.println(" stage 4 : "+nextStage);
	 			    	 	    	
	 				    	 
	 				 
	 			    	  
	 			    }
	       else if(k==5){
	 			    	
	  		 
	 		  String f5Voter=voter;
	 	    	 String f5Votes=votes;
	 	    	 
	 			    	 String frmstageName=nextStage;
	 		        	  String toStageName=stageName;
	 		        	  String frmStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageName.toLowerCase(); 
	 		        	  String toStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+toStageName.toLowerCase(); 
	 			    	
	 			    	 StageCategory frmStage=new StageCategory(frmstageName,frmStageNameValue);	
	 			    	 	
	 				      StageCategory toStage = new StageCategory(toStageName,toStageNameValue);				    		
	 				    		    		
	 				    		Collection<StageCategory> toStageV = Arrays.asList(toStage);
	 				    			    		
	 				    		 output1=hpsysBean.addStageToProcess(processId, frmStage, toStageV);	
	 				    		 
	 				    		 
	 				    		  if(artifactName.size()==k && output1==true){	 
	 					    		  StageCategory dddStage = new StageCategory(toStageName,toStageNameValue);
	 							    	 
	 							    	 StageCategory toStagess = new StageCategory("","");
	 							    		
	 							    		Collection<StageCategory> toStageVss = Arrays.asList(toStagess);
	 							    		
	 							    		
	 							    	 output1=hpsysBean.addStageToProcess(processId, dddStage, toStageVss);	 
	 							    	 
	 								    	
	 							    }
	 			   			    	    		 
	 			    		    				    				   	  			    	
	 			    	nextStage=toStageName;
	 			    	
	 			    	
	 			    	 System.out.println(" stage 5 : "+nextStage);
	 			    	    			    	
	 			   		  		 
	 			    		 
	 			    	
	 			    	 		    	
	 			    }
	 			    
	 			    			    	 
	 		    	 k++;}
	 		    	 
	 		    	 }
	 		//==========================Add Task=======================================
	 			// String procId="b7b8b591-4694-435b-9ef1-401ecc9eca9d";
	 				
	 			/*	StageCategory stages = new StageCategory("Candidate","uddi:systinet.com:soa:model:taxonomies:lifecycleStages:candidate");
	 				
	 				Task task =new Task();
	 			Principal princ =new Principal();
	 			//Validation valid =new Validation();

	 			prin.setPrincipalName("Project_Managers");
	 			prin.setType(Principal.PrincipalType.ROLE);
	 			Collection<Principal> prinList = Arrays.asList(prin);

	 				task.setName("Sample1 Provide business requirements");
	 				//task.setApproverUserName("admin");
	 				task.setAssignees(prinList);	
	 				task.setDescription("Sample1 Attach a documentation of Business Requirements type");
	 				task.setArtifactUuid("contactArtifact");
	 				
	 				service.addTaskToProcess(procId, stages, task);*/

	 			 
	 			 /*if(stageList!=null && stageList.size()!=0){
	 				 Iterator evotesartifactNames = stageList.iterator();
	 			    	int j=1;
	 			    	
	 			    	Task task =new Task();
	 					Principal princ =new Principal();

	 					princ.setPrincipalName("Project_Managers");
	 					princ.setType(Principal.PrincipalType.ROLE);
	 					Collection<Principal> princLists = Arrays.asList(princ);
	 					
	 					 while (evotesartifactNames.hasNext()) {
	 			             String strTypes[] = (String[]) evotesartifactNames.next();	
	 			             
	 			         String stageName1=strTypes[0];
	 			         String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName1.toLowerCase(); 
	 		        	  StageCategory SingleStage=new StageCategory(stageName1,stageNameValue);	
	 		        	  
	 						task.setName("Sample1 Provide business requirements");
	 						//task.setApproverUserName("admin");
	 						task.setAssignees(princLists);	
	 						task.setDescription("Sample1 Attach a documentation of Business Requirements type");
	 						task.setArtifactUuid("contactArtifact"); 	
	 			    	
	 						remote.setTaskDetails(processId, SingleStage, task);
	 			    	
	 						j++; } 
	 			 }
	 			 */
	 			 
	 			 
	 			/*if(stageList!=null && stageList.size()!=0){
	 				 			
	 				 Iterator evotesartifactNames = stageList.iterator();
	 			    	int j=1;
	 			    
	 		    	 while (evotesartifactNames.hasNext()) {
	 		             String strTypes[] = (String[]) evotesartifactNames.next();	
	 		             
	 		         String stageName1=strTypes[0];  
	 		         String voter=strTypes[1];  
	 		         String votes=strTypes[2];  
	 		             
	 		         int vote=Integer.parseInt(votes);
	 		         
	 		         System.out.println(" stageName *** : "+stageName1);
	 		         System.out.println(" voter  : "+voter+"length of voter "+voter.length());
	 		         System.out.println(" votes  : "+votes);
	 		         
	 		         String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName1.toLowerCase(); 
	 	        	  StageCategory SingleStage=new StageCategory(stageName1,stageNameValue);	
	 		    	 			             
	 					prin.setPrincipalName("Project_Managers");
	 					prin.setType(Principal.PrincipalType.ROLE);
	 					
	 					approverLsit.setPrincipal(prin);
	 					approverLsit.setRequiredVotes(vote);
	 					//approverLsit.setPassiveTimeout(2);
	 					
	 					Collection<ApprovalVoter> prinList = Arrays.asList(approverLsit);

	 					votedef.setVoters(prinList);				
	 												
	 				remote.setvotingDetails(processId, SingleStage, votedef);   		 
	 		         
	 		         
	 				 
	 			j++; }
	 			 }
	 			 	*/			          
	 				        			     		          							 
	 				if(processId!=null && output1==true){
	 					boolean result=hpsysBean.publishProcess(processId);			
	 				
	 					boolean list=hpsysBean.addlifeCycleprocess(artifactName,processId);
	 				
	 					
	 				 request.setAttribute("Success","Successfully Created the lifecycle");
	 				 session.setAttribute("artifactData", null); 	    
	 				return new ModelAndView("SystinetArtifactadd"); 
	 				 }else{
	 					 request.setAttribute("Success","Error");
	 					 session.setAttribute("artifactData", null); 
	 					return new ModelAndView("SystinetArtifactadd");  
	 				 }		
	 				
	 				
	 				
	 				
	 			/* if (stageList != null && stageList.size()!= 0) { 
	 				 
	 				 Iterator evotesartifactName = stageList.iterator();
	 		    	
	 		    	int i=1;
	 		    	String tempStage="";
	 		    	String tempvoterN="";
	 		    	String tempvoteN="";
	 		    	
	 		    	 while (evotesartifactName.hasNext()) {
	 		             String strType[] = (String[]) evotesartifactName.next();	 
	 				 
	 		          String stage=strType[0];   
	 		          String voterN=strType[1]; 
	 		          String voteN=strType[2]; 
	 		    //System.out.println("Stage name in stageList()"+stage);
	 		   	    
	 		          if(i==1){
	 		        	tempStage=stage.trim();
	 		        	
	 		        	 System.out.println("Stage name inside if"+stage);
	 		          }else{
	 		        	  	       		        	  
	 		        	  String frmstageName=tempStage;
	 		        	  String toStageName=stage.trim();
	 		        	  String frmStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageName.trim().toLowerCase(); 
	 		        	  String toStageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+toStageName.trim().toLowerCase(); 
	 		        	  	        	  
	 		        	  StageCategory frmStage=new StageCategory(frmstageName,frmStageNameValue);	
	 			    	 	
	 				      StageCategory toStage = new StageCategory(toStageName,toStageNameValue);				    		
	 				    		    		
	 				    		Collection<StageCategory> toStageV = Arrays.asList(toStage);
	 				    			    		
	 				    		 output1=remote.addStageToProcess(processId, frmStage, toStageV);	  
	 		        						    		 
	 				    		 tempStage=toStageName;  
	 				    		 System.out.println("Stage name inside else "+toStageName);   		 
	 				 if(i==stageList.size()){   		 
	 				for(int j=i;j<=i;j++){
	 					//System.out.println("Inside else for "+stage);  	
	 					  String frmstageNametem=tempStage.trim();
	 		        	  String toStageNametem="";
	 		        	  String frmStageNameValuetem="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+frmstageNametem.trim().toLowerCase(); 
	 		        	  String toStageNameValuetem=""; 	
	 					
	 		        	  StageCategory frmStagefinal=new StageCategory(frmstageNametem,frmStageNameValuetem);	
	 			    	 	
	 				      StageCategory toStagefinal = new StageCategory(toStageNametem,toStageNameValuetem);	
	 					
	 				      System.out.println("Inside else for stage"+frmstageNametem); 
	 				      System.out.println("Inside else for stage"+toStageNametem); 
	 				      Collection<StageCategory> toStageVal = Arrays.asList(toStagefinal);
	 					 output1=remote.addStageToProcess(processId, frmStagefinal, toStageVal);	
	 				}
	 		          }
	 		          }
	 		          			             		            			 
	 		          i++; }
	 				 
	 			 }*/
	 		
	 			 
	 			

	 		}     
	         
	     
	         
	      
		         if(sysProcess!=null && sysProcess.equalsIgnoreCase("callArtifactBPList")) {
		 			
		 			
		 			ArrayList list=hpsysBean.listProcessView("bpm");
		 			ArrayList lifecycleExist=hpsysBean.getLifecycleProc("hpsoaProcessArtifact");
		 			boolean cycleExist=false;
		 			if (lifecycleExist != null && lifecycleExist.size() != 0) { 
		 				 Iterator lifecyL = lifecycleExist.iterator();
		 				 String lifecycleId=null;
		 			     String lifecyLName="";
		 				 while (lifecyL.hasNext()) {
		 			       String strType[] = (String[]) lifecyL.next();
		 			      
		 			        lifecycleId=strType[0];
		 			        lifecyLName=strType[1];
		 			                
		 			   	 
		 			}
		 				 System.out.println("lifecycleId"+lifecycleId);
		 				 
		 				 cycleExist=hpsysBean.isLifecycleExist(lifecycleId);			  
		 			    	request.setAttribute("cycleExist", cycleExist);
		 			  
		 			}	
		 			//request.setAttribute("lifecycleExist", lifecycleExist);
		 			request.setAttribute("list", list);

		 			
		 			return new ModelAndView("frmViewArtifacts");  
		 		}
		 				
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("busineessProce")) {
		        										  
						String govStatus=request.getParameter("govStat"); 
						
						request.setAttribute("govStatus", govStatus);
						return new ModelAndView("Systinetbusinessprocess");  
						 }	
			
			
			
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callEndGov")) {
					 
					 
					  String name=request.getParameter("name");
					 						
					  String artifactId=request.getParameter("artifactId");
					  String govstatus=request.getParameter("govstatus");
					 
					  boolean output=hpsysBean.endGovern(artifactId);
					  if(output==true){
						 boolean res=hpsysBean.updateArtifactMapDetails(artifactId, null);
						 boolean resWSBPM=hpsysBean.updateWSBPMgovStatus(artifactId, "Start");
						  
					  }
					  ArrayList list=hpsysBean.listProcessView(name);
						request.setAttribute("list", list);

					 
					     String fwd=request.getParameter("fwd");
					    request.setAttribute("id","");
					    hpsysBean.callEndGov();
					    return new ModelAndView(fwd);  
					
					}
		         
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callBPMList")) {

		     		try {
		     			
		     			ArrayList bundles = hpsysBean.viewWsBPMList("BPM");

		     			request.setAttribute("bpmData", bundles);

		     		} catch (Exception ex) {
		     			System.err.println("Caught an exception.");
		     			ex.printStackTrace();
		     		}		     		
		     		 return new ModelAndView("frmViewBPM");  
		     	}		         
		         
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callBPMEdit")) {

		     		
		     		try {
		     			String id=request.getParameter("id");
		     			String artUid=request.getParameter("artUid");
		     			String lifecycleId=request.getParameter("lifecycleId");
		     			String artifactName=request.getParameter("artifactName");
		     			String description=request.getParameter("description");
		     			String version = request.getParameter("version");
		     			
		     			ArrayList Stagename = hpsysBean.Stagename(lifecycleId,artUid);
		     			

		     			request.setAttribute("Stagename", Stagename);
		     			request.setAttribute("id", id);
		     			request.setAttribute("artUid", artUid);
		     			request.setAttribute("Stagename", Stagename);
		     			request.setAttribute("lifecycleId", lifecycleId);
		     			request.setAttribute("artifactName", artifactName);
		     			request.setAttribute("description", description);
		     			request.setAttribute("version", version);
		     		} catch (Exception ex) {
		     			System.err.println("Caught an exception.");
		     			ex.printStackTrace();
		     		}
		     		
		     		
		     		return new ModelAndView("Systinetfrmrequestbpm");  
		     	
		     	}
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("subBpRequest")) {
						
						SystinetRequestVo vo=new SystinetRequestVo();
						
						String id=request.getParameter("id");
						
						/*vo.setReqId(request.getParameter("reqId"));
						vo.setReqTitle(request.getParameter("reqTitle"));
						vo.setDate1(request.getParameter("date1"));
						vo.setDate2(request.getParameter("date2"));
						vo.setCurVersion(request.getParameter("curVersion"));
						vo.setModVersion(request.getParameter("modVersion"));
						vo.setReqPri(request.getParameter("reqPri"));
						vo.setReqDesc(request.getParameter("reqDesc"));
						vo.setArtUid(request.getParameter("artUid"));*/
				      
						
						
						/*
						 * Dhivya Here:Systinet Request call and inserting voting request in db
						 */		
						String artifactId=request.getParameter("artifactId");   
					    String lifecycleId=request.getParameter("lifecycleId"); 
					    String stageName=request.getParameter("stagename");
					   String stageNo=request.getParameter("Stagevalue");	
					   String artifactName=request.getParameter("artifactName");	
					   String description=request.getParameter("description");	
					  
					   int Stagevalue=Integer.parseInt(stageNo);
						String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName.toLowerCase();
						String status="pending";  	
						String reqName="bp";				
						
						vo.setReqId(request.getParameter("reqId"));
						vo.setReqTitle(request.getParameter("reqTitle"));
						vo.setDate1(request.getParameter("date1"));
						vo.setDate2(request.getParameter("date2"));
						vo.setCurVersion(request.getParameter("curVersion"));
						vo.setModVersion(request.getParameter("modVersion"));
						vo.setReqPri(request.getParameter("reqPri"));
						vo.setReqDesc(request.getParameter("reqDesc"));
						vo.setArtUid(artifactId);
				        vo.setStageName(stageName);
				        vo.setStageNo(Stagevalue);
						
				        System.out.println("artifactId inside subBpRequest:: "+artifactId);
				        
				     /*    String processUuid=remote.getProcUuid(artifactId);
				    	   String procesId=remote.getProcessId(processUuid);
				    	   String stateId=remote.getStateId(stageName, procesId);
				    	   String taskId=remote.getTaskId(stateId);*/
				    	   
						
						boolean reResult=hpsysBean.requestApproval(artifactId, "Requesting approval.");
					
						if(reResult==true){
						boolean reqOutput= hpsysBean.insertRequestDetails(artifactId, lifecycleId, stageName, stageNameValue, status, reqName, stageNo,request.getParameter("reqId"),artifactName,description);    		
						
						
					/*
					 * Ends	
					 */
						

					
						boolean insertReq = hpsysBean.insertRequestValues(vo,"BP");
						System.out.println("insertReq"+insertReq);
						
							
								System.out.println("insertReq"+insertReq);
						boolean update = hpsysBean.chgStatusWSBPM(lifecycleId,artifactId);				
							
						
						}
					
				       request.setAttribute("success", "success");
				       ArrayList bpmdata = hpsysBean.viewWsBPMList("BPM");

				       request.setAttribute("bpmData", bpmdata);

				       return new ModelAndView("frmViewBPM"); 
						
				}	     				
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callBundles")) {
		        	 try{
		        		 ArrayList bundles = hpsysBean.viewWsBPMList("WS");

		 				request.setAttribute("BundlesData", bundles);
		        	 }catch (Exception ex) {
		 				System.err.println("Caught an exception.");
						ex.printStackTrace();
					}
		        	 
		        	 return new ModelAndView("frmViewBundles"); 
		         }
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callBundlesEdit")) {

		 			
		 			
		 			String id=request.getParameter("id");
		 			  String artUid=request.getParameter("artUid");
		 			  String lifecycleId=request.getParameter("lifecycleId");
		 			
		 			/*
		 			 * Dhivya Here:WS
		 			 */
		 			String artifactName=request.getParameter("artifactName");
		 			String description=request.getParameter("description");
		 			request.setAttribute("artifactName", artifactName);
		 			request.setAttribute("description", description);
		 			
		 			/*
		 			 * Ends Here
		 			 */
		 			
		 			ArrayList Stagename = hpsysBean.Stagename(lifecycleId,artUid);
		 			  

		 			  request.setAttribute("Stagename", Stagename);
		 			  request.setAttribute("id", id);
		 			  request.setAttribute("artUid", artUid);
		 			  request.setAttribute("Stagename", Stagename);
		 			
		 			request.setAttribute("lifecycleId", lifecycleId);
		 			return new ModelAndView("frmViewBundleEdit"); 
		 		
		 		}		
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("subRequest")) {
		        	 SystinetRequestVo vo=new SystinetRequestVo();
		 			String id=request.getParameter("id");
		 			
		 			String artifactId=request.getParameter("artifactId");   
		 		    String lifecycleId=request.getParameter("lifecycleId"); 
		 		    String stageName=request.getParameter("stagename");
		 		   String stageNo=request.getParameter("Stagevalue");	
		 			int Stagevalue=Integer.valueOf(stageNo);
		 			  
		 			  vo.setReqId(request.getParameter("reqId"));
		 			  vo.setReqTitle(request.getParameter("reqTitle"));
		 			  vo.setDate1(request.getParameter("date1"));
		 			  vo.setDate2(request.getParameter("date2"));
		 			  vo.setCurVersion(request.getParameter("curVersion"));
		 			  vo.setModVersion(request.getParameter("modVersion"));
		 			  vo.setReqPri(request.getParameter("reqPri"));
		 			  vo.setReqDesc(request.getParameter("reqDesc"));
		 			  vo.setArtUid(artifactId);
		 			        vo.setStageName(stageName);
		 			        vo.setStageNo(Stagevalue);
		 			
		 			/*
		 			 * Dhivya Here:Systinet Request call and inserting voting request in db
		 			 */		
		 			
		 		   String artifactName=request.getParameter("artifactName");	
		 		   String description=request.getParameter("description");	
		 		  
		 		  
		 			String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName.toLowerCase();
		 			String status="pending";  	
		 			String reqName="ws";				
		 			
		 			vo.setReqId(request.getParameter("reqId"));
		 			vo.setReqTitle(request.getParameter("reqTitle"));
		 			vo.setDate1(request.getParameter("date1"));
		 			vo.setDate2(request.getParameter("date2"));
		 			vo.setCurVersion(request.getParameter("curVersion"));
		 			vo.setModVersion(request.getParameter("modVersion"));
		 			vo.setReqPri(request.getParameter("reqPri"));
		 			vo.setReqDesc(request.getParameter("reqDesc"));
		 			vo.setArtUid(artifactId);
		 	        vo.setStageName(stageName);
		 	        vo.setStageNo(Stagevalue);
		 			
		 	       /* String processUuid=remote.getProcUuid(artifactId);
		 	    	   String procesId=remote.getProcessId(processUuid);
		 	    	   String stateId=remote.getStateId(stageName, procesId);
		 	    	   String taskId=remote.getTaskId(stateId);*/
		 	    	   
		 			boolean reResult=hpsysBean.requestApproval(artifactId, "Requesting approval.");
		 		
		 			if(reResult==true){
		 			boolean reqOutput= hpsysBean.insertRequestDetails(artifactId, lifecycleId, stageName, stageNameValue, status, reqName, stageNo,request.getParameter("reqId"),artifactName,description);    		
		 			
		 			
		 		/*
		 		 * Ends	
		 		 */
		 	      
		 			boolean insertReq = hpsysBean.insertRequestValues(vo,"WS");
		 			boolean update = hpsysBean.chgStatusWSBPM(lifecycleId,artifactId);
		 			//boolean update = remote.chgStatusWSBPM(id,"WS");
		 			}
		 			
		 	       request.setAttribute("success", "success");
		 	       ArrayList bundles = hpsysBean.viewWsBPMList("WS");

		 	       request.setAttribute("BundlesData", bundles);

		 			return new ModelAndView("frmViewBundles");
		        	 
		         }
		         else if(sysProcess!=null && sysProcess.equalsIgnoreCase("artifactList")) {
		 			
		 			Map<String,String[]> votinglist=new HashMap();
		 		
		 			votinglist=hpsysBean.votingList();
		 			request.setAttribute("votinglist",votinglist);
		 		
		 			return new ModelAndView("SystinetBPVotingList"); 
		 			

		 		}
		 		
		 			else if(sysProcess!=null && sysProcess.equalsIgnoreCase("approved")) {	
		 			String value=request.getParameter("approved");
		 			
		 			
		 			boolean app=hpsysBean.changeapprovedstatus();
		 			
		 			Map<String,String[]> votinglist=new HashMap();
		 			
		 			votinglist=hpsysBean.votingList();
		 			request.setAttribute("votinglist",votinglist);
		 		
		 			return new ModelAndView("SystinetBPVotingList"); 
		 		
		 		}
		 		
		 			else if(sysProcess!=null && sysProcess.equalsIgnoreCase("denied")) {		
		 			
		 			String value=request.getParameter("denied");
		 			
		 			
		 			boolean app=hpsysBean.changedeniedstatus();
		 			
		 			Map<String,String[]> votinglist=new HashMap();
		 			
		 			votinglist=hpsysBean.votingList();
		 			request.setAttribute("votinglist",votinglist);
		 		
		 			return new ModelAndView("SystinetBPVotingList"); 
		 			
		 		}
		 		
		 		
		 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callBPReq")) {			
					
					
					String data = request.getParameter("frmDate");
					String req = request.getParameter("req");
					String reqId = request.getParameter("reqId");
					String reqPri = request.getParameter("reqPri");
					
					  ArrayList list = hpsysBean.viewBPReqList(data,req,reqId,reqPri);

				       request.setAttribute("list", list);
				       return new ModelAndView("frmBpRequest"); 
			 			
				}
		
		 		
	
		 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callArtifactWSList")) {	
			
			ArrayList list=hpsysBean.listProcessView("ws");
			

			request.setAttribute("list", list);

			return new ModelAndView("frmViewWSArtifacts"); 
 		
		}
		
			else if(sysProcess!=null && sysProcess.equalsIgnoreCase("callArtifactBPList")) {		
			ArrayList list=hpsysBean.listProcessView("bpm");
			ArrayList lifecycleExist=hpsysBean.getLifecycleProc("hpsoaProcessArtifact");
			boolean cycleExist=false;
			if (lifecycleExist != null && lifecycleExist.size() != 0) { 
				 Iterator lifecyL = lifecycleExist.iterator();
				 String lifecycleId=null;
			     String lifecyLName="";
				 while (lifecyL.hasNext()) {
			       String strType[] = (String[]) lifecyL.next();
			      
			        lifecycleId=strType[0];
			        lifecyLName=strType[1];
			                
			   	 
			}
				 System.out.println("lifecycleId"+lifecycleId);
				 
				 cycleExist=hpsysBean.isLifecycleExist(lifecycleId);			  
			    	request.setAttribute("cycleExist", cycleExist);
			  
			}	
			
			request.setAttribute("list", list);

			return new ModelAndView("frmViewArtifacts"); 
 		
		}	         
		         
		       
			else if(sysProcess!=null && sysProcess.equalsIgnoreCase("loadCreateBp")) {	
			return new ModelAndView("Systinetbusinessprocess.jsp"); 
 			
		 }
				 
		
				else if(sysProcess!=null && sysProcess.equalsIgnoreCase("busineessProceSubmit")) {			  
			 
				  
				  try {
					  String id=request.getParameter("id");
						String gov=request.getParameter("gov");
						String govStatus=request.getParameter("govStatus");
						
					  ArrayList bpprocess=new ArrayList();
					  ArrayList popbpprocess=new ArrayList();
					  
					  String artifactTypeId="hpsoaProcessArtifact"; //Testing Purpose
					  
					  String bpname=request.getParameter("bpname");
					  System.out.println("bpel name Name=========>>" +bpname);
					     String bppath=request.getParameter("bppath");
					     String bpdesc=request.getParameter("bpdesc");
					     String bpcriticality=request.getParameter("bpcriticality");
					     String bpversion=request.getParameter("bpversion");
					     String bptrname=request.getParameter("bptrname");
					     String bplocation=request.getParameter("bplocation");
					     System.out.println("name111111"+bpname+"path2222222222"+bppath+"desc333333333333"+bpdesc+"criticality3333333333333"+bpcriticality+"version4444444"+bpversion+"trname5555555"+bptrname+"location66666666"+bplocation);
					     						    						  						  						     
					     if(bpname!= ""){
					    	 System.out.println("Inside bpel name if");
					      String[] popprocess={bpname,bppath,bpdesc,bpcriticality,bpversion,bptrname,bplocation};				      
					      popbpprocess.add(popprocess);			      
					      
					     }
					     System.out.println("popbpprocess===="+popbpprocess.size());
					     session.setAttribute("popbpprocess", popbpprocess);
					     
					  String name=request.getParameter("name");
					  //System.out.println("Document Name=========>>" +docname);
					     String cons=request.getParameter("cons");
					     String desc=request.getParameter("desc");
					     String criticality=request.getParameter("criticality");
					     String version=request.getParameter("version");
					     System.out.println("name11111111111111"+name+"cons222222222222"+cons+"desc333333333333333"+desc+"criticality44444444444444444"+criticality);
					     if(name != ""){
					    	 System.out.println("Inside bpname if");
					        String[] bppro={name,cons,desc,criticality,version};
					        bpprocess.add(bppro);
					     }
					        System.out.println("bpprocess===="+bpprocess.size());
					        session.setAttribute("bpprocess", bpprocess);
					        
					      //  ArrayList bpdoc = null;
					        ArrayList docbpprocess=new ArrayList();
					        String docname=request.getParameter("docname");
					        System.out.println("Document Name=========>>" +docname);
					        String docdesc=request.getParameter("docdesc");
					        System.out.println("Document desc=========>>" +docdesc);
					        String docpath=request.getParameter("docpath");
					        System.out.println("Document path=========>>" +docpath);
					        String doclocat=request.getParameter("doclocat");
					        System.out.println("Document location=========>>" +doclocat);
					        if(docname != ""){
					        	 System.out.println("Inside docname if");	
					        String[] docbppro={docname,docdesc,docpath,doclocat};
					        
					        docbpprocess.add(docbppro);
					        }
					        System.out.println("docbpprocess===="+docbpprocess.size());
					        session.setAttribute("docbpprocess", docbpprocess);			        
					        

		    boolean result=false;		        
		    System.out.println("name ---> "+name);
		    String artifactUUIDChk=hpsysBean.getArtifactUUid(name); 
			 String artifactUUID=null;
					 
			 System.out.println("artifactUUIDChk ---> "+artifactUUIDChk);
			
			if (artifactUUIDChk == null || artifactUUIDChk == "")		
			{
		     artifactUUID = hpsysBean.bpproceesSubmit(bpprocess,popbpprocess,docbpprocess,artifactUUIDChk);
			System.out.println("Inside systinet servlet, artifactUUID " +artifactUUID);
			 
			}
			
	//======Dhivya Here:Setting lifecycle to the artifact(starting governance)==============================
		
			System.out.println("artifactUUID after bpproceesSubmit " +artifactUUID);
			if (artifactUUID!=null)					
			{	
	ArrayList lifecycleList=hpsysBean.getLifecycleProc(artifactTypeId);
	boolean cycleExist=false;
	if (lifecycleList != null && lifecycleList.size() != 0) { 
		 Iterator lifecyL = lifecycleList.iterator();
		 String lifecycleId=null;
	     String lifecyLName="";
		 while (lifecyL.hasNext()) {
	       String strType[] = (String[]) lifecyL.next();
	      
	        lifecycleId=strType[0];
	        lifecyLName=strType[1];
	                	   	 
	}	 
		 
		 cycleExist=hpsysBean.isLifecycleExist(lifecycleId);
	    if(cycleExist==true){
	    	 result=hpsysBean.startGovern(artifactUUID, lifecycleId);	
	    }else{
	    	request.setAttribute("ErrorMsg", "Unable to start the governance as there is no lifecycle process available!!.");
	    }
	        
	  if(result==true){
		  String reqName="bp";
		 
		 boolean output=hpsysBean.updateArtifactMapDetails(artifactUUID, lifecycleId);
		if(output==true){
			boolean wsbpmRes=hpsysBean.updateWSBPM(artifactUUID,"End", name);
			
		}
		 
	  }
		 
		/* remote.requestApproval(artifactUUID, "Requesting approval.") ;
		 	 
		ArrayList stageList=remote.getStageDetails(lifecycleId);
		 
		if (stageList != null && stageList.size() != 0) { 
			 Iterator stagecyL = stageList.iterator();
			
			 while (stagecyL.hasNext()) {
		       String strTypes[] = (String[]) stagecyL.next();
		      
		        String stageNo=strTypes[0];
		        String stageName=strTypes[1];
		        String totStage=strTypes[2];
		        String stageNameValue="uddi:systinet.com:soa:model:taxonomies:lifecycleStages:"+stageName.toLowerCase(); 
		        String status="";
		        if(Integer.parseInt(stageNo)==1){        	
		          status="pending";  	
		        }else{
		        	 status="Null"; 
		        }
		        System.out.println("Inside servlet action artifactUUID ="+artifactUUID+"  stageName="+stageName+"  lifecycleId="+lifecycleId+"  stageNameValue="+stageNameValue+"  status="+status+"  reqName="+reqName+"  stageNo="+stageNo);
		        boolean reqOutput= remote.insertRequestDetails(artifactUUID, lifecycleId, stageName, stageNameValue, status, reqName, stageNo);        
		}
		}
		 
	  }*/
	      
	    			
		}

			}
		 	 
			
		
					
					   System.out.println("start governance result"+result);   				      
					  session.setAttribute("popbpprocess", null); 
					  session.setAttribute("bpprocess", null);
					  session.setAttribute("docbpprocess", null);
					  
					  ArrayList list=hpsysBean.listProcessView("bpm");
						

						request.setAttribute("list", list);					
						request.setAttribute("stopGov","stopGov");
						request.setAttribute("id",id);
					      
				  }
				     
				  catch (Exception ex) {
				   System.err.println("Caught an exception.");
				   ex.printStackTrace();
				  }
				  return new ModelAndView("frmViewArtifacts"); 
		 		
				 }
				 	         
		
				else if(sysProcess!=null && sysProcess.equalsIgnoreCase("webserviceProce")) {	
				  
						String govStatus=request.getParameter("govStat"); 
						
						request.setAttribute("govStatus", govStatus);	 
				  
						return new ModelAndView("Systinetwebservice"); 
			 	
				 }
				 
				 
				
					 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("BPVotingList")) {		
						
						
						Map<Integer,String[]> BPvotinglist=new HashMap();
					
						BPvotinglist=hpsysBean.BPvotingList();
						request.setAttribute("BPvotinglist",BPvotinglist);
						return new ModelAndView("SystinetBPVotingList"); 
			 			
					}
				
						 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("BPapproved")) {
						
						String value=request.getParameter("approved");
						String StageName=request.getParameter("StageName");
						String StageValue=request.getParameter("StageValue");
						String ArtifactId=request.getParameter("ArtifactId");
						String ProcessId=request.getParameter("ProcessId");
						String StageNo=request.getParameter("StageNo");
						String requestID=request.getParameter("RequestID");
						
						
						int stageNos=Integer.parseInt(StageNo);
						stageNos++;
						
						String [] temp={StageName,StageValue,ArtifactId,ProcessId};
						 ArrayList approve=new ArrayList();
						 approve.add(temp);
						 boolean status=true;
						 String approMsg="Approved";
						 
					String nextStage=hpsysBean.getNextStage(ProcessId,String.valueOf(stageNos));	
				boolean voteStatus=hpsysBean.voting(ArtifactId, approMsg, status, nextStage);		 
						
			
				 //   Thread.sleep(30000); // LOCK is held
				
		
			if(voteStatus==true){
			boolean app=hpsysBean.changeBPapprovedstatus(approve);
			boolean updateStatus=hpsysBean.updateStatus(requestID,ArtifactId,"Approved",StageName);
			/*
			 * artifact table update
			 */
			boolean chagRes=hpsysBean.updateArtifactStatus(ProcessId,ArtifactId,"Active");
			
			
			}
			
						Map<String,String[]> BPvotinglist=new HashMap();
						
						BPvotinglist=hpsysBean.BPvotingList();
						request.setAttribute("BPvotinglist",BPvotinglist);
					
						return new ModelAndView("SystinetBPVotingList"); 
						
					}
					
						 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("BPdenied")) {			
						
						String value=request.getParameter("denied");
						
						String StageName=request.getParameter("StageName");
						String StageValue=request.getParameter("StageValue");
						String ArtifactId=request.getParameter("ArtifactId");
						String ProcessId=request.getParameter("ProcessId");
						String requestID=request.getParameter("RequestID");
						
						String [] temp={StageName,StageValue,ArtifactId,ProcessId};
						 ArrayList deny=new ArrayList();
						 deny.add(temp);
						 boolean status=false;
						 String approMsg="Reject";
						 
							boolean voteStatus=hpsysBean.voting(ArtifactId, approMsg, status, StageName);		 
							 
							boolean app=hpsysBean.changeBPdeniedstatus(deny);
							
							
						Map<String,String[]> BPvotinglist=new HashMap();
						
						BPvotinglist=hpsysBean.BPvotingList();
						request.setAttribute("BPvotinglist",BPvotinglist);
					

						return new ModelAndView("SystinetBPVotingList"); 
						
					}			   
					
					
				
						 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("WSVotingList")) {				
						
						Map<String,String[]> WSvotinglist=new HashMap();
					
						WSvotinglist=hpsysBean.WSvotingList();
						request.setAttribute("WSvotinglist",WSvotinglist);
					
						return new ModelAndView("SystinetWSVotingList"); 
			 		
					}
					
			 else if(sysProcess!=null && sysProcess.equalsIgnoreCase("WSapproved")) {		
						String value=request.getParameter("approved");
						String StageName=request.getParameter("StageName");
						String StageValue=request.getParameter("StageValue");
						String ArtifactId=request.getParameter("ArtifactId");
						String ProcessId=request.getParameter("ProcessId");
						String StageNo=request.getParameter("StageNo");
						String requestID=request.getParameter("RequestID");	
						
						
						int stageNos=Integer.parseInt(StageNo);
						stageNos++;				
						
						
						String [] temp={StageName,StageValue,ArtifactId,ProcessId};
						 ArrayList approve=new ArrayList();
						 approve.add(temp);
						 boolean status=true;
						 String approMsg="Approved";
						 
					String nextStage=hpsysBean.getNextStage(ProcessId,String.valueOf(stageNos));		
						 boolean voteStatus=hpsysBean.voting(ArtifactId, approMsg, status, nextStage);		 
						 
						 
						 if(voteStatus==true){
							 
						boolean app=hpsysBean.changeWSapprovedstatus(approve);
						boolean updateStatus=hpsysBean.updateStatus(requestID,ArtifactId,"Approved",StageName);
						/*
						 * artifact table update
						 */
						boolean chagRes=hpsysBean.updateArtifactStatus(ProcessId,ArtifactId,"Active");
						 }
						
					
						
						Map<String,String[]>WSvotinglist=new HashMap();
						
						WSvotinglist=hpsysBean.WSvotingList();
						request.setAttribute("WSvotinglist",WSvotinglist);
					
						return new ModelAndView("SystinetWSVotingList"); 
					}
					
						else if(sysProcess!=null && sysProcess.equalsIgnoreCase("WSdenied")) {			
						
						String value=request.getParameter("denied");
						String StageName=request.getParameter("StageName");
						String StageValue=request.getParameter("StageValue");
						String ArtifactId=request.getParameter("ArtifactId");
						String ProcessId=request.getParameter("ProcessId");
						
						String [] temp={StageName,StageValue,ArtifactId,ProcessId};
						 ArrayList deny=new ArrayList();
						 deny.add(temp);
						 boolean status=false;
						 String approMsg="Reject";
							boolean voteStatus=hpsysBean.voting(ArtifactId, approMsg, status, StageName);		
							
						boolean app=hpsysBean.changeWSdeniedstatus(deny);
						
						Map<String,String[]> WSvotinglist=new HashMap();
						
						WSvotinglist=hpsysBean.WSvotingList();
						request.setAttribute("WSvotinglist",WSvotinglist);
					
						return new ModelAndView("SystinetWSVotingList"); 

					}
				 
				 
				 
			
				else if(sysProcess!=null && sysProcess.equalsIgnoreCase("webserviceProcesubmit")) {		  
						  try {
						 
						
						  ArrayList wsprocess=new ArrayList();
						  ArrayList docWSprocess=new ArrayList();
						  ArrayList wsdlWSprocess=new ArrayList();
						  String artifactTypeId="businessServiceArtifact"; //testing
						  
						  String id=request.getParameter("id");
							String gov=request.getParameter("gov");
							String govStatus=request.getParameter("govStatus");
							
						  
						  String name=request.getParameter("name");
						     String cons=request.getParameter("cons");
						     String desc=request.getParameter("desc");
						     String criticality=request.getParameter("criticality");
						     String version=request.getParameter("version");
						     if (name != ""){
						  String[] wslist = {name,cons,desc,criticality,version};
						  wsprocess.add(wslist) ;
						     }
						     session.setAttribute("wsprocess", wsprocess);
						     
						     System.out.println("name"+name+"path2222222222"+cons+"desc333333333333"+desc+"criticality3333333333333"+criticality);
						     
						     
						     
						  String wsname=request.getParameter("wsname");
						     String wspath=request.getParameter("wspath");
						     String wsdesc=request.getParameter("wsdesc");
						     String wscriticality=request.getParameter("wscriticality");
						     String wsversion=request.getParameter("wsversion");
						     String wstrname=request.getParameter("wstrname");
						     String wslocation=request.getParameter("wslocation");
						     System.out.println("name111111"+wsname+"path2222222222"+wspath+"desc333333333333"+wsdesc+"criticality3333333333333"+wscriticality+"version4444444"+wsversion+
						       "trname5555555"+wstrname+"location66666666"+wslocation);
						     if (wsname != ""){
								  String[] wsdlList = {wsname,wspath,wsdesc,wscriticality,wsversion,wstrname,wslocation};
								  wsdlWSprocess.add(wsdlList) ;
								}
						     session.setAttribute("wsdlWSprocess", wsdlWSprocess);
						    
						     String docname=request.getParameter("docname");
						     String docdesc=request.getParameter("docdesc");
						     String docpath=request.getParameter("docpath");
						     String doclocat=request.getParameter("doclocat");
						     if (docname != ""){
								  String[] docList = {docname,docdesc,docpath,doclocat};
								  docWSprocess.add(docList) ;
							 }
						     session.setAttribute("docWSprocess", docWSprocess);
						     System.out.println("docname"+docname+"docpath2"+docpath+"docdesc"+docdesc+"doclocat"+doclocat);
						     
						     
						      
						   //   String[] popprocess={name,cons,desc,criticality,wsname,wspath,wsdesc,wscriticality,wsversion,wstrname,wslocation,docname,docdesc,docpath,doclocat};
						      
						   //   wsprocess.add(popprocess);
						     boolean result=false;
						     String artifactUUIDChk=hpsysBean.getArtifactUUid(name); 
						     String artifactUUID=null;
						     
						     if(artifactUUIDChk == null || artifactUUIDChk == ""){
						    	 
						       artifactUUID = hpsysBean.wsproceesSubmit(wsprocess,wsdlWSprocess,docWSprocess,artifactUUIDChk);
						   
						     }
								
						     							  

						   //======Dhivya Here:Setting lifecycle to the artifact(starting governance)==============================
						 	
								System.out.println("artifactUUID after wsproceesSubmit " +artifactUUID);
								if (artifactUUID!=null)		
								{	
						ArrayList lifecycleList=hpsysBean.getLifecycleProc(artifactTypeId);
						boolean cycleExist=false;
						if (lifecycleList != null && lifecycleList.size() != 0) { 
							 Iterator lifecyL = lifecycleList.iterator();
							 String lifecycleId=null;
						     String lifecyLName="";
							 while (lifecyL.hasNext()) {
						       String strType[] = (String[]) lifecyL.next();
						      
						        lifecycleId=strType[0];
						        lifecyLName=strType[1];
						                
						    cycleExist=hpsysBean.isLifecycleExist(lifecycleId);
						   	 
						}
						    if(cycleExist==true){
						    	 result=hpsysBean.startGovern(artifactUUID, lifecycleId);	
						    }else{
						    	request.setAttribute("ErrorMsg", "Unable to start the governance as there is no lifecycle process available!!.");
						    }
						        
						  if(result==true){
							  String reqName="ws";
							 boolean output=hpsysBean.updateArtifactMapDetails(artifactUUID, lifecycleId);
							 
							 if(output==true){
									boolean wsbpmRes=hpsysBean.updateWSBPM(artifactUUID, "End", name);
									
								}	 
							 
						  }
							
						    			
							}

								}
						  
						  
						     
						     session.setAttribute("wsprocess", null); 
							  session.setAttribute("wsdlWSprocess", null);
							  session.setAttribute("docWSprocess", null);
						  
						      ArrayList list=hpsysBean.listProcessView("WS");
								

								request.setAttribute("list", list);

								

								
								request.setAttribute("stopGov","stopGov");
								request.setAttribute("id",id);
								
						  
				      
						     
						  }
						     
						  catch (Exception ex) {
						   System.err.println("Caught an exception.");
						   ex.printStackTrace();
						  }

						  return new ModelAndView("frmViewWSArtifacts"); 
				 			
				
						 }			
		
		
	        
	
		return null;
	}
	

}

<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="file:///D|/Jboss 4.2.3GA-18080/server/default/tmp/deploy/tmp4639256501122020805guildKraft-exp.war/jsp/js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			<div class="col-md-2 pad">
		
		<!--==============================include infobar Here=================================-->
		
            <%@ include file = "../../include/infobar.jsp" %>
			
		<!--==============================include infobar Here=================================-->
		
			</div>
<!--==============================================content start here============================================-->

  	<div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
			 <div class='panel-heading'>

 			  <h2>Advertisement: Media Type Listing</h2>
			
			</div>
			
			  <div class='panel-body'>
	
           <p> Following are the  Media Types for all the advertisements that are to be placed for all the event.

    			To edit a Media Type Name click on 'Edit' button. To delete a record click on the 'Delete' button. </p>
 				
					
				
		 <%
			String deleteStatus = (String)request.getAttribute("errStat");
			if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
			%>
			<p>Cannot delete this record. The file is in use</p>
			
			<%
			}
			%>
				
		                <div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-3 col-md-offset-2 '>
										
											<label class='control-label label1'>Media Name </label>
										</div>
										
										<div class='col-md-2'>
											
											<label class='control-label label1'>Edit</label>   
												
										</div> 
										
										<div class='col-md-2'>
											
											<label class='control-label label1'>Delete </label>   
												
										</div> 
										
									</div>
										
								</div>
									
                              </div>
								
       
	     <%
			Vector v = (Vector)session.getAttribute("objSesAdvLstMedia");
			if(v!=null && v.size()!=0){
			
			
            Enumeration e = v.elements();
			    String mediaId = "";
				String mediaName = "";
				String mediaDesc  = "";
				String mediaStatus = "";
                while(e.hasMoreElements()){
                String[] s = (String [])e.nextElement();
					mediaId = s[0];
					mediaName = s[1];
					mediaDesc  = s[2];
					mediaStatus = s[3];
	
		 %>

					
					<form  class='form-horizontal' role='form' name="frmAdvInsertMedia" method="post" action="./advertisement.html">
					<input name="advProcess" type="hidden" value="advManupMedia">
					<input type="hidden" value="<%=mediaId%>" name="mediaId">
					
						<div class='form-group'>
								
								<div class="container"> 
								   
									  <div class="row"> 
									   
										<div class='col-md-3 col-md-offset-2'>
                                   			<label class='control-label'>&emsp;&nbsp;<%=mediaName%></label>
									</div>
									
					
									 <div class='col-md-2'>
                                       &emsp; <button class='btn-sm btn-primary' type='submit' value="Edit" name="advButValue">Edit</button>
                                    </div>
									
                                    <div class='col-md-2'>
                                       &emsp; <button class='btn-sm btn-danger' style='' type='submit' value="Delete" name="advButValue">Delete</button>
                                    </div>
					         </div>
					 </div>
				 </div>
					</form>
					
					<%}	
					 }
					else {
					%> 
					
						  <div class='form-group'>
 					 		 <div class="container"> 
									  <div class='col-md-4'>
									   </div>
										<div class='col-md-4'>
											No records are available. 
										</div>
								</div>
							</div>
						</div>
					
					<%}%>
		
			 								<!-- CONTENTS END HERE -->		
			
			 	 </div>
			</div>
		</div>
   </div>
						
		
											
	  
	
		<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>
</html>

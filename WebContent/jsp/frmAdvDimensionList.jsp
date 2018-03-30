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

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						<h2>Advertisement: View Existing Dimension Names</h2>
						</div>
					<!--==============================Form Title=================================-->

				 <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		
	 <p> Following are the  Dimension Names for all the advertisements that are to be placed for all the event. 
	 
	  To edit a dimension name click on 'Edit' button. To delete a record click on the 'Delete' button.  
 
		   
		    <%
			String deleteStatus = (String)request.getAttribute("errStat");
			if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
			%>
			<p id="p_error">Cannot delete this record. its already in use.</p>
			<%
			}
			
			%> 
		   
		   
		 
		
			<%
			Vector vDimLst = (Vector)session.getAttribute("objSesAdvDimLst");
			if(vDimLst!=null && vDimLst.size()!=0){
			%>
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4 col-md-offset-2'>
										
												<label class='control-label label1'>Dimension Name</label>    
											
											</div>
											<div class='col-md-2'>
										
												<label class='control-label label1'>Edit</label>    
											
											</div>
											<div class='col-md-2'>
										
												<label class='control-label label1'>Delete</label>    
											
											</div>
										</div>
									</div>
								</div>
				
			<%
	            Enumeration eDimLst = vDimLst.elements();
				String dimListId = "";
				String dimListName = "";
				String dimListStatus = "";
				while(eDimLst.hasMoreElements()){
					String[] s = (String [])eDimLst.nextElement();
					  dimListId = s[0];

					  dimListName = s[1];
					  dimListStatus = s[2];
		%>
				<form name="frmAdvDimensionLst" method="post" action="./advertisement.html">
				<input name="advProcess" type="hidden" value="advManupDimension">
				<input type="hidden" value="<%=dimListId%>" name="dimensionId">
					
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
											<div class='col-md-4 col-md-offset-2'>
										
												<label class='control-label '><%=dimListName%></label>
											</div>
											<div class='col-md-2'>
										
										       <button class='btn-sm btn-primary' type='submit' value="Edit" name="advDimButton">Edit</button>

											</div>
											<div class='col-md-2'>
										
                                       			 <button class='btn-sm btn-danger' style='' type='submit' value="Delete" name="advDimButton">Delete</button>

											</div>
										</div>
									</div>
								</div>
				
				</form>
			
					
					<%}	
					 }
					else {
					%>
				<div class="margin">
							
						<div class='form-group'>
								
                                <div class="container"> 
								   
								  <div class="row"> 
									   
									  <div class='col-md-4'>
											<p>There are no records available. </p>
									 </div>
									</div>
								</div>
							</div>
				
					<%}%>
					
			   
	
	  <!--==============================================import content code end here============================================-->
	  
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

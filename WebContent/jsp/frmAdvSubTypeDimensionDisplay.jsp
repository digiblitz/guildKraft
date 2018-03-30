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
<script src="js/frmCreateDimenDetail.js" type="text/javascript" ></script>
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
                            <h2>Advertisement: Dimension Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
   
					<%
					ArrayList  dimList = (ArrayList)session.getAttribute("dimensionDetails");
					
					if(dimList.size()!=0 && dimList!=null){
					
					String mediaName = "";
					String dispName = "";
					String	dispSubName = "";
					String	dimName = "";
					String	height = "";
					String	width = "";
					String	units = "";
					String	imagePath = "";           
					for (Iterator itP = dimList.iterator(); itP.hasNext();) {
						String dimensionList[] = (String []) itP.next();
						
						mediaName = dimensionList[0];
						dispName = dimensionList[1];
						dispSubName = dimensionList[2];
						
					}
					
					%>
					
					<p>Dimension Details:</p>
				 
				    		<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=mediaName%></label>
											</div>
										</div>
									</div>
				    
				   
				   			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=dispName%></label>
											</div>
										</div>
									</div>
					
				  
				 			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=dispSubName%></label>
											</div>
										</div>
									</div>
								</div>
					
				 			<div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-3 col-md-offset-1">
											<label class='control-label label1'>Dimensional Name:</label>
										</div>
										<div class="col-md-2">
											<label class='control-label label1'>Height</label>
										</div>
										<div class="col-md-2">
											<label class='control-label label1'>Width</label>
										</div>
										<div class="col-md-2">
											<label class='control-label label1'>Unit</label>
										</div>
									</div>
								</div>
							</div>
										
										
									
				
				  <%
				  for (Iterator itP = dimList.iterator(); itP.hasNext();) {
						String dimensionList[] = (String []) itP.next();
						dimName = dimensionList[3];
						height = dimensionList[4];
						width = dimensionList[5];
						units = dimensionList[6];
						imagePath = dimensionList[7];
					  %>
					 
					 
					 	 <div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-3 col-md-offset-1">
											<label class='control-label '><%=dimName%></label>
										</div>
										<div class="col-md-2">
											<label class='control-label '><%=height%></label>
										</div>
										<div class="col-md-2">
											<label class='control-label '><%=width%></label>
										</div>
										<div class="col-md-2">
											<label class='control-label '><%=units%></label>
										</div>
									</div>
								</div>
							</div>
							
					<%
				  	}
				  %>
							
						
					<%
					}
					else{%>
						
							 <div class='form-group'>
								<div class="row">
									<div class="col-md-12 gp">
										<div class="col-md-4">
										</div>
										<div class="col-md-4">
											No Records were found
										</div>
									</div>
								</div>
							</div>
					
					<%}
					%>
		<!--=============================Content end here=================================-->
							
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

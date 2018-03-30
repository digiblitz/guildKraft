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
						<h2>Advertisement: View Dimension Details</h2>
						</div>
						
					<!--==============================Form Title=================================-->


			<!--==============================================content start here============================================-->

                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						  
	        <p>Please create the required Dimension Names for all the advertisements that are to be placed in all the events .
		
		Select a Dimension Name given below and fill-in the relevant dimension details for the same depending on the media type.	</p>  
 
 			<p>Create A Dimension Detail:</p>
			
				 <div class='form-group'>
                             
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:</label>
                                    
									<div class='col-md-8'>
                                    
									    <div class='col-md-3 indent-small'>
                                       
									        <div class='form-group internal'>
										
												<bean:write name="advDisplayDetail" property="mediaType"/>                                           
												
											 </div>
											 
                                        </div>

                                    </div>
                                </div>
				 			
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="displayType"/>												
						
											 </div>
											 
                                        </div>

                                    </div>
									
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="displaySubType"/>
											
											 </div>
											 
                                        </div>

                                    </div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimension Type:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
											<bean:write name="advDisplayDetail" property="dimensionType"/>
											
											 </div>
											 
                                        </div>

                                    </div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimensional Name:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="dimensionalName"/>	
																						
											 </div>
											 
                                        </div>

                                    </div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Height:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="height"/>
											
											 </div>
											 
                                        </div>

                                    </div>
									
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Width:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="width"/>
											
											 </div>
											 
                                        </div>

                                    </div>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dimensional Unit:</label>
                        
						            <div class='col-md-8'>
                        
						                <div class='col-md-3 indent-small'>
                        
						                    <div class='form-group internal'>
						
												<bean:write name="advDisplayDetail" property="dimensionalUnit"/>
											
											 </div>
											 
                                        </div>

                                    </div>
								
								</div>
									
						<!--==============================Content End Here=================================-->
			
							
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

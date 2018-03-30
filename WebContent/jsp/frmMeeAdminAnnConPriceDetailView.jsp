<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmGrossAmtMast.js" type="text/javascript" ></script>
<%
	String priceDetails[] = (String[])request.getAttribute("priceDetails");
	String priceDetId = priceDetails[0];
	String specId = priceDetails[1];
	String userTyId = priceDetails[2];
	String eventTypeId = priceDetails[3];
	
	String dueDatePrice = priceDetails[4];
	String afterDueDatePrice = priceDetails[5];
	String userTypeName = priceDetails[6];
	
	String specName = priceDetails[7];
	String eventName = priceDetails[8];
// {priceDetId,specId,userTyId,eventTypeId, dueDatePrice, afterDueDatePrice, userTypeName, specName, eventName};
%>

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
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
                            <h2>View Price Detail Master</h2>
						</div>
					 <div class='panel-body'>
 						
				 <div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type :</label>
					    <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                               <div class='form-group internal'> <%=eventName%>
							   </div>
							 </div>
						</div>
				  
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Specification:</label>
				     <div class='col-md-8'>
                            <div class='col-md-4 indent-small'>
                               <div class='form-group internal'><%=specName%>
							   </div>
							  </div>
							</div>
		     

				   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type :</label>
				     <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                               <div class='form-group internal'><%=userTypeName%>
							   </div>
							  </div>
							 </div>
		     	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Normal Price :</label>
					<div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                               <div class='form-group internal'><strong>$<%=dueDatePrice%></strong>
							   </div>
							  </div>
							 </div>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> After Due Date Price :</label>
				 
					<div class='col-md-8'>
                       <div class='col-md-3 indent-small'>
                          <div class='form-group internal'>
							<strong>$<%=afterDueDatePrice%></strong>
						</div>
					</div>
				</div>
				 
				<div class='form-group'>
                      <div class='col-md-offset-4 col-md-1'>
                            <button class='btn-lg btn-primary' type='button' onclick="javascript:history.back(-1);">Back</button>
                                    </div>
							
					</div>
  
  
		<!--==============================Form Body=================================-->
							
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

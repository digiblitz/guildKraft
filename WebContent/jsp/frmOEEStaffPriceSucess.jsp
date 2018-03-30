<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/frmAdvertise.js" type="text/javascript" ></script>

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
                            <h2>Online Event Entries: Confirmation</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
							 <%   
									String existStatus = (String)request.getAttribute("AlreadyExist");
									String insertStatus = (String)request.getAttribute("insertStatus");
									String chmpExistStatus = (String)request.getAttribute("AlreadyExistChmp");
									String chmpInsertStatus = (String)request.getAttribute("chmpInsertStatus");
									String iStatus = "";
									String chmpIStatus = "";
									String isStatusExist="";
									String chmpIsStatusExist="";
								if(insertStatus!=null && insertStatus.equalsIgnoreCase("success")) iStatus = "Fixed Price Details Inserted Successfully";
									else if(insertStatus!=null && insertStatus.equalsIgnoreCase("failed")) iStatus = "Fixed Price Details Not Inserted";
								if(existStatus!=null && existStatus.equalsIgnoreCase("exist")) isStatusExist="Fixed Price Details for the Item already exists!";
							if(chmpInsertStatus!=null && chmpInsertStatus.equalsIgnoreCase("chmpsuccess")) chmpIStatus = "Championship Fixed Price Details Inserted Successfully";
							else if(chmpInsertStatus!=null && chmpInsertStatus.equalsIgnoreCase("chmpfailed")) chmpIStatus = "Championship Fixed Price Details Not Inserted";
								if(chmpExistStatus!=null && chmpExistStatus.equalsIgnoreCase("chmpExist")) chmpIsStatusExist="Championship Fixed Price Details for the Item already exists!";
										
							  %>
  
				  <%
					if(existStatus!=null && existStatus.trim().length()!=0){
					%>
 						<p><%=isStatusExist%></p>
		
					<%}%>
					<%
					if(insertStatus!=null && insertStatus.trim().length()!=0){
					%>
							<p><%=iStatus%></p>
						
					<%}%>
				
					<%
					if(chmpExistStatus!=null && chmpExistStatus.trim().length()!=0){
					%>
							<p><%=chmpIsStatusExist%></p>
						
					<%}%>
					<%
					if(chmpInsertStatus!=null && chmpInsertStatus.trim().length()!=0){
					%>
							 <p><%=chmpIStatus%></p>
						
					<%}%>
					
					
					
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="button" type="button"  value="Create Another" onclick="location.href='OEEAddFixedPrice.html?cmd=initPrice'">Create Another</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button"  value="Back To List" onclick="location.href='OEEAddFixedPrice.html?cmd=initViewPrice'">Back To List</button>
                                    </div>
                                </div>
					<!--=============================Content end here==============================-->
							
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

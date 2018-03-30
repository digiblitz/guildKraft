<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"  %>
    <%@page import="java.util.Iterator"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
                        
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
         <form  class='form-horizontal' role='form' action="ExterApp.html" method="post" name="viewHrsServiceList" id="viewHrsServiceList" >
                     
                    <input type="hidden" name="searchProcessList" value="loginProcess" />
				
				
					<div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 col-md-offset-1">	 
										<label class="control-label label1">First name</label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label label1">Last name</label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label label1">File name</label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label label1">File Path</label>
									</div>
									<div class="col-md-3">	 
										<label class="control-label label1">Download</label>
									</div>
								</div>
							</div>
						</div>
						
  
  
  
					<%
					ArrayList<String> firstNameList = (ArrayList<String>) request.getAttribute("firstNameList");
					ArrayList<String> lastNameList = (ArrayList<String>) request.getAttribute("lastNameList");
					ArrayList<String> fileNameList = (ArrayList<String>) request.getAttribute("fileNameList");
					ArrayList<String> filePathList = (ArrayList<String>) request.getAttribute("filePathList");
						if(firstNameList!=null && firstNameList.size()!=0){
							for(int i=0;i < firstNameList.size();i++){
															
							%>
						
						 <div class="form-group">
							<div class="row">
								<div class="col-md-12 gp">
									<div class="col-md-2 col-md-offset-1">	 
										<label class="control-label "><%=firstNameList.get(i)%></label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label "><%=lastNameList.get(i)%></label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label "><%=fileNameList.get(i)%></label>
									</div>
									<div class="col-md-2">	 
										<label class="control-label "><%=filePathList.get(i)%></label>
									</div>
									<div class="col-md-3">	 
										<a href="ExterApp.html?process=initdownloadfile&filename=<%=fileNameList.get(i)%>&pathname=<%=filePathList.get(i)%>">Click to download</a>
									</div>
								</div>
							</div>
						</div>
						
  
						<%}}else{
						   %>
						  		<div class='form-group'>
								 	<div class="container"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
													No DATA
											</div>
										</div>
									</div>
								
						   <%
					}
												   %>
</form>

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

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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
<script src="javascripts/frmCreateMemb.js" type="text/javascript" ></script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
<%
String[] subType = (String[])session.getAttribute("displayEditMemDetails");

String membershipTypeId = "";
String membershipTypeName = "";
String membershipAmount = "";
String mDate = "";
String periodValue="";
String UserTypeID="";

if(subType!=null){
	membershipTypeId = subType[0];
	membershipTypeName = subType[1];
	UserTypeID = subType[2];   
	membershipAmount = subType[3];  
	mDate   = subType[4];
	periodValue = subType[5];
//	{membershipTypeId, membershipTypeName, membershipAmount, mDate, uTypeId};
}

%>

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
                            <h2>Membership: Delete Membership Type</h2>
                        </div>
					<!--==============================Form Title=================================-->
	
		<form class='form-horizontal' role='form' name="frmCreateMembType" id="frmCreateMembType" method="post" action="./memberMaster.html" >
		<input type="hidden" name="memProcess" value="memTyDelete"/>
		<input type="hidden" value="<%=membershipTypeId%>" name="memId" />
			<p>Fields marked with an asterisk (<span style="color:#FF0000">*</span>) are required.</p>
		   <div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'> User Type:</label>
                                   
											<%
										
										String uTypeId = (String)request.getAttribute("uTypeId");
												Vector vUType = (Vector)session.getAttribute("displayUserTypeDetails");
												if(vUType!=null && vUType.size()!=0){
													Enumeration eUtype = vUType.elements();
													 //String [] userType = {ID, name };
													while(eUtype.hasMoreElements()){
														String[] strType = (String [])eUtype.nextElement();
														String uTypeID = strType[0];
														String uTypeName = strType[1];
														if(uTypeID.equals(UserTypeID)){
																%>
												 <div class='col-md-8'>
														<div class='col-md-3 indent-small'>
																<div class='form-group internal'> 
																	<label class="control-label"><%=uTypeName%></label>
																	<input type="hidden" name="uTypeId" value="<%=uTypeID%>" />
																	</div>
															 </div>
													</div>
																<%
														}
													}
												}
												%>					  
				        <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Membership Type Name:</label>
					     <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"><%=membershipTypeName%></label>
										</div>
								  </div>
							</div>					
					  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Amount:</label>
					     <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
				                             <label class="control-label"><%=membershipAmount%></label>
										</div>
								  </div>
							</div>		
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Priority:</label>
					     <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'>
										 <label class="control-label"><%=periodValue%></label>
										</div>
								  </div>
							</div>		
						</div>      
						 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="Button" type="submit" value="Delete">Delete</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="cancel" onclick="javascript:history.back(-1);">Cancel</button>
                                    </div>
                          </div>
					
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

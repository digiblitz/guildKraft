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
<script src="js/frmEdigAdvSubType.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%
String  mId = (String)request.getAttribute("mid");
if(mId==null || mId.equals("")){
mId="";
}
%>
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
						
						<h2>Advertisement: Edit Advertisement Display Sub-Type</h2>
						
						</div>
			
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->

				<% String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>
				<p id="p.error">Advertisement Sub Type  Name Already Exists. Try it Again</p>
				</tr>
				<%
				}
				%>
  
				<form  class='form-horizontal' role='form' name="frmEditAdvSubType" method="post" onsubmit="return editValidate();" >
				<input type="hidden" name="advProcess" value="advUpdateDispSubType"/>		
			  
			   		<p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
            
					  <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="mediaType" class="form-control" >
												<option selected="selected" value="">Select One</option>
													<%
													
														Vector vMedia = (Vector)session.getAttribute("DisplayMediaDetails");
														if(vMedia!=null && vMedia.size()!=0){
															Enumeration emedia = vMedia.elements();
															String mediaId = "";
															String mediaName = "";
															String mediaDesc  = "";
															String mediaStatus = "";
															while(emedia.hasMoreElements()){
																String[] s = (String [])emedia.nextElement();
																mediaId = s[0];
																mediaName = s[1];
																mediaDesc  = s[2];
																mediaStatus = s[3];
																if(mediaId.equals(mId)){
														%>
														<option value="<%=mediaId%>" selected="selected"><%=mediaName%></option>
														<%}
														else{
														%>
													<option value="<%=mediaId%>"><%=mediaName%></option>
														<%		
														}
														}
														}%>
									 </select>
					 
					 						<span id="span_astriesk">*</span>
					
									<%
									String dispSubTypeId ="";
									String displaySubTypeName ="";
									String dispTypeId ="";
									String dispDesc ="";
									String[] subType = (String[])session.getAttribute("DisplaySubTypeDetails");
									if(subType!=null){
										dispSubTypeId = subType[0];
										displaySubTypeName = subType[1];
										dispTypeId = subType[2];  
										dispDesc   = subType[3];
									}
									%>	
								</div>
							</div>
						</div>
					</div>
						
						  <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select an Advertisment Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
				   
												<select name="displayType" class="form-control" >
												<option selected="selected" value="">Select One</option>
												
												<%
													Vector vType = (Vector)session.getAttribute("DisplayTypeDetails");
													if(vType!=null && vType.size()!=0){
														Enumeration eDisp = vType.elements();
														String displayTypeId =  "";
														String displayTypeName =  "";
														String mediaIdVal = "";
														while(eDisp.hasMoreElements()){
															String[] s = (String [])eDisp.nextElement();
															displayTypeId = s[0];
															displayTypeName = s[1];
															mediaIdVal  = s[2];
															if(displayTypeId.equals(dispTypeId)){
															
													%>
													<option value="<%=displayTypeId%>" selected="selected"><%=displayTypeName%></option>
													<%}
											 
											   else{
											   %>
											   <option value="<%=displayTypeId%>"><%=displayTypeName%></option>
											   <%
													}
													}
												}
													%>
											 </select>
												 <span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
							</div>
				  			<input type="hidden" name="dispSubTypeId" value="<%=dispSubTypeId%>">
							
							<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												 <input type="text" class="form-control" name="txtDisplaySubType" value="<%=displaySubTypeName%>"  />
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
								
							<div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sub-Type Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
												<textarea name="txtAreaDesc" cols="25" rows="5" class="form-control"><%=dispDesc%></textarea>
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
							
							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' value="Update" type='submit'>Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'  type="button" value="Cancel" style='' onclick="javascript:history.back(-1)">Cancel</button>
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

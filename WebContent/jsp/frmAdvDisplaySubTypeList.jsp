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

<script language="javascript">
function postData(mid){
if(mid!=""){
		document.frmAdvDispSubTypeList.advProcess.value = "advDispLstShow";
		document.frmAdvDispSubTypeList.method="post";
		document.frmAdvDispSubTypeList.action="./advertisement.html?mid="+mid;
		document.frmAdvDispSubTypeList.submit();
	}
else{
	document.frmAdvDispSubTypeList.advProcess.value = "advDispSubTypeLst";
	document.frmAdvDispSubTypeList.method="post";
	document.frmAdvDispSubTypeList.action="advertisement.html"
	document.frmAdvDispSubTypeList.submit();
	
}
}
function showData(dispId){
if(dispId!=""){
	var mid = document.frmAdvDispSubTypeList.media.value;
	document.frmAdvDispSubTypeList.advProcess.value = "advDispSubTypeShow";
	document.frmAdvDispSubTypeList.method="post";
	document.frmAdvDispSubTypeList.action="./advertisement.html?dispId="+dispId + "&mid="+mid;
	document.frmAdvDispSubTypeList.submit();
	}
else{
	document.frmAdvDispSubTypeList.advProcess.value = "advDispSubTypeLst";
	document.frmAdvDispSubTypeList.method="post";
	document.frmAdvDispSubTypeList.action="advertisement.html"
	document.frmAdvDispSubTypeList.submit();
}
}

</script>
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%
String  mId = (String)request.getAttribute("mid");
String displayId =(String)request.getAttribute("dispId");
if(mId==null || mId.equals("")){
mId="";
}
if(displayId==null || displayId.equals("")){
displayId="";
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
						
						<h2>Advertisement: Advertisement Sub-Type Listing</h2>
						
						</div>

				<!--==============================================content start here============================================-->
				
                        
						<div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

  <p>The Advertisement Sub-Types are as follows.
	
		To edit a Sub-Type, click on the 'Edit' button beside it. To detele a record click on the 'Delete' button.</p>
  
		<form class='form-horizontal' role='form' name="frmAdvDispSubTypeList" >
			<input type="hidden" name="advProcess" value=""/>
		
						<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <select name="media" class="form-control" onchange="postData(this.value);">
												<option selected="selected" value="">Select One</option>
												<%
												
													Vector vMedia = (Vector)session.getAttribute("objSesAdvMediaType");
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
										</div>
									</div>
								</div>
							</div> 
							
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					 
												  <select name="dispType" class="form-control" onchange="showData(this.value);">
													<option selected="selected">Select One</option>
													<%
														Vector vType = (Vector)session.getAttribute("objSesAdvDispType");
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
																if(displayTypeId.equals(displayId)){
														%>
														<option value="<%=displayTypeId%>" selected="selected"><%=displayTypeName%></option>
														<%}
														else{
														%>
														 <option value="<%=displayTypeId%>"><%=displayTypeName%></option>
														<%		
														}
														}
														}%>
					 					 </select>	
										 
										</div>
									</div>
								</div>
							</div>	
					</form>		
					
						   <%
							String deleteStatus = (String)request.getAttribute("errStat");
							if(deleteStatus!=null && deleteStatus.equals("eConfirmDelete")){
							%>
							<p id="p_error">Cannot delete this record. The file is in use.</p>
							
							<%
							}
							%> 	  	
							
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4 col-md-offset-2'>
										
											<label class='control-label label1'>Advertisement Sub-Type</label>    
											
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
					
								Vector dispSubType =(Vector)session.getAttribute("objSesdispSubType");
								if(dispSubType!=null && dispSubType.size()!=0){
									String subTypeId ="";
									String subTypeName ="";
									String mediaSubId ="";
									String subTypeDesc ="";
									String subTypeStatus ="";
								Enumeration dispSubTypeEnum = dispSubType.elements();
								while(dispSubTypeEnum.hasMoreElements()){
									String sDispSubType[] = (String[])dispSubTypeEnum.nextElement();
									subTypeId =sDispSubType[0];
									subTypeName =sDispSubType[1];
									displayId =sDispSubType[2];
									subTypeDesc =sDispSubType[3];
									subTypeStatus =sDispSubType[4];
					  %>
		  
	
						<form class='form-horizontal' role='form' name="frmAdvDispSubType"  method="post" action="advertisement.html">	
								<input type="hidden" name="mediaId" value="<%=mId%>">	
								<input type="hidden" name="advProcess" value="advManupDispSubType">
								<input type="hidden" name="subTypeId" value="<%=subTypeId%>" />
									
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4 col-md-offset-2'>
										
											<label class='control-label '>&emsp;&nbsp;<%=subTypeName%></label>    
											
										</div>
										
										<div class='col-md-2'>
											
				                           &emsp; <button class='btn-sm btn-primary' name="advButtonDispSub" value="Edit"  type='submit'>Edit</button>

										</div>
										
										<div class='col-md-2'>
											
                                       		&emsp; <button class='btn-sm btn-danger' type="submit" name="advButtonDispSub" value="Delete" style=''>Delete</button>
												
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

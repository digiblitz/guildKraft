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
						
						<h2>Advertisement: Delete Advertisement Display Sub-Type</h2>
						
						</div> 
						
				<!--==============================Form Title=================================-->


			<!--==============================================content start here============================================-->
			
			 <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
			
					<form class='form-horizontal' role='form' name="frmDeleteAdvSubType" method="post"  >
					<input type="hidden" name="advProcess" value="deleteDispSubType"/>
					
						 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
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
													<div><%=mediaName%></div>
													<%}
													}
													}%>
										
										<%
										String dispSubTypeId ="";
										String displaySubTypeName ="";
										String dispTypeId ="";
										String dispDesc ="";
										String[] subType = (String[])session.getAttribute("deleteSubTypeDetails");
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
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>				   
											
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
													<div><%=displayTypeName%></div>
											 <%
													}
													}
												}
													%>
										
										</div>
									</div>
								</div>
							</div>
							
								 <input type="hidden" name="dispalySubTypeId" value="<%=dispSubTypeId%>">

							 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%=displaySubTypeName%>
											</div>
										</div>
									</div>
								</div>
		     			
							 <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sub-Type Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<%=dispDesc%>
											</div>
										</div>
									</div>
								</div>
					
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="buttonSubType" value="Confirm Delete">Confirm Delete</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type="button" value="Cancel"  onclick="javascript:history.back(-1);">Cancel</button>
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

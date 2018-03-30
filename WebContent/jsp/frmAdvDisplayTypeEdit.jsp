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
<script src="js/frmAdvDisplayType.js" type="text/javascript" ></script>
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
						
						<h2> Advertisement: Update Advertisement Type</h2>
						
						</div>

				<!--==============================================content start here============================================-->
				
				 <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						

	<p>Please create the required Advertisement Type for all the advertisements that are to be placed for all the event. 
	
		Select a Media Type given below and fill-in the relevant Advertisement Type details.</p>
  
				  <% String statuscheck = (String)request.getAttribute("err");
								
								if(statuscheck!=null && statuscheck.equals("st")){
								%>
								<p id="p.error">Advertisement Type Name Already Exists. Try it Again</p>
								
								<%
								}
								%>
  
					<form class='form-horizontal' role='form' name="frmCreateAdvType" method="post" action="./advertisement.html" onsubmit="return advDisplayEdit();">
					 <input type="hidden" name="advProcess" value="advDispEdit">
				
			            <p>Required fields are marked with an asterisk<span style="color:#FF0000">*</span></p>
			  
			   					 <div class='form-group'>
								 
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
									
                                    	<div class='col-md-8'>
										
                                        	<div class='col-md-3 indent-small'>
                                            
												<div class='form-group internal'>
				     
													<select name="mediaDispId" id="mediaDispId" class="form-control">
													<option selected="selected">Select One</option>
													<%
													String displayId = "";
													String displayName = "";
													String mediaDispId = "";
													String displayDesc = "";
													String displayStatus= "";
													
													String dispType [] =(String[])session.getAttribute("objSesAdvEditDisp");
													if(dispType!=null){	  
													displayId = dispType[0] ;
													displayName =dispType[1] ;
													mediaDispId =dispType[2] ;
													displayDesc = dispType[3] ;
													displayStatus =dispType[4] ;
													}
													%>
											<%
												Vector vDisp = (Vector)session.getAttribute("objSesAdvEditDispMedia");
												if(vDisp==null && vDisp.size()==0){
												response.sendRedirect("/advertise/frmAdvIssueList.jsp");
												}
												%>
															
																<%	Enumeration eDisp = vDisp.elements();
																	String mediaId = "";
																	String mediaName = "";
																	String mediaDesc  = "";
																	String mediaStatus = "";
																		while(eDisp.hasMoreElements()){
																			String[] sMedia = (String [])eDisp.nextElement();
																			mediaId = sMedia[0];
																			mediaName =sMedia[1];
																			mediaDesc  =sMedia[2];
																			mediaStatus = sMedia[3];
																			if(mediaId.equals(mediaDispId)){%>
																					
																						<option  value="<%=mediaId%>" selected><%=mediaName%></option>
																						<%
																					}
																					else{
											%>
													 <option value="<%=mediaId%>"><%=mediaName%></option>
													<%
													}
												}
													%>
									</select>
									
					 					<span id="span_astriesk">*</span>
		     	 
				    				<input type="hidden" name="displayId" value="<%=displayId%>">
									
								</div>
							
							</div>
							
						</div>
						
					</div>
	
							<div class='form-group'>
								 
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type Name:</label>
									
                                    	<div class='col-md-8'>
										
                                        	<div class='col-md-3 indent-small'>
                                            
												<div class='form-group internal'>
					
													<input type="text" class="form-control" name="txtDisplayType"  value="<%=displayName%>" />
														
														<span id="span_astriesk">*</span>
												</div>
												
											</div>
											
										</div>
										
								</div>
							
								<div class='form-group'>
								 
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
									
                                    	<div class='col-md-8'>
										
                                        	<div class='col-md-3 indent-small'>
                                            
												<div class='form-group internal'>
												
													<textarea name="txtareaDisplayTypeDesc"  cols="25" rows="5" class="form-control"><%=displayDesc%></textarea>
													
													<span id="span_astriesk">*</span>
												</div>
												
											</div>
											
										</div>
										
									</div>	
									
							<div class='form-group'>
							
                                    <div class='col-md-offset-4 col-md-1'>
									
                                        <button class='btn-lg btn-primary' type='submit'  name="advButtonDisp" value="Update">Update</button>
                                    
									</div>
									
                                    <div class='col-md-2'>
									
                                        <button class='btn-lg btn-danger' type="button" name="advButtonDisp" value="Cancel" style='' onclick="javascript:history.back(-1);">Cancel</button>
                                    </div>
									
                                </div>
								
				</form>
	
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

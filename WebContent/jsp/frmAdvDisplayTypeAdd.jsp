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

					<!--==============================================content start here============================================-->
  				<div class="col-md-10">
			
               		 <div class='container'>
				
                    		<div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                      		  <div class='panel-heading'>
							  
							  <h2>Advertisement: Create an Advertisement Type

  							  </div>
					<!--==============================Form Title=================================-->
						
                           <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
   
	<p>  Please create the required Advertisement Type for all the advertisements that are to be placed for all the events.
		
		Select a Media Type given below and fill-in the relevant Advertisement Type details. </p>

				<% String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>
				<p>Advertisement Type   Name Already Exists. Try it Again</p>
				
				<%
				}
				%>
 
		<form   class='form-horizontal' role='form' name="frmCreateAdvType" method="post"  action="./advertisement.html" onsubmit="return advDisplayAdd();">
		<input type="hidden" name="advProcess" value="advDispTypeInsert">

			<p>Required fields are marked with an asterisk<span class="asterisk" style="color:#FF0000;">*</span></p>
				
				 
				  <div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select a Media Type:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
										
				                                <select name="mediaDispId"   class="form-control">
												<option selected="selected">Select One</option>
					 	
							<%
							Vector media = (Vector)session.getAttribute("objSesAdvAddDisp");
							if(media!=null && media.size()!=0){
							%>
                      <%
								Enumeration emedia = media.elements();
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
							%>
							<option value="<%=mediaId%>"><%=mediaName%></option>
							<%}%>
						</select>
						<%}%>
				 	 <span id="span_astriesk">*</span>	
					 				 	</div>
								</div>
						</div>
						
				      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Type Name:</label>
							 <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
												<input type="text" class="form-control" name="txtDisplayType" size="20" />
				 								 <span id="span_astriesk">*</span>				
				  						  </div>
								   </div>
							 </div>
								   

				   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
							<div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                          <div class='form-group internal'>
										       <textarea name="txtareaDisplayTypeDesc" cols="25" rows="5" class="form-control"></textarea>
				   							   <span id="span_astriesk">*</span>	
										  </div>
									</div>
							</div>
						</div>
					
				 		 <div class='form-group'>
                                 <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="advButtonDisp2" value="Create">Create</button>
								 </div>
								  <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="reset" name="advButtonDisp" value="Reset" style=''>Reset</button>
					              </div>
						 </div>
					</form>	
											<!--==============================Form Body=================================-->

				</div>
			</div>
		</div>
	</div>
 
  
			                  <!--==============================================content end here============================================-->


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

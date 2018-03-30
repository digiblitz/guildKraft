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
<!DOCTYPE html>
<html class="no-js">

<head>
    <title>sample</title>
  <script src="js/frmAdvIssue.js" type="text/javascript" ></script>
	
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
                            <h2>Advertisement:Edit Issue Master </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Please edit the required Advertisement Issue Master for all the advertisements that are to be placed both in Magazine &amp; Omnibus for all the event. 
	
		Select a Media Type given below and fill-in the relevant Issue Master details.</p>
		 <p>Fields mark with asterisk(<span style="color:#FF0000;">*</span>) are mandatory</p>
							
						<!--==============================Form Description=================================-->
							
                           <% String statuscheck = (String)request.getAttribute("err");
					
						if(statuscheck!=null && statuscheck.equals("st")){
					%>
                            <p id="p_error">Issue  Name Already Exists. Try it Again</p>
                            <%
                            }
                            %>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmEditIssueMast" method="post" action="advertisement.html" onSubmit="return advIssueEditCheck();">
							
                                <input type="hidden" name="advProcess" value="advIssueEdit">

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select A Media Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="mediaNewid"  class="form-control">
							<option selected="selected" value="">Select One</option>
							
			<%
			Vector vvIssue = (Vector)session.getAttribute("objSesAdvEditIssueMedia");
			if(vvIssue==null && vvIssue.size()==0){
			response.sendRedirect("frmAdvIssueList.jsp");
			}
			%>
						     <%	String issueId ="";
								String media_id ="";
								String issueName ="";
								String issueStatus ="";
								String[] s =(String[])session.getAttribute("objSesAdvEditIssue");
									if(s!=null){
										issueId=  s[0];
										media_id = s[2];
										issueName = s[1];
									}
							 	Enumeration eIssue = vvIssue.elements();
								String mediaId = "";
								String mediaName = "";
										while(eIssue.hasMoreElements()){
										String[] sMedia = (String [])eIssue.nextElement();
										mediaId = sMedia[0];
										mediaName =sMedia[1];
												if(mediaId.equals(media_id)){%>
													<option value="<%=mediaId%>" selected="selected"><%=mediaName%></option>
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
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Issue Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="hidden" name="issueId" value="<%=issueId%>">
					<input type="text" class="form-control" name="txtIssueName" value="<%=issueName%>" /><span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="advIssueButton" value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' value="Cancel" onClick="javascript:history.back(-1);">Cancel</button>
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

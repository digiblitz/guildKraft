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
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html class="no-js">

<head>
    <title><%=(String)session.getAttribute("title")%></title>
   <script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>
   
   <script>
    function cancelAddRole(privName,accessName)
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{ 
        strURL = "./roles.html?roleProcess=roleList&navPrivName="+privName +"&navAccessName="+accessName;
	window.location.href = strURL;
        }
	else
	{
		return;
	}
    }
	</script>
	
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
                            <h2>Create a Role</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Create a New Roles for all members and non-members.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="" onSubmit="return formValidate(this);">
							
                                 <input type="hidden" name="roleProcess" value="createRole"/>

                               
                               		<p><font color="#FF0000">Fields marked with an asterisk (<span class="asterisk">*</span>) are required.</font></p>
										
										 <%
											String err = request.getParameter("err");
											if(err!=null) {
										  %>
							  		<p id="p_error">Role already exist</p>
											<%}%>
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Role:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                            					 <input name="rolename" id="rolename" type="text" class="form-control" />
												  <span id="span_astriesk">*</span>
												 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                            					 <input name="roledesc" id="roledesc" type="text" class="form-control" />
												 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                            					  <input type="radio" name="status" value="1"  id="status1" style="margin-top:11px"/>Active
                              
                              					<input type="radio" name="status" value="0"  id="status2" style="margin-top:11px"/>Inactive
												<span id="span_astriesk">*</span>
                            
                                            </div>
                                        </div>

                                    </div>
									 <% 
										String privName=(String)session.getAttribute("navPrivName");
										String accessName=(String)session.getAttribute("navAccsName");
									  
									  %>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Create</button>
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' type="reset" onclick = "clearFields(this.form)">Clear</button>
                                    </div>
									
									 <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' type="button" value="Cancel" onclick ="cancelAddRole('<%=privName%>','<%=accessName%>')">Cancel</button>
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

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
<script src="js/frmRolMCreatePermissionValidate.js" type="text/javascript" ></script>
<script>
    function cancelEditRole()
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./roles.html?roleProcess=permissionList";
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
						
                            <h2>Roles &amp; Privileges: Edit Permission</h2>
							
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->                 
                  <p>You can Edit/Update the Permission created by you as given below. </p>
                
                		
						<%  
							String permissionId = "";
							String permissionName = ""; 
							String[] s = (String[])request.getAttribute("permDetails");
							//out.print("Role Details:" + s);
							if(s!=null){
								permissionId = s[0];
								permissionName = s[1]; 
							}
						  %>
                   
				    <form  class='form-horizontal' role='form' name="frmRolMEditPermission" id="myform" action="roles.html" onsubmit="return myvalidate1();">
						<input name="roleProcess" type="hidden" value="editPerm" />
                      	<input name="permissionId" type="hidden" value="<%=permissionId%>" />
                     
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
						  %>
                         
						  <p id="p_error">This Permission Name Already Exist</p>
                         
                          <%
						  }
						  %>
                         
						  <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Permission Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                           							<input name="permissionName" type="text" id="permissionName" class="form-control" value="<%=permissionName%>" >
                       						</div>
										</div>
									</div>
								</div>
						  
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit"  value="Update">Update</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button"  value="Cancel" onclick ="cancelEditRole()">Cancel</button>
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

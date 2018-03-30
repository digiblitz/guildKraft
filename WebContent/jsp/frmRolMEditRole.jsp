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
<%@ page import="java.lang.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>

<script>
    function cancelEditRole()
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./roles.html?roleProcess=roleList";
	window.location.href = strURL;
        }
       else
	{
		return;
	}
    }
	function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.roledesc.value = "";
		}

		if(obj.elements[i].type=='radio')
		{
			obj.elements[i].checked = false;
		}
	}
}

</script>
<!--End:[RoleMgt] For Role Addition, Editing and Deletion changes dated 10-Mar-2011-->
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
                            <h2>Maintain Roles:Edit</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Edit/Update the Role</p>
							
						<!--==============================Form Description=================================-->
							
                           <%
							String roleId = "";
							String rolName = "";
                                                        String roledesc = "";
                                                         String status = "";

							String[] s = (String[])request.getAttribute("roleDetails");
							System.out.print("Role Details:" + s);
							if(s!=null){
								roleId = s[0];
								rolName = s[1];
                                                                roledesc= s[2];
                                                                status =s[3];
							}
						%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="roles.html" onsubmit="return formValidate(this);">
							
                                <input type="hidden" name="roleProcess"	value="editRole"/>
                        		<input type="hidden" name="roleId" value="<%=roleId%>"/>
								
								<p>Fields marked with an asterisk (<span style="color:red">*</span>) are required.</p>
								
									 <%
										String err =(String) request.getAttribute("err");
										if(err!=null) {
									  %>
										<p id="p_error">Role already exist</p>
									
									<%
										  rolName=(String)request.getAttribute("rolname");
									  }
									 %>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Role:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                 <input name="rolename" id="rolename" type="text" class="form-control" value="<%=rolName%>" size="25" maxlength = "100" readonly="true"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="roledesc" id="roledesc" type="text" class="form-control" value="<%=roledesc%>" size="25" maxlength = "100"/>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
										<div class='col-md-8'>
                                            <div class='col-md-3 indent-small'>
                                               <div class='form-group internal'>
												  <%if(Integer.parseInt(status)==1){%>
                                
													  <input type="radio" name="status" id="status1" value="1" checked="checked" style="margin-top:11px" /> Active
									 
														<input type="radio" name="status" id="status2" value="0" style="margin-top:11px"/>   Inactive 
															<span id="span_astriesk">*</span>
												
												  <%}else{%>
												  
														  <input type="radio" name="status" id="status1" value="1" style="margin-top:11px"  /> Active
									 
															<input type="radio" name="status" id="status2" value="0" checked="checked" style="margin-top:11px" /> Inactive
																<span id="span_astriesk">*</span>
															
													 <% } %> 
                          
                         					
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Update</button>
										
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' type='button' value="Clear" onclick = "clearField(this.form)">Clear</button>
                                    </div>
									
									 <div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' type='button' value="Cancel" onclick ="cancelEditRole()">Cancel</button>
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

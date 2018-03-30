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
                            <h2>Roles &amp; Privileges: Permission Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				
				 <p>You are viewing the list of Permissions created by you. To	edit a permission click on the Edit button beside each record. To deactivate a permission click on the 'Deactivate' button beside the corresponding record. </p>
                		
						<div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>
										
											<label class='control-label label1'>Name of Permission</label>    
											
										</div>
										
										<div class='col-md-2'>
											
											<label class='control-label label1'>Edit</label>   
												
										</div>
										
										</div>
										
									</div>
									
                                </div>
							</div>
                       
								  <%  
								   ArrayList roleList = (ArrayList) request.getAttribute("allPermList");
									 if(roleList!=null && roleList.size()!=0){
										Iterator it = roleList.iterator();
										while(it.hasNext()){
											String[] s = (String[])it.next();
											//String privilegeId = s[0];
											String permissionId = s[0];
											String permissionName = s[1];
										%>
										
                      <form class='form-horizontal' role='form' name="frmRolMListPermissions" id="myform" action="roles.html" onsubmit="return myvalidate(this);">
                        <input name="roleProcess" type="hidden" value="initEditPerm" />
                        <input type="hidden" name="permissionId" value="<%=permissionId%>">
                        
						<div class="margin">
							
								<div class='form-group'>
								
                                   <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-4'>
										
											<label class='control-label  '>&emsp;<%=permissionName%></label>    
											
										</div>
										
										<div class='col-md-2 '>
											
											 &emsp;<button class='btn-sm btn-primary' name="Submit2" type="submit"  value="Edit">Edit</button>
												
										</div>
										
										</div>
										
									</div>
								
								</div>
							
							</div>
								
                      			</form>
                    <!--
					  		<tr>
							<td height="25" colspan="5"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="#" class="linkThree">Prev</a> | <a href="#" class="linkThree">Next</a>			</td>
						   </tr>
						 -->
                     
                        <%
					   } 
					   }
					    else {
						%>
                    	<div class='form-group'>
						
							<div class='col-md-4'>
							 </div>
							 
							 <div class='col-md-4'>
							 	There is no Record available
							 </div>
							
						</div>
                  
                      <% } %>
                    
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

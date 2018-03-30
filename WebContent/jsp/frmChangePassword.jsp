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
<!--<script src="js/changePassword.js" type="text/javascript" ></script>-->

<script src="js/lib/jquery.js"></script>
<script src="js/dist/jquery.validate.js"></script>





 <!--<script language="javascript" />

function remloadVal(){

if(document.changePassword.currPwd.value!=null){
document.changePassword.currPwd.value="";

}else{

document.changePassword.currPwd.value="";
}
return true;
		}

</script>-->
<script>
$(document).ready(function() {
	jQuery.validator.addMethod(
        'ContainsAtLeastOneSpecialCharacter',
        function (value) { 
            return /[!,%,&,@,#,$,^,*,?,_,~,]/.test(value); 
        },  
        'Your password must contain at least one Special Character.'
    );
 
	
		
		
			var validator = $("#myform").validate({
			rules: {
				currPwd:{
					required:true,
					minlength: 8,
				},
				newPwd:{
					required:true,
					minlength: 8,
					ContainsAtLeastOneSpecialCharacter:true,
				},
				reNewPwd:{
					required:true,
					equalTo:"#newPwd",
				}
			},
			messages: {
			    currPwd:{
				      required:"Provide your current password",
			
				},
				 newPwd:{
				      required:"Provide a new password",
					  minlength: jQuery.validator.format("Enter at least {0} characters"),
				 },
				reNewPwd:{
				       required:"Repeat the new password",
					   equalTo:"Enter the same password as above",
				}
			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if (element.is(":radio"))
					error.appendTo(element.parent().next().next());
				else if (element.is(":checkbox"))
					error.appendTo(element.next());
				else
					error.appendTo(element.parent());
			},
		});

	
	});
					
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
				
					<div class='panel-heading'>
                            <h2>Membership: Change Password</h2>
					</div>
					
					 <div class='panel-body'>
                      <p>You can change your account Password right here.</p>
				
				
			
			<form class='form-horizontal' role='form' name="changePassword" id="myform" method="post" action="user.html?cmd=chngPwd" onsubmit="return myvalidate(this);" >
			
             	
               <div class='form-group'>
				 	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Current Password:</label>
					
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<input type="password" name="currPwd" id="currPwd" class="form-control"  />
                            	<span id="span_astriesk">*</span> 
							</div>
						</div>
					</div>
					
					
                      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>New Password:</label>
					  
                      <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<input type="password" name="newPwd" id="newPwd" class="form-control"  />
                            	<span id="span_astriesk">*</span>
						</div>
					</div>
				</div>
							
							
                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Re-Type New Password:</label>
					  
                    <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<input type="password" name="reNewPwd" id="reNewPwd" class="form-control"  />
                            	<span id="span_astriesk">*</span> 
							</div>
						</div>
					</div>
				</div>
					
					
					<div class="form-group">
                    <div class='col-md-offset-4 col-md-1'>
                      <button class='btn-lg btn-primary' name="submit" type="submit"  value="Change">Change</button>
					</div>
					
					 <div class='col-md-2'>
                      	&emsp;<button class='btn-lg btn-danger' name="button" type="button" onclick="javascript:history.back(-1);" value="cancel" >Cancel</button>
					 </div>
				</div>
		 </form>
		  
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

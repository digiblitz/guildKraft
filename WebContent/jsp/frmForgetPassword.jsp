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
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/forgotPassword.js" type="text/javascript" ></script>

 <script language="javascript" />
function dispQDiv(){

	document.getElementById('secretQuest').style.display = "none";
document.getElementById('chkEmail').style.display="none";
		}
		
		function submitform(paramValue)
{

if(paramValue!=null && paramValue!="null"){
document.getElementById('chkEmail').style.display="block";
}
}
</script>


<!--script type="text/javascript">
<!-- Include JS File Here
window.onload = function() {
// Onload event of Javascript
// Initializing timer variable
var x = 5;
var y = document.getElementById("timer");
// Display count down for 20s
setInterval(function() {
if (x <= 6 && x >= 1) {
x--;
y.innerHTML = '' + x + '';
if (x == 1) {
x = 6;
}
}
}, 200);
// Form Submitting after 20s
var auto_refresh = setInterval(function() {
submitform();
}, 3333);
// Form submit function
function submitform() {

//alert('Form is submitting.....');
document.getElementById("forgotuserpassword").submit();

}
// To validate form fields before submission
function validate() {
// Storing Field Values in variables
var name = document.getElementById("name").value;
var email = document.getElementById("email").value;
var contact = document.getElementById("contact").value;
// Regular Expression For Email
var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
// Conditions
if (name != '' && email != '' && contact != '') {
if (email.match(emailReg)) {
if (document.getElementById("male").checked || document.getElementById("female").checked) {
if (contact.length == 10) {
return true;
} else {
alert("The Contact No. must be at least 10 digit long!");
return false;
}
} else {
alert("You must select gender.....!");
return false;
}
} else {
alert("Invalid Email Address...!!!");
return false;
}
} else {
alert("All fields are required.....!");
return false;
}
}
};</script>	-->	

</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="dispQDiv();" >

<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
       <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		

		
			

					<%
							String pass=(String)request.getAttribute("pass");
							System.out.println("idstatus parasu from jsp :" +pass);
							String passwo = (String)request.getAttribute("password");
							String emailid = (String)request.getAttribute("emailid");
							String usrname = (String)request.getAttribute("usrname");
							 System.out.println("password from jsp :" +passwo);
							  System.out.println("emailid from jsp :" +emailid);
							   System.out.println("usrname from jsp :" +usrname);	
							if(pass!=null && pass.equals("digiblitz"))
							{
														
														%>

<%}%>

									 
  								<%
								String idstatus3=(String)request.getAttribute("user");
                                System.out.println("idstatus from jsp :" +idstatus3);
								String username = (String)request.getAttribute("username");
								String useremail = (String)request.getAttribute("email");
									
								if(idstatus3!=null && idstatus3.equals("digiblitz"))
								{
									%>

  <%}%> 
  
  		 <div class="col-md-12">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
				
				 <div class='panel-heading'>
                    <h2>Sign-In Problems</h2>
				</div>
				
	   			<div class='panel-body'> 
				
				                    
	      <p>If   you've forgotten your Password, you can retrieve it by filling in your username and answering to the secret question you had given during your Registration Process. If you've forgotten the USERNAME to your account,   please enter your  e-Mail ID. Your USERNAME would be mailed to this ID.</p>
             
			 <div class='col-md-offset-2'>             
				<p class='para'>FORGOT Password? </p>
			</div>
			
   <form class='form-horizontal' role='form' name="frmForgetPwd1" id="frmForgetPwd1" action="user.html?cmd=User" method="post" onsubmit="return myvalidate(this);" >
                                  
                                  <%
								String idstatus=(String)request.getAttribute("idstatus");
                                 System.out.println("idstatus from jsp :" +idstatus);
									
								if(idstatus!=null)
								{
									if(idstatus.equalsIgnoreCase("fail"))
									{%>
									
                               <p id="p_error">Sorry, your details does not match!</p>
                               
                                  <%}
									}    
								%>
								
                <div class='form-group'>
				 	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Username:</label>
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<input name="usrname" id="usrname" type="text" class="form-control" onblur="usrStat();"  onchange="usrStat()"/>
                                  <span  id="span_astriesk">*</span>
								</div>
							</div>
						</div>
						<div id="secretQuest">
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Your Secret Question:</label>
							<div class='col-md-8'>
							   <div class='col-md-3 indent-small'>
								   <div class='form-group internal'>
								   		<input name="sAnswer2" id="sAnswer2" type="text" style=" width: 225px;" readonly="readonly" class="form-control"  />                   
							            </div>
									</div>
								</div>
								
								
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter Your Answer:</label>
							 <div class='col-md-8'>
							   <div class='col-md-3 indent-small'>
								   <div class='form-group internal'>
								   		<input name="sAnswer" type="text" class="form-control" id="sAnswer"  />
                                         <span  id="span_astriesk">*</span>
									</div>
								</div>
							</div>
					
							
						<div class="form-group">	
								<div class='col-md-offset-4 col-md-3'>
									 <button class='btn-lg btn-primary' name="log" type="submit" value="Send My Password">Send My Password</button>
								</div>
							</div>
				 </div>
				 	</div>
				   <div id="noSecretQuest">
                                      <%
								String idstatus1=(String)request.getAttribute("status");
                                System.out.println("idstatus from jsp :" +idstatus1);
									
								if(idstatus1!=null)
								{
									if(idstatus1.equalsIgnoreCase("success"))
									{%>
									
					<p>Congrats! Your Username matches. Your Password will be sent to your e-Mail matching this username.</p>
					
					
					<div class="form-group">
                        <div class='col-md-offset-5 col-md-1'>
							<a href="login.html?cmd=initLogin" >Sign In</a>	
						</div>	
					</div>								
								 <%}
									}  
								  %>
                            </div>         
								   </form> 
                           
								
                  
						   <div class='col-md-offset-2'>
							 <p class='para'>FORGOT Username?</p>
                             </div>
                            <form class='form-horizontal' role='form' action="user.html?cmd=Password" method="post" name="frmForgetPwd2" id="frmForgetPwd2" onsubmit="return myvalidate2(this);" >
                                     
                                    <%
									String status=(String)request.getAttribute("status");
                                    System.out.println("status from jsp :" +status);
                                                                        
									if(status!=null)
									{
										if(status.equalsIgnoreCase("fail"))
										{%>
                                     <p id='p_error'>Sorry, your details does not match!</p>
									 
                                      <%}
									}%>
							
							
					 <div class='form-group'>		
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail:</label>
                             <div class='col-md-8'>
							   <div class='col-md-3 indent-small'>
								   <div class='form-group internal'>
								   		<input name="usrname2" type="text" class="form-control" onblur="submitform(this.value);"/>
                                     	<span c id="span_astriesk">*</span>For example: person@domainname.com
									</div>
								</div>
							</div>
						</div>
					
                 <div id="chkEmail" >
					 <div class='form-group'>						  
							 <div class='col-md-offset-4 col-md-3'>
									 <button class='btn-lg btn-primary' name="log" type="submit" value="Send My Username">Send My Username</button>
							</div>
						</div>
					</div>	
									   <%
								String idstatus2=(String)request.getAttribute("status1");
								System.out.println("idstatus from jsp :" +idstatus2);
								
								String pw=(String)request.getAttribute("password");
								System.out.println("password from jsp :" +pw);
									
								if(idstatus2!=null)
								{
									if(idstatus2.equalsIgnoreCase("success"))
									{%>
						 <p> Congrats! Your e-Mail matches. Your username will be sent to your e-Mail.</p>									

						<div class="form-group"> 
								 <div class='col-md-offset-5 col-md-1'>            
									<a href="login.html?cmd=initLogin" >Sign In</a>	
								</div>	
						</div>								
										 <%}
											}   
										 %>
							  </form>
							  
								
									
									
										</div>
									</div>
								</div>
							</div>
					
              
			
          
		  		</div>
   			</div>
	
		
		   
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
	</body>
</html>

                                
                    

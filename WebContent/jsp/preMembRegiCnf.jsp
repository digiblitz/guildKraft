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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <link rel="icon" href="images/favicon1.png" type="image/x-icon" />
    <link rel="stylesheet" href="css/grid.css" />
    <link rel="stylesheet" href="css/camera.css"/>
    <link rel="stylesheet" href="css/style1.css" />
	<link rel="stylesheet" href="css/styles.css" />
	<link rel="stylesheet" href="css/font-awesome.min.css" />
	
    
    <link rel="stylesheet" href="css/hoe.css" type="text/css" />

	
	<script src="js/jquery.js"></script>    
    <script src="js/jquery.matchHeight-min.js"></script>
    <script src="js/wow/wow.js"></script>   
<script src="js/general.js" type="text/javascript"></script>
<script src="js/script.js"></script>

</script>
<script type="text/javascript">
<!-- Include JS File Here-->
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
document.getElementById("userregi").submit();

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
};</script>
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%String logName=(String)session.getAttribute("loginName");
System.out.println("logName ----> "+logName);
if(logName == null){
	System.out.println("logName 111 if ----> "+logName);
	%>

		
   <!--========================================================
                          HEADER
=========================================================-->
	<%@ include file = "../../include/Header_temp.jsp" %>	
<%}else{
	System.out.println("logName else ----> "+logName);
	%>
	<!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
<!--==============================include header Here=================================-->
<%}%>	

<section id="content">

<% String email=(String)request.getAttribute("email"); %>
 <% String usrname=(String)request.getAttribute("usrname"); %>
 <% String pwd=(String)request.getAttribute("pwd"); %>
 
 <%
					 String memberid = "";
					 memberid = (String)request.getAttribute("membId");%>
						
				


				

<div class="bg-camera">
    <div class="border-bottom">
        <div class="container">
            <div class="wrapper1-t wrapper1-b">
                <div class="row">
                    <div class="grid_12">
					
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
 				<p class="col-md-offset-3">Member registred successfully</p>
				<br />
				
				<p class="col-md-offset-3">Your member ID is <%=memberid%></p>
							
		   				 </div>
						
                    </div>
					
                </div>
				
            </div>
			
			</div>
        </div>
    </div>
	</div>
	</div>
	</div>

</section>

<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
	<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>

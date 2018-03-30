<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Payment Fail</title>
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
document.getElementById("fail").submit();

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

<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
      

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			<div class="col-md-2 pad">
		
		
			</div>
<%String firstname=(String)request.getAttribute("fName"); %>
<%String lastname=(String)request.getAttribute("lName"); %>
<%String e_mail=(String)request.getAttribute("emailId"); 
  String pay_e_mail=(String)request.getAttribute("pay_e_mail");%>
<%String transactionId = (String)request.getAttribute("transactionId"); 
%>
<% String reason="Credit card validation is failed";%>
<section id="content">


   
   <div class="col-md-10">
		<div class='container'>
			 <div class='panel panel-primary dialog-panel'>
			 	<div class='panel-body'>
                  <a class="btn color_3 text_3" href="#">Payment Failure. Please try again</a></div>

               <!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				

            </div>
			
			

        </div>
		
    </div>
	
			
</body>

</html>

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
<title>guildKraft-User Registration</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

    <link rel="icon" href="images/favicon1.png" type="image/x-icon">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/camera.css"/>
    <link rel="stylesheet" href="css/style1.css">
	<link rel="stylesheet" href="css/styles.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	
    
    <link rel="stylesheet" href="css/hoe.css" type="text/css" />
    	
	<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/memberUserRegistration.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="build/js/intlTelInput.min.js"></script>


<script src="js/jquery.js"></script>
<script src="js/jquery.mockjax.js"></script>
<script src="js/jquery.validate.js"></script>
<script type="text/javascript" src="js/jquery.ui.validate.js"></script>
<script src="js/jquery.maskedinput.js"></script> 


<script src="js/primary_country.js" type="text/javascript"></script>
<!--script src="js/country_code.js" type="text/javascript"></script-->

<script src="js/general.js" type="text/javascript"></script>



<script type="text/javascript">
	$(document).ready(function() {
	
	
	 
	 $("#flip1").click(function(){  
			$("#panel").show();   
		});    
		$("#flip2").click(function(){ 
			$("#panel").hide();  
		});
		
		
		
		jQuery.validator.addMethod(
        'ContainsAtLeastOneDigit',
        function (value) { 
            return /[0-9]/.test(value); 
        },  
        'Your password must contain at least one Numeric Letter.'
    );  
 
    jQuery.validator.addMethod(
        'ContainsAtLeastOneCapitalLetter',
        function (value) { 
            return /[A-Z]/.test(value); 
        },  
        'Your password must contain at least one Capital Letter.'
    );
	
	
	jQuery.validator.addMethod(
        'ContainsAtLeastOneSpecialCharacter',
        function (value) { 
            return /[!,%,&,@,#,$,^,*,?,_,~]/.test(value); 
        },  
        'Your password must contain at least one Special Character.'
    );
		
		
		 $("#frmMembRegi").validate({
			 			 
			rules: {
				fname: "required",
				lname: "required",
				usrname:{
					required:true,
					minlength: 3
					},

				dat:{					
			            required: true, 
			            date: true 			   				
				},
				email: {
					required: true,
					email:true					
				},
				pwd: {
					required: true,
					minlength: 8,
					ContainsAtLeastOneDigit: true,
					ContainsAtLeastOneCapitalLetter: true,
					ContainsAtLeastOneSpecialCharacter:true
				},
				cpwd: {
					required: true,
					equalTo: "#frmMembRegi_pwd"
				},
				QSelect:{
					required:true
					},
				ans:{
					required:true
					},
				pmob_txt1:{
					required:true
                     },
				pcountry_sel:{
						required: true
				},	
				pstate_sel:{
					required: true	
				},				
				pcity_txt:{
					required:true
				},
				pzip_txt:{                                                       
					required:true,
					number:true
				},
				uploadpic:{
						required:true
						},		
				scountry_txt:{
					required:true
				},
				sstate_txt:{
					required:true
				},

				scity_txt:{
					required:true
				},

				szip_txt:{
					required:true
				},
				scountry_txt:{
					required:true
				},
				smob_txt1:{
					required:true
				},
			},
			messages: {
				fname: "Enter your firstname",
				lname: "Enter your lastname",
				usrname	:{
				required:"Please enter Username",
				minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				dat:"Please select date",
				email: "Please enter a valid email",
				pwd: {
					required: "Provide a password",
					minlength: jQuery.validator.format("Enter at least {0} characters")
				},
				cpwd: {
					required: "Repeat your password",
					equalTo: "Enter the same password as above"
				},	
				QSelect:"Please enter Question",
				ans:"Please Fill the answer",	
				pmob_txt1:"Please enter valid Mobile No",
				pcountry_sel:"Please select country",
				pstate_sel:"Please select state",
				pcity_txt: "Please enter city",
				pzip_txt:"Please enter valid zipcode",
				uploadpic:"Please upload photo",	
				smob_txt1:"Please enter Mobile No",
				scountry_txt:"Please select your country",
				sstate_txt:"Please select state",
				scity_txt: "Please enter city",
				szip_txt:"Please enter zipcode",			

			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());
				else
					error.appendTo(element.parent());
			}
			
			
		});
	
	 if ($('html').hasClass('desktop')) {
                new WOW().init();
            }
		
	});	
	
	</script>
	
<style>   
#panel {  
    padding: 80px;  
    display: none;  
}  
#frmMembRegi label.error {
  padding-left: 0px; 
  color: red;
}

 .label{
	font-family:"Times New Roman", Times, serif;
	display: inline-block;
	font-size:15px;
	text-align: left;
	
}
#span_astriesk {
    color: #FF0000;
    top: 10px;
    position: absolute;
    float: right;
    right: -10px;
}

</style> 
</head>

<body>

<!--========================================================
                          HEADER
=========================================================-->
<header id="header">
    <div class="container">
        <div class="row">
            <div class="grid_12">
                <div class="put-left logo-caption">
                    <h1>
                        <a class="color_2" href="user.html?cmd=inithome"><img src="images/logo.png" alt="Logo">
                        </a>
                    </h1>
				</div>


				
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div id="">
        <div class="container">
            <div class="row">
                <div class="grid_12">
					<div class="border-wrapper">
                        <nav class="put-left header-menu">
                            <ul class="sf-menu">
                                <li class="current">
                                    <a href="user.html?cmd=inithome">Home</a>
                                </li>
								<li>
                                    <a href="about_guild.jsp">About</a>
									<ul>
										<li><a href="about_guild.jsp">About the Guild</a></li>
										
									</ul>
                                </li>
                                <li>
                                    <a class="second" href="membership.jsp">Membership</a>
                                    <ul>
                                        <li>
                                            <a href="membershipperks.jsp">Membership Perks</a>
                                        </li>
                                        <li>
                                            <a href="user.html?cmd=initUsrReg">Membership Signup</a>
                                            <!--<ul>
                                                <li>
                                                    <a href="#">Latest</a>
                                                </li>
                                                <li>
                                                    <a href="#">Archive</a>
                                                </li>
                                            </ul>-->
                                        </li>
                                       
                                    </ul>
                                </li>
                                <li>
                                    <a href="event_calendar.jsp">Events</a>
									<ul>
										<li><a href="event_calendar.jsp">Calendar</a></li>
										<li><a href="sponsor.jsp">Become a Sponsor</a></li>
									</ul>
                                </li>
                                <li>
                                    <a href="#">Certification</a>
									<ul>
										<li><a href="certificate.jsp">Professional Certification</a></li>
									</ul>
                                </li>
                                <li>
                                    <a href=" https://digiblitz.com/bdtg-knowledgebase/" target="_blank">Knowledgebase</a>
									<!--ul>
										<li><a href="">Press Releases</a></li>
										<li><a href="">Articles and Whitepapers</a></li>
									</ul>-->
                                </li>
								
								<!--li>
                                    <a href="#">Body of Knowledge</a>
									<ul>
										<li><a href="">Industry Leadership</a></li>
										<li><a href="">The Team</a></li>
										<li><a href="">Organization’s structure</a></li>
										<li><a href="">Join the Team</a></li>
									</ul>
                                </li>-->
								
								<li>
                                    <a href="https://digiblitz.com/bdtg-community/" target="_blank">Community</a>
								</li>
								
								<li>
                                    <a href="#">Body of Knowledge</a>
									<ul>
										<li><a href="Tbok.jsp">About Tbok</a></li>
										
									</ul>
                                </li>
                                
                                <li>
                                    <a href="frmContacts.jsp">Contact Us</a>
                                </li>
                            </ul>
                        </nav>

						<div class="ar login_popup">
        <a class="button" href="#" >Login</a>
        
        
        <div class="popup">
        	<a href="#" class="close">CLOSE</a>
             <form id="loginform" name="loginform" method="post" action="login.html?cmd=initDash">
         	<P><span class="title">Username</span> <input name="textfield" type="text" /></P>
             <P><span class="title">Password</span> <input name="textfield2" type="password" /></P>
             <!-- <P><input name="" type="button" value="Login" /></P> -->
             <P><input type="submit" name="Submit" id="loginbtn"  value="Login" tabindex="3" class="button-add">
				<a href="user.html?cmd=initUsrReg" style="margin-left:170px;">Register</a></P>
         </form>
        </div>
    </div>
					
						
				
						
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</header>
<!--========================================================
                          CONTENT
=========================================================-->
	
		<% String fname=(String)request.getAttribute("fname");
String lname=(String)request.getAttribute("lname");
String usrname=(String)request.getAttribute("usrname");

%>
		

<div class="bg-camera">
    <div class="border-bottom">
        <div class="container">
            <div class="wrapper1-t wrapper1-b">
                <div class="row">
                    <div class="grid_12">
                       
					  <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
		<!--==============================include header Here=================================-->
		
		
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
				
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>User Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>User, please take your time and register to avail the privileges that accompanies with it.</p>
							<p><font color="#FF0000">All * Fields are Mandatory.</font></p>
							
						<!--==============================Form Description=================================-->
							
                            
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMembRegi" id="frmMembRegi" method="post" action="user.html?cmd=usrReg"   ENCTYPE="multipart/form-data">
							  <font color="#FF0000"><span id="errorBox"></span></font>
                             
							   <div class='panel-heading'>
									<h2>Basic Information</h2>
								</div>

                                <div class='form-group'>
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name (Login ID):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="usrname" id="frmMembRegi_usrname" class="form-control" value="<%=usrname%>" readonly />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="USelect" id="select" class="form-control">
													<option value="" selected="selected">Select One</option>
													<option value="Mr">Mr.</option>
													<option value="Mrs">Mrs.</option>
													<option value="Miss">Miss.</option>
													<option value="Ms">Ms.</option>
												  </select>
                                            </div>
                                        </div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="fname" id="frmMembRegi_fname" class="form-control" value="<%=fname%>" readonly />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="mname" id="frmMembRegi_mnam" class="form-control" />
												
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="lname" id="frmMembRegi_lname" class="form-control" value=<%=lname%> readonly />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suffix:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="sname" id="frmMembRegi_sname" class="form-control" />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Birth:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<input name="dat" type="text" readonly="true" class="form-control" id="date" />
												  
												<a onclick="javascript:NewCssCal('date')"><i id="calendar1" class="fa fa-calendar"></i></a>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									<!-- <%
                                                java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                //int day = c.get(Calendar.DAY);
                                                 //int month = c.get(Calendar.MONTH);
                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                             //String date = day+" / "+month+" / "+year;
                                                 System.out.println("Current Date = "+year5);

													 for(int f=1900;f<=year5;f++) 
															 {%>
										<option  value="<%=f%>"><%=f%></option>
										<%}%>-->
										
										
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Are you ready to disclose your gender?:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<input type="radio"  name="yesno" id="flip1"  style="margin-top:17px">Yes
													<input type="radio"  name="yesno" id="flip2"  style="margin-top:17px">No
												
											</div>
										</div>
									</div>
									
									<span id="panel">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
                                    <div class='col-md-8'> 
										<div class='col-md-3 indent-small'>									
                                            <div class='form-group internal'>
													<input type="radio" name="gender"  value="male"/>Male
													<input type="radio" name="gender" value="female"/>Female
													<input type="radio" name="gender" value="others"/>Others											
										</div>
										</div>
									</div>
									</span>
									
																		
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												   <input type="text" name="email" id="frmMembRegi_email" class="form-control"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose Your Password:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="password" name="pwd"  id="frmMembRegi_pwd" placeholder='(Minimum 8 Characters)' class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Re-Type Password:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="password" name="cpwd" id="frmMembRegi_cpwd" class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose A Secret Question:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <select name="QSelect" id="frmMembRegi_QSelect" class="form-control">
													<option selected="selected" value="">Select One</option>
													<option value="What is your favorite passtime?">What is your favorite passtime?</option>
													<option value="What is your pet's name?">What is your pet's name?</option>
													<option value="What was your first car?">What was your first car?</option>
													<option value="What is your mother's first name?">What is your mother's first name?</option>
													<option value="Which is your favorite vacation spot?">Which is your favorite vacation spot?</option>
												  </select>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Your Answer To This Question:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="ans" id="frmMembRegi_ans" class="form-control"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
								
								
								<div class='panel-heading'>
									<h2>Primary Address</h2>
								</div>
									<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Plot No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="plot_no" id="frmMembRegi_plot_no" value="" class="form-control"  />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Building No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="build_no" id="frmMembRegi_build_no" value="" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Floor No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												     <input type="text" name="floor_no" id="frmMembRegi_floor_no" value="" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Street Address</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="srt_addr" id="frmMembRegi_srt_addr" value="" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Lane:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="lane" id="frmMembRegi_lane" value="" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												    <input type="text" name="area" id="frmMembRegi_area" value="" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												  <select name="pcountry_sel" id="countryId2" class="countries2" style="width:180px;" >
													<option value="">Select Country</option>
												  </select>
												  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												   <select name="pstate_sel" id="stateId2" class="states2"  style="width:180px;">
														<option value="">Select State</option>
													 </select>
													  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												    <select  id="cityId2" name="pcity_txt" value="" class="cities2"  style="width:180px;">
				 									 <option value="">Select City</option>
													 </select>
													   <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												    <input type="text" name="pzip_txt" id="frmMembRegi_pzip_txt" class="form-control" />
													   <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                    		<div class='form-group internal'>
												<div class='col-md-1'>
												<input type="text" name="iphone_txt"  id="frmMembRegi_isd" class="form-control" placeholder='+xx' style="width:55px;" />
												</div>
												<div class='col-md-1'>
												  <input type="text" name="aphone_txt"  id="frmMembRegi_area" class="form-control" placeholder='yyy' style="width:60px;"/></div>
												  <div class='col-md-6'>
												  <input type="text" name="pphone_txt1"  id="frmMembRegi_pphone_txt1" class="form-control" placeholder='zzzzzz' style="width:100px;" />
												  
												</div>
												</div>
												
											
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="pmob_txt1"  id="frmMembRegi_pmob_txt1" class="form-control" />
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        
                                            <div class='form-group internal'>
												<div class='col-md-1'>
												 <input type="text" name="ifax_txt"  id="frmMembRegi_cfax" class="form-control" style="width:55px;" />
												 </div>
												 <div class='col-md-1'>
													 <input type="text" name="afax_txt"  id="frmMembRegi_afax" class="form-control" style="width:60px;" />
												</div>
												<div class='col-md-6'>
													<input type="text" name="pfax_txt1"  id="frmMembRegi_pfax_txt1" class="form-control" style="width:100px;" />
												</div>
											</div>
										
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Do you have secondary address ?:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" value="Primary" name="addr" size="10" checked="checked" onclick="showHideRadio('addr','sAdd','Primary');" style="margin-top:17px"/>
                    Yes
					
                    <input type="radio" value="Secondary" name="addr" size="10"  onclick="showHideRadio('addr','sAdd','Primary');" id="addr_sec" style="margin-top:17px"/>
                    No 
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload Pic:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="file" name="uploadpic" /><span>File size should be 10kb to 40kb</span>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
                                </div>
								
								
						
						
						
							<div class='form-group' id="sAdd">
							<div class='panel-heading'>
                            <h2>Secondary Address</h2>
                        </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Plot No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="splot_no" id="frmMembRegi_splot_no" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Building No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="sbuild_no" id="frmMembRegi_sbuild_no" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Floor No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="text" value="" name="sfloor_no" id="frmMembRegi_sfloor_no" class="form-control"  />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Street Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" value="" name="ssrt_addr" id="frmMembRegi_ssrt_addr" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Lane:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="slane" id="frmMembRegi_slane" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="sarea" id="frmMembRegi_sarea" class="form-control" />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="scountry_txt" id="frmMembRegi_scountry_txt" class="form-control" onchange="FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt,'');"  style="width:170px;" >
											<option selected="selected">Select One</option>
											<option value="United States of America">United States of America</option>
											</select>
											<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="sstate_txt" id="frmMembRegi_sstate_txt" class="form-control">
													<option selected="selected">Select One</option>
													<option value="FL">FL</option>
													<option value="VA">VA</option>
													</select>
													<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="scity_txt"  id="frmMembRegi_scity_txt" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="szip_txt"  id="frmMembRegi_szip_txt" class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                       
                                            <div class='form-group internal'>
												<div class='col-md-1'>
												<input type="text" name="siphone_txt"  id="frmMembRegi_siphone" class="form-control" placeholder='+xx' style="width:55px;"/>
												</div>
												<div class='col-md-1'>
											   <input type="text" name="saphone_txt"  id="frmMembRegi_saphone" class="form-control" placeholder='yyy' style="width:60px;"/>
											   </div>
											   <div class='col-md-6'>
											   <input type="text" name="sphone_txt1"  id="frmMembRegi_sphone_txt1" class="form-control"  placeholder='zzzzzz'style="width:100px;"/>
											   </div>
											   
											</div>
										
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" name="smob_txt1"  id="frmMembRegi_smob_txt1" class="form-control"/>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                       
                                            <div class='form-group internal'>
											<div class='col-md-1'>
												<input type="text" name="sifax_txt"  id="frmMembRegi_sifax" class="form-control" style="width:55px;"/>
												</div>
												<div class='col-md-1'>
												<input type="text" name="safax_txt"  id="frmMembRegi_safax" class="form-control" style="width:60px;" />
												</div>
												<div class='col-md-6'>
												<input type="text" name="sfax_txt1"  id="frmMembRegi_sfax_txt1" class="form-control" style="width:100px;"/>
												</div>
											</div>
										</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Preferred Communication Address:</label>
                                    <div class='col-md-8'>
                                        
                                            <div class='form-group internal'>
											<div class='col-md-4'>
												 <select name="myselect" id="comAdd_sel" class="form-control">
												  <option selected="selected" value="Primary">Primary Address</option>
												  <option value="Secondary">Secondary Address</option>
												</select>
											</div>
										</div>
									
								</div>
								</div>
						<div class='panel-heading'>
                            <h2>Contact Options</h2>
                        </div>
						<div class='form-group'>
						<div class='col-md-12'>
						<div class='col-md-2'>
						</div>
						
						<div class='col-md-12'>
						<p>We provide mail/email information to other affiliates, organizations and vendors on a limited basis. You may choose to not receive these mailings by selecting the appropriate options below:</p>
						</div>
						</div>
						</div>
						
						<div class='form-group'>
						<div class='col-md-12'>
						<div class='col-md-2'>
						</div>
						
						<div class='col-md-12'>
						 <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true"/>Do not release my email address for specific use.
						 </div>
					</div>
					</div>
						 <div class='form-group'>
						<div class='col-md-12'>
						<div class='col-md-2'>
						</div>
						
						<div class='col-md-12'>
						 <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true"/>
						 Do not release my mailing address for specific use.
						 </div>
					</div>
				</div>
				
				<div class='form-group'>
					 <div style="overflow:scroll; overflow-x:hidden; padding:15px; height:250px; border:1px solid #333;" onscroll="OnScrollDiv(this)"></br>
				<p class="para" align="center"> Terms and Conditions</p>

<p align="justify"><strong>1.	Terms</strong><br />

&emsp;By accessing this web site, you are agreeing to be bound by these web site Terms and Conditions of Use, all applicable laws and regulations, and agree that you are responsible for compliance with any applicable local laws. If you do not agree with any of these terms, you are prohibited from using or accessing this site. The materials contained in this web site are protected by applicable copyright and trade mark law.</p>

<p align="justify"><strong>2.	Use License</strong><br />

&emsp;a.	Permission is granted to temporarily download materials (information or software) on Business & digital Transformation Guild's web site for personal, non-commercial use only. This is the grant of a license, not a transfer of title, and under this license you may not:<br />
&emsp;&emsp;i.	modify or copy the materials;<br />
&emsp;&emsp;ii.	use the materials for any commercial purpose, or for any public display (commercial or non-commercial);<br />
&emsp;&emsp;iii.	attempt to decompile or reverse engineer any software contained on Business & digital Transformation Guild's web site;<br />
&emsp;&emsp;iv.	remove any copyright or other proprietary notations from the materials; or<br />
&emsp;&emsp;v.	transfer the materials to another person or "mirror" the materials on any other server.<br />
&emsp;b.	This license shall automatically terminate if you violate any of these restrictions and may be terminated by Business & digital Transformation Guild at any time. Upon terminating your viewing of these materials or upon the termination of this license, you must destroy any downloaded materials in your possession whether in electronic or printed format.</p>

<p align="justify"><strong>3.	Disclaimer</strong><br />

&emsp;a.	The materials on Business & digital Transformation Guild's web site are provided "as is". Business & digital Transformation Guild makes no warranties, expressed or implied, and hereby disclaims and negates all other warranties, including without limitation, implied warranties or conditions of merchantability, fitness for a particular purpose, or non-infringement of intellectual property or other violation of rights. Further, Business & digital Transformation Guild does not warrant or make any representations concerning the accuracy, likely results, or reliability of the use of the materials on its Internet web site or otherwise relating to such materials or on any sites linked to this site.</p>

<p align="justify"><strong>4.	Limitations</strong><br />

&emsp;In no event shall Business & digital Transformation Guild or its suppliers be liable for any damages (including, without limitation, damages for loss of data or profit, or due to business interruption,) arising out of the use or inability to use the materials on Business & digital Transformation Guild's Internet site, even if Business & digital Transformation Guild or a Business & digital Transformation Guild authorized.
 
representative has been notified orally or in writing of the possibility of such damage. Because some jurisdictions do not allow limitations on implied warranties, or limitations of liability for consequential or incidental damages, these limitations may not apply to you.</p>

<p align="justify"><strong>5.	Revisions and Errata</strong><br />

&emsp;The materials appearing on Business & digital Transformation Guild's web site could include technical, typographical, or photographic errors. Business & digital Transformation Guild does not warrant that any of the materials on its web site are accurate, complete, or current. Business & digital Transformation Guild may make changes to the materials contained on its web site at any time without notice. Business & digital Transformation Guild does not, however, make any commitment to update the materials.</p>

<p align="justify"><strong>6.	Links</strong><br />

&emsp;Business & digital Transformation Guild has not reviewed all of the sites linked to its Internet web site and is not responsible for the contents of any such linked site. The inclusion of any link does not imply endorsement by Business & digital Transformation Guild of the site. Use of any such linked web site is at the user's own risk.</p>

<p align="justify"><strong>7.	Site Terms of Use Modifications</strong><br />

&emsp;Business & digital Transformation Guild may revise these terms of use for its web site at any time without notice. By using this web site you are agreeing to be bound by the then current version of these Terms and Conditions of Use.</p>

<p align="justify"><strong>8.	Governing Law</strong><br />

&emsp;Any claim relating to Business & digital Transformation Guild's web site shall be governed by the laws of the State of Virginia without regard to its conflict of law provisions.</p></div>
</div>
<div class='form-group'>
   				<div class='col-md-5' id="info">
				
					<input type="checkbox" name="checkbox"  disabled="disabled" id="check"/> I agree to the Terms and Condition.
					<input type="hidden" name="checkbox">
				
				</div>
			</div>
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'>Register</button>
										
                                    </div>
                                   
                                </div>
								
                            </form>
							
							<!--==============================Form Body=================================-->
							
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
	</div>


<!--========================================================
                          FOOTER
=========================================================-->

<script language="javascript">
	//FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, 'USA' );
	//FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, 'USA' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '');

</script>
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="grid_12">
                    <h1 class="text_4 color_1">
                        <a href="user.html?cmd=inithome"><img src="images/footer_logo.png" alt="footer_logo"></a>
                    </h1>
                    <p class="copyright color_9 text_2">
                        <span>&copy;
                            <span id="copyright-year"></span></span>
                        <a href="privacypolicy.jsp" target="_blank">Privacy policy</a>
						<a href="sitemap.jsp">Site Map</a>
                       
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>

<script src="js/script.js"></script>

</body>
</html>

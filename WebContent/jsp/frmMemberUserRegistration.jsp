<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!DOCTYPE html>
<%@page import="java.util.*" %>
<html lang="en" class="no-js">
  <head>
    <meta charset="utf-8"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>guildKraft / Home</title>
    <meta content="" name="description"/>
    <meta content="" name="keywords"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta content="" name=""/>
    <meta name="" content=""/>
    <link rel="stylesheet" href="css/master.css"/>
	<link rel="stylesheet" href="css/login.css"/>
	<link rel="stylesheet" href="css/color.css"/>
	<link rel="stylesheet" href="css/bootstrap.css"/>
	<link rel="stylesheet" href="fonts/font-awesome.css"/>
	<link rel="stylesheet" href="css/slider-pro.css"/>
	<link rel="stylesheet" href="css/theme.css"/>
	<link rel="stylesheet" href="css/animate.css"/>
	<link rel="stylesheet" href="css/responsive.css"/>
	<link rel="stylesheet" href="css/light.css"/>
	<link rel="stylesheet" href="css/owl.carousel.css"/>
	<link rel="stylesheet" href="css/owl.theme.css"/>
	<link rel="stylesheet" href="css/owl.transitions.css"/>
	<link rel="stylesheet" href="css/parallax.css"/>
	<link rel="stylesheet" href="fonts/elegant/style.css"/>
	<link rel="stylesheet" href="fonts/flaticon/flaticon.css"/>
	<link rel="stylesheet" href="fonts/pe/css/pe-icon-7-stroke.css"/>
    <!-- SWITCHER-->
    <link href="css/plugins/switcher.css" rel="stylesheet" id="switcher-css" media="all"/>
    <link href="css/plugins/color1.css" rel="alternate stylesheet" title="color1" media="all"/>
    <link href="css/plugins/color2.css" rel="alternate stylesheet" title="color2" media="all"/>
    <link href="css/plugins/color3.css" rel="alternate stylesheet" title="color3" media="all"/>
    <link href="css/plugins/color4.css" rel="alternate stylesheet" title="color4" media="all"/>
    <link rel="icon" type="image/x-icon" href="images/favicon.ico"/>
	
	<link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Archivo+Black' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/normalize.css" type="text/css">
<link rel="stylesheet" href="css/colorbox.css" type="text/css">
<link rel="stylesheet" href="css/animate.css" type="text/css">
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">

<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/colorbox.css" type="text/css">
<link rel="stylesheet" href="css/helpers.css" type="text/css">
<link rel="stylesheet" href="css/component.css" type="text/css">


<link rel="stylesheet" href="css/1.css" type="text/css" id="site-color">
<link rel="stylesheet" href="css/settings.css" type="text/css">


       
<link rel="stylesheet" href="css/hoe.css" type="text/css" />

<!-- JS includes //-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries //-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="js/twitterFetcher_min.js"></script>
<script src="js/memberUserRegistration.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script  src="js/ts_picker.js"></script>
<script src="js/datetimepicker_css.js"></script>
<script src="js/jquery-1.9.1.min.js"></script>

 <script src="js/hoe.js"></script>
<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/less-1.7.4.min.js"></script>
<script src="js/jquery.colorbox-min.js"></script>
<script src="js/jquery.rivathemes.js"></script>
<script src="js/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="js/jquery-transit-modified.js" type="text/javascript"></script>
<script src="js/layerslider.transitions.js" type="text/javascript"></script>
<script src="js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<script src="js/biss.js"></script>

<script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>

		
		<script src="js/jquery.js"></script>
	<script src="js/lib/jquery.mockjax.js"></script>
	<script src="js/dist/jquery.validate.js"></script>
	<script src="js/lib/jquery.maskedinput.js" type="text/javascript"></script> 
	
	


<script>

$(document).ready(function() {
    $(function() {
            $("#comp").autocomplete({     
            source : function(request, response) {
            $.ajax({
                    url : "MembershipReg.html?process=autosearch",
                    type : "GET",
                    data : {
                            term : request.term
                    },
                    dataType : "json",
                    success : function(data) {
                            response(data);
                    }
            });
    }
});
});
});

$(document).ready(function(c) {
	$('.sinup-close').on('click', function(c){
		$('.setting').fadeOut('slow', function(c){
	  		$('.setting').remove();
		});
	});	  
});
</script>
 	

		<!-- header js ends -->
	
	<script>
	$(document).ready(function() {
		
		
		
		$("#frmMembRegi_fname").blur(function(){  
			var a = $("#frmMembRegi_fname").val();
			var b = a.trim();
			$("#frmMembRegi_fname").val(b);
		});
		
		$("#frmMembRegi_lname").blur(function(){  
			var a = $("#frmMembRegi_lname").val();
			var b = a.trim();
			$("#frmMembRegi_lname").val(b);
		});
		
		$("#frmMembRegi_usrname").blur(function(){  
			var a = $("#frmMembRegi_usrname").val();
			var b = a.trim();
			$("#frmMembRegi_usrname").val(b);
		});
		
		$("#frmMembRegi_pwd").blur(function(){  
			var a = $("#frmMembRegi_pwd").val();
			var b = a.trim();
			$("#frmMembRegi_pwd").val(b);
		});
		
		$("#frmMembRegi_cpwd").blur(function(){  
			var a = $("#frmMembRegi_cpwd").val();
			var b = a.trim();
			$("#frmMembRegi_cpwd").val(b);
		});
		
		$("#frmMembRegi_ans").blur(function(){  
			var a = $("#frmMembRegi_ans").val();
			var b = a.trim();
			$("#frmMembRegi_ans").val(b);
		});
		
		$("#pcity_txt").blur(function(){  
			var a = $("#pcity_txt").val();
			var b = a.trim();
			$("#pcity_txt").val(b);
		});
		
		$("#frmMembRegi_pzip_txt").blur(function(){  
			var a = $("#frmMembRegi_pzip_txt").val();
			var b = a.trim();
			$("#frmMembRegi_pzip_txt").val(b);
		});
		
		$("#frmMembRegi_smob_txt1").blur(function(){  
			var a = $("#frmMembRegi_smob_txt1").val();
			var b = a.trim();
			$("#frmMembRegi_smob_txt1").val(b);
		});
		
		$("#szip_txt").blur(function(){  
			var a = $("#szip_txt").val();
			var b = a.trim();
			$("#szip_txt").val(b);
		});
		
		$("#frmMembRegi_pmob_txt1").blur(function(){  
			var a = $("#frmMembRegi_pmob_txt1").val();
			var b = a.trim();
			$("#frmMembRegi_pmob_txt1").val(b);
		});
		
		jQuery.validator.addMethod(
        'ContainsAtLeastOneSpecialCharacter',
        function (value) { 
            return /[!,%,&,@,#,$,^,*,?,_,~]/.test(value); 
        },  
        'Your password must contain at least one Special Character.'
    );
	 
	 $("#flip1").click(function(){  
			$("#panel").show();   
		});    
		$("#flip2").click(function(){ 
			$("#panel").hide();  
		});
		
		$("#frmMembRegi_pmob_txt1").mask("+9?99");		
		$("#frmMembRegi_pmob_txt1").mask("999-999-9999");
		
		
		$("#frmMembRegi_simob").mask("+9999");		
		$("#frmMembRegi_smob_txt1").mask("999-999-9999");
		// validate signup form on keyup and submit
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
					ContainsAtLeastOneSpecialCharacter:true
				},
				cpwd: {
					required: true,
					equalTo: "#frmMembRegi_pwd"
				},
				companyname:{
					required:true
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
				smob_txt1:"Please enter Mobile No",
				scountry_txt:"Please select your country",
				sstate_txt:"Please select state",
				scity_txt: "Please enter city",
				szip_txt:"Please enter zipcode",			
				companyname:"Please select company",
			},
			// the errorPlacement has to take the table layout into account
			errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());
				else
					error.appendTo(element.parent());
			}
			
			
		});
	});
	</script>
   
   
   
		<script>
(function($) {
	"use strict";

	//
	// Preload images
	//

	$('document').ready(function() {

		var $container = $('body'),
			tweetsTimer;

		$container.imagesLoaded( function() {

			$('#layerslider').layerSlider({
				skinsPath               : 'css/layerslider/skins/',
				skin : 'fullwidth',
				firstLayer: 4,
				thumbnailNavigation : 'hover',
				hoverPrevNext : true,
				responsive : true,
				responsiveUnder : 1170,
				sublayerContainer : 1170
			});

			$('#logo-group').rivaLogoGroup({
				selector:'logo-group-item',
				padding:40,
				row:3
			});

			$('#testimonials').rivaCarousel({
				style:'horizontal',
				navigation:'buttons',
				navigation_class:'width-auto float-left nav-st-3',
				button_left_text:'<i class="fa fa-chevron-left"></i>',
				button_right_text:'<i class="fa fa-chevron-right"></i>',
				visible:2,
				selector:'testimonials-1-item',
				gutter:20,
				infinite:0,
				interval:2000,
				autostart:0,
				speed:600,
				ease: 'jswing'
			});

			$('#company-events').rivaCarousel({
				style:'horizontal',
				navigation:'buttons',
				navigation_class:'width-auto float-left nav-st-2',
				button_left_text:'<i class="fa fa-chevron-left"></i>',
				button_right_text:'<i class="fa fa-chevron-right"></i>',
				visible:1,
				selector:'item',
				gutter:20,
				infinite:0,
				interval:2000,
				autostart:0,
				speed:600,
				ease: 'easeInQuad'
			});

			$('#project-sorting').rivaSorting({
				selector	: 'project-item',
				gutter		: 0,
				inRow		: 3
			});

			$('#spinner-wrapper').hide();

		});

		clearTimeout(tweetsTimer);

	});

})(jQuery);
</script>
		
	
	<style>
	i.fa.fa-chevron-right {
    border-radius: 25%;
    background: #cc0001;
    color: #fff;
    font-size: 14px;
    margin-right: 10px;
    line-height: 12px;
    padding: 5px;
}

#frmMembRegi label.error{
	color:red;
}

</style>
    
	<script>
	function loginValid(){
	if(document.loginform.textfield.value=="" && document.loginform.textfield2.value==""){
	//alert("Please Enter Username and Password");
	document.loginform.textfield.focus();
    document.loginform.textfield2.focus();
	document.getElementById("userpass").innerHTML = "User Name and Password can't be empty";
	
 return false;
	}
	else
	{
	document.loginform.textfield.focus();
    document.loginform.textfield2.focus();
	document.getElementById("userpass").innerHTML = "";
	}
	if(document.loginform.textfield.value=="")
{//alert("User Name can't be empty");
 document.loginform.textfield.focus();
 document.getElementById("username").innerHTML = "User Name can't be empty";
 return false;}
 else 
{//alert("User Name can't be empty");
 document.loginform.textfield.focus();
 document.getElementById("username").innerHTML = "";
}
 
if(document.loginform.textfield2.value=="")
{//alert("Password can't be empty");
 document.loginform.textfield2.focus();
 document.getElementById("password").innerHTML = "Password can't be empty";
 return false;}
  else 
{//alert("User Name can't be empty");
 document.loginform.textfield2.focus();
 document.getElementById("password").innerHTML = "";
 
}
	return true;}
		</script>
		
 <%
	   
  String sessLogId = (String) session.getAttribute("sessionId");
  String chkLogout = (String) request.getAttribute("logout");
    

 

  
  System.out.println("chkLogout==="+chkLogout);
  
  if(sessLogId!=null){
   session.removeAttribute("sessionId");
            session.removeAttribute("userId");
            session.removeAttribute("userCode");
            session.removeAttribute("firstName");
            session.removeAttribute("userTypeName");
            session.removeAttribute("emailId");
            session.removeAttribute("memberId");
   response.setHeader("Cache-Control", "no-cache");
  response.sendRedirect("login.jsp"); 
  }
  
  
  %>
      
    <script src="js/custom.js"></script>
    <script src="js/bootstrap-select.js"></script>
    <script src="js/jquery.sliderPro.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/bootstrap-select.min.js"></script>
    <script src="js/doubletaptogo.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/flowplayer.min.js"></script>
    <script src="js/classie.js"></script>
    <script src="js/scrollreveal.min.js"></script>
    <script src="js/dmss.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jquery.easypiechart.min.js"></script>
</head>
<body>
 <div data-header="sticky" data-header-top="200" class="l-theme animated-css">
      <!-- Start Switcher-->
      <div class="switcher-wrapper">
        <div class="demo_changer">
          <div class="demo-icon color-primary"><i class="fa fa-cog fa-spin fa-2x"></i></div>
          <div class="form_holder">
            <div class="predefined_styles">
              <div class="skin-theme-switcher">
                <h4>Color</h4><a href="javascript:void(0);" data-switchcolor="color1" style="background-color:#5aaff7;" class="styleswitch"></a><a href="javascript:void(0);" data-switchcolor="color2" style="background-color:#FFAC3A;" class="styleswitch"></a><a href="javascript:void(0);" data-switchcolor="color3" style="background-color:#28af0f;" class="styleswitch"></a><a href="javascript:void(0);" data-switchcolor="color4" style="background-color:#e425e9;" class="styleswitch"></a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- end switcher-->
      
      <header><div>

<div><%@ include file = "../../include/headerOut1.jsp" %></div>

</div></header>

<div id="wrap-all">
 <div class="section-title-page parallax-bg parallax-light">
        <ul class="bg-slideshow">
          <li>
            <div style="background-image:url(images/1.jpg)" class="bg-slide"></div>
          </li>
        </ul>
        <div class="parallax__inner">
          <div class="container">
            <div class="row">
              <div class="col-sm-7">
                <h1 class="b-title-page">User Registration</h1>
                
                <!-- end b-title-page-->
              </div>
              <div class="col-sm-5">
                <ol class="breadcrumb">
                  <li><a href="login.html?cmd=initLogin">Home</a></li>
                  <li class="active">User Registration</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>

	
        <!--==============================include header Here=================================-->
		
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			

            <div class="col-md-12">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>User, please take your time and register to avail the privileges that accompanies with it.</p>
							<p><font color="#FF0000">All * Fields are Mandatory.</font></p>
							
						<!--==============================Form Description=================================-->
							
                            
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role="form"  name="frmMembRegi" id="frmMembRegi" method="post" action="user.html?cmd=usrReg"   ENCTYPE="multipart/form-data">
							  <font color="#FF0000"><span id="errorBox"></span></font>
                             
							   <div class='panel-heading'>
									<h4>Basic Information</h4>
								</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="fname" id="frmMembRegi_fname" class="form-control"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="mname" id="frmMembRegi_mnam" class="form-control" />
												
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="lname" id="frmMembRegi_lname" class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suffix:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												  <input type="text" name="sname" id="frmMembRegi_sname" class="form-control" />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Birth:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
										
										
										
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
													<input type="radio" name="gender"  value="male"/>Male
													<input type="radio" name="gender" value="female"/>Female
													<input type="radio" name="gender" value="others"/>Others
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name (Login ID):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="usrname" id="frmMembRegi_usrname" class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												   <input type="text" name="email" id="frmMembRegi_email" class="form-control"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Company Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												    <select name="companyname" id="companyname" class="form-control">
				  
											                    <option selected="selected" value="">Select One</option>
											                     <%ArrayList companyname = (ArrayList)request.getAttribute("company_name");
																 System.out.println("company----------->");
																 if(companyname != null && companyname.size()!=0){
																		Iterator itr = companyname.iterator();
														 				while(itr.hasNext()){							
																		String company = (String)itr.next();
																		
																
																%> 
											                    <option value="<%=company %>"><%=company %></option>
																
																 <% } }%> 
													</select>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose Your Password:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												  <input type="password" name="pwd"  id="frmMembRegi_pwd" placeholder='(Minimum 8 Characters)' class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Re-Type Password:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												 <input type="password" name="cpwd" id="frmMembRegi_cpwd" class="form-control" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose A Secret Question:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" name="ans" id="frmMembRegi_ans" class="form-control"/>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
								
								
								<div class='panel-heading'>
									<h4>Primary Address</h4>
								</div>
									<div class='form-group'>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="lane" id="frmMembRegi_slane" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="area" id="frmMembRegi_sarea" class="form-control" />
											</div>
										</div>
									</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												  <select name="pcountry_sel" id="pCountry_sel" class="form-control" onchange="FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '');" style="width:277px;">
                    <option selected="selected">Select One</option>
                    <option value="United States of America">United States of America</option>
                  </select>
												  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												   <select name="pstate_sel" id="pState_sel" class="form-control">
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
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												    <input type="text" name="pcity_txt" value="" id="pcity_txt" style="width:240px;">				 									 
													   <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												<input type="radio" value="Primary" name="addr" size="10" checked="checked" onclick="showHideRadio('addr','sAdd','Primary');" style="margin-top:17px"/>
                    Yes
					
                    <input type="radio" value="Secondary" name="addr" size="10"  onclick="showHideRadio('addr','sAdd','Primary');" id="addr_sec" style="margin-top:17px"/>
                    No 
											</div>
										</div>
									</div>
								</div>
									
									<div class="form-group">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload Pic:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
											<input type="file" name="uploadpic" /><span>File size should be 10kb to 40kb</span>
											
											</div>
										</div>
									</div>
								</div>	
									
                                
								
						
						
						
							<div class='form-group' id="sAdd">
							<div class='panel-heading'>
                            <h4>Secondary Address</h4>
                        </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="slane" id="frmMembRegi_slane" class="form-control"/>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												<input type="text" value="" name="sarea" id="frmMembRegi_sarea" class="form-control" />
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
                                            <div class='form-group internal'>
												    <input type="text"  name="scity_txt" value="" style="width:240px;">
				 									 
													   <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-4 indent-small'>
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
                                        <div class='col-md-4 indent-small'>
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
                            <h4>Contact Options</h4>
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
	          <!--==============================footer=================================-->
  <footer>   
    <div>
     <br>
       <%@ include file = "../../include/footerOut1.jsp" %>
      </div>
    
  </footer>
    </div>
    <!-- end layout-theme-->
    
    

	
</body>


<script language="javascript" >
	FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, 'USA' );
	FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, 'USA' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '');

</script>


</html>

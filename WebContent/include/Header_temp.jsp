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
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
	<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="images/favicon.ico">

<!-- CSS includes //-->
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
<link rel="stylesheet" href="css/layerslider/skins/skin.css" type="text/css">
<!-- LayerSlider styles -->
<link rel="stylesheet" href="css/layerslider/css/layerslider.css" type="text/css">

<link rel="stylesheet" href="css/1.css" type="text/css" id="site-color">
<link rel="stylesheet" href="css/settings.css" type="text/css">

<link rel="stylesheet" href="css/form-elements.css">
        <link rel="stylesheet" href="css/style.css">

<!-- JS includes //-->
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries //-->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="js/twitterFetcher_min.js"></script>
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
</head>

<body>

<!--========================================================
                          HEADER
=========================================================-->


<header class="site-header" id="site-header">

			<div class="container">

				<div class="row">

					<div class="col-lg-12">

						<div class="width-100 float-left relative">

							<!-- Site logo start //-->

							<div class="site-logo scroll-hide">

								<a href="login.html?cmd=initLogin">

									<img src="images/logo.png" alt="guild Logo">								</a>							</div>

							<!-- Site logo end //-->

							<!-- Contacts start //-->

							<div class="header-contacts scroll-hide hidden-xs">

								
								<p><i class="fa fa-envelope"></i> Reach Us at: <a href="mailto:info@guildkraft.com" target="_blank">info@guildkraft.com</a></p>
								
								<div class="cl"></div><div class="cl"></div>
								<p>
								<a id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=ebd893c1-5f13-4555-a486-6036b751462f','','width=570,height=280, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none'><img  src='https://acctmgr.evoice.com/AcctMgr/Brands/eVoice/Images/ClickToCall/SystemImages3_h.jpg' alt='Click to open call me page' id='__imgClickToCall' style='border:0px;' /></a></p>
							</div>

							<!-- Contacts end //-->

							<div class="width-auto float-right scroll-hide">

								<!-- Sub menu start //-->

								<p class="sub-menu hidden-xs">

									<a href="login.html?cmd=initLogin">home</a>

									<a href="frmContacts.jsp">contacts</a>								</p>
								
								

								<!-- Sub menu end //-->

								<div class="cl"></div>

								<!-- Social icons start //-->

								<div class="sm-profiles">

									<a href="https://www.facebook.com/digiblitz" target="_blank"><i class="fa fa-facebook"></i></a>

									<a href="https://twitter.com/digiBlitz" target="_blank"><i class="fa fa-twitter"></i></a>

									<a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank"><i class="fa fa-linkedin"></i></a>
									
							
							
                            	<a class="btn btn-danger btn-link-1 launch-modal" href="#" data-modal-id="modal-login">Sign in<span class="caret"></span></a>							</div>
								
								

								<!-- Social icons end //-->

								<div class="cl hidden-md hidden-lg hidden-sm"></div>

								<!-- Search form start //-->

								 
        <!-- MODAL -->
        <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modal-login-label" aria-hidden="true">
        	<div class="modal-dialog">
        		<div class="modal-content">
        			
        			<div class="modal-header">
        				<button type="button" class="close" data-dismiss="modal">
        					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>        				</button>
        				<h3 class="modal-title" id="modal-login-label">User Login</h3>
        				<p>Enter your username and password to log on:</p>
        			</div>
        			
        			<div class="modal-body">
        				
	                    <form role="form" action="login.html?cmd=initDash" method="post" class="login-form">
	                    	<div class="form-group">
								
	                    		<label class="sr-only" for="form-username">Username</label>
	                        	<input type="text" name="textfield" placeholder="Username..." class="form-username form-control" id="form-username">
	                        </div>
	                        <div class="form-group">
	                        	<label class="sr-only" for="form-password">Password</label>
	                        	<input type="password" name="textfield2" placeholder="Password..." class="form-password form-control" id="form-password">
	                        </div>
							
	                        <button type="submit" class="btn">Sign in!</button>
							
							<a class="alignn" href="user.html?cmd=view">forgot password?</a>
							<a class="alignn" href="user.html?cmd=initUsrReg">New User Signup</a>
	                    </form>
        			</div>
        		</div>
        	</div>
        </div>


								<!-- Search form end //-->
							</div>
							
							

							<div class="cl"></div>

							<nav class="blocked">

								<!-- Mobile nav start //-->

								<div class="mobile-nav-wrapper hidden-lg hidden-md" id="mobile-menu-wrapper">

									<i class="fa fa-bars mobile-nav-icon" id="mobile-nav-icon"></i>								</div>

								<!-- Mobile nav end //-->

								<!-- Desktop nav start //-->

							<ul class="desktop-nav hidden-sm hidden-xs hide-on-tablet">

								<li>

									<a href="frmHome.jsp"><i class="fa fa-home"></i> home <small>guildKraft home page</small></a>								</li>

								<li id="mega-menu-1-hover"><a href="whyGuildKraft.jsp"><i class="fa fa-globe"></i> Why guildKraft? <small>our association</small></a></li>

								<li>

									<a href="pricing.jsp"><i class="fa fa-money"></i> Product Pricing <small>our features</small></a>								</li>

								

								<li>

									<a href="https://www.digiblitz.com/support/?cat=6" target="_blank"><i class="fa fa-support"></i> Help <small>our support</small></a>								</li>
								
								<li>

									<a href="https://www.digiblitz.com/community" target="_blank"><i class="fa fa-group"></i> Community <small>our community</small></a>								</li>

								<li><a href="frmContacts.jsp"><i class="fa fa-envelope"></i> contacts <small>stay in touch</small></a></li>
							</ul>

								<!-- Desktop nav end //-->
							</nav>

							<img src="images/shadow.png" alt="" class="header-shadow">						</div>
					</div>

				</div>

			</div>

		</header>
		
		
		
		<!-- JS includes //-->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/modernizr-2.6.2-respond-1.1.0.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/imagesloaded.pkgd.min.js"></script>
<script src="js/masonry.pkgd.min.js"></script>
<script src="js/less-1.7.4.min.js"></script>
<script src="js/jquery.colorbox-min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.rivathemes.js"></script>
<script src="js/jquery-easing-1.3.js" type="text/javascript"></script>
<script src="js/jquery-transit-modified.js" type="text/javascript"></script>
<script src="js/layerslider.transitions.js" type="text/javascript"></script>
<script src="js/layerslider.kreaturamedia.jquery.js" type="text/javascript"></script>
<script src="js/biss.js"></script>

<script src="js/jquery.backstretch.min.js"></script>
        <script src="js/scripts.js"></script>

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

  </body>
  </html>

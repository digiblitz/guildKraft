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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>guildKraft</title>
<!-- script type="text/javascript">
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
};</script> -->
</head>

<%String loginName=(String)request.getAttribute("loginName"); %>
<%String pwd=(String)request.getAttribute("pwd"); %>
<%String email1=(String)request.getAttribute("emailid"); %>


<!-- <form accept-charset="UTF-8" id="userregi" style="display:none;" action="https://ho192.infusionsoft.com/app/form/process/3fbd741d1cf7efbf1d0f1f76e579b3ed" class="infusion-form" method="POST" name="User registration
gk" onsubmit="var form = document.forms[0];
var resolution = document.createElement('input');
resolution.setAttribute('id', 'screenResolution');
resolution.setAttribute('type', 'hidden');
resolution.setAttribute('name', 'screenResolution');
var resolutionString = screen.width + 'x' + screen.height;
resolution.setAttribute('value', resolutionString);
form.appendChild(resolution);
var pluginString = '';
if (window.ActiveXObject) {
    var activeXNames = {'AcroPDF.PDF':'Adobe Reader',
        'ShockwaveFlash.ShockwaveFlash':'Flash',
        'QuickTime.QuickTime':'Quick Time',
        'SWCtl':'Shockwave',
        'WMPLayer.OCX':'Windows Media Player',
        'AgControl.AgControl':'Silverlight'};
    var plugin = null;
    for (var activeKey in activeXNames) {
        try {
            plugin = null;
            plugin = new ActiveXObject(activeKey);
        } catch (e) {
            // do nothing, the plugin is not installed
        }
        pluginString += activeXNames[activeKey] + ',';
    }
    var realPlayerNames = ['rmockx.RealPlayer G2 Control',
        'rmocx.RealPlayer G2 Control.1',
        'RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)',
        'RealVideo.RealVideo(tm) ActiveX Control (32-bit)',
        'RealPlayer'];
    for (var index = 0; index &lt; realPlayerNames.length; index++) {
        try {
            plugin = new ActiveXObject(realPlayerNames[index]);
        } catch (e) {
            continue;
        }
        if (plugin) {
            break;
        }
    }
    if (plugin) {
        pluginString += 'RealPlayer,';
    }
} else {
    for (var i = 0; i &lt; navigator.plugins.length; i++) {
        pluginString += navigator.plugins[i].name + ',';
    }
}
pluginString = pluginString.substring(0, pluginString.lastIndexOf(','));
var plugins = document.createElement('input');
plugins.setAttribute('id', 'pluginList');
plugins.setAttribute('type', 'hidden');
plugins.setAttribute('name', 'pluginList');
plugins.setAttribute('value', pluginString);
form.appendChild(plugins);
var java = navigator.javaEnabled();
var javaEnabled = document.createElement('input');
javaEnabled.setAttribute('id', 'javaEnabled');
javaEnabled.setAttribute('type', 'hidden');
javaEnabled.setAttribute('name', 'javaEnabled');
javaEnabled.setAttribute('value', java);
form.appendChild(javaEnabled);">
<input name="inf_form_xid" type="hidden" value="3fbd741d1cf7efbf1d0f1f76e579b3ed" /><input name="inf_form_name" type="hidden" value="User registration
gk" /><input name="infusionsoft_version" type="hidden" value="1.49.0.36" />
<div class="default beta-base beta-font-b" id="mainContent" style="height:100%">
<table cellpadding="10" cellspacing="0" class="background" style="width: 100%; height: 100%">
<tbody>
<tr>
<td align="center" valign="top">
<table bgcolor="#FFFFFF" cellpadding="20" cellspacing="0" class="bodyContainer webFormBodyContainer" width="100%">
<tbody>
<tr>
<td bgcolor="#FFFFFF" class="body" sectionid="body" valign="top">
<div class="text" id="webformErrors" name="errorContent">
</div>
<div>
<div class="text">
<div class="text" contentid="paragraph">
<div>
<div style="text-align: center;">
<span data-mce-mark="1" style="color: #0000ff; font-size: 14pt;"><span data-mce-mark="1" style="color: #0000ff; font-size: 14pt;">Welcome to guildKraft</span></span><span data-mce-mark="1" style="color: #0000ff; font-size: 14pt;">.</span>
</div>
<div style="text-align: center;">
<span data-mce-mark="1" style="color: #000000;">we wish you happy days ahead with our product.</span>
</div>
</div>
</div>
</div>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_FirstName">UserName *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_FirstName" name="inf_field_FirstName" type="text" value="<%=loginName%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_custom_Password0">Password *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_custom_Password0" name="inf_custom_Password0" type="text" value="<%=pwd%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<table class="infusion-field-container" style="width:100%;">
<tbody>
<tr>
<td class="infusion-field-label-container">
<label for="inf_field_Email">Email *</label>
</td>
<td class="infusion-field-input-container" style="width:200px;">
<input class="infusion-field-input-container" id="inf_field_Email" name="inf_field_Email" type="text" value="<%=email1%>"/>
</td>
</tr>
</tbody>
</table>
</div>
<div>
<div style="height:15px; line-height:15px;">
&nbsp;
</div>
</div>
<div>
<div class="infusion-submit" style="text-align:center;">
<button style="width:50px; height:10px; background-color:#F5F5F5; color:#FFFFFF; font-size:15px; font-family:Helvetica; border-color:#FFFFFF; border-style:Solid; border-width:1px; -moz-border-radius:3px;border-radius:3px;" type="submit" value="Ok. Proceed">Ok. Proceed</button>
</div>
</div>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
</tbody>
</table>
</div>
</form>-->
  
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
<link rel="stylesheet" href="css/helpers.css" type="text/css">
<link rel="stylesheet" href="css/component.css" type="text/css">
<link rel="stylesheet" href="css/settings.css" type="text/css">
<link rel="stylesheet" href="css/hoe.css" type="text/css" />

<!--link rel="stylesheet" href="css/1.css" type="text/css" id="site-color">-->

<link rel="stylesheet" href="css/style.css">


<script src="js/twitterFetcher_min.js"></script>

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

        <script src="js/scripts.js"></script>

		
	


    
		
		

<style>
.para {
    font-size: 20px;
    color: #000;
    font-weight: bold;
    text-transform: capitalize;
	padding-bottom:20px;
}
#p_error{
	color:#d9534f;
}
</style>

<!-- LayerSlider styles -->


<script>

$(document).ready(function(c) {
	$('.sinup-close').on('click', function(c){
		$('.setting').fadeOut('slow', function(c){
	  		$('.setting').remove();
		});
	});	  
});
</script>
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
      
      <header class="header">
        <div class="header-top clearfix">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">
                <ul class="social-net list-inline">
                  <li class="social-net__item"><a href="https://twitter.com/digiBlitz" target="_blank" class="social-net__link"><i class="icon fa fa-twitter"></i></a></li>
                  <li class="social-net__item"><a href="https://www.facebook.com/digiblitz" target="_blank" class="social-net__link"><i class="icon fa fa-facebook"></i></a></li>
                  <li class="social-net__item"><a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" class="social-net__link"><i class="icon fa fa-linkedin"></i></a></li>
                  
                </ul>
                <!-- end social-list-->
                <div class="header-contact">
                  <div class="header-contact__item">Call  :<span class="header-contact__info"> <a class="hoee" id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=ebd893c1-5f13-4555-a486-6036b751462f','','width=570,height=280, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none'>+1-703-956-2520</a> </span></div>
                  <div class="header-contact__item">Email  :<a href="mailto:info@guildkraft.com" class="header-contact__info"> info@guildkraft.com</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="header-main">
          <div class="container">
            <div class="row">
              <div class="col-xs-12"><a href="login.html?cmd=initLogin" class="logo"><img src="images/logo.png" alt="Logo" class="logo__img img-responsive"/></a>
                <div class="header-nav">
                  <div class="navbar-trigger visible-xs">
                    <button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                  </div>
                    <div class="search-trigger">
				  <button class="btn btn2 btn-primary" href="#signup" data-toggle="modal" data-target=".bs-modal-sm">Signin</button>
				  </div>
                  <nav class="navbar yamm">
                    <div id="navbar-collapse-1" class="navbar-collapse collapse">
                      <ul class="nav navbar-nav">
                        <li><a href="login.html?cmd=initLogin">Home</a>
                        </li>
                        <li><a href="whyGuildKraft.jsp">Why guildKraft?</a>
                        </li>
                        <li><a href="pricing.jsp">Product Pricing</a></li>
                        <li><a href="frmContacts.jsp">Contact Us</a></li>
						<li><a href="https://www.digiblitz.com/support/category/guildkraft/" target="_blank">Help</a></li>
						<li><a href="https://digiblitz.com/community/" target="_blank">Community</a></li>
                      </ul>
                    </div>
                   <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        
        <div class="bs-example bs-example-tabs">
            <h2>Signin</h2>
        </div>
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
       
        <div class="tab-pane fade active in" id="signin">
            
            <form class="form-horizontal" action="login.html?cmd=initDash" method="post">
            <fieldset>
            <!-- Sign In Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="useremail"><strong>User Name</strong></label>
              <div class="controls">
			  
			    <input type="text" class="form-control" name="textfield" onfocus="this.value = '';" class="input-medium" placeholder="Username" required/>
               
              </div><!--end controls-->
            </div><!--end control-group-->

            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="passwordinput"><strong>Password:</strong></label>
              <div class="controls">
			  
				<input type="password"  name="textfield2" class="form-control" onfocus="this.value = '';" class="input-medium"  placeholder="Password" required/>
               
              </div><!--end controls-->
            </div><!--end control-group-->

            <!-- Multiple Checkboxes (inline) -->
            <!--<div class="control-group">
              <label class="control-label" for="rememberme"></label>
              <div class="controls">
                <label class="checkbox inline" for="rememberme-0">
                  <input type="checkbox" name="rememberme" id="rememberme-0" value="Remember me">
                  Remember me
                </label>
              </div>
            </div>-->
            
            <br>
            

            <!-- Button -->
            <!--<div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="signin" name="signin" class="btn btn-success">Sign In</button>
              </div>
            </div>-->
            
            <div class="form-group last">
                <div class="col-sm-12" align="center">
                    <button type="submit" class="btn btn-success">
                      Signin
                    </button>
                   
                </div>
            </div>
            
            
            <div class="panel-footer">
			
			 <a href="user.html?cmd=initUsrReg">New User Signup?</a>
              <a href="user.html?cmd=view" style="float:right;">Forgot Password?</a>
             
            </div>
            
            
            </fieldset>
            </form>
        </div>
		
		<!--end sign-in-->
       
    </div><!--End Modal-Conent-->
</div><!--End Modal-Dialogue-->
      <div class="modal-footer">
        <center>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </center>
      </div>
                  </nav>
                  <!-- end nav-->
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- end header-->
		
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
                <h1 class="b-title-page">Sign-Up Success</h1>
                
                <!-- end b-title-page-->
              </div>
              <div class="col-sm-5">
                <ol class="breadcrumb">
                  <li><a href="login.html?cmd=initLogin">Home</a></li>
                  <li class="active">Sign-Up Success</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>
		<!-- Layerslider start //-->
						
							<!--==============================Form Body=================================-->
							
							<div class="col-md-12">
			
                <div class='container padd'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        
					
					<div class='panel-body'> 
					<div class="col-md-12">
  
                          <div class='form-group'>
							  
							            <p class="para">Sign-up Success.</p>
										<p>You have Successfully Registered with us. On approval, an email along with the login details will be sent to the respective mail-id.</p>
										</div>
											
              
            <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type="button" value="continue" onclick="document.location.href='login.html?cmd=initLogin'">Continue</button>
										
                                    </div>
				</div>				
		
		
                     	
                        </div>
						
                    </div>
					
                </div>
				
            </div>
			
			

   
    </div>
		  <footer class="footer wow footer_mod-a">
        <div class="footer__main footer__main_mod-a parallax-bg parallax-dark">
          <ul class="bg-slideshow">
            <li>
              <div style="background-image:url(images/bg.jpg)" class="bg-slide"></div>
            </li>
          </ul>
          <div class="parallax__inner">
            <div class="container">
              
              <div class="row">
                <div class="col-md-4"><a href="login.html?cmd=initLogin" class="footer__logo"><img src="images/logo_footer.png" alt="Logo" class="img-responsive"/></a>
                  <div class="footer-form__info">
                    <p>guildKraft is a simple but Best in Breed system which helps associations' executive and management teams effectively process and monitor day-day activities from one simple console "Enterprise Integration Dashboard".</p>
                  </div>
                  <div class="footer__contact footer__contact_lg"><a id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=ebd893c1-5f13-4555-a486-6036b751462f','','width=570,height=280, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none'>P: +1-703-956-2520</a> </div>
                  
                  <!-- end social-list-->
                </div>
                <div class="col-md-2">
				
                  <section class="footer-section">
                    <h3 class="footer-section__title">Useful Links</h3>
                    <ul class="footer-section__list list list-mark-4">
                      <li><a href="login.html?cmd=initLogin"><i class="fa fa-arrow-right"></i>Home</a></li>
                      <li><a href="whyGuildKraft.jsp"><i class="fa fa-arrow-right"></i>Why guildKraft?</a></li>
                      <li><a href="pricing.jsp"><i class="fa fa-arrow-right"></i>Product Pricing</a></li>
                      <li><a href="frmContacts.jsp"><i class="fa fa-arrow-right"></i>Contacts</a></li>
                      
                    </ul>
                  </section>
                </div>
                <div class="col-md-2">
                  <section class="footer-section">
                   <h3 class="footer-section__title"></h3>
                    <ul class="footer-section__list list list-mark-4" style="margin-top:51px;">
                      <li><a href="#"><i class="fa fa-arrow-right"></i>Sitemap</a></li>
                      <li><a href="faq.jsp"><i class="fa fa-arrow-right"></i>FAQ</a></li>
                      <li><a href="privacypolicy.jsp"><i class="fa fa-arrow-right"></i>Privacy Policy</a></li>
                      <li><a href="#"><i class="fa fa-arrow-right"></i>Testimonials</a></li>
                     
                    </ul>
                  </section>
                </div>
                <div class="col-sm-4">
                  <section class="footer-section">
                    <h3 class="footer-section__title">Contact Information</h3>
                     <div class="footer__contact"><a href="mailto:info@guildkraft.com" target="_blank">E: info@guildkraft.com</a></div>
                  <div class="footer__contact">HeadOffice: 13241 Woodland Park Road, Suite 110,</div>
				   <div class="footer__contact">Herndon, Virginia 20171,USA </div>
                  <ul class="social-net list-inline">
                    <li class="social-net__item"><a href="https://twitter.com/digiBlitz" target="_blank" class="social-net__link"><i class="icon fa fa-twitter"></i></a></li>
                    <li class="social-net__item"><a href="https://www.facebook.com/digiblitz" target="_blank" class="social-net__link"><i class="icon fa fa-facebook"></i></a></li>
                    <li class="social-net__item"><a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" class="social-net__link"><i class="icon fa fa-linkedin"></i></a></li>
                   
                  </ul>
                  </section>
                 
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="copyright">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">Copyrights 2016<a href="https://digiblitz.com" target="_blank" class="copyright__link"> digiBlitz</a> All rights reserved.<a href="privacypolicy.jsp" class="copyright__link-2">Privacy Policy</a><a href="#" class="copyright__link-2">Terms & Conditions</a></div>
            </div>
          </div>
        </div>
      </footer>
	
</div>
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
 
    
   

</body>
</html>

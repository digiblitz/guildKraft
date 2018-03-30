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
    <title>New user Sign Up</title>

  


     <!--style>
	em{
		color: red;
	}
	
	form.form1 label.error, label.error {
		color: red;
		font-size:5px;
	}
	#form label{
		font-family: sans-serif;
		display: inline-block;
		font-size:15px;
		text-align: left;
	}
	
	


.button {
  font-size: 1em;
  padding: 10px;
  color: #fff;
  border: 2px solid #06D85F;
  border-radius: 20px/50px;
  text-decoration: none;
  cursor: pointer;
  transition: all 0.3s ease-out;
}
.button:hover {
  background: #06D85F;
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
  font-size: 15px;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 0.2s;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color:#cc0001;
   opacity: 1!important;
}
.popup .close:hover {
  color: #cc0001;
}
.close:hover, .close:focus {
    color: #000000;
    text-decoration: none;
    cursor: pointer;
    opacity: 1!important;
    filter: alpha(opacity=50);
}
.popup .contentss {
  max-height: 50%;
  
}

/*Let's make it appear when the page loads*/
.overlay:target:before {
    display: none;
}
.overlay:before {
  content:"";
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  display: block;
  background: rgba(0, 0, 0, 0.6);
  position: fixed;
  z-index: 9;
}
.overlay .popup {
  background: #fff;
  border-radius: 10px;
  width: 30%;
  height:100px;
  position: fixed;
  top:0;
  left: 35%;
  padding: 25px;
  margin: 250px auto;
  z-index: 50;
  -webkit-transition: all 0.6s ease-in-out;
  -moz-transition: all 0.6s ease-in-out;
  transition: all 0.6s ease-in-out;
}
.overlay:target .popup {
    top: -100%;
    left: -100%;
}

@media screen and (max-width: 768px){
  .box{
    width: 70%;
  }
  .overlay .popup{
    width: 70%;
    left: 15%;
  }
}
	
	</style>	-->

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
	<!--link rel="stylesheet" href="css/normalize.css" type="text/css">
	<link rel="stylesheet" href="css/component.css" type="text/css">-->
	<link rel="stylesheet" href="css/colorbox.css" type="text/css">
	<link rel="stylesheet" href="css/animate.css" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
	<link rel="stylesheet" href="css/helpers.css" type="text/css">

	<link rel="stylesheet" href="css/style.css" type="text/css">
	<link rel="stylesheet" href="css/settings.css" type="text/css">
	<link rel="stylesheet" href="css/hoe.css" type="text/css" />
	
	
<script src="js/jquery.js"></script>
<script src="js/jquery.validate.js"></script>
 <script src="js/hoe.js"></script>
<script src="js/bootstrap.min.js"></script>
 
   <!--script src="js/custom.js"></script>
	 <script src="js/bootstrap-select.js"></script>
	 <script src="js/jquery.sliderPro.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
	 <script src="js/bootstrap-select.min.js"></script>
    <script src="js/doubletaptogo.js"></script>
  <script src="js/waypoints.min.js"></script>
    <script src="js/flowplayer.min.js"></script>
  <script src="js/classie.js"></script>
    <script src="js/dmss.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jquery.easypiechart.min.js"></script>-->

        
			
<script>$(document).ready(function(c) {
	$('.sinup-close').on('click', function(c){
		$('.setting').fadeOut('slow', function(c){
	  		$('.setting').remove();
		});
	});	  
});
</script>



  </head>
  
  
  <body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" class="page1" id="top">
   
    <div data-header="sticky" data-header-top="200" class="l-theme animated-css">
      <!-- Start Switcher-->
      <!--div class="switcher-wrapper">
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
      </div>-->
      <!-- end switcher-->
      
      <header><div>

<div><%@ include file = "../../include/headerOut1.jsp" %></div>

</div></header>
      
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
                <h1 class="b-title-page">Coupon Code</h1>
                
                <!-- end b-title-page-->
              </div>
              <div class="col-sm-5">
                <ol class="breadcrumb">
                  <li><a href="login.html?cmd=initLogin">home</a></li>
                  <li class="active">Coupon code</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>	


	

     






             <div class="col-md-12">
			
                <div class='container padd1'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                       
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						<%String amount = (String)request.getAttribute("amount");
						String fromTryNowSignUp = (String)request.getAttribute("fromTryNowSignUp");%>
						<!--==============================Form Description=================================-->
                           <form name="frmcoupon" id="frmcoupon" action="coupondetails.html" method="post">
								
								<input type="hidden" name="cmd"  value="mapAll">
                           
                           
						   
						  <div class='form-group'>
									<label class='control-label col-md-3 col-md-offset-2' for='id_title'>Do you have coupon code ?</label>
                                    <div class='col-md-6'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  


                                
                                <input style="size:15px;" type="radio" name="con" value="yes" onclick="window.location.href='coupondetails.html?cmd=couponcodeapply&amount=<%=amount%>&fromTryNowSignUp=<%=fromTryNowSignUp%>';"><font size="3" >Yes</font></input>
                                <input class="text_11 color_3" type="radio" name="con" value="no" onclick="window.location.href='signUp.html?signUpProcess=pricingDetails&amount=<%=amount%>&fromTryNowSignUp=<%=fromTryNowSignUp%>';"><font size="3" >No</font></input>
                               
  
									</div>
								</div>
							</div>
						</div>
                             
                   </form>
                            
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
    
    


</html>

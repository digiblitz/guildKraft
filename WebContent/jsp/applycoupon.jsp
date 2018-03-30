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

	<link href="css/style.css" rel="stylesheet" type="text/css">
  
   <script src="js/cscombo_new.js" type="text/javascript" ></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> 

	<script src="js/jquery.js"></script>
	<script src="js/dist/jquery.validate.js"></script>
   
	
<script>
$(document).ready(function(){
	
	$("#frmcoupon").validate({
		
		rules:{
			coupon:{
				required:true
			}
		},
		messages:{
			coupon:"Enter the coupon code"
		},
		
		errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}	
		
	});
});
	

</script>

<style>
#frmcoupon label.error{
	color:red;
}
</style>
	
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
	    <!-- end header-->
      
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
						
						<!--==============================Form Description=================================-->

   <form name="frmcoupon" id="frmcoupon" action="coupondetails.html?cmd=applycode" method="post">

						<% String sta=(String)request.getAttribute("status");
						String amount=(String)request.getAttribute("amount");
						String fromTryNowSignUp=(String)request.getAttribute("fromTryNowSignUp");
                                   		System.out.println("status in applycoupon jsp------>"+ sta);
                                   if(sta !=null){
                                	  %>
                                	   
                                	   <p id="p_error">Sorry, your coupon code does not match!</p> 
                                  <%} %>
                                  
                                  <input type="hidden" name="fromTryNowSignUp" value="<%=fromTryNowSignUp%>"  >
								  <input type="hidden" name="amount" value="<%=amount%>"  >
                           
                          <div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Apply coupon code:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												   <input type="text" class="form-control" id="coupon" name="coupon" >
												   
											</div>
										</div>
									</div>
								</div>
                            
                            
                      <div class='form-group'>
						<div class="col-md-2 col-md-offset-3">     
                               
							  <button class='btn-lg btn-primary' type='submit'  value="Proceed">Proceed</button>
							  
						   
						 </div>
						 
						 <div class="col-md-3">
							<button class='btn-lg btn-danger' style="margin-left:20px" type='button' name="button"  onClick="javascript:history.back(-1);" value="Back">Back</button>
					</div>
				</div>
						   
	                       
                   </form>
                       
                 
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
    
    


</html>


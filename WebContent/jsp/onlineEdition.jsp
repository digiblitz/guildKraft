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
	

<script src="js/cscombo_new.js" type="text/javascript" ></script>

 <script src="js/jquery.js"></script>
	<script src="js/jquery.validate.js"></script>
        <script src="js/jquery.maskedinput.js"></script>
		
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
   
 <style>
 #form label.error{
	 color:red;
 }
 </style>
		
     
<script type="text/javascript">
   
    $(document).ready(function(){
		
		$("#firstname").blur(function(){        
		var a = $("#firstname").val();
		var b = a.trim();
		$("#firstname").val(b);
    });
	
	$("#lastname").blur(function(){        
		var a = $("#lastname").val();
		var b = a.trim();
		$("#lastname").val(b);
    });
	
	$("#institutionName").blur(function(){        
		var a = $("#institutionName").val();
		var b = a.trim();
		$("#institutionName").val(b);
    });
	
	$("#addrline1").blur(function(){        
		var a = $("#addrline1").val();
		var b = a.trim();
		$("#addrline1").val(b);
    });
	
	$("#city").blur(function(){        
		var a = $("#city").val();
		var b = a.trim();
		$("#city").val(b);
    });
	
	
	$("#name_on_card").blur(function(){        
		var a = $("#name_on_card").val();
		var b = a.trim();
		$("#name_on_card").val(b);
    });
	
	$("#mobileno").mask("999-999-9999");
		  // $("#cvv_no").mask("999");
		   
		 $("#form").validate({
			 
			 ignore: ":disabled",
			 
			rules: {
				firstname: "required",
				lastname: "required",
					
				email: {
					required: true,
					email:true					
				},					
				mobileno:{
					required:true,
					},
				institutionName:{
						required:true
						},
				addrline1:{
					required:true,
					},
				city:{
					required:true
				},
				country:{
					required:true
					},
				state:{
					required:true
					},
					zip:{
						required:true
					},
				credit_card_type:{
					required:true
				},
				credit_card_no:{
					required:true,
					number:true
				},
				
				expiry_month:{
					required: true
				},
				expiry_year:{
						required: true				
				},
				cvv_no: {
					required: true,
				},
				name_on_card :{
					required: true
				},
				agree: {
					required: true
				},
				checkbox:{
					required:true
					}
			},
			messages: {
				firstname: "Enter your First Name",
				lastname: "Enter your Last Name",				
				email: "Please enter a valid E-mail address",					
				mobileno:"Please enter valid Mobile no",
				institutionName:"Enter your Institution name",
				addrline1:"Please Enter Your Address",
				addrine2:"Please Enter Your Address",
				city: "Please enter City name",
				country: "Please select Country",
				state: "Please select State",
				zip: "Please enter Zip code",
				credit_card_type:"Please select Credit Card Type",
				credit_card_no:"Please provide Credit card no",
				expiry_month:"Please select valid Expiry Month",
				expiry_year:"Please select valid Expiry Year",
				cvv_no:"Please enter valid Cvv",
				name_on_card:"Please enter Name on Card",
				agree:"Please select Agree",
				checkbox:"Please read and accept the Terms & Conditions"
			},
			errorPlacement: function(error, element) {
				if (element.is("none"))
					error.appendTo(element.parent().next().next());				
				else
					error.appendTo(element.parent());
			}			
		});		
		 
		 //===============new query starts here=================
		  
	      $('#Productplan').click(function(event) {
	           var amount=null;
			  var subtype = null;
			  var feePrice = null;
	        if($('#Productplan').val()=="Basic"){
			var a = 99;
	          amount=99;
var totalamount = null;
			  
	    subtype = $("input[name=plan]:checked").val();
	    //alert(subtype);
	
			  if(subtype=="monthly"){
			  //alert("basic monthly");
			 feePrice = a*1;
			 totalamount=feePrice+0;
			  } else if(subtype=="quarterly"){
			  	  //alert("basic quarterly");
			  var n=a*3;
	          var m=n*10/100;
	          feePrice=n-m;
		totalamount=feePrice+0;
			  }
			  else if(subtype=="annual"){
			  //alert("basic annual");
			      var n=a*12;
	          var m=n*25/100;
	          feePrice=n-m;
			  totalamount=feePrice+0;
			  }
	        }
	        
	    		
	    	$("#total_amount").val(totalamount);
	        $("#fee").val(feePrice);			
			 $("#amo").val(amount);
			 $("#setup0").show();
			 $("#setup1").hide();
			  $("#setup2").hide();
			  $("#setup3").hide();
	      });
		 

	      $('#Productplan1').click(function(event) {
	              var amount=null;
			   var subtype = null;
			  var feePrice = null;
	        if($('#Productplan1').val()=="Silver"){
			  var a = 299;
	          amount=299;
var totalamount = null;
	          subtype = $("input[name=plan]:checked").val();
			  if(subtype=="monthly"){
			  //alert("Silver monthly");
			 feePrice = a*1;
			 totalamount=feePrice+999;
			  } else if(subtype=="quarterly"){
			  	  //alert("Silver quarterly");
			  var n=a*3;
	          var m=n*10/100;
	          feePrice=n-m;
		totalamount=feePrice+999;
			  }
			  else if(subtype=="annual"){
			  //alert("Silver annual");
			    var n=a*12;
	          var m=n*25/100;
	          feePrice=n-m;
			  totalamount=feePrice+999;
			  }
	        }
	        
	    		
	    	$("#total_amount").val(totalamount);
			
	        $("#fee").val(feePrice);
			 $("#amo").val(amount);
			  $("#setup1").show();
			  $("#setup2").hide();
			  $("#setup3").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
	      } );
	      
	      $('#Productplan2').click(function(event) {
	             var amount=null;
			   var subtype = null;
			  var feePrice = null;
	        if($('#Productplan2').val()=="Gold"){
	         var a = 1249;

	          amount=1249;
var totalamount = null;
	          subtype = $("input[name=plan]:checked").val();
			  if(subtype=="monthly"){
			  //alert("Gold monthly");
			 feePrice = a*1;
			 totalamount=feePrice+3999;
			  } else if(subtype=="quarterly"){
			  	  //alert("Gold quarterly");
			  var n=a*3;
	          var m=n*10/100;
	          feePrice=n-m;
		totalamount=feePrice+3999;
			  }
			  else if(subtype=="annual"){
			  //alert("Gold annual");
			      var n=a*12;
	          var m=n*25/100;
	          feePrice=n-m;
			  totalamount=feePrice+3999;
			  }
	            }
	        
	    		
	    	$("#total_amount").val(totalamount);
	        $("#fee").val(feePrice);
			 $("#amo").val(amount);
			 $("#setup2").show();
			  $("#setup1").hide();
			  $("#setup3").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
	      } );
	      
	      

			$('#Productplan3').click(function(event) {
	            var amount=null;
			   var subtype = null;
			  var feePrice = null;
	        if($('#Productplan3').val()=="Platinum"){
			var a = 4999;
var totalamount = null;
	          amount=4999;
	          subtype = $("input[name=plan]:checked").val();
			  if(subtype=="monthly"){
			  //alert("Platinum monthly");
			 feePrice = a*1;
			 totalamount=feePrice+14999;
			  } else if(subtype=="quarterly"){
			  	  //alert("Platinum quarterly");
			  var n=a*3;
	          var m=n*10/100;
	          feePrice=n-m;
		totalamount=feePrice+14999;
			  }
			  else if(subtype=="annual"){
			  //alert("Platinum annual");
			      var n=a*12;
	          var m=n*25/100;
	          feePrice=n-m;
			  totalamount=feePrice+14999;
			  }
	        }
			
			
			
			$("#total_amount").val(totalamount);
			
	        $("#fee").val(feePrice);
			 $("#amo").val(amount);
			  $("#setup3").show();			  
			  $("#setup2").hide();
			  $("#setup1").hide();
			  $("#setup0").hide();
			  $("#setup4").show();
	      } );
		 
    
$('#plan').click(function(event) {
  
 if($('#plan').val()=="monthly"){
var a = parseInt($('#amo').val());
    var amount=a*1;
	var setupamount = parseInt($('#setup_cost').val());
	
	var totalamount = null;
	
	if ($("#Productplan").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#Productplan1").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#Productplan2").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#Productplan3").is(":checked")){
		totalamount = amount+14999;
	}
		
	$("#total_amount").val(totalamount);
	$("#dp1").show();
	$("#dp2").hide();
	$("#dp3").hide();
	$("#setup4").show();
}   

    $("#fee").val(amount);
});

$('#plan1').click(function(event) {
  
 if($('#plan1').val()=="quarterly"){
var a = parseInt($('#amo').val());
    var n=a*3;
    var m=n*10/100;
	var amount=n-m;
	
	var totalamount = null;
	if ($("#Productplan").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#Productplan1").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#Productplan2").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#Productplan3").is(":checked")){
		totalamount = amount+14999;
	}
	
	$("#total_amount").val(totalamount);
	
$("#dp1").hide();
$("#dp2").show();
$("#dp3").hide();
$("#setup4").show();
}   
    $("#fee").val(amount);
});

$('#plan2').click(function(event) {
  
 if($('#plan2').val()=="annual"){
var a = parseInt($('#amo').val());
var n=a*12;
var m=n*25/100;
	var amount=n-m;
	var totalamount = null;
	if ($("#Productplan").is(":checked")) {
		totalamount = amount+0;
	}
	else if($("#Productplan1").is(":checked")){
		totalamount = amount+999;
	}
	else if($("#Productplan2").is(":checked")){
		totalamount = amount+3999;
	}
	else if($("#Productplan3").is(":checked")){
		totalamount = amount+14999;
	}
	
	$("#total_amount").val(totalamount);
	
	$("#dp1").hide();
	$("#dp2").hide();
	$("#dp3").show();
	$("#setup4").show();
}   
    $("#fee").val(amount);
});
     
    
$('#coupon').click(function(event) {
    var sports = $("#couponcode").val();
	var spo = $("#total_amount").val();
	var txt_wrong = "Invalid Coupon Code!";
	
	$.get('user.html?cmd=couponname', {
    	prog : sports,
		cost : spo
    }, function(response) {
    	if(response != null && response !="" && response != "null"){
    		 $("#total_amount").val(response);
			 
    	     
    	}else{
			
			$("#total_amount").val(spo);
			alert(txt_wrong);  
    	}       
    });
    });
    
    
    }); 
	 
	
					  
					  
      
					   
					   
     
					   

			 
    
   //=====================Ajax Starts Here========================
   function isnotAlpha2(str){
stringCheck="!@#$%^&*()+|<>?/=_~,`0123456789;:][{}"+"\\"+"\"";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}
   //=================validation Starts Here=====================================
   
function OnScrollDiv (div) {
			//alert("you must read condition fully");
            //info.innerHTML = "Horizontal: " + div.scrollLeft
                          // + "px<br/>Vertical: " + div.scrollTop + "px";
				 //document.getElementById("info").disabled= true;
				 //document.getElementById("info").innerHTML="you must read condition fully";
				  //document.getElementById("info").innerHTML = "x";
        //document.getElementById("info").innerHTML = "scroll fully";
		//document.form.check.disabled="false";
		    if(div.scrollTop >= 900){
			        var x = document.getElementById ("check").disabled = false ;
			}
		}
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
                <h1 class="b-title-page">Registration Form</h1>
                
                <!-- end b-title-page-->
              </div>
              <div class="col-sm-5">
                <ol class="breadcrumb">
                  <li><a href="login.html?cmd=initLogin">home</a></li>
                  <li class="active">Registration</li>
                </ol>
              </div>
            </div>
          </div>
        </div>
      </div>	


	


             <div class="col-md-12">
			
                <div class='container '>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<%String user_id=(String)request.getAttribute("user_id"); %>
					<%String usrStat=(String)request.getAttribute("usrStat");
					 String purchase=(String)request.getAttribute("purchase");
					 String amount=(String)request.getAttribute("productPrice");
					 String productPlan=(String)request.getAttribute("Productplan");
					 String onetimecost=(String)request.getAttribute("onetimecost");
					  String offer=(String)request.getAttribute("offer");
					  String fromTryNowSignUp=(String)request.getAttribute("fromTryNowSignUp");
					  
					 System.out.println("offer :::: "+offer+" fromTryNowSignUp ---> "+fromTryNowSignUp);
					 
					 String type=(String)request.getAttribute("type"); 
					 System.out.println("purchase :::: "+purchase);
					 System.out.println("amount :::: "+amount);
					 String totamount=null;
					 String totalAmount = (String)request.getAttribute("productPrice"); 
					 %>      
					
						
                        <div class='panel-body'>
												
					<form class='form-horizontal' role='form' id="form" width="800px" name="insert" align="center" action="signUp.html?signUpProcess=signup" method="post" onSubmit="return onValidate();">
						 <input type="hidden" name="type"  value="<%=type%>">
						 <input type="hidden" name="amount" id="amo" value="<%=amount%>">
						 <input type="hidden" name="offer"  value="<%=offer%>">
						 <input type="hidden" name="fromTryNowSignUp"  value="<%=fromTryNowSignUp%>">
						
						  <%
							String status1=(String)request.getAttribute("status");
							 if(status1!=null){
							 %>
							  
								<p id="p_error"><%=status1%></p>
							
							 
							 <%
							}
							
							%>
							
							
						 
						
 						<p><span style="color:#FF0000;">*</span>All fields are mandatory.</p>
 						
 						
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                       <input  type="text" name="firstname" id="firstname"  class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                     <input  type="text" name="lastname" id="lastname"  class='form-control'>
                                     </div>
                                  </div>

                              </div>
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                      <input  type="text" name="email" id="email"  class='form-control' value="" onChange="ValidateEmail('email');">
                                     </div>
                                  </div>
 
                              </div>
							  
							 
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile No.:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                      <input  type="text" name="mobileno" id="mobileno" class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Institution Name:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                       <input  type="text" name="institutionName" id="institutionName"  class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address Line1:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                     <input  type="text" name="addrline1" id="addrline1"  class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
							  
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address Line2:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                      <input  type="text" name="addrline2" id="addrline2"  class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                     <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');" class="form-control">
  
  										<option selected="selected">Select One</option>
                    					<option value="United States of America">United States of America</option></select>
                                     </div>
                                  </div>

                              </div>
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                     <select name="state" id="state"  class="form-control">
										 <option value="">Select State</option>
										<option value="FL">FL</option>
										<option value="VA">VA</option>
									</select>
                                     </div>
                                  </div>

                              </div>
							  
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                      <input  type="text" name="city" id="city" class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
                              
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
                                      <input  type="text" name="zip" id="zip" class='form-control' value="">
                                     </div>
                                  </div>

                              </div>
                        </div>
				
				<% if(purchase.equalsIgnoreCase("try_now") && purchase != null) {%>  
				<!--	<p id="p_error" style="padding-bottom:20px">NOTE: Amount will not be credited from your account for trial period</p>	-->
				<% }%>
						 <% if(purchase.equalsIgnoreCase("buy_now") && purchase != null) {%>  

						
							<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Plan:</label>
						
                                <div class='col-md-8'>
                                    <div class='col-md-4 indent-small' >
                                      <div class='form-group internal'>
                                      <%  if(productPlan.equalsIgnoreCase("Basic") && productPlan != null)
										   {%>		   
									  
									   
												<input type="radio" name="Productplan" id="Productplan" value="Basic"  checked="checked"/>
												 Basic
												 <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
												 Silver
												 <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
												 Gold 
												 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
												 Platinum 
												 <%} else if(productPlan.equalsIgnoreCase("Silver") && productPlan != null){%>
											
												 
												 <input type="radio" name="Productplan" id="Productplan" value="Basic" />
												 Basic
												 <input type="radio" name="Productplan" id="Productplan1" value="Silver" checked="checked"/>
												 Silver
												 <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
												 Gold 
												 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
												 Platinum 
												 <%}else if(productPlan.equalsIgnoreCase("Gold") && productPlan != null){%>					 
											
												 
												  <input type="radio" name="Productplan" id="Productplan" value="Basic" />
												 Basic
												 <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
												 Silver
												 <input type="radio" name="Productplan" id="Productplan2" value="Gold" checked="checked"/>
												 Gold 
												 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" />
												 Platinum 
												 <%}else if(productPlan.equalsIgnoreCase("Platinum") && productPlan != null){%>
												
												 
												 <input type="radio" name="Productplan" id="Productplan" value="Basic" />
												 Basic
												 <input type="radio" name="Productplan" id="Productplan1" value="Silver" />
												 Silver
												 <input type="radio" name="Productplan" id="Productplan2" value="Gold" />
												 Gold 
												 <input type="radio" name="Productplan" id="Productplan3" value="Platinum" checked="checked"/>
												 Platinum 
											<%}%>
                                     </div>
                                  </div>
								</div>
                              </div>
                       
					
						<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Plan:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-6 indent-small' style="padding:0; margin:0;">
                                      <div class='form-group internal'>
									  <input type="radio" name="plan" id="plan" value="monthly"/> Monthly
									  <input type="radio" name="plan" id="plan1" value="quarterly" checked="checked"/>Quarterly(Save 10%) 
									  <input type="radio" name="plan" id="plan2" value="annual" />Annual(Save 25%)
									  
									 	</div>
									</div>
								</div>
							
							</div>
								  <% if(amount != null){
									  int ap = Integer.parseInt(amount);
									  int cp = Integer.parseInt(onetimecost);
									  int n=ap*3;
									  int m=n*10/100;
									  int am=n-m;
									  int aaa=(n-m)+cp;
									  amount=Integer.toString(am);
									  totamount=Integer.toString(aaa);
								  %>
								  
							<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Cost:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									  	<input  type="text" name="fee" id="fee" class='form-control'  value="<%=amount%>"  readonly >Total for a Month Total for 3 Months  Total for 12 Months
									 	</div>
									</div>
								</div>
							</div>
   
 					<% }else{%>
					
					<div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount to be Charged:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									   <input  type="text" name="fee" id="fee" class='form-control' value="<%=amount%>"  readonly >
									 	</div>
									</div>
								</div>
							</div>
 
   					<%}%>
					
					<div class='form-group'>
						<div id="setup0" style="display:none;">
							<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>One Time Setup Cost:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									   <input type="radio" name="setup_cost" id="setup_cost" value="0"/> Basic(0)
									 	</div>
									</div>
								</div>
							</div>
							
						<div id="setup1" style="display:none;">
							<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>One Time Setup Cost:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									   <input type="radio" name="setup_cost" id="setup_cost" value="999"/> Silver(999)
									 	</div>
									</div>
								</div>
							</div>
							
						<div id="setup2" style="display:none;">
							<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>One Time Setup Cost:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									  <input type="radio" name="setup_cost" id="setup_cost" value="3999"/> Gold(3999)
									 	</div>
									</div>
								</div>
							</div>
							
							<div id="setup3" style="display:none;">
								<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>One Time Setup Cost:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									  <input type="radio" name="setup_cost" id="setup_cost" value="14999" />Platinum(14999)
									 	</div>
									</div>
								</div>
							</div>
							
							<div id="setup4">
								<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>Coupon Code:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="couponcode" id="couponcode" class="form-control"  >
									 <input type="button" name="coupon" id="coupon" value="Apply">(Use Coupon Code if you have)
									 	</div>
									</div>
								</div>
							</div>
							
						</div>
   
   						<%}%>
						
						
					
					<div class='form-group'>
					<%if(fromTryNowSignUp != null){%>
					<div id="setup4">
								<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
	<input  type="text" name="total_amount" id="total_amount" class='form-control' value="<%=totalAmount%>">(Subscription Cost+Setup Cost)
									 	</div>
									</div>
								</div>
							</div>
					<%}else{%>
					<div id="setup4">
								<label  class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="total_amount" id="total_amount" class='form-control' value="<%=totamount%>">(Subscription Cost+Setup Cost)
									 	</div>
									</div>
								</div>
							</div>
					<%}%>
					
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-4 indent-small'>
                                      <div class='form-group internal'>
	<input type="radio" size="10" name="credit_card_type" id="credit_card_type" value="visa"  /><img src="images/visa.png" id="visa" name="visa" height="35px" width="50px"/>
  <input type="radio" size="7" name="credit_card_type" id="credit_card_type" value="mastercard" align="center" /><img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
   <input type="radio" size="8" name="credit_card_type" id="credit_card_type"value="amex"  /><img src="images/american.png" id="american" name="american" width="46px"/>
									 	</div>
									</div>
								</div>
							</div>
							
					<div class='form-group'>
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Credit Card No.:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="credit_card_no" id="credit_card_no" class='form-control' value="">
									 	</div>
									</div>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
										<input  type="password" name="cvv_no" id="cvv_no"  value=""  class='form-control'>
										<img src="images/cvv.png" id="cvv" name="visa" height="40px" width="62px" align=""/>
									 	</div>
									</div>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="name_on_card" id="name_on_card" class='form-control' value="">
									 	</div>
									</div>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <select name="expiry_month" id="expiry_month" class='form-control' >
									  <option value="">Month</option>
									  <option value="1">January</option>
									  <option value="2">February</option>
									  <option value="3">March</option>
									  <option value="4">April</option>
									  <option value="5">May</option>
									  <option value="6">June</option>
									  <option value="7">July</option>
									  <option value="8">August</option>
									  <option value="9">september</option>
									  <option value="10">October</option>
									  <option value="11">November</option>
									 <option value="12">December</option>
									  </select>
									  </div>
										 <div class='form-group internal'>
									  <select name="expiry_year" id="expiry_year"  class='form-control' >
									  <option value="">Year</option>
									  
									  <option value="2010">2010</option>
									  <option value="2011">2011</option>
									  <option value="2012">2012</option>
									  <option value="2013">2013</option>
									  <option value="2014">2014</option>
									  <option value="2015">2015</option>
									  <option value="2016">2016</option>
									  <option value="2017">2017</option>
									  <option value="2018">2018</option>
									  <option value="2019">2019</option>
									  <option value="2020">2020</option>
									  <option value="2021">2021</option>
									  <option value="2022">2022</option>
									  <option value="2023">2023</option>
									  <option value="2024">2024</option>
									  <option value="2025">2025</option>
									  <option value="2026">2026</option>
									  <option value="2027">2027</option>
									  <option value="2028">2028</option>
									  <option value="2029">2029</option>
									  <option value="2030">2030</option>
									  <option value="2031">2031</option>
									  <option value="2032">2032</option>
									  <option value="2033">2033</option>
									  <option value="2034">2034</option>
									  <option value="2035">2035</option>
									  <option value="2036">2036</option>
									  <option value="2037">2037</option>
									  <option value="2038">2038</option>
									  <option value="2039">2039</option>
									  <option value="2040">2040</option>
									  <option value="2041">2041</option>
									  <option value="2042">2042</option>
									  </select>
									  
									 	</div>
									</div>
								</div>
								
						</div>
  
   				 <div class='form-group'>
					<div style="overflow:scroll; overflow-x:hidden; padding:15px; height:250px; border:1px solid #333;" onscroll="OnScrollDiv(this)"></br>
					<p class="para" align="center"> Terms and Conditions</p>
					<p class="para1"> RETURN, REFUND AND EXCHANGE POLICY</p>
					
					<p align="justify">Please read the following policies carefully before using any of digiBlitz's products or platform(s). The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 15 days from the day of purchasing the product(s) or platform(s). digiBlitz Inc has rights to refuse any return or exchange if it fails to meet the norms.</br>
<p class="para1" align="left">1.	TERMS OF USE AND RESALE</p>

<p >THOUGH DIGIBLITZ INC. ALLOWS YOU TO ACCESS VARIOUS RESOURCES THROUGH ITS ONLINE (CLOUD) OR ENTERPRISE PRODUCT(S) & PLATFORM(S), WEBSITE, DB STORE, AND OTHER SELLABLE GOODS THAT MAY OR MAY NOT BE AVAILABLE FOR PURCHASE, OR DOWNLOAD, INFORMATION OF SOFTWARE, INCLUDING THE  SOFTWARE AND TOOLS (COLLECTIVELY "SERVICES") ARE SUBJECT TO THESE TERMS OF USE AND SALE ("TERMS OF USE AND RESALE" OR "CONTRACT").</br>
By using digiBlitz's and its Products' Website, Purchasing/ downloading products and services from the digiBlitz's website,  its Products'  website, dB store or through any authorized reseller, you accept and agree to TERMS OF USE AND RESALE, DIGIBLITZ PRIVACY STATEMENT, and APPLICABLE TERMS AND CONDITIONS, policies or disclaimers found in the digiBlitz Inc. or referenced herein and accessible through the related hyperlinks. We allow you to read the digiBlitz Inc. Policies carefully.</p>
<p class="para1" align="left">2.	TERMS RELATING TO YOUR USE OF THE DB STORE</p><br>

<p align="left" >2.1.	PERSONAL AND COMMERCIAL USE LIMITATION<br><br>
 Unless otherwise specified, the Products, Components Of dB store and Services are only for your personal and commercial use. You may not profitably distribute, circulate, license, or trade any information or services obtained from the Websites, Products, components of dB store and their respective Services.<br/><br>
2.2.	NOTICE SPECIFIC TO DOCUMENTS AVAILABLE ON THE EBSITE OR SERVICES<br/><br>
Permission to use Documents and information (such as white papers, press releases, datasheets, Product literatures, Manuals of any kind and FAQs) from the Websites, Products, components of dB store and their respective Services is allowed for your personal and commercial use.<br/>
Use of such records from digiBlitz Inc. or Services is for informational and profitably or personal use only and will not be copied or posted on any network computer or make public in any media, unless permitted by freedom from a responsibility under applicable copyright
laws. You could however with prior permission from digiBlitz Inc., could use the information provided, the following Copyright notice: "© 2016 digiBlitz Inc., All rights reserved." appears in all copies and that both the copyright notice and this permission notice appear.<br/>
<br>Website: Any digiBlitz Inc. owned, operated, licensed or controlled website. Elements of digiBlitz Inc. websites, including the Website, are protected by trademark, unfair competition, and other laws and may not be copied or imitated in whole or in part. No logo, graphic, sound or image from any digiBlitz Inc. website, including the Website, may be copied, retransmitted or made available unless expressly permitted by digiBlitz Inc. or applicable law.<br/><br>
The documents and related graphics published on any digiBlitz Inc. owned, operated, licensed or controlled website and dB Store or Services could include technical inaccuracies or typographical errors. Changes may be periodically added to the information without prior notice. digiBlitz Inc. and/or its respective suppliers may make improvements and/or changes in the product(s) and/or the platform(s) and/or dB store described herein at any time.<br/><br>
2.3.MEMBER ACCOUNT, PASSWORD, AND SECURITY<br/><br>
If you want to open any account in any dB products, information should be complete, accurate, and current as required by the applicable registration form. Username and password may or may not be generated by digiBlitz Inc. depending upon the case. However, you are responsible for keeping your account information and password confidential and be responsible for all activity that occurs under your account. You agree to notify digiBlitz Inc. without delay of any unauthorized use of your account or any other breach of security.<br/><br>
2.4.NO UNLAWFUL OR PROHIBITED USE<br><br>
As a condition of your use of the Services, you pledge to us that you will not use the Services for any purpose that is against the law or disallowed by these terms, conditions, & notices. You may not use our product(s), platform(s) or component(s) of dB store which would cause damage, disable or crash any server, or the network(s) connected to any digiBlitz’s server, or interfere with any other party's use and enjoyment of any Services. You may not try to gain unauthorized access to any Services, computer systems or networks connected to any digiBlitz's Server or to any of the Server. You may not use the services in a way that violate rights of third parties, carelessly harming a person or entity, including digiBlitz. digiBlitz has right to make any information public.<br/><br>
2.5.MATERIALS PROVIDED TO digiBlitz Inc. PRODUCTS OR POST ON THE WEBSITE BY YOU<br/><br>
digiBlitz Inc does not claim ownership of the materials you provide to digiBlitz Inc. (including feedback, ratings, and suggestions) or post, upload, input or submit to any Product or its connected  services for review by the users, or by the members of any public or private area of people (each a "Submission" and collectively "Submissions").<br/>&nbsp;&nbsp;However, digiBlitz Inc. shall be permitted to use your Submission, including your name, for the purpose for which it was submitted. No compensation will be paid for you Submission. digiBlitz Inc.  has rights to remove any Submission at any time in its own discretion.<br/><br>
2.6.THIRD-PARTY LINKS IN OUR WEBSITE<br/><br>
The dB store or any product(s) or platform(s) may include links to third-party websites that allow you leave the digiBlitz Inc. Website. 
The digiBlitz Inc is not responsible for any internal link or contents of third party website. These linked sites are not under the control of digiBlitz Inc. digiBlitz Inc. is providing these links only for your convenience. Your use of the third-party website may be subject to that third party's terms and conditions.</p>
<p class="para1" align="left">3.	Terms Relating to the Resale of Products to You</p><br>

<p align="left">3.1.USERS<br/>
You must not be a reseller. Only the end users are allowed to buy our product.<br/><br>
3.2.INFORMATION ABOUT BILLING AND ACCOUNT INFORMATION<br/>
The information provided to digiBlitz Inc. by you for all purchases should be accurate current and complete and .You agree to update your account and other information immediately, including your email address and credit card numbers and expiration dates, so that we can complete your transactions and contact you as needed.</br><br>
3.3.PRODUCT AVAILABILITY AND QUANTITY AND ORDER LIMITS<br/>
Pricing page of our product can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per account, per person, per order,  per credit card, or per CPU and core. We have rights to refuse or reject any order at any time, refunding you any money you have paid for the order, for reasons which include, but are not limited to, you have follow the conditions specified at the time of the order, otherwise your payment cannot be processed. In case if we are unable to supply our product, we will contact you and we will make an alternative. If you do not choose to purchase the alternative product, we will cancel your order. If the product has some error, we reserve the right to correct the error and charge you the correct price. In that case will offer you the option of purchasing the product and also for cancelling the order. Credits or refunds will be made to the same method of payment and account used to place the order.<br/><br>
3.4.SOFTWARE PURCHASES AND LICENSE TERMS<br/>
Any software made available to download or purchase from the website or dB store is the copyrighted work of digiBlitz Inc. When you purchase software, you are actually purchasing a license to use the software rather than purchasing the software itself. Software licenses purchased form any of digiBlitz's owned or controlled website or from an authorized reseller are subject to the license agreement that accompanies the software (the "License Agreement"). You will be required to agree to the terms and conditions of the License Agreement when you install the software.<br/><br>
Any reproduction or redistribution of software or merchandise not in accordance with the relevant License Agreement and applicable law is expressly prohibited and may result in severe civil and criminal penalties. Violators risk being prosecuted to the maximum extent possible.<br/><br>
3.5.Refund<br/>
Refunds will be made in the same method as above. For refund the intimation should be given to digiBlitz Inc.  by customer and it will be processed with 15 days.<br/></p>

<p class="para" align="left">Terms and Condition</p><br>

<p align="left" >1.Payment and pricing:<br/>
Pricing of all products are stated in digiBlitz's relevant product or platform websites. Pricing page of our product(s) and platform(s) can be changed at any time without notice. digiBlitz Inc. may limit on the number that may be purchased per order, per account, per credit card, per person or per CPU. Pricing shown in the website will include all tax and charges of the product.<br/><br>
2.	AUTO RENEWAL OF THE PRODUCTS<br/>
All products of digiBlitz Inc.  will be renewed automatically at the end of each month on a prorate basis or depending up on the date of purchase (depending upon individual cases). We will also inform you about the renewal through email before the subscription of the product. Once we informed you about the auto renewal, we will charge automatically for the product. The intimation will be given before one week from the renewal to digiBlitz Inc. by the customer .We will provide you with instruction on cancelling the product service or for suspending the product. However, no intimation will be given to you for subscription renewal of any dB store components. You must cancel the services before the renewal date to avoid being billed for the renewal.<br/><br>
3.	Return, Refund and Exchange<br/>
The return policy is provided in addition to any legal return rights that you may have under law. digiBlitz Inc. will accept returns, refunds and exchanges within 30 day after purchasing of product. We have rights to refuse any refund, return or exchange if it fails to meet our norm. For Return, Refund and Exchange the intimation should be given before one week from the renewal to digiBlitz Inc. by the customer and it will be processed within 30 days. We may occasionally extend the 15-day return period during holiday or other periods. If a longer return period was advertised through a promotional campaign on the Website when you made your purchase, that applies within the clause mentioned in the promotional campaign.<br/><br>
4.	Trial-period<br/> 
If you are taking part in any trial-period, you must cancel the service before the end of the trial period to avoid incurring new charges unless we notify you otherwise. Your trial subscription will be automatically upgraded to basic pack at the end of this free subscription period. This implies that your credit card will be charged for the basic pack. However, you could unsubscribe the product any time before the trial expiry through the Master account management link that is accessible when you login into the product.<br/><br>

5.	Customer support<br/>
Please visit our Knowledge base site for Customer support and Assistance relating to the product.<br/><br>
6.	CHANGING TERMS<br/>
digiBlitz Inc. may change the Terms of Return, Refund and Exchange at any time and without notice to you. The Terms of Return, Refund and Exchange in force at the time you place your order will govern your purchase and serve as the purchase contract between us. Before your next purchase, digiBlitz Inc. may change their policies. We advise you to visit the digiBlitz Inc. website, to review the current terms and condition, Refund and Return policy each time. <br/><br>
7.	PROTECTION OF INDIVIDUAL INFORMATION<br/>
Your privacy is important to us. We may use certain information for the purpose of your product according to your need. <br/><br>
8.	LIMITATION OF LIABILITY<br/>
In this section of Contract, digiBlitz Inc. is found liable to you for any loss or damage that arises out of or is in any way connected with your use of the dB Store, the Services, or any product or service offered, you agree that your exclusive remedy is to recover from digiBlitz Inc.  or any affiliates, and vendors direct damages up to (1) an amount equal to the price or fee for one month of any service or subscription or (2) US $100 if there was no service, subscription or similar fee.<br/><br>
YOU AGREE THAT YOU CAN'T RECOVER ANY OTHER DAMAGES OR LOSSES, INCLUDING, WITHOUT LIMITATION, CONSEQUENTIAL, LOST PROFITS, SPECIAL, INDIRECT, INCIDENTAL, OR CONCERNING PUNISHMENT. THESE LIMITATIONS AND EXCLUSIONS APPLY EVEN IF YOU INCUR DAMAGES AND EVEN IF WE KNEW OR SHOULD HAVE KNOWN ABOUT THE POSSIBILITY OF THE DAMAGES. THESE LIMITATIONS AND EXCLUSIONS APPLY TO ANYTHING RELATED TO THE WEBSITE OWNED AND CONTROLLED BY DIGIBLITZ INC., ITS PRODUCT (S), PLATFORM(S) OR ANY COMPONENTS OF DB STORE, OR SERVICE OFFERED<br/><br>

9.	Interpreting the Contract<br/>
All parts of this Contract apply to the maximum extent permitted by the relevant law of the United States.<br/></p>

</div>
</div>
  
   				<div class='form-group'>
					
					<input type="checkbox" name="checkbox"  disabled="disabled" id="check"/> I agree to the user License agreement and privacy policy
					<input type="hidden" name="checkbox">
					
				</div>

					
				<div class='form-group'>
				
				 <%if(purchase.equalsIgnoreCase("try_now") && purchase != null){ %>
				<input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />
				
				<div class='col-md-offset-4 col-md-2'>
				<button class="btn-lg btn-primary" type="submit" name="Insert" value="Register" id="submit" onClick="return(onValidate());" >Register</button>
				</div>
				
				<%} else if(purchase.equalsIgnoreCase("buy_now") && purchase != null){%>
				
				 <input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />
	 

				<div class='col-md-offset-4 col-md-2'>
					<button class="btn-lg btn-primary" type="submit" name="Insert" value="Proceed" id="submit" onClick="return(onValidate());" >Proceed</button>
				</div>
				<%}%>
				<div class='col-md-2'>
				
					<button class="btn-lg btn-danger" name="button" style="margin-left:8px" type="button" class="btn-lg btn-danger"   onClick="javascript:history.back(-1);" value="Cancel" >Cancel</button>
				</div>
				
				</div>
				
				
									
								
									<div class="col-md-6 col-md-offset-7">
									<a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank">
									<img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></a>
								<a href="#" onclick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=600,left=160,top=170');" ><img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" style="width:130px;height:82px"/>
								<img style="cursor:pointer;cursor:hand;width:150px;height:60px" src="https://seal.godaddy.com/images/3/en/siteseal_gd_3_h_l_m.gif" onclick="verifySeal();" alt="SSL site seal - click to verify">
								</a> 
								</div>
								
								
 
				</form>
						

	<!--==============================Form Body=================================-->
							
                       
						
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
    
    




 <script language="javascript">
	FillCountry(document.insert.country, document.insert.state, 'USA' );
	FillState(document.insert.country, document.insert.state, '');

	FillCountry(document.insert.scountry_txt, document.insert.sstate_txt, 'USA' );
	FillState(document.insert.scountry_txt, document.insert.sstate_txt, '');
    
	
	
</script>

</html>



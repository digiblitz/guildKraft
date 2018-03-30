<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!doctype html>
<html>
<head>
<title>Pricing_Page</title>
<meta charset="utf-8">

<!--Responsive Meta Begins Here(needs to be included in the head)!-->
<meta name="viewport" content="width=device-width,initial-scale=1">
<!--Responsive Meta Ends Here!-->


<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css">
<link href="css/hover.css" rel="stylesheet" type="text/css">
<link href="css/animate.css" rel="stylesheet" type="text/css">
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/jquery.js"></script>
<!--CSS Ends Here!-->


    <script type="text/javascript">



	$( document ).ready(function( $ ) {





		$(".overlay").click(function() {



			$(".overlay").fadeOut();



			$(".popCont").fadeOut();
			

		});



		



	});



</script>




<script type="text/javascript">



	function showPop(cont){



	$("#overlay").fadeIn(300);



  $("#"+cont).fadeIn();



}



</script>

	<style>
		
	.overlay{

width:100%;

height:100%;

background:#333;

opacity:0.6;

position:fixed;

z-index:9999;

left:0;

top:0;

}



.popCont {

    background: hsl(0, 0%, 100%) none repeat scroll 0 0;
    height: auto;
    left: 20%;
    overflow: auto;
    padding: 20px;
    position: fixed;
    top: 35px;
    width: 60%;
    z-index: 999999;
	bottom:0;


}


.popCont1{left:5%}

.footer-section ul li span a{font-size:12px;}



.popCont h2 {

color: #fff;

background: none repeat scroll 0 0 #FF9933;

margin: 0 0 0px 0;

padding: 10px 0 15px 0;
font-size:18px;
text-align:center;

}




.popCont h4 {

color: #fff;

background: none repeat scroll 0 0 #df9626;

margin: 0 0 0px 0;

padding: 10px 0 10px 0;

}



.popCont p{color:#333; font-family:Arial, Helvetica, sans-serif; font-size:14px; font-weight:normal; padding:5px 7px;}
.popCont p span{ margin:0 0 0 10%; color:red;}



.popCont ul li{list-style:circle; font-size:15px;}

.overlay,.popCont{

display:none;

}
	</style>
</head>

<body style="background:#fff;">
<div id="overlay" class="overlay"></div>
<div class="container" style=" background: hsl(0, 0%, 94%) none repeat scroll 0 0; padding: 30px 15px;">
	<h4 style="text-align:center; font-size:21px; padding-bottom:30px; color:#666">Plans built for every team. Start with 30 days free.</h4>
	<!--Begin Plan Basic!-->
	<div class="col-md-3 klausbg hvr-float" style="width:20%!important;">
		<div class="klausheader">
		<h5>Basic</h5>
		<!--<span class="klaus_package">package</span>-->
		<span class="klaus_price skintwocolor">$99</span>
		<p>/per month</p>
		<span class="klaus_package">Billed annually or
    month-to-month </span>
		<div class="col-md-12">
		<div class="row" style="margin:15px 0 0 0;">
		<div class="col-md-6">
		<div><li style="list-style-type:none;"><a href="signUp.html?signUpProcess=pricingDetails" class="btn btn-success">Try Now</a></li></div>
		</div>
	
		
		<div class="col-md-6">
		<div><li style="list-style-type:none;"><a href="signUp.html?signUpProcess=pricingDetails&getProductPrice=50" class="btn btn-default">Buy Now</a></li></div>
		</div>
		</div>
		</div>
		</div>
		
		
		
		<div class="klaus_features skintwoklaus_features">
		
		<h4>Features</h4>
			<li>
			<i class="fa fa-check-circle"></i><a href="javascript:void(0);" onClick="showPop('popCont30');">Membership and subscription</a>	</li>
		
		
			
			
		<li><i class="fa fa-check-circle"></i> 
	<a href="javascript:void(0);" onClick="showPop('popCont1');">Functional & Process Management</a>
	</li>
		<li><i class="fa fa-check-circle"></i> 
		<a href="javascript:void(0);" onClick="showPop('popCont2');">Business intelligence & Analytics</a>
		</li>
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont3');">Business Architecture Management</a></li>
		
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont4');">Product Training and Support</a></li>
	
		<!--<br>
	
		
		<a href="javascript:void(0);" onClick="showPop('popCont5');"><i class="fa fa-check-circle"></i>Enterprise Architecture Planning Bundle</a><br>-->
		</div>
	</div>
	
	
	
	
	<div class="popCont" id="popCont30">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Users</h2>
				<p>organizer User<span>1</span></p>
				<p>Member User<span>25</span></p>
				<p>Sub chapter User<span>1</span></p>
                <p>corporate user<span>1</span></p>
				<p>Business Head User<span>1</span></p>
	    </div>
		</div>
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Sub chapter bundle </h2>
				<p>Basic<span>-</span></p>
				<p>Silver<span>-</span></p>
				<p>Gold<span>-</span></p>
				<p>Platinum<span>-</span></p>
	    </div>	
		</div>
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Event management bundle</h2>
				
				<p>No of events<span>1</span></p>
				<p>No of entries<span>50</span></p>
				
		</div>
		</div>
    </div>
		
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Training management bundle</h2>
				<p>Interactive Assignment / Lab<span>1</span></p>
				<p>Descriptive Assignment / Lab<span>5</span></p>
				<p>No of Multiple Choice / Objective Tests<span>5</span></p>
				<p>No of Elaborative / Descriptive Tests<span>1</span></p>
		</div>
		</div>
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Storage</h2>
				<p>Storage Space<span>50GB</span></p>		
		</div>
		</div>
		</div> 
    </div>

  
  
  
  <div class="popCont" id="popCont1" style="height:307px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>ERP</h2>
				<p>No. of Modules<span>1</span></p>
				<p>No. of Forms<span>10</span></p>
				<p>No. of Screens<span>40</span></p>
				
	    </div>
		</div>
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Services</h2>
				<p>No. of Provider Services<span>2</span></p>
				<p>No. of Consumer Services<span>6</span></p>
				<p>No of Service Life Cycle Design Allowed<span>1</span></p>
				
	    </div>	
		</div>
		<div class="col-md-4">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Process Automation</h2>
				
				<p>No of Single Instance Process<span>2</span></p>
				<p>No of Multi-Instance Process<span>1</span></p>
				<p>No of Process Life Cycle Design Allowed<span>1</span></p>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
  
  
  
  <div class="popCont" id="popCont2"  style="height:208px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Inteligence & Analytics</h2>
				<p>No of Business Intelligence & Analytics Modeller Session<span>-</span></p>
				<p>No of Business Intelligence & Analytics Consumer Session<span>1</span></p>
				
				
	    </div>
		</div>
		
    </div>
		 
    </div>
  </div>
  
  
  <div class="popCont" id="popCont3" style="height:580px;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Asset/ Artifacts management & Governance</h2>
				<p>No of un-governed Assets/Artifacts<span>100</span></p>
				<p>No of Governed Assets/Artifacts<span>-</span></p>
				
				
	    </div>
		</div>
		</div>
		
		<div class="row">
		<div class="col-md-12">
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Architecture Modeling Bundle</h2>
				<p>No of BA LifeCycle Design Allowed<span>-</span></p>
				<p>No of Business Mapping Allowed<span>-</span></p>
				<p>No. of Business of Process Units aligned<span>-</span></p>
				<p>No. of Business Reference Architecture<span>-</span></p>
				<p>No of Blue Prints<span>-</span></p>
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Enterprise Architecture Planning Bundle</h2>
				<p>No of EA frameworks<span>-</span></p>
				<p>No of EA LifeCycle Design Allowed<span>-</span></p>
				<p>No. of Technical Reference Architecture<span>-</span></p>
				<p>No of Business Processes  Alignment<span>-</span></p>
				<p>No of  Business Services Alignment<span>-</span></p>
				<p>No of  Web/technical Services Alignment<span>-</span></p>
				<p>No of  Application component Alignment<span>-</span></p>
				
	    </div>	
		</div>
		</div>
		</div>
		
    </div>
		 
    </div>
	
	
	
	
  
  
  
  <div class="popCont" id="popCont4"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
  
 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont5"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Users</h2>
				<p>organizer User<span>1</span></p>
				<p>Member User<span>25</span></p>
				<p>Sub chapter User<span>1</span></p>
                                <p>corporate user<span>1</span></p>
				<p>Business Head User<span>1</span></p>
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Sub chapter bundle </h2>
				<p>Basic<span>$50/Month</span></p>
				<p>Silver<span>$150/Month
</span></p>
				<p>Gold<span>$700/Month</span></p>
				<p>Platinum<span>200/Month</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Event management bundle</h2>
				
				<p>No of events<span>1</span></p>
				<p>No of entries<span>50</span></p>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Training management bundle</h2>
				<p>Interactive Assignment / Lab<span>1</span></p>
				<p>Descriptive Assignment / Lab<span>5</span></p>
				<p>No of Multiple Choice / Objective Tests<span>5</span></p>
				<p>No of Elaborative / Descriptive Tests<span>1</span></p>
		</div>
		</div>
    </div>
<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Storage</h2>
				<p>Storage Space<span>50GB</span></p>	
		</div>
		</div>
    </div>

		 
    </div>
 
	 	<!--popCont5 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont6"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont6 End Here-->
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont7"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont7 End Here-->
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont8"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont8 End Here-->
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont9"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont9 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont10"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont10 End Here-->
		
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont11"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont11 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont12"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont12 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont13"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont13 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont14"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont14 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont15"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont15 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont16"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont16 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont17"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont17 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont18"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont18 End Here-->
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont19"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont19 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont20"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont20 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont21"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont21 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont22"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont22 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont23"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont23 End Here-->
		
		
		 
 <!--popCont Starts Here-->

  <div class="popCont" id="popCont24"  style="height:540px!important;">
	<div class="col-md-12">
	<div class="row">
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Remote Technical Support & Training</h2>
				<p>Technical Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote Training & Technical Support - Telephone, Chat, Remote Login & WebEx<span>-</span></p>
				<p>Training & Technical Support - Onsite<span>-</span></p>
				
				
				
	    </div>
		</div>
		<div class="col-md-12">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
				<h2>Business Engineering Technology Support</h2>
				<p>Online Support - Forum, FAQ & Email<span>Free 24/7</span></p>
				<p>Remote BET Support<span>-</span></p>
				<p>BET Support - Onsite<span>-</span></p>
				
				
	    </div>	
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Application Integration(API)</h2>
		</div>
		</div>
		
		<div class="col-md-6">
		<div style="border:1px solid #ccc; padding:0px 0 10px 0; margin-bottom:30px;">
		<h2>Database Integration</h2>
		</div>
		</div>
    </div>
		 
    </div>
  </div>
	 	<!--popCont24 End Here-->
		
			
	<!--End Plan Basic!-->
	
	<!--Begin Plan Personal!-->
	<div class="col-md-3 klausbg hvr-float" style="width:20%!important;">
		<div class="klausheader">
		<h5>Silver</h5>
		<!--<span class="klaus_package">package</span>-->
		<span class="klaus_price skintwocolor">$299</span>
		<p>/per month</p>
		<span class="klaus_package">Billed annually or
    month-to-month </span>
	<div class="col-md-12 align" style="margin:15px 0 0 0;">
		<div><li style="list-style-type:none;"><a href="#" class="btn btn-success">Buy</a></li></div>
		</div>
		</div>
		
		<div class="klaus_features skintwoklaus_features">
		<h4>Features</h4>
		<li>
			<i class="fa fa-check-circle"></i><a href="javascript:void(0);" onClick="showPop('popCont5');">Student & Course Management</a>	</li>
		
		
			
			
		<li><i class="fa fa-check-circle"></i> 
	<a href="javascript:void(0);" onClick="showPop('popCont6');">Functional & Process Management</a>
	</li>
		<li><i class="fa fa-check-circle"></i> 
		<a href="javascript:void(0);" onClick="showPop('popCont7');">Business intelligence & Analytics</a>
		</li>
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont8');">Business Architecture Management</a></li>
		
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont9');">Product Training and Support</a></li>
		</div>	
		<!--
		<div class="klaus_getaquote skintwogetquote"><li><a href="#">GET A QUOTE</a></li></div>-->
	</div>
	<!--End Plan Personal!-->
	
	<!--Begin Plan Business!-->
	<div class="col-md-2 klausbg hvr-float" style="width:20%!important;">
		<div class="klausheader">
		<!--<div class="klaus_featured skintwobg">Featured</div>-->
		<h5>Gold</h5>
	<!--	<span class="klaus_package">package</span>-->
		<span class="klaus_price skintwocolor">$1249</span>
		<p>/per month</p>
		<span class="klaus_package">Billed annually or
    month-to-month </span>
	<div class="col-md-12 align" style="margin:15px 0 0 0;">
		<div><li style="list-style-type:none;"><a href="#" class="btn btn-success">Buy</a></li></div>
		</div>
		</div>
		
		<div class="klaus_features skintwoklaus_features">
		<h4>Features</h4>
		<li>
			<i class="fa fa-check-circle"></i><a href="javascript:void(0);" onClick="showPop('popCont10');">Student & Course Management</a>	</li>
		
		
			
			
		<li><i class="fa fa-check-circle"></i> 
	<a href="javascript:void(0);" onClick="showPop('popCont11');">Functional & Process Management</a>
	</li>
		<li><i class="fa fa-check-circle"></i> 
		<a href="javascript:void(0);" onClick="showPop('popCont12');">Business intelligence & Analytics</a>
		</li>
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont13');">Business Architecture Management</a></li>
		
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont14');">Product Training and Support</a></li>
		</div>	
		<!--
		<div class="klaus_getaquote skintwogetquote"><li><a href="#">GET A QUOTE</a></li></div>-->
	</div>
	<!--End Plan Business!-->
	
	<!--Begin Plan Ultimate!-->
	<div class="col-md-2 klausbg skintwoultimate hvr-float" style="width:20%!important;">
	
		<div class="klausheader skintwoucolor" style="background:#FF9933;">
		<h5>Platinum</h5>
		<!--<span class="klaus_package">package</span>-->
		<span class="klaus_price skintwocolor">$4999</span>
		<p>/per month</p>
		<span class="klaus_package">Billed annually or
    month-to-month </span>
	<div class="col-md-12 align" style="margin:15px 0 0 0;">
		<div><li style="list-style-type:none;"><a href="#" class="btn btn-success">Buy</a></li></div>
		</div>
		</div>
		
		<div class="klaus_features skintwoklaus_features">
		<h4>Features</h4>
		<li>
			<i class="fa fa-check-circle"></i><a href="javascript:void(0);" onClick="showPop('popCont15');">Student & Course Management</a>	</li>
		
		
			
			
		<li><i class="fa fa-check-circle"></i> 
	<a href="javascript:void(0);" onClick="showPop('popCont16');">Functional & Process Management</a>
	</li>
		<li><i class="fa fa-check-circle"></i> 
		<a href="javascript:void(0);" onClick="showPop('popCont17');">Business intelligence & Analytics</a>
		</li>
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont18');">Business Architecture Management</a></li>
		
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont19');">Product Training and Support</a></li>
		</div>	
		<!--
		<div class="klaus_getaquote skintwogetquote skintwoucolorget"><li><a href="#">GET A QUOTE</a></li></div>-->
	</div>
	<!--End Plan Ultimate!-->
	
	<div class="col-md-2 klausbg hvr-float" style="width:20%!important;">
		<div class="klausheader">
		<h5>Enterprise</h5>
	<!--	<span class="klaus_package">package</span>
		<span class="klaus_price skintwocolor">$99</span>
		<p>/per month</p>-->
		<div class="col-md-12 align" style="margin:15px 0 0 0;">
			<div><li style="list-style-type:none;"><a href="#" class="btn btn-success">Contact Us</a></li></div>
		</div>
		</div>
		
		<div class="klaus_features skintwoklaus_features">
		<h4>Features</h4>
		<li>
			<i class="fa fa-check-circle"></i><a href="javascript:void(0);" onClick="showPop('popCont20');">Student & Course Management</a>	</li>
		
		
			
			
		<li><i class="fa fa-check-circle"></i> 
	<a href="javascript:void(0);" onClick="showPop('popCont21');">Functional & Process Management</a>
	</li>
		<li><i class="fa fa-check-circle"></i> 
		<a href="javascript:void(0);" onClick="showPop('popCont22');">Business intelligence & Analytics</a>
		</li>
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont23');">Business Architecture Management</a></li>
		
		<li><i class="fa fa-check-circle"></i>
		<a href="javascript:void(0);" onClick="showPop('popCont24');">Product Training and Support</a></li>
		</div>	
		<!--
		<div class="klaus_getaquote skintwogetquote"><li><a href="#">GET A QUOTE</a></li></div>-->
	</div>

  </div>
<!--End Container!-->
<!--You Can Stop Copy Here!-->


</body>
</html>

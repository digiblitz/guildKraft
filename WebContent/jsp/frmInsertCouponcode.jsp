<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildkraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--script src="js/frmAdvertise.js" type="text/javascript" ></script-->
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->



<script src="js/jquery.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.maskedinput.js"></script> 
<script src="js/script.js"></script>
 
    	
<script type="text/javascript">
$(document).ready(function() {
	$("#coupon_name").blur(function(){        
		var a = $("#coupon_name").val();
		var b = a.trim();
		$("#coupon_name").val(b);
    });
	$("#coupon_des").blur(function(){        
		var a = $("#coupon_des").val();
		var b = a.trim();
		$("#coupon_des").val(b);
    });
	$("#coupon_offer").blur(function(){        
		var a = $("#coupon_offer").val();
		var b = a.trim();
		$("#coupon_offer").val(b);
    });
	$("#myform").validate({
			 			 
			rules: {
				coupon_name: "required",
				coupon_des:"required",
				coupon_offer:"required",
				
			},
			messages: {
				coupon_name: "Enter your coupon name",
				coupon_des:"Enter coupon Description",
				coupon_offer:"Enter the Offers",
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
#myform label.error {
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
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->

        <div id="hoeapp-container" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
		
			<div class="col-md-2 pad">
		
		<!--==============================include infobar Here=================================-->
		
            <%@ include file = "../../include/infobar.jsp" %>
			
		<!--==============================include infobar Here=================================-->
		
			</div>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
							<h2> Create Coupon Code</h2>
						</div>
					<!--==============================Form Title=================================-->


		<!--==============================================content start here============================================-->
	
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
						<form name="changePassword" id="myform" method="post" action="coupondetails.html?cmd=insertcoupon" onsubmit="return myvalidate(this);" >
						
						   <div class='form-group'>
									  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Coupon Code:</label>
											<div class='col-md-8'>
                                       			 <div class='col-md-3 indent-small'>
                                            			<div class='form-group internal'>
															<input type="text" name="coupon_name" id="coupon_name" class="form-control" size="18" />
															  <span id="span_astriesk">*</span>
														</div>
												</div>
									</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Description:</label>
											<div class='col-md-8'>
                                       			 <div class='col-md-3 indent-small'>
                                            			<div class='form-group internal'>
															<input type="text" name="coupon_des" id="coupon_des" class="form-control" size="18" />
															  <span id="span_astriesk">*</span>
														</div>
												</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Percentage of Offer:</label>
											<div class='col-md-8'>
                                       			 <div class='col-md-3 indent-small'>
                                            			<div class='form-group internal'>
															<input type="text" name="coupon_offer" id="coupon_offer" class="form-control" size="18" />
															  <span id="span_astriesk">*</span>
														</div>
												  </div>
											</div>
								</div>
                       <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="submit" type="submit"  value="Submit">Submit</button>
                                    </div>
									 <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'name="button" type="button"  onclick="javascript:history.back(-1);" value="cancel">cancel</button>
                                    </div>
								</div>
									
								</form>
							
                    					
	  
	  <!--==============================================import content code end here============================================-->
	  				</div>
				</div>
			</div>
		</div>
	  
	
<!--==============================================content end here============================================-->



        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
</body>
</html>

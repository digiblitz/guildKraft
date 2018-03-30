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
<title><%=(String)session.getAttribute("title")%></title>


<script src="js/jquery.js"></script>
<script src="js/jquery.validate.js"></script>


<script>
	$(document).ready(function() {
		
		
		$("#amount").blur(function(){  
			var a = $("#amount").val();
			var b = a.trim();
			$("#amount").val(b);
		});
		
		$("#card_type").blur(function(){  
			var a = $("#card_type").val();
			var b = a.trim();
			$("#card_type").val(b);
		});
		
		$("#card_no").blur(function(){  
			var a = $("#card_no").val();
			var b = a.trim();
			$("#card_no").val(b);
		});
		
		$("#cvv_no").blur(function(){  
			var a = $("#cvv_no").val();
			var b = a.trim();
			$("#cvv_no").val(b);
		});
		
		$("#card_name").blur(function(){  
			var a = $("#card_name").val();
			var b = a.trim();
			$("#card_name").val(b);
		});
		
		$("#expiry_month").blur(function(){  
			var a = $("#expiry_month").val();
			var b = a.trim();
			$("#expiry_month").val(b);
		});
		
		$("#expiry_year").blur(function(){  
			var a = $("#expiry_year").val();
			var b = a.trim();
			$("#expiry_year").val(b);
		});
		
		
		
	
		 $("#frmeventpay").validate({
			 			 
			rules: {
				amount:"required",
				card_type: "required",
				card_no: "required",
				cvv_no:"required",
				card_name:"required",		
				expiry_month:"required",
				expiry_year:"required",
			},
			messages: {
				amount:"Please enter the Amount.",
				card_type: "Please enter Card type.",
				card_no: "Please enter Card No.",
				cvv_no: "Please enter  CVV No.",
				card_name:"Please enter Card name",
				expiry_month: "Please enter Expiry month",
				country:"Please enter Country",
				expiry_year:"Please enter the Expiry year",			

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
	
	<style>
	label.error{
		color:red;
	}
	</style>



<script type="text/javascript">
$(document).ready(function() {
	$("#yes").click(function(){
		$("#yesno").hide();
		$("#fullpay").hide();
		$("#coupon").show();
	});
	$("#no").click(function(){
		
		$("#yesno").hide();
		$("#coupon").hide();
		$("#fullpay").show();
		
	});
	$("#btn").click(function(){
		$("#yesno").show();
		
		$("#coupon").hide();
		$("#fullpay").hide();
		
	});
	$("#btn1").click(function(){
		$("#yesno").show();
		
		$("#coupon").hide();
		$("#fullpay").hide();
		
	});
});

</script>


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
						<h2>Event Registration payment </h2>
						</div>
					<!--==============================Form Title=================================-->

<!--==============================================content start here============================================-->
    			 <div class='panel-body'>
        
        	
       
        
        	<p id="p_error">All * Fields are Mandatory.</p>
		
              <%String sessionuserid=(String)request.getAttribute("sessionuserid");
			  String user_id=(String)request.getAttribute("user_id");
              String event_title=(String)request.getAttribute("event_title");
              String start_date=(String)request.getAttribute("start_date");
              String end_date=(String)request.getAttribute("end_date");
              String amount=(String)request.getAttribute("amount");
              String fname=(String)request.getAttribute("firstname");
              String email=(String)request.getAttribute("email");
              String lname=(String)request.getAttribute("lastname");
              String city=(String)request.getAttribute("city");
              String state=(String)request.getAttribute("state");
              String country=(String)request.getAttribute("country");
              String institutename=(String)request.getAttribute("institutename");
              System.out.println("amount in jsp----->"+ amount);
              %>
       
       
   
              
               <div id="yesno">
               	<div class='form-group'>
                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Do you have any coupon offers:</label>
					     <div class='col-md-8' style="padding:10px 10px">
                               <div class='col-md-3 indent-small'>
                                    <div class='form-group internal'>
               
									 <input type="radio" name="yesno"  id="yes"  size="20" />Yes
                   					 <input type="radio" name="yesno"  id="no"  size="20" />No
                  
										
									</div>
								</div>
							</div>
						
                      </div>
            </div>
            <div id="fullpay" style="display:none"> 
            
           <form name="frmeventpay" id="frmeventpay" method="post" action="eventcal.html" class="form-horizontal">
        
        <input type="hidden" name="cmd" value="eventpaydet">
        
        <input type="hidden" name="user_id" value="<%=user_id%>">
	    <input type="hidden" name="event_title" value="<%=event_title%>">
	    <input type="hidden" name="start_date" value="<%=start_date%>">
	    <input type="hidden" name="end_date" value="<%=end_date%>">
	    <input type="hidden" name="firstname" value="<%=fname%>">
	    <input type="hidden" name="lastname" value="<%=lname%>">
	    <input type="hidden" name="email" value="<%=email%>">
	    <input type="hidden" name="state" value="<%=state%>">
	    <input type="hidden" name="city" value="<%=city%>">
	    <input type="hidden" name="institutename" value="<%=institutename%>">
		<input type="hidden" name="country" value="<%=country%>">
	    
				<p>Please fill up the following details to proceed for payment</p>
              	<div class='form-group' >
				<div style="padding: 25px 0px;"></div>
            	<div style="display:inline-block;width:100%">
            		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount($)</label>
					     <div class='col-md-8'>
                               <div class='col-md-3 indent-small'>
                                    <div class='form-group internal'> 
                                    	  <input type="text" name="amount" id="amount"  value="<%=amount%>"class="form-control" size="20" readonly/>
                                    	  
                                    	</div>
								</div>
							</div>
                    </div>
						
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-4 indent-small'>
                                      <div class='form-group internal'>
											<input type="radio" size="10" name="card_type" id="card_type" value="visa"  /><img src="images/visa.png" id="visa" name="visa" height="35px" width="50px"/>
										  <input type="radio" size="7" name="card_type" id="card_type" value="mastercard" align="center" /><img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
										   <input type="radio" size="8" name="card_type" id="card_type"value="amex"  /><img src="images/american.png" id="american" name="american" width="46px"/>
									 	</div>
									</div>
								</div>
							
							
					
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Credit Card No.:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="card_no" id="card_no" class='form-control' value="">
									 	</div>
									</div>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
										<input  type="text" name="cvv_no" id="cvv_no"  value=""  class='form-control'>
										<img src="images/cvv.png" id="cvv" name="visa" height="40px" width="62px" align=""/>
									 	</div>
									</div>
								</div>
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                <div class='col-md-8'>
                                    <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
									 <input  type="text" name="card_name" id="card_name" class='form-control' value="">
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
                     <div class="form-group">
						<div class="col-md-offset-4 col-md-1">
							 <button class='btn-lg btn-primary'  type="submit" name="Submit1" value="Register">Register</button>
             
						</div>
						<div class='col-md-2'>
				
						<button class="btn-lg btn-danger" name="button" style="margin-left:12px" type="button"  id="btn"   value="Cancel" >Cancel</button>
					</div>
							<div class="col-md-6 col-md-offset-7">
									<a href="https://www.paypal.com/us/verified/pal=paypal%40digiblitz%2ecom" target="_blank">
									<img src="https://www.paypal.com/en_US/i/icon/verification_seal.gif" border="0" alt="Official PayPal Seal"></a>
								<a href="#" onclick="window.open('https://www.sitelock.com/verify.php?site=digiblitz.com','SiteLock','width=600,height=600,left=160,top=170');" ><img alt="SiteLock" title="SiteLock" src="//shield.sitelock.com/shield/digiblitz.com" style="width:130px;height:82px"/>
								<img style="cursor:pointer;cursor:hand;width:150px;height:60px" src="https://seal.godaddy.com/images/3/en/siteseal_gd_3_h_l_m.gif" onclick="verifySeal();" alt="SSL site seal - click to verify">
								</a> 
								</div>
						
					</div>
             	</form>
              </div>
              
              
             
             <div id="coupon"  style="display:none">
             <form name="frmeventpay" id="frmeventpay" method="post" action="eventcal.html" class="form-horizontal">
        
				<input type="hidden" name="cmd" value="couponoffer">
				
				
				<input type="hidden" name="sessionuserid" id="sessionuserid" value="<%=sessionuserid%>"/>
				<input type="hidden" name="user_id" value="<%=user_id%>">
				<input type="hidden" name="event_title" value="<%=event_title%>">
				<input type="hidden" name="start_date" value="<%=start_date%>">
				<input type="hidden" name="end_date" value="<%=end_date%>">
				<input type="hidden" name="amount" value="<%=amount%>">
				<input type="hidden" name="firstname" value="<%=fname%>">
				<input type="hidden" name="lastname" value="<%=lname%>">
				<input type="hidden" name="email" value="<%=email%>">
				<input type="hidden" name="state" value="<%=state%>">
				<input type="hidden" name="city" value="<%=city%>">
				<input type="hidden" name="institutename" value="<%=institutename%>">
				<input type="hidden" name="country" value="<%=country%>">
				
			<% String status=(String)request.getAttribute("status");
               System.out.println("status in applycoupon jsp------>"+ status);
                if(status !=null){
             	  %>
             	   
             	   <p><font color="#FF0000">Sorry, your coupon code does not match!</font></p> 
               <%} %>
			 <div class="form-group" >
			 <div style="padding: 25px 0px"></div>
			 	<div style="display:inline-block;width:100%">
              		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Enter the coupon no.:</label>
					     <div class='col-md-8'>
                               <div class='col-md-3 indent-small'>
                                    <div class='form-group internal'> 
                                    	 <input type="text" name="coupon" id="coupon"  class="form-control" size="20" />
                                    </div>
								</div>
							</div>
              		</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-4 col-md-1">
							 <button class='btn-lg btn-primary'  type="submit" name="Submit1" value="Register">Register</button>
             
						</div>
						<div class='col-md-2'>
				
						<button class="btn-lg btn-danger" name="button" style="margin-left:12px" type="button"  id="btn1"   value="Cancel" >Cancel</button>
					</div>
						
					</div>
				
              </div>
        	
        		
      		</div>
      	</div>
      </div>
     </div>
    </div>
  </div>
  
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               

  


</body>
</html>

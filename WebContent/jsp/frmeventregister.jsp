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


<script src="js/scripts.js"></script>
<script src="js/jquery.js"></script>
<script src="js/lib/jquery.mockjax.js"></script>
<script src="js/dist/jquery.validate.js"></script>




<script>
	$(document).ready(function() {
		
		
		
		$("#fname").blur(function(){  
			var a = $("#fname").val();
			var b = a.trim();
			$("#fname").val(b);
		});
		
		$("#lname").blur(function(){  
			var a = $("#lname").val();
			var b = a.trim();
			$("#lname").val(b);
		});
		
		$("#email").blur(function(){  
			var a = $("#email").val();
			var b = a.trim();
			$("#email").val(b);
		});
		
		$("#institute_name").blur(function(){  
			var a = $("#institute_name").val();
			var b = a.trim();
			$("#institute_name").val(b);
		});
		
		$("#city").blur(function(){  
			var a = $("#city").val();
			var b = a.trim();
			$("#city").val(b);
		});
		
		$("#state").blur(function(){  
			var a = $("#state").val();
			var b = a.trim();
			$("#state").val(b);
		});
		
		$("#city").blur(function(){  
			var a = $("#city").val();
			var b = a.trim();
			$("#city").val(b);
		});
		
		$("#country").blur(function(){  
			var a = $("#country").val();
			var b = a.trim();
			$("#country").val(b);
		});
		
	
   
	 
	
		 $("#frmeventreg").validate({
			 			 
			rules: {
				fname: "required",
				lname: "required",
				
				email: {
					required: true,
					email:true					
				},
				
				
				state:{
					required: true	
				},				
				city:{
					required:true
				},
				country:{                                                       
					required:true,
					
				},
				institute_name:{
						required:true
				},		
				
			},
			messages: {
				fname: "Enter your firstname",
				lname: "Enter your lastname",
				email: "Please enter a valid email",
				state:"Enter your state",
				city: "Please enter city",
				country:"Please enter Country",
				institute_name:"Enter the institution name",			

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
						<h2>Event Registration </h2>
						</div>
					<!--==============================Form Title=================================-->

<!--==============================================content start here============================================-->
    			 <div class='panel-body'>
        
        	<%String user_id=(String)request.getAttribute("user_id"); %>
       
       		 
		  <p id="p_error">All * Fields are Mandatory.</p>
             
       
       
        <form name="frmeventreg" id="frmeventreg" method="post" action="./eventcal.html"  >
        	<input type="hidden" name="cmd" value="usreventdet">
			<input type="hidden" name="user_id" value="<%=user_id%>">
        
	        <%
	        	String event_title = (String)request.getAttribute("title");
	          	String start_date =(String)request.getAttribute("sdate");
	          	String end_date =(String)request.getAttribute("edate");	
	          	String amount=(String)request.getAttribute("amount");
				
        %>
        
						<div class='form-group'>
                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
               
										<input type="text" name="event_title" id="event_title" value="<%=event_title%>" class="form-control" size="20" readonly/>
                  
										
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Start Date:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                               <input type="text" name="startdate" id="startdate" value="<%=start_date%>" class="form-control" size="20" readonly/>
												
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>End Date:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                              <input type="text" name="enddate" id="enddate" value="<%=end_date%>" class="form-control" size="20" readonly/>
												
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Amount:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                              <input type="text" name="amount" id="amount" value="<%=amount%>" class="form-control" size="20" readonly/>
												
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                             <input type="text" name="fname" id="fname" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
							
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                            <input type="text" name="lname" id="lname" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email-ID</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                            <input type="text" name="email" id="email" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Institute Name</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                            <input type="text" name="institute_name" id="institute_name" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
								
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                           <input type="text" name="city" id="city" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
							
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                             <input type="text" name="state" id="state" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country</label>
							   <div class='col-md-8'>
                                   <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
                                          <input type="text" name="country" id="country" class="form-control" size="20"/>
												
										</div>
									</div>
								</div>
								
								
								

					<div class="form-group">
						<div class="col-md-offset-4 col-md-1">
							 <button class='btn-lg btn-primary'  type="submit" name="Submit" value="Continue">Continue</button>
             
						</div>
					</div>
             
       
        </form>
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

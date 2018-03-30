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
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmRolMgtCreatePriv.js" type="text/javascript" ></script>
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">


		<%	
				
				ArrayList details=(ArrayList)request.getAttribute("customerdetails");

  

 	Iterator cus_det=details.iterator();
	 while(cus_det.hasNext()){
				 String customerdetails[]=(String[]) cus_det.next();
				String  first_name = customerdetails[0];
				String   last_name = customerdetails[1];;
				String  e_mail =customerdetails[2];
				String   mobile = customerdetails[3];
				String  institution_name = customerdetails[4];;
				String  country = customerdetails[5];
				String  state = customerdetails[6];
				String  city = customerdetails[7];
				String  credit_card_type = customerdetails[8];
				String  credit_card_no =customerdetails[9];
				String cvv_no = customerdetails[10];
				String  name_on_card = customerdetails[11];
				String expiry_date =customerdetails[12];
				String registration_id = customerdetails[13]; 
				String  user_id = customerdetails[14];
				String  product_price = customerdetails[15];
				String  subscription_id = customerdetails[16];
				String  order_id = customerdetails[17];
				String  reg_date = customerdetails[18];
				String  Product_plan = customerdetails[19];
			      String   subscription_plan = customerdetails[20];
			      String  amount =customerdetails[21];
	 
	%>
	

  
  
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
						
						<h2>Customer Details:</h2>
						
						</div>
						
				<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
			
                      <input name="roleProcess" type="hidden" value="insertPriv" />
					  
					  <div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" name="firstname" id="firstname" class="form-control" value="<%=first_name%>">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
 					
					 <div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
 											   <input  type="text" name="lastname" id="lastname" class="form-control" value="<%=last_name %>">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
					
					 <div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" name="email" id="email" class="form-control" value="<%=e_mail%>" onChange="ValidateEmail('email');">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
					
						 <div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												 <input  type="text" name="mobileno" class="form-control" id="mobileno"  value="<%=mobile%>">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
					
						 <div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Institution Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" name="institutionName" class="form-control" id="institutionName"  value="<%=institution_name%>">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
					
					 		<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												  <input  type="text" name="country" class="form-control" id="country"  value="<%=country%>">
										   </div>
										 </div>
									 </div>
								</div>

 

						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" name="state" class="form-control" id="state"  value="<%=state%>">
										   </div>
										 </div>
									 </div>
								</div>
								
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												   <input  type="text" name="city" class="form-control" id="city"  value="<%=city%>">
												<span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Plan:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												  <input  type="text" name="payment_plan" class="form-control" id="payment_plan"  value="<%=Product_plan%>">
										   </div>
										 </div>
									 </div>
								</div>
					
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Plan:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  											<input  type="text" name="subs_plan" class="form-control" id="subs_plan" value="<%=subscription_plan%>">
										   </div>
										 </div>
									 </div>
								</div>
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												 <input type="text" class="form-control" name="credit_card_type" value="<%=credit_card_type%>">
										   </div>
										 </div>
									 </div>
								</div>
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Credit Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												  <input  type="text" name="credit_card_no" class="form-control" id="credit_card_no"  value="<%=credit_card_no%>">
												  <span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" class="form-control" name="cvv_no" id="cvv_no"  value="<%=cvv_no %>">
										   </div>
										 </div>
									 </div>
								</div>
					
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" class="form-control" name="user_id" id="user_id"  value="<%=user_id %>">
										   </div>
										 </div>
									 </div>
								</div>
 						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" class="form-control" name="reg_id" id="reg_id"  value="<%=registration_id %>" >
										   </div>
										 </div>
									 </div>
								</div>
 
 						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Order Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												 <input  type="text" class="form-control"  name="order_id" id="order_id"  value="<%=order_id %>">
										   </div>
										 </div>
									 </div>
								</div>
 
 						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												 <input  type="text" class="form-control" name="subs_id" id="subs_id"  value="<%=subscription_id %>">
										   </div>
										 </div>
									 </div>
								</div>
								
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												 <input  type="text" class="form-control"  name="name_on_card" id="name_on_card"  value="<%=name_on_card%>">
												 <span id="span_astriesk">*</span>
										   </div>
										 </div>
									 </div>
								</div>
 
 						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" class="form-control" name="reg_date" id="reg_date"  value="<%=reg_date %>" >
										   </div>
										 </div>
									 </div>
								</div>
						
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												<input  type="text" class="form-control" name="amount" id="amount"  value="<%=amount %>">
										   </div>
										 </div>
									 </div>
								</div>
								
						<div class='form-group'>
                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
  												  <input  type="text" class="form-control" name="expiry_date" id="expiry_date"  value="<%= expiry_date%>">
												   <span id="span_astriesk">*</span>

										   </div>
										 </div>
									 </div>
				<% } %>				</div>
							
							 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="submit" value="Update">Update</button>
                                    </div>
									<div class='col-md-2'>
                                        <button class='btn-lg btn-danger'  name="button" type="reset" value="Cancel" style=''>Cancel</button>
                                    </div>
                               </div>
 
                   </form>
             <!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				
            </div>
			
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        </div>
		
    </div>
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>

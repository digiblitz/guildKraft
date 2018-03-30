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
					
					
						
                        <div class='panel-body'>
						
					<%
						String MasterUser_id=(String)session.getAttribute("MasterUserId"); 
						 String amount=(String)request.getAttribute("memfee");
						 String mem_type_id=(String)request.getAttribute("mem_type_id");
						 String memberId=(String)request.getAttribute("memberId");
						 String mem_type_name = (String)request.getAttribute("mem_type_name");
						 System.out.println("amount in jsp :::::::::::::::::::::: "+amount);
						 System.out.println("mem_type_id in jsp :::::::::::::::::::::: "+mem_type_id);
						 System.out.println("memberId in jsp :::::::::::::::::::::: "+memberId);
						 System.out.println("mem_type_name in jsp :::::::::::::::::::::: "+mem_type_name);
						 
						 System.out.println("MasterUser_id in jsp :::::::::::::::::::::: "+MasterUser_id);
						 
						 
						 //---------------------------bdtg changes--------------------------
						 String membership_type_id=(String)request.getAttribute("membership_type_id"); 
						 String membership_type_name=(String)request.getAttribute("membership_type_name");
						  memberId=(String)request.getAttribute("memberId");
						 
					%>     
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  id="form" width="800px" name="insert" align="center" action="insertMembershipReg.html?preMembProc=signup" method="post" onSubmit="return onValidate();">
							
                              	<input type="hidden" name="amount" id="amount" value="<%=amount%>">
								 <input type="hidden" name="mem_type_id" id="mem_type_id" value="<%=mem_type_id%>">
								 <input type="hidden" name="memberId" id="memberId" value="<%=memberId%>">
								 <input type="hidden" name="mem_type_name" id="mem_type_name" value="<%=mem_type_name%>">
								 <input type="hidden" name="MasterUser_id" id="MasterUser_id" value="<%=MasterUser_id%>">
								 
								 <!------------------------- bdtg changes----------------------->
								 <input type="hidden" name="membership_type_id" id="membership_type_id" value="<%=membership_type_id%>">
								 <input type="hidden" name="membership_type_name" id="membership_type_name" value="<%=membership_type_name%>">
								 <input type="hidden" name="memberId" id="memberId" value="<%=memberId%>">
								 
								  <div class='panel-heading'>
									<h2>Registration Form </h2>
								</div>
								
								<p class="text_9 color_2">* All fields are mandatory.</p>
								
                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input  type="text" name="firstname" id="firstname"   class="form-control" value="">
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
                                               <input  type="text" name="email" id="email" class="form-control" value="" onChange="ValidateEmail('email');"> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input  type="text" name="mobileno" id="mobileno" class="form-control"  value="">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address Line1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                 <input  type="text" name="addrline1" id="addrline1" class="form-control" value="">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address Line2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input  type="text" name="addrline2" id="addrline2" class="form-control" value=""> 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');"class="form-control">
  
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
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input  type="text" name="total_amount" id="total_amount" class="form-control" value="<%=amount%>">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="radio" size="10" name="credit_card_type" id="credit_card_type" value="visa"  /><img src="images/visa.png" id="visa" name="visa" height="35px" width="50px"/>
  <input type="radio" size="7" name="credit_card_type" id="credit_card_type" value="mastercard" align="center" /><img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
   <input type="radio" size="8" name="credit_card_type" id="credit_card_type"value="amex"  /><img src="images/american.png" id="american" name="american" height="15px" width="46px"/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Credit Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="credit_card_no" id="credit_card_no" class="form-control" value="">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>CVV:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="cvv_no" id="cvv_no"  value="" class="form-control">
  												<img src="images/cvv.png" id="visa" name="visa" height="65px" width="62px" align=""/>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input  type="text" name="name_on_card" id="name_on_card" class="form-control" value="">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="expiry_month" id="expiry_month" class="form-control" >
													  <option value="">Month</option>
													  <option value="1">January</option>
													  <option value="2">February</option>
													  <option value="3">March</option>
													  <option value="4">April</option>
													  <option value="5">May</option>
													  <option value="6">June</option>
													  <option value="7">July</option>
													  <option value="8">August</option>
													  <option value="9">September</option>
													  <option value="10">October</option>
													  <option value="11">November</option>
													 <option value="12">December</option>
													  </select>
													  <select name="expiry_year" id="expiry_year" class="form-control">
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
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Declaration:</label>
								<div class="col-md-offset-2">
								<input type="checkbox" name="agree" onClick="return validate(this);"/>
								I Hereby Declare that all the Statements made by me in the Application from and Information sheet are true and complete to the best of my knowledge.
								</div>
							</div>
								

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="Insert" value="Proceed" id="submit" onClick="return(onValidate());">Proceed</button>
										
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="button" type="button" onClick="javascript:history.back(-1);" value="Cancel">Cancel</button>
										
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
			
<script language="javascript">
	FillCountry(document.insert.country, document.insert.state, 'USA' );
	FillState(document.insert.country, document.insert.state, '');

	FillCountry(document.insert.scountry_txt, document.insert.sstate_txt, 'USA' );
	FillState(document.insert.scountry_txt, document.insert.sstate_txt, '');
    
	
	
</script>
			
</body>

</html>

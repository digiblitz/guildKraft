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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>

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
                            <h2>Meetings: Application for ICP Assessment</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeeICPAssessment" id="myform" action="">
							
                              <div class='form-group'>
							  	<div class='col-md-8'>
								
									<div class='col-md-2' onclick="naviTab('1')">
										
										<a id="link1" href="javascript:void(0);" class="active">Part A</a>
										
									</div>
									
									<div class='col-md-2' onclick="naviTab('2')">
										<a id="link2" href="javascript:void(0);" class="inactive">Part B</a>
										
									</div>
										
									<div class='col-md-2' onclick="naviTab('3')">
										<a id="link3" href="javascript:void(0);" class="inactive">Part C</a>
										
									</div>
										
									<div class='col-md-2' onclick="naviTab('4')">
										<a id="link4" href="javascript:void(0);" class="inactive">Part D</a>
										
									</div>
									
								</div>
							</div>
							
							<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ICP Assessment Details:</label>
							</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assesmant Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host IP:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div> <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div> <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div> <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="select5" id="select7" class="form-control" onchange="dispVal('planDisp', 'amount_txt');">
												<option selected="selected">Select One</option>
												<option>Four-Color Ads</option>
												<option>Black &amp; White Ads</option>
											  </select> 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="select6" id="select8" class="form-control" onchange="dispVal('planDisp', 'amount_txt');">
												<option selected="selected">Select One</option>
												<option>Four-Color Ads</option>
												<option>Black &amp; White Ads</option>
											  </select> 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Asses Detail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <textarea name="textfield" class="textAreaOne"></textarea>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Type Of Activity :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="select7" id="select2" class="form-control">
												<option selected="selected">Select One</option>
												<option value="FL">FL</option>
												<option value="VA">VA</option>
											  </select>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If other, Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" name="textfield374" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fee To Be Charged:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              $</strong> <input name="textfield372" type="text" class="form-control"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Instructor(s)/Coach(es): </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" name="textfield374" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-5 indent-small'>
                                            <div class='form-group internal'>
                                             	 <input type="checkbox" name="checkbox2" value="checkbox" />Cross-Country Schooling
												<input type="checkbox" name="checkbox3" value="checkbox" />	Riding Clinic
												<input type="checkbox" name="checkbox4" value="checkbox" />	Stablity
												<input type="checkbox" name="checkbox5" value="checkbox" />	Other	
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If Other Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" name="textfield374" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Publicity And Mailing List:</label>
								</div>
								
								<p>User, please take your time and register to avail the privileges that accompanies with it.</p>
								<p>  Note:This registration process does not make you a member.
							  You may become an Member by filling up the Membership Application form towards the end of this registration process.</p>
							  
							  
							  
							  <div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email logo (JPEG):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" name="textfield33" /> (For Publicity Use Only)
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Complimentary Mailing List Format:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="radiobutton" type="radio" value="radiobutton" />Electronic .csv file
											<input name="radiobutton" type="radio" value="radiobutton" />Hard Copy 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Send Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input name="radiobutton" type="radio" value="radiobutton" />Areas
											<input name="radiobutton" type="radio" value="radiobutton" />States
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sort Mailing List by :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           	<input name="radiobutton" type="radio" value="radiobutton" />Zip
											<input name="radiobutton" type="radio" value="radiobutton" />Alpha by last name
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number of copies of the colour brochure :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" name="textfield37" />
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								
								<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
								</div>
								
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="textfield34" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="textfield35" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="textfield36" />
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <select name="select2" id="select" class="form-control">
											<option selected="selected">Select One</option>
											<option>Country one</option>
											<option>Country Two</option>
											<option>Country Three</option>
											<option>Country Four</option>
										  </select>	
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <select name="select2" id="select" class="form-control">
											<option selected="selected">Select One</option>
											<option>State one</option>
											<option>State Two</option>
											<option>State Three</option>
											<option>State Four</option>
										  </select>	
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="textfield37" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Tel:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" name="textfield36" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         <input type="text" class="form-control" name="textfield37">
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="textfield37">
                                            </div>
                                        </div>

                                    </div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" name="textfield37">
                                            </div>
                                        </div>

                                    </div>
									
									<div class='form-group'>
										<div class='col-md-offset-2'>
										<input type="checkbox" name="checkbox" value="checkbox" />
										Check if Additional Sites are to be used.
									</div>
								</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload Additional Site Information:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          	<input type="file" name="file" class="btn_tbl text_3 color_3" />
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								<div class='form-group'>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>ACCEPTANCE OF TERMS:</label>
									
									<div class='col-md-offset-2'>
									<p> I have read the Requirements for the Educational Activity written on the reverse of this
								  Application, and the Release Form. 
								  I understand those Requirements and terms and the responsibility I accept as a
								  educational activity organizer. I agree as a condition of registration of this activity to adhere to those conditions
								  and to pay the appropriate fees.</p>
								  </div>
								
							</div>
								
								
								<div class='form-group'>
										<div class='col-md-offset-2'>
										 <input type="checkbox" name="checkbox6" value="checkbox" /> I Accept
									</div>
								</div>
								
								<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Information:</label>
								</div>
								
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		$<input type="text" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
									
							<div class='form-group'>
							<div class='col-md-offset-2'>
							<input type="radio" size="10" name="amt" value="check" checked="checked" onclick="switchDiv('chkEnc'), showHideRadio('amt','chrgCrd','check');" /> Check enclosed.				 	
									
							<input type="radio" size="10" name="amt" value="card" onclick="switchDiv('chrgCrd'), showHideRadio('amt','chkEnc','card');" /> Please charge my card.	
							</div>
									
                              
							  <div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Details:</label>
								</div>
								   
								<div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control"  />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>In Favor Of:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								<div class='form-group'>
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Details:</label>
								</div>
								
								  <div class='form-group'>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<select name="select" id="select" class="form-control">
													  <option selected="selected">Select One</option>
													  <option>Visa</option>
													  <option>Master Card</option>
													  <option>AmEx</option>
													</select>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<input type="text" class="form-control"/>
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          		<select name="expirymonth" id="select" class="selectboxOne">
													  <option value="" selected="selected">Month</option>
													  <option value="01">January</option>
													  <option value="02">February</option>
													  <option value="03">March</option>
													  <option value="04">April</option>
													  <option value="05">May</option>
													  <option value="06">June</option>
													  <option value="07">July</option>
													  <option value="08">August</option>
													  <option value="09">September</option>
													  <option value="10">October</option>
													  <option value="11">November</option>
													  <option value="12">December</option>
													</select>
													<select name="expiryyear" id="select" class="selectboxOne">
														  <option value="" selected="selected" >Year</option>
														  <option  value="2006">2006</option>
														  <option  value="2007">2007</option>
														  <option  value="2008">2008</option>
														  <option  value="2009">2009</option>
														  <option  value="2010">2010</option>
														  <option  value="2011">2011</option>
														  <option  value="2012">2012</option>
														  <option  value="2013">2013</option>
														  <option  value="2014">2014</option>
														  <option  value="2015">2015</option>
													</select>
													
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>	

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
										
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

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
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/frmMeeICPAssessmentRegi.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script  src="js/ts_picker.js"></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
<script src="js/datetimepicker_css.js"></script>


</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="cardclear();">

<script type="text/javascript">

var httpRequest;

   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
var arHttpRequest;
var req;
     function details(){
		 param = document.frmMeeICPAssessment.hostid.value;
		
			var  url = null;
			if(param.length==0){
				alert('Host Id cannot be empty');
				//document.frmMeeICPAssessment.hostid.focus();
				return false;
			}
			url = "UsrSignupAjax.html?cmd=memberDetail&memberId="+param;
			 
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			req.onreadystatechange = processRider;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processRider(){ 
    			if (req.readyState == 4){ 
							if(req.status == 200){ 
							 // alert("inside :"+req.status);
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
								  	//var prefix =xmlDoc.getElementsByTagName('prefix')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var address1 =xmlDoc.getElementsByTagName('address1')[0].childNodes[0].nodeValue; 
									var country =xmlDoc.getElementsByTagName('country')[0].childNodes[0].nodeValue; 
									//var hostId =xmlDoc.getElementsByTagName('hostId')[0].childNodes[0].nodeValue; 
									var state =xmlDoc.getElementsByTagName('state')[0].childNodes[0].nodeValue; 	
 									var city =xmlDoc.getElementsByTagName('city')[0].childNodes[0].nodeValue; 		
									var zip =xmlDoc.getElementsByTagName('zip')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 									
									var emailId =xmlDoc.getElementsByTagName('emailId')[0].childNodes[0].nodeValue; 									
 									var prefix =xmlDoc.getElementsByTagName('prefix')[0].childNodes[0].nodeValue; 
									var mobile =xmlDoc.getElementsByTagName('mobile')[0].childNodes[0].nodeValue; 
									
									firstNameObj = document.getElementById("riderFname_id");
								    lastNameObj = document.getElementById("riderLname_id");
									phoneObj = document.getElementById("riderPhone_id"); 
							       // hostObj = document.getElementById("hostid"); 
									emailIdObj = document.getElementById("rEmail");  
									address1Obj = document.getElementById("rStreet");  								 
								    cityObj = document.getElementById("rCity");  
									countryObj = document.getElementById("countryId");  
									stateObj = document.getElementById("rState");  									 
									zipObj = document.getElementById("rZipcode");  
									var mobileObj = document.getElementById("rCell");  
									prefixObj = document.getElementById("rprefix");
								// alert(firstName+"  "+lastName+"  "+address1+" "+country+" "+city+" "+state+" "+zip+" "+phone+" "+emailId+" "+prefix);
									firstNameObj.value =  firstName;
									lastNameObj.value = lastName ;
									phoneObj.value = phone ; 
									prefixObj.value =  prefix;  
									emailIdObj.value = emailId ;  
									address1Obj.value =  address1;  
									cityObj.value = city ;  
									stateObj.value = state ;  
									countryObj.value=country;
									zipObj.value = zip ;  
								//	hostObj.value=hostId;
									mobileObj.value = mobile ;  
							} 
											if(req.status==500) {
												clearRider();
												alert("Membership Id is not valid");
												//addiRider();
												document.frmMeeICPAssessment.hostid.focus();
											}
											else{ 
											} 
						}	
					} 
function clearRider(){				
		document.getElementById("hostid").value = "";
		document.getElementById("riderFname_id").value = "";
		document.getElementById("riderLname_id").value = "";
		document.getElementById("rprefix").value = "";
		document.getElementById("rStreet").value="";
		document.getElementById("countryId").value="";
		document.getElementById("rEmail").value = ""; 
		document.getElementById("phone").value = "";
		document.getElementById("rCity").value = "";
		document.getElementById("rState").value = ""; 
		document.getElementById("rZipcode").value = "";  
		document.getElementById("rCell").value = ""; 
}



</script>


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
							
                            <form class='form-horizontal' role='form' name="frmMeeICPAssessment" id="myform" method="post" action="IcpOrgRegFrm.html" onsubmit="return myvalidate();">
							  <div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ICP Assessment Details:</label>
							  </div>
							  
							   <input type="hidden" name="process" value="insert" />

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessment Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" name="assesLevel" id="assesmant" class="form-control"  /> 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="dat" type="text" readonly="true" class="form-control" id="date"  />
											 <a onclick="javascript:NewCssCal('date')"><i id="calendar1" class="fa fa-calendar"></i></a>
											 	
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="days" id="select71" class="selectboxOne" onchange="price();">
													<option selected="selected">Nos.</option>
													<option value="1">01</option>
													<option value="2">02</option>
													<option value="3">03</option>
													<option value="4">04</option>
													<option value="5">05</option>
													<option value="6">06</option>
													<option value="7">07</option>
													<option value="8">08</option>
													<option value="9">09</option>
													<option value="10">10</option>
													<option value="11">11</option>
													<option value="12">12</option>
													<option value="13">13</option>
													<option value="14">14</option>
													<option value="15">15</option>
													<option value="16">16</option>
													<option value="17">17</option>
													<option value="18">18</option>
													<option value="19">19</option>
													<option value="20">20</option>
													<option value="21">21</option>
													<option value="22">22</option>
													<option value="23">23</option>
													<option value="24">24</option>
													<option value="25">25</option>
													<option value="26">26</option>
													<option value="27">27</option>
													<option value="28">28</option>
													<option value="29">29</option>
													<option value="30">30</option>
													<option value="31">31</option>
												 </select> 
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <select name="hlcArea" id="select72" class="selectboxOne">
												<option selected="selected">---Select One---</option>
												<%
												Vector area=new Vector(); 
												area=(Vector)request.getAttribute("area");
												System.out.println("size :"+area.size());
																
												if(area!=null && area.size()!=0)
												{
													  Enumeration en=area.elements();    
																	
												while(en.hasMoreElements())
												{
													   String[] icpVal = (String[])en.nextElement();
													 
											   %>
												 <option value="<%=icpVal[0]%>"><%=icpVal[2]%></option>								
											
											 <%}}%>
											</select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="location" id="location" class="form-control"  />  
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
								<input type="hidden" name="fname" id="firstName"/>
								  <input type="hidden" name="phone" id="firstName"/>
								  <input type="hidden" name="lname" id="lastName"/>
								  <input name="addr" type="hidden" id="address1"/>
								  <input type="hidden" name="ctry" id="country"/>
								  <input type="hidden" name="state" id="state"/>
								  <input type="hidden" name="city" id="city"/>
								  <input name="zip" type="hidden"  id="zip"/> 
								  <input name="fax" type="hidden"  id="fax" /> 
								  <input name="email" type="hidden" id="email" />
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host Id(Member ID):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" class="form-control" name="hostid" id="hostid" onblur="details();"  />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" name="rprefix" id="rprefix" readonly="true" class="form-control"  />
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" readonly="true"  name="riderFname_id" id="riderFname_id"  />
                                            </div>
                                        </div>

                                    </div><label class='control-label col-md-2 col-md-offset-2' for='id_title'>Organizer Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="text" class="form-control" readonly="true"  name="riderLname_id" id="riderLname_id" />
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text"  class="form-control"  readonly="true" name="rStreet" id="rStreet" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="form-control" readonly="true" name="countryId" id="countryId"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="rState" id="rState"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="rCity" id="rCity"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="rZipcode" id="rZipcode"  />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" class="form-control" readonly="true" name="riderPhone_id" id="riderPhone_id" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input type="text" class="fom-control" readonly="true" name="rCell" id="rCell" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" class="form-control" readonly="true" name="rEmail" id="rEmail" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessor Detail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <textarea name="acessdet" id="txtarea"  class="textAreaOne" rows="5" ></textarea>
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-5 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="checkbox" name="cctry" id="ctry" value="Cross-Country Schooling" />	Cross-Country Schooling
											<input type="checkbox" name="rclinic" id="rclinic" value="Riding Clinic" />	Riding Clinic
											<input type="checkbox" name="stab" id="stab" value="Stablity" />	Stablity
											<input type="checkbox" name="cbx_other" id="Otherchckbx" value="others" onChange="isOtherscheck();" />	Other
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If Other Specify:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                          <input type="text" class="form-control" disabled="disabled" id="txtOther" name="others" />
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
							<div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
							  </div>
							  
							<div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="lownernam" id="name1" />
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="busname" id="bizname"/>
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="laddr" id="address" />
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	 <select name="ctry_sel" id="select11" class="form-control" onChange="FillState(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21, '');">
											<option selected="selected">Select One</option>
										  </select>
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<select name="stat_sel" id="select21" class="form-control" > 
												<option selected="selected">Select One</option>
											  </select>		
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="lcity" id="city2" />
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="lzip" id="zip2"/>
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="lph" id="phone2"/>
											 <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" class="form-control" name="lfax" id="fax2" />
											 
                                            </div>
                                        </div>

                                    </div>
                                </div>
								
								 <div class='form-group'>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ACCEPTANCE OF TERMS:</label>
								 </div>
								 
								 <p>I have read the Requirements for the ICP Activity written on the reverse of this
								  Application, and the Release Form.
								  I understand those Requirements and terms and the responsibility I accept as a
								  ICP organizer. I agree as a condition of registration of this activity to adhere to those conditions
								  and to pay the appropriate fees.</p>	
								
							  	<div class='form-group'>
									<div class='col-md-offset-2'>
									  <input type="checkbox" name="checkbox6" id="acceptterm" value="checkbox" /> I Accept the terms and conditions.
									   <span id="span_astriesk">*</span>
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
                                         	<strong>$</strong> <input name="tot_amt" type="text" readonly="true" id="txtamount" value="0" class="form-control" />
											<span id="span_astriesk">*</span>
											 
                                            </div>
                                        </div>

                                    </div>
								
                                </div>
								
								<div class='form-group'>
									<div class='col-md-offset-2'>
									<input type="radio" size="10" name="payment" id="r11" value="check" onclick="switchDiv('chkEnc'), showHideRadio('r11','chrgCrd','check'), cardclear();" /> Check enclosed.				 
									
									<input type="radio" size="10" name="payment" id="r11" value="card" checked="checked" onclick="switchDiv('chrgCrd'), showHideRadio('r11','chkEnc','card'), checkclear();" /> Please charge my card.		
									</div>
								</div>
								
								<div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Details:</label>
							  </div>
							  
							  <div class='form-group'>
							  	<div class='col-md-offset-2'>
								 <p>If paying by check please mail your payment to:  <br />
												
												    ICP Registration
												    <br />
												    525 Old Waterford Road NW
												    <br />
												    Leesburg, VA 20176												    
												    <br />
											        Note: Your registration status will be pending until check is processed.<p>		
								</div>
							</div>
							
							<div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="chkno" id="txtChNumber" class="form-control"  />
											<span id="span_astriesk">*</span>
											 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="chkdat" id="checkDate" class="form-control" readonly="true"  />
											  <a onclick="javascript:NewCssCal('checkDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
											<span id="span_astriesk">*</span>
											 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="infav" id="inFavorof" class="form-control"/>
											<span id="span_astriesk">*</span>
											 
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name On Check:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="nameCheck" id="nameCheck" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
								
                                </div>
								
								<div class='form-group'>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Details:</label>
							  </div>
								
								<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<select name="ctyp" id="ccTypeId" class="form-control">
													  <option selected="selected">Select One</option>
													  <option value="Visa">Visa</option>
													  <option value="Master Card">Master Card</option>
													  <option value="AmEx">AmEx</option>
													</select>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input name="cardno" type="text" id="txtCard" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card CVV No.:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="cvvno" id="txtCvvId" class="form-control" />
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Print Name On Card:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<input type="text" name="pname" id="txtPrName" class="form-control"/>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                         	<select name="expirymonth" id="selExpMonthId" class="form-control">
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
													<select name="expiryyear" id="selExpYearId" class="from-control">
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
                                        <button class='btn-lg btn-primary' type='submit'  value="Submit">Submit</button>
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

<script>
	FillCountry(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21, '---Select---');
	FillState(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21, '');
</script>

</html>

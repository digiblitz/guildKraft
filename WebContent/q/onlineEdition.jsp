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
    <title>Home</title>

   <script src="js/basic.js" type="text/javascript" ></script>
   <script src="js/cscombo_new.js" type="text/javascript" ></script>

   <script type="text/javascript">

function onValidate()
{
	var x = document.forms["insert"]["firstname"].value;
    if (x == null || x == "") {
        alert("firstname must be filled out");
        return false;
    }
	var y = document.forms["insert"]["lastname"].value;
    if (y == null || y == "") {
        alert("lastname must be filled out");
        return false;
    }
	var z = document.forms["insert"]["email"].value;
    if (z == null || z == "") {
        alert("email must be filled out");
        return false;
    }
	var a = document.forms["insert"]["mobileno"].value;
    if (a == null || a == "") {
        alert("mobileno must be filled out");
        return false;
    }
	var b = document.forms["insert"]["institutionName"].value;
    if (b == null || b == "") {
        alert("institutionName must be filled out");
        return false;
    }
	var c = document.forms["insert"]["country"].value;
    if (c == null || c == "") {
        alert("country must be filled out");
        return false;
    }
	var d = document.forms["insert"]["state"].value;
    if (d == null || d == "") {
        alert("state must be filled out");
        return false;
    }
	var e = document.forms["insert"]["city"].value;
    if (e == null || e == "") {
        alert("city must be filled out");
        return false;
    }
	var f = document.forms["insert"]["credit_card_type"].value;
    if (f == null || f == "") {
        alert("credit_card_type must be filled out");
        return false;
    }
	var g = document.forms["insert"]["credit_card_no"].value;
    if (g == null || g == "") {
        alert("credit_card_no must be filled out");
        return false;
    }
	var h = document.forms["insert"]["cvv_no"].value;
    if (h == null || h == "") {
        alert("cvv_no must be filled out");
        return false;
    }
	var i = document.forms["insert"]["expiry_month"].value;
    if (i == null || i == "") {
        alert("expiry_month must be filled out");
        return false;
    }
	var j = document.forms["insert"]["expiry_year"].value;
    if (j == null || j == "") {
        alert("expiry_year must be filled out");
        return false;
    }
	var k = document.forms["insert"]["agree"].value;
    if (k == null || k == "") {
        alert("agree must be checked out");
        return false;
    }
	var l = document.forms["insert"]["name_on_card"].value;
    if (l == null || l == "") {
        alert("Name must be filled out");
        return false;
    }
	
}

</script>
</head>

<body>

<!--========================================================
                          HEADER
=========================================================-->
<header id="header">
    <%@ include file = "../../include/Header_temp.jsp" %>
</header>

<!--========================================================
                          CONTENT
=========================================================-->
<section id="content">

    <div class="bg-content_2">
        <div class="border-bottom border-bottom_2">
            <div class="container">
                <div class="wrapper13">
                    <div class="row">
                      <div class="grid_6" align="center">
                            <h3 class="heading_8 color_3 text_4">Registration form</h3>

                            <div class="form-wrapper">
                                <table width="1000" >
<%String user_id=(String)request.getAttribute("user_id"); %>
 <%String usrStat=(String)request.getAttribute("usrStat");
 String purchase=(String)request.getAttribute("purchase");
 String productPrice=(String)request.getAttribute("productPrice");
 System.out.println("purchase :::: "+purchase);
 
 %>          
 <form id="form" name="insert" align="center" action="signUp.html?signUpProcess=signup" method="post" onSubmit="return onValidate();">
 
  <%
	String status1=(String)request.getAttribute("status");
	 if(status1!=null){
	 %>
	   <tr>
        <td width="84" style="height:30; " align="center"><strong><font color="#FF0000"><%=status1%></font></strong></td>
      </tr>
	 
	 <%
	}
	
	%>


<tr><td align="center">
<table border="0" align="" width="700"  style="margin-left:100px; margin-top:10px; margin-bottom:10px">
<tr><td colspan="2"><p class="text_9 color_2">* All fields are mandatory.</p></td>
</tr>

<tr ><td   height="40" width="241"><h5 class="text_11 color_3">First Name:</h5></td>
<td width="250">
  <input  type="text" name="firstname" id="firstname"   style="width:250px; height:20px;" value=""  >

 </td>
 <td width=195 ><p class="text_9 color_2">*</p></td>
</tr>
<tr><td   height="40" width="241"><h5 class="text_11 color_3">Last Name:</h5></td>
<td>
  <input  type="text" name="lastname" id="lastname" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
</tr>
<tr>
 <td   height="40" width="241"><h5 class="text_11 color_3">Email:</h5></td>
    <td>
  <input  type="text" name="email" id="email" style="width:250px; height:20px;"  value="" onChange="ValidateEmail('email');">

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
   </tr>

   <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Mobile No :</h5></td>
    <td>
  <input  type="text" name="mobileno" id="mobileno" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  
   <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Institution Name:</h5></td>
    <td>
  <input  type="text" name="institutionName" id="institutionName" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Country:</h5></td>
    <td>
  <select name="country" id="country" onChange="FillState(document.insert.country, document.insert.state, '');" style="width:250px" class="selectboxOne">
  
  <option selected="selected">Select One</option>
                    <option value="United States of America">United States of America</option></select>
  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
   <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">State:</h5></td>
    <td>
	<select name="state" id="state" style="width:250px" class="selectboxOne">
 <option value="">Select State</option>
<option value="FL">FL</option>
                    <option value="VA">VA</option>
					</select>
  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
 
   <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">City:</h5></td>
    <td>
  <input  type="text" name="city" id="city" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Card Type:</h5></td>
    <td>
	
 <input type="radio" size="10" name="credit_card_type" value="visa" /><img src="images/visa.png" id="visa" name="visa" height="35px" width="45px"/>
  <input type="radio" size="10" name="credit_card_type" value="mastercard" /><img src="images/master.png" id="master" name="master" height="35px" width="45px"/>
   <input type="radio" size="10" name="credit_card_type" value="amex" /><img src="images/american.png" id="american" name="american" height="35px" width="45px"/>
  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Credit Card No:</h5></td>
    <td>
  <input  type="text" name="credit_card_no" id="credit_card_no" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">CVV no:</h5></td>
    <td>
  <input  type="text" name="cvv_no" id="cvv_no"  value="" size="5">
  <img src="images/cvv.png" id="visa" name="visa" height="35px" width="45px"/>

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Name on Card:</h5></td>
    <td>
  <input  type="text" name="name_on_card" id="name_on_card" style="width:250px; height:20px;"  value="" >

  </td>
  <td width=195 style="color:red" ><p class="text_9 color_2">*</p></td>
  </tr>
 
  <tr>
    <td   height="40" width="241"><h5 class="text_11 color_3">Expiry Date:</h5></td>
    <td>
  <input  type="text" name="expiry_month" id="expiry_month"  value="" size="2">&nbsp;/&nbsp;
  <input  type="text" name="expiry_year" id="expiry_year"  value="" size="4">&nbsp;<strong>mm/yyyy</strong>&nbsp;<label class="text_9 color_2">*</label>

  </td>
  <td width=195 style="color:red" ></td>
  </tr>
  
  <tr><td colspan="3"><h5 class="text_11 color_3">Declaration:</h5></td></tr>
  <tr><td colspan="3"><input type="checkbox" name="agree" /><p>I Hereby Declare that all the Statements made by me in the Application from and Information sheet are true and complete to the best of my knowledge.</p></td></tr>
  
  
  
<tr  align="center"><td colspan="2">
 <div class="contact-box">
 <%
 	if(purchase.equalsIgnoreCase("try_now") && purchase != null)
 		
		{
		
		%>
		<input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />

 	<a class="btn color_3 text_3" href="">
		<input type="submit" name="Insert" value="Register" id="submit" onClick="return(onValidate());" style="background-color: transparent;border:none;cursor:pointer;">
	</a>
	<%} else if(purchase.equalsIgnoreCase("buy_now") && purchase != null){
		
	%>
	 <input type="hidden" id="payOption" name="payOption" value="<%=purchase%>" />
	 <input type="hidden" id="productPrice" name="productPrice" value="<%=productPrice%>" />

	<a class="btn color_3 text_3" href="">
		<input type="submit" name="Insert" value="Proceed" id="submit" onClick="return(onValidate());" style="background-color: transparent;border:none;cursor:pointer;">
	</a>
	<%}%>
	<a class="btn color_3 text_3" href="">
		<input name="button" type="button" class="gradBtn" style=" background-color: transparent; border:none; cursor:pointer;"  onClick="javascript:history.back(-1);" value="Cancel" >
	</a>
</div>

</td></tr>
</table></td></tr>
</form>
						

</table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</section>


<!--========================================================
                          FOOTER
=========================================================-->
<footer id="footer">
    <div class="container">
        <div class="row">
            <div class="box">
                <div class="grid_12">
                    <h1 class="text_4 color_1">
                        <a href="index.jsp">guildKraft</a>
                    </h1>
                    <p class="copyright color_9 text_2">
                        <span>&copy;
                            <span id="copyright-year"></span></span>
                        <a href="index-6.jsp">Privacy policy</a>
                        More <a rel="nofollow" href="http://www.digiblitz.com/" target="_blank">digiBlitz Technologies Pvt Ltd.</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
 <script language="javascript">
	FillCountry(document.insert.country, document.insert.state, 'USA' );
	FillState(document.insert.country, document.insert.state, '');

	FillCountry(document.insert.scountry_txt, document.insert.sstate_txt, 'USA' );
	FillState(document.insert.scountry_txt, document.insert.sstate_txt, '');

</script>
</body>

   


</html>

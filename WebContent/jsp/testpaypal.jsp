<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="com.hlccommon.util.*" %>
<%@ page import="com.hlccommon.util.Debug" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat"%>




<%! 
    SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
    String  nullCheck(String fieldName){
        String retValue = "";
        if(fieldName!=null && fieldName.trim().length()!=0){
            retValue = fieldName;
        }
        return retValue;
    }
	 String  noCheck(String fieldName){
        String retValue = "";
        if(fieldName!=null && fieldName.trim().length()!=0){
            retValue = fieldName;
        }
        return retValue;
    }
    %>
    <%! String dateCheck(Date fieldName){
        String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
    }
	
    %>

<html>

<head>

<%--<script language=JavaScript>
<!--

//Disable right click script III- By Renigade (renigade@mediaone.net)
//For full source code, visit http://www.dynamicdrive.com

var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>--%>


<body onLoad="document.frmPaypal.submit();" >

<%--<script language=JavaScript>
<!--

//Disable right click script III- By Renigade (renigade@mediaone.net)
//For full source code, visit http://www.dynamicdrive.com

var message="";
///////////////////////////////////
function clickIE() {if (document.all) {(message);return false;}}
function clickNS(e) {if 
(document.layers||(document.getElementById&&!document.all)) {
if (e.which==2||e.which==3) {(message);return false;}}}
if (document.layers) 
{document.captureEvents(Event.MOUSEDOWN);document.onmousedown=clickNS;}
else{document.onmouseup=clickNS;document.oncontextmenu=clickIE;}

document.oncontextmenu=new Function("return false")
// --> 
</script>--%>

<!-- a Buy Now button is specified by the command _xclick -->

<div class="loading" align="center" style="padding:10px; margin-top:80px;">Processing......Please allow transaction to complete. <br />
Clicking <strong>REFRESH or BACK </strong> in your browser could result in multiple payment requests being processed! 

</div>
<div class="loading" align="center" style="padding:10px;"><img src="images/processing.gif"></div>

<form action="./paypal.html" method="post" name="frmPaypal">
<input type="hidden" name="cmd" value="PaypalProcess">
<INPUT TYPE="hidden" name="undefined_quantity" value="1">
<input type="hidden" name="business" value="dhivya@digiblitz.com">




<% 
	String event_title = (String)request.getAttribute("event_title");
	String start_date=(String)request.getAttribute("start_date");
	String end_date=(String)request.getAttribute("end_date");
	String userId1 = (String)request.getAttribute("userId1");


	String purpose = (String)request.getAttribute("purpose");
	String amt=(String)request.getAttribute("AMT");
	String payAct=(String)request.getAttribute("PAYMENTACTION");
    String ccTyp = (String) request.getAttribute("CREDITCARDTYPE");
	String acct=(String)request.getAttribute("ACCT");
    String expDt = (String) request.getAttribute("EXPDATE");
	String ipAddrs=(String)request.getAttribute("IPADDRESS");
    String fName = (String) request.getAttribute("FIRSTNAME");
	String cvvNo=(String)request.getAttribute("CVVNo");
    String strt = (String) request.getAttribute("STREET");
	String city=(String)request.getAttribute("CITY");
    String state = (String) request.getAttribute("STATE");
	String zip=(String)request.getAttribute("ZIP");
    String counCode = (String) request.getAttribute("COUNTRYCODE");
	String email = (String) request.getAttribute("EMAIL");
	String inVId = (String) request.getAttribute("intVId");
	String lName = (String) request.getAttribute("LASTNAME");
	String mem_type_id = (String)request.getAttribute("MEM_TYPE_ID");
    String memberId = (String)request.getAttribute("MEMBERID");
    String mem_type_name = (String)request.getAttribute("MEM_TYPE_NAME");
    String Productplan = (String)request.getAttribute("Productplan");
    String plan = (String)request.getAttribute("plan");
    String INSTITUTIONNAME = (String)request.getAttribute("INSTITUTIONNAME");
    
	
	
	String pay_firstname = (String) request.getAttribute("pay_firstname");
    System.out.println("pay_firstname in paypall action::::::::::::::::::::::::::::::::::::::::"+pay_firstname);
      String pay_lastname= (String) request.getAttribute("pay_lastname");
      String pay_e_mail= (String) request.getAttribute("pay_e_mail");
      String pay_mobileno= (String) request.getAttribute("pay_mobileno");
      String pay_country= (String) request.getAttribute("pay_country");
      String pay_state= (String) request.getAttribute("pay_state");
      String pay_city= (String) request.getAttribute("pay_city");
      String pay_credit_card_type= (String) request.getAttribute("pay_credit_card_type");
      String pay_credit_card_no= (String) request.getAttribute("pay_credit_card_no");
      String pay_cvv_no= (String) request.getAttribute("pay_cvv_no");
      String pay_name_on_card= (String) request.getAttribute("pay_name_on_card");
      String pay_expiry_month= (String) request.getAttribute("pay_expiry_month");
      String pay_expiry_year= (String) request.getAttribute("pay_expiry_year");
      String pay_expiry_date = pay_expiry_month+"/"+pay_expiry_year;
      String fee= (String) request.getAttribute("fee");
      String monthYear= (String) request.getAttribute("monthYear");
	  String pay_addrline1= (String) request.getAttribute("pay_addrline1");
      String pay_addrline2= (String) request.getAttribute("pay_addrline2");
      String pay_total_amount= (String) request.getAttribute("pay_total_amount");
      String MasterUser_id = (String)request.getAttribute("MasterUser_id");
      
      String pay_event_title = (String)request.getAttribute("pay_event_title");
      String pay_start_date = (String)request.getAttribute("pay_start_date");
      String pay_end_date = (String)request.getAttribute("pay_end_date");
      String pay_userId1 = (String)request.getAttribute("pay_userId1");
      
	
	
		String amount="0.00";
		if(amt!=null){
			amount = amt;
		}
%>

<!--<input type="hidden" name="USER" value="donations_api1.useventing.com">
<input type="hidden" name="PWD" value="Q6YSP3U2UBKPV9M5">
<input type="hidden" name="SIGNATURE" value="A3eTNkCKR-Vl1aVdOIJLhvtoY7iPA2-jjuIwUqZt8Nhr8QnbOLL87Hw0">-->
<input type="hidden" name="userId1" value="<%=userId1%>">
<input type="hidden" name="purpose" value="<%=purpose%>">
<input type="hidden" name="PAYMENTACTION" value="<%=payAct%>">
<input type="hidden" name="CREDITCARDTYPE" value="<%=ccTyp%>">
<input type="hidden" name="ACCT" value="<%=acct%>">
<input type="hidden" name="EXPDATE" value="<%=expDt%>">
<input type="hidden" name="IPADDRESS" value="<%=ipAddrs%>">
<input type="hidden" name="FIRSTNAME" value="<%=fName%>">
<input type="hidden" name="LASTNAME" value="<%=lName%>">
<input type="hidden" name="CVVNO" value="<%=cvvNo%>">
<input type="hidden" name="STREET" value="<%=strt%>">
<input type="hidden" name="CITY" value="<%=city%>">
<input type="hidden" name="STATE" value="<%=state%>">
<input type="hidden" name="ZIP" value="<%=zip%>" />
<input type="hidden" name="AMT" value="<%=amount%>">
<input type="hidden" name="COUNTRYCODE" value="<%=counCode%>">
<input type="hidden" name="EMAIL" value="<%=email%>">
<input type="hidden" name="INVId" value="<%=inVId%>">
<input type="hidden" name="MEM_TYPE_ID" value="<%=mem_type_id%>">
<input type="hidden" name="MEMBERID" value="<%=memberId%>">
<input type="hidden" name="MEM_TYPE_NAME" value="<%=mem_type_name%>">


<input type="hidden" name="event_title" value="<%=event_title%>">
<input type="hidden" name="start_date" value="<%=start_date%>">
<input type="hidden" name="end_date" value="<%=end_date%>">

<input type="hidden" name="pay_firstname" value="<%=pay_firstname%>">
<input type="hidden" name="pay_lastname" value="<%=pay_lastname%>">
<input type="hidden" name="pay_e_mail" value="<%=pay_e_mail%>">
<input type="hidden" name="pay_mobileno" value="<%=pay_mobileno%>">
<input type="hidden" name="pay_country" value="<%=pay_country%>">
<input type="hidden" name="pay_state" value="<%=pay_state%>">
<input type="hidden" name="pay_city" value="<%=pay_city%>">
<input type="hidden" name="pay_credit_card_type" value="<%=pay_credit_card_type%>">
<input type="hidden" name="pay_credit_card_no" value="<%=pay_credit_card_no%>">
<input type="hidden" name="pay_cvv_no" value="<%=pay_cvv_no%>">
<input type="hidden" name="pay_name_on_card" value="<%=pay_name_on_card%>">
<input type="hidden" name="pay_expiry_month" value="<%=pay_expiry_month%>">
<input type="hidden" name="pay_expiry_year" value="<%=pay_expiry_year%>">
<input type="hidden" name="pay_expiry_date" value="<%=pay_expiry_date%>">
<input type="hidden" name="fee" value="<%=fee%>">
<input type="hidden" name="monthYear" value="<%=monthYear%>">
<input type="hidden" name="pay_addrline1" value="<%=pay_addrline1%>">
<input type="hidden" name="pay_addrline2" value="<%=pay_addrline2%>">
<input type="hidden" name="pay_total_amount" value="<%=pay_total_amount%>">
<input type="hidden" name="pay_event_title" value="<%=pay_event_title%>">
<input type="hidden" name="pay_start_date" value="<%=pay_start_date%>">
<input type="hidden" name="pay_end_date" value="<%=pay_end_date%>">
<input type="hidden" name="MasterUser_id" value="<%=MasterUser_id%>">
<input type="hidden" name="Productplan" value="<%=Productplan%>">
<input type="hidden" name="plan" value="<%=plan%>">
<input type="hidden" name="INSTITUTENAME" value="<%=INSTITUTIONNAME%>">





<input type="hidden" name="VERSION" value="51.0">
<input type="hidden" name="METHOD" value="DoDirectPayment">
 <input type="hidden" name="ENVIRON" value="live">
<!--<input type="hidden" name="ENVIRON" value="sandbox">  -->
<INPUT TYPE="hidden" NAME="CURRENCYCODE" value="USD">
<input type="hidden" name="charset" value="utf-8">
<input type="hidden" name="no_shipping" value="1">
<input type="hidden" name="cbt" value="CLICK HERE TO COMPLETE YOUR PAYMENT"/>
<%--<input type="hidden" name="image_url" value="http://www.fusiontutoring.com/loading.swf">
--%><%--<input type="hidden" name="notify_url" value="http://192.168.1.5:8080/dashboard/temppaypal.do">
<input type="hidden" name="return" value="http://192.168.1.5:8080/dashboard/temppaypal.do">
<input type="hidden" name="cancel_return" value="http://192.168.1.5:8080/dashboard/temppaypal.do">--%>
<!-- Do not prompt customer to include a note with the urchase -->
<input type="hidden" name="no_note" value="1">

</form>
</body>
</head>
</html>

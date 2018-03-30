<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="com.hlcmrm.util.*"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/validate.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<script>
function postData(listValue){
	if(listValue!="" || listValue.value.indexOf(' ')!=0){
		strURL = "./overPaySection.html?process=listpay&statusList="+listValue;
		window.location.href = strURL;	
	}
	else{
		alert('Select any one of the status to list the values');
		document.statusForm.statusList.focus();
	}
}
    function submitForm(btnvalue) {
		strURL = "./overPaySection.html?process="+btnvalue;
		window.location.href = strURL;	
    }
</script>
<%! 

SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
	String detValue = "N/A";
		if(fieldName!=null){
		 detValue = sdf.format(fieldName);
		}
	return detValue;
}

%>
<%! float floatCheck(float fieldName){
	float floateValue = 0;
		if(fieldName!=0.0){
		 floateValue = fieldName;
		}
	return floateValue;
}

%>
<%! 
	DecimalFormat result  = new DecimalFormat("0.00");
	String amtFormat(String amtVal){
	String amountValue = "0.00";
		if(amtVal!=null && amtVal.trim().length()!=0){
		//System.out.print(Double.parseDouble(amtVal));
		amountValue = result.format(Double.parseDouble(amtVal));
		}
	return amountValue;
}

%>
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
                            <h2>Membership: Refund Over Payment Listings</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
                            
							
							<!--==============================Form Body=================================-->

		<p>The Refund Over Payment Listings are listed as follows. <br />
		To 'Approve' an application, click on the 'Approve' button beside it. </p>
	
				<form name="statusForm" action="/RefundList.html">
				<%
					String stat = request.getParameter("statusList");
					if(stat==null){
						stat ="";
					}
				%>
					   <div class='form-group'>
                          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Over Payment Status:</label>
                             <div class='col-md-8'>
                                 <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
										
										<select class="form-control" name="statusList" onchange="postData(this.value);">
										<%
										if(stat.equalsIgnoreCase("Pending")){
										%>
											<option value="">Select One</option>						
											<option selected="selected" value="Pending">Pending</option>
											<option value="Approved">Approved</option>
										<%
										}
										else if(stat.equalsIgnoreCase("Approved")){
										%>
											<option value="">Select One</option>						
											<option value="Pending">Pending</option>
											<option selected="selected" value="Approved">Approved</option>							
										<% }
										else{ %>
											<option  selected="selected" value="">Select One</option>						
											<option value="Pending">Pending</option>
											<option value="Approved">Approved</option>													
										<% } %>
										</select>
									</div>
								</div>
							</div>
						</div>
				</form>
				 
		  <!--
		  <tr>
		  	<td height="25" colspan="4"  bgcolor="#ffffff" class="alignRight">
				<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
		      <a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			 </td>
		   </tr>
		  -->
		  <div class="form-group">
			<div class="col-md-12 gp">
				<div class="col-md-2">
					<label class="control-label label1">Member ID</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">First Name</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Last Name</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Excess Amount</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Payment Date</label>
				</div>
				<div class="col-md-2">
					<label class="control-label label1">Approve</label>
				</div>
  			</div>
		</div>
		  
                   <%
                        int i=0;
						ArrayList reqList=new ArrayList();
						reqList = (ArrayList) request.getAttribute("RefundReq");
						
						if(reqList!=null && reqList.size()>0){
							Iterator iterator =  reqList.iterator();
							while(iterator.hasNext()){
								HLCMembershipRefundDetails refDetail = (HLCMembershipRefundDetails) iterator.next();
								
								String refundId = refDetail.getRefundId();
								double balAmt = refDetail.getBalanceAmount();
								String firstName = refDetail.getFirstName();
								String lastName = refDetail.getLastName();
								String memberId = refDetail.getMemberId();
								Date claimdte = refDetail.getClaimDate();

								%>
								<form name="frmOverPay" id="myform" method="post" action="./overPaySection.html">
								<input type="hidden" name="process" value="submt" />
								
								<div class="form-group">
									<div class="col-md-12 gp">
										<div class="col-md-2">
											<label class="control-label "><%=nullCheck(memberId)%></label>
										</div>
										<div class="col-md-2">
											<label class="control-label "><%=nullCheck(firstName)%></label>
										</div>
										<div class="col-md-2">
											<label class="control-label "><%=nullCheck(lastName)%></label>
										</div>
										<div class="col-md-2">
											<label class="control-label "><%=amtFormat(String.valueOf(balAmt))%></label>
										</div>
										<div class="col-md-2">
											<label class="control-label "><%=dateCheck(claimdte)%></label>
										</div>
									
								
									
									<input type="hidden" name="refundId" value="<%=refundId%>" />
									<input type="hidden" name="memberId" value="<%=memberId%>" />
									<input type="hidden" name="id" value="<%=i%>">
									
									<%
									if(stat.equalsIgnoreCase("Pending")){
										%>
										<div class="col-md-2">
											<button class='btn-sm btn-primary' type='submit'  name="Submit2" value="Approve">Approve</button>
										</div>
										<% 
									} 
									else{
										%>
										<div class="col-md-2">
											<button class='btn-sm btn-primary' type='submit'  name="Submit2" value="View">View</button>
										</div>
										
										<%
									}
									%>
									</div>
								</div>
							   </form>
							   
							  <%                      
							}
						}
						else{%>
							<div class="form-group">
								<div class="col-md-12 gp">
									<div class="col-md-4">
										</div>
									<div class="col-md-4">
										<p>No Over Payment Refunds Available !! </p>
										</div>
								</div>
							</div>
						<%}%>
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

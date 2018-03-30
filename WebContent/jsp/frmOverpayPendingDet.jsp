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
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>
<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

 
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
		System.out.print(Double.parseDouble(amtVal));
		amountValue = result.format(Double.parseDouble(amtVal));
		}
	return amountValue;
}

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
              <h2>Membership:Over Payment Approved Form</h2>
		   </div>
		   <!--==============================Form Title=================================-->
	 <div class='panel-body'>
 
		<form name="frmAdvMag" id="myform" method="post" action="./AdminRefundStatusDisp.do?process=update" onsubmit="return myvalidate(this);">
        
		<%
				HLCMembershipRefundDetails objRefDetails = (HLCMembershipRefundDetails) request.getAttribute("memRefund");
				
                String memberId = objRefDetails.getMemberId();
                double claimAmt = objRefDetails.getClaimAmount();
                String firstName = objRefDetails.getFirstName();
                String lastName = objRefDetails.getLastName();
                String mailId = objRefDetails.getMailId();
                Date claimDte = objRefDetails.getClaimDate();
				String refundId = objRefDetails.getRefundId();
				String comments = objRefDetails.getComments();
				String bankName = objRefDetails.getBankName();
				Date refundDte = objRefDetails.getRefundDate();
				Date chequeDte = objRefDetails.getCheckDate();
				String refundBy = objRefDetails.getRefundedBy();
				int chqNo = objRefDetails.getCheckNumber();
				double balAmt = objRefDetails.getBalanceAmount();
        %>
		<input type="hidden" name="refundId" value="<%=refundId%>" />
        <p>Approved Refund:</p>
		
         <div class='form-group'>
			
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Of Request:</label>
				<div class='col-md-8'>
                  <div class='col-md-5 indent-small'>
                    <div class='col-md-offset-4'>
						<%=dateCheck(claimDte)%>
					</div>
				   </div>
				 </div>
			
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
            <div class='col-md-8'>
               <div class='col-md-5 indent-small'>
                 <div class='col-md-offset-4'>
						<%=memberId%>
				 </div>
			   </div>
			 </div>
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
           <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=firstName%>
				</div>
			  </div>
			</div>
			
         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=lastName%>
				</div>
			  </div>
			</div>
			
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>E-Mail ID:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=mailId%>
				</div>
			  </div>
			</div>
			
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Claim Amount</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=balAmt%>
				</div>
			  </div>
			</div>
           
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=nullCheck(comments)%>
				</div>
			  </div>
			</div>
          
		  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refund Date:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=dateCheck(refundDte)%>
				</div>
			  </div>
			</div>
          
		  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Refunded By:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                 <div class='col-md-offset-4'>
					<%=nullCheck(refundBy)%>
				</div>
			  </div>
			</div>
         
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Cheque date:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=dateCheck(chequeDte)%>
				</div>
			  </div>
			</div>
         
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Cheque number:</label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                <div class='col-md-offset-4'>
					<%=chqNo%>
				</div>
			  </div>
			</div>
         
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank name: </label>
            <div class='col-md-8'>
              <div class='col-md-5 indent-small'>
                 <div class='col-md-offset-4'>
					<%=nullCheck(bankName)%>
				</div>
			  </div>
			</div>
          </div>
          <div id="chrgCrd"></div>
		  
           <div class='form-group'>
             <div class='col-md-offset-4 col-md-1'>
               <button class='btn-lg btn-primary' name="subsub" type="submit" value="Back" onclick="window.location.href('./overPaySection.do?process=listpay');">Back</button>
			  </div>
            </div>
        		
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

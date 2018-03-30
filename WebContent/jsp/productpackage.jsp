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
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Profile Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
</head>
<%! 

String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<style>
    .vertical-line {
        width: 0;
        border: 1px solid #000000;
        height: 1px
		 
    }
</style>

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
							<h2>Product Package Details</h2>
						</div>
					<!--==============================Form Title=================================-->
						
             <div class='panel-body'>
                <form   action="user.html?cmd=updateproductppackage&email=<%=nullCheck((String)request.getAttribute("e_mail"))%>" method=post name="uploadfile">


		
           <p>Plan and Bundle History:</p>
		   <div class='form-group' >
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Plan Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		<input type="text" name="plan_type" class="form-control" value="<%=nullCheck((String)request.getAttribute("Productplan"))%>" readonly >
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		<input type="text" name="subs_type" class="form-control" value="<%=nullCheck((String)request.getAttribute("subscription_plan"))%>" readonly>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment History:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		<input type="text" name="pay_history" class="form-control" value="<%=nullCheck((String)request.getAttribute("amount"))%>">
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>

									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Alter Plan and Bundle:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		<button type="button" class='btn-sm btn-primary' name="alt_plan" value="Purchase" onClick="location.href='http://74.208.110.192:8480/yes-shop/category/guildKraft'">Purchase</button> 
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									<div style="display:inline-block;width:100%">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Subscription Expiry(Plan and Bundles):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		<input  type="text" name="Subs_expiry" id="Subs_expiry" class="form-control" value="<%=nullCheck((String)request.getAttribute("difference"))%>" readonly />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									</div>
									
									<div style="display:inline-block;width:100%">
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Renew Subscription(Plan and Bundles):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <button class='btn-sm btn-primary' name="renew_subs" id="renew_subs" value="Renew" onClick="location.href='pricing.jsp'">Renew</button>
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
                               </div>
							   </div>


                 <div class="form-group">

	                <div class='col-md-offset-4 col-md-1'>
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
			
</body>

</html>

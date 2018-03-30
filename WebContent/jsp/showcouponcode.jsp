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
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Coupon Details</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
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
                            <h2>Coupon Code List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
				
					

		<form class='form-horizontal' role='form' name="myform" id="myform" action="OEMOrgCompReg.html" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="ListDetails" />
		
				

									<div class="form-group">
										<div class="col-md-12 gp">
											<div class="row">
												<div class="col-sm-offset-1 col-md-2">
													<label class="control-label label1">Coupon Code</label>
												</div>
												<div class="col-md-3">
													<label class="control-label label1">Coupon Description</label>
												</div>
												<div class="col-md-2">
													<label class="control-label label1">Coupon Offer</label>
												</div>
												
												<div class="col-md-2">
													<label class="control-label label1">Deactive</label>
												</div>
												
												<div class="col-md-2">
													<label class="control-label label1">Edit</label>
												</div>
											</div>
										</div>
									</div>
		 
								<%
									String status="Deactive";
									ArrayList showcoupondet = (ArrayList)request.getAttribute("showcoupondet");
									if(showcoupondet!=null && showcoupondet.size()!=0){
										Iterator itr = showcoupondet.iterator();
										while(itr.hasNext()){
											String userlist[] = (String[])itr.next();
											
											String coupon_id=userlist[0];
											String coupon_code = userlist[1];	
											String coupon_des = userlist[2];
											String coupon_offer = userlist[3];
											
								%>
								
								<div class="form-group">
										<div class="col-md-12 gp">
											<div class="row">
												<div class="col-sm-offset-1 col-md-2">
													<label class="control-label "><%=coupon_code%></label>
												</div>
												<div class="col-md-3">
													<label class="control-label" style="text-align:inherit"><%=coupon_des%></label>
												</div>
												<div class="col-md-2">
													<label class="control-label "><%=coupon_offer%></label>
												</div>
												
												<div class="col-md-2">
													<button class='btn-sm btn-primary' type="button" name="edit" value="Deactive" onclick="location.href='bdtguser.html?cmd=coupondeactivate&coupon_id=<%=coupon_id%>&status=<%=status%>'">Deactive</button>
												</div>
												<div class="col-md-2">
													<button class='btn-sm btn-primary' type="button" name="edit" value="edit" onclick="location.href='bdtguser.html?cmd=couponofferedit&coupon_id=<%=coupon_id%>'">Edit</button>
												</div>
												
											</div>
										</div>
									</div>
		
						<%
							}
						}else{
						%>
	  					<div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
										
											<div class='col-md-4'>
											</div>
											
											<div class='col-md-4'>
												No records are available 
											</div>
											
										</div>
										
									 </div>
									 
								</div>
								
							
		  			 <%}%>
			
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

<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmAdvMag.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<%
			ArrayList alAdsView = (ArrayList)session.getAttribute("displayParticularAds");
			if(alAdsView==null || alAdsView.size()==0){
					//response.sendRedirect("");
					//out.print("sdfsdfdsfsd");
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
                            <h2>Advertisement</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
 

	<%
	Iterator itAll = alAdsView.iterator();
		if(itAll.hasNext()){
				HLCAdvertiserVO objAdvt = (HLCAdvertiserVO)itAll.next();
				ArrayList listAdsDet = (ArrayList)itAll.next();
				ArrayList priceList = (ArrayList)itAll.next();
	%>
		<form  class='form-horizontal' role='form' name="frmAdvReqView" action="advertiseAdmin.html" method="post" />
		<input name="advProcess" type="hidden" value="statusChange">
		<input name="advId" value="<%=objAdvt.getAdvertisementId()%>" type="hidden" />
		
			<p>Ad Agencies and Contact person information:</strong></p>
				
							  <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertiser's Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAdvertiser()%></label>
											</div>
										</div>
									</div>
				 
				
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Agency  Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAdAgency()%></label>
											</div>
										</div>
									</div>
								</div>
				 
				 
				 				  <p>Contact Person details:</p>
						
						<div class="form-group">
				 			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyFirstName()%></label>
											</div>
										</div>
									</div>
				 
						
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<label class='control-label'><%=objAdvt.getAgencyMiddleName()%></label>
										</div>
										</div>
									</div>
				 
											
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyLastName()%></label>
											</div>
										</div>
									</div>
				 
				
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Street:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyAddress()%></label>
											</div>
										</div>
									</div>
				 
					
				  			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suite:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencySuite()%></label>
											</div>
										</div>
									</div>
				 
						
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyCountry()%></label>
											</div>
										</div>
									</div>
				 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyState()%></label>
											</div>
										</div>
									</div>
				 
				
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyCity()%></label>
											</div>
										</div>
									</div>
				 
					
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyZip()%></label>
												
											</div>
										</div>
									</div>
				 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyPhone()%></label>
											</div>
										</div>
									</div>
				 
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyFax()%></label>
											</div>
										</div>
									</div>
				 
					
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAgencyEmail()%></label>
											</div>
										</div>
									</div>
				 
					
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Invoice to:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getInvoiceTo()%></label>
											</div>
										</div>
									</div>
				 
					
				  
				  
				  		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Media Name:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getMediaId()%></label>
											</div>
										</div>
									</div>
				 				</div>
				
														  <%
														  double totalAmount = 0.00;
														  Iterator its = priceList.iterator();
															while(its.hasNext()){
																//String priceDet[] = {mediaName, issueName, dispName, dispSubName, dimName, placement, amount };
																String [] priceDet = (String [] )its.next();
																
																String mediaName = priceDet[0];
																String issueName = priceDet[1];
																String dispName = priceDet[2];
																String dispSubName = priceDet[3];
																String dimName = priceDet[4];
																String placement = priceDet[5];
																String amount = priceDet[6];
																
																totalAmount = totalAmount + Double.parseDouble(amount);
																
														  %>
			
								<p><%=issueName%></p>
								
							<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Types:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=dispName%></label>
											</div>
										</div>
									</div>
				 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertisement Sub-Types:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=dispSubName%></label>
											</div>
										</div>
									</div>
				 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Dimension:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=dimName%></label>
											</div>
										</div>
									</div>
				 
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Placement:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=placement%></label>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
				 
								
								
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=amount%></label>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
				 
						
				  <%
				  }
				  %>
				<p>Other Information</p>
				 				
								<div class="form-group">
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Advertising Material Coming From:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getMaterialComingFrom()%></label>
											</div>
										</div>
									</div>
				 
					
				  <%
				  SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				  String advDate = "";
				  if(objAdvt.getMaterialComingDate()!=null){
				  	advDate = sdf.format(objAdvt.getMaterialComingDate());
				  }
				  %>
				  				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=advDate%></label>
											</div>
										</div>
									</div>
				 
						
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Ad Supplied on: </label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getAdvSuppliedOn()%></label>
											</div>
										</div>
									</div>
				 
						
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Instruction:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class='control-label'><%=objAdvt.getComments()%></label>
											</div>
										</div>
									</div>
								</div>
				 
							
								 <p>Payment Information</p>
								 
				 			<div class="form-group">
				  			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Amount:</label>
                                   	 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<label class="control-label">$ <%=totalAmount%></label>
					 								 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
				 		
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="button"  value="Back" onclick="javascript:history.back(-1);" >Back</button>
                                    </div>
								</div>
					
					
				
			
		</form>
		<%
		}
		%>
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

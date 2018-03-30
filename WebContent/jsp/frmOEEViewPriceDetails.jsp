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
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript" type="text/javascript">
function onValidate(){

	if(document.frmInitPrice.selItem.value==""){
		alert("Select a Item");
		document.frmInitPrice.selItem.focus();
		return false;
	}
	
	return true;
}
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%! 
String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%  String itemID =(String)request.getAttribute("itemId");
	String eventId =(String)request.getAttribute("eventId");
	String enableButton = (String)request.getAttribute("enableButton");
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
                            <h2>Online Entries: View Price Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                       
					    <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
		  
 	
		
			 <form class='form-horizontal' role='form' name="frmInitPrice" id="frmInitPrice" action="OEEAddPrice.html" method="post" onsubmit="return onValidate();">
			 <input type="hidden" name="cmd" value="viewPrice" />
			 <input type="hidden" name="eventId" value="<%=eventId%>" />


						 <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <select name="selItem" id="selItem" class="form-control">
												<option value="" selected="selected">Select One</option>
												<%  ArrayList itemDetails = (ArrayList)request.getAttribute("itemDetails");
													if(itemDetails!=null && itemDetails.size()!=0){
														Iterator itr= itemDetails.iterator();
														while(itr.hasNext()){
															String[] s = (String[]) itr.next();
															String itemId = s[0];
															String itemName1 = s[1];
															if(itemID!=null && itemID.equalsIgnoreCase(itemId)){
												%>
												<option value="<%=itemId%>" selected="selected" ><%=itemName1%></option>
												<%}else{%>
												<option value="<%=itemId%>" ><%=itemName1%></option>
												<%}}}%>
											 </select>
										</div>
									</div>
								</div>
							
									 <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary'  type="submit" name="appButton" id="appButton" value="Submit">Submit</button>
                                    </div>
							</div>
		
					 </form>
		
				  <form class='form-horizontal' role='form' name="frmViewPrice" id="frmViewPrice" action="OEEAddPrice.html" method="post">
				  <input type="hidden" name="cmd" value="initEditPriceDetails"/>
				  <input type="hidden" name="eventId" value="<%=eventId%>" />
				  <%String itemId =(String)request.getAttribute("itemId");%>
				  <input type="hidden" name="itemId" value="<%=itemId%>" />
		 
			
					<div class='margin marginn'>
				  
				  			<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									<div class=" col-md-offset-2 col-md-2">
							
										<label class='control-label label1'>Event Level</label>
										
									</div>
						
						
								<div class="col-md-2">
								
									<label class='control-label label1'>Due Date Price</label>
						
								</div>
						
								<div class="col-md-2">
							
									<label class='control-label label1'>After-Due Date Price </label>
							
								</div>
						
							<div class="col-md-2">
						
								<label class='control-label label1'>Deposit Amount</label>
							
							</div>
						</div>
					</div>
				</div>
		
		<%
			
			ArrayList eventType = (ArrayList)request.getAttribute("eventType");
			if(eventType!=null && eventType.size()!=0){
			
			%>
		   <%   
				Iterator itr = eventType.iterator();
						while(itr.hasNext()){
						String [] uDet = (String[])itr.next();
						String eventTyId = uDet[0];
						String eventTypeName =uDet[1];
						
						%>
					<p><%=eventTypeName%></p>
					
						<%

						ArrayList eventLevel = (ArrayList)request.getAttribute("HLCEventDetails");
						HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
						if(eventLevel!=null && eventLevel.size()!=0){
						Iterator it = eventLevel.iterator();
						
						while(it.hasNext()){
							priceVO = (HLCPriceMatrixVO)it.next();
							String eventTyId1 = priceVO.getEventTypeId();
							String eventTypeName1 =priceVO.getEventTypeName();
							String eventLeId = priceVO.getEventLevelId();
							String eventLevelName =priceVO.getEventLevelName();
							String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
							String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
							String depAmt=String.valueOf(priceVO.getDepositPrice()); 
							
						if(eventTyId1.equals(eventTyId)){
						
			%>
			
					<div class='margin marginn'>
				  
				  			<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									<div class=" col-md-offset-2 col-md-2">
							
										<label class='control-label '><%=eventLevelName%></label>
										
									</div>
						
						
								<div class="col-md-2">
								
									<label class='control-label '><%=duePrice%></label>
						
								</div>
						
								<div class="col-md-2">
							
									<label class='control-label '><%=afterDuePrice%> </label>
							
								</div>
						
							<div class="col-md-2">
						
								<label class='control-label '><%=depAmt%></label>
							
							</div>
						</div>
					</div>
				</div>

		   <%}}}}}else{%>
	  		
						<div class='form-group'>
							<div class="container"> 
										<div class='col-md-4'>
											</div>
										
											<div class='col-md-4'>
												No Records Found
												</div>
										</div>
									</div>
		   <%}%>
	
			<p>Championship Details:</p>

	
					<div class='margin marginn'>
							  
				  			<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									<div class=" col-md-offset-2 col-md-2">
							
										<label class='control-label label1'>Event Level</label>
										
									</div>
						
						
								<div class="col-md-2">
								
									<label class='control-label label1'>Due Date Price</label>
						
								</div>
						
								<div class="col-md-2">
							
									<label class='control-label label1'>After-Due Date Price </label>
							
								</div>
						
							<div class="col-md-2">
						
								<label class='control-label label1'>Deposit Amount</label>
							
							</div>
						</div>
					</div>
				</div>
		   
		   <%
		    
			ArrayList eventTypeChamp = (ArrayList)request.getAttribute("eventTypeChamp");
			if(eventTypeChamp!=null && eventTypeChamp.size()!=0){
			%>
			<%
				Iterator itr = eventTypeChamp.iterator();
				
				while(itr.hasNext()){
					String [] uDet = (String[])itr.next();
					String eventTyId = uDet[0];
					String eventTypeName =uDet[1];
				
				%>
				<p><%=eventTypeName%></p>
				
				<%
				ArrayList eventLevelChamp = (ArrayList)request.getAttribute("champDetails");
				HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
						if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
						Iterator it = eventLevelChamp.iterator();
							while(it.hasNext()){
							priceVO = (HLCPriceMatrixVO)it.next();
							String eventTyId1 = priceVO.getEventTypeId();
							String eventTypeName1 =priceVO.getEventTypeName();
							String eventLeId = priceVO.getEventLevelId();
							String eventLevelName =priceVO.getEventLevelName();
							String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
							String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
							String depAmt=String.valueOf(priceVO.getDepositPrice()); 
						   
						if(eventTyId1.equals(eventTyId)){
						
			%>
			
					<div class='margin marginn'>
				  
				  			<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									<div class=" col-md-offset-2 col-md-2">
							
										<label class='control-label '><%=eventLevelName%></label>
										
									</div>
						
						
								<div class="col-md-2">
								
									<label class='control-label '><%=duePrice%></label>
						
								</div>
						
								<div class="col-md-2">
							
									<label class='control-label '><%=afterDuePrice%></label>
							
								</div>
						
							<div class="col-md-2">
						
								<label class='control-label '><%=depAmt%></label>
							
							</div>
						</div>
					</div>
				</div>


		  <%}}}}}else{%>
	  		
						<div class='form-group'>
							<div class="container"> 
										<div class='col-md-4'>
											</div>
										
											<div class='col-md-4'>
												No Records Found
												</div>
										</div>
									</div>
									
		   <%}%>
		    <%if(eventType!=null && eventType.size()!=0 || eventTypeChamp!=null && eventTypeChamp.size()!=0){%>
				  
				  <div class='form-group'>
				  		 <div class='col-md-offset-4 col-md-1'>
                              <button class='btn-lg btn-primary'type="submit" name="appButton" id="appButton" value="Approve">Approve</button>
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

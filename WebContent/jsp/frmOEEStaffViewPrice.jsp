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
	if(document.frmInitPrice.selType.value==""){
		alert("Select a Event Type");
		document.frmInitPrice.selType.focus();
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
<%  	String eventTypeId = (String)request.getAttribute("eventTypeId");
		String itemID = (String)request.getAttribute("itemId");
		String areaID = (String)request.getAttribute("areaId");
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
	
				 <form  class='form-horizontal' role='form'name="frmInitPrice" id="frmInitPrice" action="OEEAddFixedPrice.html" method="post" onsubmit="return onValidate();">
		 		 <input type="hidden" name="cmd" value="staffViewPrice" />

					 <div class='form-group'>
					
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
					
							<div class='col-md-8'>
							
								<div class='col-md-3 indent-small'>
					
										<div class='form-group internal'>
												
										 <select name="selItem" id="selItem" class="form-control">
												<option value="" selected="selected">Select One</option>
											<%	ArrayList itemDetails = (ArrayList)request.getAttribute("allItem");
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
										 		<span id="span_astriesk">*</span>
					      		</div>
						 </div>
					</div>
					
					
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
					<div class='col-md-8'>
            				<div class='col-md-3 indent-small'>
                				<div class='form-group internal'>
				
									 <select name="selType" id="selType" class="form-control">
											<option value="" selected="selected">Select One</option>
										<%  Vector eventTypeDetails = (Vector)request.getAttribute("allEventType"); 
											if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
												Enumeration itr= (Enumeration)eventTypeDetails.elements();
												while(itr.hasMoreElements()){
													String[] s = (String[]) itr.nextElement();
													String typeId = s[0];
													String typeName = s[1];
													if(eventTypeId!=null && eventTypeId.equalsIgnoreCase(typeId)){
										%>
											<option value="<%=typeId%>" selected="selected" ><%=typeName%></option>
										<%}else{%>
											<option value="<%=typeId%>" ><%=typeName%></option>
										<%}}}%>
									 </select>
									 <span  id="span_astriesk">*</span>
					 
					 	</div>
					</div>
				</div>
					 
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
			<div class='col-md-8'>
            	<div class='col-md-3 indent-small'>
                	<div class='form-group internal'>
						
						 <select name="selArea" id="selArea" class="form-control">
							<option value="" selected="selected">Select One</option>
							<%  ArrayList areaDetails = (ArrayList)request.getAttribute("allArea"); 
								if(areaDetails!=null && areaDetails.size()!=0){
									Iterator itr= areaDetails.iterator();
									while(itr.hasNext()){
										String[] s = (String[]) itr.next();
										String areaId = s[0];
										String areaName = s[2];
										if(areaID!=null && areaID.equalsIgnoreCase(areaId)){
							%>
							<option value="<%=areaId%>" selected="selected" ><%=areaName%></option>
							<%}else{%>
							<option value="<%=areaId%>" ><%=areaName%></option>
							<%}}}%>
						 </select>
						 	
							</div>
						</div>
					</div>
				</div>
					
					<div class='form-group'>
                         <div class='col-md-offset-4 col-md-1'>
                               <button class='btn-lg btn-primary' type='submit'>Submit</button>
							</div>
					</div>
					 
		 </form>
		
					  <form class='form-horizontal' role='form' name="frmViewPrice" id="frmViewPrice" action="OEEAddFixedPrice.html" method="post" onsubmit="return onValidate();">
					  <input type="hidden" name="cmd" value="initEditPrice"/>
					<input type="hidden" name="itemID" value="<%=itemID%>" />
					<input type="hidden" name="eventTypeId" value="<%=eventTypeId%>" />
					<input type="hidden" name="areaID" value="<%=areaID%>" />	
					
		
					<div class="margin marginn">
					
							<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									<div class="col-md-offset-1 col-md-2">
							
										<label class='control-label label1'>Event Level</label>
										
									</div>
						
						
								<div class="col-md-2">
								
									<label class='control-label label1'>Due Date Price</label>
						
								</div>
						
							<div class="col-md-3">
							
								<label class='control-label label1'>After-Due Date Price </label>
							
							</div>
						
						<div class="col-md-2">
						
							<label class='control-label label1'>Deposit Amount</label>
							
						</div>
					</div>
				</div>
			</div>
			
			
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
							String appStatus=priceVO.getApproveStatus();
					
			%>
			
			  <div class="margin marginn">
			  
						<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									  <div class='col-md-offset-1 col-md-2'>
											<label class='control-label'><%=eventLevelName%></label>
									  </div>
									  
									  
 										<div class='col-md-2'>
											<label class='control-label'><%=duePrice%></label>
										</div>
										
										 <div class='col-md-3'>
											<label class='control-label'><%=afterDuePrice%></label>
										</div>
										
										 <div class='col-md-2'>
											<label class='control-label'><%=depAmt%></label>
										</div>
										
										</div>
										
									</div>
									
								</div>
									
                           
		  	 <%}}else{%>
	  		
				<div class='form-group'>
					<div class="row"> 
							<div class='col-md-4'>
								</div>
								<div class='col-md-4'>
									No Records Found
								</div>
							</div>
						</div>
						
         
		   <%}%>
		   
		   <p >Championship Details :</p>
		   	
			 <div class="margin marginn">
				 
				 <div class="form-group">
					 
					 <div class="col-md-12" gp>
				
					
					<div class="col-md-offset-1 col-md-2">
						<label class='control-label label1'>Event Level</label>
					</div>
					
					<div class="col-md-2">
						<label class='control-label label1'>Due Date Price</label>
					</div>
					
					<div class="col-md-3">
						<label class='control-label label1'>After-Due Date Price</label>
					</div>
					
					<div class="col-md-2">
						<label class='control-label label1'>Deposit Amount</label>
					</div>
				</div>
			</div>
		</div>
		
		   
		 		<%
				ArrayList eventLevelChamp = (ArrayList)request.getAttribute("eventDetailsChamp");
				HLCPriceMatrixVO priceVO1 = new HLCPriceMatrixVO();
						if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
						Iterator it = eventLevelChamp.iterator();
							while(it.hasNext()){
							priceVO1 = (HLCPriceMatrixVO)it.next();
							String areaId=priceVO1.getAreaId();
							String eventTyId1 = priceVO1.getEventTypeId();
							String eventTypeName1 =priceVO1.getEventTypeName();
							String eventLeId = priceVO1.getEventLevelId();
							String eventLevelName =priceVO1.getEventLevelName();
							String duePrice=String.valueOf(priceVO1.getDueDatePrice()); 
							String afterDuePrice=String.valueOf(priceVO1.getAfterDueDatePrice()); 
							String depAmt=String.valueOf(priceVO1.getDepositPrice()); 
						    String appStatus=priceVO1.getApproveStatus();
			%>
			
						  <div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12" gp>
											   
									  <div class='col-md-offset-1  col-md-2'>
											<label class='control-label'><%=eventLevelName%></label>
										</div>
										
										 <div class='col-md-2'>
											<label class='control-label'><%=duePrice%></label>
										</div>
										
										 <div class='col-md-3'>
											<label class='control-label'><%=afterDuePrice%></label>
										</div>
										
										 <div class='col-md-2'>
											<label class='control-label'><%=depAmt%></label>
										</div>
									</div>									
									
								</div>
							</div>
                             


		  <%}}else{%>
	  					
						<div class='form-group'>
				 
							<div class='col-md-4'>
								
								</div>
							
								<div class='col-md-4'>
									No Records Found
								</div>
								
							</div>
					
		   <%}%>
				    <%
					if(eventLevel!=null && eventLevel.size()!=0 || eventLevelChamp!=null && eventLevelChamp.size()!=0){
					%>
					
				     <div class='col-mod-offset-4 col-md-2'>
						<button class='btn-lg btn-primary' type='submit'>Update Price</button>
					</div>
				  <%}else if(eventLevel!=null && eventLevel.size()==0 || eventLevelChamp!=null && eventLevelChamp.size()==0){
				  
				  %>
				   
				  <%}%>
				  
				 
				   </form>
	    
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

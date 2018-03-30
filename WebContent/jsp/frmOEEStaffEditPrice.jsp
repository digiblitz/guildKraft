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


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
<%!
String  nullCheck(String fieldName){
	String retValue = "<b>N/A</b>";
		if(fieldName!="" ){
		retValue = fieldName;
		}
	return retValue;
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
                            <h2>Online Entries: Edit Price Details</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
  
							<%      	
							String eventTypeId = (String)request.getAttribute("eventTypeId");
							String itemID = (String)request.getAttribute("itemId");
							String areaID = (String)request.getAttribute("areaId");
							
							
							String updateStatus = (String)request.getAttribute("updateStatus");
							String iStatus = "";
							if(updateStatus!=null && updateStatus.equalsIgnoreCase("success")) iStatus = "Price Details Updated Successfully";
							else if(updateStatus!=null && updateStatus.equalsIgnoreCase("failed")) iStatus = "Price Details Not Updated";
							
							%>

							 <%
									if(updateStatus!=null && updateStatus.trim().length()!=0){
								 %>
								 <p><%=iStatus%></p>
								 
								 <%}%> 
	
					  <form class='form-horizontal' role='form' name="frmInsertPrice" id="frmInsertPrice" action="OEEAddFixedPrice.html" method="post" onsubmit="return myValidate();">
					  <input type="hidden" name="cmd" value="updatePriceDetails"/>
						<input type="hidden" name="itemID" value="<%=itemID%>" />
						<input type="hidden" name="eventTypeId" value="<%=eventTypeId%>" />
						<input type="hidden" name="areaID" value="<%=areaID%>" />	
		
						 <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<%	ArrayList itemDetails = (ArrayList)request.getAttribute("allItem");
												if(itemDetails!=null && itemDetails.size()!=0){
													Iterator itr= itemDetails.iterator();
													while(itr.hasNext()){
														String[] s = (String[]) itr.next();
														String itemId = s[0];
														String itemName1 = s[1];
														if(itemID!=null && itemID.equalsIgnoreCase(itemId)){
											%>
											 <label class='control-label'><%=itemName1%></label>
											<%}}}%>
										
											</div>
										</div>
									</div>
		 
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		
											<%  Vector eventTypeDetails = (Vector)request.getAttribute("allEventType"); 
												if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
													Enumeration itr= (Enumeration)eventTypeDetails.elements();
													while(itr.hasMoreElements()){
														String[] s = (String[]) itr.nextElement();
														String typeId = s[0];
														String typeName = s[1];
														if(eventTypeId!=null && eventTypeId.equalsIgnoreCase(typeId)){
											%>
											<label class='control-label'><%=typeName%></label>
											<%}}}%>
										</div>
									</div>
								</div>
		
		 
		 
										<%  ArrayList areaDetails = (ArrayList)request.getAttribute("allArea"); 
											if(areaDetails!=null && areaDetails.size()!=0){
												Iterator itr= areaDetails.iterator();
												while(itr.hasNext()){
													String[] s = (String[]) itr.next();
													String areaId = s[0];
													String areaName = s[2];
													if(areaID!=null && areaID.equalsIgnoreCase(areaId)){
													
										%>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
													<label class='control-label'><%=nullCheck(areaName)%></label>
											</div>
										</div>
									</div>
								</div>
			
						<%}}}%> 
		 
		 
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
						         int j=0;
								ArrayList eventLevel = (ArrayList)request.getAttribute("HLCEventDetails");
								HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
								if(eventLevel!=null && eventLevel.size()!=0){
								Iterator it = eventLevel.iterator();
								while(it.hasNext()){
									priceVO = (HLCPriceMatrixVO)it.next();
									String priceId=priceVO.getPriceId();
									String eventTyId1 = priceVO.getEventTypeId();
									String eventTypeName1 =priceVO.getEventTypeName();
									String eventLeId = priceVO.getEventLevelId();
									String eventLevelName =priceVO.getEventLevelName();
									String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
									String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
									String depAmt=String.valueOf(priceVO.getDepositPrice());
									j++;
									
									
						%>
					<input type="hidden" name="noChampSize" id="noChampSize" value="<%=eventLevel.size()%>"/>
					<input type="hidden" name="eventLevelId<%=j%>" id="eventLevelId<%=j%>" value="<%=eventLeId%>"/>
					<input type="hidden" name="priceId<%=j%>" id="priceId<%=j%>" value="<%=priceId%>"/>
					<%System.out.println("priceId :"+priceId);%>
					<%System.out.println("noChampSize :"+eventLevel.size());%>
						
					<div class='margin marginn'>
					
						<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									  <div class=' col-md-offset-2 col-md-2'>
											<label class='control-label'><%=eventLevelName%></label>
									  </div>
									  
									  
 										<div class='col-md-2'>
											<input type="text" name="txtDue<%=j%>" id="txtDue<%=j%>" class="form-control" value="<%=duePrice%>" />
										</div>
										
										 <div class='col-md-2'>
											<input type="text" name="txtAfterDue<%=j%>" id="txtAfterDue<%=j%>" value="<%=afterDuePrice%>" class="form-control"/>
										</div>
										
										 <div class='col-md-2'>
											<input type="text" name="txtDepAmt<%=j%>" id="txtDepAmt<%=j%>" value="<%=depAmt%>" class="form-control"/>
										</div>
										
									</div>
										
								</div>
							</div>
							
		  				 <%}}else{%>
						 
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
						
						int m=0;
						
									ArrayList eventLevelChamp = (ArrayList)request.getAttribute("eventDetailsChamp");
									HLCPriceMatrixVO priceVO1 = new HLCPriceMatrixVO();
											if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
											Iterator it = eventLevelChamp.iterator();
											
												while(it.hasNext()){
												priceVO1 = (HLCPriceMatrixVO)it.next();
												String CpriceId=priceVO1.getPriceId();
												String eventTyId1 = priceVO1.getEventTypeId();
												String eventTypeName1 =priceVO1.getEventTypeName();
												String eventLeId = priceVO1.getEventLevelId();
												String eventLevelName =priceVO1.getEventLevelName();
												String duePrice=String.valueOf(priceVO1.getDueDatePrice()); 
												String afterDuePrice=String.valueOf(priceVO1.getAfterDueDatePrice()); 
												String depAmt=String.valueOf(priceVO1.getDepositPrice()); 
												m++;
												
									%>

				 <input type="hidden" name="champSize" id="champSize" value="<%=eventLevelChamp.size()%>"/>
				 <input type="hidden" name="CeventLevelId<%=m%>" id="CeventLevelId<%=m%>" value="<%=eventLeId%>"/>
				 <input type="hidden" name="CpriceId<%=m%>" id="CpriceId<%=m%>" value="<%=CpriceId%>"/>
				 <%System.out.println("champSize :"+eventLevelChamp.size());%>
				 <%System.out.println("CpriceId :"+CpriceId);%>
				 
				 		 <div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
											<label class='control-label'><%=eventLevelName%></label>
									
										</div>
									
									  <div class='col-md-2'>
			
											<input type="text" name="txtDueC<%=m%>" id="txtDueC<%=m%>" class="form-control" value="<%=duePrice%>"   />
									
									</div>
								
									  <div class='col-md-2'>
			
											<input type="text" name="txtAfterDueC<%=m%>" id="txtAfterDueC<%=m%>" class="form-control" value="<%=afterDuePrice%>"  />
										
										</div>
									
									 <div class='col-md-2'>
						
										<input type="text" name="txtDepAmtC<%=m%>" id="txtDepAmtC<%=m%>" class="form-control" value="<%=depAmt%>"  />
									
									</div>
								</div>
							</div>
						</div>

		  <%}}else{%>
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
			   
			   				 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="appButton" id="appButton" value="Update">Update</button>
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

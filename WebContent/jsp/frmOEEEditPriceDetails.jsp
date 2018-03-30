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
	if(document.frmInsertPrice.acStatus.value==""){
		alert("Select Approve Status");
		document.frmInsertPrice.acStatus.focus();
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
						
							  <%    String eventId=(String)request.getAttribute("eventId");
									String itemID = (String)request.getAttribute("itemId");
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
	
					  <form name="frmInsertPrice" id="frmInsertPrice" class='form-horizontal' role='form' action="OEEAddPrice.html" method="post" onsubmit="return onValidate();">
					  <input type="hidden" name="cmd" value="updatePriceDetails"/>
					  <input type="hidden" name="eventId" value="<%=eventId%>"/>
					  <input type="hidden" name="itemId" value="<%=itemID%>"/>
					
							<div class='form-group'>
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Item Name:</label>
										  <div class='col-md-8'>
											  <div class='col-md-3 indent-small'>
												   <div class='form-group internal'>
											<%  ArrayList itemDetails = (ArrayList)request.getAttribute("itemDetails"); 
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
										</div>
						
						<div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
										<label class='control-label label1'>Event Level</label>
									
									</div>
						
									<div class="col-md-2">
									
										<label class='control-label label1 col-sm-offset-1'>Due Date Price</label>
										
									</div>
						
									<div class="col-md-2">
									
										<label class='control-label label1'>After-Due Date Price </label>
										
									</div>
						
								<div class="col-md-2">
								
									<label class='control-label label1 col-sm-offset-1'>Deposit Amount</label>
									
								</div>
							</div>
						</div>
					</div>		
			
		
			<!--<td class="tblRowHeadTwo">Type</td>-->
			
			
								<%
								String eventcnt="";
								ArrayList eventType = (ArrayList)request.getAttribute("eventType");
								if(eventType!=null && eventType.size()!=0){
								
								%>
							   <%   
									Iterator itr = eventType.iterator();
										int i=0;
										int j=0;
										while(itr.hasNext()){
											String [] uDet = (String[])itr.next();
											String eventTyId = uDet[0];
											String eventTypeName =uDet[1];
											i++;
											%>
												<p><%=eventTypeName%></p>
										
											<%
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
												
											if(eventTyId1.equals(eventTyId)){
											j++;
								%>
							<input type="hidden" name="noChampSize" id="noChampSize" value="<%=eventLevel.size()%>"/>
							<input type="hidden" name="eventcnt<%=j%>" id="eventcnt<%=j%>" value="<%=eventcnt%>"/>
							<input type="hidden" name="priceId<%=j%>" id="priceId<%=j%>" value="<%=priceId%>"/>
							<%System.out.println("priceId :"+priceId);%>
							<%System.out.println("noChampSize :"+eventLevel.size());%>
						
						 <div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
											<label class='control-label '><%=eventLevelName%></label>
										</div>
								
									<div class='col-md-2'>
									
										<input type="text" name="txtDue<%=j%>" id="txtDue<%=j%>" class="form-control" value="<%=duePrice%>"  />
										
									</div>
									
									<div class='col-md-2'>
									
										<input type="text" name="txtAfterDue<%=j%>" id="txtAfterDue<%=j%>" value="<%=afterDuePrice%>" class="form-control"   />
										
									</div>
										
									<div class=' col-md-2'>
										
										<input type="text" name="txtDepAmt<%=j%>" id="txtDepAmt<%=j%>" value="<%=depAmt%>" class="form-control"  />
												
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
							
							<div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
										<label class='control-label label1'>Event Level</label>
									
									</div>
						
									<div class="col-md-2">
									
										<label class='control-label label1 col-sm-offset-1'>Due Date Price</label>
										
									</div>
						
									<div class="col-md-2">
									
										<label class='control-label label1'>After-Due Date Price </label>
										
									</div>
						
								<div class="col-md-2">
								
									<label class='control-label label1 col-sm-offset-1'>Deposit Amount</label>
									
								</div>
							</div>
						</div>
					</div>	
	
		   
						   <%
							String champcnt="";
							ArrayList eventTypeChamp = (ArrayList)request.getAttribute("eventTypeChamp");
							if(eventTypeChamp!=null && eventTypeChamp.size()!=0){
							%>
							<%
								Iterator itr = eventTypeChamp.iterator();
								int k=0;
								int m=0;
								while(itr.hasNext()){
									String [] uDet = (String[])itr.next();
									String eventTyId = uDet[0];
									String eventTypeName =uDet[1];
								k++;
								%>
								<p><%=eventTypeName%></p>
								
								<%
								ArrayList eventLevelChamp = (ArrayList)request.getAttribute("champDetails");
								HLCPriceMatrixVO priceVO = new HLCPriceMatrixVO();
										if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
										Iterator it = eventLevelChamp.iterator();
											while(it.hasNext()){
											priceVO = (HLCPriceMatrixVO)it.next();
											String CpriceId=priceVO.getPriceId();
											String eventTyId1 = priceVO.getEventTypeId();
											String eventTypeName1 =priceVO.getEventTypeName();
											String eventLeId = priceVO.getEventLevelId();
											String eventLevelName =priceVO.getEventLevelName();
											String duePrice=String.valueOf(priceVO.getDueDatePrice()); 
											String afterDuePrice=String.valueOf(priceVO.getAfterDueDatePrice()); 
											String depAmt=String.valueOf(priceVO.getDepositPrice()); 
										   
										if(eventTyId1.equals(eventTyId)){
										m++;
							%>
			 <input type="hidden" name="champSize" id="champSize" value="<%=eventLevelChamp.size()%>"/>
			 <input type="hidden" name="champcnt<%=m%>" id="champcnt<%=m%>" value="<%=champcnt%>"/>
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
			
											<input type="text" name="txtAfterDueC<%=m%>" id="txtAfterDueC<%=m%>" class="form-control" value="<%=afterDuePrice%>"   />
										
										</div>
									
									 <div class='col-md-2'>
						
										<input type="text" name="txtDepAmtC<%=m%>" id="txtDepAmtC<%=m%>" class="form-control" value="<%=depAmt%>"   />
									
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
		   
						   <div class='form-group'>
                                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Approve Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		
												 <select name="acStatus" id="acStatus" class="form-control" >
													<option selected="selected" value="" >Select One</option>
													<%
														String[] status = new String[]{"Approved","Pending","Rejected"};
														for(int k =0; k<status.length; k++){
													%>
												 <option value="<%=status[k]%>"><%=status[k]%></option>
													<%}%>
												 </select>
												</div>
											</div>
										</div>
									</div>
		
							  <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type="submit" name="appButton" id="appButton">Submit</button>
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


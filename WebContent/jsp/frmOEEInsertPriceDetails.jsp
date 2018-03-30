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
function myValidate(){

if(document.frmInsertPrice.selItem.value==""){
	alert("Select an Item");
	document.frmInsertPrice.selItem.focus();
	return false;
	}

	var eventLvlValue=document.getElementById('noChampSize').value;
	//alert(eventLvlValue);
	if(eventLvlValue!=0){
	var flag=true;
for(var k=1;k<=eventLvlValue;k++){
	var chName = "txtDue"+k;
	var afterdueDt = "txtAfterDue"+k;
	var depAmt = "txtDepAmt"+k;
	
		if(document.getElementById(chName).value!=""){
			flag=false;
		}
		if(document.getElementById(chName).value!=""){
		if(!Number(document.getElementById(chName).value)){
			alert("Enter Valid Due Date Price");
			document.getElementById(chName).focus();
return false;

		}
		}
		if(document.getElementById(chName).value!=""){
		if(document.getElementById(afterdueDt).value==""){
			alert("Enter After Due Date Price");
			document.getElementById(afterdueDt).focus();
return false;

		}
		}	
		if(document.getElementById(afterdueDt).value!=""){
		if(!Number(document.getElementById(afterdueDt).value)){
			alert("Enter Valid After Due Date Price");
			document.getElementById(afterdueDt).focus();
return false;

		}
		}
		
		if(document.getElementById(depAmt).value!=""){
		if(!Number(document.getElementById(depAmt).value)){
			alert("Enter Valid Deposit Amount");
			document.getElementById(depAmt).focus();
return false;

		}
		}
	}
if(flag){
alert("Enter Any Due Date Price");
document.getElementById(chName).focus();
return false;
}
}


var champVal=document.getElementById('champSize').value;
	//alert(champVal);
	if(champVal!=0){
	var flag=true;
for(var k=1;k<=champVal;k++){
	var chName1 = "txtDueC"+k;
	var afterdueDt1 = "txtAfterDueC"+k;
	var depAmt1 = "txtDepAmtC"+k;
		if(document.getElementById(chName1).value!=""){
			flag=false;
		}
		if(document.getElementById(chName1).value!=""){
		if(!Number(document.getElementById(chName1).value)){
			alert("Enter Valid Due Date Price in Championship Details");
			document.getElementById(chName1).focus();
return false;

		}
		}
		
		if(document.getElementById(chName1).value!=""){
		if(document.getElementById(afterdueDt1).value==""){
			alert("Enter After Due Date Price in Championship Details");
			document.getElementById(afterdueDt1).focus();
return false;

		}
		}
		
		if(document.getElementById(afterdueDt1).value!=""){
		if(!Number(document.getElementById(afterdueDt1).value)){
			alert("Enter Valid After Due Date Price in Championship Details");
			document.getElementById(afterdueDt1).focus();
return false;

		}
		}
		
		if(document.getElementById(depAmt1).value!=""){
		if(!Number(document.getElementById(depAmt1).value)){
			alert("Enter Valid Deposit Amount in Championship Details");
			document.getElementById(depAmt1).focus();
return false;

		}
		}
	}
if(flag){
alert("Enter Any one Due Date Price in Championship Details");
document.getElementById(chName1).focus();
return false;
}

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
                            <h2>Online Entries: Insert Price Details </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
	
	
					  <%    String eventId=(String)request.getAttribute("eventId");
					  System.out.println("eventId in getAttribute"+eventId);
							String eventTypeId = (String)request.getAttribute("eventTypeId");
							System.out.println("eventTypeId in getAttribute"+eventTypeId);
							String itemID = (String)request.getAttribute("itemId");
							
							//ArrayList eventType = (ArrayList)request.getAttribute("eventType");
							ArrayList itemDetails = (ArrayList)request.getAttribute("itemDetails");
							
							String insertStatus = (String)request.getAttribute("insertStatus");
							String existStatus = (String)request.getAttribute("AlreadyExist");
							String iStatus = "";
							String isStatus="";
						if(insertStatus!=null && insertStatus.equalsIgnoreCase("success")) iStatus = "Price Details Inserted Successfully";
							else if(insertStatus!=null && insertStatus.equalsIgnoreCase("failed")) iStatus = "Price Details Not Inserted";
						if(existStatus!=null && existStatus.equalsIgnoreCase("AlreadyExist")) isStatus="Price Details Already Exists.Try Again!";	
									
					  %>

		 <%
		 	if(insertStatus!=null && insertStatus.trim().length()!=0){
		 %>
		 <p id='p_error'><%=iStatus%></p>
		 
		 <%}%> 
		 <%
		 	if(existStatus!=null && existStatus.trim().length()!=0){
		 %>
		 <p id='p_error'><%=isStatus%></p>
		
		 <%}%>
		 
		 <form class='form-horizontal' role='form' name="frmInitPrice" id="frmInitPrice" action="OEEAddPrice.html" method="post">
		 <input type="hidden" name="cmd" value="initPriceDetails" />
		
		 </form>
		
		  <form name="frmInsertPrice" id="frmInsertPrice" action="OEEAddPrice.html" method="post" onsubmit="return myValidate();">
		  <input type="hidden" name="cmd" value="insertPriceDetails"/>
		  <input type="hidden" name="eventId" value="<%=eventId%>"/> 
		  <%String newItem=(String)request.getAttribute("newItem");
		    String itemName=(String)request.getAttribute("itemName");
			String itemType=(String)request.getAttribute("itemType");
			String chargeType=(String)request.getAttribute("chargeType");
			if(newItem!=null && newItem.trim().length()!=0) newItem=itemName;
			else newItem="";
		  %>
		  <input type="hidden" name="newItem" value="<%=newItem%>">
		  <input type="hidden" name="itemName" value="<%=itemName%>">
		  <input type="hidden" name="itemType" value="<%=itemType%>">
		  <input type="hidden" name="chargeType" value="<%=chargeType%>">
		 
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Item Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
		
												 <select name="selItem" id="selItem" class="form-control">
													<option value="" selected="selected">Select One</option>
													<%
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
									</div>
		
		 				
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
			

			
			<!--<td class="tblRowHeadTwo">Type</td>-->
			
				
			<%
						ArrayList eventLevel = (ArrayList)request.getAttribute("eventLevel");					
						if(eventLevel!=null && eventLevel.size()!=0){
						System.out.println("eventLevel"+eventLevel);
						Iterator it = eventLevel.iterator();
						int j=0;
						String tempEve="";						
						while(it.hasNext()){
							String [] Det = (String[])it.next();
							String eventTyId = Det[0];						
							String eventTypeName =Det[1];
							String eventLeId = Det[2];
							String eventLevelName =Det[3];
									
						j++;
						if(!(tempEve.equalsIgnoreCase(eventTyId))){
			%>
					<p><%=eventTypeName%></p>
					
					<%}%>
						
<input type="hidden" name="noChampSize" id="noChampSize" value="<%=eventLevel.size()%>"/>
 <input type="hidden" name="eveTypId<%=j%>" id="eveTypId<%=j%>" value="<%=eventTyId%>"/>
 <input type="hidden" name="eveLevId<%=j%>" id="eveLevId<%=j%>" value="<%=eventLeId%>"/>
<%System.out.println("noChampSize :"+eventLevel.size());%>



						<div class="margin marginn">
			  
							<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									  <div class='col-md-offset-1 col-md-2'>
											<label class='control-label'><%=eventLevelName%></label>
									  </div>
									  
									  
 										<div class='col-md-2'>
											<input type="text" name="txtDue<%=j%>" id="txtDue<%=j%>" class="form-control"   />
										</div>
										
										 <div class='col-md-3'>
											<input type="text" name="txtAfterDue<%=j%>" id="txtAfterDue<%=j%>" class="form-control"  />
										</div>
										
										 <div class='col-md-2'>
											<input type="text" name="txtDepAmt<%=j%>" id="txtDepAmt<%=j%>" class="form-control"/>
										</div>
										
										</div>
										
									</div>
									
								</div>
									
	

			
   
		   <%tempEve=Det[0];}}else{%>
	  		
						<div class="form-group">
							<div class="col-md-12 gp">
							 		<div class='col-md-4'>
									 </div>		
							 		 <div class='col-md-4'>
						    
										No records available. 
								
										</div>
									</div>
								</div>
		   <%}%>
	
				<p>Championship Details:</p>
	
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
				ArrayList eventLevelChamp = (ArrayList)request.getAttribute("eventLevelChamp");
						if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
						System.out.println("eventLevelChamp"+eventLevelChamp);
						Iterator it = eventLevelChamp.iterator();
						int m=0;
						String tempChmpEve="";	
						while(it.hasNext()){
							String [] Det = (String[])it.next();
							String eventTyId1 = Det[0];
							String eventTypeName1 =Det[1];
							String eventLeId = Det[2];
							String eventLevelName =Det[3];
						
						m++;
						if(!(tempChmpEve.equalsIgnoreCase(eventTyId1))){
			%>
			
			
			 			<p><%=eventTypeName1%></p>
									  
			
				<%}%>
				
					 <input type="hidden" name="champSize" id="champSize" value="<%=eventLevelChamp.size()%>"/>
					  <input type="hidden" name="eveTypIdC<%=m%>" id="eveTypIdC<%=m%>" value="<%=eventTyId1%>"/>
					 <input type="hidden" name="eveLevIdC<%=m%>" id="eveLevIdC<%=m%>" value="<%=eventLeId%>"/>

 							<%System.out.println("champSize :"+eventLevelChamp.size());%>
							
							
						<div class="margin marginn">
			  
							<div class="form-group">
								 
								 <div class="col-md-12 gp">
								
									  <div class='col-md-offset-1 col-md-2'>
											<label class='control-label'><%=eventLevelName%></label>
									</div>
									<div class='col-md-2'>
											<input type="text" name="txtDueC<%=m%>" id="txtDueC<%=m%>" class="form-control"   />
										</div>
										
										 <div class='col-md-3'>
											<input type="text" name="txtAfterDueC<%=m%>" id="txtAfterDueC<%=m%>" class="form-control"  />
										</div>
										
										 <div class='col-md-2'>
											<input type="text" name="txtDepAmtC<%=m%>" id="txtDepAmtC<%=m%>" class="form-control"   />
										</div>
										
										</div>
										
									</div>
									
								</div>
									
	


		
		  <%tempChmpEve=Det[0];}}else{%>
	  		
			
						<div class="form-group">
							<div class="col-md-12 gp">
							 		<div class='col-md-4'>
									 </div>		
							 		 <div class='col-md-4'>
						    
										No records available. 
								
										</div>
									</div>
								</div>
		   <%}%>
				      
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="appButton" id="appButton" value="Submit">Submit</button>
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

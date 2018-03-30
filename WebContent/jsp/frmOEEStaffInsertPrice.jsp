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

function myValidate(){

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
alert("Enter Any one Due Date Price");
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
									<h2>Online Entries: Insert Price Details</h2>
								</div>
				<!--==============================Form Title=================================-->
						<div class='panel-body'>

 
						  <%    
								String eventTypeId = (String)request.getAttribute("eventTypeId");
								String itemID = (String)request.getAttribute("itemId");
								String areaID = (String)request.getAttribute("areaId");
								String enableButton = (String)request.getAttribute("enableButton");
								
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
								
									<label class='control-label'><%=iStatus%></label>
								
								
								
								 <%}%> 
								 <%
									if(existStatus!=null && existStatus.trim().length()!=0){
								 %>
		 
								<label class='control-label'><%=isStatus%></label>
	
		 
								 <%}%>
		 
		 <form class='form-horizontal' role='form' name="frmInitPrice" id="frmInitPrice" action="OEEAddFixedPrice.html" method="post" onsubmit="return onValidate();">
		 
		 <input type="hidden" name="cmd" value="initPriceDetails" />
		 
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
										 </select><span  id="span_astriesk">*</span>
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
										 </select><span  id="span_astriesk">*</span>
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
                         <div class='col-md-offset-4 col-md-4'>
                               <button class='btn-lg btn-primary' type='submit'>Submit</button>
						</div>
					</div>
				
		 </form>
		
		  <form class='form-horizontal' role='form' name="frmInsertPrice" id="frmInsertPrice" action="OEEAddFixedPrice.html" method="post" onsubmit="return myValidate();">
		  <input type="hidden" name="cmd" value="insertPriceDetails"/>
			<input type="hidden" name="itemID" value="<%=itemID%>" />
			<input type="hidden" name="eventTypeId" value="<%=eventTypeId%>" />
			<input type="hidden" name="areaID" value="<%=areaID%>" />		 
		 
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
						
						ArrayList eventLevel = (ArrayList)request.getAttribute("eventLevelByType");
						int j=0;
						if(eventLevel!=null && eventLevel.size()!=0){
						Iterator it = eventLevel.iterator();
						
						while(it.hasNext()){
							String [] Det = (String[])it.next();
							String eventTypeId1 = Det[0];
							String eventLevelId = Det[1];
							String eventLevelName =Det[2];
							
							j++;
							%>
					<input type="hidden" name="noChampSize" id="noChampSize" value="<%=eventLevel.size()%>"/>
					<input type="hidden" name="eventLevelId<%=j%>" id="eventLevelId<%=j%>" value="<%=eventLevelId%>"/>

					 <div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
											<label class='control-label '><%=eventLevelName%></label>
										</div>
								
									<div class='col-md-2'>
									
										<input type="text" name="txtDue<%=j%>" id="txtDue<%=j%>" class="form-control"   />
										
									</div>
									
									<div class='col-md-2'>
									
										<input type="text" name="txtAfterDue<%=j%>" id="txtAfterDue<%=j%>" class="form-control"   />
										
									</div>
										
									<div class=' col-md-2'>
										
										<input type="text" name="txtDepAmt<%=j%>" id="txtDepAmt<%=j%>" class="form-control"  />
												
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
	
			
						<p>&emsp;Championship Details:</p>
						
					 <div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
											<label class='control-label label1 '>Event Level</label>
									
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
				ArrayList eventLevelChamp = (ArrayList)request.getAttribute("eventLevelByArea");
				int m=0;
						if(eventLevelChamp!=null && eventLevelChamp.size()!=0){
						    Iterator it = eventLevelChamp.iterator();
							while(it.hasNext()){
							String [] Det = (String[])it.next();
							String areaId = Det[0];
							String CeventLevelId = Det[1];
							String CeventLevelName =Det[2];
							m++;
				%>
					 <input type="hidden" name="champSize" id="champSize" value="<%=eventLevelChamp.size()%>"/>
					 <input type="hidden" name="CeventLevelId<%=m%>" id="CeventLevelId<%=m%>" value="<%=CeventLevelId%>"/>
					 <%System.out.println("CeventLevelId"+CeventLevelId);%> 
					 
			  		<div class="margin marginn">
						  
							 <div class="form-group">
								 
								 <div class="col-md-12 gp">
											   
									  <div class='col-md-offset-2  col-md-2'>
							
											<label class='control-label'><%=CeventLevelName%></label>
									
										</div>
									
									  <div class='col-md-2'>
			
											<input type="text" name="txtDueC<%=m%>" id="txtDueC<%=m%>" class="form-control"   />
									
									</div>
								
									  <div class='col-md-2'>
			
											<input type="text" name="txtAfterDueC<%=m%>" id="txtAfterDueC<%=m%>" class="form-control"  />
										
										</div>
									
									 <div class='col-md-2'>
						
										<input type="text" name="txtDepAmtC<%=m%>" id="txtDepAmtC<%=m%>" class="form-control"  />
									
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
									<p>No Records Found</p>
									</div>
							</div>
						</div>
					
				
		   <%}%>
		   <%if(enableButton!=null){%>
		  		 
				 <div class='form-group'>
				    <div class='col-md-offset-5 col-md-1'>
						<button class='btn-lg btn-primary' type='submit'>Submit</button>
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

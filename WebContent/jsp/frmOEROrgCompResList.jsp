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
<script src="js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript" type="text/javascript">
function onValidate(){
	if(document.myform1.selYear.value==""){
		alert("Select a Year");
		document.myform1.selYear.focus();
		return false;
	}
	if(document.myform1.selTitle.value==""){
		alert("Select Event Title");
		document.myform1.selTitle.focus();
		return false;
	}
	if(document.myform1.eventType.value==""){
		alert("Select Event Type");
		document.myform1.eventType.focus();
		return false;
	}
	return true;
}
function postData(year){
location.href="OEROrgCompRes.html?cmd=initEventTitleList&year="+year;

}	
function postType(eventId){
var year=document.getElementById("selYear").value

location.href="OEROrgCompRes.html?cmd=initEventTypeList&eventId="+eventId+"&year="+year;

}	
</script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body>
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<!--==============================================header start here============================================-->
<div>
 <!-- HEADER START HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>
<!--==============================================header end here============================================-->


<!--==============================================content start here============================================-->
<section id="content">

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
      <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>

  <tr>
      <td align="center" valign="middle" class="tableCommonBg">
	  <!--==============================================import content code start here============================================-->
	  
	  
	  <table  width="100%" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border-width:thin;border-style:groove;border-color:#000000">
		  
		  <tr>
			
			<td class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
 			
<table width="100%"  border="0"  align="center" cellpadding="0" cellspacing="0" class="tblInnerContainer">
  <tr>
    <td colspan="5" class="tblMainHead" style="border-bottom-color:#000000;border-bottom-style:groove;border-bottom-width:thin">
	<strong>Online Entries :</strong> <span class="styleBoldTwo"><strong>Organizer List</strong></span></td>
  </tr>
  
  <%
	java.util.Date orgDate = new java.util.Date();
	int currentYear = 1900+orgDate.getYear();
	String selYear = (String)request.getAttribute("tempYear");
	String eventId=(String)request.getAttribute("eventId");
	String eventTypeId=(String)request.getAttribute("eventTypeId");
	String eventTyAndLevel=(String)request.getAttribute("eventTyAndLevel");
	System.out.println("selYear : "+selYear);
	int selectedYear = 0;
	if(selYear!=null && selYear.trim().length()!=0){
		selectedYear = Integer.parseInt(selYear);
	}
	
%>
<%    
		
		String insertStatus = (String)request.getAttribute("insertStatus");
		String existStatus = (String)request.getAttribute("AlreadyExist");
		String iStatus = "";
		String isStatus="";
	if(insertStatus!=null && insertStatus.equalsIgnoreCase("success")) iStatus = "Result Details Inserted Successfully";
		else if(insertStatus!=null && insertStatus.equalsIgnoreCase("failed")) iStatus = "Result Details Not Inserted";
	if(existStatus!=null && existStatus.equalsIgnoreCase("AlreadyExist")) isStatus="Result Details Already Exists.Try Again!";	
				
  %>
  
 <tr>
 	<td>
		 <table  width="100%" border="0" cellpadding="0" align="center" cellspacing="0" >
		 <%
		 	if(insertStatus!=null && insertStatus.trim().length()!=0){
		 %>
		 <tr>
		 <td class="styleError" colspan="13"><%=iStatus%></td>
		 </tr>
		 <%}%>
		 <%
		 	if(existStatus!=null && existStatus.trim().length()!=0){
		 %>
		 <tr>
		 <td class="styleError" colspan="13"><%=isStatus%></td>
		 </tr>
		 <%}%> 	
		<form name="myform1" id="myform1" action="OEROrgCompRes.html" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="listDetails" />
		<input type="hidden" name="eventId" value="<%=eventId%>" />
		<input type="hidden" name="initSelYear" value="<%=selYear%>" />
		
		<tr>
		<td colspan="12" align="center"><strong>Year:</strong>
						<select name="selYear" id="selYear" class="selectboxOne" onchange="postData(this.value);" >
							<option selected="selected" value="" >Select One</option>
							<%
							for(int i=2000; i<(currentYear+2); i++){
							if(selectedYear!=0 && selectedYear==i){
							%>
							<option value="<%=i%>" selected="selected"><%=i%></option>
							<%}else{%>
							<option value="<%=i%>"><%=i%></option>
							<%}}%>
						</select><span class="asterisk">&nbsp;*</span>
		<strong>Event Title:</strong> 
						<select name="selTitle" id="selTitle" class="selectboxOne" onchange="postType(this.value);">
							<option selected="selected" value="">Select One</option>
							<%
							ArrayList eventTitles = (ArrayList)request.getAttribute("eventTitles");
							if(eventTitles!=null&& eventTitles.size()!=0){
							Iterator list = eventTitles.iterator();
							while(list.hasNext()){
							String str[] = (String [])list.next();
							String eventId1 = str[0];
							String eventTitle = str[1];
							
							if(eventId1!=null && eventId1.equalsIgnoreCase(eventId)){
			%>
			<option value="<%=eventId1%>" selected="selected" ><%=eventTitle%></option>
			<%}else{%>
			<option value="<%=eventId1%>" ><%=eventTitle%></option>
			<%}}}%>
							
						</select><span class="asterisk">&nbsp;*</span>
		<strong>EventType:</strong> 
						<select name="eventType" id="eventType" class="selectboxOne">
							<option value="" selected="selected">Select One</option>
							<%String eventcnt="";
							ArrayList eventTypeDetails = (ArrayList)request.getAttribute("eventType");
							if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
							Iterator list = eventTypeDetails.iterator();
							while(list.hasNext()){
							String str[] = (String [])list.next();
							String eventTypeId1 = str[0];
							String eventTypeName = str[1];
							eventcnt=eventTypeId1+"#"+eventTypeName;
							if(eventTypeId1!=null && eventTypeId1.equalsIgnoreCase(eventTypeId)){
			%>
			<option value="<%=eventcnt%>" selected="selected" ><%=eventTypeName%></option>
			
			<%}else{%>
			<option value="<%=eventcnt%>" ><%=eventTypeName%></option>
			<%}}}%>
						</select><span class="asterisk">&nbsp;*</span>
				
		<input type="submit" name="submit" value="Submit" class="button-add"/>
		    </td>
			</tr>
			</form>
	         <form name="myform" id="myform" action="OEROrgCompRes.html" method="post" >
		    <input type="hidden" name="cmd" value="insertResultDetails" />
			<input type="hidden" name="eventId" value="<%=eventId%>" />
		    <input type="hidden" name="tempSelYear" value="<%=selYear%>" />
		    <input type="hidden" name="eventTypeId" value="<%=eventTypeId%>" />
			<input type="hidden" name="eventTyAndLevel" value="<%=eventTyAndLevel%>" />
			<td class="tblRowHeadTwo">Event Id</td>
			<td class="tblRowHeadTwo">Event Type</td>
			<td class="tblRowHeadTwo">Event Level</td>
			<td class="tblRowHeadTwo">Event Division</td>
			<td class="tblRowHeadTwo">Horse Member Id</td>
			<td class="tblRowHeadTwo">Horse Name</td>
			<td class="tblRowHeadTwo">Rider Id</td>
			<td class="tblRowHeadTwo">Rider FName</td>
			<td class="tblRowHeadTwo">Rider LName</td>
			<td class="tblRowHeadTwo">Final Place</td>
			<td class="tblRowHeadTwo">Phase D Ins</td>
			<td class="tblRowHeadTwo">Dress Place</td>
			<td class="tblRowHeadTwo">XC Phase D ElapTime</td>
			<td class="tblRowHeadTwo">Show Jump Penal</td>
			<td class="tblRowHeadTwo">RandTC</td>
			<td class="tblRowHeadTwo">RandTA</td>
			<td class="tblRowHeadTwo">DanRidPenal</td>
			<td class="tblRowHeadTwo">Final Points</td>
			<td class="tblRowHeadTwo">Pinney No</td>
			<td class="tblRowHeadTwo">SteepleChase Time Penal</td>
			<td class="tblRowHeadTwo">XC Phase D Jump Penal</td>
			<td class="tblRowHeadTwo">To Date Points</td>
			<td class="tblRowHeadTwo">Show Jump Time Penal</td>

			<td class="tblRowHeadTwo">Points</td>
			<td class="tblRowHeadTwo">SteepleChase Jump Penal</td>
			<td class="tblRowHeadTwo">XC Phase D Time Penal</td>
			<td class="tblRowHeadTwo">Last InS</td>
			<td class="tblRowHeadTwo">Dress Penal</td>
			<td class="tblRowHeadTwo">To Date Place</td>
			<td class="tblRowHeadTwo">Event Sub Division</td>
			<td class="tblRowHeadTwo">First Inspection</td>
			
			
				<%int i=0;
				HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
				ArrayList compRegList = (ArrayList)request.getAttribute("eventcompResDetails");
				if(compRegList!=null && compRegList.size()!=0){
					Iterator itr = compRegList.iterator();
					while(itr.hasNext()){
						compVO = (HLCCompRegistrationVO)itr.next();
						String registrationId = compVO.getRegistrationId();
						String eveId=compVO.getEventId();
						String riderFirstName=compVO.getRiderFirstName();
						String riderLastName=compVO.getRiderLastName();
						String horseMemberId = compVO.getHorseMemberId();
						String riderId = compVO.getRiderMemberId();
						String eventType = compVO.getEventType();
						String eventLevel = compVO.getEventLevel();
						String division = compVO.getEventDivision();
						String horseName=compVO.getHorseName();
						String riderUserId=compVO.getRiderUserId();
						i++;		
			%>
		  <tr>
<input type="hidden" name="resultSize" id="resultSize" value="<%=compRegList.size()%>"/>		  
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(eveId)%></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(eventType)%></td>	
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(eventLevel)%></td>	
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(division)%></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(horseMemberId)%></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(horseName)%></td>	
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(riderId)%></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(riderFirstName)%></td>	
<td  bgcolor="#E3E1D2" class="alignCenter"><%=nullCheck(riderLastName)%></td>	
<input type="hidden" name="eveId<%=i%>" id="eveId<%=i%>" value="<%=eveId%>" />
<input type="hidden" name="eventType<%=i%>" id="eventType<%=i%>" value="<%=eventType%>" />
<input type="hidden" name="eventLevel<%=i%>" id="eventLevel<%=i%>" value="<%=eventLevel%>" />
<input type="hidden" name="division<%=i%>" id="division<%=i%>" value="<%=division%>" />
<input type="hidden" name="horseMemberId<%=i%>" id="horseMemberId<%=i%>" value="<%=horseMemberId%>" />
<input type="hidden" name="horseName<%=i%>" id="horseName<%=i%>" value="<%=horseName%>" />
<input type="hidden" name="riderId<%=i%>" id="riderId<%=i%>" value="<%=riderId%>" />
<input type="hidden" name="riderFirstName<%=i%>" id="riderFirstName<%=i%>" value="<%=riderFirstName%>" />
<input type="hidden" name="riderLastName<%=i%>" id="riderLastName<%=i%>" value="<%=riderLastName%>" />
<input type="hidden" name="riderUserId<%=i%>" id="riderUserId<%=i%>" value="<%=riderUserId%>" />
	
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="finalPlace<%=i%>" id="finalPlace<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="phaseDIns<%=i%>" id="phaseDIns<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="dressPlace<%=i%>" id="dressPlace<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="XCphaseDElapTime<%=i%>" id="XCphaseDElapTime<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="showJumpPenal<%=i%>" id="showJumpPenal<%=i%>" class="textboxOne" size="10"  /></td>

<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="RandTC<%=i%>" id="RandTC<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="RandTA<%=i%>" id="RandTA<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="danRidPenal<%=i%>" id="danRidPenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="finalPoints<%=i%>" id="finalPoints<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="pinneyNo<%=i%>" id="pinneyNo<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="steepleChaseTimePenal<%=i%>" id="steepleChaseTimePenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="XCPhaseDJumpPenal<%=i%>" id="XCPhaseDJumpPenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="toDatePoints<%=i%>" id="toDatePoints<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="showJumpTimePenal<%=i%>" id="showJumpTimePenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="hlcPonits<%=i%>" id="hlcPonits<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="steepleChaseJumpPenal<%=i%>" id="steepleChaseJumpPenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="XCPhaseDTimePenal<%=i%>" id="XCPhaseDTimePenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="lastInS<%=i%>" id="lastInS<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="dressPenal<%=i%>" id="dressPenal<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="toDatePlace<%=i%>" id="toDatePlace<%=i%>" class="textboxOne" size="10"  /></td>

<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="eventSubDiv<%=i%>" id="eventSubDiv<%=i%>" class="textboxOne" size="10"  /></td>
<td  bgcolor="#E3E1D2" class="alignCenter"><input type="text" name="firstIns<%=i%>" id="firstIns<%=i%>" class="textboxOne" size="10"  /></td>
		   </tr>
			<%
				}
			}else{
			%>
	  		<tr>
			<td height="19" bgcolor="#E3E1D2" colspan="12" align="center"><strong>No Records Found</strong></td>
           </tr>
		   <%}%>
		<%if(compRegList!=null && compRegList.size()!=0){%>   
		     <tr>
					<td colspan="12" align="center">
					<input type="submit" name="appButton" id="appButton" value="Submit" class="button-add"  />	</td>
				  </tr>
				  <%}%>
			 </form>
	  </table>		 
	  
	
	</td>
</tr>  
</table>
			<!-- CONTENTS END HERE -->		
			</td>
		  </tr>
	  </table>
	  
	  
	  
	  <!--==============================================import content code end here============================================-->
	  
	  
	  </td>
    </tr>
	
		<tr><td>&nbsp;</td></tr>

  </table>
  </section>
  
<!--==============================================content end here============================================-->


<!--==============================================footer start here============================================-->
 <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
<!--==============================================footer end here============================================-->

</body>
</html>

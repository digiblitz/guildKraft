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
<%@ page import="com.hlcutil.HLCCompResultVO"%>
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
	if(document.myform.year.value==""){
		alert("Select a Year");
		document.myform.year.focus();
		return false;
	}
	if(document.myform.selTitle.value==""){
		alert("Select Event Title");
		document.myform.selTitle.focus();
		return false;
	}
	
	return true;
}
function postData(year){
location.href="orgAndStaffResultList.html?cmd=initAllEventTitle&year="+year;

}	

</script>

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
                            <h2>Online Entries: Staff Result List  </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
  
  <%
	java.util.Date orgDate = new java.util.Date();
	int currentYear = 1900+orgDate.getYear();
	String yearStr = (String)request.getAttribute("year");	
	System.out.println("yearStr : "+yearStr);
	String eventId=(String)request.getAttribute("tempeventId");	
	System.out.println("eventId in jsp  : "+eventId);
	int selectedYear = 0;
	if(yearStr!=null && yearStr.trim().length()!=0){
		selectedYear = Integer.parseInt(yearStr);
	}
		
%>	

		<form class='form-horizontal' role='form' name="myform" id="myform" action="orgAndStaffResultList.html" method="post" onsubmit="return onValidate();">
		<input type="hidden" name="cmd" value="staffResultList" />
		
						 <div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>			
												<select name="year" id="year" class="form-control" onchange="postData(this.value);" >
													<option selected="selected" value="" >Select One</option>
													<%
													for(int i=2000; i<(currentYear+2); i++){
													if(selectedYear!=0 && selectedYear==i){
													%>
													<option value="<%=i%>" selected="selected"><%=i%></option>
													<%}else{%>
													<option value="<%=i%>"><%=i%></option>
													<%}}%>
												</select>
												<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
												
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>		
		
															<select name="selTitle" id="selTitle" class="form-control" >
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
																
															</select>
															<span id="span_astriesk">*</span>
														</div>
													</div>
												</div>
											</div>
											
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type='submit'>Submit</button>
                                    </div>
								</div>
		
			</form>
		
					<div class="form-group">
						<div class="row">	
							<div class="col-md-12 gp">
								<div class="col-md-1">
									<label class="control-label label1">Event Id</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Event Type</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Event Title</label>
								</div>
								<div class="col-md-1">
									<label class="control-label label1">HorseId</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Horse Name</label>
								</div>
								<div class="col-md-1">
									<label class="control-label label1">Rider Id</label>
								</div>
								<div class="col-md-2">
									<label class="control-label label1">Rider Name</label>
								</div>
								<div class="col-md-1">
									<label class="control-label label1">View</label>
								</div>	
							</div>
						</div>
					</div>				
			
		<%
				System.out.println("before HLCCompResultVO() ::::::::::::::::::::::::::::::::::::::");
				HLCCompResultVO compVO = new HLCCompResultVO();
				ArrayList eventCompResList = (ArrayList)request.getAttribute("eventCompResList");
				if(eventCompResList!=null && eventCompResList.size()!=0){
					Iterator itr = eventCompResList.iterator();
					while(itr.hasNext()){
					System.out.println("before while loop ::::::::::::::::::::::::::::::::::::::");
						compVO = (HLCCompResultVO)itr.next();
						String compResultId = compVO.getCompResultId();
						System.out.println("compResultId in jsp"+compResultId);
						String eveId = compVO.getEventId();
						System.out.println("event id in jsp :::::::::::::::::::::::::"+eveId);
						String eveType = compVO.getEventTypeName();
						String eveTitle = compVO.getEventTitle();
						String riderMemId = compVO.getRiderMemberId();
						String rFName = compVO.getRiderFirstName();
						String rLName = compVO.getRiderLastName();
						String horseId = compVO.getHorseMemberId();
						String hName = compVO.getHorseName();
													
			%>
			
			
						<div class="form-group">
						<div class="row">	
							<div class="col-md-12 gp">
								<div class="col-md-1">
									<label class="control-label "><%=eveId%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=eveType%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=eveTitle%></label>
								</div>
								<div class="col-md-1">
									<label class="control-label "><%=horseId%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=hName%></label>
								</div>
								<div class="col-md-1">
									<label class="control-label "><%=riderMemId%></label>
								</div>
								<div class="col-md-2">
									<label class="control-label "><%=rFName%>&nbsp;<%=rLName%></label>
								</div>
								<div class="col-md-1">
									<button class='btn-sm btn-primary' type="button" name="process" value="View"   onclick="location.href='ParticipantResult.html?cmd=myCompResultView&compResultId=<%=compResultId%>'">View</button>
								</div>	
							</div>
						</div>
					</div>	


	
			<%
				}
			}else{
			%>
	  					<div class="form-group">
							<div class="row">	
								<div class="col-md-12 gp">
									<div class="col-md-4">
									</div>
									<div class="col-md-4">
											No Records Found
										</div>
									</div>
								</div>
							</div>
		   <%}%>
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

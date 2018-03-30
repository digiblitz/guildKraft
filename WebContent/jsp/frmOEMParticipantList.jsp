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
<%@ page import="com.hlcutil.HLCCompRegistrationVO"%>
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
	if(document.myform.year.value==""){
		alert("Select a Year");
		document.myform.year.focus();
		return false;
	}
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
                            <h2>Online Entries :My Event Registration Details</h2>
                        </div>
						
						<%
							java.util.Date orgDate = new java.util.Date();
							int currentYear = 1900+orgDate.getYear();
							String yearStr = (String)request.getAttribute("year");	
							System.out.println("yearStr : "+yearStr);
							int selectedYear = 0;
							if(yearStr!=null && yearStr.trim().length()!=0){
								selectedYear = Integer.parseInt(yearStr);
							}
								
						%>	
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="myform" id="myform" action="ParticipantList.html" method="post" onsubmit="return onValidate();">
							
                                <input type="hidden" name="cmd" value="partList"/>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Year:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="year" id="year" class="form-control">
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
									<div class='col-md-12'>
										<div class='col-md-4'>
										</div>
										<div class='col-md-6'>
											 <button class='btn-lg btn-primary' type='submit'>Submit</button>
										</div>
									</div>
                                </div>

                                
								
                            
							
							
					<div class='form-group'>
						<div class='col-md-16'>
							<div class='col-md-2'>
							<label class='control-label label1'>MemberID</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Id</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Type</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Event Level</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>Status</label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'>View</label>
							</div>
						</div>
							
				</div>
				
				
							<%
								HLCCompRegistrationVO compVO = new HLCCompRegistrationVO();
								ArrayList myCompRegList = (ArrayList)request.getAttribute("myCompRegDetails");
								if(myCompRegList!=null && myCompRegList.size()!=0){
									Iterator itr = myCompRegList.iterator();
									while(itr.hasNext()){
										compVO = (HLCCompRegistrationVO)itr.next();
										String registrationId = compVO.getRegistrationId();
										String horseMemberId = compVO.getHorseMemberId();
										String riderId = compVO.getRiderMemberId();
										String eventId = compVO.getEventId();
										String eventType = compVO.getEventType();
										String eventLevel = compVO.getEventLevel();
										String division = compVO.getEventDivision();
										String status = compVO.getQualifystatus();
												
							%>	
							
				<div class='form-group'>
						<div class='col-md-16'>
							<div class='col-md-2'>
							<label class='control-label label1'><%=riderId%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'><%=eventId%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'><%=eventType%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'><%=eventLevel%></label>
							</div>
							
							<div class='col-md-2'>
							<label class='control-label label1'><%=status%></label>
							</div>
							
							<div class='col-md-2'>
							
							<button class='btn-lg btn-primary' type='button' name="process" value="View" onclick="location.href='ParticipantList.html?cmd=myCompRegView&registrationId=<%=registrationId%>'" >View</button>
							</div>
						</div>
							
				</div>
				
				<%}}else{%>
				
					<div class='col-md-8'>
						<div class='col-md-6'>
						</div>
						<div class='col-md-4'>
							No Records Found
							</div>
							</div>
					
				
					
					
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

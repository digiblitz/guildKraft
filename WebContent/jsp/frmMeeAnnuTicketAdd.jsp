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

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript">
function validate()
{
	if(document.frmMeeAnnuTicketAdd.act_typ.options.selected=="Select One")
	{
	alert('Select Any of the Activity Type');
	document.frmMeeAnnuTicketAdd.act_typ.focus();
	return false;
	}
	if(document.frmMeeAnnuTicketAdd.act_typ.selected == 0)
	{
	alert('Select Any of the Activity Type');
	document.frmMeeAnnuTicketAdd.act_typ.focus();
	return false;
	}
	if((document.frmMeeAnnuTicketAdd.ticket.value=="")||(document.frmMeeAnnuTicketAdd.ticket.value.indexOf(' ')==0))
	{
	alert('Ticket Cannot be empty');
	document.frmMeeAnnuTicketAdd.ticket.focus();
	return false;
	}
}
function fill(val)
{
document.frmMeeAnnuTicketAdd.act_typ.value=val;
}
</script>

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
					
					
						
                        <div class='panel-body'>
					
													
					
					<form class='form-horizontal' role='form' name="frmMeeAnnuTicketAdd" method="post" action="./AnnualTcktDetails.html" onsubmit="return validate();">
					
						<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Meetings: New Annual Ticket</h2>
                        </div>
					<!--==============================Form Title=================================-->	
						
						<%
						String errSt = (String)request.getAttribute("err");
						if(errSt.equals("st")){
						
						%>				
						  <p id='p_error'>Ticket you try to avail is already booked!</p>
						 
					    <%}%>						  
						  
						<p> Fields mark with asterisk <span style="color:#FF0000;">(*)</span>are mandatory</p>
						
						<input type="hidden" name="process" value="insert">
	
					 		<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Type : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="act_type" id="act_type" class="form-control" onchange="fill(this.value);">
													<option selected="selected" value="Select One" >Select One</option>
													<%		   		ArrayList detail = (ArrayList) session.getAttribute("details");
																	System.out.println("Array List Size is"+detail.size());  
																	Iterator itr = detail.iterator();
																	while(itr.hasNext())
																	{
																	String[] s= (String [])itr.next();
																	String annualTId = s[0];
																	String availTicket = s[1];
																	String meeId  = s[2];
																	String meeName = s[3];
													%>
													<option value="<%=annualTId%>"><%= meeName%></option>	
																 <% } %>		
													</select>
													<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<input type="hidden" name="act_typ"/>
								</div>
									
									
								<div class='form-group'>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Tickets : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="ticket" id="ticket" type="text" class="form-control"/>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'name="Submit" type="reset"  value="Reset">Reset</button>
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


  
		
	
						

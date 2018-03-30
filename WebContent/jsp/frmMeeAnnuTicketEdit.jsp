<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
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
	if((document.frmMeeAnnuTicketEdit.ticket.value=="")||(document.frmMeeAnnuTicketEdit.ticket.value.indexOf(' ')==0))
	{
	alert('Ticket Cannot be empty');
	document.frmMeeAnnuTicketEdit.ticket.focus();
	return false;
	}
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
					
						<%
									String annualTId = "";
									String availTicket = "";
									String meeId = "";
									String meeName = "";
						%>								
					
					<form class='form-horizontal' role='form' name="frmMeeAnnuTicketEdit" method="post" action="./AnnualTcktDetails.html" onsubmit="return validate();">
					<input type="hidden" name="process" value="updateedit"/>
						<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Meetings: Edit Annual Ticket</h2>
                        </div>
					<!--==============================Form Title=================================-->	
						
						<%
							String errSt = (String)request.getAttribute("err");
							if(errSt.equals("st")){
						%>						
						  <p id='p_error'>Tickets booked already!</p>
						 
					    <%
								  }
						%>						  
						  
						<p> Fields mark with asterisk <span style="color:#FF0000;">(*)</span>are mandatory</p>
	

					<%
							String[] s =(String[])session.getAttribute("value");
							//out.print(s);
							if(s!=null && s.length!=0){
								  annualTId = s[0];
					//			  out.print(annualTId);
								  availTicket = s[1];
								  meeId = s[2];
								  meeName = s[3];
									}
					%>
					
					 		<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Type : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=meeName%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Total Tickets : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="ticket" type="text" class="textboxOne" value="<%=availTicket%>"/>
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

							<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="Submit" value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger'name="Submit" type="button"  value="Cancel"  onclick="javascript:history.back(-1);">Cancel</button>
                                    </div>
                                </div>
								
								<input name="act_typ" type="hidden" value="<%=annualTId%>"/>
								
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

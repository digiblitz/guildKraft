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

<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script language="javascript">
function check()
{
	if((document.frmMeeICPAssessment.commentarea.value=="")||(document.frmMeeICPAssessment.commentarea.value.indexOf(' ')==0)){
		alert('Enter Comment on Approval/Rejection');
		document.frmMeeICPAssessment.commentarea.focus();
		return false;
	}
	if(document.frmMeeICPAssessment.commentarea.value.length>1024){
		alert('Comments exceeds the maximum size');
		document.frmMeeICPAssessment.commentarea.focus();
		return false;
	}
	if(document.frmMeeICPAssessment.commentarea.value.indexOf('  ')!==-1){
	alert("Please avoid  unwanted white space");
	document.frmMeeICPAssessment.commentarea.focus();
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
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Meetings: Approve Organizer ICP Assessment Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
					
					<form class='form-horizontal' role='form' name="frmMeeICPAssessment" id="myform" method="post" action="./listAdminOrg.html" onsubmit="return check();">
							<%
							Vector orgDet = (Vector) request.getAttribute("ViewOrgDetails");
									 if(orgDet!=null && orgDet.size()!=0){ 
										Enumeration enm1=orgDet.elements();
										 while(enm1.hasMoreElements()){
											 String[] icpVal = (String[])enm1.nextElement();
							%>
							
							<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>ICP Assessment Details:</label>
							 </div>
							 
							 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessment Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[1]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[2]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[3]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[4]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[5]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[7]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[27]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[28]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[30]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[31]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[32]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[33]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
									
									<% String zip ="";
									if( icpVal[34]!=null)	{	zip = icpVal[34];	}	%>
									
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=zip%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
									
									<% String phno ="";
									if( icpVal[35]!=null)	{	phno = icpVal[35];	}%>	
									
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=phno%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
									
									<% String fax;
									if((icpVal[36]!=null)||(icpVal[36].trim().length()!=0))	{	fax="N.A";   }
									else	{   fax = icpVal[36];	}	%>	
									
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=fax%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
									
									<% String mail=icpVal[29];

									if((mail==null)||(mail.trim().length()==0)){
										mail = "N/A";
									}	%>
									
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=mail%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>		
					
							 
						<div class='form-group'> 
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically: </label>
								  
								  <%String[] facil = icpVal[10].split("#");
									String facility="";
									for(int i=0;i<facil.length;i++){
									if(!facil[i].equals("null")){
											facility+=facil[i]+",";
										}
									}
									%>

                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=facility%></label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
								  
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Details :</label>
							 </div>
							 
							 
						<div class='form-group'>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[11]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name : </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[12]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[13]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[16]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[15]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[14]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[17]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[18]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[19]%></label>
                                            </div>
                                        </div>

                                    </div>
								
                                </div>
							 
							 
						<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Details :</label>
							 </div>
							 
							 
							  <% 
						  String paystat = icpVal[51];
						  if(paystat.equalsIgnoreCase("check")){
						  %>
							 
							 
						<div class='form-group'>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Number:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[47]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Name: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[48]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[49]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[46]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[45]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<%	} else{%>	
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[54]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=icpVal[49]%></label>
                                            </div>
                                        </div>

                                    </div>
									
									
								</div>
									
									 <% } %>
						 					
							  <input type="hidden" name="icpMeetingId" value="<%=icpVal[0]%>"/>	
							   <input type="hidden" name="method" value="AdminupdateStatus"/>
									
							
							<div class='form-group'>
                               <label class='control-label col-md-2 col-md-offset-2' for='id_title'>;Approval Status</label>
							 </div>
							 
							 <%
								 String stat = icpVal[25];
								 if(stat.equalsIgnoreCase("Pending")){
								 %>
							 
							 <div class='form-group'>
							 
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Comments:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <textarea name="commentarea" rows="5" class="textAreaOne"></textarea>
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input name="usrStat" type="radio" value="Approved" checked="checked"/> 	Approve
							 
							  				<input name="usrStat" type="radio" value="Rejected" />Reject
								
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="process" value="Submit">Submit</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' name="back" type="button" value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
                                    </div>
                                </div>
								
								<%	}else{	%>	 
						 
						 <div class='form-group'>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <label class='control-label'><%=icpVal[25]%></label>
								
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                       <button class='btn-lg btn-danger' name="back" type="button" value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
                                    </div>
								</div>
							
							<% }}	}%>
						
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

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
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
 
 
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
				
				<form action="SysMgmt.do"  method="post" name="frmBpReq" id="frmBpReq" onsubmit="return myvalidate();">
                  <input type="hidden" name="process" value="callBPReq"/>
                 <div class='form-group'>
				 
                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Submitted:</label>
						
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
                      			<input  type="text" name="frmDate" id="frmDate" readonly="readonly" class="form-control" value="" size="20" maxlength="20" />
                          		<a onclick="javascript:NewCssCal('frmDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
							</div>
						</div>
					</div>
					
												
                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Type of Request:</label>
				   
                     <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   	<select name="req" id="req" class="form-control">
								<option selected="selected" value="">Select One</option>
								<option  value="BP">Business Process</option>
								<option  value="WS">Web Service</option>
								<option  value="">Artifact</option>
								<option  value="">others</option>
                          	</select>
                      </div>
					 </div>
					</div>
						
						
                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Id:</label>
					 
                     <div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<input type="text" name="reqId" id="reqId" value="" class="form-control" size="20"/>
							</div>
						</div>
					</div>
					
					
                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Request Priority:</label>
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   	<select name="reqPri" id="reqPri" class="selectboxOne">
								<option selected="selected" value="">Select One</option>
								<option  value="high">High</option>
								<option  value="medium">Medium</option>
								<option  value="low">Low</option>
                          </select>
                       </div>
					  </div>
					</div>
					
					<div class='col-md-offset-5 col-md-1'>
                      <button class='btn-lg btn-primary' type='button' name="submit" value="Search">Search</button>
					</div>
				</div>
					
					
					<div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2">
									<label class='control-label label1'>Serial Number</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Request Date</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Request Id</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Request Title</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Request Description</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Priority</label>
								</div>
								
								<div class="col-md-2">
									<label class='control-label label1'>Status</label>
								</div>
                       
					   </div>
					</div>
				</div>
								<%
									   ArrayList list=(ArrayList)request.getAttribute("list");
										//System.out.println  ("artifactData"+artifactData.size());                                           
																					 
									   if (list != null && list.size() != 0) {  
																								
									   Iterator iter = list.iterator();
											//String [] userType = {ID, name };
											while (iter.hasNext()) {
																											
												String [] artiType=(String[])iter.next();
												String sno=artiType[0];
												String date=artiType[1]; 
												String reqid=artiType[2];
												String reqtit=artiType[3];
												String reqdesc=artiType[4];
												String priority=artiType[5];
												String status=artiType[6];
												
                                                                	

                             %>
                      <div class="margin marginn">
						<div class="form-group">
							<div class="col-md-12">
								<div class='col-md-2'>
									<label class='control-label'><%=sno%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=date%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=reqid%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=reqtit%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=reqdesc%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=priority%></label>
								</div>
								
								<div class='col-md-2'>
									<label class='control-label'><%=status%></label>
								</div>
									  </div>
								</div>
							</div>
						
                        <%  }
							   }
							   else{
								   %>								
								<div class='form-group'>
								 	<div class="container"> 
										<div class="row"> 
											<div class='col-md-4'>
											</div>
											<div class='col-md-4'>
												No Records Found !!
											</div>
										</div>
									</div>
								</div>
                        <%
   							}
						%>
                  
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
			


<script language="javascript">
    var cal1 = new calendar2(document.forms['frmBpReq'].elements['frmDate']);
	 cal1.year_scroll = true;
	 cal1.time_comp = false;

    




</script>

</body>


</html>

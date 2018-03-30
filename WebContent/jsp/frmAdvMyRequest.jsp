<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.text.*"%>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="file:///D|/Jboss 4.2.3GA-18080/server/default/tmp/deploy/tmp4639256501122020805guildKraft-exp.war/jsp/js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


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

<!--==============================================content start here============================================-->
   		 <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						
								<h2>Advertisement: My Advertisements</h2>
								
						</div>
					<!--==============================Form Title=================================-->

 				 	
							 <div class='panel-body'>
						
					<!--==============================Form Description=================================-->
						
		                 <p>Advertisements posted by you  are as follows. 
		
		     To view an advertisement posted by you, click on the 'View' Button beside each record. </p>
	
 
		 
		  			<div class="margin marginn">
				
							<div class="form-group"> 
							
								<div class="col-md-12 gp">
									   
										<div class='col-md-2'>
										
											<label class='control-label label1'>Advertiser Name</label>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Media Type</label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Posted Date</label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <label class='control-label label1 '>Status</label>
										   
										</div> 
										 
										<div class='col-md-2'>
											
										   <label class='control-label label1'>View Manifest</label>
										   
										</div>  
										
										<div class='col-md-2'>
											
										   <label class='control-label label1'>View</label>
										   
										</div>   
										
									</div>
							</div>
					
					</div>
									
								
		  
			<%
			 SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
			ArrayList UserList = (ArrayList)session.getAttribute("UserListDetails");
			if(UserList!=null && UserList.size()!=0){
           // out.print("UserList" + UserList);
       		String mediaId ="";
			String advertiserName ="";
			String advertiserId ="";
			
			String status ="";
			
			Iterator itall = UserList.iterator();
            while(itall.hasNext()){
                ArrayList al = (ArrayList) itall.next();
                Iterator it = al.iterator();
               while(it.hasNext()){
                    HLCAdvertiserVO objAdv = (HLCAdvertiserVO)it.next();
					advertiserId =(String)objAdv.getAdvertisementId();
					advertiserName = (String)objAdv.getAdvertiser();
					mediaId = (String)objAdv.getMediaId();
					 
					if(objAdv.getRequestStatus()!=null){
					   status = objAdv.getRequestStatus();
					}
					
					  String advDate = "";
					  if(objAdv.getAddDate()!=null){
						advDate = sdf.format(objAdv.getAddDate());
					  }
									
					ArrayList li = (ArrayList)it.next();
					
					
		     
			 %>
			 	<form  class='form-horizontal' role='form' name="frmViewAdStatus" id="frmViewAdStatus" method="post" action="./advertisement.html">
				<input type="hidden" name="advPrice" value="viewMyAds" />
				<input type="hidden" name="advId" value="<%=advertiserId%>" />
				
					<div class="margin marginn">
					
						<div lass='form-group'>
				 
				 			<div class="container"> 
							
								 <div class="row"> 
									   
										<div class='col-md-2'>
										
											<label class='control-label '><%=advertiserName%></label>
											
										</div>
										
										<div class='col-md-2'>
											
										   <label class='control-label '><%=mediaId%></label>
										   
										</div> 
										   
										<div class='col-md-2'>
											
										   <label class='control-label '><%=advDate%></label>
										   
										</div> 
										
										<div class='col-md-2'>
											
										   <label class='control-label '><%=status%></label>
										   
										</div> 
										
									
					
					<%
					if(status.equals("Active")){
					%>
					 
						
									   
										<div class='col-md-2'>
										
											<label class='control-label ' type="submit" name="manifest" value="Manifest" >Manifest</label>	
											
										</div>	
					    
							<%}
							else{%>
							     
								 		<div class='col-md-2'>
										
											<label class='control-label ' type="submit" name="manifest" value="Manifest" disabled="disabled">Manifest</label>
												
										</div>	
							
							
							<%}%>
							
									<div class='col-md-2'>
										
											<label class='control-label ' type="submit" name="manifest" value="View" >View</label>	
									</div>	
									
								</div>
								
							</div>
						
						</div>		
					
					</div>			
					
			</form>
			
			  <%
				 }
		  }
		  }
		  else{
		  %>
		  	
				
		                	<div class='form-group'>
								
                                 <div class="container"> 
								   
									   <div class="row"> 
									   
										<div class='col-md-10'>
										
											<div class='col-md-5'>
											</div>
											
											<div class='col-md-5'>
												</p>No records are available </p>
											</div>
											
										</div>
										
									 </div>
									 
								</div>
								
							</div>
							
					
			
		  <%
		  }
		  %>
								<!--==============================================content end here============================================-->

		  		
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

<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->

</head>
	</tr>
<%
	ArrayList listContact = (ArrayList) request.getAttribute("userDetails");
		String prefix1 = "";
		String first_name = "";
		String middle_name = "";
		String last_name = "";
		String sufix = "";
		String email_id = "";
		String suite = "";
		String address1 = "";
		String address2 = "";
		String city = "";
		String state = "";
		String country = "";
		String zip = "";
		String phone_no = "";
		String mobile_no = "";
		String fax_no = "";
        String address_status = "";
		String spl_notes = "";
		
		if(listContact !=null && listContact.size()!=0){
			Iterator it = listContact.iterator();
			while(it.hasNext()){
				prefix1 = (String)it.next();
				if(prefix1==null)
				prefix1 = "";
				first_name  = (String)it.next();
				if(first_name==null)
				first_name = "";
				middle_name  = (String)it.next();
				if(middle_name==null)
				middle_name = "";
				last_name = (String)it.next();
				if(last_name==null)
				last_name = "";
				sufix =  (String)it.next();
				if(sufix==null)
				sufix = "";
				email_id  = (String)it.next();
				if(email_id==null)
				email_id = "";
				suite =  (String)it.next();
				if(suite==null)
				suite = "";
				address1 =  (String)it.next();
				if(address1==null)
				address1 = "";
				address2 = (String)it.next();
				if(address2==null)
				address2 = "NA";
				city = (String)it.next();
				if(city==null)
				city = "";
				state =  (String)it.next();
				if(state==null)
				state = "";
				country = (String)it.next();
				if(country==null)
				country = "";
				zip = (String)it.next();
				if(zip==null)
				zip = "";
				phone_no = (String)it.next();
				if(phone_no==null)
				phone_no = "";
				mobile_no = (String)it.next();
				if(mobile_no==null)
				mobile_no = "";
				fax_no = (String)it.next();
				if(fax_no==null)
				fax_no = "NA";
                address_status = (String)it.next();
				if(address_status==null)
				address_status ="false";
				spl_notes = (String)it.next();
				if(spl_notes==null)
				spl_notes = "";
			}
		}
%>
			
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
							  
							  <h2>Membership: User Details </h2>

  							  </div>
					<!--==============================Form Title=================================-->
						
                           <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
						<div id="part1"  >
						 <p class="para col-md-offset-1">User  Information</p>
					
					<div class='form-group'>
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=first_name%>&nbsp;</label>
											</div>
										</div>
									</div>
						
						
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=middle_name%>&nbsp;</label>
											</div>
										</div>
									</div>
						
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=last_name%>&nbsp;</label>
											</div>
										</div>
									</div>
						
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address1:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=address1%>&nbsp;</label>
											</div>
										</div>
									</div>
						 
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address2:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=address2%>&nbsp;</label>
											</div>
										</div>
									</div>
						
					
                        <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=city%>&nbsp;</label>
											</div>
										</div>
									</div>
									
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=state%>&nbsp;</label>
											</div>
										</div>
									</div>
									
											
												
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Zip:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=zip%>&nbsp;</label>
											</div>
										</div>
									</div>
						 				  
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=country%>&nbsp;</label>
											</div>
										</div>
									</div>
						  
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
													<label class="control-label"><%=phone_no%>&nbsp;</label>
												</div>
										</div>
									</div>
													
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Fax: </label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=fax_no%>&nbsp;</label>
											</div>
										</div>
									</div>
						 
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Email ID: </label>
							 <div class='col-md-8'>
                                  <div class='col-md-3 indent-small'>
                                           <div class='form-group internal'>
												<label class="control-label"><%=email_id%>&nbsp;</label>
											</div>
										</div>
									</div>
						 </div>
							<!--++++++++++++++++++++ Part 1 of the form ends here ++++++++++++++++++++++++++++++ -->							</td>
						 
						 
						 <div id="part4" >
						
						<%
							String usersId = (String)request.getAttribute("logUserId");
						%>

									<div class="form-group">
										<div class="col-md-offset-2 gp">
											
												
									<%if(address_status.equalsIgnoreCase("true")){%>
										<input type="checkbox" name="mailAddressStatus"  id="mailAddressStatus" value="true" checked/>&nbsp;Verify Mailing address  <br />	
										<%}else {%>
										<input type="checkbox" name="mailAddressStatus"  id="mailAddressStatus" value="true"/>&nbsp;Verify Mailing address  <br />	
										<%}%>
									
										</div>
									</div>
									
							<div class="form-group"	>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Special Notes: </label>
									 <div class='col-md-8'>
										  <div class='col-md-3 indent-small'>
												   <div class='form-group internal'>
											  
													<textarea class="form-control" name="splNote" rows="5"/><%=spl_notes%></textarea>
													
													</div>
												</div>
											</div>
                                           </div>                                             
                                        
                               </div>                                                         
											
						<!--++++++++++++++++++++ Part 4 of the form starts here ++++++++++++++++++++++++++++++ -->	
								<div class="form-group gp">
								
									<div class="col-md-offset-4 col-md-1">
											
											 <button class='btn-lg btn-primary' type="submit" name="Back" value="Update" style=   " margin-left: -12px; ">Update</button>
									
								</div>
										<input type="hidden" name="searchProcess" value="loginProcess" />
										<input type="hidden" name="userId" value="<%=usersId%>"/>
										
									</form>
									
									<form name="viewHrsServiceList" action="SearchList.html" method="post">
										<input type="hidden" name="searchProcess" value="loginProcess" />
										<input type="hidden" name="userId" value="<%=usersId%>"/>
									
										<div class="col-md-1">
											 <button class='btn-lg btn-primary' type="submit" name="Back" value="Login" >Login</button>
											</div>
										<div class="col-md-2">
											 <button class='btn-lg btn-danger' type="button" name="Back" value="Back" onclick="javascript:history.back(-1);" >Back</button>
										</div>
									</div>
										
									</form>
									
							<!--++++++++++++++++++++ Part 4 of the form ends here ++++++++++++++++++++++++++++++ -->		
						</div>
					</div>
										<!--==============================Form Body=================================-->

				</div>
			</div>
		</div>
	
 
  
			                  <!--==============================================content end here============================================-->


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

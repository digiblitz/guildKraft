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
    <%@ page import="com.hlcform.util.*" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/memberUserSignupAuth.js" type="text/javascript" ></script>

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
                            <h2>Member SignUp: Create Dashboard Login</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
								<%
									String source = (String)request.getAttribute("source");
									String eventTypeId = (String)request.getAttribute("eventTypeId");
									String compYear = (String)request.getAttribute("compYear");
								%>
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="./MemberUsrSignUp.do" onsubmit="return myvalidate();">
							
                                 <input type="hidden" name="source" value="<%=source%>" />
								<input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
								<input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
								
								<div class='panel-heading'>
								   <label class='control-label label1'>Member  Detail</label>
								</div>
								
								 <input type="hidden" name="process" value="validate" />
                  					<% 
										HLCUsrSignUpVO userDet = new HLCUsrSignUpVO();
                                                                        
                                       userDet=(HLCUsrSignUpVO)request.getAttribute("userDet");
                                    
								%>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="firstName" id="firstNameId" class="form-control" value="<%=userDet.getFname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;"  readonly="readonly" /> 
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input name="lastName" id="lastNameId" class="form-control" value="<%=userDet.getLname()%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;"  readonly="readonly" />  
                                            </div>
                                        </div>

                                    </div>
									
									<%

												String digno="";
												if(userDet.getPhone()!=null)
												{
				
													String ph=userDet.getPhone();
													int phlen=ph.length();

													if(phlen>4)
													{
														int rstsiz=phlen-4;
														digno=ph.substring(rstsiz,phlen);
													}
													else
													{
														digno=userDet.getPhone();
													}													
												}

												String emailId="";
												if(userDet.getEmail()!=null){
													String email=userDet.getEmail();
													int indx = email.indexOf("@");
													emailId = email.substring(indx+1);                                                                                                    
													System.out.print("emailId :"+emailId);
												}
												
												String zp="";
												if(userDet.getZip()!=null){
													String zip = userDet.getZip();
													if(zip.length()>2){
														zp = zip.substring(0,2);
													}else{
														zp = zip;
													}                                                        System.out.print("zip : " +zp);                                           
												}


String usid="";
												if(userDet.getUserId()!=null){
													String hlcid=userDet.getUserId();
													if(hlcid.length()>2){
														usid=hlcid.substring(0,2);                                                                                                        
													}else{
														usid = hlcid;                                                                                                                
													}
												}

                                                String mId="N/A";
                                                                                                
												if(userDet.getMembid()!=null)
												{
													String hlcid=userDet.getMembid();
													
													if(hlcid.length()>2){
														mId=hlcid.substring(0,2);                                                                                                        
													}else{
														mId = hlcid;                                                                                                               													
													}
													
                                                }
                                                                                                
												%>
                        
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email  (Last domain):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               xxxxxx@
                              <input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=emailId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="20" readonly="readonly" />  
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone Number (Last 4 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               xxx-xxx-
                              <input name="phoneNumber" id="phoneNumberId" class="form-control" value="<%=digno%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="8" readonly="readonly" />      
                                            </div>
                                        </div>

                                    </div>
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input name="phoneNumber" id="phoneNumberId" class="textboxOne" value="<%=zp%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" /> xxx
                           
                                            </div>
                                        </div>

                                    </div>
									
									
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID (First 2 digits):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            <input name="phoneNumber" id="phoneNumberId" class="textboxOne" value="<%=mId%>" style="background-color:#F4F4F4; font-weight:bold; border:0px;" size="2" readonly="readonly" /> xxxxxx
                           
                           
                                            </div>
                                        </div>

                                    </div>
								</div>
								
								 <input type="hidden" name="userId" value="<%=userDet.getUserId()%>" />
								 
								 <p>Existing HLC Members please enter any two of below details to validate your identity.</p>
									
									<div class='form-group'>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <input type="text" name="phone" id="phone" class="form-control"/>
                           
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>e-Mail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" name="email" id="email" class="form-control"/> 
                           
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           	<input type="text" name="zip" id="zip" class="form-control"  /> 
                           
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit' name="submit"  value="Submit">Submit</button>
										
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

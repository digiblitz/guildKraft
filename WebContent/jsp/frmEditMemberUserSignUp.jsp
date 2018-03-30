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
<%@ page import="java.util.*" %>
<%@ page import="java.util.regex.*" %>
<%@ page import="com.hlchorse.form.util.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildKraft</title>
<!--title><%=(String)session.getAttribute("title")%></title-->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="icon" href="images/favicon.ico" type="image/x-icon">

<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/cscombo_new.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
<script src="js/EditMemberUserReg.js" type="text/javascript" ></script>
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
                            <h2>Edit User Registration</h2>
                        </div>
					<!--==============================Form Title=================================-->
	
	
	 <div class='panel-body'>
			<p>Please use the form below to Edit/Update your registration details.You can also create your Login name and Password if you <br/> don't have one.</p>
					<p><font color="#FF0000">All * Fields are Mandatory.</font></p>
              
				
				
				<%
					String source = (String)request.getAttribute("source");
					String eventTypeId = (String)request.getAttribute("eventTypeId");
					String compYear = (String)request.getAttribute("compYear");
				%>
                
				<form class='form-horizontal' role='form'  name="frmMembRegi" id="frmMembRegi" method="post"  action="user.html" onsubmit="return myvalidate(this);" onmouseover="hide_switchDiv();"  >
                  <input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
                  <input type="hidden" name="compYear" id="compYear" value="<%=compYear%>" />
                 
				 		
									<p class="para col-md-offset-1">Basic Information</p>
								
                                       
                             <%
                                    HLCUserRegVO HLCUserRegVO=new HLCUserRegVO();						
                         			HLCUserRegVO=(HLCUserRegVO)request.getAttribute("EditusrVect");
						               
							%>
							
							

							<div class='form-group'>
							
																
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=HLCUserRegVO.getPrefix()%></label>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name::</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=HLCUserRegVO.getFirstName()%></label>
                                            </div>
                                        </div>

                                    </div>
									<input type="hidden" name="fname" value="<%=HLCUserRegVO.getFirstName()%>"></input>
									 <%

										String mname="";
										
										if(HLCUserRegVO.getMiddleName()!=null && HLCUserRegVO.getMiddleName().trim().length()!=0)
										{
											mname=HLCUserRegVO.getMiddleName();
										}
										else
										{
											mname="------";
										}
										
									%>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=mname%></label>
                                            </div>
                                        </div>
                                    </div>
									<input type="hidden" name="mname" value="<%=mname%>"></input>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=HLCUserRegVO.getLastName()%></label>
                                            </div>
                                        </div>

                                    </div>
									<input type="hidden" name="lname" value="<%=HLCUserRegVO.getLastName()%>"></input>
									<%

										String suff="";
										
										if(HLCUserRegVO.getSufix()!=null && HLCUserRegVO.getSufix().trim().length()!=0)
										{
											suff=HLCUserRegVO.getSufix();
										}
										else
										{
											suff="------";
										}
										
								%>
									
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suffix:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <label class='control-label'><%=suff%></label>
                                            </div>
                                        </div>

                                    </div>
									
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Birth:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <%
																					
																					    if(HLCUserRegVO.getDob()!=null)
																						{
                                                                                        String[] dob1=HLCUserRegVO.getDob().split(" ");
                                                                                        String[] dob=dob1[0].split("-");
                                                                                        
                                                                                        String mm=dob[1];
                                                                                        String dd=dob[2];
                                                                                        String yy=dob[0];
                                                                                                                                                                                
                                                                                       String[] mon={"January","February","March","April","May","June","July","August","September","October","November","December"};
                                                                                       String month="";
                                                                                       
                                                                                    if(mm.equals("01"))
                                                                                        month=mon[0];
                                                                                    else if(mm.equals("02"))
                                                                                        month=mon[1];
                                                                                    else if(mm.equals("03"))
                                                                                        month=mon[2];
                                                                                    else if(mm.equals("04"))

                                                                                        month=mon[3];
                                                                                    else if(mm.equals("05"))
                                                                                        month=mon[4];
                                                                                    else if(mm.equals("06"))
                                                                                        month=mon[5];
                                                                                    else if(mm.equals("07"))
                                                                                        month=mon[6];
                                                                                    else if(mm.equals("08"))
                                                                                        month=mon[7];
                                                                                    else if(mm.equals("09"))
                                                                                        month=mon[8];
                                                                                    else if(mm.equals("10"))
                                                                                        month=mon[9];
                                                                                    else if(mm.equals("11"))
                                                                                        month=mon[10];
                                                                                    else if(mm.equals("12"))
                                                                                        month=mon[11];
                                                                                    else
                                                                                           
                                                                                       
                                                                                    %>
                                            
                                              <%
													int selmth=Integer.parseInt(mm);
													System.out.println("selmth :"+selmth);

													for(int mth=1;mth<=12;mth++)
													{
														if(selmth==mth)
														{%>
														
														
                                            <label class='control-label'><%=mth%></label>
											 
											 
                                              <%}else{%>
                                              
                                              <%}}%>
                                            
                                      
                                              <%
													int dat=Integer.parseInt(dd);
													for(int d=1;d<=31;d++)
													{
														if(dat==d)
														{%>
                                              <label class='control-label'>/<%=d%></label>
                                             
<%}else{%>
                                              
                                              <%}}%>
                                           
                                              <%  														            												  
														int selyr=Integer.parseInt(yy);
														java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                        //int day = c.get(Calendar.DAY);
                                                        //int month = c.get(Calendar.MONTH);
                                                        int year5 = c5.get(java.util.Calendar.YEAR);
                                                        //String date = day+" / "+month+" / "+year;
                                                        System.out.println("Current Date = "+year5);
                                                        for(int yr=1900;yr<=year5;yr++)
                                                                                                                    {
															if(yr==selyr)
															{%>
                                             <label class='control-label'>/<%=yr%></label>
                                             
<%}else{%>
                                              
                                              <%}}%>
                                            
                                            <%}
										else
										{
										%>
                                            
                                             
                                              <%
                                                                                                  java.util.Calendar c5 = java.util.Calendar.getInstance();
                                                                                                  //int day = c.get(Calendar.DAY);
                                                                                                  //int month = c.get(Calendar.MONTH);
                                                                                                  int year5 = c5.get(java.util.Calendar.YEAR);
                                                                                                  //String date = day+" / "+month+" / "+year;
                                                                                                  System.out.println("Current Date = "+year5);

                                                                                                  for(int f=1900;f<=year5;f++) 
                                                                                                  {%>
                                             
                                              <%}
                                                                                                  %>
                                           
                                            <%}%>
                                            </div>
                                        </div>

                                    </div>
									
                                </div>
								
						 <%if(HLCUserRegVO.getGender()!=null){%>
						 
                                 <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <label class='control-label'><%=HLCUserRegVO.getGender()%></label>
                                            </div>
                                        </div>

                                    </div>
								  </div>
								
								  <%}%>
								  
                              
								
							<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="email" value="<%=HLCUserRegVO.getEmailId()%>" />
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>
                                    </div>
								
                                </div>
  
                                  <div class='form-group'>
								  
                                          <% String logName="";
                             if(HLCUserRegVO.getLoginName()!=null && HLCUserRegVO.getLoginName().trim().length()!=0)
                                                                          {
                                                                            logName=HLCUserRegVO.getLoginName();
                                                                          }
                                                                          
                                                                          String userId1="";
                                                                          userId1=HLCUserRegVO.getUserId();
                                                                          
                                                                        %>
                                          <input type="hidden" name="userId" value="<%=userId1%>" />
                                          <input type="hidden" name="cmd" value="updateUsr" />
                                          
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name (Login ID):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            	<label class='control-label'><%=logName%></label>
                                            </div>
                                        </div>
                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose A Secret Question:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                            	<select name="QSelect" id="select" class="form-control">
                                            <%
																														
										String[] secQuest={"What is your favorite passtime?","What is your pets name?","What was your first car?","What is your mothers first name?","Which is your favorite vacation spot?"}; 
									
									int i=0;
									int j=0;
									
									for(i=0;i<secQuest.length;i++)
									{
										if(HLCUserRegVO.getSecretQuestion()!=null && HLCUserRegVO.getSecretQuestion().trim().length()!=0)
										{											
											if(HLCUserRegVO.getSecretQuestion().equalsIgnoreCase(secQuest[i]))
											{
												System.out.print("secQuest[i]) match :"+secQuest[i]);
											%>
                                            <option selected="selected" value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%}
										  else{
										  
										  if(j==0)
											{
										  %>
                                            <option value="">Select One</option>
                                            <%}%>
                                            <option value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%}}
										  else
										  {
										  	if(j==0)
											{
										  %>
                                            <option selected="selected" value="">Select One</option>
                                            <%}%>
                                            <option value="<%=secQuest[i]%>"><%=secQuest[i]%></option>
                                            <%										  
										  }
										  j++;
										  }%>
                                          </select>
										   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>
                                    </div>
								</div>
                                     
								
									<%
									  		String secAns="";
											
											if(HLCUserRegVO.getSecretAnswer()!=null)
											{
												secAns=HLCUserRegVO.getSecretAnswer();
											}
									  %>
									  
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Your Answer To This Question:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" name="ans" value="<%=secAns%>" class="form-control" />
												<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                          
                                        <!--tr>
                                          <td colspan="2"><div class="rowHead"> Change Password: </div></td>
                                        </tr>
                                        <tr>
                                          <td><span class="row"><span class="label">New Password:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <input type="password" name="newPwd" class="textboxOne" size="18" />
                                          </span></span></td>
                                        </tr>
                                        <tr>
                                          <td><span class="row"><span class="label">Re-Type New Password:</span></span></td>
                                          <td><span class="row"><span class="formX">
                                            <input type="password" name="confPwd" class="textboxOne" size="18" />
                                          </span></span></td>
                                        </tr-->
										
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address Types:</label>
                                    <div class='col-md-8'>
                                        
										<div class='col-md-2'>
                                                <input type="checkbox" name="priAdd_cbx" id="priAdd_cbx" value="Primary" size="10" checked="checked" onclick="defaultPriAdd();"/>
                                            Primary Address
										</div>
                                            
                                              <%
                                                if(HLCUserRegVO.getSecondaryContactTypeName()!=null)
                                                 {
                                                 if(HLCUserRegVO.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
                                                {%>
                                           <div class='col-md-2'>   
                                                <input type="checkbox" checked="checked" name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/>  Secondary Address
                                              
											</div>
                                              <input type="hidden" name="cttyp" value="Secondary" />
											  
                                              <%}}else{%>
											  
                                             <div class='col-md-2'>
                                                <input type="checkbox" name="secAdd_cbx" value="Secondary" id="secAdd_cbx" size="10" onclick="return hide_switchDiv();"/>
                                                Secondary Address
											</div>
                                              <% }%>
                                           

                                    </div>
                                </div>
                                        
                                <div id="pAdd">         
								
									<p class="para col-md-offset-1">Primary Address</p>
																	   
                             
							   										
								
								<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
									 <%String address=HLCUserRegVO.getPrimaryAddress1();%>  
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <input type="text" value="<%=address%>" name="padd_txt" id="padd_txt" class="form-control" />
											  <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                  <div class='form-group'>
                                                  <%

														String add2="";
														
														if(HLCUserRegVO.getPrimaryAddress2()!=null && HLCUserRegVO.getPrimaryAddress2().trim().length()!=0)
														{
															add2=HLCUserRegVO.getPrimaryAddress2();
														}
														else
														{
															add2="";
														}
														
													%>
													
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <input type="text" value="<%=add2%>" name="padd_txt2" id="padd_txt2" class="form-control" />
                                            </div>
                                        </div>

                                    </div>
									
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                               <input type="pcity_txt" name="pcity_txt" value="<%=HLCUserRegVO.getPrimaryCity()%>" id="pcity_txt" class="form-control"  />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <select name="pstate_sel" id="pstate_sel" class="form-control">
                                                    </select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" value="<%=HLCUserRegVO.getPrmaryZip()%>" name="pzip_txt" id="pzip_txt" class="form-control"  />
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <%System.out.print(HLCUserRegVO.getPrimaryCountry());
																   System.out.print(HLCUserRegVO.getPrimaryState());
																    System.out.print(HLCUserRegVO.getSecondaryCountry());
																   System.out.print(HLCUserRegVO.getSecondaryState());
																	%>
                                                    <select name="pcountry_sel" id="pcountry_sel" class="form-control" onchange="FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel,'');" >
                                                    </select>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="pphone_txt" value="<%=HLCUserRegVO.getPrimaryPhoneNo()%>" class="form-control" />
											   <span id="span_astriesk">*</span>(e.g. xxx yyy zzzz)
                                            </div>
                                        </div>

                                    </div>
								</div>
                                    
									
									  <div class='form-group'>       
                                              
                                        <%

											String pmobil="";
											
											if(HLCUserRegVO.getPromaryMobileNo()!=null && HLCUserRegVO.getPromaryMobileNo().trim().length()!=0)
											{
												pmobil=HLCUserRegVO.getPromaryMobileNo();
											}
											else
											{
												pmobil="";
											}
								
											String pfax="";
											
											if(HLCUserRegVO.getPrimaryFaxNo()!=null && HLCUserRegVO.getPrimaryFaxNo().trim().length()!=0)
											{
												pfax=HLCUserRegVO.getPrimaryFaxNo();
											}
											else
											{
												pfax="";
											}
											
									%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <input type="text" name="pmob_txt" value="<%=pmobil%>" class="form-control" />
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
										<div class='col-md-8'>
											<div class='col-md-3 indent-small'>
												<div class='form-group internal'>
													<input type="text" name="pfax_txt" value="<%=pfax%>" class="form-control" />
												</div>
											</div>

										</div>
									</div>   
							</div>
                                         
								<div id="sAdd">
									<p class="para col-md-offset-1">Secondary Address</p>
																		  
								
                                    									
								<div class="form-group">		 
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address 1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                           <%
										 		String sec_add1="";
                                                if(HLCUserRegVO.getSecondaryAddress1()!=null)
                                                {
	                                              sec_add1=HLCUserRegVO.getSecondaryAddress1();
                                                } %>
                                                   
                                              <input type="text" name="sadd_txt" id="sadd_txt" class="form-control" value="<%=sec_add1%>"/>
											   <span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Address 2:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<%  String sadd2="";
																						
											if(HLCUserRegVO.getSecondaryAddress2()!=null)
											{
												sadd2=HLCUserRegVO.getSecondaryAddress2();
											}
																						
										%>
                                         <input type="text" value="<%=sadd2%>" name="sadd_txt1" id="sadd_txt1" class="form-control" />
										 </div>
										</div>
									</div>
									
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <%
												 String sec_city="";
                                                 if(HLCUserRegVO.getSecondaryCity()!=null)
                                                 {
												sec_city=HLCUserRegVO.getSecondaryCity();
												 }
                                           %>
                                       <input type="text" value="<%=sec_city%>" name="scity_txt" id="scity_txt" class="form-control"/>
									    <span id="span_astriesk">*</span>
										 </div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <select name="sstate_txt" id="sState_sel" class="selectboxOne">
                                                    </select>
									    <span id="span_astriesk">*</span>
										 </div>
										</div>
									</div>
									
									 <%
											String sec_zip="";
										
											if(HLCUserRegVO.getSecondaryZip()!=null)
											{
												sec_zip=HLCUserRegVO.getSecondaryZip();
											}
										%>
										
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <input type="text" value="<%=sec_zip%>" name="szip_txt" id="szip_txt" class="form-control" />
									    <span id="span_astriesk">*</span>
										 </div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="scountry_txt" id="sCountry_sel" class="form-control" onchange="FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt,'');" >
                                                    </select>
									    <span id="span_astriesk">*</span>
										 </div>
										</div>
									</div>
									                 
                                 <%
									String ph="";
									if(HLCUserRegVO.getSecondaryPhoneNo()!=null)
									{
										ph=HLCUserRegVO.getSecondaryPhoneNo();
									}
									
									%>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="sphone_txt" value="<%=ph%>" class="form-control"  />
									    <span id="span_astriesk">*</span>(e.g. xxx yyy zzzz)
										 </div>
										</div>
									</div>
									
									<%

										String smob2="";
										
										if(HLCUserRegVO.getSecondaryMobileNo()!=null)
										{
											smob2=HLCUserRegVO.getSecondaryMobileNo();
										}
										
										String sfax2="";
										
										if(HLCUserRegVO.getSecondaryFaxNo()!=null)
										{
											sfax2=HLCUserRegVO.getSecondaryFaxNo();
										}
										
										
										%>
										
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="smob_txt" value="<%=smob2%>" class="form-control" />
										 </div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <input type="text" name="sfax_txt" value="<%=sfax2%>" class="form-control"/>
										 </div>
										</div>
									</div>
									
								</div> 
							 </div> 
                                                   
                                   
							<div class="form-group">	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Preferred Communication Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											  <select name="comAdd_sel" id="comAdd_sel" class="form-control" onchange="return hideTwo_switchDiv();">
                                              <%
                                                                                       if(HLCUserRegVO.getPreferedCommunication()!=null)
                                                                                       {
                                                                                       if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Secondary"))
                                                                                        {    System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication());                                                                                                                                                                   
                                                                                     %>
                                              <option value="Primary">Primary Address</option>
                                              <option selected="selected" value="Secondary">Secondary Address</option>
                                              <%}else if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Primary")){
										System.out.println("HLCUserRegVO.getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication()); 
										%>
                                              <option selected="selected" value="Primary">Primary Address</option>
                                              <option value="Secondary">Secondary Address</option>
                                              <%}}%>
                                            </select>

										 </div>
										</div>
									</div>
									
								</div> 
								
								
									<p class="para ">Contact Options</p>
								
														
														
							<div class="col-md-12">
					<p>We provide mail/email information to other affliates, organizations, sponsors and vendors on a limited basis.You may choose to not receive these mailings by selecting the appropriate options below:</p>
							</div>
						
											
                                       <div class="form-group">
									   		<div class="col-md-12">
												   
											 <% 
											System.out.println("HLCUserRegVO.isNonUseaEmailStatus() :"+HLCUserRegVO.isNonUseaEmailStatus());
											
											if(HLCUserRegVO.isNonUseaEmailStatus()){%>
										
                                            <div class="col-md-12">
											  <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" checked="checked" />
                                            Do not release my email address for specific use.
											</div>
											
                                            <%}else {%>
											 <div class="col-md-12">
                                            <input type="checkbox" name="nonUseaEmail"  id="nonUseaEmail_id" value="true" />
                                            Do not release my email address for specific use. 
											</div>
											
                                            <%}%>
											
                                            <%System.out.println("nonUseaMail:testing:"+HLCUserRegVO.isNonUseaMailingStatus()); 
											  if(HLCUserRegVO.isNonUseaMailingStatus()){
											%>
											 <div class="col-md-12">
                                            <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" checked="checked" />
                                            Do not release my mailing address for specific use.
											</div>
											
                                            <%} else {%>
											 <div class="col-md-12">
                                            <input type="checkbox" name="nonUseaMail"  id="nonUseaAdd_id" value="true" />
                                            Do not release my mailing address for specific use.
											</div>
                                            <%}%>
											
                                          </div>
									</div>
									
								<div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit" value="Update" >Update</button>
                                    </div>
                                   
                                </div>
                                             
											  
                                        
                    <%
                           
                        String pctry="";
			
			if(HLCUserRegVO.getPrimaryCountry()!=null && HLCUserRegVO.getPrimaryCountry().trim().length()!=0)
			{
				pctry=HLCUserRegVO.getPrimaryCountry();
			}
			else
			{
				pctry="USA";
			}
                        
                        String pstat="";
			
			if(HLCUserRegVO.getPrimaryState()!=null && HLCUserRegVO.getPrimaryState().trim().length()!=0)
			{
				pstat=HLCUserRegVO.getPrimaryState();
			}
			else
			{
				pstat="";
			}
			
			String sctry="";
			
			if(HLCUserRegVO.getSecondaryCountry()!=null && HLCUserRegVO.getSecondaryCountry().trim().length()!=0)
			{
				sctry=HLCUserRegVO.getSecondaryCountry();
			}
			else
			{
				sctry="USA";
			}
                        
                        String sstat="";
			
			if(HLCUserRegVO.getSecondaryState()!=null && HLCUserRegVO.getSecondaryState().trim().length()!=0)
			{
				sstat=HLCUserRegVO.getSecondaryState();
			}
			else
			{
				sstat="";
			}

			%>
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
<script language="javascript">

	FillCountry(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pctry%>' );
	FillState(document.frmMembRegi.pcountry_sel, document.frmMembRegi.pstate_sel, '<%=pstat%>');

	FillCountry(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sctry%>' );
	FillState(document.frmMembRegi.scountry_txt, document.frmMembRegi.sstate_txt, '<%=sstat%>');

</script>
</html>

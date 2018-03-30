<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*,java.util.regex.*"%> 
<%@ page import="com.hlchorse.form.util.*" %>
<%@ page import="com.hlcform.util.HLCMemberDetails" %>
<%@ page import="com.hlccommon.util.HLCDonationDetailVO" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.hlcform.util.*" %>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/validate.js" type="text/javascript" ></script>
<script src="js/frmMembRegi.js" type="text/javascript" ></script>
 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
 
</head>
<%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
			retValue = fieldName;	
		}		
	return retValue;
}

%>
<%! 				
				    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
					SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
					
					String dateFormat(String fieldName){					
						Date clDate = null;
						Calendar cal = Calendar.getInstance();
						GregorianCalendar gc = new GregorianCalendar();
						try{
							clDate = sd.parse(fieldName);
						}catch(Exception e){
							System.out.println("Error While Parsing Date: "+e);
						}
						
						gc.setTime(clDate);
						cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
						String dispDate = "N/A";
						if(clDate!=null ){
						dispDate = sd1.format(cal.getTime());
						}
						return dispDate;
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
			
		 <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership: Registration Detail</h2>
						</div>
					 <!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
			
		<form class='form-horizontal' role='form' name="frmMembRegi" id="myform" method="post" class="formcss" action="UserRegList.html">

		
            <div id="parta" >	
                <!-- **************************************** Part A of the form starts here *********************************************** -->
						
					
							<p class='para col-md-offset-1'>Basic Information:</p>
							
							
							<%
								 HLCUserRegVO HLCUserRegVO=new HLCUserRegVO();

								 HLCUserRegVO=(HLCUserRegVO)request.getAttribute("viewMember");
								
								 String selMemTypeId = (String) request.getAttribute("selMemTypeId");								 
																 
																 
                            %>
							
							<div class='form-group'>
							
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Salutation:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<!--<label class='control-label'><%=HLCUserRegVO.getPrefix()%></label>-->
												<label class='control-label'>N/A</label>
												</div>
											</div>
										</div>
										
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<!--<label class='control-label'><%=HLCUserRegVO.getFirstName()%></label>-->
												<label class='control-label'>N/A</label>
												</div>
											</div>
										</div>
							
							
									

								<%
								String mName="N/A";
								String lName="N/A";
								String sName="N/A";
								String login_name="N/A";
								String emailId="N/A";
								if(HLCUserRegVO.getMiddleName()!=null && HLCUserRegVO.getMiddleName().trim().length()!=0){
									mName=HLCUserRegVO.getMiddleName();
								}
								if(HLCUserRegVO.getLastName()!=null && HLCUserRegVO.getLastName().trim().length()!=0){
									lName=HLCUserRegVO.getLastName();
								}
								if(HLCUserRegVO.getSufix()!=null && HLCUserRegVO.getSufix().trim().length()!=0){
									sName=HLCUserRegVO.getSufix();
								}
								else{
									sName="N/A";
								}
								
								if(HLCUserRegVO.getLoginName()!=null && HLCUserRegVO.getLoginName().trim().length()!=0){
									if(!HLCUserRegVO.getLoginName().equalsIgnoreCase("null"))
									{
									login_name = HLCUserRegVO.getLoginName();
									}
								}
								if(HLCUserRegVO.getEmailId()!=null && HLCUserRegVO.getEmailId().trim().length()!=0){
									if(!HLCUserRegVO.getEmailId().equalsIgnoreCase("null")){
									emailId = HLCUserRegVO.getEmailId();
									}
								}
								%>
								
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Middle Name:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=nullCheck(mName)%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=nullCheck(lName)%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Suffix:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=nullCheck(sName)%></label>
												</div>
											</div>
										</div>

									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Birth:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												
												
										<%
										String[] dob =null;
										System.out.print("DOb  "+HLCUserRegVO.getDob());
										if(HLCUserRegVO.getDob()!=null && HLCUserRegVO.getDob().trim().length()!=0){
											System.out.print("DOb ! null");
											if(!HLCUserRegVO.getDob().equalsIgnoreCase("null")){
												dob=HLCUserRegVO.getDob().split(" ");
										%>
											<label class='control-label'><%=dateFormat(dob[0])%></label>
										<%
											}
										}
										else{
										%>
											<label class='control-label'> N/A</label>
										<% } %>
										
												</div>
											</div>
										</div>
										
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getGender()%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<label class='control-label'><%=emailId%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Name (Login ID):</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
													<label class='control-label'><%=login_name%></label>
												</div>
											</div>
										</div>
									</div>
									

									

									
									
								<div id="pAdd">
									
									
										<p class='para col-md-offset-1'>Primary Address</p>
									
									
									
							<div class='form-group'>
							 <div style="display: inline-block; width: 100%;">	
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrimaryAddress1()%></label>
												</div>
											</div>
										</div>
                                     </div>
									 </div>
								<%
								String sAdd;

								if(HLCUserRegVO.getPrimaryAddress2()!=null && HLCUserRegVO.getPrimaryAddress2().trim().length()!=0)
								{
									sAdd=HLCUserRegVO.getPrimaryAddress2();
								}
								else
								{
									sAdd="N/A";
								}

								String pMob;

								if(HLCUserRegVO.getPromaryMobileNo()!=null && HLCUserRegVO.getPromaryMobileNo().trim().length()!=0)
								{
									pMob=HLCUserRegVO.getPromaryMobileNo();
								}
								else
								{
									pMob="N/A";
								}

								String pFax;

								if(HLCUserRegVO.getPrimaryFaxNo()!=null && HLCUserRegVO.getPrimaryFaxNo().trim().length()!=0)
								{
									pFax=HLCUserRegVO.getPrimaryFaxNo();
								}
								else
								{
									pFax="N/A";
								}

								%>
									
								<div class="form-group">
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 2:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=sAdd%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrimaryCity()%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrimaryState()%></label>
												</div>
											</div>
										</div>

								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrmaryZip()%></label>
												</div>
											</div>
										</div>
								 
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrimaryCountry()%></label>
												</div>
											</div>
										</div>
										
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getPrimaryPhoneNo()%></label>
												</div>
											</div>
										</div>
									</div>
									
							<div class='form-group'>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=pMob%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=pFax%></label>
												</div>
											</div>
										</div>
								</div>
									
							</div>
							
							
							<%
								if(HLCUserRegVO.getSecondaryContactTypeName()!=null)
								{
									System.out.println("HLCUserRegVO.getSecondaryContactTypeName() :"+HLCUserRegVO.getSecondaryContactTypeName());
								if(HLCUserRegVO.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
								{
									System.out.println("HLCUserRegVO.getSecondaryAddress1() :"+HLCUserRegVO.getSecondaryAddress1());
							%>
									<div>

									
										<p class='para col-md-offset-1'>Secondary Address</p>
									
									
							<div class='form-group'>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getSecondaryAddress1()%></label>
												</div>
											</div>
										</div>
							 
			                    <%
								String sAdd2;

								if(HLCUserRegVO.getSecondaryAddress2()!=null && HLCUserRegVO.getSecondaryAddress2().trim().length()!=0)
								{
									sAdd2=HLCUserRegVO.getSecondaryAddress2();
								}
								else
								{
									sAdd2="N/A";
								}

								String sMob;

								if(HLCUserRegVO.getSecondaryMobileNo()!=null && HLCUserRegVO.getSecondaryMobileNo().trim().length()!=0)
								{
									sMob=HLCUserRegVO.getSecondaryMobileNo();
								}
								else
								{
									sMob="N/A";
								}

								String sFax;

								if(HLCUserRegVO.getSecondaryFaxNo()!=null && HLCUserRegVO.getSecondaryFaxNo().trim().length()!=0)
								{
									sFax=HLCUserRegVO.getSecondaryFaxNo();
								}
								else
								{
									sFax="N/A";
								}


								%>
								
								
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 2:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=sAdd2%></label>
												</div>
											</div>
										</div>

								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getSecondaryCity()%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'> <%=HLCUserRegVO.getSecondaryState()%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getSecondaryZip()%></label>
												</div>
											</div>
										</div>
											
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getSecondaryCountry()%></label>
												</div>
											</div>
										</div>
											
											
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=HLCUserRegVO.getSecondaryPhoneNo()%></label>
												</div>
											</div>
										</div>
									</div>
											
									
							<div class='form-group'>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Mobile:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=sMob%></label>
												</div>
											</div>
										</div>
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=sFax%></label>
												</div>
											</div>
										</div>
									</div>
											
											
						
									
																	
	
								</div>
                                  <%}}%>	                                      <%
                                                                           String prefcom="";
																		   System.out.println("getPreferedCommunication() :"+HLCUserRegVO.getPreferedCommunication());

                                                                           if(HLCUserRegVO.getPreferedCommunication().equalsIgnoreCase("Primary"))
                                                                           {
                                                                                prefcom="Primary Address";
                                                                           }
                                                                           else
                                                                           {
                                                                                prefcom="Secondary Address"; 
                                                                           }
                                                                        %>	

								<div class='form-group'>
									<label class='control-label col-md-3 col-md-offset-1' for='id_title'>preferred Communication Address:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=prefcom%></label>
												</div>
											</div>
										</div>
									</div>
									
									
								
										<p class='para col-md-offset-1'>Donation Information </p>
									

							 
										<%
										
										ArrayList donSelect=new ArrayList();
										donSelect=(ArrayList)request.getAttribute("donSelect");
										
											if(donSelect!=null)
											{
												System.out.println("donSelect.size() :"+donSelect.size());
												
												HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
												
												if(donSelect.size() == 0)
												{%>
												
											<div class="col-md-offset-2">
												<label class='control-label'>No donation details available for this member!!</label>
																						   
											</div>
												
												<%}
																					
												for(int u=0;u<donSelect.size();u++)
												{		
													onjDon=(HLCDonationDetailVO)donSelect.get(u);	
													String[] tmp=onjDon.getMemberDonationDate().split(" ");
												%>
												
												
								<div class='form-group'>
									<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Donated On</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=dateFormat(tmp[0])%></label>
												</div>
											</div>
										</div>
										
									<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Donation Type:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=onjDon.getDonationName()%></label>
												</div>
											</div>
										</div>
										
									<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Donation Amount:($)</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=onjDon.getDonationPrice()%></label>
												</div>
											</div>
										</div>
										
										<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Donated By</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'><%=onjDon.getDonatedBy()%></label>
												</div>
											</div>
										</div>
									</div>	
												
						<%}}else
						{%>
								
									<div class="col-md-offset-2">
										<label class='control-label'>No Donation Details Available for this Member!!</label>
																						   
									</div>
								
																  
						<%}%>
									
									
									
										<p class='para col-md-offset-1'>Contact Options</p>
									
											<div class="form-group">
											
											<% if(HLCUserRegVO.isNonUseaEmailStatus()){%>
											<label class='control-label col-md-3 col-md-offset-1' for='id_title'> Do not release my email address for non specific use:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'>Yes</label>
												</div>
											</div>
										</div>
										
												
											  
												<%}else{%>
											<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Do not release my email address for non specific use:</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'>No</label>
												</div>
											</div>
										</div>
									</div>	
                                   									
												
												 <%}%>
												
												<div class="form-group"> 
												
											<% if(HLCUserRegVO.isNonUseaMailingStatus()){%>
											<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Do not release my mailing address for non specific use.</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'>Yes</label>
												</div>
											</div>
										</div>
											   
												<%}else{%>
											<label class='control-label col-md-3 col-md-offset-1' for='id_title'>Do not release my mailing address for non specific use.</label>
										<div class='col-md-8'>
                                        	<div class='col-md-3 indent-small'>
                                            	<div class='form-group internal'>
												<label class='control-label'>No</label>
												</div>
											</div>
										</div>	
										</div>		
												<%}%>
											
											
											
									<div class='form-group'>
                                   		 <div class='col-md-offset-4 col-md-1'>
                                        	<button class='btn-lg btn-primary' type='submit' value="Back">Back</button>
										</div>
									</div>
									
									
									
		<input type="hidden" name="memProcess" value="uList" />
		<!--<input type="hidden" name="selMemTypeId" value="selMemTypeId%" />-->
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

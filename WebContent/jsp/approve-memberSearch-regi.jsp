<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcform.util.*" %>
<%@ page import="com.hlcform.util.DBHelper" %>
<%@ page import="com.hlchorse.form.util.HLCUserRegVO" %>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/frmMembSearchApprove.js" type="text/javascript" ></script>

<!--<script src="javascripts/frmMembRegi.js" type="text/javascript" ></script>
<script src="javascripts/frmMembRegValidate.js" type="text/javascript" ></script>-->
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script language="javascript">

function currentDate()
{	
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowMonth1=todayDate.getMonth();
	var nowYear=todayDate.getYear();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	//document.myform.approvalDate.value = nowMonth+"/"+nowDate+"/"+nowYear;
}
</script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->


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
                            <h2>USEA Membership::Membership Information</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
  <%! 				SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
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
  <!--<tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
				<!--<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>-->
			<!-- LEFT MENU ENDS HERE -->

		    <!--</td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
					<!--<div class="cmmnForm">
						<div class="colspan"><strong>USEA Membership:</strong> <span class="styleBoldTwo">Membership Information</span> </div>-->
						
					<!--
						<table cellpadding="0" cellspacing="0" border="0" class="container">
						<tr>
							<td id="tabData1" class="tabHighlight" onclick="naviTab('1')">
								<a id="link1" href="javascript:void(0);" class="active"><span id="1" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData2" class="tabLowlight" onclick="naviTab('2')">
								<a id="link2" href="javascript:void(0);" class="inactive"><span id="2" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData3" class="tabLowlight" onclick="naviTab('3')">
								<a id="link3" href="javascript:void(0);" class="inactive"><span id="3" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData4" class="tabLowlight" onclick="naviTab('4')">
								<a id="link4" href="javascript:void(0);" class="inactive"><span id="4" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData5" class="tabLowlight" onclick="naviTab('5')">
								<a id="link5" href="javascript:void(0);" class="inactive"><span id="5" class="tabHead"></span></A>
							</td>
							<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
							<td id="tabData6" class="tabLowlight" onclick="naviTab('6')">
								<a id="link6" href="javascript:void(0);" class="inactive"><span id="6" class="tabHead"></span></A>
							</td>
						</tr>
						</table>
					-->
						<form name="frmMembRegi" id="myform" method="post" class="formcss" action="./MembershipReg.html" onsubmit="return myval();">
						<input type="hidden" name="process" value="update"/> 
						
								
					<%   
																 HLCMemberDetails objMember = new HLCMemberDetails();
																 objMember=(com.hlcform.util.HLCMemberDetails)request.getAttribute("objMember");
																 String memTypsel=null; 
                                                                                                                                 
                                   
																ArrayList memPreference = (ArrayList)request.getAttribute("mailPreference");
																ArrayList familyAddOnId = (ArrayList)request.getAttribute("familyAddOnId");
                                                                                                                                session.setAttribute("familyAddOnId",familyAddOnId);
                                                                                                                                                                  
								                                                                    Vector memberTypeVect3=new Vector();
                                                                                                                                    memberTypeVect3=(Vector)request.getAttribute("userTypeVect3");
                                                                                                                                    System.out.println("memberTypeVect3:"+memberTypeVect3);
                                                                                                                                    System.out.println("memberTypeVect3: SIZE  "+memberTypeVect3.size());
                                                                                                                                     String str1 [] = new String [15];
																																	   String str2[] = new String [15];
																																	   String str3[] = new String [15];
                                                                                                                                      if (  memberTypeVect3.elementAt(0) != null && memberTypeVect3.size() !=0)
                                                                                                                                     {
                                                                                                                                               str1   = (String[]) memberTypeVect3.elementAt(0);
                                                                                                                                     }	
																																	 if (  memberTypeVect3.elementAt(1) != null && memberTypeVect3.size() !=0)
                                                                                                                                     {
                                                                                                                                               str2   = (String[]) memberTypeVect3.elementAt(1);
                                                                                                                                     }	
																																	 if (  memberTypeVect3.elementAt(2) != null && memberTypeVect3.size() !=0)
                                                                                                                                     {
                                                                                                                                               str3   = (String[]) memberTypeVect3.elementAt(2);
                                                                                                                                     }	
  

                                                                                                                                     String parentId="N/A";
                                                                                                                                     if(str1[3]!=null){
                                                                                                                                      parentId =str1[3];
                                                                                                                                      }
		
																																		String joinDate = "N/A";																																	  if (str1[6] != null) {		
																																	  joinDate = str1[6];
																																	  String jD[] = joinDate.split(" ");
																																	  joinDate = jD[0];
																																	  }
																																	  String expDate = "11-17-2000";
																																	  if (str1[7] != null){
																																	      expDate = str1[7];
																																		  String jD[] = expDate.split(" ");
																																		  expDate = jD[0];
																																		  }
																																		 																																		  String dob = "N/A";
																																		  if (str2[6] != null) {
																																		    dob = str2[6];
																																			String jD[] = dob.split(" ");																																			
																																			 dob = jD[0];																																			}
																																			String gendar = "N/A";
																																		  if (str2[7] != null) {
																																		    gendar = str2[7];
																																			}
																																			
																																			//contactTypeName, suite, add1, add2, city, state, country, zip
																																			String add1 = "";
																																			String add2 = "";
																																			String city = "";
																																			String state = "";
																																			String country = "";
																																			String zip = "";
																																			String areaName = "N/A";
																																			String prefix1 = "";
																																			String firstName = "";
																																			String middleName ="";
																																			String lastName = "";																																			String emailId = "";
																																			String suffix_nme = "";		
																																																																				
																																			if(str3[2] != null) {
																																			add1=str3[2];
																																			}
																																			if (str3[3] != null) {
																																			add2 = str3[3];
																																			}
																																			if (str3[4] != null) {
																																			city = str3[4];
																																			}
																																			if (str3[5] != null){
																																			state = str3[5];
																																			}
																																			if (str3[6] != null) {
																																			country = str3[6];
																																			}
																																			if (str3[7] != null) {
																																			zip = str3[7];
																																			}
																																			if (str3[11] != null) {
																																			areaName = str3[11];
																																			}
																																			
																																			if(str2[1]!=null){
																																				prefix1  =str2[1];
																																			}
																																			if(str2[2]!=null){
																																				firstName  = str2[2];
																																			}
																																			if(str2[4]!=null){
																																				lastName  =str2[4];
																																			}
																																			if(str2[3]!=null){
																																				middleName = str2[3];
																																			}
																																			if(str2[5]!=null){
																																				suffix_nme = str2[5];
																																			}
																																			if(str2[8]!=null){
																																				emailId = str2[8];
																																			}																																			
	                                                                                                                          
		%>		
																	<%
																	String mtyp="";
																	
																	if(objMember.getMembershipTypeName()!=null && objMember.getMembershipTypeName().trim().length()!=0)
																	{
																	mtyp=objMember.getMembershipTypeName();
																	}
																	else
																	{
																	mtyp="N/A";
																	}
																	%>
																	
																	<%
																	String tmpMemId="";
																	tmpMemId=objMember.getMemberId(); 
																	
																	String status="";
																	
																	if(objMember.getStatusName()!=null)
																	{
																	status=objMember.getStatusName();
																	}
																	else
																	{
																	status="N/A";
																	}
																	%>
											<p> You are viewing Membership Information for:</p>
						                        <p class="para">USEA Member Details :</p>
																																	

																<%
	
																if(objMember.getMembershipTypeName()!=null && objMember.getMembershipTypeName().trim().length()!=0)
																{
																	mtyp=objMember.getMembershipTypeName();
																}
																else
																{
																	mtyp="N/A";
																}
																%>
									<div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=objMember.getMemberId()%></label>
                                            </div>
                                        </div>

                                    </div>				
													
													<%
													boolean curr_link = false;
													java.util.Calendar toDay = java.util.Calendar.getInstance();
													int newyear = toDay.get(Calendar.YEAR);
													int new_month = toDay.get(Calendar.MONTH);
													if(new_month>=9 && new_month<=10){
													ArrayList histValues = (ArrayList) request.getAttribute("histValues");
													if(histValues!=null && histValues.size()!=0){
													Iterator itr = histValues.iterator();
													while(itr.hasNext()){
													String[] histval = (String[]) itr.next();
													String membTypName = histval[0];
													String membYr = histval[1];
													String statName = histval[2];
													String ExpDte = histval[3];
													int dbYear =  Integer.parseInt(membYr);

													if(curr_link==false){
														curr_link =true;
													%>
												 <div class='col-md-offset-1'>
									                <label class='control-label'>Current Year:</label>
								              	</div>
													<%
													}
													else{%>
												<div class='col-md-offset-1'>
									                <label class='control-label'>Upcoming Year:</label>
								              	</div>
													<% } %>
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=membTypName%></label>
                                            </div>
                                        </div>

                                    </div>	
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=statName%></label>
                                            </div>
                                        </div>

                                    </div>	
                                  									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiration Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            
														<%
															if(membTypName.equalsIgnoreCase("Life Member")){
																ExpDte = "No Expiry Date For Life Members";
															}
														if(ExpDte==null || ExpDte.equalsIgnoreCase("null") || ExpDte.trim().length()==0)  ExpDte = "N/A";	
														%>
													<label class='control-label'><%=ExpDte%></label>
                                            </div>
                                        </div>

                                    </div>	
									</div>
																											
													<%
													}
													%>
													
													<%
													}
													}
													else{
													%>
											<p class="para">USEA Member Information :</p>
														<%
														if(objMember.getMembershipTypeName()!=null && objMember.getMembershipTypeName().trim().length()!=0){
															mtyp=objMember.getMembershipTypeName();
														}
														else{
															mtyp="N/A";
														}
														%>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Type:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=mtyp%></label>
                                            </div>
                                        </div>

                                    </div>	
                                  					
															
													<%
															String tmpMemId1="";
															tmpMemId1=objMember.getMemberId(); 
															
															String status1="";
															
															if(objMember.getStatusName()!=null)
															{
																status1=objMember.getStatusName();
															}
															else
															{
																status1="N/A";
															}
													%>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Status:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=status1%></label>
                                            </div>
                                        </div>

                                    </div>	
                                  						
														<%
														
														//new_month
														%>														
													<%
													if(!mtyp.equalsIgnoreCase("Life Member"))
	  												{%>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiration Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=dateFormat(expDate)%></label>
                                            </div>
                                        </div>

                                    </div>			
	 
												<%}}%>
													
									<p class="para">Personal / Contact Details:</p>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Join Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=dateFormat(joinDate)%></label>
                                            </div>
                                        </div>

                                    </div>	
                                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date of Birth:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=dateFormat(dob)%></label>
                                            </div>
                                        </div>

                                    </div>	
                                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Gender:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=gendar%></label>
                                            </div>
                                        </div>

                                    </div>	  									
													
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=areaName%></label>
                                            </div>
                                        </div>

                                    </div>	
                                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Email:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><A HREF="mailto:<%=emailId%>"><%=emailId%></A></label>
                                            </div>
                                        </div>

                                    </div>
                                </div>									
															
													<%
													try{
														 HLCUserRegVO userregvo=new HLCUserRegVO();

                                                         userregvo=(HLCUserRegVO)request.getAttribute("userregvo");
													
													%>
							<div class="form-group">						
							<div id="pAdd">
									
								<p class="para">Primary Address </p>
								      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getPrimaryAddress1()%></label>
                                            </div>
                                        </div>

                                    </div>
											

								<%
								String sAdd;

								if(userregvo.getPrimaryAddress2()!=null && userregvo.getPrimaryAddress2().trim().length()!=0)
								{
									sAdd=userregvo.getPrimaryAddress2();
								}
								else
								{
									sAdd="N/A";
								}

								String pMob;

								if(userregvo.getPromaryMobileNo()!=null && userregvo.getPromaryMobileNo().trim().length()!=0)
								{
									pMob=userregvo.getPromaryMobileNo();
								}
								else
								{
									pMob="N/A";
								}

								String pFax;

								if(userregvo.getPrimaryFaxNo()!=null && userregvo.getPrimaryFaxNo().trim().length()!=0)
								{
									pFax=userregvo.getPrimaryFaxNo();
								}
								else
								{
									pFax="N/A";
								}

								%>
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
                                              <label class='control-label'><%=userregvo.getPrimaryCity()%></label>
                                            </div>
                                        </div>

                                    </div>
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getPrimaryState()%></label>
                                            </div>
                                        </div>

                                    </div>		
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getPrmaryZip()%></label>
                                            </div>
                                        </div>

                                    </div>		
											
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getPrimaryCountry()%></label>
                                            </div>
                                        </div>

                                    </div>	
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getPrimaryPhoneNo()%></label>
                                            </div>
                                        </div>

                                    </div>									
											
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
								if(userregvo.getSecondaryContactTypeName()!=null)
								{
									System.out.println("userregvo.getSecondaryContactTypeName() :"+userregvo.getSecondaryContactTypeName());
								if(userregvo.getSecondaryContactTypeName().equalsIgnoreCase("Secondary"))
								{
									System.out.println("userregvo.getSecondaryAddress1() :"+userregvo.getSecondaryAddress1());
							%>
								<p class="para">Secondary Address </p>
							<div class="form-group">
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address 1:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getSecondaryAddress1()%></label>
                                            </div>
                                        </div>

                                    </div>			

							 
								
			                    <%
								String sAdd2;

								if(userregvo.getSecondaryAddress2()!=null && userregvo.getSecondaryAddress2().trim().length()!=0)
								{
									sAdd2=userregvo.getSecondaryAddress2();
								}
								else
								{
									sAdd2="N/A";
								}

								String sMob;

								if(userregvo.getSecondaryMobileNo()!=null && userregvo.getSecondaryMobileNo().trim().length()!=0)
								{
									sMob=userregvo.getSecondaryMobileNo();
								}
								else
								{
									sMob="N/A";
								}

								String sFax;

								if(userregvo.getSecondaryFaxNo()!=null && userregvo.getSecondaryFaxNo().trim().length()!=0)
								{
									sFax=userregvo.getSecondaryFaxNo();
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
                                              <label class='control-label'><%=userregvo.getSecondaryCity()%></label>
                                            </div>
                                        </div>

                                    </div>	
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getSecondaryState()%></label>
                                            </div>
                                        </div>

                                    </div>		
                                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zipcode:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getSecondaryZip()%></label>
                                            </div>
                                        </div>

                                    </div>	
									 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getSecondaryCountry()%></label>
                                            </div>
                                        </div>

                                    </div>	
                                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=userregvo.getSecondaryPhoneNo()%></label>
                                            </div>
                                        </div>

                                    </div>		
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
                                  <%}}%>	                                      <%
                                                                           String prefcom="";
																		   System.out.println("getPreferedCommunication() :"+userregvo.getPreferedCommunication());

                                                                           if(userregvo.getPreferedCommunication().equalsIgnoreCase("Primary"))
                                                                           {
                                                                                prefcom="Primary Address";
                                                                           }
                                                                           else
                                                                           {
                                                                                prefcom="Secondary Address"; 
                                                                           }
                                                                        %>	
																		
																		
									<div class="form-group">							
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>preferred Communication Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=prefcom%></label>
                                            </div>
                                        </div>

                                    </div>
								</div>	
													<%
													}
													catch(Exception e)
													{
														System.out.print(" error in jsp :"+e);
													}
													%>
																				
							<div class="form-group">				
									<label class='control-label col-md-8 col-md-offset-2' for='id_title'>Mailing Preferences:</label>
                                    <div class='col-md-12'>
                                        <div class='col-md-6 indent-small'>
                                            <div class='form-group internal'>	
													<% String mailPreference = "";
													if(memPreference !=null && memPreference.size()!=0){
															Iterator it = memPreference.iterator();
															while(it.hasNext()){
																mailPreference = (String)it.next();
																if(mailPreference==null)
																      mailPreference = "";  %>
													
													 <label class='control-label'><%=mailPreference%></label>
                                            
                                    
																		
												    
													<% } }
													else
													{%>
												         <div style="display: inline-block; width: 100%;">	
														<label class='control-label col-md-offset-4'>No Mailing Preferences details available for this Member!!</label>
														</div>
													<%}
													%>
								              	</div>
                                        </div>
				
								</div>					
						</div>						
													
													
				
                           <div class="form-group">	
								<div style="display: inline-block; width: 100%;">					   
								<p class="para">Current Full / Life Member Info:</p>
								</div>	
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Parent Member ID :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>												
															
															<%
															   String parId=objMember.getParentMemberId();
															   
																		if(parId!=null && parId.trim().length()!=0)
																		{
																			 parId=objMember.getParentMemberId();
																		}
																		else
																		{
																			parId="N/A";
																		}
																%>   
                                                   <label class='control-label'><%=parentId%></label>
                                            </div>
                                        </div>

                                    </div>      																
								                 	 
															  <%
																			int addon=0;
																			if(objMember.getFamilyAddOn()!=null)
																		{
																			List lst=(List)objMember.getFamilyAddOn();
																			addon=lst.size();
																		}
																		else
																		{
																			addon=0;
																		}
																%>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Number Of Family members :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=addon%></label>
                                            </div>
                                        </div>

                                    </div>												  
															  <% 
															  String[] familyAddOnId1 = new String[2];
															  String famMid="";
															  String famUid="";
															  
													if(familyAddOnId !=null && familyAddOnId.size()!=0){
													%>
													
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Family members ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
																
													<%
															Iterator it = familyAddOnId.iterator();
															while(it.hasNext()){
																familyAddOnId1 = (String[])it.next();
																famMid=familyAddOnId1[0];
																famUid=familyAddOnId1[1];
																
																System.out.print("famMid :"+famMid);
																System.out.print("famUid :"+famUid);
																																
													 %>
													<label class='control-label'><a href="MembershipReg.html?process=familyView&familyAddOnId1=<%=famMid%>&userId=<%=famUid%>" target="_blank"><%=famMid%></a></label>
                                            </div>
                                        </div>

                                    </div>	
							</div>		
												
															
													
													<% } }%>
													          <div style="display: inline-block; width: 100%;">
															  <p>Non-USEA Membership Information: </p>
															  </div>
												          <%
															 ArrayList nonusea=new ArrayList();
															 ArrayList donSelect=new ArrayList();
																	 
															nonusea=(ArrayList)request.getAttribute("nonusea");

															donSelect=(ArrayList)request.getAttribute("donSelect");
															
															if(nonusea!=null)
															{
																System.out.println("nonusea.size() :"+nonusea.size());
																HLCNonUseaOrgVO onjNonUsea = new HLCNonUseaOrgVO();
																
																if(nonusea.size() == 0)
																{%>
																
																<label class='control-label'>No Non-USEA Organization details available for this Member!!</label>
																<%}
																
																for(int t=0;t<nonusea.size();t++)
																{		
																		onjNonUsea=(HLCNonUseaOrgVO)nonusea.get(t);
															%>
								<div class="form-group">									
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non USEA Organization Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=onjNonUsea.getNonuseaOrgName()%></label>
                                            </div>
                                        </div>

                                    </div>	
																  
																  <%
																  	String nonMemId="";
																	
																	if(onjNonUsea.getNonuseaMemberId()!=null)
																	{
																		nonMemId=onjNonUsea.getNonuseaMemberId();
																	}
																	else
																	{
																		nonMemId="NA";
																	}		
																														  
																  %>
																  
					              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non USEA MemberID: </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                              <label class='control-label'><%=nonMemId%></label>
                                            </div>
                                        </div>

                                    </div>	
									
																	

																  <%}}else
																  {%>
																  
																  <label class="control-label col-md-offset-2">No Non-USEA Organization details available !! </label>
																  
																  <%}
																  
																  %>
																	<p class="para">Donation Information </p>
																			<%
																				if(donSelect!=null)
																				{
																					System.out.println("donSelect.size() :"+donSelect.size());
																					
																					HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
																					
																					if(donSelect.size() == 0)
																					{%>
																					
																					 <label class="control-label col-md-offset-2">No donation details available for this member!!</label>
																					
																					<%}
																					
																					
																					for(int u=0;u<donSelect.size();u++)
																					{		
																						onjDon=(HLCDonationDetailVO)donSelect.get(u);	
																					String[] tmp=onjDon.getMemberDonationDate().split(" ");
																				%>	
																				
										             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donated On: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=dateFormat(tmp[0])%></label>
																</div>
															</div>
                                                         </div>	
														 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donated Type: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=onjDon.getDonationName()%></label>
																</div>
															</div>
                                                         </div>							
																 				
														 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donation Amount:($) </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=onjDon.getDonationPrice()%></label>
																</div>
															</div>
                                                         </div>						
																 
																 
																 
																 <%
																 String donBy="N/A";
																 
																 if(onjDon.getDonatedBy()!=null)
																 {
																 	donBy=onjDon.getDonatedBy();
																 }
																 
																%>
																 
														 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Donated By</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=donBy%></label>
																</div>
															</div>
                                                         </div>	
                                                        </div>														 
																 <
																  
																 <%}}else
																  {%>
																  
														 <label class="control-label col-md-offset-2">No Donation Details Available for this Member!!</label>
																  
																  <%}
																  
																  %>
																 
																 
																 <p class="para">Amateur Rider Information </p>
																 <%
																	String AmateurName="";
																	String AmateurDec1="";
																	String AmateurDec2="";
																	
                                                                    boolean isAmateurDec2;
                                                                    boolean isAmateurDec1;  
																	
																	if(objMember.getAmateurName() !=null)
																	{
																		AmateurName=objMember.getAmateurName();
																	}
																	else
																	{
																		AmateurName="NA";
																	}
                                                                                                                                        
                                                                                                                                        isAmateurDec1=objMember.isAmateurDec1();
                                                                                                                                        
                                                                                                                                        if(isAmateurDec1 == true)
                                                                                                                                        {
                                                                                                                                            AmateurDec1="Yes";
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                             AmateurDec1="No";   
                                                                                                                                        }
                                                                                                                                        
                                                                                                                                        
                                                                                                                                        
                                                                                                                                       isAmateurDec2=objMember.isAmateurDec2();
                                                                                                                                        
                                                                                                                                        if(isAmateurDec2 == true)
                                                                                                                                        {
                                                                                                                                            AmateurDec2="Yes";
                                                                                                                                        }
                                                                                                                                        else
                                                                                                                                        {
                                                                                                                                             AmateurDec2="No";   
                                                                                                                                        }
                                                                                                                                     
																																	 System.out.println("AmateurName :"+AmateurName); 
																																	 System.out.println("AmateurDec1 :"+isAmateurDec1);  
                                                                                                                                     System.out.println("AmateurDec2 :"+isAmateurDec1);  
                                                                                                                                        
                                                                                                                                                
																 %>
												<div class="form-group">
                                                  											
													<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=AmateurName%></label>
																</div>
															</div>
                                                         </div>	
															<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Possession of a current USEF Amateur Card ?</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=AmateurDec1%></label>
																</div>
															</div>
                                                         </div>	
															<div style="display: inline-block; width: 100%;">			 																 
                                                            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Declaration serves as my affidavit for Amateur Status Eligibility ? </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=AmateurDec2%></label>
																</div>
															</div>
                                                         </div>	 
                                                        </div>														 
																
														<p class="para">Payment Information: </p>
																 
																 <%
																 HLCPaymentDetails objPayment = new HLCPaymentDetails();
																 
																 objPayment=(HLCPaymentDetails)request.getAttribute("objPayment");
																 System.out.println("objPayment jsp :"+objPayment.toString());
																 String chkAmt="";
                                                                                                                                  
																 if(objPayment != null)
																 {
																 %>
																 <input type="hidden" name="payId" value="<%=objPayment.getPaymentId()%>" />
																 <%
																if(objPayment.getPaymentStatus()!=null)
																{
																if(objPayment.getPaymentStatus().equalsIgnoreCase("card"))
																{
                                                                                                                                    
                                                                                                                                     String ccType="N/A";
																																   
                                                                                                                                    if(objPayment.getCcType()!=null)
                                                                                                                                    { 
                                                                                                                                        ccType=objPayment.getCcType();
                                                                                                                                    }
                                                                                                                                     
                                                                                                                                    String namCard="N/A";
  
                                                                                                                                   if(objPayment.getCcName()!=null)
                                                                                                                                   {                                                                                                                                      
                                                                                                                                        namCard=objPayment.getCcName();
                                                                                                                                   }
                                                                                                                                    
                                                                                                                                    String cardNo="N/A";

                                                                                                                                    if(objPayment.getCcNumber()!=null)
                                                                                                                                    {
                                                                                                                                        cardNo=objPayment.getCcNumber();
                                                                                                                                    }
                                                                                                                                    
                                                                                                                                    String txId="N/A";
                                                                                                                                    
                                                                                                                                    if(objPayment.getSslTxnId()!=null)
                                                                                                                                    {	
                                                                                                                                        txId=objPayment.getSslTxnId();
                                                                                                                                    }
                                                                                                                                    
																%>
																
												<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
																</div>
															</div>
                                                         </div>	  
															<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card Type:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=ccType%></label>
																</div>
															</div>
                                                         </div>		
													<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name on Card:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=namCard%></label>
																</div>
															</div>
                                                         </div>	
                                 													 
													<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Card No: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=cardNo%></label>
																</div>
															</div>
                                                         </div>		
                                        													 
													<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Transaction Id :</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=txId%></label>
																</div>
															</div>
                                                         </div>				  	
																			  
														<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=dateFormat(objPayment.getPaymentDate().toString())%></label>
																</div>
															</div>
                                                         </div>		 
                                                          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getAmount()%></label>
																</div>
															</div>
                                                         </div>		 
                                                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Status:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getSslResultMessage()%></label>
																</div>
															</div>
                                                         </div>	                                                                        
															
																 
																  
																 <%}else{
                                                                                                                                    
                                                                                                                                    chkAmt=String.valueOf(objPayment.getCheckAmount());
                                                                                                                                    
                                                                                                                                    %>
															 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Mode:</label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getPaymentStatus()%></label>
																</div>
															</div>
                                                         </div>	                                                                        
															
															 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check No: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getCheckNumber()%></label>
																</div>
															</div>
                                                         </div>	  		
																 
															
															 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Bank Name: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getBankName()%></label>
																</div>
															</div>
                                                         </div>	  	 
																  
															 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Date: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=dateFormat(objPayment.getCheckDate().toString())%></label>
																</div>
															</div>
                                                         </div>	  		 
															 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Check Amount: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=chkAmt%></label>
																</div>
															</div>
                                                         </div>	  		 
                                                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Payment Date: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=dateFormat(objPayment.getPaymentDate().toString())%></label>
																</div>
															</div>
                                                         </div>	          
                                                             <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amount: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
																  <label class='control-label'><%=objPayment.getAmount()%></label>
																</div>
															</div>
                                                         </div>	                                                                        
																
																 
																 <%}}else{%>
																 
																 <p id="p_error">Payment Failed for this Member !</p>
																  
																<%}}else{%>
																 
																<p id="p_error">Payment Failed for this Member !</p>
																  
																<%}%>
																
											  </div>													
										<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assign Status: </label>
														<div class='col-md-8'>
															<div class='col-md-3 indent-small'>
																<div class='form-group internal'>
														        <label class='control-label'><select name="uStatusId" id="uStatusId" class="form-control" ></label>
<% String[] dropVal = new String[]{ "Active","Inactive","Expired","Duplicate","Suspended","Pending","Deceased","Merged"};
   String[] dropText = new String[]{"Activate","Deactivate","Expired","Duplicate","Suspended","Pending","Deceased","Merged"};

					   if(status!= null && status.trim().length()!=0){
								    for(int i=0;i<8;i++){
										if(status.equalsIgnoreCase(dropVal[i])){%>
										<option value="<%=dropVal[i]%>" selected="selected"><%=dropText[i]%></option> 
										<%} else {%>
										<option value="<%=dropVal[i]%>"><%=dropText[i]%></option> 
									   <%}
									}									
						} else { %>
								
														  <option selected="selected">Select One</option>
														  <option value="Active">Activate</option>
														  <option value="Inactive">Deactivate</option>
														  <option value="Pending">Pending</option>
														  <option value="Expired">Expired</option>
														  <option value="Suspended">Suspended</option>
														  <option value="Duplicate">Duplicate</option>
														  <option value="Deceased">Deceased</option>	
														  <option value="Merged">Merged</option>	
					  	<%}%>			                                 
														</select>
												           </div>
													</div>
                                          </div>	   
	<tr>
		  <% 
		     String finalDate="";
		 	 
			 
		 				java.util.Calendar c5 = java.util.Calendar.getInstance();
    					int day = c5.get(Calendar.DATE);
						int month1 = c5.get(Calendar.MONTH);
						
						int month=month1+1;
						int year = c5.get(Calendar.YEAR);
						String date="";
						String chkDat="";
						
						if(month<10)
						{
							date = year+"-"+"0"+month+"-"+day;
							System.out.print("inside if(month1<10) ");
							chkDat = "0"+month+"/"+day+"/"+year;
						}
						else
						{
						date = year+"-"+month+"-"+day;
						chkDat = month+"/"+day+"/"+year;
						}
		 
		    Date appDate = new Date();
		    appDate = (Date) request.getAttribute("approvalDate");
			if(appDate==null){
			finalDate = chkDat;
			System.out.println("Final Date : "+finalDate);
			}
			else{
			java.sql.Date dt=DBHelper.toSQLDate(appDate);
			String tmpDat="";
			tmpDat=dt.toString();
			String ttDay[]=tmpDat.split("-");
			finalDate = ttDay[1]+"/"+ttDay[2]+"/"+ttDay[0];
			System.out.print("finalDate :"+finalDate);
			
			}
			
		%>
		   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Approval  Date: </label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
					  <input name="approvalDate" type="text" id="approvalDate" class="form-control"  value="<%=finalDate%>"  >
					   <a onclick="javascript:NewCssCal('date')"><i id="calendar1" class="fa fa-calendar"></i></a></input>
					</div>
					
				</div>
			 </div>	
		
					<div class="form-group">
					
																	<%
					String usrId="";

					if(request.getAttribute("userId")!=null)
					{
					usrId=(String)request.getAttribute("userId");
					}

					String mailStatus = (String)request.getAttribute("mailStatus");
					String splNotes = (String)request.getAttribute("splNotes");
					if(splNotes==null){
					splNotes ="";
					} 
					if(mailStatus.equalsIgnoreCase("true")){%>
			<div style="display: inline-block; width: 100%;">			
			     <div class='col-md-12 '>
				<div class='col-md-4 indent-small'>
					<div class='form-group internal'>
					  <input type="checkbox" name="mailAddressStatus"  id="mailAddressStatus" value="true" checked/>&nbsp;Verify Mailing address 
					</div>
				</div>
			 </div>	
           </div>			 
										
										<%}else {%>
			<div style="display: inline-block; width: 100%;">								
			<div class='col-md-12 col-md-offset-4'>
				<div class='col-md-6 indent-small'>
					<div class='form-group internal'>
					 <input type="checkbox" name="mailAddressStatus"  id="mailAddressStatus" value="true"/>&nbsp;Verify Mailing address 
					</div>
				</div>
			 </div>	
         </div>	
</div>		 
										
										<%}%>
			</div>							
		<div style="display: inline-block; width: 100%;">		
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Special Notes: </label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
					  <textarea name="splNote" rows="5"/><%=splNotes%></textarea>
					</div>
				</div>
			 </div>	
		</div>									  	
                                                                                        
           <input type="hidden" name="userId" value="<%=usrId%>" />
                                                                                        
																	
											  <!-- SearchList.do -->
					               <div class="form-group">
							         <div class='col-md-offset-4 col-md-2'>
                                        <button name="Submit" class='btn-lg btn-primary' type='submit' value="Submit">Submit</button>
									</div>
									<div class='col-md-1'>
                                        <button type="button" value=" Back "  onclick="javascript: history.go(-1);" class='btn-lg btn-danger'>Back</button>
									</div>
							
		                       </div>              
	
		           
											
                                                                                          	
							
							<input type="hidden" value="<%=objMember.getMemberId()%>" name="memberId"/>

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
			
				<%@ include file = "../../include/Footer_temp.jsp" %>
				
			<!--==============================include chat Here=================================-->
</body>



<script language="javascript">
	var cal1 = new calendar2(document.forms['myform'].elements['approvalDate']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	</script>

</html>

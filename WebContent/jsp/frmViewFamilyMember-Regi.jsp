<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="com.hlcform.util.*" %>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcmrm.util.*"%>


<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
<script src="javascripts/calendar2.js" type="text/javascript"></script>

<script language="javascript">
function txtBxDisabEnab(txtBxId) {
	if(document.getElementById(txtBxId).disabled == true){
		if(document.getElementById(txtBxId).value == "Member Id"){
			document.getElementById(txtBxId).disabled = false;
			document.getElementById(txtBxId).value = "";
		}
	}else{
		document.getElementById(txtBxId).disabled = true;
		document.getElementById(txtBxId).value = "Member Id"
	}
}

function unhideMailOpts(divId,chkBxId) {
	if(document.getElementById(chkBxId).checked != false){
		document.getElementById(divId).style.display = "none";
		
		var n = document.frmMembRegi.pub_ct.value;
	
		for(i=0;i<n;i++){
		var str="mailOpt1"+i;
		document.getElementById(''+str).checked=false;
	
}
		
	}else {
		document.getElementById(divId).style.display = "block";
	}
}

function myval()
{
	/*if(document.frmMembRegi.uStatusId.value==""){
		alert(" Select any Status ");
		document.frmMembRegi.uStatusId.focus();
		return false;
	}*/
        //alert("inside");
		
        //--------------------------for non hlc  Membership Id  
        
    chbxnum1=document.frmMembRegi.orgCbxCt.value;
   for(i=0;i<chbxnum1;i++)
	{ chbxname = "orgNameCbx"+i;
	  txtname="orgNameTxt"+i;
	 // alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
		 if(txtval=="" || document.getElementById(''+txtname).value.indexOf(' ')==0)
		  {alert("Enter the Non Organization Member Id");
		  document.getElementById(''+txtname).focus();
		  return false;}
		  /*alert(document.getElementById(''+txtname).length);
		  if(document.getElementById(''+txtname).length>20)
		  {
			  alert("Non HLC Organization Member Id exceeds the Range");
		  	  document.getElementById(''+txtname).focus();
			  return false;
		  
		  }*/
		 // alert(chbxname);
		
	  }
	  //return false;
	}
  //-----------------------------------
 if(document.frmMembRegi.memTyp.value!="Subscribing Member" && document.frmMembRegi.memTyp.value!="Non-Competing Member")
  {
  if(document.frmMembRegi.amatName.value.length >80)
     { alert("Amateur Name Range Exceeds 80 characters");
     document.frmMembRegi.amatName.focus();
     return false;
     }
    return true;    
   } 

 }

</script>
<!-- <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" /> -->

</head>

<body>
<!-- <body onload="famAddOnInit(), initLife();">-->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		 <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
		<!--==============================include header Here=================================-->
	</td>
  </tr>
  
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

  <tr>
    <td class="tableCommonBg">
		
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab">
		  
		  <tr>
			<td width="230" class="menuTablePad">
			<!-- LEFT MENU STARTS HERE -->
				<%@ include file = "../../include/menu-roles-leftmenu.jsp" %>
			<!-- LEFT MENU ENDS HERE -->

		    </td>
			<td width="500" class="subDeptTablePad">
				<!-- CONTENTS START HERE -->
				
					<div class="cmmnForm">
						<div class="colspan"><strong>Membership:</strong> <span class="styleBoldTwo">Membership Information</span></div>

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
						<form name="frmMembRegi" id="myform" method="post" class="formcss" action="./MembershipReg.html" onsubmit="return myval(this);">
								<div id="part1" class="holderDivOne" >
					<%   
																 HLCMemberDetails objMember = new HLCMemberDetails();
																 objMember=(com.hlcform.util.HLCMemberDetails)request.getAttribute("objMember");
																 String memTypsel=null; 
                                                                                                                                 
                                   
																ArrayList memPreference = (ArrayList)request.getAttribute("mailPreference");
																ArrayList familyAddOnId = (ArrayList)request.getAttribute("familyAddOnId");
																Vector areUAMemberVect=new Vector();
																areUAMemberVect=(Vector)request.getAttribute("areUAMemberVect");
																
																
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
																																	  String expDate = "N/A";
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
																																			String areaName = "N/A";																																			
																																			String prefix1 = "";
																																			String firstName = "";
																																			String middleName ="";
																																			String lastName = "";
																																			String zip = "";
																																			String emailId = "";
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


		%>							<div id="commonBG" class="textCommon" >You are viewing Membership Information for:<span class="rowHead"><span class="styleBoldOne"><%=prefix1%>. <%=firstName%> <%=middleName%> <%=lastName%> <%=suffix_nme%></span></span></div>
													 <div class="colspan">
																Member Details :													  </div>				

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
													<div class="row">
														<span class="label">Member ID:</span>		
													<span class="label">
														<%=objMember.getMemberId()%>																		
												    </span>	
													
													</div>
													<%
													boolean curr_link = false;
													ArrayList histValues = (ArrayList) request.getAttribute("histValues");
													if(histValues!=null && histValues.size()!=0){
													Iterator histItr = histValues.iterator();
													while(histItr.hasNext()){
													String[] histval = (String[]) histItr.next();
													String membTypName = histval[0];
													String membYr = histval[1];
													String statName = histval[2];
													String ExpDte = histval[3];		
													java.util.Calendar toDay = java.util.Calendar.getInstance();
													int newyear = toDay.get(Calendar.YEAR);
													int new_month = toDay.get(Calendar.MONTH);	
													int dbYear =  Integer.parseInt(membYr);

													if(curr_link==false){
														curr_link =true;
													%>
														<div class="colspan"><strong>Current Year:</strong></div>
													<%
													}
													else{%>
														<div class="colspan"><strong>Upcoming Year:</strong></div>
													<% } %>
													<div class="row">
														<span class="label">Membership Type:</span>
														<span class="label"><%=membTypName%> </span>													
													</div>
													<div class="row">
														<span class="label">Membership Status:</span>
														<span class="label"><%=statName%></span>
													</div>
														<%
														if(curr_link==false){
														if(ExpDte!=null){
														if(statName!=null){
														if(statName.equalsIgnoreCase("Active")){
															String[] tmpDte = ExpDte.split("-");
															if(Integer.parseInt(tmpDte[0])<=newyear){
																if(new_month>=9 && new_month<11){
														%>
															<div class="row">
																<span class="label">Renewal Status :</span>
																<span class="label">														
																	<strong>Not Renewed!&nbsp;&nbsp;&nbsp;<a href="./MembershipReg.html?process=renew">Renew Now!</a></strong>
																</span>
															</div>
														<%
																}															
															}
														}
														else{
														  if(!(statName.equalsIgnoreCase("Pending"))){
														%>
															<div class="row">
																<span class="label">Renewal Status :</span>
																<span class="label">														
																<strong>&nbsp;<a href="./MembershipReg.html?process=renew">Renew Now!</a></strong>
																</span>
															</div>
														<%
															}
															}
														}
														}
														}
														%>
													<div class="row">
														<span class="label">Expiration Date:</span>
														<%
															if(membTypName.equalsIgnoreCase("Life Member")){
																ExpDte = "No Expiry Date For Life Members";
															}
														if(ExpDte==null || ExpDte.equalsIgnoreCase("null") || ExpDte.trim().length()==0)  ExpDte = "N/A";	
														if(ExpDte!=null){
															String[] eDte = ExpDte.split("-");
														%>
														<span class="label">
															<%=eDte[1]%>-<%=eDte[2]%>-<%=eDte[0]%>
															</span>
														<%
														}
														%>
												  </div>													
													<%
													}
													}
													else{
													%>
													 <div class="colspan">
																Member Information :
								  </div>				
														<%
														if(objMember.getMembershipTypeName()!=null && objMember.getMembershipTypeName().trim().length()!=0){
															mtyp=objMember.getMembershipTypeName();
														}
														else{
															mtyp="N/A";
														}
														%>
															<div class="row">
																<span class="label">Membership Type:</span>
																<span class="label"><%=mtyp%></span>
															</div>
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
															 
															<div class="row">
																<span class="label">Membership Status :</span>
																<span class="label">
																	   <span class="styleBoldOne"><%=status%></span>
																</span>
															</div>
														<%
														java.util.Calendar toDay = java.util.Calendar.getInstance();
														int newyear = toDay.get(Calendar.YEAR);
														int new_month = toDay.get(Calendar.MONTH);
														System.out.print("expDate														"+expDate);
														if(expDate!=null){
														if(status!=null){
														if(status.equalsIgnoreCase("Active")){
															String[] tmpDte = expDate.split("-");
															if(Integer.parseInt(tmpDte[0])<=newyear){
																if(new_month>=9 && new_month<11){
														%>
															<div class="row">
																<span class="label">Membership Status :</span>
																<span class="label">														
																	<strong>Not Renewed!&nbsp;&nbsp;&nbsp;<a href="./MembershipReg.html?process=renew">Renew Now!</a></strong>
																</span>
															</div>
														<%
																}															
															}
														}
														else{
														  if(!(status.equalsIgnoreCase("Pending"))){
														%>
															<div class="row">
																<span class="label">Renewal Status :</span>
																<span class="label">														
																<strong>&nbsp;<a href="./MembershipReg.html?process=renew">Renew Now!</a></strong>
																</span>
															</div>
														<%
															}
															}
														}
														}
														//}
														//new_month
														%>	
																</span>
						  </div>
													<%
															if(!mtyp.equalsIgnoreCase("Life Member"))
															{%>
															<div class="row">
																<span class="label">Expiration Date:</span>		
															<span class="label">
			 												<%
															if(expDate!=null){
															String[] eDte = expDate.split("-");
															%>
															<%=eDte[1]%>-<%=eDte[2]%>-<%=eDte[0]%>
															<%
															}
															%>
															</span>	
															</div>													
														<%}
														else{
														%>	<div class="row">
															<span class="label">Expiration Date:</span>
															<span class="label">No Expiry Date For Life Members</span>
															</div>
														<%
														}%>
															
													<%
													}
													%>
													<!--<div class="row">
																<span class="label">Membership Type:</span>
																<span class="label">
																			   < %=mtyp%>
																		
																</span>
													</div>-->
													
													<%
															/*	String tmpMemId="";
																tmpMemId=objMember.getMemberId(); 
																
																String status="";
																
																if(objMember.getStatusName()!=null)
																{
																status=objMember.getStatusName();
																}
																else
																{
																status="N/A";
																}/*
															 %>
															 
															<div class="row">
																<span class="label">Membership Status :</span>
																<span class="label">
																	   <span class="styleBoldOne">< %=status%></span>																		
																</span>
															</div>	

													
													<%*/
													
													if(!mtyp.equalsIgnoreCase("Life Member"))
	  												{%>
	 
<!--													<div class="row">
														<span class="label">Expiration Date:</span>		
													<span class="label">
														< %=dateFormat(expDate)%>																		
												    </span>-->
															
													<%}%>
													
													
													<div class="colspan">
															<strong>Personal / Contact Details:</strong>
													</div>													
													<div class="row">
														<span class="label">Join Date:</span>		
													<span class="label">
														<%=dateFormat(joinDate) %>																		
												    </span>		
													
													</div>
													
													<div class="row">
														<span class="label">Date of Birth:</span>		
													<span class="label">
														<%=dateFormat(dob)%>																		
												    </span>		
													
													</div>
													
													<div class="row">
														<span class="label">Gender:</span>		
													<span class="label">
														<%=gendar%>																		
												    </span>	
													</div>	
													<div class="row">
														<span class="label">Area:</span>		
													<span class="label">
														<%=areaName%>																		
												    </span>	
													</div>
													<div class="row">
														<span class="label">Email:</span>		
													<span class="label">
														<strong><A HREF="mailto:<%=emailId%>"><%=emailId%></A></strong>
												    </span>	
													</div>													
													
													<%
														if(!mtyp.equalsIgnoreCase("Family Member"))
																	{
													%>
													
													<div class="colspan">
															<strong>Mailing Preferences:</strong>
													</div>	
																<div class="row">
																<span class="labelFull"><input type="checkbox" name="mailOptQuesti" id="mailOptQuesti" value="" onclick="unhideMailOpts('hideMail','mailOptQuesti');"/></span>
																		Do not send any publications.
																
																</div>										
													<%
																		int chkInd=0;
																		String chk_id="";
																																				
																		ArrayList DispPublication= (ArrayList)request.getAttribute("DispPubDetails");
																		//out.print("DispPublication" + DispPublication);
																		if(DispPublication.size()!=0 && DispPublication!=null)
																		{%>
																		
																		<div class="row" id="hideMail">	
																		
																		<%
																		Iterator itr = DispPublication.iterator();
																		
																		while(itr.hasNext()){
																		HLCPublicationVO donObj = (HLCPublicationVO) itr.next();
																		String publicationId = donObj.getPublicationId();
																		String publicationName = donObj.getPublicationName();
																		chk_id="mailOpt1"+chkInd;
																		
																		String chk_st="";
																		String mailPreference1 = "";
																		if(memPreference !=null && memPreference.size()!=0){
																																		
																		Iterator it = memPreference.iterator();
																		while(it.hasNext()){
																		mailPreference1 = (String)it.next();
																		System.out.print("memPreference.size() :"+memPreference.size());	
																		System.out.print("publicationName :"+publicationName);
																		System.out.print("mailPreference1 :"+mailPreference1);
																																				
																		if(publicationName.equalsIgnoreCase(mailPreference1))
																		{
																      		chk_st = "checked";
																		}
																		}}
																		%>

																<div class="row">

																	<%
																	if(!mtyp.trim().equalsIgnoreCase("Subscribing Member")){
																	%>
																	<span class="labelFull">
																		<input type="checkbox" name="mailOpt1" <%=chk_st%> id="<%=chk_id%>" value="<%=publicationId%>" />
																		<%=publicationName%>.
																	</span>
																	<%
																	}
																	else{
																	if(publicationName.trim().equalsIgnoreCase("Send Me Eventing USA magazines")){
																	%>
																	<span class="labelFull">
																		<input type="checkbox" name="mailOpt1" <%=chk_st%> id="<%=chk_id%>" value="<%=publicationId%>" />
																		<%=publicationName%>.
																	</span>
																<% }
																} %>
																</div>
																<%chkInd++;}%>
																	</div>
																	
																	<input type="hidden" value="<%=DispPublication.size()%>" name="pub_ct" />
																	
																<%}}%>
													
													<div class="colspan">
															<strong>Current Full / Life Member Info:</strong>
													</div>		
															<div class="row">
																<span class="label">Parent Member ID :</span>
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
											<span class="formX"><%=parentId%></span>
												 
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
															 <div class="row">
																<span class="label">Number Of Family members :</span>
																<span class="formX">
																<%=addon%>
																&nbsp; 
																</span>
								  </div>
															 
															  <% 
															  String[] familyAddOnId1 = new String[2];
															  String famMid="";
															  String famUid="";
															  
													if(familyAddOnId !=null && familyAddOnId.size()!=0){
															Iterator it = familyAddOnId.iterator();
															while(it.hasNext()){
																familyAddOnId1 = (String[])it.next();
																famMid=familyAddOnId1[0];
																famUid=familyAddOnId1[1];
																
																System.out.print("famMid :"+famMid);
																System.out.print("famUid :"+famUid);
																																
													 %>
									<div class="row">
									<span class="label">Family members ID :</span>
									
									<span class="label"><a href="MembershipReg.html?process=familyView&familyAddOnId1=<%=famMid%>&userId=<%=famUid%>" target="_blank"><%=famMid%> </a>					
									</span>	
									
									
									</div>
													<% } }%>
															
															  	<table width="100%" cellpadding="0" cellspacing="1" border="0">
																
																	
												          <%
															 ArrayList nonhlc=new ArrayList();
															 ArrayList donSelect=new ArrayList();
																	 
															nonhlc=(ArrayList)request.getAttribute("nonhlc");

															donSelect=(ArrayList)request.getAttribute("donSelect1");
															HLCNonUseaOrgVO onjNonUsea = new HLCNonUseaOrgVO();
															
															%>	  
																  <div class="row" style="height:185px;">
																  
																  <div class="rowHead">
																		Non-HLC Membership Information 
																	</div>
																  
<%
																	 if(areUAMemberVect!=null)
																	 {
																			 int nonhlcct=areUAMemberVect.size();
																			 int i=0; 
																			 Enumeration itr= (Enumeration)areUAMemberVect.elements();
																			 while(itr.hasMoreElements()){
																	 
																			String cbxName="orgNameCbx"+i;
																			String tbName="orgNameTxt"+i;
																			String tbNameid="orgNameTxtId"+i;
																			System.out.print("tbNameid :"+tbNameid);
																			System.out.print("tbName :"+tbName);
																			System.out.print("cbxName :"+cbxName);
																			
																			String[] strarray = (String[]) itr.nextElement();
																			String memTypeId = strarray[0];
																			String memName = strarray[1];
																													  
																			String cncatin=memTypeId+"#"+memName;
																			i++;
																			
																			String hlcSel="";
																			String hlcSelId="";
																			
																			if(nonhlc!=null)
																			{
																			for(int t=0;t<nonhlc.size();t++)
																			{		
																				onjNonUsea=(HLCNonUseaOrgVO)nonhlc.get(t);
																				System.out.println("onjNonUsea.getNonuseaOrgName() :"+onjNonUsea.getNonuseaOrgName());
																				String orgNam="";
																				orgNam=onjNonUsea.getNonuseaOrgName();
																				
																				if(memName.equalsIgnoreCase(orgNam))
																				{
																					hlcSel="checked";
																					hlcSelId=onjNonUsea.getNonuseaMemberId();
																				}
																			}
																			}
																		 %> 
																	<div class="row">	  
																	<span class="formXThree" id="newLabel">
																	<input type="checkbox" name="<%=cbxName%>" <%=hlcSel%> id="<%=cbxName%>" value="<%=cncatin%>" onclick="txtBxDisabEnab('<%=tbNameid%>');"/> <%=memName%> 
																	</span>
																	 <span>&nbsp;<input name="<%=tbName%>" class="textboxOne" id="<%=tbNameid%>" <% if(hlcSelId!=null && hlcSelId.trim().length()!=0){%>value="<%=hlcSelId%>"<%}else{%>value="Member Id" disabled="disabled"<%}%> size="15" maxlength="20"  />
																	 </span> <br /><br />
																    </div>
																	<%}%>
																	<input type="hidden" name="orgCbxCt" value="<%=nonhlcct%>" />
																	<%}%>																  </div>
																
																  
																	<tr>
																		<td colspan="2" class="tblRowHead">Donation Information </td>
																		
																  </tr>		
																			<%
																			try{
																				if(donSelect!=null)
																				{
																					System.out.println("donSelect.size() :"+donSelect.size());
																					
																					HLCDonationDetailVO onjDon = new HLCDonationDetailVO();
																					
																					if(donSelect.size() == 0)
																					{%>
																					
																					<tr>
																						<td class="tableSpan" colspan="2"><span class="styleBoldOne">No donation details available for this member!!</span></td>
																					   
																					</tr>
																					
																					<%}
																					int itr =donSelect.size();
																					if(itr>=2){
																						itr =  2;
																					}
																					else if (itr==1){
																						itr = 1;
																					}
																					else{
																						itr=0;
																					}
																					
																					for(int u=0;u<itr;u++)
																					{		
																						onjDon=(HLCDonationDetailVO)donSelect.get(u);	
																						String[] tmp=onjDon.getMemberDonationDate().split(" ");
																				%>	
																				
																  <tr>
																	<td class="tableLeft"><strong>Donated On:</strong> </td>
																	<th class="tableRight"><%=dateFormat(tmp[0])%>&nbsp;</th>
																  </tr>		
																				
																  <tr>
																	<td class="tableLeft"><strong>Donation Type:</strong> </td>
																	<th class="tableRight"><%=onjDon.getDonationName()%></th>
																  </tr>				
																				
																 
																 <tr>
																	<td class="tableLeft"><strong>Donation Amount ($):</strong></td>
																	<th class="tableRight"><span class="styleBoldOne"><%=onjDon.getDonationPrice()%>&nbsp;</span></th>
																  </tr>
																 
																 <%
																 String donBy="N/A";
																 
																 if(onjDon.getDonatedBy()!=null)
																 {
																 	donBy=onjDon.getDonatedBy();
																 }
																 
																%>
																 
																 
																 <tr>
																	<td class="tableLeft"><span class="label"><strong>In Name Of:</strong></span></td>
																	<th class="tableRight"><%=donBy%>&nbsp;</span></th>
																  </tr>
																  
																 <%}
											if(donSelect.size()>0){ %>
											<tr>
											 <td height="20">
												<a href="./MembershipReg.html?process=listDonation">Click To View all Donations</a>
											 </td>
											</tr>
											<%}
											}else
																  {%>
																  
																  <tr>
																	<td class="tableSpan" colspan="2"><span class="styleBoldOne">No Donation Details Available for this Member!!</span></td>
																	
																  </tr>
																  
																  <%}}
																  catch(Exception e){
																  System.out.print("Error in the donation "+e);
																  }
																  
																  %>
																 
																 <%
																 	if(!(mtyp.equalsIgnoreCase("Subscribing Member") || mtyp.equalsIgnoreCase("Non-Competing Member")))
																	{
																		
																 
																 %>
																 <tr>
																		<td colspan="2" class="tblRowHead">Amateur Rider Information </td>
																  </tr>		
																 <%
																	String AmateurName="";
																	String AmateurDec1="";
																	String AmateurDec2="";
																	
                                                                    boolean isAmateurDec2;
                                                                    boolean isAmateurDec1;  
																	
																	if(objMember.getAmateurName()!=null && objMember.getAmateurName().trim().length()!=0)
																	{
																		AmateurName = objMember.getAmateurName();
																	
																	}
																	else  
																	{
																	 
																		AmateurName="";
																	}
																	 isAmateurDec1=objMember.isAmateurDec1();
                                                                                                                                        
																if(isAmateurDec1 == true)
																{
																	AmateurDec1="checked";
																}
																else
																{
																	 AmateurDec1="No";   
																}
																
																
																
															   isAmateurDec2=objMember.isAmateurDec2();
																
																if(isAmateurDec2 == true)
																{
																	AmateurDec2="checked";
																}
																else
																{
																	 AmateurDec2="No";   
																}
															 
															 System.out.println("AmateurName :"+AmateurName); 
															 System.out.println("AmateurDec1 :"+isAmateurDec1);  
															 System.out.println("AmateurDec2 :"+isAmateurDec1);  
																
                                                                                                                                        
																 %>
																 
																 <tr>
																	<td class="tableLeft">Name: </td>
																	<th class="tableRight"><input type="text" name="amatName" id="amatName" value="<%=AmateurName%>" /></th>
																  </tr>																 
                                                                                                                                  					<tr>
																	<td class="" colspan="2"><input type="checkbox" name="posAmat" id="posAmat" <%=AmateurDec1%> />&nbsp; I am in the possession of a current USEF Amateur Card.</td>
																	</tr>                                                                                                                                  
                                                                <tr>
																	<td class="" colspan="2"><input type="checkbox" name="decAmat" id="decAmat" <%=AmateurDec2%> />&nbsp; I am declaring my Amateur Status Eligibility with only.</td>
																	
																  </tr>	
																  <%}%>
																  
																    <tr>
																	<td colspan="2" class="tblRowHead">Medical Arm Band Information: </td>
																	</tr>
																	<%
																	DecimalFormat myFormatter = new DecimalFormat("#####.00");
																	String armQty = "";
																	double amt =0.0;
																	double totAmt = 0.0;
																	 String output = "";
																	if(objMember.getArmbandQty()!=null){
																	  armQty = objMember.getArmbandQty();
																	  amt = Double.parseDouble(armQty);
																	  totAmt = amt * 5;
																	  output  = myFormatter.format(totAmt);
																	  if(output.equals(".00") || output.equals("0")){
																	    output ="N/A";
																	  }
																	   if(armQty.equals("0")){
																	     armQty ="N/A";
																	   }
																	  System.out.print("output" + output);

																	  
																	}
																	else{
																	 armQty ="N/A";
																	}
																  %>
																	
																  <tr>
																	<td class="tableLeft"> Armband Quantity</td>
																	<th class="tableRight"><%=armQty%></th>
																  </tr>	
																   <tr>
																	<td class="tableLeft">Armband Amount</td>
																	<th class="tableRight"><%=output%></th>
																  </tr>	
																 
																  <tr>
																	<td colspan="2" class="tblRowHead">Payment Information: </td>
																  </tr>
																 
																 <%
																 HLCPaymentDetails objPayment = new HLCPaymentDetails();
																 
																 objPayment=(HLCPaymentDetails)request.getAttribute("objPayment");
																 System.out.println("objPayment jsp :"+objPayment.toString());
																 
																 if(objPayment != null)
																 {
																 
																if(objPayment.getPaymentStatus()!=null)
																{
																if(objPayment.getPaymentStatus().equalsIgnoreCase("card"))
																{
																%>
																
																  <tr>
																	<td class="tableLeft">Payment Mode: </td>
																	<th class="tableRight"><%=objPayment.getPaymentStatus()%></th>
																  </tr>	
	<%
	
	String ccType="N/A";
	
	if(objPayment.getCcType()!=null){                                                                                                                                    ccType=objPayment.getCcType();
	}
	String namCard="N/A";
	
	if(objPayment.getCcName()!=null)
	{                                                                                                                                      namCard=objPayment.getCcName();
	}                                                                                                                    
	String cardNo="N/A";
	
	if(objPayment.getCcNumber()!=null)
	{	                                                                                                                            cardNo=objPayment.getCcNumber();
	
	} 
	String txId="N/A";
	
	if(objPayment.getSslTxnId()!=null)
	{	
	txId=objPayment.getSslTxnId();
	}
	
	%>
  																  <tr>
																	<td class="tableLeft">Card Type: </td>
																	<th class="tableRight"><%=ccType%></th>
																  </tr>	
																  
																  <tr>
																	<td class="tableLeft">Name on Card: </td>
																	<th class="tableRight"><%=namCard%></th>
																  </tr>	
																  
																  <%--<tr>
																	<td class="tableLeft">Card No: </td>
																	<th class="tableRight"><%=cardNo%></th>
																  </tr>	--%>
																  
                                                                                                                                   <tr>
																	<td class="tableLeft">Transaction Id : </td>
																	<th class="tableRight"><%=txId%></th>
																   </tr>	
                                                                                                                                  
																  <tr>
																	<td class="tableLeft">Payment Date: </td>
																	<th class="tableRight"><%=sd1.format(objPayment.getPaymentDate())%></th>
																  </tr>	
																  
																  <tr>
																	<td class="tableLeft">Amount: </td>
																	<th class="tableRight"><%=objPayment.getAmount()%></th>
																  </tr>
																  
																  <tr>
																	<td class="tableLeft">Payment Status: </td>
																	<th class="tableRight"><%=objPayment.getSslResultMessage()%></th>
																  </tr>
																  
																  <%
                                                                                                                                  if(objPayment.getSslResult()!=null && objPayment.getSslResult().trim().length()!=0 )
                                                                                                                                      {
                                                                                                                                if(objPayment.getSslResult().equalsIgnoreCase("1"))
                                                                                                                                    {
                                                                                                                                        session.setAttribute("amt",String.valueOf(objPayment.getAmount()));
                                                                                                                                        
                                                                                                                                        %>
      <tr>
                                                                                                                                            <td class="tableLeft"><span class="styleBoldOne">Payment Declined for You </span> </td>
                                                                                                                                            <th class="tableRight"><span class="styleBoldOne"><a href="./AdminMembPayment.html?process=disp&usr=user&pid=<%=objPayment.getPaymentId()%>">Retry Payment</a></span></th>
                                                                  </tr>
                                                                                                                                    
                                                                                                                                    <%}}															  
																 }else{%>
																 
																 <tr>
																	<td class="tableLeft">Payment Mode: </td>
																	<th class="tableRight"><%=objPayment.getPaymentStatus()%></th>
																  </tr>	
																 
																  <tr>
																	<td class="tableLeft">Check No: </td>
																	<th class="tableRight"><%=objPayment.getCheckNumber()%></th>
																  </tr>
																  
																  <tr>
																	<td class="tableLeft">Bank Name: </td>
																	<th class="tableRight"><%=objPayment.getBankName()%></th>
																  </tr>
																 
																 <tr>
																	<td class="tableLeft">Check Date: </td>
																	<th class="tableRight"><%=sd1.format(objPayment.getCheckDate())%></th>
																  </tr>
																 
																 <tr>
																	<td class="tableLeft">Payment Date: </td>
																	<th class="tableRight"><%=sd1.format(objPayment.getPaymentDate())%></th>
																  </tr>	
																  

																  <tr>
																	<td class="tableLeft">Amount: </td>
																	<th class="tableRight"><%=objPayment.getAmount()%></th>
																  </tr>
																 
																 <%
																 
																 try
																 {
													 
	    														 	String memId1=(String)session.getAttribute("memberId");
																	 session.setAttribute("status_membId",memId1);
																 
																 	String chkAmt=String.valueOf(objPayment.getCheckAmount());
																	System.out.println("objPayment.getCheckAmount() :"+chkAmt);
																	
																	String totAmt1=String.valueOf(objPayment.getAmount());
																	System.out.println("objPayment.getAmount() :"+totAmt1);
																	
																	double at=Double.parseDouble(totAmt1) ;
    																 double ct=Double.parseDouble(chkAmt) ;
																	
																	/*if(!chkAmt.equalsIgnoreCase("0.0"))
																	{
																	
																	if(objPayment.getCheckAmount()<objPayment.getAmount())
																	{                                                                                                                                       
																			 double at=Double.parseDouble(totAmt1) ;
																			 double ct=Double.parseDouble(chkAmt) ;
																			 
																			 System.out.println("totAmt1 :"+at);
																			 System.out.println("chkAmt :"+ct);
																			 
																			 double finalamt=at-ct;
																			 System.out.println("finalamt :"+finalamt);
																			
																			session.setAttribute("amt",String.valueOf(finalamt));*/
                                                                                                                                                        
                                                                                                                                                        float pendAmt = objPayment.getPendingAmount();
                                                                                                                                                        
                                                                                                                                                        System.out.println("Pending Amt in JSP :"+pendAmt);
                                                                                                                                                        if(objPayment.getPendingAmount()>0)
                                                                                                                                                                {
                                                                                                                                                              session.setAttribute("amt",String.valueOf(pendAmt));
                                                                                                                                                        
																	%>
																	
                                                                                                                                 <tr>
																	<td colspan="2" class="tblRowHead">Pending Payment Information: </td>
																 </tr>
                                                                                                                                       
    															         <tr>
																	<td class="tableLeft">Check Amount Recieved: </td>
																	<th class="tableRight"><%=ct%></th>
																  </tr>
																	
																  <tr>
																	<td class="tableLeft">Amount in Due : </td>
																	<th class="tableRight"><%=pendAmt%> &nbsp;<span class="styleBoldOne"><a href="./AdminMembPayment.html?process=disp&usr=user&defStat=yes&pid=<%=objPayment.getPaymentId()%>">Complete Payment</a></span></th>
																  </tr>
																  																																	
																	<%}}
																	catch(Exception e)
																	{
																		System.out.println(" error in jsp :"+e);
																	}
																	%>
																	
																
																 
																 <%}}else{%>
																 
																 <tr>
																	<td class="tableSpan" colspan="2"><span class="styleBoldOne">No Payment Details Available for this Member !</span></td>        
																  </tr>
																  

																<%}}else{%>
																 
																 <tr>
																	<td class="tableSpan" colspan="2"><span class="styleBoldOne">No Payment Details Available for this Member !</span></td>        
																  </tr>                                                                                                                                   <%}%>
																</table>
						  													
                                                                                                                
                                                                                                                                <input type="hidden" name="process" value="editMemb" />
<input type="hidden" name="memTyp" value="<%=mtyp%>" />																																
                                                      
											<div class="alignCenter">
<input type="button" value=" Back " class="gradBtn" onclick="location.href='index.jsp'" />
                                                                                                                                <input class="gradBtn" type="submit" value="Update" name="update"/>
										</div>	
											
                                                                                          	
							 
							<input type="hidden" value="<%=objMember.getMemberId()%>" name="memberId"/>
						</form>
					</div>
					<!-- CONTENTS END HERE -->		
			</td>
		  </tr>

	  </table>
	
	</td>
  </tr>
  <tr>
    <td class="footerBg">
		
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
	</td>
  </tr>
</table>
</body>
</html>

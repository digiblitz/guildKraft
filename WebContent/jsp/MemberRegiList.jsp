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
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.hlcmember.type.util.*"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script language="javascript">
function editBtn1(Id,fnme,lnme,mid){
	strURL = "./MemberRegiList.html?memRegiListProcess=adminTransDet&Id="+Id+"&fnme="+fnme+"&lnme="+lnme+"&mid="+mid;
	window.location.href = strURL;	
}
function assignBtn(uId){
	strURL = "./roles.html?roleProcess=initUserRole&userId="+uId;
	window.location.href = strURL;
}
function approveBtn1(usrtypname,memberId,uId){
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListView&usrtypname="+usrtypname+"&memberId="+memberId+"&userId="+uId;
	window.location.href = strURL;	
}
function approveBtn(usrtypname,memid){
	strURL = "./MemberRegiList.html?memRegiListProcess=horseDet&usrtypname="+usrtypname+"&memid="+memid;
	window.location.href = strURL;
}
function postData(memTypId) {
	if(memTypId!="") {
		strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListSubUserType&memTypId="+memTypId;
		window.location.href = strURL;	
	}
}


function postDataForPagination() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat = document.frmmemRegiList.statusId.value;
	var pn = document.frmmemRegiList.pn.value;
	var year = document.frmmemRegiList.year.value;

	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId+"&memTypId="+memTypId+"&usrtyp=Human&status="+stat+"&pn="+pn+"&year="+year;
	window.location.href = strURL;
}

function postDataForPagination1() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat = document.frmmemRegiList.statusId.value;
	var pnVal = document.frmmemRegiList.pn1.value;
	document.frmmemRegiList.pn1.value = document.frmmemRegiList.pn.value;
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId + "&memTypId="+memTypId + "&usrtyp=Human&status="+stat+"&pn="+pnVal;
	window.location.href = strURL;	
}	
function getMemberTypes(){
 	var year =  document.frmmemRegiList.year.value;
	strURL ="./MemberRegiList.html?memRegiListProcess=getMemberTypes&year="+year;
	window.location.href = strURL;
}

function showData() {
	var memTypId = document.frmmemRegiList.userType_sel.value;
	var utyp=document.frmmemRegiList.usrtyp.value;
    var dispId=document.frmmemRegiList.memType_Sel.value;
	var stat1 = document.frmmemRegiList.statusId.value;
	var year =  document.frmmemRegiList.year.value;
	
	strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListMemberType&dispId="+dispId+"&memTypId="+memTypId+"&usrtyp=Human&status="+stat1+"&year="+year;
	window.location.href = strURL;
}	


function showApprove(memberId) {
alert(memberId);
	if(memberId!="") {
			//alert(memTypId);
		strURL = "./MemberRegiList.html?memRegiListProcess=memRegiListView&memProcess="+memberId+"&memberId="+memberId;
		window.location.href = strURL;
	}
}

function getMemTyp(){
		/*var selObj = document.getElementById('userType_sel');
		var selIndex = selObj.selectedIndex;
		var selTxt = selObj.options[selIndex].text;*/
	var selTxt = document.getElementById('userType_sel');		
	var memObj = document.getElementById('memType_Sel');
	var memIndex = memObj.selectedIndex;
	var memtxt = memObj.options[memIndex].text;
		if(document.getElementById('memType_Sel').value=="" && document.getElementById('statusId').value==""){
			alert('Select Membership Type and Status first');
			document.getElementById('memType_Sel').options.selectedIndex=0;
			document.getElementById('memType_Sel').focus();
			return false;
		}
		else{
		if(document.getElementById('vectorSize').value!=0){
			if(document.getElementById('memType_Sel').selectedIndex==0)
			{
				alert('Select Membership Type first');
				document.getElementById('memType_Sel').options.selectedIndex=0;
				document.getElementById('memType_Sel').focus();
				return false;
			}
		}else{
				alert('No Membership Type is available for the Selected Year');
				document.getElementById('year').options.selectedIndex=0;
				document.getElementById('year').focus();
				return false;
		}
		
		if(document.getElementById('statusId').selectedIndex==0)
		{
			alert('Select Status Type first');
			document.getElementById('statusId').options.selectedIndex=0;
			document.getElementById('statusId').focus();
			return false;
		}
		
		//alert(document.frmmemRegiList.usrtyp.value);

		/*var selVal = selObj.options[selIndex].value;
		if (selTxt == "Junior Member" ){
			if(dobCnt > 18){
				alert("Sorry the age you have specified doesn't  match as required for a Junior Member");
				document.getElementById('memTyp_sel').value = 0;
			}
		}*/
		}
		
		showData();
		
	}

</script>
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>
<%
//Henu..
SimpleDateFormat sdf = new SimpleDateFormat("MM-dd-yyyy");
String memdispTypId =(String)request.getAttribute("memdispTypId");
String  memTypId = (String)request.getAttribute("memTypId");
if(memTypId==null || memTypId.equals("")){
memTypId="";
}
if(memdispTypId==null || memdispTypId.equals("")){
memdispTypId="";
}
%>

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
			
						<%!	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
							SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
							
							String dateFormat(String fieldName){					
								java.util.Date clDate = null;
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

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership:Membership Registration Listing </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>The Human Members registered are listed as follows.</p>
							
						<!--==============================Form Description=================================-->
							
                            
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmmemRegiList" id="frmmemRegiList">
							
                               <input name="memProcess" id="memProcess" type="hidden" value=""/>
								  <!-- henu -->
								  <input type="hidden" name="memRegiListProcess"/>
								  <input type="hidden" name="usrtyp" />

                                <div class='form-group'>
								
												<div class='col-md-12'>
												
												<label class='control-label col-md-1' for='id_title'>Year:</label>
												<div class='col-md-2'>
                                                	<select name="year" id="year" class="form-control" onchange="getMemberTypes();">
                                              			<% 
								  
													  String yearStr = (String) request.getAttribute("year");
													  //System.out.println(yearStr);
														   Calendar cal = Calendar.getInstance();
														   for (int i= 2007;i<=(cal.get(Calendar.YEAR)+1);i++){
														   if(yearStr != null && yearStr.equalsIgnoreCase(new Integer(i).toString())){
														   %>
																  <option selected="selected" value="<%=i%>"><%=i%></option>
																  <%}else{%>
																  <option value="<%=i%>"><%=i%></option>
																  <%}
										   						}%>
													</select>
													
                                            </div>
											
											<label class='control-label col-md-2' for='id_title'>Membership Type:</label>
											<div class='col-md-2'>
														<select name="memType_Sel" id="memType_Sel" class="form-control" >
														  <option selected="selected">Select One</option>
														  <% 
																		//Henu..
																String str2[] = null;
																Vector memberTypeVect1=new Vector();
																memberTypeVect1=(Vector)session.getAttribute("userTypeVect1");
																					   //System.out.println("inside subtype ............. Size : " + memberTypeVect1.size());
															//	System.out.println("vector1:"+memberTypeVect1);
															  if(memberTypeVect1!=null && memberTypeVect1.size()!=0){  
																Enumeration enm1=memberTypeVect1.elements();
																  
																  while(enm1.hasMoreElements()){
																		String[] s1 = (String[])enm1.nextElement();
																		/*for (int j=0;j<s1.length; j++) {
																			System.out.println("Content : "+s1[j]);
																		}*/
																		String memberTypeId = s1[0];
																		String membershipName = s1[1];
																		
																	if(memberTypeId.equals(memdispTypId)){
																	
																	%>
																					  <option value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
																					  <%}
																	else{
																	%>
																					  <option value="<%=memberTypeId%>"><%=membershipName%></option>
																					  <%		
																	}
																	}
															}%>
														</select>
											</div>
											
											<label class='control-label col-md-1' for='id_title'>Status:</label>
											<div class='col-md-2'>
												      			<select name="statusId" id="statusId" class="form-control">
                                            					<option selected="selected">Select One</option>
																	<%
																				String selStat=(String)request.getAttribute("status");
																				String[] stat={"Pending","Active","Expired","Suspended","Inactive","Duplicate","Deceased","Merged"};
																				
																				for(int i=0;i<8;i++)
																				{
																				if(selStat!=null)
																				{
																				if(selStat.equalsIgnoreCase(stat[i]))
																				{
																				%>
																								<option value="<%=stat[i]%>" selected="selected"><%=stat[i]%></option>
																								<%}
																				else
																				{%>
																								<option value="<%=stat[i]%>"><%=stat[i]%></option>
																								<%}}
																				else
																				{%>
																								<option value="<%=stat[i]%>"><%=stat[i]%></option>
																								<%}}
																			
																			%>
											</select>
											</div>
											<input type="hidden" name="vectorSize"  id="vectorSize" value="<%=memberTypeVect1.size()%>"/>
										</div>
										<div class="col-md-8">
											<div class="col-md-6">
											&nbsp;
											</div>
											<div class="col-md-offset-1 col-md-2 gp">
											 <button class='btn-lg btn-primary' style='' type="button" value="List " onclick ="getMemTyp();">List</button>
											 </div>
										</div>
										</div>
										
														<% 
																		//Henu..
																
																String uId="";
																String memberId="";
																String usrtypname=(String)request.getAttribute("usrtypname");
																String umemberTypeId="";
																
																String str1[] = null;
																Vector memberTypeVect=new Vector();
																memberTypeVect=(Vector)session.getAttribute("userTypeVect");
																if(memberTypeVect!=null && memberTypeVect.size()!=0){                    
																
																
																
																Enumeration enm=memberTypeVect.elements();
																  
																  while(enm.hasMoreElements()){
																		String[] s = (String[])enm.nextElement();
																		
																		if(!s[1].equalsIgnoreCase("Human")){
										/*								for (int i=0;i<s.length; i++) {
																			System.out.println("Content : "+s[i]);
																		}
										*/								 umemberTypeId= s[0];
																		String umembershipName = s[1];
																		if(umemberTypeId.equals(memTypId)){
																	%>
																				<%}
																	else{
																	%>
																				<%		
																	}
																	}
																	}}%>
																			
											<input type="hidden" name="userType_sel" value="<%=umemberTypeId%>" />
											 	
											<%
													int start = 1;
													int end = 1;
													int totalPage = 0;
													String rowCnt = (String)request.getAttribute("rCnt");
													String pageNo = (String) request.getAttribute("pNo");
						
													int rCnt = 0;
													int pNo = 0;
													if(rowCnt==null){
														rCnt = 0;
													}
													else{
														rCnt = Integer.parseInt(rowCnt);
														end = (rCnt/25);
														totalPage = (rCnt%25);
														if(totalPage>0){
															end = end  +1;
														}
													}
						
													if(pageNo==null){
														pNo = 1;
													}
													else{
														pNo = Integer.parseInt(pageNo);
													}
													if(rCnt!=0){
											%>
																	
								
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="pn" id="pn" class="selectboxOne" onchange="getMemTyp();postDataForPagination();">
													<%
														for(int i = 1; i <=end; i++) { 
															if(pNo==i){
															%>
																<option selected="selected" value="<%=i%>"><%=i%></option>
																<%
															}
															else{
															%>
																<option value="<%=i%>"><%=i%></option>
																<%
															}
														}
														%>
												  </select>	
												  of <%=end%> 
												 </div>
											</div>
										</div>
												
												<%
						   }
					if(usrtypname!=null){

						if(usrtypname.equalsIgnoreCase("Horse"))
						{


						%>
						
						<div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-2">
									<label class='control-label label1'>Horse Member ID</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Competition Name</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Rider Member Id</label>
								</div>
								<div class="col-md-2">
								  <label class='control-label label1'>Date of Membership</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Status</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Detail</label>
								</div>
							
							</div>
						</div>
						
						 <%
							
							ArrayList horsedet=new ArrayList();
							horsedet=(ArrayList)request.getAttribute("horsedet");
							System.out.println(sdf.format(new java.util.Date()));
							if(horsedet!=null && horsedet.size()!=0)
							{
							for(int i=0;i<horsedet.size();i++)
							{
								HLCHorseListVO objHorseListVO = new HLCHorseListVO();
								objHorseListVO=(HLCHorseListVO)horsedet.get(i);
							%>
							
							
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2">
									<label class='control-label'><%=objHorseListVO.getHorseMemberId()%></label>
								</div>
								<div class="col-md-2">
									<label class='control-label'><%=objHorseListVO.getCompetitionName()%></label>
								</div>
								<div class="col-md-2">
								<label class='control-label'><%=objHorseListVO.getRiderMemberId()%></label>
								</div>
								<div class="col-md-2">
									<label class='control-label'><%=sdf.format(objHorseListVO.getAddDate())%></label>
								
								</div>
								<div class="col-md-2">
									<label class='control-label'><%=objHorseListVO.getStatusName()%></label>
								</div>
								<div class="col-md-2">
								 <button class='btn-lg btn-primary' style='' onClick="approveBtn('<%=usrtypname%>','<%=objHorseListVO.getHorseMemberId()%>');"  value="Approve">Approve</button>
								</div>
							
							</div>
						</div>
						
					 <%}}}
					 else
						{%>
						
						<div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-2">
									<label class='control-label label1'>Member ID</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>First Name</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Last Name</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Date of Membership</label>
								</div>
								<div class="col-md-1">
									<label class='control-label label1'>Approve</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Transaction Details</label>
								</div>
							
							</div>
						</div>
						
						
								 <%

						//Henu..
											String str3[] = null;
											Vector memberTypeVect2=new Vector();
											memberTypeVect2=(Vector)session.getAttribute("userTypeVect2");
										   //                         System.out.println("Vector1 ............. Size : " + memberTypeVect1.size());
										//	System.out.println("vector1:"+memberTypeVect1);
										  if(memberTypeVect2!=null && memberTypeVect2.size()!=0){  
											Enumeration enm2=memberTypeVect2.elements();
											  while(enm2.hasMoreElements()){
					
												String[] s2 = (String[])enm2.nextElement();
												String[] memdate=s2[0].split(" ");
												//String membershipTypeId = s2[1];
												memberId = s2[1];
												String firstName = s2[2];
												String lastName = s2[3];
												String statusName = s2[4];
												uId = s2[5];
												String payId = s2[6];
												System.out.println("label....."+payId);
									%>
									
						<div class="form-group">
							<div class="col-md-12">
								<div class="col-md-2">
									<label class='control-label'><%=memberId%></label>
								</div>
								<div class="col-md-2">
									<label class='control-label'><%=firstName%></label>
								</div>
								<div class="col-md-2">
								<label class='control-label'><%=lastName%></label>
								</div>
								<div class="col-md-2">
									<label class='control-label'><%=dateFormat(memdate[0])%></label>
								
								</div>
								<div class="col-md-1">
								
									<button class='btn-sm btn-primary' style='' name="button" type='button' onClick="approveBtn1('<%=usrtypname%>','<%=memberId%>','<%=uId%>');"  value="Approve">Approve</button>
								</div>
								<div class="col-md-2 ">
								
								 &emsp;&emsp;<button class='btn-sm btn-primary' style='' name="button"  type='button' onClick="editBtn1('<%=payId%>','<%=firstName%>','<%=lastName%>','<%=memberId%>');"  value="Edit">Edit</button>
								</div>
							
							</div>
						</div>
						
						 <%}}}}else{%>
						 
						 	<div class="form-group">
							<div class="col-md-12 gp">
								<div class="col-md-2">
									<label class='control-label label1'>Member ID</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>First Name</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Last Name</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Date of Membership</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Approve</label>
								</div>
								<div class="col-md-2">
									<label class='control-label label1'>Transaction</label>
								</div>
							
							</div>
						</div>
						
										<%}%>
												<!--<tr>
							<td height="25" colspan="6"  bgcolor="#ffffff" class="alignRight">
								<strong>View Page(s): </strong> <span class="styleBoldOne">1 - 10</span>&nbsp;
							<a href="" class="linkThree">Prev</a> | <a href="" class="linkThree">Next</a>			</td>
						   </tr>-->
												<%
						   if(rCnt!=0){
											%>
						
						
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s):</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												
												 <select name="pn1" id="pn1" class="selectboxOne" onchange="getMemTyp();postDataForPagination1();">
													<%
													for(int i = 1; i <=end; i++) { 
														if(pNo==i){
														%>
															<option selected="selected" value="<%=i%>"><%=i%></option>
															<%
														}
														else{
														%>
															<option value="<%=i%>"><%=i%></option>
															<%
														}
													}
													%>
                                      </select>
									  	
										of <%=end%>
										
										</div>
									</div>
								</div>
								
								 <%}%>
									
													
										
									

                               
								
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

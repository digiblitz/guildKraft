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
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "java.text.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/validate.js" type="text/javascript" ></script>
<script language="javascript">
function assignBtn(uId, login){
	strURL = "roles.html?roleProcess=initUserRole&userId="+uId+"&login_name="+login;
	window.location.href = strURL;
}
</script>
<script>

function getUserTypeName(selMemTypeId){
	strURL = "./UserRegList.html?selMemTypeId="+selMemTypeId+"&memProcess=uList";
	window.location.href = strURL;
//alert(selMemTypeId);
}

function postDataForPagination1() {
	var pn = document.frmMemberList.pn.value;
	strURL = "./UserRegList.html?&memProcess=uList&pn="+pn;
	window.location.href = strURL;
}
function postDataForPagination() {
	var pn = document.frmMemberList.pn.value;
	strURL = "./UserRegList.html?&memProcess=uList&pn="+pn;
	window.location.href = strURL;

	//var selMemTypeId = document.frmmemRegiList.selMemTypeId.value;
}
</script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
</head>
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
			
			
				<%
				String  userTypeId = (String)request.getAttribute("userTypeId");
				if(userTypeId==null || userTypeId.equals("")){
					userTypeId="";
				}
				%>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership: Registered User Listing</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>All Registered Users are listed as follows. 
								To delete a user, click on the 'Delete' button beside it. To detele a record click on the 'Delete' button.</p>
							
						<!--==============================Form Description=================================-->
							
                           
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form'  name="frmMemberList" id="myform" method="post" action="./UserRegList.html">
							
                               <input name="memProcess" type="hidden" value="uList"/>
							   <!--
							   			<%
											Vector memberTypeVect=new Vector();
											memberTypeVect=(Vector)request.getAttribute("userTypeVect");
											Enumeration enm=memberTypeVect.elements();
										 %>
										 
										 
										 <%
											  while(enm.hasMoreElements()){
													String[] s = (String[])enm.nextElement();
													String memberTypeId = s[0];
													String membershipName = s[1];
													if(!membershipName.equalsIgnoreCase("Horse")){
														if(userTypeId.equalsIgnoreCase(memberTypeId)){
													%>
														 <option value="<%=memberTypeId%>" selected="selected"><%=membershipName%></option>
														 <%
														 }
														 else{
														 %>
														 <option value="<%=memberTypeId%>"><%=membershipName%></option>
														 <%
														 }
													}
												}
												%>-->
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
														end = (rCnt/50);
														totalPage = (rCnt%50);
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

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s): </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                                <select name="pn" id="pn" class="form-control" onchange="postDataForPagination();">
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
							  </div>	
								 
								 <%}%>
							  
					</form>
					
						<div class='form-group'>
							<div class='col-md-12 gp'>
								<div class="row">
							 		<div class='col-md-2'>
							 		<label class='control-label label1'>Username</label>
							 		</div>
									
							 		 <div class='col-md-2'>
									   <label class='control-label label1'>Email</label>
									  </div>
									  
									   <div class='col-md-3'>
										<label class='control-label label1'>Date Of Registration  </label>
									   </div>
							   
										<div class='col-md-2'>
										 <label class='control-label label1'>Request Status </label>
										</div>
										 
										<div class='col-md-2'>
											<label class='control-label label1'>Activate/Deactivate </label>
										</div>
								
										<div class='col-md-1'>
										 <label class='control-label label1'>Assign Role</label>
										</div>
									</div>
								 </div>
							</div>
						
								 <%
									//String str1[] = null;
										//Vector memberType=new Vector();
											String[] rdate=new String[5];
					
										 Vector memberType=(Vector)request.getAttribute("dispStr");
										//  System.out.println("vector2:"+memberType);
										 if(memberType!=null && memberType.size()!=0){
										  Enumeration enm1=memberType.elements();
					
										  while(enm1.hasMoreElements()){
												String[] s = (String[])enm1.nextElement();
												String ss[] = (String[])memberType.elementAt(0);
												String firstName = s[1];
												String lastName = s[3];
												String regDate = s[4];
												String emailId = s[5];
												String loginName = s[11];
												String userID = s[6];
												String userTypeId1 = s[7];
												String requestStatus=s[12];
												//For Debug Starts
												String activeStatus=s[13];
												//For Debug Ends
												//out.println("firstName-->"+firstName+" requestStatus==>"+requestStatus);
												requestStatus=requestStatus==null?"false":requestStatus;
												if(requestStatus.equalsIgnoreCase("true"))
													 requestStatus="TRUE";
												else
													requestStatus=requestStatus.toUpperCase();
												if (firstName == null) { firstName = "";}
												if (lastName == null) {lastName = ""; }
												if(regDate!=null)
												{
													rdate=regDate.split(" ");
												}
												else
												{
													rdate[0]="N/A";
												}
					
					//{prefix,firstName,middleName,lastName,registerDate,emailId,userID,UserTypeID,sufix,dob,gender};
							   %>
						
						<form name="frmDisplay" method="post" action="./UserRegList.html">
							<input name="memProcess" type="hidden" value="updateStatus"/>
				
				
							 <input name="userId" type="hidden" value="<%=userID%>"/>
							 <input name="emailId" type="hidden" value="<%=emailId%>"/>

						
							<div class='form-group'>
								<div class='col-md-12 gp'>
									<div class="row">
							 		<div class='col-md-2 '>
							 			<a href = "./ViewUserList.html?memProcess=viewMember&userId=<%=userID%>"><%=loginName%></a> 
							 		</div>
									
							 		 <div class='col-md-2 '>
									   <label class='control-label'><%=emailId%> </label>
									  </div>
									  
									   <div class='col-md-3 '>
										<label class='control-label'>&emsp;<%=dateFormat(rdate[0])%> </label>
									   </div>
							   
										<div class='col-md-2 '>
										 <label class='control-label'>&emsp;<%=requestStatus%> </label>
										</div>
										
										<div class='col-md-2 '>
										<%
											if(activeStatus.equals("1"))
											{
											%>
										 
										  <button class='btn-sm btn-danger' type='button' value="Deactivate" onclick="location.href='UserRegList.html?memProcess=updateStatus&userId=<%=userID%>&activeStatus=False';">Deactivate</button>
										
											<%}else{%>
											
											  <button class='btn-sm btn-primary' type='button' value="Activate" onclick="location.href='UserRegList.html?memProcess=updateStatus&userId=<%=userID%>&activeStatus=True';">Activate</button>
											 
											 <%}%>
										</div>
								
										<div class='col-md-1 '>
										
										 <%if(requestStatus.equalsIgnoreCase("true")) { %>
										 
										  <button class='btn-sm btn-danger' type='button' value="Pending" onclick="location.href='roles.html?roleProcess=initUserRole&userId=<%=userID%>';">Pending</button>
										   <% } else { %>
										 
										 <button class='btn-sm btn-primary' type='button' value="Assign" onclick="assignBtn('<%=userID%>','<%=loginName%>')">Assign</button>
										 
										    <% } %>
										</div>
									 </div>
							 	</div>
							</div>
						
						
						 <%}}else {%>
						 
						<div class="form-group">
							 <div class='col-md-12 gp'>
								 <div class='col-md-4'>
									 </div>
								 <div class='col-md-4'>
									 There are no records available.
						 		</div>
							</div>
						 </div>
						 
						 <%}
		if(rCnt!=0){
							%>
							
							
							 <div class='form-group gp'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>View Page(s): </label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="pn" id="pn" class="form-control" onchange="postDataForPagination1(this.value);">
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

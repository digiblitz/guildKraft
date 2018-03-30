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
<%@ page import="com.hlcform.util.HLCUserSearchResultVO" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


<script language="javascript">
function assignBtn(uId, login){
	strURL = "roles.html?roleProcess=initUserRole&userId="+uId+"&login_name="+login;
	window.location.href = strURL;
}
</script>
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
                            <h2>Membership: Search Result List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
					
							
                           <%
							String radName=(String)session.getAttribute("radMem");
							
							if(radName!=null && radName.equalsIgnoreCase("members")){
							
							%>
							
							
							<div class="form-group">
									<div class="col-md-12">
									
											<div class="col-md-2">
													<label class='control-label label1'>Member ID </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Name </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>State </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Member Type</label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Status</label>
											</div>
											
											<div class="col-md-1">
													<label class='control-label label1'>Role</label>
											</div>
											
											<div class="col-md-1">
													<label class='control-label label1'>Login</label>
											</div>
											
											
										</div>
									</div>
									
									
									<%
									ArrayList  memberList = (ArrayList) request.getAttribute("memberDetails");
									
									if(memberList!=null && memberList.size()!=0){
										Iterator itUserList = memberList.iterator();
										while(itUserList.hasNext()){
											HLCUserSearchResultVO objUserSearch = (HLCUserSearchResultVO)itUserList.next();
											String firstName =  objUserSearch.getFirstName();
											String lastName = objUserSearch.getLastName();
											String loginName = objUserSearch.getLoginName();
											String Password = objUserSearch.getPassword();
											String memberId = objUserSearch.getMemberId();
											String emailId = objUserSearch.getEmailId();
											String userIdM = objUserSearch.getUserId();
											String state = objUserSearch.getState();
											String memberType = objUserSearch.getMembershipTypeName();
											String memberStatus = objUserSearch.getStatusName();
											//out.println("Login Name:" + loginName);
											String lastFirstName = firstName+", "+lastName;
										
											if(loginName==null || loginName.trim().length()==0)  loginName = "N/A";
											if(memberId==null || memberId.trim().length()==0)  memberId = "N/A";
											if(memberType==null || memberType.trim().length()==0)  memberType = "N/A";
											else {
													String memtyp[] = memberType.split(" ");
													memberType = memtyp[0];
											}
											if(memberStatus==null || memberStatus.trim().length()==0)  memberStatus = "N/A";
									%>
                      
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' action="/SearchList.html" method="post" name="viewHrsServiceList" id="viewHrsServiceList">
							
                               <input type="hidden" name="searchProcess" value="loginProcess" />
							  <input type="hidden" name="userId" value="<%=userIdM%>"/>
							  <input type="hidden" name="memberId" value="<%=memberId%>"/>

                                <div class="form-group">
									<div class="col-md-12">
									
											<div class="col-md-2" >
													 <% if (memberId.equals("N/A")) {%>
                       									<a href="meeting.html?meeProcess=userDetailsViewLogin&amp;uid=<%=userIdM%>"><%=memberId%></a>
                       									 <% } else { %>
                        								 <a href="MembershipReg.html?process=familyView&amp;status=approve&amp;memberId=<%=memberId%>&amp;userId=<%=userIdM%>"><%=memberId%> </a>
                       								 <% }%>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label'><%=lastFirstName%></label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label'><%=state%> </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label'><%=memberType%></label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label'><%=memberStatus%></label>
											</div>
											
											<div class="col-md-1">
													 <button class='btn-sm btn-primary' name="button" type="button" onclick="assignBtn('<%=userIdM%>')"  value="Assign">Assign</button>
													 
											</div>
											
											<div class="col-md-1">													
													<button class='btn-sm btn-primary' type="submit" name="Submit5" value="SignIn">SignIn</button>
											</div>
											
											
										</div>
									</div>
									
								</form>
										 <%}}else{%>
										 
										 
                                <div class='form-group'>
                                    <div class='col-md-offset-4'>
                                        No Records were Found !
                                    </div>
								</div>
                      
                      <%}%>
					  
					   <%}else if(radName!=null && radName.equalsIgnoreCase("nonMembers")){%>
					   
					   			<div class="form-group">
									<div class="col-md-12">
									
											<div class="col-md-2 col-md-offset-2">
													<label class='control-label label1'>Name </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>State </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Role </label>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label label1'>Login</label>
											</div>
											
										</div>
									</div>
									
									<%
				
				
										ArrayList  NonMemberList = (ArrayList) request.getAttribute("memberDetails");
										
										if(NonMemberList!=null && NonMemberList.size()!=0){
											Iterator itDUserList = NonMemberList.iterator();
											while(itDUserList.hasNext()){
												HLCUserSearchResultVO objNUserSearch = (HLCUserSearchResultVO)itDUserList.next();
												String firstNameN =  objNUserSearch.getFirstName();
												String lastNameN = objNUserSearch.getLastName();
												String loginNameN = objNUserSearch.getLoginName();			System.out.println(" User login name : "+loginNameN);
												String PasswordN = objNUserSearch.getPassword();
												String userIdN = objNUserSearch.getUserId();
												String emailIdN = objNUserSearch.getEmailId();
												String stateN = objNUserSearch.getState();
												
												String lastFirstNameN = firstNameN+", "+lastNameN;
										
																			
										%>
										
										
						<form class='form-horizontal' role='form' action="SearchList.html" method="post" name="viewHrsServiceList" id="viewHrsServiceList" >
                     
							<input type="hidden" name="searchProcess" value="loginProcess" />
							  <input type="hidden" name="userId" value="<%=userIdN%>"/>
									
								<div class="form-group">
									<div class="col-md-12">
									
											<div class="col-md-2 col-md-offset-2">
													<a href="meeting.html?meeProcess=userDetailsViewLogin&amp;uid=<%=userIdN%>"><%=lastFirstNameN%></a>
											</div>
											
											
											<div class="col-md-2">
													<label class='control-label'><%=stateN%> </label>
											</div>
											
											
											<div class="col-md-2">
											<button class='btn-lg btn-primary'  name="button" type="button" onclick="assignBtn('<%=userIdN%>','<%=loginNameN%>')"  value="Assign" />Assign</button>
													 
											</div>
											
											
											<div class="col-md- 2">
												<button class='btn-lg btn-primary' type='submit' name="Submit5" value="SignIn">SignIn</button>
											</div>
											
										</div>
									</div>
									<%}}else{%>
									
									
							<div class='form-group'>
								<div class='col-md-4 col-md-offset-5'>
									No records are available
													
								</div>
							</div>
							
							 <%}%>
                      		<%}%>
									
                                <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        
										<button name="submit" type="button" class="btn-lg btn-primary" onclick="javascript:location.href='SearchList.html?searchProcess=initViewDet'" value="Search Again" align="middle">Search Again</button>
                                    </div>
                                    <div class='col-md-2'>
                                       <button name="submit" type="button" class="btn-lg btn-primary" onclick="window.open('user.html?cmd=initUsrReg','mywindow',
			'width=1100,height=700,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes')" value="Add New User" align="alignLeft" >Add New User</button>
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

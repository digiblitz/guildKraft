<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>
<%@ page import="com.hlccommon.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%=(String)session.getAttribute("title")%></title>
<script src="javascripts/basic.js" type="text/javascript" ></script>
<link href="css/core-ie.css" type="text/css" rel="stylesheet" /> 
</head>

<body>
<!-- Test commit by Manas -->
<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="mainTab">
  <tr>
    <td class="alignTop">
		<!-- HEADER STARTS HERE -->
		<%@ include file = "include/header.jsp" %>
		<!-- HEADER ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="infoBar">
		<!-- INFO BAR STARTS HERE -->
		<%@ include file = "include/info-bar-no-role.jsp" %>
		<!-- INFO BAR ENDS HERE -->	
	</td>
  </tr>
  <tr>
    <td class="tableCommonBg">
	<!-- CENTER TABLE STARTS HERE -->	
		<table width="760" border="0" align="center" cellpadding="0" cellspacing="0" id="centerTab">
		  <tr>
			<td colspan="2" class="cenTablePad">
			<!-- Welcome Tab Starts Here -->	
				<table width="99%" border="0" align="center" cellpadding="0" cellspacing="0" id="welcomeTab">
				  <tr>
					<td width="20" class="welTabLftTopCrnr"></td>
					<td width="710" class="welcomeTab"></td>
					<td width="13" class="welTabRghtTopCrnr"></td>
				  </tr>
				  <tr>
					<td class="welTabLft"></td>
					<td class="welcomeTab">
						 <img src="images/img_welcome.jpg" class="imgWelcFloatRight" />
						 <span class="styleBoldWel">Welcome To Dashboard</span><br />
						 <br />
						 <div>The modules and sub-modules displayed below has been assigned to you depending on the 
						 privileges that you hold as a/an <span class="styleBoldPrivilege">'<%=sessionRoleName%>'</span>.</div><br />
						 <div><strong>Click on any of the modules displayed below to list out it's related sub-modules beside 
						 and access it further.</strong><br /><br />
						 
						 <!-- <a href="DonationAction.do?donationProcess=view" class="linkFive"> Make Donations Here!</a>-->
						 <!--a href="uploadEAR.do?cmd=initErUpload" class="linkFive"> Upload EAR File!</a-->
						 </div>
					</td>
					<td class="welTabRght"></td>
				  </tr>
				  <tr>
					<td class="welTabLftBotCrnr"></td>
					<td class="welTabBot"></td>
					<td class="welTabRghtBotCrnr"></td>
				  </tr>
			  </table>
			<!-- Welcome Tab Ends Here -->
			</td>
		  </tr>
		  <tr>
			<td width="400" class="deptTablePad">
			  <table width="396" border="0" align="center" cellpadding="0" cellspacing="0" id="deptTab">
				  <tr>
					<td class="deptTabHead">&nbsp;</td>
				  </tr>
				  <tr>
				  	<td class="deptTabList">
					<!-- Department List Starts Here -->
						<table width="396" border="0" cellspacing="0" cellpadding="0">
						<%
							ArrayList roleList = (ArrayList)session.getAttribute("DBInitialBoard");
							if(roleList!=null && roleList.size()!=0){
								Iterator itRoleList = roleList.iterator();
								while(itRoleList.hasNext()){
									String strRolelist[]= (String[])itRoleList.next();
									String roleId = strRolelist[2];
									String roleName = strRolelist[3];

  /*								      String userMapId = rs.getString(1);
										String userIdVal = rs.getString(2);
										String roleId = rs.getString(3);
										String roleName = rs.getString(4);
										String[] rlList = {userMapId, userIdVal, roleId, roleName};
										*/
							%>
						   <tr>
							<td class="deptTabListOth"><a href="roles.do?roleProcess=selectEntityDashboard&headRoleId=<%=roleId%>" class="linkFour">&raquo; <%=roleName%> </a></td>
						  </tr>
						  <%
						  }
						  }
						  else{
						  %>
						   <tr>
							<td class="deptTabListOth">No roles has been Assign</td>
						  </tr>
						  <%
						  }
						  %>  
                                                  
						</table>
					<!-- Department List Ends Here -->
					</td>
				  </tr>
				  
				  
                                  <% if(request.getAttribute("viewButton")!=null ) { %>
                                  <tr>
				  <td><font color="red">Request has been successfully submitted.</font></td>
                                 </tr>
								 <tr><td>&nbsp;</td></tr>
                                  <tr>
				  <td><font color="red">It will be processed within 24 hours.</font></td>
                                 </tr>
                                   <% } else { %>
                                    <tr>
					<td><strong>Note:</strong> <font color="red">Want to have Access to all the privileges listed in right panel? </font></td>
				  <tr><td>&nbsp;</td></tr>
									<tr>
									
					<td ><input type="button"  name="Submit" value="Get Access Now" onclick="location.href='roles.do?roleProcess=requestRole'"  class="gradTwoBtn" /></td>
				  </tr>
                                   <% } %>
			  </table>
			</td>
			<td width="340" class="subDeptTablePadHome">

				<table width="337" border="0" align="center" cellpadding="0" cellspacing="0" id="subDeptTab">
				  <tr>
					<td class="subDeptTabHead">Available Roles and Privileges</td>
				  </tr>
				  <tr>
					<td class="subDeptListBg">
							
					<!-- Sub-Department List Starts Here -->
		<div class="subDeptDiv">
			<table width="320" border="0" align="left" cellpadding="2" cellspacing="1">
				<%
				ArrayList genealRoleList = (ArrayList)session.getAttribute("DBGeneralPrivList");
				if(genealRoleList!=null && genealRoleList.size()!=0){
					Iterator itEntList = genealRoleList.iterator();
						while(itEntList.hasNext()){
							ArrayList privilegeList = (ArrayList)itEntList.next();
							if(privilegeList!=null && privilegeList.size()!=0){
							  Iterator itPrivRoleList = privilegeList.iterator();
							  while(itPrivRoleList.hasNext()){
								 String strPrivilegeList[]= (String[])itPrivRoleList.next();
								  String privilegeName = strPrivilegeList[1];
									%>
								  <tr>
									<td class="subDeptTabList">&bull; <strong class="linkOne"><%=privilegeName%></strong></td>
								  </tr>
									 <%
									 ArrayList menuList = (ArrayList) itPrivRoleList.next();
									 Iterator itMenu = menuList.iterator();
											while(itMenu.hasNext()){
												HLCMenuListVO menuVO = (HLCMenuListVO) itMenu.next();
												if(menuVO.getRoleId()!=null && menuVO.getEntityId()!=null){
													//String PermissionName = menuVO.getPermissionName();
													String accessName = menuVO.getAccessName();
													String accessURL = menuVO.getAccessUrl();	
													if(accessName!=null && accessName.trim().length()!=0){																					
													  %>
													  <tr>
                                                                                                               <td class="subDeptTabList" style="padding-left:35px;"> <span class="styleBoldWel"><%=accessName%></span></td>
													  </tr>
													  <%
													  }
										  		}
											}
									 
									 
									 }
								}
						 	}
						 }
						 else{
						 	%>
							<tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr>
						 <tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr><tr>
							<td class="subDeptTabList">&nbsp;</td>
						  </tr>
							<%
						 }
						 %>
						  
					  </table>
					 </div> 
					<!-- Sub-Department List Ends Here -->
					
					</td>
				  </tr>
				  <tr>
					<td class="subDeptTabFoot">&nbsp;</td>
				  </tr>
			  </table>

			</td>
		  </tr>
		</table>
	<!-- CENTER TABLE ENDS HERE -->
	</td>
  </tr>
  <tr>
    <td class="footerBg">
		<!-- FOOTER STARTS HERE -->
			<%@ include file = "include/footer.jsp" %>
		<!-- FOOTER ENDS HERE -->
	</td>
  </tr>
</table>
 

</body>
</html>

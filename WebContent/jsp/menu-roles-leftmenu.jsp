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

  <script language="javascript">
	/*function headEntityCheck(){
		if(document.frmLeftMenu.headEntityId.value==""){
			alert("Select Any One Entity");
			document.frmLeftMenu.headEntityId.focus();
			return false;
		}
		return true; 
	}*/
  </script>
<%
	/*String count = (String) session.getAttribute("count");
	
		if(count==null) count ="";
		*/
%>

				<%--<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0" id="fullHeight" class="menuTableBg">
				  <tr>
					<td class="alignTop"><br />
						<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" id="leftMenuTab">
						  <tr>
							<td class="menuTabLft"></td>
							<td class="menuTabTwoBg">
								
								<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
                                  <tr>
                                    <td height="20" class="alignLeft"><span class="textBold">&nbsp;&nbsp;&nbsp;Related Links</span> </td>
                                  </tr>--%>
								  <%
								  /*ArrayList leftMenuList = (ArrayList)session.getAttribute("DBLeftPrivlegeList");
								  if(leftMenuList!=null && leftMenuList.size()!=0){
									  Iterator itMenu = leftMenuList.iterator();
									  	int showPriv = 0;
										while(itMenu.hasNext()){
											HLCMenuListVO leftMenuVO = (HLCMenuListVO) itMenu.next();
											if(leftMenuVO.getRoleId()!=null && leftMenuVO.getEntityId()!=null){
												String leftPrivilegeName = leftMenuVO.getPrivilegeName();
												String leftAccessName = leftMenuVO.getAccessName();
												String leftAccessURL = leftMenuVO.getAccessUrl();
												String leftMapPerId = leftMenuVO.getMapPermissionId();
												String EntityName=leftMenuVO.getEntityName();
											
												showPriv++;				
										  //{roleName, entityName, privilegeName, permissionName, privilegeIdVal, permissionId};
										 if(EntityName!=null && !(EntityName.equalsIgnoreCase("Views"))){	
										  if(showPriv==1){
										  */
										  %>
										  <%--<tr>
											<td height="20" class="menuLinkbg"><span class="textBold">&curren; <%=leftPrivilegeName%> </span></td>
										  </tr>--%>
										 
										  <%
										  //}%>
										  
										   <%//if(leftAccessName!=null && leftAccessName.trim().length()!=0){%>
										  
										  <%--<tr>
								<td height="20" class="menuLinkbg">&raquo; <a href="<%=leftAccessURL%>" class="linkFour"><%=leftAccessName%></a></td>
													  </tr>--%>
		
										<%  /*}}
													
										  		}
											}
									}
									else{*/
									%>
									<%--<tr>
										<td height="20" class="menuLinkbg"><span class="textBold">&curren; No Privileges Available </span></td>
									  </tr>--%>
									<%
									//}
								  %>							  								  
                                <%--</table>
							</td>
							<td class="menuTabRght"></td>
						  </tr>
						  <tr>
							<td class="menuTabLftBotCrnr"></td>
							<td class="menuTabBot"></td>
							<td class="menuTabRghtBotCrnr"></td>
						  </tr>
						</table>
						<br />
					

					</td>
				  </tr>
				</table>--%>

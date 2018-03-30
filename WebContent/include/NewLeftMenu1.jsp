<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@page import="com.hlccommon.util.HLCMenuListVO"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/LeftMenu.css">
<title>Left Menu Bar</title>
</head>

<body>
<div id='accordian'>
        <ul><li style="border-style:groove;border-width:thin;border-color:#FFFFFF;background-color:#CCCCCC">Heading</li></ul>
		<ul>
		<%
						ArrayList headEntityList = (ArrayList)session.getAttribute("DBEntityList");
						if(headEntityList!=null && headEntityList.size()!=0){
							Iterator itEntList = headEntityList.iterator();
							String sessHeadEntityId = (String)session.getAttribute("entityId");

							if(sessHeadEntityId==null) sessHeadEntityId="";
							while(itEntList.hasNext()){
								String strRolelist[]= (String[])itEntList.next();
								String heRoleId = strRolelist[1];
								String heRoleName = strRolelist[3];
								String heEntityId = strRolelist[2];
								String heEntityName = strRolelist[4];
								String heEntityUrl = strRolelist[5];
								String privNameId = strRolelist[6];
								String privName = strRolelist[7];
								
							if(heEntityUrl==null){
													  
						  						  			
						%>
						
						<li><h3><a href=""><%=heEntityName%></a></h3>
					<% String tempValue=(String)request.getAttribute("tempValue"); %>
							<ul>
								<li><a href="#"><span><%=tempValue%></span></a>
									<ul>
										<li><a href="#"><span>Permission1</span></a></li>
										<li><a href="#"><span>Permission2</span></a></li>
										<li><a href="#"><span>Permission3</span></a></li>
									</ul>
								</li>
							</ul>
							
						</li>
							<%
							
						  	}else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
						  	<%}
							
							}
						}
						%>
		
		
        </ul>
</div>
	  <script type="text/javascript">
$(document).ready(function(){
	$("#accordian h3").click(function(){
		//slide up all the link lists
		$("#accordian ul ul").slideUp();
		//slide down the link list below the h3 clicked - only if its closed
		if(!$(this).next().is(":visible"))
		{
			$(this).next().slideDown();
		}
	})
})
</script>
</body>
</html>

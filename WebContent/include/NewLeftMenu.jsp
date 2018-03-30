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
<%@ page import="java.util.regex.Pattern"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="stylesheet" type="text/css" href="css/LeftMenu.css">
<title>Left Menu Bar</title>
</head>
<script type="text/javascript">
function navv(h3) {
	
	var s1=h3.innerHTML;
	alert(s1);
	var result = document.getElementById("result");
    result.innerText = s1;
	return true;
	
}
function navv1(span) {
	
	var s2=span.innerHTML;
	alert(s2);
	var result1 = document.getElementById("result1");
    result1.innerText = s2;
	return true;
	
}
</script>
<body>
<div id='accordian'>
        <ul><li style="border-style:groove;border-width:thin;border-color:#FFFFFF;background-color:#CCCCCC"><font color="#000000"><strong>Privileges</strong></font></li></ul>

<%ArrayList headTempEntityList = (ArrayList)session.getAttribute("DBEntityList");

if(headTempEntityList==null || headTempEntityList.size()==0){

%>
        <ul><li style="border-style:groove;border-width:thin;border-color:#FFFFFF;background-color:#CCCCCC"><font color="#000000">No Privileges are available!!!</font></li></ul>
		<%}%>
		<ul>
		
		
		<%
						ArrayList headEntityList = (ArrayList)session.getAttribute("DBEntityList");
						if(headEntityList!=null && headEntityList.size()!=0){
							Iterator itEntList = headEntityList.iterator();
							
							while(itEntList.hasNext()){
							
								String strRolelist[]= (String[])itEntList.next();
								String heRoleId = strRolelist[1];
								String heRoleName = strRolelist[3];
								String heEntityId = strRolelist[2];
								String heEntityName = strRolelist[4];
								String heEntityUrl = strRolelist[5];
								String privName= strRolelist[6];
					            String priviId = strRolelist[7];
					            
								if(heEntityUrl==null){	
								//System.out.println(heEntityName);
							%>
						<li ><h3><%=privName%></h3>
							 <ul>
							<%
						ArrayList headAllList = (ArrayList)session.getAttribute("DBAllList");
						if(headAllList!=null && headAllList.size()!=0){
							Iterator itAllList = headAllList.iterator();
							
							while(itAllList.hasNext()){
							
								String strAlllist[]= (String[])itAllList.next();
								
								String allEntityId = strAlllist[2];
								String allEntityName = strAlllist[4];
								
								String hePrivName = strAlllist[6];
								String hePrivId = strAlllist[7];
								String accessName = strAlllist[8];
								String accessUrl = strAlllist[9];
								
								//System.out.println("accessUrl in jsp::"+accessUrl);
								
								String tempAccesURL=accessUrl.replaceAll("do","html");
								
									//System.out.println("tempAccesURL in jsp::"+tempAccesURL);
						if(hePrivId.equals(priviId)){	
									  			
						%>
							
						  
								<li><a href="<%=tempAccesURL%>&navPrivName=<%=privName%>&navAccessName=<%=accessName%>"><span><%=accessName%></span></a>
								
								
									<!-- ul>
							<li><a href="#"><span></span></a></li>
										
									</ul-->
									
									
									
									
								</li>
								
								
						
							
							<%
							//System.out.println(heEntityName+":"+hePrivName);
							} %>
							
						
						
						
							<%
							}}%>
								</ul>
							</li>	
							<%
						  	}else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
						  	<%}
						
							}} %>	
			
		
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

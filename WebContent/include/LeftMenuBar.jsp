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
<%
String sessUserId = (String) session.getAttribute("userId");
String sessId = (String) session.getAttribute("sessionId");
//System.out.println("sessId=="+sessId);
if(session.isNew() || sessId == null){


	response.sendRedirect("login.jsp");

}
String sessionRoleName = (String)session.getAttribute("roleName");
String sessionRoleId = (String)session.getAttribute("roleId");
if(sessionRoleId==null)
	sessionRoleId = "";
if(sessionRoleName==null)
	sessionRoleName = "General";
%>
<script language="javascript">
	function headRoleCheck(){
		if(document.frmHead.headRoleId.value==""){
			alert("Select Any One Role");
			document.frmHead.headRoleId.focus();
			return false;
		}
		return true;
	}
	  function noBack() {  
		 
		window.history.forward(); }

    noBack();
    window.onload = noBack;
    window.onpageshow = function (evt) { if (evt.persisted) noBack(); }
    window.onunload = function () { void (0); }
  </script>

</head>

<body>
<div id='cssmenu'>
        <ul>
		<%
						ArrayList headAllList = (ArrayList)session.getAttribute("DBEntityList");
						int i=0;
						if(headAllList!=null && headAllList.size()!=0){
							Iterator itAllList = headAllList.iterator();
							String roleId =null;				                    
		                    String entiId =null;
		                    String roleName = "";
		                    String entityName ="";			                  
		                    String heEntityUrl="";
							
							while(itAllList.hasNext()){
								String strAlllist[]= (String[])itAllList.next();
								
								  roleId =strAlllist[1];				                    
				                     entiId =strAlllist[2];
				                     roleName = strAlllist[3];
				                     entityName =strAlllist[4];				                  
				                     heEntityUrl=strAlllist[5];
								
								
							if(heEntityUrl==null){
													 						  						  			
						%>

						<li class='active has-sub'><a href="#"><span><%=entityName%></span></a>
						
				<%
						ArrayList headPrivList = (ArrayList)session.getAttribute("DBPrivList");
						
						if(headPrivList!=null && headPrivList.size()!=0){
							Iterator itPrivList = headPrivList.iterator();
							String entiName =null;				                    
		                    String privName =null;
		                    
							
							while(itPrivList.hasNext()){
								String strPrivlist[]= (String[])itPrivList.next();
								
								entiName =strPrivlist[0];				                    
								privName =strPrivlist[1];
				                    
				           if(entityName.equalsIgnoreCase(entiName)){          
				                     %>
					
						<ul>
						<li class='has-sub'><a href='#'><span><%=privName%></span></a>
						</li>
							
							</ul>
						
						<%}}} %>
						
						
						<!--ul>
						<li class='last'><a href='#'><span></span></a>
						
						
						</li>
						</ul-->
						
							
						
							</li>
							<%
							}
						  	else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=entityName%></span></a></li>
						  	<%}
							
							i++;}
						}
						%>
		
		
        </ul>
      </div>
</body>
</html>

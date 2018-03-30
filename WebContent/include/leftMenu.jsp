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
<!--  %@ page import="java.util.*"%-->
<!--  %@ page import="java.sql.*"%-->

<!--  %@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %-->
<!--  >%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %-->
<!--  %@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %-->
<%@page import="com.hlccommon.util.HLCMenuListVO"%>
<%@ page import="java.util.*"%>

<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Template</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
 <link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    

    <script type="text/javascript" src="scripts/menuExpandable.js"></script>

<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->


<!-- prefix free to deal with vendor prefixes -->
<script src="http://thecodeplayer.com/uploads/js/prefixfree-1.0.7.js" type="text/javascript"></script>

<!-- jQuery -->
<script src="http://thecodeplayer.com/uploads/js/jquery-1.7.1.min.js" type="text/javascript"></script>

<!--/*jQuery time*/-->
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
<%
String sessUserId = (String) session.getAttribute("userId");
String sessId = (String) session.getAttribute("sessionId");
//System.out.println("sessId=="+sessId);
if(session.isNew() || sessId == null){


	response.sendRedirect("/login.html?cmd=initLogin");

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

<style type="text/css">
@import url(http://fonts.googleapis.com/css?family=Oxygen+Mono);
/* Please Keep this font import at the very top of any CSS file */
@charset "UTF-8";
/* Starter CSS for Flyout Menu */
#cssmenu {
  padding: 0;
  margin: 0;
  border: 0;
  line-height: 1;
}
#cssmenu ul,
#cssmenu ul li,
#cssmenu ul ul {
  list-style: none;
  margin: 0;
  padding: 0;
}
#cssmenu ul {
  position: relative;
  z-index: 597;
  float: left;
}
#cssmenu ul li {
  float: left;
  min-height: 1px;
  line-height: 1em;
  vertical-align: middle;
  position: relative;
}
#cssmenu ul li.hover,
#cssmenu ul li:hover {
  position: relative;
  z-index: 599;
  cursor: default;
}
#cssmenu ul ul {
  visibility: hidden;
  position: absolute;
  top: 100%;
  left: 0px;
  z-index: 598;
  width: 100%;
}
#cssmenu ul ul li {
  float: none;
}
#cssmenu ul ul ul {
  top: -2px;
  right: 0;
}
#cssmenu ul li:hover > ul {
  visibility: visible;
}
#cssmenu ul ul {
  top: 1px;
  left: 99%;
}
#cssmenu ul li {
  float: none;
}
#cssmenu ul ul {
  margin-top: 1px;
}
#cssmenu ul ul li {
  font-weight: normal;
}
/* Custom CSS Styles */
#cssmenu {
  width: 200px;
  background: #333333;
  font-family: 'Oxygen Mono', Tahoma, Arial, sans-serif;
  zoom: 1;
  font-size: 12px;
}
#cssmenu:before {
  content: '';
  display: block;
}
#cssmenu:after {
  content: '';
  display: table;
  clear: both;
}
#cssmenu a {
  display: block;
  padding: 15px 20px;
  color: #ffffff;
  text-decoration: none;
  text-transform: uppercase;
}
#cssmenu > ul {
  width: 200px;
}
#cssmenu ul ul {
  width: 200px;
}
#cssmenu > ul > li > a {
  border-right: 4px solid #1b9bff;
  color: #ffffff;
}
#cssmenu > ul > li > a:hover {
  color: #ffffff;
}
#cssmenu > ul > li.active a {
  background: #1b9bff;
}
#cssmenu > ul > li a:hover,
#cssmenu > ul > li:hover a {
  background: #1b9bff;
}
#cssmenu li {
  position: relative;
}
#cssmenu ul li.has-sub > a:after {
  content: '+';
  position: absolute;
  top: 50%;
  right: 15px;
  margin-top: -6px;
}
#cssmenu ul ul li.first {
  -webkit-border-radius: 0 3px 0 0;
  -moz-border-radius: 0 3px 0 0;
  border-radius: 0 3px 0 0;
}
#cssmenu ul ul li.last {
  -webkit-border-radius: 0 0 3px 0;
  -moz-border-radius: 0 0 3px 0;
  border-radius: 0 0 3px 0;
  border-bottom: 0;
}
#cssmenu ul ul {
  -webkit-border-radius: 0 3px 3px 0;
  -moz-border-radius: 0 3px 3px 0;
  border-radius: 0 3px 3px 0;
}
#cssmenu ul ul {
  border: 1px solid #0082e7;
}
#cssmenu ul ul a {
  font-size: 12px;
  color: #ffffff;
}
#cssmenu ul ul a:hover {
  color: #ffffff;
}
#cssmenu ul ul li {
  border-bottom: 1px solid #0082e7;
}
#cssmenu ul ul li:hover > a {
  background: #4eb1ff;
  color: #ffffff;
}
#cssmenu.align-right > ul > li > a {
  border-left: 4px solid #1b9bff;
  border-right: none;
}
#cssmenu.align-right {
  float: right;
}
#cssmenu.align-right li {
  text-align: right;
}
#cssmenu.align-right ul li.has-sub > a:before {
  content: '+';
  position: absolute;
  top: 50%;
  left: 15px;
  margin-top: -6px;
}
#cssmenu.align-right ul li.has-sub > a:after {
  content: none;
}
#cssmenu.align-right ul ul {
  visibility: hidden;
  position: absolute;
  top: 0;
  left: -100%;
  z-index: 598;
  width: 100%;
}
#cssmenu.align-right ul ul li.first {
  -webkit-border-radius: 3px 0 0 0;
  -moz-border-radius: 3px 0 0 0;
  border-radius: 3px 0 0 0;
}
#cssmenu.align-right ul ul li.last {
  -webkit-border-radius: 0 0 0 3px;
  -moz-border-radius: 0 0 0 3px;
  border-radius: 0 0 0 3px;
}
#cssmenu.align-right ul ul {
  -webkit-border-radius: 3px 0 0 3px;
  -moz-border-radius: 3px 0 0 3px;
  border-radius: 3px 0 0 3px;
}


</style>
<body>


<div class="content_new" align="center">
  <table width=100% border="0" cellpadding="0" cellspacing="0">
    <tr> </tr>
    <tr>
	
      <td width="200" align="center" valign="middle">
	  <%
								ArrayList headerRoleList = (ArrayList)session.getAttribute("DBInitialBoard");
								int tabId = 0;
								int tabSize = 0;
								String newRoleName ="";
								if(headerRoleList!=null && headerRoleList.size()!=0){
									tabSize = headerRoleList.size();
									Iterator itRoleList = headerRoleList.iterator();
									String sessHeadRoleId = (String)session.getAttribute("roleId");
									if(sessHeadRoleId==null) sessHeadRoleId="";
									while(itRoleList.hasNext()){
										String strRolelist[]= (String[])itRoleList.next();
										String heFirstRoleId = strRolelist[2];
										String heFirstRoleName = strRolelist[3];
										tabId++;
										if(heFirstRoleId.equals(sessHeadRoleId)){
											 newRoleName = heFirstRoleName;

									%>

									<!--li id="current"><a href="<%=request.getContextPath()%>/roles.do?roleProcess=selectEntityDashboard&headRoleId=<%=heFirstRoleId%>"><span><%=heFirstRoleName%></span></a></li-->

									<%
									}
									else{
									%>
									<!--li><a href="<%=request.getContextPath()%>/roles.do?roleProcess=selectEntityDashboard&headRoleId=<%=heFirstRoleId%>"><span><%=heFirstRoleName%></span></a></li-->
									<%
									}
									}
								}

								session.setAttribute("roleName", newRoleName);
								%>
	  
	  
	  
	  
	  <div id='cssmenu'>
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
							if(heEntityUrl==null){
																  						  			
						%>
   
    <li class='active has-sub'><a href="#"><span><%=heEntityName%></span></a>
	
	
	
	
	
	
	
	
	</li>
	
	
	
	
	
	<%					
						  	}else{%>
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
									<%}
							
							}
						}
						%>
						
					
					
					
					
					
					
					
					
						
						
						
   
   
   
   
   <li class='active has-sub'><a href='#'><span>Products</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Product 1</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Product 2</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li><a href='#'><span>About</span></a></li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
</ul>
</div>

  </td>
     
    
	 
    </tr>
   
  </table>
</div>

</body>
</html>

<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>

<%@ page import="java.io.*"%>

<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="https://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" type="text/css" media="screen" 
        href="styles/menuExpandable.css" />    
    <script type="text/javascript" src="scripts/menuExpandable.js"></script>
<script language="javascript">

 $(document).ready(     function() { 
	   var url1=document.getElementById("url1").value;
	   
		/*https://98.172.19.186:8443/partymgr/control/main
		https://98.172.19.186:8443/projectmgr/control/main
		https://98.172.19.186:8443/myportal/control/main
		https://98.172.19.186:8443/finance/control/main
		https://98.172.19.186:8443/humanres/control/main
		var url1="https://98.172.19.186:8443/projectmgr/control/login?USERNAME=:1&PASSWORD=:2";*/
		//alert(url1);
		 if(url1.indexOf(":1")!==-1){
		
        var username=document.getElementById("username").value;
        var password=document.getElementById("userpassword").value;
       url1= url1.replace(":1",username);
       url1 =url1.replace(":2",password);
      
       url=encodeURI(url1);
	 
	    //document.getElementById("ifrm").height = ($(window).height() * 2);
		//document.documentElement.style.overflow = 'hidden';
		document.getElementById("ifrm").height = "550";
        document.getElementById("ifrm").src=url;
		
        //document.getElementById("ifrm").height = document.frames[ifr].document.body.scrollHeight;
       }
        else{
        	//  document.getElementById("ifrm").height = ($(window).height() * 2);
			//alert($(window).height());
			document.documentElement.style.overflow = 'hidden';
        	 url=encodeURI(url1);
             document.getElementById("ifrm").src=url;
        }
     
       
    }); 

</script>
</head>
<%String url1=(String)request.getAttribute("url");
//String userName1=(String)session.getAttribute("userName");
//String userPassword1=(String)session.getAttribute("userPassword");
String urlName=(String)request.getAttribute("urlName");


System.out.println("url1=================>"+session.getAttribute("userName"));
System.out.println("url1=================>"+urlName);
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
			<div class='container'>
            <div class="col-md-10">
			
                
				
                    <div class='panel panel-primary dialog-panel' style="width:150%;">
					
					<!--==============================Form Title=================================-->
                        
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body panel-body1'>
						
						<!--==============================Form Description=================================-->
								
								
								  <input type="hidden" value=<%=userName %> id="username"/>
								<input type="hidden" value=<%=userPassword %> id="userpassword"/>	
								<input type="hidden" value=<%=url1%> id="url1"/>
								
				
				<div class="form-group">

<%				if(urlName!=null && (urlName.equalsIgnoreCase("AnalyzeBP") || urlName.equalsIgnoreCase("CreateBP"))){

%>
					<!--iframe src="" height="103%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-6px;margin-left:0px;margin-bottom:0px">
</iframe-->
				<iframe style="" src="http://localhost:8280/backend/poem/repository" width="100%" frameborder="0">
</iframe>
				<%
				}else if(urlName.equalsIgnoreCase("DeployBP")){
				
				%>
					<!--iframe src="" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-47px;margin-left:0px;margin-bottom:20px">
</iframe-->
			<iframe src="http://localhost:8180/drools-guvnor/org.drools.guvnor.Guvnor/Guvnor.jsp?" width="100%" frameborder="0">
</iframe>
					
			<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("BpDesigner")){
				%>
				
				<iframe style="height: 750px; " src="" class="alignnn" id="ifrm" name="ifrm" width="100%"  frameborder="0">
</iframe>
			<!--iframe src="http://demo.bpmn.io/new" height="108%" width="130%"  frameborder="0" style="margin-top:-20px;margin-left:0px;margin-bottom:0px;margin-right:-50px">
</iframe-->

<!-- Without using iframe -->
<!--object type="text/html" data="http://demo.bpmn.io/new" style="width:100%; height:100%">
<p>backup content</p>
</object-->
				
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("MonitorBP")){
				%>
				<!--iframe src="" height="110%" width="100%" id="ifrm" name="ifrm" frameborder="0" style="margin-top:-35px;margin-left:0px;margin-bottom:20px">
</iframe-->
				<iframe src="http://localhost:8180/jbpm-console" width="100%" frameborder="0">
</iframe>
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("FM")){
				%>
				
				

<iframe src="<%=url1%>?USERNAME=<%=session.getAttribute("userName")%>&PASSWORD=<%=session.getAttribute("userPassword")%>" class="alignnn" style="height:600px; width:150%; " frameborder="0">
</iframe>
			
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("VMSApp")){
				%>
				<iframe src="" width="100%" id="ifrm" name="ifrm" frameborder="0">
</iframe>
				<%
				}else if(urlName!=null && urlName.equalsIgnoreCase("HomeBPEL")){
				%>
				<iframe src="" width="100%" id="ifrm" name="ifrm" frameborder="0">
</iframe>
				<%}else if(urlName!=null && urlName.equalsIgnoreCase("BPELEngine")){
				%>
				<iframe src="" width="100%" id="ifrm" name="ifrm" frameborder="0">
</iframe>
				<%}else if(urlName!=null && urlName.equalsIgnoreCase("BPELInstance")){
				%>
				<iframe src="" width="100%" id="ifrm" name="ifrm" frameborder="0">
</iframe>
				<%}else if(urlName!=null && urlName.equalsIgnoreCase("BPELDeployed")){
				%>
				<iframe src="" width="100%" id="ifrm" name="ifrm" frameborder="0">
</iframe>
				<%}%>
				
				</div>
			
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

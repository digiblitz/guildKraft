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
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Home</title>
    <meta charset="utf-8">
    <meta name="format-detection" content="telephone=no"/>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/camera.css"/>
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/jquery.matchHeight-min.js"></script>
    <script src="js/sForm.js"></script>
    <script src="js/camera.js"></script>
    <script>
        $(function () {
            $(".equal").matchHeight();
        });
    </script>
    <!--[if (gt IE 9)|!(IE)]><!-->
    <script src="js/jquery.mobile.customized.min.js"></script>
    <script src="js/wow/wow.js"></script>
    <script>
        $(document).ready(function () {
            if ($('html').hasClass('desktop')) {
                new WOW().init();
            }
        });
    </script>
    <!--<![endif]-->
    <!--[if lt IE 9]>
    <div style=' clear: both; text-align:center; position: relative;'>
        <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0"
                 height="42" width="820"
                 alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today."/>
        </a>
    </div>
    <script src="js/html5shiv.js"></script>
    <link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
    <![endif]-->
</head>
       
<style type="text/css">
.dropdown span{
color:#FFFFFF;
}
.dropdown span:hover{
background-color:#FFFFFF;
color:#0099FF;
}
.dropdown ul:hover{
border-style:groove;
border-width:thin;
}
.dropdown ul>li:hover{
background-color:#CCCCCC;
}
</style>
     </head>
<body>

<!--==============================header=================================-->

<%String fstnam=(String)session.getAttribute("firstName");
String lstnam=(String)session.getAttribute("lastName");
//System.out.println("last name : "+lstnam);

String roleName=(String)session.getAttribute("roleName");
String fullName=fstnam+" "+lstnam;

System.out.println("fstnam::::"+fullName);

String userId=(String)session.getAttribute("userId");
System.out.println("UserId in headerProcess : "+userId);

String userName=(String)session.getAttribute("userName");
String userPassword=(String)session.getAttribute("userPassword");

session.setAttribute("userName",userName);
session.setAttribute("userPassword",userPassword);

System.out.println("username&password in the headerprocess::::"+userName+"" +userPassword);
 

%>

<header id="header">
    <div id="stuck_container" style="margin-top:-40px">
        <div class="container">
            <div class="row">
                <div class="grid_12">
               <div class="border-wrapper">
                        <nav class="put-left header-menu">
                            <ul class="sf-menu">
										<li><a href="login.html?cmd=initLogin"><img src="images/dBguildLogo.png" alt="" width="150px" height="25px"></a></li>

					 <li><a href="#"></a></li>
								
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								<li><a href="#"></a></li>
								
								
								<li><a href="frmHome.jsp"><img src="images/home (1).png" alt="" width="30px" height="25px"></a></li>
								

                       
                    </ul>
                </nav>
				<div class="clearfix"></div>
            </div>
			</div>
			</div>
    </div>
	</div>
    <!--div class="container_12">
        <div class="grid_12">
            <h1><a href="frmHome.jsp"><img src="images/logo3.jpg" alt=""></a></h1>
        </div>     
    </div-->
</header>






</body>
</html>

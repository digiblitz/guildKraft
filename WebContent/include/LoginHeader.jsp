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
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
     <head>
     <title>Home</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/camera.css"> 
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
     <script src="js/jquery.js"></script>
     <script src="js/jquery-migrate-1.2.1.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
	 <script src="js/script.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>     
     <script src="js/superfish.js"></script>
     <script src="js/tmStickUp.js"></script>
     <script src="js/jquery.mobilemenu.js"></script>
     <script src="js/camera.js"></script>  
     <script src="js/sForm.js"></script> 
     <!--[if (gt IE 9)|!(IE)]><!-->
     <script src="js/jquery.mobile.customized.min.js"></script>
     <!--<![endif]-->
     <!--[if lt IE 8]>
        <link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">

       <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
           <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
    <![endif]-->
    <!--[if lt IE 9]>
   		<script src="js/html5shiv.js"></script>
    	<link rel="stylesheet" type="text/css" media="screen" href="css/ie.css">
    <![endif]-->
   
        <script>
            $(document).ready(function(){
                jQuery('#camera_wrap').camera({
                    loader: true,
                    pagination: true,
                    minHeight: '200',
                    thumbnails: false,
                    height: '50%',
                    caption: true,
                    navigation: false,
                    fx:  'mosaic'
                });
                /*Back to Top*/
                $().UItoTop({ easingType: 'easeOutQuart' });
             });
        </script>
       
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
<body id="top">

<!--==============================header=================================-->

<header id="header">
    
   <div id="stuck_container"> 
        <div class="container_12">
            <div class="grid_12">
                
            </div>
        </div>
    </div>
    <div class="container_12">
        <div class="grid_12">
            <h1><a href="frmHome.jsp"><img src="images/logo3.jpg" alt=""></a></h1>
	 </div>     
    </div>
</header>


</body>
</html>

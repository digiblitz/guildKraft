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
     <title>About Us</title>
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
     </head>
<body id="top">

<!--==============================header=================================-->

<header id="header">
    <%@ include file = "../../include/Header.jsp" %>
</header>

<form id="form1" name="form1" method="post" action="">
<div class="bg1">
<!--=======content================================-->

    <div id="content">
        <div class="p44">
            <div class="container_12">
                <div class="grid_12 center">
                    <h2>A FEW WORDS ABOUT US</h2>
                </div>
            </div>
            <div class="container_12">
                <div class="grid_12">
                    <div class="block">
                        <img src="images/page2_img1.jpg" alt="">
                        <a href="#" class="link">Aliquam congue fermentum nisl mauris accumsan nulla.</a>
                        <p>Aenean non ummy hendreriauris. Phasellllus. porta. Fusce su scipit varius mium sociis totdnat ibus et magis dis parturient montes, nasce tur ridiculus mus. Nulla dui fusce feu giatlesua da odio morbi nunc. Odio gravida at cursus nec. </p>
                        <p>Luctus a lorem. Lorem ipsum dolor sitat, consec tetuer adipi scing elit. Praesent vestibulum molestie lacus. </p>
                        <p>Fusce suscipit varius mium sociis totdnat ibus et magis dis parturient montes, nasce tur ridiculus mus. Nulla dui fusce feu giatlesuada odio morbi nunc. odio gravida at cursus nec luctus a lorem. Lorem ipsum dolor sitat, consec tetuer adipiscing elit. Praesent vestibulum molestie lacus. Aenean non ummy henrerit mauris.</p>
                        <p>Phasellus porta. Fusce suscipit varius mium sociis natoque penatibus et magnis dis. parturient montes, nascetur ridiculus mus. Nulla dui. Fusce feugiat malesuada odio.</p>
                    </div>
                    <div class="divider"></div>                               
                </div>
            </div>
             <div class="container_12">
                <div class="grid_12 center">
                    <h2>Our team</h2>
                </div>
            </div>
            <div class="container_12">
                <div class="grid_3">
                    <div class="thumb">
                        <img src="images/page2_img2.jpg" alt="">
                        <a href="#" class="link">Mark Johnson</a>
                        <p>Conc tetu  er adipi scing. Praesent vestibuum.</p>
                    </div>
                </div>
                <div class="grid_3">
                    <div class="thumb">
                        <img src="images/page2_img3.jpg" alt="">
                        <a href="#" class="link">Emma Grosh</a>
                        <p>Mol estie lacui irhs. Aenean non ummyhen.</p>
                    </div>
                </div>
                <div class="grid_3">
                    <div class="thumb">
                        <img src="images/page2_img4.jpg" alt="">
                        <a href="#" class="link">Patrick Pool</a>
                        <p>Phasellllus porta. Fusce suscipit varius mium.</p>
                    </div>
                </div>
                <div class="grid_3">
                    <div class="thumb">
                        <img src="images/page2_img5.jpg" alt="">
                        <a href="#" class="link">Jessica Priston</a>
                        <p>Sociis totdnat ibus et magis dis parturient.</p>
                    </div>
                </div>                                               
            </div>
            <div class="container_12">
                <div class="grid_12">
                    <div class="divider"></div>
                </div>
            </div>
            <div class="container_12">
                <div class="grid_12 center">
                    <h2>What we offer</h2>
                </div>
            </div>
            <div class="container_12">
                <div class="grid_4">
                    <div class="box1">
                        <a href="#" class="circle col5">01</a>
                        <div><a href="#">Vestibulum liorta vel, <br>scelerisque</a></div>
                        <p>Vestibululis lacinia est. Proin dict um elementum velit. Fusce euism consequat ante lorem.</p>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="box1">
                        <a href="#" class="circle col6">02</a>
                        <div><a href="#">Malesuada at, neque <br>vivamus eget</a></div>
                        <p>Dolor sit amet, constetuer adipiscing elit. Pelleesque sed dolor. Aliquam congue. </p>
                    </div>
                </div>
                <div class="grid_4">
                    <div class="box1">
                        <a href="#" class="circle col7">03</a>
                        <div><a href="#">Aenean necibulum ante <br>ipsum primis in</a></div>
                        <p>Aenean non ummy hendreriaur. Phasellllus. porta. Fusce suscipit varius mium sociis totdnat.</p>
                    </div>
                </div>                         
            </div>
        </div>
    </div>
</div>
</form>

<!--=======footer=================================-->

 <footer>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/Footer.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </footer>
</body>
</html>

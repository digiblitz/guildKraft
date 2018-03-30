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
     <title>Our Products</title>
     <meta charset="utf-8">
     <meta name = "format-detection" content = "telephone=no" />
     <link rel="icon" href="images/favicon.ico" type="image/x-icon">
     <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
     <link rel="stylesheet" href="css/style.css">
     <link rel="stylesheet" href="css/font-awesome.css">
     <link rel="stylesheet" href="css/stuck.css">
     <link rel="stylesheet" href="css/touch_styles.css">      
     <script src="js/jquery.js"></script>
     <script src="js/touchTouch.jquery.js"></script>     
     <script src="js/jquery-migrate-1.2.1.js"></script>
     <script src="js/jquery.easing.1.3.js"></script>
     <script src="js/script.js"></script>
     <script src="js/jquery.equalheights.js"></script>
     <script src="js/jquery.ui.totop.js"></script>     
     <script src="js/superfish.js"></script>
     <script src="js/tmStickUp.js"></script>
     <script src="js/jquery.mobilemenu.js"></script>
     <script src="js/sForm.js"></script>     
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
                $('.magnifier').touchTouch();
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
        <div class="p14">
            <div class="container_12">
                <div class="grid_12 center">
                    <h2>Our Products</h2>
                </div>
            </div>
            <div class="container_12">
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big1.jpg" class="magnifier">
                        <img src="images/page3_img1.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Vestibulum liorta vel</a>
                        <p>Lorem ipsum dolor sit amet, consec tetuern elit raesen.</p>
                        </div>
                    </div>                         
                </div>
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big2.jpg" class="magnifier">
                        <img src="images/page3_img2.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Malesuada at neque vivam</a>
                        <p>Vestibulummoles lacus. <br>Aeean non ummy hendrerit.</p>
                        </div>
                    </div>                         
                </div>
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big3.jpg" class="magnifier">
                        <img src="images/page3_img3.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Vivamus eget nibhiam cur</a>
                        <p>Phasellus porta. Fusce suscipit varius mium sociis natoque.</p>
                        </div>
                    </div>                         
                </div>                                
            </div>
            <div class="container_12">
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big4.jpg" class="magnifier">
                        <img src="images/page3_img4.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Cras eleifend consectetur</a>
                        <p>Amet, consec tetuern elit raesen vestibulummoles.</p>
                        </div>
                    </div>                         
                </div>
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big5.jpg" class="magnifier">
                        <img src="images/page3_img5.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Curabitur sollicitudin ornare</a>
                        <p>Fusce suscipit varius mium soci natoque peatibus et magnis.</p>
                        </div>
                    </div>                         
                </div>
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big6.jpg" class="magnifier">
                        <img src="images/page3_img6.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Phasellus magna dolor</a>
                        <p>Peatibus et magnis diseme part urient montes nascetur.</p>
                        </div>
                    </div>                         
                </div>                                
            </div>
            <div class="container_12">
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big7.jpg" class="magnifier">
                        <img src="images/page3_img7.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Phasellus non eros ut ante</a>
                        <p>Magnis diseme parturient mon tes nascetur ridiculus mus. </p>
                        </div>
                    </div>                         
                </div>
                <div class="grid_4">
                    <div class="thumb1">
                        <a href="images/big8.jpg" class="magnifier">
                        <img src="images/page3_img8.jpg" alt=""></a>
                        <div class="capture">                      
                        <a href="#" class="link">Integer dictum lorem</a>
                        <p> Nulla dui. Fusce feugiat mol estie lacui irhs non ummy.</p>
                        </div>
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

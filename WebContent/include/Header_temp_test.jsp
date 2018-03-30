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
	 <link rel="stylesheet" href="css/contact-form.css"/>
   
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/jquery.matchHeight-min.js"></script>
    <script src="js/sForm.js"></script>
	 <script src="js/TMForm.js"></script>
	  <script src="js/modal.js"></script>
    <script src="js/camera.js"></script>
	<script type="text/javascript" charset="utf-8" src="js/jquery.leanModal.min.js"></script>
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
	<script>
	function loginValid(){
	if(document.loginform.textfield.value=="" && document.loginform.textfield2.value==""){
	//alert("Please Enter Username and Password");
	document.loginform.textfield.focus();
    document.loginform.textfield2.focus();
	document.getElementById("userpass").innerHTML = "User Name and Password can't be empty";
	
 return false;
	}
	else
	{
	document.loginform.textfield.focus();
    document.loginform.textfield2.focus();
	document.getElementById("userpass").innerHTML = "";
	}
	if(document.loginform.textfield.value=="")
{//alert("User Name can't be empty");
 document.loginform.textfield.focus();
 document.getElementById("username").innerHTML = "User Name can't be empty";
 return false;}
 else 
{//alert("User Name can't be empty");
 document.loginform.textfield.focus();
 document.getElementById("username").innerHTML = "";
}
 
if(document.loginform.textfield2.value=="")
{//alert("Password can't be empty");
 document.loginform.textfield2.focus();
 document.getElementById("password").innerHTML = "Password can't be empty";
 return false;}
  else 
{//alert("User Name can't be empty");
 document.loginform.textfield2.focus();
 document.getElementById("password").innerHTML = "";
 
}
	return true;}
		</script>
	
	<script src="js/script.js"></script>
<script type="text/javascript">
//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.loginform.textfield.value!="" && document.loginform.textfield.value.indexOf(' ')!=0)
	{

   var chsUserName=document.loginform.textfield.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?cmd=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   
   
   
    /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText == "false")
		{
			alert("User Name doesn't Exists!");
			document.loginform.textfield.value="";
			document.loginform.textfield.focus();
			
		}
		      
    } 
   </script>
   <script type="text/javascript">
$(function(){
  $('#loginform').submit(function(e){
    return true;
  });
  
  $('#modaltrigger').leanModal({ top: 110, overlay: 0.45, closeButton: ".hidemodal" });
});
</script>

<script  type="text/javascript">

//-------------function for doublespace validation -----------------------------
var str="";
function Dospace(str){
if(str.indexOf("  ")!=-1)
{return true;}
else {return false;}
}

function myvalidate()
{

if(document.loginform.textfield.value=="")
{alert("User Name can't be empty");
 document.loginform.textfield.focus();
 return false;}
 
 if(Dospace(document.loginform.textfield.value))
     { alert("Enter Valid Username");
       document.loginform.textfield.focus();
   return false; }

if(document.loginform.textfield2.value=="")
{alert("Password can't be empty");
 document.loginform.textfield2.focus();
 return false;}
 
 if(Dospace(document.loginform.textfield2.value))
     { alert("Enter Valid Password");
       document.loginform.textfield2.focus();
   return false; }
   
   
  
return true;
 
 }
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
	
	<style type="text/css">
/** resets **/
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
  margin: 0;
  padding: 0;
  border: 0;
  font-size: 100%;
  font: inherit;
  vertical-align: baseline;
  outline: none;
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
html { height: 101%; }
a.anchorStyle{ 
	font-size:small;
	
}
body { 
  background: #f0f0f0 url('images/bg.gif'); 
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  color: #313131;
  font-size: 62.5%; 
  line-height: 1; 
}

::selection { background: #a4dcec; }
::-moz-selection { background: #a4dcec; }
::-webkit-selection { background: #a4dcec; }

::-webkit-input-placeholder { /* WebKit browsers */
  color: #ccc;
  font-style: italic;
}
:-moz-placeholder { /* Mozilla Firefox 4 to 18 */
  color: #ccc;
  font-style: italic;
}
::-moz-placeholder { /* Mozilla Firefox 19+ */
  color: #ccc;
  font-style: italic;
}
:-ms-input-placeholder { /* Internet Explorer 10+ */
  color: #ccc !important;
  font-style: italic;  
}

br { display: block; line-height: 2.2em; } 

article, aside, details, figcaption, figure, footer, header, hgroup, menu, nav, section { display: block; }
ol, ul { list-style: none; }

input, textarea { 
  -webkit-font-smoothing: antialiased;
  -webkit-text-size-adjust: 100%;
  -ms-text-size-adjust: 100%;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  outline: none;

}
input.button-add {
    background-image: url(images/bg1.jpg); /* 16px x 16px */
    background-color: transparent; /* make the button transparent */
    border: none;           /* assuming we don't want any borders */
    cursor: pointer;        /* make the cursor like hovering over an <a> element */
    height: 20px;           /* make this the size of your image */
    vertical-align: top; /* align the text vertically centered */
	font-weight:600;
		
}
blockquote, q { quotes: none; }
blockquote:before, blockquote:after, q:before, q:after { content: ''; content: none; }
strong { font-weight: bold; } 

table { border-collapse: collapse; border-spacing: 0; }
img { border: 0; max-width: 100%; }

#topbar {
  background: #4f4a41;
  padding: 10px 0 10px 0;
  text-align: center;
}

#topbar a {
  color: #fff;
  font-size:1.3em;
  line-height: 1.25em;
  text-decoration: none;
  opacity: 0.5;
  font-weight: bold;
}

#topbar a:hover {
  opacity: 1;
}

/** typography **/
h1 {
  font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-size: 2.5em;
  line-height: 1.5em;
  letter-spacing: -0.05em;
  margin-bottom: 20px;
  padding: .1em 0;
  color: #444;
	position: relative;
	overflow: hidden;
	white-space: nowrap;
	text-align: center;
}
h1:before,
h1:after {
  content: "";
  position: relative;
  display: inline-block;
  width: 50%;
  height: 1px;
  vertical-align: middle;
  background: #f0f0f0;
}
h1:before {    
  left: -.5em;
  margin: 0 0 0 -50%;
}
h1:after {    
  left: .5em;
  margin: 0 -50% 0 0;
}
h1 > span {
  display: inline-block;
  vertical-align: middle;
  white-space: normal;
}

p {
  display: block;
  font-size: 1.35em;
  line-height: 1.5em;
  margin-bottom: 22px;
}

.center { display: block; text-align: center; }


/** page structure **/
#w {
  display: block;
  width: 750px;
  margin: 0 auto;
  padding-top: 30px;
}

#content {
  display: block;
  width: 100%;
  background: #fff;
  padding: 25px 20px;
  padding-bottom: 35px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px 0px;
}


.flatbtn {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #f3faef;
  text-decoration: none;
  background-color: #6bb642;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.2em;
  font-weight: bold;
  padding: 12px 22px 12px 22px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  -moz-box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
  box-shadow: 0 1px 0 rgba(15, 15, 15, 0.3);
}
.flatbtn:hover {
  color: #fff;
  background-color: #73c437;
}
.flatbtn:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}

/** custom login button **/
.flatbtn-blu { 
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
  display: inline-block;
  outline: 0;
  border: 0;
  color: #edf4f9;
  text-decoration: none;
  background-color: #4f94cf;
  border-color: rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.1) rgba(0, 0, 0, 0.25);
  font-size: 1.3em;
  font-weight: bold;
  padding: 12px 26px 12px 26px;
  line-height: normal;
  text-align: center;
  vertical-align: middle;
  cursor: pointer;
  text-transform: uppercase;
  text-shadow: 0 1px 0 rgba(0,0,0,0.3);
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  -moz-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
}
.flatbtn-blu:hover {
  color: #fff;
  background-color: #519dde;
}
.flatbtn-blu:active {
  -webkit-box-shadow: inset 0 1px 5px rgba(0, 0, 0, 0.1);
  -moz-box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
  box-shadow:inset 0 1px 5px rgba(0, 0, 0, 0.1);
}


/** modal window styles **/
#lean_overlay {
    position: fixed;
    z-index:100;
    top: 0px;
    left: 0px;
    height:100%;
    width:100%;
    background: #000;
    display: none;
}


#loginmodal {
  width: 300px;
  padding: 15px 20px;
 background-color:#fffff5;
  -webkit-border-radius: 6px;
  -moz-border-radius: 6px;
  border-radius: 6px;
  -webkit-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  -moz-box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
  box-shadow: 0 1px 5px rgba(0, 0, 0, 0.5);
}

#loginform { /* no default styles */ }

#loginform label { display: block; font-size: 1.5em; font-weight: 400; color: #000000; margin-bottom: 3px; }


.txtfield { 
  display: block;
  width: 100%;
  padding: 6px 5px;
  margin-bottom: 15px;
  font-family: 'Helvetica Neue', Helvetica, Verdana, sans-serif;
  color: #7988a3;
  font-size: 1.4em;
  text-shadow: 1px 1px 0 rgba(255, 255, 255, 0.8);
  background-color: #fff;
  background-image: -webkit-gradient(linear, left top, left bottom, from(#edf3f9), to(#fff));
  background-image: -webkit-linear-gradient(top, #edf3f9, #fff);
  background-image: -moz-linear-gradient(top, #edf3f9, #fff);
  background-image: -ms-linear-gradient(top, #edf3f9, #fff);
  background-image: -o-linear-gradient(top, #edf3f9, #fff);
  background-image: linear-gradient(top, #edf3f9, #fff);
  border: 1px solid;
  border-color: #abbce8 #c3cae0 #b9c8ef;
  -webkit-border-radius: 4px;
  -moz-border-radius: 4px;
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.25), 0 1px rgba(255, 255, 255, 0.4);
  -webkit-transition: all 0.25s linear;
  -moz-transition: all 0.25s linear;
  transition: all 0.25s linear;
}

.txtfield:focus {
  outline: none;
  color: #525864;
  border-color: #84c0ee;
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  -moz-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), 0 0 7px #96c7ec;
}


</style>
 <%
	   
  String sessLogId = (String) session.getAttribute("sessionId");
  String chkLogout = (String) request.getAttribute("logout");
    

 

  
  System.out.println("chkLogout==="+chkLogout);
  
  if(sessLogId!=null){
   session.removeAttribute("sessionId");
            session.removeAttribute("userId");
            session.removeAttribute("userCode");
            session.removeAttribute("firstName");
            session.removeAttribute("userTypeName");
            session.removeAttribute("emailId");
            session.removeAttribute("memberId");
   response.setHeader("Cache-Control", "no-cache");
  response.sendRedirect("login.jsp"); 
  }
  
  
  %>
</head>

<body>

<!--========================================================
                          HEADER
=========================================================-->
<header id="header">
    <div class="container">
        <div class="row">
            <div class="grid_12">
                <div class="put-left logo-caption">
                    <h1>
                        <a href="frmHome.jsp"><img src="images/dBguildLogo.png" alt="" width="300px" height="50px">      </a>             </h1>

                   
                </div>


                <div class="put-right caption">
                    <p class="color_4">Want to know more?<br/>
                        <img src="images/email-icon.png" alt="" width="16px" height="15px">&nbsp;Reach us at:
						<span class="color_2">info@digiblitz.com</span>                  
						 </p>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>

    <div>
        <div class="container">
            <div class="row">
                <div class="grid_12">

                    <div class="put-right social-list">
                        <ul>
						<li><a href="#loginmodal" id="modaltrigger" style="font-size: 17px; background: #cc0001; color: #fff;  padding: 20px 30px 20px 26px; font-family: 'Roboto Condensed', sans-serif; font-weight: bold;  text-transform: uppercase;">Sign In</a></li>
                            <li class="color_1">
                                <a href="https://www.facebook.com/digiblitz" target="_blank" class="fa fa-facebook"></a>
                            </li>
                            <li class="color_1">
                                <a href="https://twitter.com/digiBlitz" target="_blank" class="fa fa-twitter"></a>
                            </li>
							
                            <li class="color_1">
                                <a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" class="fa fa-linkedin"></a>
                            </li>
							<li class="color_1">
								<a href="#" target="_blank"><img src="images/blogger.png" style="width:19px; height:19px; margin-bottom:-2px;"></a>
							</li>
							
                        </ul>
						 
                    </div>

                    <div class="border-wrapper">
                        <nav class="put-left header-menu">
                            <ul class="sf-menu">
                                <li>
                                    <a href="frmHome.jsp">Home</a>                                </li>
                                
                                <li>
                                    <a href="whyGuildKraft.jsp">Why GuildKraft?</a>                                </li>
                                <!--li>
                                    <a href="index-3.html">Visitors</a>                                </li>
                                <li>
                                    <a href="index-4.html">Events</a>                                </li-->
								<li>
                                    <a class="second" href="pricing.jsp">Product Pricing</a>
                                    <!--ul>
                                        <li>
                                            <a href="#">History</a>                                        </li>
                                        <li>
                                            <a href="#">News</a>
                                            <ul>
                                                <li>
                                                    <a href="#">Latest</a>                                                </li>
                                                <li>
                                                    <a href="#">Archive</a>                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                            <a href="#">Testimonials</a>                                        </li>
                                    </ul-->
                                </li>
                                <li>
                                    <a href="frmContacts.jsp">Contact Us</a>                                </li>
								
								
                            </ul>
                        </nav>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
    </div>
</header>
<div id="loginmodal" style="display:none;" class="bg1" >
  <label style="size:25px" align="center"><p style="font-weight:600">User Login</p><span style="color:#FF0000;" id="userpass"></span></label>
      <form id="loginform" name="loginform" method="post" action="login.html?cmd=initDash" onSubmit="return loginValid(this);">
	 	  
    <div align="left" style="size:25px"><label>Username:</label><span style="color:#FF0000;" id="username"></span>
	
	  <%
			String status = (String) request.getAttribute("status");
            if (status != null) {
                if (status.equals("fail")) {%>
				
	<div class="styleError">Invalid Login! Try logging in again.</div>
	<%} else if (status.equals("expired")) {%>
	<div class="styleError">License Expired.</div>
	 <% } else if (status.equals("conFailed")) {%>
	 <div class="styleError">Connection Problem ! Please Login Again.</div>
	 <% } else if (status.equals("users")) {%>
	 <div class="styleError">Licensed Users Exceeded.</div>
	 <% }else if (status.equals("empty")){
		 System.out.println("empty page");%>
		 <div class="styleError">Please Enter Username and Password</div>
		 <% }} %>
	 
	</div>
      <input type="text" name="textfield" id="textfield" class="txtfield" tabindex="1" onBlur="usrStat();">
      
        <div align="left"  style="size:25px"><label>Password:</label><span style="color:#FF0000;" id="password"></span></div>
      <input type="password" name="textfield2" id="textfield2" class="txtfield" tabindex="2">
      
      <div class="center">
	  <label><img src="images/register_button.jpg" alt="" width="20px" height="20px" style="cursor:pointer"/>
	  <input type="submit" name="Submit" id="loginbtn"  value="Sign In" tabindex="3" class="button-add"></label>
	  </div>
	
	  
	  <div align="center" style="margin-top:10px">
	  <!--a href="user.html?cmd=initUsr" style="color:#0000FF" class="anchorStyle">New user signup</a-->
	  <a href="user.html?cmd=initUsrReg" style="color:#0000FF" class="anchorStyle">New user signup</a>
	   &emsp;&emsp;&emsp;
	  <a href="user.html?cmd=view" style="color:#0000FF" class="anchorStyle">Forget password?</a>
	  </div> 

    </form>
  </div>
  </body>
  </html>

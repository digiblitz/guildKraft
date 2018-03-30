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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lavlita Chat</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="jsp/LavlitaChatApp/css/chat.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>


<script src="jsp/LavlitaChatApp/js/chatScript.js" type="text/javascript"> </script>

<!--link rel="stylesheet" href="jsp/LavlitaChatApp/css/jquery-ui.min.css">-->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!--script  src="jsp/LavlitaChatApp/js/jquery-ui.js" type="text/javascript"></script>-->
<style>
#btn-ok{
    overflow: hidden;
}

</style>



<script type="text/javascript">

 $('document').ready(function(){ 
 var fname = null;
 var lname = null;
 var email = null;
	
	$('#fname').blur(function(){
	
    if( $(this).val() ) {
          document.getElementById("name").innerHTML = "";
    }
	});
	$('#lname').blur(function(){
    if( $(this).val() ) {
          document.getElementById("name1").innerHTML = "";
    }
	});
	$('#email').blur(function(){
	if( $(this).val() ) {
		var emailval=document.getElementById("email").value;
		//alert("email check"+emailval);
		validateForm(emailval);
		//alert(test);
		//if(test==true){
			
          
		}
    
	});
		
	$("#beginchat").click(function(){
		
		
		fname=document.getElementById("fname").value;
		lname=document.getElementById("lname").value;
		email=document.getElementById("email").value;
		
		$.get('login.html?cmd=lavlitaChatCRM', {
			fname : fname,
        	lname : lname,
        	email : email,			
        }, function(response) {			
        	       
        });	
		
				
			if($('#fname').val().length ==0){
				//alert('Firstname cannot be left blank');
				
				document.getElementById("name").innerHTML = "First Name cannot be empty";
				$('#fname').focus();
			}
			if($('#lname').val().length ==0){
			//alert('Email cannot be left blank');
				
				document.getElementById("name1").innerHTML = "Last Name cannot be empty";
				$('#lname').focus();
			} 
			if($('#email').val().length ==0){
			//alert('Email cannot be left blank');
				
				document.getElementById("mail").innerHTML = "Email cannot be empty";
				$('#email').focus();
			} 
			else{
				$("#chatbox").show();
				$("#formbox").hide();
				reset_main_timer();
			}
	});
	
	
	
		$('input').on('focusin', function() {
				  $(this).parent().find('label').addClass('active');
				});

		$('input').on('focusout', function() {
		  if (!this.value) {
			$(this).parent().find('label').removeClass('active');
		  }
		});
	//var myVar= setInterval(alertFunc, 3000);
	$('.textarea').keypress(
        function(e){
            //alert(e.keyCode);
			
            if (e.keyCode == 13) {
               // alert("Thats a Press");
			   //clearInterval(myVar);
                var msg = $(this).val();
				//alert(msg);
                $(this).val('');
                if(msg!=''){
					
                    $("<div class='self'><div class='avatar'><img src='jsp/LavlitaChatApp/images/user.png' draggable='false'/></div><div class='msg'><div class='msg_b'>"+msg+"</div></div></div></br>").insertBefore('.msg_insert');
                $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
				//alert("before send test");
				//alert(name);
				sendUserRequest(fname,lname,msg,email);
                //getLavlitaResponse(msg,email);
				//alert("test");
				// setInterval(alertFunc, 3000);
				
				}
				
    			//sendResquest(msg);
            }
        });
		
		/*$("#back").click(function(){
		//$("#chatbox").show();
		//$("#formbox").hide();
		//name=document.getElementById("fname").value;
		//email=document.getElementById("email").value;
		//alert(fname+lname+email);
		sendChatHistory(fname,lname,email);
		});
		
		$("#close").click(function(){
		//$("#chatbox").show();
		//$("#formbox").hide();
		//name=document.getElementById("fname").value;
		//email=document.getElementById("email").value;
		//alert(fname+lname+email);
		sendChatHistory(fname,lname,email);
		});
		
	

		window.onmousemove =  function(){
			
			  reset_main_timer();
		}
		window.onkeypress = function(){
			 reset_main_timer();
		}
		*/
		window.onbeforeunload = function() {
		
			sendChatHistory(fname,lname,email);
          return "Did you save your stuff?";
      
	  }
	 
		
		
			
  });
	
	
    
  

  </script>
 <script>

function myFunction() {
    //alert("You pressed a key inside the input field");
	 reset_main_timer();
}

function deleteAllCookies() {
	//alert("inside cookie function");
    var cookies = document.cookie.split(";");
	//alert(cookies);

    for (var i = 0; i < cookies.length; i++) {
        var cookie = cookies[i];
		//alert(cookie);
        var eqPos = cookie.indexOf("=");
        var name = eqPos > -1 ? cookie.substr(0, eqPos) : cookie;
		//alert(name);
        document.cookie = name + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT";
    }
}
  </script>
  
  <!--script>
  $.sessionTimeout({
			warnAfter:3000,
			redirAfter:5000
		});
  </script>-->
  <script>
		var main_timer = 0;
		var sub_timer = 0;
		var interval_time = 0;
   function dialog_set_interval(){
		
	
	  var user_activity = $('#user_activity').val();
	  //alert('user_loged_in 1 '+user_loged_in);
	  //document.getElementById("time_show").innerHTML = " ";
	  
		
		
		
		 
        main_timer = setTimeout(function(){
			//alert("inside dialog set"+user_loged_in);
		
            if(user_activity == "active"){
				//alert(" your session will be closed in 3s");
				$("#warning").show();
				
				document.getElementById("time_show").innerHTML = "";
				//setInterval(handler,1000);
				var sec = 60;
				var min = 1;
				
				interval_time = setInterval(function(){
					
					sec--;
					  if (sec == 0) {
						sec=60;
						min--;
						//if (min == 60) min = 0;
					  }
					  document.getElementById("time_show").innerHTML = (min < 10 ? "0" + min : min) +"m"+ ":" + (sec < 10 ? "0" + sec : sec)+"s";
				} , 1000);
				
				/*var time = setInterval(function(){
					alert("timer");
					$("#m_timer").countdowntimer({
								minutes : 2‚
								size : "lg"
					});
				});*/
                sub_timer = setTimeout(function(){
                    $("#user_activity").val("inactive");
						// alert('user_loged_in 2 '+user_loged_in);
						 clearInterval(interval_time);
						  $("#warning").hide();
						
						var fname = $("#fname").val();
						var lname = $("#lname").val();
						var email = $("#email").val();
						//alert('fname '+fname+' lname '+lname+'email '+email  );
						sendChatHistory(fname,lname,email);
						
						//$("#popup1").show();
						location.href = "#sessionpopup1";
						window.onbeforeunload=false;
						deleteAllCookies();
								
                },120000);
           }else{
			  // alert('user_activity end '+user_activity);
					window.location.assign("frmContacts.jsp");
		   } 
        },480000);
		//frmContacts.jsp
		
    }
   function reset_main_timer(){
	  
	   //clearInterval(interval_time);
	  $("#warning").hide();
	  
        clearInterval(main_timer);
		 clearInterval(interval_time);
		clearTimeout(sub_timer);
		
		  dialog_set_interval();
	
	    
      
		
    }
	
	
	
		
  </script>
  
  <script>
   function validateForm(emailval) {
    var x = emailval;
	
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if(re.test(x)== true){
		
		document.getElementById("mail").innerHTML = " ";	
    }else{
		
		 document.getElementById("mail").innerHTML = "Not a valid e-mail address";
		  $('#email').focus();
		
	}
				
};
  
  </script>
  
  
  
<!--   <script>

  function showvalue(){
			alert("test");
			var message=document.getElementById("message").value;
			//var message=message;
			alert(message);
			windows.location.href("sample.html?cmd=initchat&message='message'");
		}

			var sec = 60;
		var min = 2;
	var handler = function() {
		
		
	  sec--;
	  if (sec == 0) {
		sec=60;
		min--;
		//if (min == 60) min = 0;
	  }
	  document.getElementById("time_show").innerHTML = (min < 10 ? "0" + min : min) + ":" + (sec < 10 ? "0" + sec : sec);
	};
	handler();		
  </script> -->
  
<style>
#chatbox{
	display:none;
	overflow:auto;
}
#warning{
	display:none;
}
.name{
	width:100%;
}


.session-overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
  opacity: 0;
}
.session-overlay.session-open:target {
  visibility: visible;
  opacity: 1;
}



.session-popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}


.session-popup {
  margin: 70px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 30%;
  position: relative;
  transition: all 5s ease-in-out;
}

.session-popup .session-close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color: #333;
}

 
.session-popup .session-close:hover {
  color: #06D85F;
}
.session-popup .session-content {
  max-height: 30%;
  overflow: auto;
}

@media screen and (max-width: 700px){
  .box{
    width: 100%;
  }
  .popup{
    width: 100%;
  }
}



</style>
</head>
<body>

		<div class="menu">
            <div class="back"><a href="frmContacts.jsp" id="back"><i class="fa fa-chevron-left" style="color:#fff;margin-top:10px;"></i> <img src="jsp/LavlitaChatApp/images/lavlita.png" draggable="false"/></a></div>
            <div class="name">Chat with Lavlita.AI</div>
            <!--div class="last">18:09</div>-->
			<div class="closechat" style="float:right" ><a href="frmContacts.jsp" id="close"><i class="fa fa-times" style="color:#fff;margin-top:10px;"></i></a></div>
			

        </div>
		
		<div id = "warning" >
		<div style="padding:40px 10px;line-spacing:0.5px;font-size:15px;">
            <div class= "alert alert-danger">
			<strong>Sorry, due to inactivity the chat session will end after <span id="time_show"></span></strong>
			</div>

        </div>
		</div>
		
<div id="formbox" >
    <div class="chat">
	
		<div class="wrap">
			  <h1>Chat with Lavlita.AI</h1>
			  <h3>Fill up the details to begin the chat</h3>
			  <div>
				<label for="fname">First Name</label>
				<input id="fname" type="text"  class="cool"/>
				<span id="name" style="color:red"></span>
			  </div>
			  
			  <div>
				<label for="lname">Last Name</label>
				<input id="lname" type="text" class="cool"/>
				<span id="name1" style="color:red"></span>
			  </div>

			  <div>
				<label for="email">Email</label>
				<input id="email" type="text"  class="cool"/>
				<span id="mail" style="color:red"></span>
			  </div>
			
			
			<div>
			<input type="submit"   class="cool" name="beginchat" id="beginchat" value="Begin Chat">
			</div>
			</div>
		</div>

	</div>
	
	<div id="chatbox">
	<div id="scroll">
		<div class="chat">
			
			
				<div class="other">
					<div class="avatar"><img src="jsp/LavlitaChatApp/images/lavlita.png" draggable="false"/></div>
						<div class="msg">
							<div class="msg_a">
								<p>Hi,I am lavlita.</p>
								<p>How can i Help You.</p>
							</div>	
							
						</div>				
					</div>		
						<!--button name="beginchat" id="beginchat">Begin Chat</button>-->
			
			<input id="user_activity" name="user_activity" type="hidden" value="active" />

			<input id="user_loged_in" name="user_loged_in" type="hidden" value="true" />
				
									
									
                    
				<!-- div><!--%=message %></div> -->
					<!-- %}else{
						%>
						<!--p> No search result found .. Contact You Shortly</p>-->
					<!-- % }%> -->
					
				
							<div class="msg_insert" ></div>
							<!--div id="CountDownHolder"></div>-->
							
						
                    
                    
		</div>
		
	

                 
			<!--div class="chattextbox"></div>-->
			<input name="message" id="message" class="textarea" placeholder="Type a message..." rows="10" cols="40" onkeypress="myFunction()"><!--i class="fa fa-paper-plane" aria-hidden="true"></i>-->
			
			
			
			
			<!--button type="submit" name="enter" onClick="showvalue();">Enter</button>-->
			
			
			
			
	  </div>
	</div>
	
	
	<!--div id="inactivity_warning" class="modal hide fade" data-backdrop="static" style="top:30%">
  <div class="modal-header">
    <button type="button" class="close inactivity_ok" data-dismiss="modal" aria-hidden="true">&times;</button>
  </div>
  <div class="modal-body">
    <div class="row-fluid">
      <div id="custom_alert_message" class="span12">
       You will be logged out in 5 minutes due to inactivity. Please save your credit 
       application if you have not already done so.
     </div>
   </div>
  <div class="modal-footer">
    <a href="javascript:void(0)" class="btn inactivity_ok" data-dismiss="modal" aria-hidden="true">O.K</a>
   </div>
  </div>
</div>-->


		<div id="sessionpopup1" class="session-overlay session-open" style="background: rgba(0, 0, 0, 0.709804); display: block;">
	<div class="session-popup" >	
		<h2>Your Session has been closed!</h2>
		<a class="session-close" href="frmContacts.jsp">&times;</a>
		<div class="session-content">
			Thank you for visiting us.
		</div>
	</div>
</div>

</body>
</html>

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
    <%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Klugwerks</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/changePassword.js" type="text/javascript" ></script>
<script type="text/javascript">

      
 
        $(document).ready(function(){  
           $(".menu li a").each(function() { 

               if ($(this).next().length > 0) { 

                   $(this).addClass("parent");  
               };  
           })  
           var menux = $('.menu li a.parent');  
           $( '<div class="more"><img src="btn-hamburger.png" alt=""></div>' ).insertBefore(menux);  
           $('.more').click(function(){  
                $(this).parent('li').toggleClass('open');  
           });  
           $('.menu-btn').click(function(){  
              $('nav').toggleClass('menu-open');  
          });  
       });  
    
	function dothat() {  
	alert("aaa");
   var div = document.getElementById('fileuploads');  
    var field = div.getElementsByTagName('input')[0];  
      
    div.appendChild(document.createElement("br"));  
    div.appendChild(field.cloneNode(false));  
}

     </script>
</head>





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
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>File Upload</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
   

       <FORM ENCTYPE="multipart/form-data" class='form-horizontal' role='form' ACTION="ExterApp.html?process=uploaddocument&userId=<%=userId%>" METHOD=POST name="uploadfile">
 

						  <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Choose the Document To Upload:</label>
                                  <div class='col-md-8'>
                                      <div class='col-md-3 indent-small'>
                                         <div class='form-group internal' id="fileuploads">
		   									<INPUT NAME="file" TYPE="file" multiple="muliple" required/>
											<button class='btn-sm btn-primary' type="button" name="addmore" id="addmore" value="Add More" onClick="dothat();" >Add More</button>
										</div>
									</div>
								</div>
							</div>
							
							
								 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit' value="Send File">Send File</button>
                                    </div>
                                    <div class='col-md-2'>
                                       <button class='btn-lg btn-danger' name="button" type="button" style='' onClick="javascript:history.back(-1);" value="Cancel">Cancel</button>
                                    </div>
                                </div>
								
    					 </FORM>
	 
	 						 <%
								String status=(String)request.getAttribute("status");
                                                                System.out.println("status from jsp :"+status);
																
																
									
								
									if( status!=null && status.equalsIgnoreCase("success"))
									{%>
									<div col-md-offset-2>
									<p>File Uploaded Successfully</p>
									</div>
									<%}%>
          
            
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

<script type="text/javascript">


function onValidate()
{
	if(document.uploadfile.file.value==""){
		alert("File name cannot be empty");
		document.uploadfile.file.focus();
		return false;
	}
	
	return true;
}
</script>
</html>

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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


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
			
			<%
				String source = (String) request.getAttribute("source");
				String eventTypeId = (String)request.getAttribute("eventTypeId");
				String compYear = (String)request.getAttribute("compYear");
				String regBtn = "";
				String noBtn = "";
				if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
					regBtn = "MemberUsrSignUp.do?process=usrReg&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
					noBtn = "MemberUsrSignUp.do?process=view&source=fromEventEntry&eventTypeId="+eventTypeId+"&compYear="+compYear;
				}else{
					//regBtn = "MemberUsrSignUp.do?process=usrReg";
					regBtn = "MemberUsrSignUp.do?process=usrEmpReg";
					noBtn = "MemberUsrSignUp.do?process=view";
				}
			  %>

            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Membership</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
                          

   
              
              	  <label class='control-label'> No match is found in our system. Please search again or register as a new member.</label>
                   
                   <p> IMPORTANT  -- If you are a previous or current member, do not create a new member account.
                  If you need help logging in, please contact us at  <a href="mailto:anandv@digiblitz.com">info@digiblitz.com</a> 
                  or call (xxx) xxx-xxxx
                  </p>
                 
                 <div class='form-group'>
                     	<div class='col-md-offset-4 col-md-1'>
                            <button class='btn-lg btn-primary'name="button" type="button" value="Yes, Register Me" onclick="location.href='<%=regBtn%>'">Yes, Register Me</button>
                            </div>
							
                         <div class='col-md-2'>
                           <button class='btn-lg btn-danger' name="button2" type="button" value="No, Try Again" onclick="location.href='<%=noBtn%>'">No, Try Again</button>
                         </div>
                 </div>
                   

  	
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

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
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmMeeEduActRecap.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>

<script>
    function cancelAddArtifact(mainArtiId)
    {
        if(confirm("Do you want to Cancel and go back to List Page?"))
	{
        strURL = "./artifactMapping.html?artiMapProcess=artifactList&mapId="+mainArtiId;
	window.location.href = strURL;
        }
	else
	{
		return;
	}
    }
	
	function clearFields(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.subArtiName.value = "";
		}

		
	}
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
                            <h2> Sub Artifact: Create </h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
       		 <p> You can create a New Sub Artifact for all members and non-members Online Services Dashboard, right here! </p>
          
					 <% 
					 String mainArtiId="";
					 String mainArtifactName=(String) request.getAttribute("mainArtifactName");
						   mainArtiId=(String) request.getAttribute("mainArtiId");
					%>
         
		  <form class='form-horizontal' role='form' name="frmRoleMgtRolePrev" id="frmRoleMgtRolePrev" action="artifactMapping.html" onsubmit="return formValidate(this);">
            <input type="hidden" name="artiMapProcess" value="createArtifact"/>
            <input type="hidden" name="mainArtiId" value="<%=mainArtiId%>"/>
            
			<p> Fields marked with an asterisk (<span style="color:#FF0000">*</span>) are required. </p>
            
            			<%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
							 //mainArtiId=(String) request.getAttribute("mainArtiId");
						  %>
            				<p id='p_error'>Sub Artifact already exist</p>
            
           				 <%
						  }
						  %>
						
						 <div class='form-group'>
                              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Main Artifact:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
              									<input name="mainArtiname" id="mainArtiname" type="text" class="form-control"  readonly="true" value="<%=mainArtifactName%>"/>
                 								 <span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
											
												 
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sub Artifact:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'> 
            									<input name="subArtiName" id="subArtiName" type="text" class="textboxOne" />
												<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
								</div>
						
						 		<div class='form-group'>
                                    <div class='col-md-offset-3 col-md-1'>
                                        <button class='btn-lg btn-primary' name="submit" type="submit"  value="Create">Create</button>
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-primary'  name="button" type="reset"  value="Clear" onclick = "clearFields(this.form)"style=''>Clear</button>
                                    </div>
									<div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' name="button" type="button"  value="Cancel" onclick ="cancelAddArtifact('<%=mainArtiId%>')">Cancel</button>
                                    </div>
                                </div>
		
        			  </form>
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


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
<script src="js/frmrRoleMEditValidate.js" type="text/javascript" ></script>
<script src="js/frmrRolePrevilageValidate.js" type="text/javascript" ></script>
<script>
    function cancelEditArtifact(mainArtiId)
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
	function clearField(obj)
{

	for(var i=0;i<obj.elements.length;i++)
	{
		if(obj.elements[i].type=='text')
		{
			obj.subArtifact.value = "";
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
                            <h2> Maintain Artifact: Edit</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
               <p> You can Edit/Update the Artifact created by you as given below.</p>
               
			   
					   <%
							
							String subArtifact = (String)request.getAttribute("subArtifact");
							String mainArtifactName = (String)request.getAttribute("mainArtifactName");
							String mainArtiId = (String)request.getAttribute("mainArtiId");
							String artifactId = (String)request.getAttribute("artifactId");
							System.out.print("subArtifact:" + subArtifact);
							System.out.print("mainArtifactName:" + mainArtifactName);
							
						%>
						
                      <form class='form-horizontal' role='form' name="frmRoleMgtRoleEdit" id="frmRoleMgtRoleEdit" method="post" action="artifactMapping.html" onsubmit="return formValidate(this);">
                        <input type="hidden" name="artiMapProcess"	value="editArtifact"/>
                        <input type="hidden" name="artifactId" value="<%=artifactId%>"/>
                        <input type="hidden" name="mainArtiId" value="<%=mainArtiId%>"/>
                      
					   <p> Fields marked with an asterisk (<span style="color:#FF0000" >*</span>) are required. </p>
                          
                          <%
						  	String err = request.getParameter("err");
						  	if(err!=null) {
							//String subArtifact=(String)request.getAttribute("subArtifact");
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
												   <input name="mainArtifact" id="mainArtifact" type="text" class="form-control" value="<%=mainArtifactName%>"  readonly="true"/>
											</div>
										</div>
									</div>
														                           
												   
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Sub Artifact:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                           						<input name="subArtifact" id="subArtifact" type="text" class="form-control" value="<%=subArtifact%>" />
													<span id='span_astriesk'>*</span>
											</div>
										</div>
									</div>
								</div>
								
							<div class='form-group'>
                                    <div class='col-md-offset-3 col-md-1'>
                                        <button class='btn-lg btn-primary'  name="submit" type="submit"  value="Update">Update</button>
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-primary' style='' name="button" type="reset"  value="Clear" onclick = "clearField(this.form)">Clear</button>
                                    </div>
									<div class='col-md-1'>
                                        <button class='btn-lg btn-danger' name="button" type="button"  value="Cancel" onclick ="cancelEditArtifact('<%=mainArtiId%>')"style=''>Cancel</button>
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

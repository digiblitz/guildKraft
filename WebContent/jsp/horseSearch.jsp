<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="com.hlcform.util.*" %>
<%@ page import="com.hlccommon.util.HLCHorseSearchVO" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/basic.js" type="text/javascript" ></script>
<script src="javascripts/calendar2.js" type="text/javascript"></script>
<script src="javascripts/horseSearch.js" type="text/javascript"></script>
<script src="javascripts/cscombo_new.js" type="text/javascript"></script>


 <link href="../../css/core-ie.css" type="text/css" rel="stylesheet" />
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
                            <h2>Membership:Non-Human Search/Registration Process</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
	
			<p>Please search our Non-Human member database before registering your Non-Human to prevent duplicates and incomplete competition results history.
<br/>

The Name fields will match on whatever text is entered, so if you are unsure of spelling, try partial variations.
<br/>
The Non-Human Member ID field will only return an exact match.
  

 

	
		<form name="frmCreateServType" id="frmCreateServType" method="post" action="SearchHorse.html" onSubmit="return validate(this);">
	  <input type="hidden" name="searchProcess" value="searchResult"> 
			
									<p>Search  Non-Human</p>						
							
				<div class='form-group'>
                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non-Human Name:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
								
										<input type="text" name="horseSearchName" id="horseSearchName" class="form-control" size="20" /> 
									 (Competition Name)
									</div>
							 </div>
						</div>
					
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non-Human Member Id:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
							  
										<input type="text" name="memberId" id="memberId" class="form-control" size="20" />
									</div>
								</div>
							</div>
					
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Owner First Name:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
									
									<input type="text" name="ownerName" id="ownerName" class="form-control" size="20" />
									</div>
								</div>
							</div>
							  
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Owner Last Name:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
									<input type="text" name="ownerLastName" id="ownerLastName" class="form-control" size="20" />
									</div>
								</div>
							</div>
					
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider First Name:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
									
									<input type="text" name="riderName" id="riderName" class="form-control" size="20" />
								</div>
								</div>
							</div>
									
									
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Rider Last Name:</label>
                        <div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                   <div class='form-group internal'>
					
										<input type="text" name="riderLastName" id="riderLastName" class="form-control" size="20" />
									
									</div>
								</div>
							</div>
						</div>
				  
				  
					<div class="form-group">
						<div class="col-md-offset-4 col-md-2">
							<button class='btn-lg btn-primary' type='submit'   value="Submit">Submit</button>
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

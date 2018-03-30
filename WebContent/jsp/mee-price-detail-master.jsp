<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import = "javax.sql.*" %>
<%@ page import = "java.util.*" %>

<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="javascripts/frmGrossAmtMast.js" type="text/javascript" ></script>
<script>
	
	function getMeeActivityName(selMeeCataTypeId){
	//alert(selMemTypeId);
		frmMeePriceDet.meeProcess.value = "getMeeActivity";
		frmMeePriceDet.method="post";
		frmMeePriceDet.action="./meePriceMasterList.html?meeCatagoryTyp="+selMeeCataTypeId;
		frmMeePriceDet.submit();
	}
	function getMeeSpecificationName(selMeeSpecTypeId){
		frmMeePriceDet.meeProcess.value = "getMeeSpeci";
		frmMeePriceDet.method="post";
		frmMeePriceDet.action="./meePriceMasterList.html?meeSpecificationTypID="+selMeeSpecTypeId;
		frmMeePriceDet.submit();
	}
	
	function getMeeSpecificationName(selMeeUserTypeId){
		frmMeePriceDet.meeProcess.value = "getMeeUser";
		frmMeePriceDet.method="post";
		frmMeePriceDet.action="./meePriceMasterList.html?meeMeeUserTypeId="+selMeeUserTypeId;
		frmMeePriceDet.submit();
	}


</script>


<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
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
                            <h2>Meetings: Price Detail Master</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmMeePriceMaster" id="frmMeePriceMaster" action="addPriceMasterList.html" method="post" onsubmit="return validatePriceList();" >
							
                               <input type="hidden" name="priceMasterProcess" value="addPriceMaster">
							   
							
								 <p>Add A Price Detail:</p>
							   
     <div class='form-group'>
              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Activity Category :</label>
                      <div class='col-md-8'>
                           <div class='col-md-3 indent-small'>
                                        <div class='form-group internal'>
														<select name="selMeeCataTypeId" id="selMeeCataTypeId" class="form-control" onChange="getMeeActivityName(this.value)">
														<option selected="selected">Select One</option>
											<% 
												String str1[] = null;
												Vector meeCataTypeVect=new Vector();
												  meeCataTypeVect=(Vector)request.getAttribute("meeCataTypeVect");
												  System.out.println("vector1:"+meeCataTypeVect);
												  Enumeration enm=meeCataTypeVect.elements();
												  
												  while(enm.hasMoreElements()){
														String[] s = (String[])enm.nextElement();
														for (int i=0;i<s.length; i++) {
															System.out.println("Content : "+s[i]);
														}
														String activityTypeId = s[0];
														String activityTypeName = s[1];
														
														System.out.print(" injsp:  "+activityTypeId);
														
														%>
														 <option value="<%=activityTypeId %>"><%=activityTypeName%></option>
													<%
													}
												   
														%>
														
													</select>
				 	                          <span id="span_astriesk">*</span>
                                        </div>
                                  </div>
                             </div>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Specification:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
					 	                     <select name="selMeeSpecTypeId" id="selMeeSpecTypeId" class="form-control" onChange="getMeeSpecificationName(this.value)">
														<option selected="selected">Select One</option>
										 <%
											//String str1[] = null;
												//Vector memberType=new Vector();
												 Vector specificationType=(Vector)request.getAttribute("dispSpecifcation");
												  System.out.println("vector2:"+specificationType);
												 if(specificationType!=null && specificationType.size()!=0){ 
												  Enumeration enm1=specificationType.elements();
												  
												  while(enm1.hasMoreElements()){
														String[] s = (String[])enm1.nextElement();
														for (int i=0;i<s.length; i++) {
															System.out.println("Content : "+s[i]);
														}
														String specificationID = s[0];
														String activityTypeId = s[1];
														String specificationName = s[2];
														
														//if (firstName == null) { firstName = "";}
														//if (lastName == null) {lastName = ""; }
														System.out.print(" injsp specificationID:  "+specificationID);
														System.out.print(" specificationName:  "+specificationName);
														
									   %>
														 <option value="<%=specificationID %>"><%=specificationName%></option>
													<%
													}
													}
													%>
														
														
														
													</select>
				 	                             <span class="asterisk">*</span>					 
					                         </div>
                                         </div>
		                            </div>
              <label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type :</label>
                      <div class='col-md-8'>
                           <div class='col-md-3 indent-small'>
                                      <div class='form-group internal'>
					 	<select name="advType_sel" id="advType_sel" class="form-control">
							<option selected="selected">Select One</option>
							
										<%
											//String str1[] = null;
												//Vector memberType=new Vector();
												 Vector userType=(Vector)request.getAttribute("userTypeVec");
												  System.out.println("vector3:"+userType);
												 if(userType!=null && userType.size()!=0){ 
												  Enumeration enm2=userType.elements();
												  
												  while(enm2.hasMoreElements()){
														String[] s = (String[])enm2.nextElement();
														for (int i=0;i<s.length; i++) {
															System.out.println("Content : "+s[i]);
														}
														String userTypeId = s[0];
														String userTypeName = s[1];
														
														
														//if (firstName == null) { firstName = "";}
														//if (lastName == null) {lastName = ""; }
														System.out.print(" injsp userTypeId:  "+userTypeId);
														System.out.print(" userTypeName:  "+userTypeName);
														
									   %>
														 <option value="<%=userTypeId %>"><%=userTypeName%></option>
													<%
													}
													}
													%>							
														
													</select>
												 <span id="span_astriesk">*</span>				
												 </div>
											</div>
										</div>
				                <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Normal Price :</label>
                                 <div class='col-md-8'>
                                       <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i><input name="text" type="text" class="form-control"/>
											  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
			                      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>After Due Date Price :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <input type="text" class="form-control"/>
											  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									</div>
									
                               
					 <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='button' value="Add" onclick="window.location.href('#');">Add</button>
                                    </div>
                                    <div class='col-md-2'>
                                        <button class='btn-lg btn-danger' type="button" value="Cancel" onclick="javascript:history.back(-1);" >Cancel</button>
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

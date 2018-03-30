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
<script src="js/frmGrossAmtMast.js" type="text/javascript" ></script>
<script>

function validatePriceList(){
		if(document.frmMeePriceMaster.selPriceType.value==""){
			alert("Please select any one Price Type.");
			document.frmMeePriceMaster.selPriceType.focus();
			return false;
		}
		
		if(document.frmMeePriceMaster.selSeason.value==""){
			alert("Please select any one Season.");
			document.frmMeePriceMaster.selSeason.focus();
			return false;
		}
				
		if(document.frmMeePriceMaster.duePrice.value==""){
			alert("The Due Amount Field can't be blank");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.duePrice.value)){
			alert("Enter valid Due Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		
if((document.frmMeePriceMaster.duePrice.value.indexOf('+')!=-1)||(document.frmMeePriceMaster.duePrice.value.indexOf('-')!=-1)){
				alert("Enter valid Due Amount");
				document.frmMeePriceMaster.duePrice.focus();
				return false;
			}
		if(document.frmMeePriceMaster.duePrice.value.indexOf('.')>7){
			alert("Enter valid Due Amount");
			document.frmMeePriceMaster.duePrice.focus();
			return false;
		}
		if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.duePrice.value.length>7){
				alert("Enter valid Due Amount");
				document.frmMeePriceMaster.duePrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.duePrice.value=="")){
			if((document.frmMeePriceMaster.duePrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.duePrice.value;
				fstr1=document.frmMeePriceMaster.duePrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.duePrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("Due Amount is not valid");
					document.frmMeePriceMaster.duePrice.focus();
					return false;
				}
			}
		}


		if(document.frmMeePriceMaster.afterPrice.value==""){
			alert("The After Due Amount Field can't be blank");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
	
		if(!Number(document.frmMeePriceMaster.afterPrice.value)){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		if(document.frmMeePriceMaster.afterPrice.value.indexOf('.')>7){
			alert("Enter valid After Due Amount");
			document.frmMeePriceMaster.afterPrice.focus();
			return false;
		}
		
if((document.frmMeePriceMaster.afterPrice.value.indexOf('+')!=-1)||(document.frmMeePriceMaster.afterPrice.value.indexOf('-')!=-1)){
				alert("Enter valid After Due Amount");
				document.frmMeePriceMaster.afterPrice.focus();
				return false;
			}
		if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))==-1){
			if(document.frmMeePriceMaster.afterPrice.value.length>7){
				alert("Enter valid After Due Amount");
				document.frmMeePriceMaster.afterPrice.focus();
				return false;
			}
		}
			
		if(!(document.frmMeePriceMaster.afterPrice.value=="")){
			if((document.frmMeePriceMaster.afterPrice.value.indexOf('.'))!=-1){
				fstr=document.frmMeePriceMaster.afterPrice.value;
				fstr1=document.frmMeePriceMaster.afterPrice.value.lastIndexOf('.');
				mm = (fstr.substring(fstr1,document.frmMeePriceMaster.afterPrice.value.length));
				str=(Number(mm.length));
				if((str)>3){
					alert("After Due Amount is not valid");
					document.frmMeePriceMaster.afterPrice.focus();
					return false;
				}
			}
		}
		return true;
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
							<h2> Meetings: Event Registration Price Details</h2>
						</div>
 <div class='panel-body'>
	
<form name="frmMeePriceMaster" id="frmMeePriceMaster" action="eventRegPriceCRUD.html" method="post" onsubmit="return validatePriceList();"  >
	<input type="hidden" name="cmd" value="insertPrice">


	
					<p>Add A Price Detail:</p>
				  
				  <% String statuscheck = (String)request.getAttribute("err");
					if(statuscheck!=null && statuscheck.equals("st")){
					%>
					<p id="p_error">Price Details for the Price Type and Season already exists. Try it Again.</p>
					
					<%
					}
					%>
				  
				   <div class='form-group'>
				 		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Price Type :</label>
						
				    		<div class='col-md-8'>
                                     <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
												<select name="selPriceType" id="selPriceType" class="form-control">
													<option selected="selected" value="">Select One</option>
													<%
													ArrayList priceDetails = (ArrayList)request.getAttribute("priceList");
													if(priceDetails!=null && priceDetails.size()!=0){
													Iterator itr= priceDetails.iterator();
													while(itr.hasNext()){
													String[] s = (String[]) itr.next();
													String priceId = s[0];
													String priceName = s[1];
													%>
												<option value="<%=priceId%>"><%=priceName%></option>
																<%}}%>
												</select><span  id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season :</label>
				     			<div class='col-md-8'>
                                     <div class='col-md-3 indent-small'>
                                         <div class='form-group internal'>
					 
											<select name="selSeason" id="selSeason" class="selectboxOne">
												<option selected="selected" value="">Select One</option>
												<%
												ArrayList seasonDetails = (ArrayList)request.getAttribute("seasonList");
												if(seasonDetails!=null && seasonDetails.size()!=0){
												Iterator itr= seasonDetails.iterator();
												while(itr.hasNext()){
												String[] s = (String[]) itr.next();
												String seaId = s[0];
												String seaName = s[1];
												%>
											<option value="<%=seaId%>"><%=seaName%></option>
												<%}}%>
											</select> <span  id="span_astriesk">*</span>
										</div>
									</div>
								</div>					
				  
				  
				  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Due Date Price :</label>
						<div class='col-md-8'>
                            <div class='col-md-3 indent-small'>
                                <div class='form-group internal'>
                        			$<input name="duePrice" type="text" class="form-control"  />
                    					<span  id="span_astriesk">*</span>
										</div>
									</div>
								</div>		
					
				  
			      <label class='control-label col-md-2 col-md-offset-2' for='id_title'>After Due Date Price :</label>
				  
				 		 <div class='col-md-8'>
                             <div class='col-md-3 indent-small'>
                                  <div class='form-group internal'>
								  	$<input name ="afterPrice" type="text" class="form=control"  />
				 					 <span  id="span_astriesk">*</span>
									</div>
								</div>
							</div>
						</div>
					
					<div class='form-group'>
                         <div class='col-md-offset-4 col-md-1'>
                              <button class='btn-lg btn-primary' type='submit' value="Add">Add</button>
						</div>
						
						<div class='col-md-2'>
                              <button class='btn-lg btn-danger' type='submit'  value="Cancel" onclick="javascript:history.back(-1);">Cancel</button>
						</div> 
					
				</div>
		</form>
	<!--==============================Form Body=================================-->
							
                        </div>
						
                    </div>
					
                </div>
				

            </div>
			
					
    
</div>	
</div>	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->

        
	
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			
</body>

</html>

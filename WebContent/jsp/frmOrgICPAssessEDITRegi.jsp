<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/frmMeeICPEditAssess.js" type="text/javascript" ></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/cscombo_new.js" type="text/javascript"></script>
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
                            <h2>Meetings: Application for ICP Assessment</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
					
	
					<form class='form-horizontal' role='form'  name="frmMeeICPAssessment" id="myform" method="post" action="ICPOrgListApp.html" onsubmit="return myvalidate();">
					
							
					
						<!--<tr>
							<td colspan="2">
								<!-- TABS START HERE  									
								<table cellpadding="0" cellspacing="0" border="0" class="container">
									<tr>
										<td id="tabData1" class="tabHighlight" onclick="naviTab('1')">
											<a id="link1" href="javascript:void(0);" class="active"><span class="tabHead">Part A</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData2" class="tabLowlight" onclick="naviTab('2')">
											<a id="link2" href="javascript:void(0);" class="inactive"><span class="tabHead">Part B</span></A>
										</td>
										<td width="1" style="border-bottom:1px solid #999;">&nbsp;</td>
										<td id="tabData3" class="tabLowlight" onclick="naviTab('3')">
											<a id="link3" href="javascript:void(0);" class="inactive"><span class="tabHead">Part C</span></A>
										</td>
									</tr>	
								</table>
								<!-- TABS END HERE  
							</td>
						</tr>-->
						 
						 <p>ICP Assessment Details:</p>
					
						   <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assesmant Level:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
									
                                                                             <%
																				Vector dispReg=new Vector();
                                                                                dispReg=(Vector)request.getAttribute("dispReg");
                                                                                System.out.println("disp size :"+dispReg.size());
                                                                                String[] icpVal =null;
                                                                                if(dispReg!=null && dispReg.size()!=0) {
                                                                                    Enumeration en=dispReg.elements();
                                                                                    
                                                                                    while(en.hasMoreElements()) {
                                                                                       icpVal = (String[])en.nextElement();
                                                                                        String[] dat=icpVal[2].split("-");
																						String datOrd=dat[0]+"/"+dat[1]+"/"+dat[2];
                                                                                        %>
                                                    <input type="hidden" name="process" value="update" />
                                                    <input type="hidden" name="mid" value="<%=icpVal[0]%>" />
                                                                      
                                                                 
                                         <input type="text" value="<%=icpVal[1]%>" name="assesLevel" id="assesmant" class="form-control"  />
                                                  <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
										
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                                   <input name="dat" type="text" value="<%=datOrd%>" readonly="true" class="form-control" id="date"  />
                                                          <span id="span_astriesk">*</span>
														  <a href="javascript:cal1.popup();"> <i id="calendar1" class="fa fa-calendar"></i></a> 
														  </div>
													 </div>
												</div>
                            
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. of Days:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
													<select name="days" id="select71" class="form-control">
													<% for(int i=1;i<31;i++){
														if(i==Integer.parseInt(icpVal[3])){	%>
														<option value="<%=icpVal[3]%>" selected="selected"><%=icpVal[3]%></option>
														<% }else{%>
														<option value="<%=i%>"><%=i%></option>
														<% } }%>
													 </select> 
													  <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
								  
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                     		  <select name="hlcArea" id="select72" class="form-control">
									   
														<!-- <option value="<%=icpVal[4]%>" selected="selected"><%=icpVal[26]%></option>-->
														 <%
														Vector area=new Vector(); 
														area=(Vector)request.getAttribute("area");
														if(area!=null && area.size()!=0){
															  Enumeration enu=area.elements();    
																while(enu.hasMoreElements()){
																	   String[] icpArea = (String[])enu.nextElement();
																		if(icpVal[4].equals(icpArea[2]))
																		{	%>
																	 <option value="<%=icpArea[0]%>" selected="selected"> <%=icpArea[2]%></option>												
																	 <% } else	{	%>
														 <option value="<%=icpArea[0]%>"><%=icpArea[2]%></option>
														 <%}}}%>
													   </select>
													    <span id="span_astriesk">*</span>
													  </div>
												 </div>
											</div>	
													
						
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Location:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                     			<input type="text" value="<%=icpVal[5]%>" name="location" id="location" class="form-control"  />
                                         		 <span id="span_astriesk">*</span>
										</div>
									</div>
								</div>
												
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Host ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
						      					<input name="hostid" id="hostid" value="<%=icpVal[7]%>" type="text" class="form-control"  onblur="riderDetails();" />
                                        			  <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
													 
													 
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>First Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
													<input type="text" name="fname" value="<%=icpVal[27]%>" id="firstName" readonly="true" class="form-control"  />
                                         				 <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
														
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Last Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
						    					<input type="text" name="lname" value="<%=icpVal[28]%>" id="lastName" readonly="true" class="form-control"  />
                                       			  <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
						      
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                   			<input name="addr" type="text" value="<%=icpVal[30]%>" id="address1" readonly="true" class="form-control" />
											  <span id="span_astriesk">*</span>
											 </div>
											</div>
										</div>
						     
								  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                    		<input type="text" name="ctry" value="<%=icpVal[31]%>" id="country" readonly="true" class="form-control"  />
                                          <span id="span_astriesk">*</span>
										 </div>
										</div>
									</div>
						     
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                   				<input type="text" name="state" value="<%=icpVal[32]%>" id="state" readonly="true" class="form-control"  />
                                         	 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
						      
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                    			<input type="text" name="city" id="city" value="<%=icpVal[33]%>" readonly="true" class="form-control"  />
                                          		<span id="span_astriesk">*</span>
										 	</div>
										</div>
									</div>
						      
								   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                     			<input name="zip" type="text" readonly="true" value="<%=icpVal[34]%>" class="form-control" id="zip"  />
                                          		<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								
						      
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                   				<input type="text" name="phone" id="phone" value="<%=icpVal[35]%>" readonly="true" class="textboxOne"/>
                                   				 <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
												 
						    
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                   				<input type="text" name="fax" id="faxNo" readonly="true" value="<%=icpVal[36]%>" class="form-control" />
                                       			<span id="span_astriesk">*</span>
												</div>
											</div>
										</div>												 
						     
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>EMail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                    		<input type="text" name="email" value="<%=icpVal[29]%>" id="emailId" readonly="true"  class="form-control"  />
                                      		  <span id="span_astriesk">*</span>
											 </div>
											</div>
										</div>
						    
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Assessor Detail:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
											  <textarea name="acessdet" id="txtarea" class="form-control" rows="5"><%=icpVal[9]%></textarea>
											   <span id="span_astriesk">*</span>
											  </div>
											 </div>
											</div>
  
						     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Facilities To Be Used Specifically:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                   
	<%
		String[] value=null;
		if(icpVal[10]!=null)
		{
			value=icpVal[10].split("#");
			 System.out.println("facility :"+icpVal[10].length());
			 System.out.println("facility siz:"+value.length);

			if(value[0]!=null)
			{
				if(!value[0].equalsIgnoreCase("null")){%>
			<input type="checkbox" checked name="ctry" value="Cross-Country Schooling" />
			<%}else{%>
			<input type="checkbox" name="ctry" value="Cross-Country Schooling" />
			<%}}%>
    Cross-Country Schooling
			<%if(value[1]!=null)
			{
			if(!value[1].equalsIgnoreCase("null")){%>
		    <input type="checkbox" checked name="rclinic" value="Riding Clinic" />
			<%}else{%>
			<input type="checkbox" name="rclinic" value="Riding Clinic" />
			<%}}%>
    Riding Clinic
			<%if(value[2]!=null)
			{
			if(!value[2].equalsIgnoreCase("null")){%>
		    <input type="checkbox" checked name="stab" value="Stablity" />
			<%}else{%>
			<input type="checkbox" name="stab" value="Stablity" />
			<%}}%>
    Stablity
			<%if(value[3]!=null)
			{
			if(!value[3].equalsIgnoreCase("null")){%>
    			<input type="checkbox" checked name="cbx_other" id="Otherchckbx" value="others" onchange="isOtherscheck();" />
			<%}else{%>
				<input type="checkbox" name="cbx_other" id="Otherchckbx" value="others" onchange="isOtherscheck();" />
			<%}}}%>
    Other 
												</div>
											</div>
										</div>			     
										
										
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>If Other Specify:</label>
                                   
                                
									<%if(value[3]!=null)
									{
										if(!value[3].equalsIgnoreCase("null")){%>
									
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                                  				<input type="text" value="<%=value[3]%>" class="form-control" disabled="disabled" id="txtOther" name="others" />
											</div>
										</div>
									</div>
									
									<%}else{%>
									
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
												<input type="text" class="form-control" disabled="disabled" id="txtOther" name="others" />
											</div>
										</div>
									</div>
									
									<%}}%>
						     </div>
							
							
							<p>Land Owner Details : </p>
						  
						 <div class="form-group">
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Land Owner Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                          						<input type="text" value="<%=icpVal[11]%>" class="form-control" name="lownernam" id="name1" /> 
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
						   
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Business Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                          							<input type="text" value="<%=icpVal[12]%>" class="form-control" name="busname" id="bizname"/>
													 <span id="span_astriesk">*</span>
													</div>
												</div>
											</div>
						    
						 	 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                          							<input type="text" value="<%=icpVal[13]%>" class="form-control" name="laddr" id="address" />
													 <span id="span_astriesk">*</span>
													</div>
												</div>
											</div>
						    
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Country:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                            
												  <select name="ctry_sel" id="select11" class="form-control" onchange="FillState(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21,' ');">
													<option value="<%=icpVal[16]%>" selected="selected"><%=icpVal[16]%></option>
												  
												  </select>
												   <span id="span_astriesk">*</span>
												 </div>
												</div>
											</div>
                            
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>State:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
											  <select name="stat_sel" id="select21" class="form-control" >                              
												<option value="<%=icpVal[15]%>" selected="selected"><%=icpVal[15]%></option>
											   
											  </select> 
											   <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
                            
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                           						<input type="text" value="<%=icpVal[14]%>" class="form-control" name="lcity" id="city2" /> 
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
						    
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Zip:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
												<input type="text" value="<%=icpVal[17]%>" class="form-control" name="lzip" id="zip2"/>
												 <span id="span_astriesk">*</span>
												</div>
											</div>
										</div>
						  
						   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Phone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                            					<input type="text" value="<%=icpVal[18]%>" class="form-control" name="lph" id="phone2"/> 
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
					       
						     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fax:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
											 <div class='form-group internal'>
                               					<input type="text" value="<%=icpVal[19]%>" class="form-control" name="lfax" id="fax2" />
												 <span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
								</div>
					        

						  <div class='form-group'>
                                    <div class='col-md-offset-4 col-md-1'>
                                        <button class='btn-lg btn-primary' type='submit'  name="Submit">Update</button>
                                    </div>
							</div>
									
								  <%}}%>
							
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
			

<script language="javascript">
	var cal1 = new calendar2(document.forms['frmMeeICPAssessment'].elements['dat']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	//var cal2 = new calendar2(document.forms['frmMeeICPAssessment'].elements['checkDate']);
	//cal1.year_scroll = true;
	//cal1.time_comp = false;
	</script>
<script>
	FillCountry(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21, '<%=icpVal[16]%>');
	FillState(document.frmMeeICPAssessment.select11, document.frmMeeICPAssessment.select21, '<%=icpVal[15]%>');
	
</script>

</body>
</html>

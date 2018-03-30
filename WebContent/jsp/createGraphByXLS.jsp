<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
 <script src="javascripts/calendar2.js" type="text/javascript"></script>
<script language="javascript">
            
            function validate(){
                if(document.generateChartByXLS.reportTitle.value=="" || document.generateChartByXLS.reportTitle.value.indexOf(' ')==0){
                    alert("Please enter the Report Title");
                    document.generateChartByXLS.reportTitle.focus();
                    return false;
                }
				 if(document.generateChartByXLS.xlsFile.value=="" || document.generateChartByXLS.xlsFile.value.indexOf(' ')==0){
                    alert("Please upload SpreadSheet");
                    document.generateChartByXLS.xlsFile.focus();
                    return false;
                }
                
                if(document.generateChartByXLS.projectDescription.value.length==0 || document.generateChartByXLS.projectDescription.value.indexOf(' ')==0){
                    alert("Please enter the Project Description");
                    document.createProject.projectDescription.focus();
                    return false;
                }
                
              
                return true;
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
				 	<h2>Use the section below to Generate a  Graph</h2>
				</div>
                              
		<!--==============================Form Title=================================-->
				<div class='panel-body'>
				
       <form   name="generateChartByXLS" method="post" enctype="multipart/form-data" action="generateReports.html?message=xlsToGraph" onsubmit="return validate();">
                                             
        <div class='form-group'>
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report Title :</label>
			
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
                        <input type="text" id="reportTitle" name="reportTitle"  class="form-control"  size="45"/><span class="asterisk" id="span_astriesk">*</span>
						
					</div>
				</div>
			</div>
			
		
         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Upload SpreadSheet:</label>
            
			 <div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<input type="file" name="xlsFile" id="xlsFile" class="form-control"  size="45" /><span class="asterisk" id="span_astriesk">*</span>
					</div>
				</div>
			</div>
			
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Chart Type :</label>
			
			 <div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<select  name="chartType" class="form-control">
						<option value="Pie">Pie</option>
						<option value="Bar">Bar</option>
						<option value="Line">Line</option>
						<option value="WaterFall">WaterFall</option>
						<option value="3D Pie">3D Pie</option>
						</select>
						<span class="asterisk" id="span_astriesk">*</span>
					</div>
				</div>
			</div>
		</div>
		
		
		 <div class='form-group'>
			 <div class='col-md-offset-4 col-md-1'>
				<button class='btn-lg btn-primary' name="Submit" type="submit" value="Submit">Submit</button>
			</div>
		</div>										
                                                                                   
                                                                                 
           <input type="hidden" name="message" value="xlsToGraph" />
                                                
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

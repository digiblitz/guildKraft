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
<script>
    
                 function UpdateSelect()
{
select_value = document.generateChartByXLS.view.value;
var id = 'hide_this_row';
var obj = '';
obj = (document.getElementById) ? document.getElementById(id) : ((document.all) ? document.all[id] : ((document.layers) ? document.layers[id] : false));

if(select_value =2)
{
obj.style.display = ( obj.style.display != "none" ) ? "none" : "";//Hide Fields
}
else
{
obj.visibility = "show";//Show Fields
}
}
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

    function popUp_report(type){
                                   var val =null;
                                   var year =document.getElementById("year").value;
                                   var view=document.getElementById("view").value;
				 var numArr = new Array ();
				j=0;
				var graph=document.getElementsByName("graph");
				
				for (i = 0; i < graph.length; i++)
				{
	                        if(graph[i].checked)
					{
								
								numArr[j]=graph[i].value;
								j++;
								
					}
					          
					               
                          }
                                   if(type=='area_yearly'){
                                       var month = document.getElementById("year").value;
                                       val=  window.open("MakeChart.html?process="+type+"&year="+year+"&Submit=Submit&message=xlsToGraph"+"&view="+view+"&graph="+numArr.join()
                                       ,'AreaSalesGraph',
                                       'width=1200,height=700,toolbar=no,location=no,directories=yes,status=yes,menubar=no,scrollbars=yes,copyhistory=no,resizable=yes')
                                       if(val == null) {
                                           alert("Plz Enable Site Popup Allowed");
                                       }
                                   }
                                   else if(type=='area_monthly'){
                                       val=  window.open("MakeChart.html?process="+type+"&year="+year+"&paymentMode="+paymentMode+"&Submit=Submit&message=xlsToGraph"
                                       ,'DailySalesGraph',
                                       'width=1200,height=700,toolbar=yes,location=yes,directories=yes,status=yes,menubar=yes,scrollbars=yes,copyhistory=yes,resizable=yes')
                                       if(val == null) {
                                           alert("Plz Enable Site Popup Allowed");
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
						
						  <% if( (request.getParameter("type").equals("area_yearly")) && (request.getParameter("type")!=null) )
                                                { %>
                                                  <h2>Area Wise Yearly Sales Report</h2> 
                                                   <% }
                                            else{ %>
                                                Area Wise Yearly Sales Report for the chosen Area
                                           <% } %>
										   
						</div>
			<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>

       
                    <form class='form-horizontal' role='form' name="generateChartByXLS" method="post"   onsubmit="return validate();" action="MakeChart.html">
                              <input type="hidden" name="process" value="area_yearly" />
         
		 						 <% if( (request.getParameter("type").equals("area_monthly")) && (request.getParameter("type")!=null) )
                                        { %>                   
											
											<input type="hidden" name="process" value="monthly" id="process" />
                              
							  
										   <div class='form-group'>
											  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select Area:</label>
												 <div class='col-md-8'>
													<div class='col-md-3 indent-small'>
														<div class='form-group internal'>
																	 Area Image
														</div>
												</div>
											</div>
										</div>
 
                                                                       
                                        <% } %>
										
                                                               
											 <input type="hidden" name="process" value="yearly" id="process"/>
                                                                
                                            <div class='form-group'>
											  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Select Year:</label>
												 <div class='col-md-8'>
													<div class='col-md-3 indent-small'>
														<div class='form-group internal'> 
                                                             <select  name="year" class='form-control' id="year">
																	<option value="2006">2006</option>
																	<option value="2007">2007</option>
																	<option value="2008">2008</option>
																	<option value="2009">2009</option>
																	<option value="2010">2010</option>
																	<option value="2011">2011</option>
																	<option value="2012">2012</option>
																	<option value="2013">2013</option>                                                                   
																	 <option value="2014">2014</option>
																	<option value="2015">2015</option>
																	<option value="2016">2016</option>

															</select>
																<span id="span_astriesk">*</span>
													</div>
												</div>
											</div>
										</div>

                            			 <div class='form-group'>
											  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Report type:</label>
												 <div class='col-md-8'>
													<div class='col-md-3 indent-small'>
														<div class='form-group internal'> 
														 		<select class="form-control" name="view" id="view" onChange="UpdateSelect();">
																	<option value='1'>Graphical</option>
																	<!-- option value='2'>Tabular</option -->
																</select>
														</div>
												</div>
											</div>
										</div>
 
 											<div class='form-group'>
											  <label class='control-label col-md-2 col-md-offset-2' for='id_title'> Graph types:</label>
												 <div class='col-md-8'>
													<div class='col-md-3 indent-small'>
														<div class='form-group internal'>
							
															 <% if(request.getParameter("type").equalsIgnoreCase("area_yearly") )  { %>
															<input type="checkbox" name="graph"  value="pie" checked>Pie<br>
															 <input type="checkbox" name="graph" value="Linechart">Line<br>
															 <input type="checkbox" name="graph" value="chart">Bar<br>
															 <input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>

															<% } else { %>
															<input type="checkbox" name="graph" value="pie">Pie1<br>
															 
															<input type="checkbox" name="graph" value="line">Line<br> 
															<input type="checkbox" name="graph" value="PyramidChart">Pyramid<br>
															<% } %>
															
													</div>
												</div>
											</div>
										</div>
 
																
       							 <div class='form-group'>
								 
                                    <div class='col-md-offset-4 col-md-1'>
									
                                        <button class='btn-lg btn-primary' name="Submit" value="Submit" onclick="javascript:popUp_report('<%=request.getParameter("type")%>')"  type='submit'>Submit</button>
										
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

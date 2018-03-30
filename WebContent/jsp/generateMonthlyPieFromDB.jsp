<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->

<%@ page  import="java.awt.*,java.util.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<%@ page  import="org.apache.poi.hssf.usermodel.HSSFCell,org.apache.poi.hssf.usermodel.HSSFRow,org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook,org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script src="js/calendar2.js" type="text/javascript"></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%
int i=1;

ArrayList monthlyPaymentDet=(ArrayList)session.getAttribute("monthlyPaymentDet");

String yearly=(String)session.getAttribute("yearValue");
Iterator itrDailyPaymentDet = monthlyPaymentDet.iterator();

final DefaultPieDataset data = new DefaultPieDataset();
       
  while(itrDailyPaymentDet.hasNext())
  {
    			
  Double db= (Double)itrDailyPaymentDet.next();
  double dbValue = db.doubleValue();
  
data.setValue(new Integer(i), dbValue);
i=i+1;
  }
        



            JFreeChart chart = ChartFactory.createPieChart
            ("Monthly Sales Report For"+yearly, data, true, true, false);
			String filePath=null;
            try {
                final ChartRenderingInfo info = new 
              ChartRenderingInfo(new StandardEntityCollection()); 
			  filePath=getServletContext().getRealPath("/")+"images\\piechart.png";
                final File file1 = new File(filePath);
                ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
            } catch (Exception e) {
                out.println(e);
            }
%>


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
		
	    				 <div class='panel-body'>
						
		<!--==============================Form Description=================================-->
	  		<div class='form-group'>
	  			 <div class='col-md-8'>
             		<div class='col-md-3 indent-small'>
                		<div class='form-group internal'>
                            <img src="images/piechart.png" width="600" height="400"></img>
        					</div>
						</div>
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

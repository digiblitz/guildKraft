<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<%@ page  import="java.awt.*,java.util.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="java.awt.*" %>
<%@ page  import="java.io.*" %>
<%@ page  import="org.apache.poi.hssf.usermodel.HSSFCell,org.apache.poi.hssf.usermodel.HSSFRow,org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook,org.apache.poi.poifs.filesystem.POIFSFileSystem" %>
<%@ page  import="org.jfree.chart.*" %>
<%@ page  import="org.jfree.chart.entity.*, org.jfree.chart.renderer.category.*,org.jfree.data.category.*,org.jfree.chart.plot.*" %>
<%@ page  import ="org.jfree.data.general.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->
<%
int i=0;
String month[]={"Jan","Feb","Mar","Apr","May","June","July","Aug","Sep","Oct","Nov","Dec"};
Vector patient=(Vector)session.getAttribute("patient");
String reportTitle=(String)session.getAttribute("title");
       Vector patientNo=(Vector)patient.lastElement();
final DefaultPieDataset data = new DefaultPieDataset();
       
  for(int j=0;j<patientNo.size();j++)
  {
    
HSSFCell myCell = (HSSFCell)patientNo.elementAt(j);
				
  double db=Double.parseDouble(myCell.toString());
  
data.setValue(month[i], db);
i=i+1;
  }
  
  JFreeChart chart = ChartFactory.createPieChart3D
  (reportTitle, data, true,true,true);
  PiePlot3D p=(PiePlot3D)chart.getPlot();
  p.setForegroundAlpha(0.5f);
  
      

         
String filePath=null;
            try {
                final ChartRenderingInfo info = new 
              ChartRenderingInfo(new StandardEntityCollection()); 
			  filePath=getServletContext().getRealPath("/")+"images\\3DPieChart.png";
                final File file1 = new File(filePath);
                ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
            } catch (Exception e) {
                out.println(e);
            }
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="javascripts/calendar2.js" type="text/javascript"></script>

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
		
	     <div class='panel-body'>
						
		<!--==============================Form Description=================================-->
	  <div class='form-group'>
	  	 <div class='col-md-8'>
             <div class='col-md-3 indent-small'>
                <div class='form-group internal'>
					<img src="images/3DPieChart.png" width="600" height="400" border="0" align="center"></img>
	  
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

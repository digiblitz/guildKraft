<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="org.jfree.chart.*,org.jfree.chart.plot.PlotOrientation,
 org.jfree.data.category.DefaultCategoryDataset,
 org.jfree.data.general.DefaultPieDataset,
 org.jfree.data.xy.*,
 org.jfree.data.*" %>
 <%@ page  import="org.apache.poi.hssf.usermodel.HSSFCell,org.apache.poi.hssf.usermodel.HSSFRow,org.apache.poi.hssf.usermodel.HSSFSheet" %>
<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook,org.apache.poi.poifs.filesystem.POIFSFileSystem" %>

 <%@ page  import="java.awt.*,java.util.*" %>
<%@ page  import="java.io.*" %>
 <%@ page  import="org.jfree.chart.entity.*, org.jfree.chart.renderer.category.*,org.jfree.data.category.*,org.jfree.chart.plot.*" %>
<%@ page  import ="org.jfree.data.general.*" %>
<%! double db,db1; %>
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
	
	ArrayList patient=(ArrayList)session.getAttribute("dataholder"); 
    String reportTitle=(String)session.getAttribute("title");
  XYSeries series = new XYSeries("Pulse Rate");
             for (int i=1;i<patient.size(); i++){
                   ArrayList cellStoreVector=(ArrayList)patient.get(i);
			for (int j=0; j < cellStoreVector.size();j++){
                            System.out.println("CellStorevectro"+cellStoreVector.size());
				HSSFCell myCell = (HSSFCell)cellStoreVector.get(j);
				     if(j==0)
							  db=Double.parseDouble(myCell.toString());
					  else
							 db1=Double.parseDouble(myCell.toString());
				 
			}
                   series.add(db, db1);
			
		}
 




     
	                  
     
	 
  
  
 XYDataset xyDataset = new XYSeriesCollection(series);
  JFreeChart chart = ChartFactory.createXYLineChart
          (reportTitle, "Seconds", "Pulse",
 xyDataset, PlotOrientation.VERTICAL, true, true, false); 
  String filePath=null;
            try {
                
                final ChartRenderingInfo info = new 
              ChartRenderingInfo(new StandardEntityCollection()); 
			  filePath=getServletContext().getRealPath("/")+"images\\linechart.png";
                
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
					<!--==============================Form Title=================================-->
                      <div class='panel-body'>
						 <div class='form-group'>
                              <div class='col-md-8'>
                                 <div class='col-md-3 indent-small'>
                                    <div class='form-group internal'>
                            
											<img src="images/linechart.png" width="600" height="400" 
								 border="0" align="center"></img> 
								 		</div>
									</div>
								</div>
							</div>
        
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

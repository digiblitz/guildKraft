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
      <%@ page import="java.util.*" %>
       <%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%> 
<!DOCTYPE html>
<html>
<head>
    <title>Month Calendar</title>

    <meta charset="utf-8"> 
      
	<script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/daypilot-all.min.js" type="text/javascript"></script>
    <!--script src="js/calendar2.js" type="text/javascript"></script>
	<script  src="js/ts_picker.js"></script>
	<script src="js/datetimepicker_css.js"></script-->
	
	<link type="text/css" rel="stylesheet" href="css/month_green.css" />
    <!--  link type="text/css" rel="stylesheet" href="layout.css" />    
    <link type="text/css" rel="stylesheet" href="elements.css" />--> 
     <link type="text/css" rel="stylesheet" href="css/navigator_white.css" />       
	 
<style>
span#start {
    margin-left: 15px;
    padding: 10px 10px;
}
</style>	
	
</head>

<body>

<div>
 <!-- HEADER START HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>


	<form action="eventcal.html?cmd=eventreg" method="post" name="myform" id="myform">
	
    <% DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
	ArrayList eventdetails=(ArrayList)request.getAttribute("eventdetails");
    
    	String curdate= (String)request.getAttribute("curdate");
    			int listsize = eventdetails.size();
    			
    	System.out.println("====Present date in jsp===="+curdate);
    
    %>
     
    <input type="hidden" id="curdate" value="<%=curdate%>">
    
    <% int j=0;
	
	if (eventdetails!= null){
	
	Iterator itr= eventdetails.iterator();
    	
    	while(itr.hasNext()){
    	String details[]=(String[])itr.next();
    	String event_id= details[0];
    	String event_title =details[1];
    	String sdate= details[2];
    	String edate=details[4];
    	String location=details[5];
    	System.out.println("=====start-date===="+ sdate);
		System.out.println("=====event_id in jsp===="+ event_id);
    %>
    
    <input type="hidden" name="id" id="event_id<%=j%>" value="<%=event_id%>"> 
    <input type="hidden" name="title" id="title<%=j%>" value="<%=event_title%>">
    <input type="hidden" name="sdate" id="sdate<%=j%>" value="<%=sdate%>"> 
    <input type="hidden" name="edate" id="edate<%=j%>" value="<%=edate%>"> 
    <input type="hidden" name="location" id="location<%=j%>" value="<%=location%>"> 
    

		<%
		j++;
		
	}	
		System.out.println(j);	
		}

  %>
    <input type="hidden" value="<%=j %>" id="size">
     
    <div id="main"> 
        
        <div id="container" >
	  
	        <div id="content">
	           
	            <div>
	            
	     

 <div class="space">
    <span id="start"><%=curdate %></span> <a href="#"  onclick="picker.show(); return false;">Change</a>
</div>

<script type="text/javascript">
    var picker = new DayPilot.DatePicker({
        target: 'start', 
        pattern: 'yyyy-MM-dd', 
        onTimeRangeSelected: function(args) { 
            dp.startDate = args.start;
            dp.update();
        }
    });
</script>

<div id="dp"></div>

<script type="text/javascript">
    var dp = new DayPilot.Month("dp");
	
		var event_id = null;
        var title = null;
        var sdate = null;
        var edate = null;
        var loc = null;
		var pdate = null;
   
    dp.theme = "month_green";
    
   //dp.eventMoveToPosition ="disabled";
   
   
   dp.onEventMove = function (args) {
	   //Event Can't be moved
			args.preventDefault();
  }
  
  dp.onEventClick = function(args) {
	  
	   $('#myform').submit();
	
	  //Redirect to register page
  }
  
 	var pdate = $("#curdate").val();
   
   
	var size= $("#size").val();
 
    for (var i = 0; i < size; i++) {
        //var duration = Math.floor(Math.random() * 1.2);
        //var start = Math.floor(Math.random() * 6) - 3; // -3 to 3
        
         event_id =$("#event_id"+i).val();
         title = $("#title"+i).val();
         sdate = $("#sdate"+i).val();
         edate = $("#edate"+i).val();
         loc = $("#location"+i).val();

        var e = new DayPilot.Event({
            start: new DayPilot.Date(sdate),
            end: new DayPilot.Date(sdate),
            id: DayPilot.guid(),
            text: title
        });
		
		
        dp.events.add(e);
    }

 
        
    dp.init();


</script>


                </div>
	        </div>
        </div>
    </div>
		</form>
		
				 
		 <div style="height:20px">                 <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
          </div>   	
               
               
 		


</body>
</html>


<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="com.hlccommon.util.*"%>
<%@ page import="com.hlcmro.util.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<%@ page import="com.hlcutil.HLCMemberVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>guildKraft</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link href='http://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css' />
    <link href='http://fonts.googleapis.com/css?family=Archivo+Black' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/hoe.css" type="text/css" />
    
	 <link rel="stylesheet" href="css/style1.css">
	<link rel="stylesheet" href="css/styles.css">
	 <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="css/grid.css">
    <link rel="stylesheet" href="css/camera.css"/>
	<link rel="stylesheet" href="css/font-awesome.min.css">
	
	

	<script src="js/jquery.js"></script>
    <script src="js/jquery-migrate-1.2.1.js"></script>
    <script src="js/jquery.matchHeight-min.js"></script>
    <script src="js/sForm.js"></script>
    <script src="js/camera.js"></script>
	 <script>
        $(function () {
            $(".equal").matchHeight();
        });
    </script>
    <!--[if (gt IE 9)|!(IE)]><!-->
    <script src="js/jquery.mobile.customized.min.js"></script>
    <script src="js/wow/wow.js"></script>
	
	<script src="js/general.js" type="text/javascript"></script>
	
	<!-- JS includes //-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries //-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    
    <script src="js/1.11.2.jquery.min.js"></script> 
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/hoe.js"></script>
		<style>
		#wrap {
		font: 1.3em/1.3 Arial, Helvetica, sans-serif;
		width: 30em;
		margin: 0 auto;
		padding: 1em;
		background-color: #fff; }
	

	/* This CSS is used for the Show/Hide functionality. */
	.more {
		display: none;
		border-top: 1px solid #666;
		border-bottom: 1px solid #666; }
	a.showLink, a.hideLink {
		text-decoration: none;
		color: #36f;
		padding-left: 8px;
		background: transparent url(down.gif) no-repeat left; }
	a.hideLink {
		background: transparent url(up.gif) no-repeat left; }
	a.showLink:hover, a.hideLink:hover {
		border-bottom: 1px dotted #36f; }
	</style>
	
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript" type="text/javascript">


function focus_login()
{
	document.frmFinalEveCal.year.focus();
}	
</script>

<style type="text/css">

.styleNew {font-family: Arial, Helvetica, sans-serif;
         font-size:18px;}
.style2 {
	font-size: 16px;
	font-weight: bold;
}
.style3 {font-size: 12px}
.style9 {font-size: 24px}
.style12 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; }
.style14 {font-family: Arial, Helvetica, sans-serif; font-size: 16px; font-weight: bold; }

</style>


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<%@ include file = "../../include/Header_temp.jsp" %>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<section id="content">


<div class="bg-camera">
    <div class="border-bottom">
        <div class="container">
            <div class="wrapper1-t wrapper1-b">
                <div class="row">
                    <div class="grid_12">
                        <div id="camera01" class="camera_wrap">
                            <div data-src="./images/index_img-02.jpg">
                              <div class="camera_caption color_1">
                                    <h4>Save more by joining the conference in groups of three
                                       
                                    </h4>
                                </div>
                            </div>
                            <div data-src="./images/index_img-12.jpg">
                                <div class="camera_caption color_1">
                                    <h4>Thrilling keynote speech with deep facts from Top-notch industry specialists
                                    </h4>
                                </div>

                            </div>
                            <div data-src="./images/index_img-13.jpg">
                                <div class="camera_caption color_1">
                                    <h4>Get to know and have hands-on experience with latest EA products
                                    </h4>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</section>

<section id="content">
		<div class="container">
		 <div class="wrapper11">
        <div class="row">
           <div class="grid_12">
                <h3 class="heading_4 text_4 color_3">Event Calendar:</h3>
              </div>
			  </div>
					
						
					<%!
							SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
							SimpleDateFormat sd1 = new SimpleDateFormat("MM-dd-yyyy");
										
							String dateFormat(java.util.Date fieldName){					
							Calendar cal = Calendar.getInstance();
							GregorianCalendar gc = new GregorianCalendar();
							gc.setTime(fieldName);
							cal.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DAY_OF_MONTH),0,0,0);
											
							int tempDay = gc.get(Calendar.DAY_OF_WEEK);
							String holiday = null;
								switch(tempDay){
								case Calendar.SUNDAY:
									holiday ="SUN";
									break;
								case Calendar.MONDAY:
									holiday ="MON";
									break;
								case Calendar.TUESDAY:
									holiday ="TUE";
									break;
								case Calendar.WEDNESDAY:
									holiday ="WED";
									break;
								case Calendar.THURSDAY:
									holiday ="THU";
									break;
								case Calendar.FRIDAY:
									holiday ="FRI";
									break;
								case Calendar.SATURDAY:
									holiday ="SAT";
									break;
								}
								String dispDate = "N/A";
								if(fieldName!=null ){
									dispDate = sd1.format(cal.getTime()).toString()+" ("+holiday+")";
								}
								return dispDate;
							}
					  %> 
								

				<!--<div align="center"><img src="images/usea_xntry_final.jpg" width="200" /></div>-->


					
		
			

					
  
							<%
							 ArrayList objProCalList = (ArrayList)request.getAttribute("objAppEvent");
															if(objProCalList!=null && objProCalList.size()!=0){
															   Iterator itr =objProCalList.iterator();
							%>
	 					
						
						
    
			

 
								 <%
						  
												  HLCCalendarVO calVO = new HLCCalendarVO();
												 
								
													while(itr.hasNext()){
														String entryStartDate="";
														String entryCloseDate="";
														calVO =(HLCCalendarVO)itr.next();
														String provisionId = calVO.getCalenderId();
														//System.out.println("provisionId in jsp"+provisionId);
														String beginDate=dateFormat(calVO.getBeginDate());
														String endDate=dateFormat(calVO.getEndDate());
														String eventTitle=calVO.getEventTitle();
														String eventId = calVO.getEventId();
														String orgId=calVO.getOrganizerId();
														String firstName=calVO.getOrgFName();
														String lastName=calVO.getOrgLName();
														String areaCode=calVO.getAreaCode();
														String areaName=calVO.getAreaName();
														String stateName=calVO.getStateName();
														String areaChApprovStat=calVO.getOrgApprovalStatus();
														
										String tmpVal="";
								String eveTyp2="";
								ArrayList objEveLevels = calVO.getEveLevels();
								//System.out.println(	"objEveLevels: "+objEveLevels.size());
								
								if(objEveLevels!=null && objEveLevels.size()!=0){
								Iterator itrSub = objEveLevels.iterator();
								while(itrSub.hasNext()){
								String[] subEntry = (String[])itrSub.next();
								String eveCode = subEntry[0]; 
								String eveDiv = subEntry[2]; 
								//System.out.println("tmpVal"+eveCode);
								if(tmpVal==""){
								tmpVal = eveCode+"("+eveDiv+")";	
								}else{	
								tmpVal = tmpVal + ","+ eveCode+"("+eveDiv+")";		
								}														
								}								
								}				    
						  %>
						

  
							 <%if(calVO.getEntryStrtDate()!=null && calVO.getEntryEndDate()!=null){
															Date today=new Date();                 	 
															Date entryStartDate1=calVO.getEntryStrtDate();
															Date entryEndDate1=calVO.getEntryEndDate();
															
												if(today.compareTo(entryStartDate1)<0){						
							%>
    						
							<div></div>
										

							<%}else if(today.compareTo(entryEndDate1)>0){%>
							<div></div>

				<%}else{%>
				
			
						
				<%}}else{%>
				
			
	
				<%}%>
	</br></br>
		<div class="row">
            <div class="grid_3">
			<a href="">
                <div class="box14">
                    <p class="color_2">
					  <time datetime="2014-05-12"><%=beginDate%> to <%=endDate%></time>
					 </p>
						<h5 class="color_3 text_11 line">
							<%=eventTitle%> (<%=areaName%>)  <%=stateName%>
						</h5>
										
				
									
									<% if(calVO.getEntryStrtDate()!=null)
										{
										entryStartDate=sd1.format(calVO.getEntryStrtDate());
										//entryStartDate=dateFormat(calVO.getEntryStrtDate());
										%>
										
			<p class="text_8 color_5">Open Date:<%=entryStartDate%></p>
									
							
							<%}else{%>
			<p class="text_8 color_5">Open Date:<%=calVO.getEntryStrtDate()%></p>
								
							<%}%> 
							
								<%if(calVO.getEntryEndDate()!=null)
								{
								entryCloseDate=sd1.format(calVO.getEntryEndDate());
								%>	
									
				<p class="text_8 color_5">Close Date:<%=entryCloseDate%></p>
								
						
						<%}else{%>
				 <p class="text_8 color_5">Close Date:<%=calVO.getEntryEndDate()%></p>
								
						
						<%}%> 
			<h6>Event Levels Offered:<%=tmpVal%></h6>
								</div>
							</div>
						</div>
					</div>
				<%}}else{%>
				<div class='form-group'>
					<div class="container"> 
							<div class='col-md-4'>
							</div>
					<div class='col-md-4'>
							No records are available. 
					</div>
				</div>
			</div>
	<%}%>
	<!--==============================Form Body=================================-->
	 </div>
            </div>
        </div>
    </div>
	</div>
	</section>				
                    <%@include file="../../include/Footer.jsp" %>
			
</body>

</html>

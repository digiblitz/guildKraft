<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/calendar2.js" type="text/javascript"></script>
 <script  src="js/ts_picker.js"></script>
<script language="javascript" type="text/javascript">
function postData(season){
if(document.myform.selSeason.selectedIndex==0){
    alert("Select any one Season");
	document.myform.selSeason.focus();
	return false;
	}else{
var year=document.getElementById("selYear").value
location.href="eventRegPriceCRUD.html?cmd=dateDetails&season="+season+"&year="+year;
}
}

function myValidate(){
if(document.myform.selYear.selectedIndex==0){
	alert("Select any Year");
	document.myform.selYear.focus();
	return false;
}
if(document.myform.selSeason.value==""){
	alert("Select any one Season");
	document.myform.selSeason.focus();
	return false;
}
if(document.myform.txtDue.value==""){
	alert("Enter Due Date");
	document.myform.txtDue.focus();
	return false;
}
	if(document.myform.txtGrace.value==""){
	alert("Enter Grace Date");
	document.myform.txtGrace.focus();
	return false;
}
var stDate = document.myform.txtDue.value;
var enDate = document.myform.txtGrace.value;
var sDate = new Date();

sDate.setMonth(stDate.substring(0,2)-1);
sDate.setDate(stDate.substring(3,5));
sDate.setYear(stDate.substring(6,10));

var eDate = new Date();
eDate.setMonth(enDate.substring(0,2)-1);
eDate.setDate(enDate.substring(3,5));
eDate.setYear(enDate.substring(6,10));

var stTime = sDate.getTime();
var enTime = eDate.getTime();

var year=document.myform.selYear.value;
var year1=sDate.getYear(stDate.substring(6,10));

if(year!=stDate.substring(6,10)){
alert("Select valid Event Due Date");
document.myform.txtDue.focus();
return false;
}
if(year!=enDate.substring(6,10)){
alert("Select valid Event Grace Date");
document.myform.txtGrace.focus();
return false;
}
if(stTime>enTime){
	alert("Select valid Event Due Date & Grace Date");
	document.myform.txtDue.focus();
	return false;
}
	return true;
}

</script>

<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

<%! 
String  nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(java.util.Date fieldName){
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyyy");
		String detValue = "";
        if(fieldName!=null){
            detValue = sdf1.format(fieldName);
        }
        return detValue;
    }
    %>
<%String seasonId=(String)request.getAttribute("issueId");%>


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
                            <h2>Meetings : Insert Date Details</h2>
                        </div>
                        
					<!--==============================Form Title=================================-->
					<div class='panel-body'>
					
  
		  
		 <form  class='form-horizontal' role='form' name="myform" id="myform" action="eventRegPriceCRUD.html" method="post" onsubmit="return myValidate(this);">
		 <input type="hidden" name="cmd" value="insertDateDetails"/>
		 
		             <div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competition Year:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
																						
													<select name="selYear" id="selYear" class="form-control" >
													<option selected="selected" value="Select One" >Select One</option>		
													<% String yearStr = (String) request.getAttribute("year");
													Calendar cal = Calendar.getInstance();
													for (int i= 2007;i<=(cal.get(Calendar.YEAR)+1);i++){
													if(yearStr != null && yearStr.equalsIgnoreCase(new Integer(i).toString())){
													%>
													<option selected="selected" value="<%=i%>"><%=i%></option>
													<%}else{%>
													<option value="<%=i%>"><%=i%></option>
													<%}
													}%>
													</select>
												 <span id="span_astriesk">*</span>			
											 </div>
									     </div>
							       	 </div>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Season :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
									      <div class='form-group internal'> 
													<select name="selSeason" id="selSeason" class="form-control" onchange="postData(this.value);">
													<option selected="selected" value="">Select One</option>
													<%
													ArrayList seasonDetails = (ArrayList)request.getAttribute("seasonList");
													if(seasonDetails!=null && seasonDetails.size()!=0){
													Iterator itr= seasonDetails.iterator();
													while(itr.hasNext()){
													String[] s = (String[]) itr.next();
													String seaId = s[0];
													String seaName = s[1];
													if(seasonId!=null && seasonId.equalsIgnoreCase(seaId)){
													%>
													<option value="<%=seaId%>" selected="selected" ><%=seaName%></option>
													<%}else{%>
													<option value="<%=seaId%>" ><%=seaName%></option>
													<%}}}%>
												 </select>
					                            <span id="span_astriesk">*</span>			
											 </div>
									     </div>
							       	 </div>
								<%
								 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
								 ArrayList dateListView=(ArrayList)request.getAttribute("dateDetails");
								 if(dateListView!=null && dateListView.size()!=0){ 
								 Iterator itDate = dateListView.iterator();
								  while(itDate.hasNext()){
										String [] dateDetail  = (String[]) itDate.next();
										String regDateId = dateDetail[0];
										String seaId = dateDetail[1];
										String seasonName = dateDetail[2];
										String stDueDate = dateDetail[3];
										String stGraceDate = dateDetail[4];
										String year = dateDetail[5];
										java.util.Date dueDate=null;
										java.util.Date graceDate=null;
										if(stDueDate!=null && stDueDate.trim().length()!=0){
										dueDate=(java.util.Date)sdf.parse(stDueDate);
										}if(stGraceDate!=null && stGraceDate.trim().length()!=0){
										graceDate=(java.util.Date)sdf.parse(stGraceDate);
										}
							
								 %>
					 <input type="hidden" name="regDateId" value="<%=regDateId%>"/>
					
		                     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Due Date :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                              <input name="txtDue" type="text" class="form-control"  readonly="readonly" value="<%=dateCheck(dueDate)%>"/> 
											  <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>		 												
			                 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Grace Date :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input name ="txtGrace" type="text" class="form-control" readonly="readonly" value="<%=dateCheck(graceDate)%>"/> 
											  <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>	
					
					       <%}}else{%>
					           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Due Date :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                            <input name="txtDue" type="text" class="form-control"   readonly="readonly"/>
											  <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>	
							   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Grace Date :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
                                               <input name ="txtGrace" type="text" class="form-control" readonly="readonly" />
											  <a href="javascript:cal1.popup();"><i id="calendar1" class="fa fa-calendar"></i></a>
											   <span id="span_astriesk">*</span>
											 </div>
										</div>
									</div>
								</div>		
				
									<%}%>
				 <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary'type="submit" name="appButton" id="appButton" value="Submit">Submit</button>
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


<script language="javascript">
    var cal1 = new calendar2(document.forms['myform'].elements['txtDue']);
	 cal1.year_scroll = true; 
	 cal1.time_comp = false;
	 
    var cal2= new calendar2(document.forms['myform'].elements['txtGrace']);
	cal2.year_scroll = true;
	cal2.time_comp = false;	
	
	
</script>
</body>
</html>

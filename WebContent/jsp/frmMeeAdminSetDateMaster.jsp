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

<script src="js/calendar2.js" type="text/javascript" ></script>
<script  src="js/ts_picker.js"></script>
<script src="js/frmMeeICPAssessment.js" type="text/javascript" ></script>
<script>
	/*function getEventRegTypeName(selEventRegTypeId){
	//alert(selMemTypeId);
		frmMemberList.memProcess.value = "getEventRegType";
		frmMemberList.method="post";
		frmMemberList.action="./SetDateMaster.html?eventTypName="+selEventRegTypeId;
		frmMemberList.submit();
	}
	*/
	function validNumber(){
		var myindex=document.frmGrossAmtMast.noOfDays.selectedIndex;
		var eventRegMasterIndex=document.frmGrossAmtMast.eventRegMaster_sel.selectedIndex;
		  
		if (eventRegMasterIndex==0) {
			alert("\nYou must Select Meeting Type.");
			document.frmGrossAmtMast.eventRegMaster_sel.focus();
			return(false);   
		}
		
		if(document.frmGrossAmtMast.regDate.value==""){
			alert("Please select Registration Date");
			return false;
		}
		
		if(!(document.frmGrossAmtMast.regDate.value=="")){
	
	var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	
	if(nowDate<10){
		nowDate="0"+nowDate;
	}

	if(nowMonth<10){
		nowMonth="0"+nowMonth;
	}

	if(!(document.frmGrossAmtMast.regDate.value=="")){
		strdate=document.frmGrossAmtMast.regDate.value;
		
		mm = Number(strdate.substring(0,2));
		dd = Number(strdate.substring(3,5));
		yyyy=(strdate.substring(6,document.frmGrossAmtMast.regDate.value.length));
		yyyy1=(Number(yyyy.length));

			if(yyyy<nowYear){
				alert("Enter Valid Registration Date.");
				document.frmGrossAmtMast.regDate.focus();
				return false;
			}

			if((yyyy==nowYear)&&(mm<nowMonth)){
				alert("Enter Valid Registration Date.");
				document.frmGrossAmtMast.regDate.focus();
				return false;
			}

			if (mm>12){
				alert("Enter Valid Registration Date.");
				document.frmGrossAmtMast.regDate.focus();
				return false;
			}

			if((dd<nowDate)&&(mm==nowMonth)){
				alert("Enter Valid Registration Date.");
				document.frmGrossAmtMast.regDate.focus();
				return false;
			}

			else if(dd>31){
				alert("Enter Valid Registration Date.");
				document.frmGrossAmtMast.regDate.focus();
				return false;
			}
		}
	}

	if(document.frmGrossAmtMast.meeDate.value==""){
			alert("Please select Meeting Date");
			return false;
		}

	if(!(document.frmGrossAmtMast.meeDate.value=="")){
		strdate1=document.frmGrossAmtMast.meeDate.value;
		mm1 = Number(strdate1.substring(0,2));
		dd1 = Number(strdate1.substring(3,5));
		yyy=(strdate1.substring(6,document.frmGrossAmtMast.meeDate.value.length));
		yyy1=(Number(yyy.length));

			if(yyy<nowYear){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}

			if((yyy1==nowYear)&&(mm1<nowMonth)){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}

			if (mm1>12){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}

			if((dd1<nowDate)&&(yyy<nowYear)&&(mm1==nowMonth)){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();


				return false;
			}

			else if(dd1>31){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}
		}


	if(!(document.frmGrossAmtMast.meeDate.value=="")){
		
		strdate2=document.frmGrossAmtMast.meeDate.value;
		mm2 = Number(strdate2.substring(0,2));
		dd2 = Number(strdate2.substring(3,5));
		yy = Number(strdate2.substring(6,document.frmGrossAmtMast.meeDate.value.length));
	
		strdate3=document.frmGrossAmtMast.regDate.value;
		mm3 = Number(strdate3.substring(0,2));
		dd3 = Number(strdate3.substring(3,5));
		y = Number(strdate3.substring(6,document.frmGrossAmtMast.regDate.value.length));
		
			if(yy<y){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}
			
			if((yy==y)&&(mm2<mm3)){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}
			
			
			if((mm2==mm3)&&(yy<y)&&(dd2<dd3)){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}
			if((mm2==mm3)&&(yy==y)&&(dd2<dd3)){
				alert("Enter Valid Meeting Date.");
				document.frmGrossAmtMast.meeDate.focus();
				return false;
			}
		}

		
		
		
		if (myindex==0) {
			alert("\nYou must Select a number.");
			document.frmGrossAmtMast.noOfDays.focus();
			return(false);   
		}

		return true;
	}
</script>



</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">

    <div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
	
        <!--==============================include header Here=================================-->
		
			<%@ include file = "../../include/HeaderProcess.jsp" %>
			
			
			
			<%
				String  eventRegTypId = (String)request.getAttribute("eventRegTypId");
				if(eventRegTypId==null || eventRegTypId.equals("")){
				eventRegTypId="";
				}
			%>
			
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
                            <h2>Meetings:Set a Date for Meeting</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
						
                            <p>Create New Privileges for all members and non-members</p>
							
						<!--==============================Form Description=================================-->
							
                           
							
							<!--==============================Form Body=================================-->
							
                            <form class='form-horizontal' role='form' name="frmGrossAmtMast" id="myform" action="./SetDateMaster.html" onsubmit="return validNumber();">
							
                                <input name="adminSetDateProcess" type="hidden" value="setDateForEvent">
								
								
								  <div class='panel-heading col-md-offset-2'>
										<h2>Set a Date for Meeting</h2>
									</div>

                                <div class='form-group'>
                                    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Meetings Type  :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
                                             <select name="eventRegMaster_sel" id="eventRegMaster_sel" class="form-control">
											<option value="">Select One</option>
											<% 
												String str1[] = null;
												Vector eventRegMasterVect=new Vector();
												  eventRegMasterVect=(Vector)request.getAttribute("eventRegMasterVect");
												  System.out.println("vector1:"+eventRegMasterVect);
												  Enumeration enm=eventRegMasterVect.elements();
												  
												  while(enm.hasMoreElements()){
														String[] s = (String[])enm.nextElement();
														for (int i=0;i<s.length; i++) {
															System.out.println("Content : "+s[i]);
														}
														String eventRegMasterId = s[0];
							
							
														String eventRegMasterName = s[1];
														
														System.out.print(" eventRegMasterId:  "+eventRegMasterId);
														System.out.print(" eventRegMasterName:  "+eventRegMasterName);
														
														%>
														
												  
														 <option value="<%=eventRegMasterId %>"><%=eventRegMasterName%></option>
													<%
													}
												   
														%>
											</select>
											
											<span id="span_astriesk">*</span>
                                            </div>
                                        </div>

                                    </div>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="text" name = "regDate" class="form-control" readonly/>	
										<a href="javascript:show_calendar('document.frmGrossAmtMast.regDate', document.frmGrossAmtMast.regDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
										<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Meeting Date :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<input type="text" name = "meeDate" class="form-control" readonly/>	
										<a href="javascript:show_calendar('document.frmGrossAmtMast.meeDate', document.frmGrossAmtMast.meeDate.value);"><i id="calendar1" class="fa fa-calendar"></i></a>
										<span id="span_astriesk">*</span>
											</div>
										</div>
									</div>
									
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>No. Of Days :</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<select name="noOfDays" id="select7" class="form-control">
														<option selected="selected">Nos.</option>
														<option>01</option>
														<option>02</option>
														<option>03</option>
														<option>04</option>
														<option>05</option>
														<option>06</option>
														<option>07</option>
														<option>08</option>
														<option>09</option>
														<option>10</option>
														<option>11</option>
														<option>12</option>
														<option>13</option>
														<option>14</option>
														<option>15</option>
														<option>16</option>
														<option>17</option>
														<option>18</option>
														<option>19</option>
														<option>20</option>
														<option>21</option>
														<option>22</option>
														<option>23</option>
														<option>24</option>
														<option>25</option>
														<option>26</option>
														<option>27</option>
														<option>28</option>
														<option>29</option>
														<option>30</option>
														<option>31</option>
									  </select>
											</div>
										</div>
									</div>
									
									
							</div>
                                <div class='form-group'>
                                    <div class='col-md-offset-4  col-md-2'>
                                        <button class='btn-lg btn-primary' type='submit'>Set Date</button>
                                    </div>
                                    <div class='col-md-1'>
                                        <button class='btn-lg btn-danger' style='' type='button' onclick="javascript:history.back(-1);" >Cancel</button>
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
			
</body>

</html>

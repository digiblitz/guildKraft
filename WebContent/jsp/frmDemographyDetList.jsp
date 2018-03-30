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
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="com.hlcutil.HLCMemberVO"%>
<%@ page import="com.hlcutil.HLCCalendarVO"%>
<%@ page import="com.hlcutil.HLCHorseRegListVO"%>
<%@ page import="com.hlccommon.util.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script language="javascript" type="text/javascript">
function checkValidity(horseMemberId){
	var horseIds = document.getElementById('horseIds').value;
	
	if(horseIds.indexOf(horseMemberId)!=-1){
		alert("Selected Non-Human Already Registered");
		return false;
	}
	return true;
}
</script>
<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
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
				<!--==============================panel=================================-->
					<div class='panel-heading'>
                            <h2>HLC X-Entry: Non-Human Selection Screen</h2>
					</div>
				<!--==============================panel=================================-->	
					 <div class='panel-body'>	
			
     
				
	<form name="frmDemographyDetList" class='form-horizontal' id="frmDemographyDetList" action="OEEDemo.html" >
	
		  <%String horseCheck=(String)request.getAttribute("valStat");%>
				  
				  		
		<% 
		
		
		
		String tmpVal="";
		String eveTyp2="";
		String eveDiv1="";
		ArrayList eventLevelDetails = (ArrayList)request.getAttribute("eventLevelDetails");
		System.out.println(	"eventLevelDetails: "+eventLevelDetails);
		
		if(eventLevelDetails!=null && eventLevelDetails.size()!=0){
		Iterator itrSub = eventLevelDetails.iterator();
		while(itrSub.hasNext()){
		String[] subEntry = (String[])itrSub.next();
		String eveCode = subEntry[2];
		 eveTyp2 = subEntry[3];
		 eveDiv1 = subEntry[7];
		System.out.println("tmpVal"+eveCode);
		if(tmpVal==""){
		tmpVal = eveCode+"("+eveDiv1+")";		
		}else{	
		tmpVal = tmpVal + ","+ eveCode+"("+eveDiv1+")";	
		}														
		}								
		}
		
		ArrayList selectedHorseMemberIds = (ArrayList)session.getAttribute("selectedHorseMemberIds");
		String orgFirstName = (String)session.getAttribute("orgFirstName");
		String orgLastName = (String)session.getAttribute("orgLastName");
		
		String eventTypeId = (String)session.getAttribute("eventTypeId");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");					   
		java.sql.Date tempDate = new java.sql.Date((new java.util.Date()).getTime());
		String currentDate=String.valueOf(tempDate);
		String attactDate = String.valueOf(tempDate).substring(5,7)+"/"+String.valueOf(tempDate).substring(8,10)+"/"+String.valueOf(tempDate).substring(0,4);
		String memberStatus = (String)request.getAttribute("isMember");
		HLCMemberVO memVO = new HLCMemberVO();
		boolean amaSt1=false;
		boolean amaSt2=false;
		String amStatus1="";
		String amStatus2="";
		memVO = (HLCMemberVO)request.getAttribute("memDetails");
		String compYear = (String)session.getAttribute("compYear");
		
		String memberId = memVO.getMemberId();
		String memberName = memVO.getMemberName();
		String age = dateFormat(memVO.getAge());
		String address = memVO.getAddress();
		String city = memVO.getCity();
		String state = memVO.getState();
		String zipcode = memVO.getZipcode();
		amaSt1 = memVO.isDecAmaStatus1();
		amaSt2 = memVO.isDecAmaStatus2();
		String membTypeName=memVO.getMembTypName();
		
		if(amaSt1==true) amStatus1="Yes";
		else amStatus1="No";
		
		if(amaSt2==true) amStatus2="Yes";
		else amStatus2="No";
		
		Calendar cal = Calendar.getInstance();
		
		long stTime = memVO.getAge().getTime();
		long eTime = tempDate.getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));				
  %>
  

    	<div class='form-group'>
			
    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Selected for your Entry:</label>
	
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   		<img name="" src="" width="1" height="1" alt="" style="background-color: #F0F0F0" />
							</div>
						</div>
					</div>
						<input type="hidden" name="eventTypeId" id="eventTypeId" value="<%=eventTypeId%>" />
						
	<div style="display:inline-block;width:100%;">					

<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Selected Rider:</label>

			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
	  					<%=memberName%> (ID#<%=memberId%>)
					</div>
				</div>
			</div>
		</div>	
			<div style="display:inline-block;width:100%;">
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Age:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<label class="control-label"><%=(noDays/365)%></label>
					</div>
				</div>
			</div>
		</div>	
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Membership Level:</label>
		<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<%=membTypeName%>
				</div>
			</div>
		</div>
					
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Amateur</label>
		<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					 (<%=amStatus2%>)
				</div>
			</div>
		</div>
		
		
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address:</label>
		<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<%=address%> / <%=city+"/"+state%> &nbsp;<%=zipcode%>
				</div>
			</div>
		</div>
		      <div style="display:inline-block;width:100%;">
 				<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
						   	<img name="" src="" width="1" height="1" alt="" style="background-color: #F0F0F0" />
						</div>
					</div>
				</div>
				</div>
<p class="para col-md-offset-3">Selected  Event</p>


	<%
						  HLCCalendarVO calVO = new HLCCalendarVO();
						  ArrayList objProCalList = (ArrayList)request.getAttribute("selectEventDetails");
								if(objProCalList!=null && objProCalList.size()!=0){
								   Iterator itr =objProCalList.iterator();
                           
							while(itr.hasNext()){
								calVO =(HLCCalendarVO)itr.next();
								String eventId = calVO.getEventId();
								String beginDate=dateFormat(calVO.getBeginDate());
								String endDate=dateFormat(calVO.getEndDate());
								String eventTitle=calVO.getEventTitle();
								String orgId=calVO.getOrganizerId();
								String areaCode=calVO.getAreaCode();
								String areaName=calVO.getAreaName();
								String stateName=calVO.getStateName();
								String areaChApprovStat=calVO.getOrgApprovalStatus();
								String status=calVO.getStatus();
								
								    
						  %>

 			    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event:</label>
					<div class='col-md-8'>
					   <div class='col-md-3 indent-small'>
						   <div class='form-group internal'>
								<%=eventTitle%> (<%=areaCode%>) &nbsp;<%=stateName%> |
								 <a href="http://dashboard.useventing.com/resources/scripts/omnibus_preview/index.asp?event_id=<%=eventId%>" target="_blank">Omni Listing</a>
							</div>
						</div>
					</div>
					
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Date:</label>
			
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
		 				<%=beginDate%> to <%=endDate%><br/>	
					</div>
				</div>
			</div>
			
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Open Date:</label>
		 
		  <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
		 			<%=calVO.getEntryStrtDate()%> | Close Date: <%=calVO.getEntryEndDate()%>
				</div>
			</div>
		</div>
		
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Levels Offered: </label>
		
		 <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<%=tmpVal%>	
				</div>
			</div>
		</div>	
	</div>
						
	<%}}else{%>	
			<div class='form-group'>
					
							
							<div class='col-md-4 col-md-offset-4'>
								No records are available.
							</div>
						
				</div>
		
		<%}%>		
	<div class='form-group'>
	<img name="" src="" width="1" height="1" alt="" style="background-color: #F0F0F0" />
<p class="para col-md-offset-3">Select a Non-Human</p>
	
	 <%if(horseCheck!=null && horseCheck.equalsIgnoreCase("Non-Human Already Registered")){%>
    <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					 <span class="asterisk" id="p_error"> <%=horseCheck%></span>
				</div>
			</div>
		</div>	
   
	 <%}%>
     
	  
		<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<img name="" src="" width="1" height="1" alt="" style="background-color: #F0F0F0" />
				</div>
			</div>
		</div>

		
		<%
						String titleEventTypeName="";
							String hId = "";
							ArrayList userInfo = (ArrayList) request.getAttribute("userInfo");
							if(userInfo!=null && userInfo.size()!=0){
							Iterator itr = 	userInfo.iterator();
							while(itr.hasNext()){
								HLCHorseRegListVO AppHrListVO = (HLCHorseRegListVO) itr.next();								
								String horseMemberId = AppHrListVO.getHorseMemberId();
								String horseName = AppHrListVO.getHorseName();
								String reqStatus = AppHrListVO.getStatusName();
					
								String ownerId = AppHrListVO.getOwnerId();
								java.util.Date dte = AppHrListVO.getAddDate();
								String memberType = AppHrListVO.getMembershipTypeName();
								String date  = "N/G";
								String yrFoaled=AppHrListVO.getYearFoaled();
								String horseURL = "OEEAddTrainer.html?process=initTrainer&horseMemberId="+horseMemberId+"&eventTypeId="+eventTypeId+"&compYear="+compYear+"&horseName="+horseName;
								if(selectedHorseMemberIds!=null && selectedHorseMemberIds.size()!=0){
									Iterator ish = selectedHorseMemberIds.iterator();
									while(ish.hasNext()){
										hId = hId+"#"+(String)ish.next();
									}
								}
								if(dte!=null){
									date = sdf.format(dte);
								}
								
								Calendar cal2 = Calendar.getInstance();
                  
                    int currentYear = cal2.get(Calendar.YEAR);
                    int horseYear = 0;
                    if(yrFoaled!=null && yrFoaled.trim().length()!=0) horseYear = Integer.parseInt(yrFoaled);
                   int horseAge = currentYear - horseYear;
					
								
								%>	   
						
		
						
	<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<a href="<%=request.getContextPath()%>/OEEAddTrainer.html?process=initTrainer&horseMemberId=<%=horseMemberId%>&eventTypeId=<%=eventTypeId%>&compYear=<%=compYear%>&horseName=<%=horseName%>&horseAge=<%=horseAge%>&memberType=<%=memberType%>&date=<%=date%>&riderMemberId=<%=memberId%>" style="text-decoration:none;">
                   <div align="center" style="width:85px;background:#006699;color:#FFFFFF;padding:3px;font-size:14px;font-family:Arial, Helvetica, sans-serif;font-weight:bold;">Select Non-Human</div></a>
		             </div>	
	              </div>
              </div>
	
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Non-Human:</label>
		 <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
		 				<%=horseName%>  (ID# <a href="RegHorseListing.html?process=chngdesc&memid=<%=horseMemberId%>" onclick="return checkValidity(<%=horseMemberId%>)"><%=horseMemberId%></a>)
					</div>
				</div>
			</div>
					
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Age:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
			 			<%=horseAge%> 
					</div>
				</div>
			</div>
			
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Level:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						 <%=memberType%>
						</div>
					</div>
				</div>
				
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Date:</label>
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						 <%=date%>
						</div>
					</div>
				</div>
		
	
						  <% String eventId = (String)session.getAttribute("eventId"); %>
						<!--<input type="hidden" name="eventId" value="<%//=eventId%>" />
			<input type="hidden" name="horseMemberId" value="<%//=horseMemberId%>" />
			<input type="hidden" name="compYear" value="<%//=compYear%>" />
				<input type="hidden" name="process" value="UpgradeDet"/>
				<input type="hidden" name="memid" value="<%//=horseMemberId%>"/>
				<input type="hidden" name="horseAge" value="<%//=horseAge%>"/>
				<input type="hidden" name="memberType" value="<%//=memberType%>"/>
				<input type="hidden" name="date" value="<%//=date%>"/>-->
			  	
			<div class='col-md-8'>
				<div class='col-md-3 indent-small'>
					<div class='form-group internal'>
						<img name="" src="" width="1" height="1" alt="" style="background-color: #F0F0F0" />
					</div>
				</div>
			</div>
     </div>


					  <%		 
					 	}}%>	       
	               <div class="form-group">
					<div class=' col-md-3 col-md-offset-3'>
                      	<button class='btn-lg btn-primary' type="button" name="register" value="Search / Register New Non-Human" onclick="location.href='SearchHorse.html?searchProcess=initView&source=fromEventEntry'">Search / Register New Non-Human</button>
					</div>
					</div>
				 <input type="hidden" name="horseIds" id="horseIds" value="<%=hId%>" />
			





			  </form>
			
                            </div>
	    				</div>
						
                    </div>
					
                </div>
				
          
		  
			
			
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/chat_new.jsp" %>
				
			<!--==============================include chat Here=================================-->


   			</div>
		
		
		   
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
	</body>
</html>

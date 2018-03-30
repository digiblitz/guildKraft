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
<%@ page import="java.util.Date"%>
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
<script src="js/basic.js" type="text/javascript" ></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/calendar2.js" type="text/javascript"></script>
<script src="js/frmOECAreaChairEdit.js" type="text/javascript"></script>

<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1"><%! 
String  nullCheck(String fieldName){
	String retValue = "N/A";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
}

%>
<%! String dateCheck(Date fieldName){
        SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
		String detValue = "";
        if(fieldName!=null){
            detValue = sdf.format(fieldName);
        }
        return detValue;
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
						<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
							<h2>Online Entries : Event Details </h2>
						</div>
 			 <!-- ==================================================Add Dimension Details==============================================-->  
						<div class='panel-body'>
     						 <p>Required fields are marked with an asterisk <span class="asterisk" id="span_astriesk">*</span></p>
     
      <% 
	  String areaChairList = (String)request.getAttribute("areaChairList");
	  
	  String statuscheck = (String)request.getAttribute("err");
				
				if(statuscheck!=null && statuscheck.equals("st")){
				%>
     					<p> Try Again!</p>
     
      <%
				}
				%>
    			  <p>Edit/Update Event Details:</p>
     
      <%
		HLCCalendarVO calVO = new HLCCalendarVO();
		
		calVO = (HLCCalendarVO)request.getAttribute("singleEventDetails");
		
		String provisionId = calVO.getCalenderId();
		Date startDate = calVO.getBeginDate();
		String tempDt =(startDate.toString()); 
		Date endDate = calVO.getEndDate();
		Date entryBeginDte = calVO.getEntryStrtDate();
		Date entryEndDte = calVO.getEntryEndDate();
		Date extDueDte = calVO.getExtDueDate();
		String eventTitle = calVO.getEventTitle();
		String selAreaId1 = calVO.getAreaId();
		String selStateId1 = calVO.getStateId();
		System.out.println("selAreaId1"+selAreaId1);
		System.out.println("selStateId1"+selStateId1);
		String orgStatus = calVO.getOrgApprovalStatus();
		String renewalStatus = calVO.getRenewStat().toString();
		String eventId = calVO.getEventId();
		String eventDesc = calVO.getEventDesc();
		String eventLevels = calVO.getEventLevel();
		String orgComments = calVO.getOrgComments();
		String acStatus = calVO.getArearChairApproStatus();
        String acComments = calVO.getAreaChairCommt();
        String usStatus = calVO.getApprovalStatus();
        String usComments = calVO.getStaffComments();
		String rStat = "";
		if(renewalStatus.equalsIgnoreCase("true"))	rStat = "No";
		else rStat = "Yes";
		
		long stTime = calVO.getBeginDate().getTime();
		long eTime = calVO.getEndDate().getTime();
		long diffTime = eTime - stTime;
		int noDays = (int)(diffTime/(1000*60*60*24));
		int tempNo=noDays+1;
		String noOfDays=new Integer(tempNo).toString();
		System.out.println("noOfDays"+noOfDays);
		String modifyBy="";
		%>
			
      <form name="frmOECAreaChairEdit" id="frmOECAreaChairEdit" method="post" action="./calender.html"  onsubmit="return onvalidate();">
        <input type="hidden" name="method" value="updateAreaChair"/>
        <input type="hidden" name="provisionId" value="<%=provisionId%>" />
		<input type="hidden" name="noOfDays" value="<%=noOfDays%>" />
		<input type="hidden" name="modifyBy" value="<%=modifyBy%>" />
		<input type="hidden" name="compYear" value="<%=tempDt.substring(0,4)%>"/>
		<input type="hidden" name="tempareaChairList" value="<%=areaChairList%>"/>
		
		
		 <div class="margin marginn">
								<div class="form-group">
									<div class="col-md-12 gp ">
										
										<div class="container"> 
								   		
									  		 <div class="row"> 
											 
											 	<div class="col-md-1">
													</div>
								
												<div class="col-md-2">
													<label class='control-label'> Event Title :</label>
												</div>
					<div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>							
										<input  type="text" name="txtEventTitle" id="txtEventTitle"  class="form-control" value="<%=nullCheck(eventTitle)%>" size="25" maxlength="20" /><span class="asterisk" id="span_astriesk">*</span>
			 						 </div>
			 					</div>
						</div>  
			
			
        		<div class="col-md-2">
						<label class='control-label'>Event Begin Date :</label>
				</div>

         		 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>	
									<input  type="text" name="startDate1" id="startDate1" readonly="readonly" class="form-control" value="<%=dateCheck(startDate)%>" size="25" maxlength="20" />
          <a onclick="javascript:NewCssCal('startDate1')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
       								</div>
								</div>
							</div>	
							
       				<div class="col-md-2">
						<label class='control-label'>Event End Date :</label>
					</div>
					
					 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>	
    						<input  type="text" name="endDate" id="endDate" readonly="readonly" class="textboxOne" value="<%=dateCheck(endDate)%>" size="25" maxlength="20" />
              <a onclick="javascript:NewCssCal('endDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
									</div>
								</div>
							</div>
        				
         		 <div class="col-md-2">
						<label class='control-label'>Area Name :</label>
				</div>
				
				 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>	
		  				  <select name="selAreaId" id="selAreaId" class="form-control" >
						  <option selected="selected" value=" ">Select One</option>
							<%
							ArrayList areaList = (ArrayList)request.getAttribute("selectAreaDetails");
							if(areaList!=null && areaList.size()!=0){
							Iterator it1 = areaList.iterator();				
							while(it1.hasNext()){
							String sr1[] = (String[])it1.next();
							String selAreaId = sr1[0];
							String selArea  = sr1[2];
							if(selAreaId.equals(selAreaId1)){				
							%>
						   <option value="<%=selAreaId%>" selected="selected"> <%=selArea%> </option>
							<%
							}else{
							%>
							<option value="<%=selAreaId%>"> <%=selArea%> </option>	 
							<%}}}%>
							</select>
						<span class="asterisk" id="span_astriesk">*</span>&nbsp;
				</div>
			</div>
		</div>	
		
			
          <div class="col-md-2">
						<label class='control-label'>State Name :</label>
			</div>
			
			
         		 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>	
		  				  <select name="selStateId" id="selStateId" class="form-control" >
						  <option selected="selected" value=" ">Select One</option>
							<%
							ArrayList stateList = (ArrayList)request.getAttribute("selectStateDetails");
							if(stateList!=null && stateList.size()!=0){
							Iterator it1 = stateList.iterator();				
							while(it1.hasNext()){
							String sr1[] = (String[])it1.next();
							String selStateId = sr1[0];
							String selState  = sr1[1];
							if(selStateId.equals(selStateId1)){				
							%>
						   <option value="<%=selStateId%>" selected="selected"> <%=selState%> </option>
							<%
							}else{
							%>
							<option value="<%=selStateId%>"> <%=selState%> </option>	 
							<%}}}%>
							</select>
						<span class="asterisk" id="span_astriesk">*</span>&nbsp;
					</div>
				</div>
		</div>
		
		
          <div class="col-md-2">
				<label class='control-label'>Entry Reg. Begin Date :</label>
			</div>
			
		 <div class='col-md-8'>
							<div class='col-md-3 indent-small'>
									<div class='form-group internal'>	
							<input  type="text" name="entryBeginDate" id="entryBeginDate" readonly="readonly" class="form-control" value="<%=dateCheck(entryBeginDte)%>" size="25" maxlength="20" />
              <a onclick="javascript:NewCssCal('entryBeginDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
						</div>
					</div>
				</div>	
				
				
         <div class="col-md-2">
				<label class='control-label'>Entry Reg. End Date :</label>
		</div>
        
		<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>	
					<input  type="text" name="entryEndDate" id="entryEndDate" readonly="readonly" class="form-control" value="<%=dateCheck(entryEndDte)%>" size="25" maxlength="20" />
               <a onclick="javascript:NewCssCal('entryEndDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
				</div>
			</div>
		</div>		
				
	<div class="col-md-2">
				<label class='control-label'>Extended Due Date</label>
	</div>
	
	<div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>	
					<input  type="text" name="extDueDate" id="extDueDate" readonly="readonly" class="form-control" value="<%=dateCheck(extDueDte)%>" size="25" maxlength="20" />
 					<a onclick="javascript:NewCssCal('extDueDate')"><i id="calendar1" class="fa fa-calendar"></i></a>
									<span id="span_astriesk">*</span>
				</div>
			</div>
		</div>		
				
				
		 <div class="col-md-2">
				<label class='control-label'>Event Levels : <span class="asterisk" id="span_astriesk">*</span></label>
		</div>
		  	 <div class="col-md-2">
				<label class='control-label'>Championship Details :</label>
			</div>
          <%! String x1; %>
			
			<% 
            int countVal=0;           
			int chksfx=0;
			String cbx="divlevel";
			boolean entIdStatus=false;
			boolean chStatus=false;
			String eventcnt="";
			java.util.Vector allTypesVect=new Vector();
			allTypesVect=(java.util.Vector)request.getAttribute("allTypesVect");
			Enumeration itrators= (Enumeration)allTypesVect.elements();
			int i=0;
			countVal=allTypesVect.size();
			while(itrators.hasMoreElements()){
			String[] s = (String[]) itrators.nextElement();                                    
			String code=s[4];
			String selEventId=s[2];
			String selEventTypeId=s[1];
			String mid=s[0];
			String cnct=selEventId+"#"+code+"#"+selEventTypeId;
			i++;
			ArrayList eventList1 = (ArrayList)request.getAttribute("selectedEventDetails");
						if(eventList1!=null && eventList1.size()!=0){
							Iterator it = eventList1.iterator();
							while(it.hasNext()){
								entIdStatus = false;
								String sr[] = (String[])it.next();
								String selectEventId = sr[0];
								String selectEvTypeId = sr[2];
								String champStatus =sr[5];
								boolean champSts=Boolean.parseBoolean(champStatus);
								eventcnt=selectEventId+"#"+selectEvTypeId;
								if(selEventTypeId.equals(selectEvTypeId)){
									if(selEventId.equals(selectEventId)){
									entIdStatus = true;
									if(champSts==true){
									chStatus=true;
									}else if(champSts==false){
									chStatus=false;
									}
									break;
									
									
									}
								}
				   			 }
					   }
			%>   
			    <%
				String cbxname=cbx+Integer.toString(chksfx);
				if(!(s[3].equals(x1))){
				x1=s[3];
				%>
					
          
		 <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
						<%=x1%>
		  		</div>
			</div>
		</div>		
		  <%}%>
		  <%if(entIdStatus==true){
		  
		  %>
		  
		  
		    <div class='col-md-8'>
                <div class='col-md-3 indent-small'>
                     <div class='form-group internal'>
					 	 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
							<input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>"  checked="checked"/><%=code%> 
						</div>
		  <%if(chStatus==true){ %>
        			 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
		 					<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" checked="true"/>Yes
					</div>
					
					<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
            			<input type="radio" size="10" name="champ<%=i%>" value="no" /> No 
					</div>
					
			<%}else{%>
			
			<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
			<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>" />Yes
			</div>
			
			<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
            <input type="radio" size="10" name="champ<%=i%>" value="no" />No 
			</div>
			<%}%>
          <%
			}else{
			 
				%>
				<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
				<input type="checkbox" size="10" name="txtEvent<%=i%>" id="txtEvent<%=i%>" value="<%=cnct%>" /> <%=code%>
				</div>
				
				<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
         			<input type="radio" size="10" name="champ<%=i%>" value="<%=eventcnt%>"  />Yes
				</div>
				
				<div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
            		<input type="radio" size="10" name="champ<%=i%>" value="no" />No
				</div>
			<%}
			chksfx++;} 
			%>
			<input type="hidden" name="countVal" value="<%=countVal%>"/>
			<input type="hidden" name="allTypesVect" id="allTypesVect" value="<%=allTypesVect.size()%>" />
				</div>
			</div>
		</div>		
			     
        <div class="col-md-2">
				<label class='control-label'>Area Chair Comments :</label>
		</div>
		
			
     <div class='col-md-8'>
			<div class='col-md-3 indent-small'>
				<div class='form-group internal'>
					<textarea id="txtACComm" name="txtACComm" rows="5" class="textboxOne" cols="25"><%=nullCheck(acComments)%></textarea>
				</div>
			</div>
		</div>		
		
		
             <div class='form-group'>
                    <div class='col-md-offset-4 col-md-1'>
                        <button class='btn-lg btn-primary' type='submit'>Update</button>
					</div>
				
				
				 <div class='col-md-offset-4 col-md-1'>
					<button class='btn-lg btn-danger' type='submit' onclick="javascript:history.back(-1);">Cancel</button>
				</div>
			</div>
								</div>
										
							</div>
									
						</div>
									
                     </div>
				</div>
          
      </form>
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
		
 
			<!--==============================include chat Here=================================-->
			
				<%@ include file = "../../include/FooterProcess.jsp" %>
				
			<!--==============================include chat Here=================================-->
			


<!--==============================================footer end here============================================-->
<script language="javascript">
    var cal1 = new calendar2(document.forms['frmOECAreaChairEdit'].elements['startDate1']);
	 cal1.year_scroll = true; 
	 cal1.time_comp = false;
	 
    var cal2= new calendar2(document.forms['frmOECAreaChairEdit'].elements['endDate']);
	cal2.year_scroll = true;
	cal2.time_comp = false;	
	
	
	 var cal3 = new calendar2(document.forms['frmOECAreaChairEdit'].elements['entryBeginDate']);
	 cal3.year_scroll = true; 
	 cal3.time_comp = false;
	 
    var cal4= new calendar2(document.forms['frmOECAreaChairEdit'].elements['entryEndDate']);
	cal4.year_scroll = true;
	cal4.time_comp = false;	
	
		 
    var cal5= new calendar2(document.forms['frmOECAreaChairEdit'].elements['extDueDate']);
	cal5.year_scroll = true;
	cal5.time_comp = false;	

</script>
</body>
</html>

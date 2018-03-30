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
<%@ page import="com.hlcmrm.util.HLCDonationVO"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->
<script src="js/frmInsertQualificationDetails.js" type="text/javascript" ></script>
<script language="javascript">
function postData(userType){
	document.frmSelEvents.method="post";
	document.frmSelEvents.action="./OEEValidate.html?cmd=editRegLevel&usrTyp="+userType;
	document.frmSelEvents.submit();
	return true;
}

function myValidate(){
	if(document.frmSelEvents.eventType.value==""){
		alert("Select an Event Type");
		document.frmSelEvents.eventType.focus();
		return false;
	}
	if(document.frmSelEvents.userType.value==""){
		alert("Select a User Type");
		document.frmSelEvents.userType.focus();
		return false;
	}
    if(document.frmSelEvents.selArea.value!="" && document.frmSelEvents.chmpStatus.value==""){		
		alert("Select a Championship Status");
		document.frmSelEvents.chmpStatus.focus();
		return false;			
	}
	return true;
}
</script>


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
				<%! 
				String nullCheck(String fieldName){
					String retValue = "";
						if(fieldName!=null && fieldName.trim().length()!=0){
						retValue = fieldName;
						}
					return retValue;
				}
				
				%>
				
				<%! 
					String zeroCheck(int fieldName){
						String zeroValue = "";
						if(fieldName!=0){
							zeroValue = ""+fieldName;
						}
					return zeroValue;
				}
				
				%>

 			<div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
						<h2>Online Entries : Edit Qualification Details</h2>
					</div>
					
					<div class='panel-body'>	

  <%
		Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
		ArrayList userTypeDetails = (ArrayList)request.getAttribute("userTypeDetails");
		ArrayList divisionTypeDetails = (ArrayList)request.getAttribute("divisionTypeDetails");
		ArrayList membershipTypeDetails = (ArrayList)request.getAttribute("membershipTypeDetails");
		ArrayList areaList = (ArrayList)request.getAttribute("areaDetails");
		
		String chmpStat = (String)request.getAttribute("chmpStat1");
		String eventTypeId = (String)request.getAttribute("eventTypeId");
		String userTypeId = (String)request.getAttribute("userTypeId");
		String areaId = (String)request.getAttribute("areaId");
		String divisionId = (String)request.getAttribute("divisionId");
		
		String updateStatus = (String)request.getAttribute("updateStatus");
		String iStatus = "";
	if(updateStatus!=null && updateStatus.equalsIgnoreCase("success")) iStatus = "Qualifications Details Updated Successfully";
		else if(updateStatus!=null && updateStatus.equalsIgnoreCase("failed")) iStatus = "Qualifications Details Not Updated";
		
  %>
 			
		 <%
		 	if(updateStatus!=null && updateStatus.trim().length()!=0){
		 %>
		 <div class='col-md-8'>
            <div class='col-md-3 indent-small'>
               <div class='form-group internal'><%=iStatus%></div>
			  </div>
			 </div>
		 <%}%> 
		 
		 
		 <form name="frmSelEvents" id="frmSelEvents" action="OEEValidate.html" method="post" onsubmit="return myValidate();">
		 <input type="hidden" name="cmd" value="validDetails" />
		 
		<div class='form-group'>
          <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Type:</label>
		  
		  <div class='col-md-8'>
              <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
		 			<select name="eventType" id="eventType" class="form-control">
		 				<option value="" selected="selected">Select One</option>
							<%
								if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
									Enumeration itr= (Enumeration)eventTypeDetails.elements();
									while(itr.hasMoreElements()){
										String[] s = (String[]) itr.nextElement();
										String typeId = s[0];
										String typeName = s[1];
										if(eventTypeId!=null && eventTypeId.equalsIgnoreCase(typeId)){
							%>
						<option value="<%=typeId%>" selected="selected" ><%=typeName%></option>
						<%}else{%>
						<option value="<%=typeId%>" ><%=typeName%></option>
						<%}}}%>
		 			</select><span class="asterisk" id="span_astriesk">&nbsp;*</span> 
					</div>
				</div>
			</div>
			
			
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>User Type:</label>
			
			<div class='col-md-8'>
              <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
		 			<select name="userType" id="userType" class="form-control" onchange="postData(this.value);">
		 				<option value="" selected="selected">Select One</option>
							<%
								if(userTypeDetails!=null && userTypeDetails.size()!=0){
									Iterator it = userTypeDetails.iterator();
									while(it.hasNext()){
										String [] uDet = (String[])it.next();
										String uTypeId = uDet[0];
										String uTypeName = uDet[1];
										if(userTypeId!=null && userTypeId.equalsIgnoreCase(uTypeId)){
							%>
					<option value="<%=uTypeId%>" selected="selected" ><%=uTypeName%></option>
						<%}else{%>
					<option value="<%=uTypeId%>" ><%=uTypeName%></option>
						<%}}}%>
		 			</select><span class="asterisk" id="span_astriesk">*</span>
				</div>
			</div>
		</div>
		 
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Division:</label>
		 <div class='col-md-8'>
              <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
						 <select name="division" id="division" class="form-control">
					 		<option value="" selected="selected">Select One</option>
							<%
								if(divisionTypeDetails!=null && divisionTypeDetails.size()!=0){
									Iterator ite = divisionTypeDetails.iterator();
										while(ite.hasNext()){
											String [] divDet = (String[])ite.next();
											String divId = divDet[0];
											String divName = divDet[1];
								if(divisionId.trim().equalsIgnoreCase(divId)){
							%>
							<option  value="<%=divId%>" selected="selected"><%=divName%></option>
								<%}
								else{
								%>
							<option  value="<%=divId%>"><%=divName%></option>
							<%
							}
							}
							}					
							%>   
						</select>
					</div>
				</div>
			</div>
						
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Area:</label>
		 <div class='col-md-8'>
              <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
		 			<select name="selArea" id="selArea" class="form-control">
		 	  			<option selected="selected" value="">Select One</option>
							<%
			if(areaList!=null&& areaList.size()!=0){
							Iterator areaLst = areaList.iterator();
							while(areaLst.hasNext()){
									String AreaLstArr[] = (String [])areaLst.next();
									String area_id = AreaLstArr[0];
									String area_code = AreaLstArr[1];
									String area_name = AreaLstArr[2];
									out.print("area_id "+area_id);
									if(areaId.trim().equalsIgnoreCase(area_id)){
							%>
						<option  value="<%=area_id%>" selected="selected"><%=area_name%></option>
							<%	}
								else{
							%>
						<option  value="<%=area_id%>"><%=area_name%></option>
							<%

							}
							}
							}
					
						%>
                    </select>
				</div>
			</div>
		</div>
					
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Championship Status:</label>
		 <div class='col-md-8'>
              <div class='col-md-3 indent-small'>
                  <div class='form-group internal'>
		 			<select name="chmpStatus" id="chmpStatus" class="form-control" >
						<option selected="selected" value="" >Select One</option>
							<%	
							String[] status = new String[]{"Yes","No"};
								for(int k =0; k<status.length; k++){
							if(chmpStat!=null && chmpStat.equalsIgnoreCase(status[k])){
							%>
					<option value="<%=status[k]%>" selected="selected" ><%=status[k]%></option>
							<%}else{%>
					<option value="<%=status[k]%>"><%=status[k]%></option>
						<%}}%>
				</select>
			</div>
		</div>
	</div>
</div>
								
		<div class='form-group'>
				<div class='col-md-offset-4 col-md-1'>
					<button class='btn-lg btn-primary' name="submit" type="submit" value="Submit">Submit</button>
				</div>
		</div>
	
		 </form>
		
		  <form name="frmUpdateValidation" id="frmUpdateValidation" action="OEEValidate.html" method="post" onsubmit="return editValidate();">
		  <input type="hidden" name="cmd" value="update"/>
  		  
			<input type="hidden" name="inEventId" id="inEventId" value="<%=eventTypeId%>" />
			<input type="hidden" name="inUserId" id="inUserId" value="<%=userTypeId%>" />
			<input type="hidden" name="indivisionId" id="indivisionId" value="<%=divisionId%>" />
			<input type="hidden" name="inAreaId" id="inAreaId" value="<%=areaId%>" />
			<input type="hidden" name="inChmp" id="inChmp" value="<%=chmpStat%>" />
			
		<div class='form-group'>
			 <div class='col-md-12 gp'>
				<div class='col-md-1'>
					<label class='control-label label1'>Event Level</label>
				</div>	
				
				<div class='col-md-1'>
					<label class='control-label label1'>Event Level Rank</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Min. Age</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Max. Age</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Qual Period</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Minimum Rank</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Minimum Count</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Maximum Rank</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Penalty:Jump</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Penalty:Time</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Registration Level</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label label1'>Amateur Status</label>
				</div>
		  </div>
	</div>
	<%	
		HLCValidationVO valVO = new HLCValidationVO();
				
				boolean amaStatus=false;
				
				String amStatus="";
				ArrayList validList = (ArrayList)request.getAttribute("viewValidationDetails");
	if(validList!=null && validList.size()!=0){

	%>
	 <input type="hidden" name="qualiSize" id="qualiSize" value="<%=validList.size()%>"/>
		   <%
				Iterator itr = validList.iterator();
					int i=0;
					while(itr.hasNext()){
						valVO = (HLCValidationVO)itr.next();
						String qualificationId=valVO.getQualificationId();
						String eventLevelName = valVO.getEventLevelNames();						
						boolean champStatus = valVO.getChampStatus();
						String divisionName = valVO.getDivisionName();						
						String eventLevelId = valVO.getEventLevelId();
						String minRank = valVO.getMinRank();
						int minAge = valVO.getMinAge();
						int maxAge = valVO.getMaxAge();
						String qualPeriod = valVO.getQualicPeriod();
						String rank = valVO.getEveLevelRank();
						String maxRank = valVO.getMaxRank();
						int minCount = valVO.getMinCount();
						String jump = valVO.getMaxXcJmpenal();
						String time = valVO.getMaxXcTimepenal();
						String membName1 = valVO.getMembTypeName();
						String membTypId = valVO.getMemTypId();
					    amaStatus = valVO.getAmateurStatus();
						if(amaStatus==true){
						amStatus="checked";
						}else{
						amStatus="";
						}
						String forCheckBox = "";
						if((rank!=null && rank.trim().length()!=0)||(minAge!=0)||(maxAge!=0)||(qualPeriod!=null && qualPeriod.trim().length()!=0)||
							(minRank!=null && minRank.trim().length()!=0)||(minCount!=0)||(jump!=null && jump.trim().length()!=0)||
							(time!=null && time.trim().length()!=0)||(membTypId!=null && membTypId.trim().length()!=0)||(amStatus.equalsIgnoreCase("checked"))){
							forCheckBox = "checked";
						}else{
							forCheckBox = "";
						}
			%>
			<input type="hidden" name="qualificationId<%=i%>" id="qualificationId<%=i%>" value="<%=qualificationId%>"/> 
			<div class='form-group'>
				<div class='col-md-12 gp'>
					<div class='col-md-1'>
					 <div class='make-switch' data-off-label='NO' data-on-label='YES' id='id_slide_switch'>
						 <label class='control-label '>
						 	<input type="checkbox" <%=forCheckBox%> name="eventLevelId<%=i%>" class="form-control" id="eventLevelId<%=i%>" value="<%=eventLevelId%>"/><%=eventLevelName%>
						</label>
					</div>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="levelRank<%=i%>" id="levelRank<%=i%>" class="form-control" size="5" value="<%=nullCheck(rank)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="minAge<%=i%>" id="minAge<%=i%>" class="form-control" size="5" value="<%=zeroCheck(minAge)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="maxAge<%=i%>" id="maxAge<%=i%>" class="form-control" size="5" value="<%=zeroCheck(maxAge)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="qPeriod<%=i%>" id="qPeriod<%=i%>" class="form-control" size="5" value="<%=nullCheck(qualPeriod)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="minRank<%=i%>" id="minRank<%=i%>" class="form-control" size="5" value="<%=nullCheck(minRank)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="minCount<%=i%>" id="minCount<%=i%>"class="form-control" size="5" value="<%=zeroCheck(minCount)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="maxRank<%=i%>" id="maxRank<%=i%>" class="form-control" size="5" value="<%=nullCheck(maxRank)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="jumpPenalties<%=i%>" id="jumpPenalties<%=i%>" class="form-control" size="5" value="<%=nullCheck(jump)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<input type="text" name="timePenalties<%=i%>" id="timePenalties<%=i%>" class="form-control" size="5" value="<%=nullCheck(time)%>" />
					</label>
				</div>
				
				<div class='col-md-1'>
					<label class='control-label'>
						<select name="membershipLevel<%=i%>" id="membershipLevel<%=i%>" class="form-control">
					 		<option value="" selected="selected">Select One</option>
								<%
									if(membershipTypeDetails!=null && membershipTypeDetails.size()!=0){
										Iterator iter = membershipTypeDetails.iterator();
										while(iter.hasNext()){
											String [] membDet = (String[])iter.next();
												String membId = membDet[0];
												String membName = membDet[1];
						if(membTypId!=null && membTypId.equalsIgnoreCase(membId)){
					%>
					<option value="<%=membId%>#<%=membName%>" selected="selected" ><%=membName%></option>
					<%}else{%>
					<option value="<%=membId%>#<%=membName%>" ><%=membName%></option>
					<%}}}%>
		 		</select>
				</label>
			</div>
			
			<div class='col-md-1'>
				<label class='control-label'>
					<input type="checkbox" <%=amStatus%> name="amateurStatus<%=i%>" id="amateurStatus<%=i%>" value="<%=amaStatus%>"/>
				</label>
			</div>
		</div>
	</div>

		 
   		  <%
		   i++;		  
		   }
			}else{%>
			<div class='form-group'>
					<div class='col-md-5'>
						</div>
					<div class='col-md-5'>
						No Records Found
						</div>
				</div>
						  
						  <%
						  }
						  %>

				    <div class='form-group'>
                        <div class='col-md-offset-5 col-md-1'>
                             <button class='btn-lg btn-primary' type="submit" name="appButton" id="appButton" value="Update">Update</button>
						</div>
					</div>
					
		      </form>
				   
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

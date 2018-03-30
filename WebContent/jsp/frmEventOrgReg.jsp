<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<!--==============================================IMPORT THE CLASS START HERE============================================-->
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*"%>
<!--==============================================IMPORT THE CLASS END HERE============================================-->

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script src="js/basic.js" type="text/javascript" ></script>
<script src="js/frmEvenOrgtReg.js" type="text/javascript"></script>
<script src="js/frmEventOrganizerReg.js" type="text/javascript"></script>
<script src="js/calendar2.js" type="text/javascript"></script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>


<body onload="initCondition(); ">

<!--==============================================header start here============================================-->
<div>
 <!-- HEADER START HERE -->
<%@ include file = "../../include/HeaderProcess.jsp" %>
  <!-- HEADER ENDS HERE -->
</div>
<!--==============================================header end here============================================-->


<!--==============================================content start here============================================-->
<section id="content">

  <table width=100% height="350" border="1" cellpadding="0" cellspacing="0" class="content_new" align="center">
      <tr><td><%@ include file = "../../include/infobar.jsp" %><br /></td></tr>

  <tr>
      <td align="center" valign="middle" class="tableCommonBg">
	  <!--==============================================import content code start here============================================-->
	  
	  <table width="760" border="0" align="center" cellpadding="0" cellspacing="5" id="centerTab" style="border:thin;border-color:#000000;border-style:groove;border-width:thin">
		  
		  <tr>
			<td class="subDeptTablePad">
				<!-- CONTENTS START HERE -->

<div class="cmmnForm">

			<div class="colspan" style="border-bottom:thin;border-bottom-color:#000000;border-bottom-style:groove;border-bottom-width:thin">
				<strong>Organizer: <span class="styleBoldTwo">Event Registration Form</span></strong>			</div>
			<div id="commonBG" class="textCommon">
				Organizers, use this Event Registration form to register an event. This form has been
				divided into five parts for it's easy handling. <strong>Click on the tabs seen below to Expand / Contract it</strong>
				and hence reveal the hidden parts of the form.			</div>
			<%
			String payMode=(String)request.getAttribute("paymentMode");
		    //request.setAttribute("paymentMode",payMode);
			System.out.println("payMode :"+payMode);
			String amt=(String)request.getAttribute("amount");
		    //request.setAttribute("amount",amt);
			System.out.println("amt :"+amt);
			String noPay=(String)request.getAttribute("noPayment");
		    //request.setAttribute("noPayment",noPay);
			System.out.println("noPay :"+noPay);
			%>
<form name="myform" id="myform" class="formcss" method="post" action="./OrganizerHLCEventReg.html" onsubmit="return check();"  >
<input type="hidden" name="process" value="insert" />
<input type="hidden" name="paymentMode" value="<%=payMode%>" />
<input type="hidden" name="amount" value="<%=amt%>" />
<input type="hidden" name="noPayment" value="<%=noPay%>" />

<!-- **************************************** Part A of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('parta');"> 
  <strong>Event Registration Form: Part A</strong> <!--span class="textOne">(click to expand/contract)</span -->
</div>
<div id="parta" class="formPart">
			<% 
			
			
			HLCEventRequestVO objEventReqVO = new HLCEventRequestVO();
			objEventReqVO = (HLCEventRequestVO)request.getAttribute("EVENT_REQUEST_VO");		
				String event_id = "";
				String organizer_id = "";
				String event_title = "";			
				String competition_location = "";
				String competition_city = "";
				String competition_state = "";
				String competition_country = "";
				String competition_zip = "";
				String championship_area = "";
				String status_id = "";
				String issNm = "";
			 ArrayList mappingTypeIds = new ArrayList();
			 
			 String eventSubTypes = "";
			 java.util.Date eventBeginDate=null;
			 java.util.Date eventEndDate=null;
			 
			 if(objEventReqVO!= null ){
			  event_id = objEventReqVO.getEvent_id();
              organizer_id = objEventReqVO.getOrganizer_id();
              event_title = objEventReqVO.getEvent_title();
              eventBeginDate = objEventReqVO.getEveBegDate();		 
			
              eventEndDate = objEventReqVO.getEveEndDate();	
              competition_location = objEventReqVO.getCompetition_location();
              competition_city = objEventReqVO.getCompetition_city();
              competition_state = objEventReqVO.getCompetition_state();
              competition_country = objEventReqVO.getCompetition_country();
              competition_zip = objEventReqVO.getCompetition_zip();
              championship_area = objEventReqVO.getChampionship_area();
              status_id = objEventReqVO.getStatus_id();
			  issNm = objEventReqVO.getIssueName();
			  mappingTypeIds = objEventReqVO.getMaping_type_id();
			  	if(mappingTypeIds!= null && mappingTypeIds.size()!=0){	  
                	Iterator itrMapTypeIds = mappingTypeIds.iterator();
                
	                while(itrMapTypeIds.hasNext()){
                    String mappingTypeId = (String)itrMapTypeIds.next();
                    eventSubTypes = mappingTypeId+"#"+eventSubTypes;
    	            }
				}
			}
			String areaId = "";
			String areaStr = "";
			String[] areaDetails = (String []) request.getAttribute("AREA_DETAILS");
			if(areaDetails != null){
			 areaId = areaDetails[0];
			 areaStr = areaDetails[1];
			 }
				%>
             <input type="hidden" name="eventId" value="<%=event_id%>" />				
			<div class="row">
				<span class="label">Event Title: </span>
				<span class="formX">
	            <input type="text" class="textboxOne" size="25" name="eventtitle" value="<%=event_title%>"/> <span class="asterisk">*</span></span>	  </div>
			<div class="row">
                
				<span class="label">Event Secretary ID:</span>
				<span class="formX"><input type="text" class="textboxOne" size="25" name="eventsecid"  onBlur="HLCMemberDetails();"/> <span class="asterisk">*</span></span>			</div>
			<div class="row">
				<span class="label">Name:</span>
				<span class="formX"><input type="text" class="readOnly" size="25" name="hlcstaffname" readonly="true"/></span>			</div>
			<div class="row">
				<span class="label">Address for entries to be sent: </span>
				<span class="formX"><input type="text" class="readOnly" size="30" name="address" readonly="true"/></span>			</div>
			<div class="row">
				<span class="label">&nbsp;</span>
				<span class="formX"><input type="text" class="readOnly" size="30"  name="city" readonly="true"/></span>			</div>
			<div class="row">
				<span class="label">Telephone:</span>
				<span class="formX"><input type="text" class="readOnly" size="20" name="phone" readonly="true"/></span>			</div>
			<div class="row">
				<span class="label">Fax:</span>
				<span class="formX"><input type="text" class="readOnly" size="20" name="fax" readonly="true"/></span>			</div>
			<div class="row">
				<span class="label">EMail:</span>
				<span class="formX"><input type="text" class="readOnly" size="25" name="email" readonly="true"/></span>			</div>
	<div class="rowHead">
		<strong>Event Types and Levels:	</strong></div>
	
						<%
							Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
							HashMap eventTypeMap = (HashMap)request.getAttribute("eventTypeMap");
							int levelCount =0;
							if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
							Enumeration it = eventTypeDetails.elements();
							while(it.hasMoreElements()){
							String[] eventDet =(String[])it.nextElement();
							String eventTypeId = eventDet[0];
							String eventTypeName= eventDet[1];
						%>
						<%  String tmpVal="";
							ArrayList subLevelMap = (ArrayList)eventTypeMap.get(eventTypeId);
							Iterator itrSub = subLevelMap.iterator();
							while(itrSub.hasNext()){
							String[] subEntry = (String[])itrSub.next();
							String mapId = subEntry[0];
							String levelId = subEntry[1];
							String levelCode = subEntry[2];
							String levelName = subEntry[3]; 
							levelCount = levelCount + 1;
							String cbxName = "eventLevels"+levelCount;
							boolean chkStatus = false;
							if(eventSubTypes.contains(mapId)){
							if(tmpVal==""){
							tmpVal = levelCode;	
							}else{	
							tmpVal = tmpVal + ","+ levelCode;	
							}														
						%>
						
						<%}
						}%>
              			<div>
						<span class="label"><strong><%=eventTypeName%></strong></span>
						<%if(tmpVal!=""){%> 
						<span class="formX"><%=tmpVal%></span>
						<%}else{%>
						<span class="formX">N/A</span>						</div>
						<%}%> 
						<%}
						}  %>



	<div class="rowHead">
		<strong>Officials:</strong>	</div>
                        <%

							  int chkoffct=0;
                                                          String chkoffnam="official";
							  String txtoffnam="officialtxt";	
                                                           ArrayList jdDet=new ArrayList();
                                                           jdDet=(ArrayList)request.getAttribute("jdDet");
                                                           Iterator i = jdDet.iterator();
                                                    	System.out.println(jdDet.size());

							if(jdDet.size()!=0)
							{
                                                         while (i.hasNext())
							{
							String[] judList=(String[])i.next();
							String cbxofname=chkoffnam+Integer.toString(chkoffct);	
							String tbof=txtoffnam+Integer.toString(chkoffct);			              
							%>

							<div class="colspan">
											<input type="checkbox" value="<%=judList[0]%>" id="<%=cbxofname%>" name="<%=cbxofname%>" /> <span class="labelTwo"><%=judList[1]%></span>							</div>
							<div class="row">
								<span class="label">Name:</span>
										<span class="formX"><input type="text" class="textboxOne" size="25" name="<%=tbof%>" id="<%=tbof%>" /></span>							</div>
                                                    <%  chkoffct++; }}
	
                        %>
			
                                                    <input type="hidden" name="offct" value="<%=chkoffct%>" /> 
	</div>
<!-- **************************************** Part B of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partb');"><strong>Event Registration Form: Part B </strong></div>
<div id="partb" class="formPart">

	<div class="rowHead">
		Entries:	</div>

			<div class="row">
				<span class="label">Fees:</span>
				<span class="formX"><strong>$</strong> <input type="text" class="textboxOne" size="5" name="fees" maxlength="7"/> (Per division) <span class="asterisk">*</span></span>			</div>
			<div class="row">
				<span class="label">Others:</span>
				<span class="formX"><input type="text" class="textboxOne" name="others" size="10" /> </span>			</div>
			<div class="colspan">
				Check where applicable:			</div>
			<div class="row">
				<div class="floatLeft"><input type="checkbox" value="HLC membership required at all levels including BN" name="memblevel" size="10" />membership required at all levels including BN</div>
			</div>
			<div class="row">
				<div class="floatLeft"><input type="checkbox" value="BNH/BNR competitors who are not HLC members must pay an additional $25 fee with entry." name="comppay" size="10" /> BNH/BNR competitors who are not members must
						pay an additional $25 fee with entry.				</div>
			</div>
			<div class="row">
				<div style="text-align:left;" class="textBold">Double Entries Accepted:				</div>
			</div>
			<div class="row">
				<div class="floatLeft">
				<input type="radio" size="10" name="dblE" value="yes" onClick="switchDiv('dblEntry');" /> Yes
				<input type="radio" size="10" name="dblE" value="no" onClick="showHideRadio('dblE','dblEntry','no'); dblEntryclear();"/> No  <span class="asterisk">*</span>				</div>
			</div>
			<div class="row" id="dblEntry">
				<div class="floatLeft">
				<input type="text" class="textboxOne" name="dblEntry" size="10" /> <strong>$</strong> (Office Fees)				</div>
			</div>

			<div class="colspan">
				<strong>Payment Check Details:</strong>			</div>
			<div class="row">
				<span class="label">Draw checks to the order of:</span>
				<span class="formX"><input type="text" class="textboxOne" size="40" name="drawCheck"/> <span class="asterisk">*</span></span>			</div>
			<div class="row">
				<div class="floatLeft">
				<input type="radio" size="10" name="r1" value="0" onClick="switchDiv('lpOne'), showHideRadio('r1','lpTwo','lpOne'), showHideRadio('r1','lpOther','lpOne'); lpTwoclear(); lpOtherclear()" /> charge for lost pinny <span>*</span>
				<input type="radio" size="10" name="r1" value="1" onClick="switchDiv('lpTwo'), showHideRadio('r1','lpOne','lpTwo'), showHideRadio('r1','lpOther','lpTwo'); lpOneclear(); lpOtherclear();" /> charge for lost pinny <span>**</span>
				<input type="radio" size="10" name="r1" value="2" onClick="switchDiv('lpOther'), showHideRadio('r1','lpTwo','lpOther'), showHideRadio('r1','lpOne','lpOther'); lpOneclear(); lpTwoclear();" /> Other				</div>
			</div>
			<div class="row" id="lpOne">
				<div class="floatLeft">
				<strong>$</strong> <input type="text" class="textboxOne" name="lpOne" size="10" /> (* No deposit required)				</div>
			</div>
			<div class="row" id="lpTwo">
				<div class="floatLeft">
				<strong>$</strong> <input type="text" class="textboxOne" name="lpTwo" size="10" /> (** Send deposit with entry)				</div>
			</div>
			<div class="row" id="lpOther">
				<div class="floatLeft">
				 <strong>$</strong> <input type="text" class="textboxOne" name="lpOther" size="10" />
				</div>
			</div>

	<div class="rowHead">
		Refunds: &nbsp;<span class="asterisk">*</span>	</div>

			<div>
			
	<%! String xRule; %>
                            
			   <% 
                              int chkrefct=0;
                   			  String chkrefnam="refund";
							  String txtrefnam="refundtxt";	

                              java.util.Vector getAllMapRuleSubRule=new Vector();
                              getAllMapRuleSubRule=(java.util.Vector)request.getAttribute("getAllMapRuleSubRule");
                              //java.util.Vector arenasSizeVect=new Vector();
                              //arenasSizeVect=(java.util.Vector)request.getAttribute("arenaSizeVect");
   
				 Enumeration itratorsRule= (Enumeration)getAllMapRuleSubRule.elements();
//				 Enumeration it = (Enumeration)arenasSizeVect.elements();
                                 
					 while(itratorsRule.hasMoreElements()){
					                                           
                                      String[] s = (String[]) itratorsRule.nextElement();                                    
                                    // String type=s[3];
									   String subRuleName=s[4];
										String mid=s[0];
										String txt_status=s[5];
										String cbxrfname=chkrefnam+Integer.toString(chkrefct);	
									                
			    %>
                            
			 
                               
                                   <% if(!(s[3].equals(xRule))){
								   xRule=s[3];
                                   %>
                                   
				 <div class="colspan"><%=xRule%></div>
                                <%}%>
                                <div class="row">
									<span >
										<input type="checkbox" size="10" name="<%=cbxrfname%>" id="<%=cbxrfname%>" value="<%=mid%>" /><%=subRuleName%>
										<%System.out.println("subRuleName in jsp :"+subRuleName);
												
											
											if(!txt_status.equals("0")){
											String tb=txtrefnam+Integer.toString(chkrefct);
											%>
											<input type="text" class="textboxOne" size="10" name="<%=tb%>" />
											<%System.out.println("tb in jsp :"+tb);
											}
												
										%>
									</span>              					</div>   
				
                                
					   <% chkrefct++; } 
			 %>
							<input type="hidden" name="rulecbxct" value="<%=chkrefct%>" />
</div>
				<div class="rowHead">
				Negative Coggins Test &nbsp;<span class="asterisk">*</span>			</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" value="nctRef" onClick="switchDiv('nctReq'), showHideRadio('r5','nctState','nctRef'); nctReq1clear();" />  Required for all horses..				</div>
					<div class="row" id="nctReq">
						<div class="floatLeft">
						within <input type="text" class="textboxOne" name="nctReq1" size="6" /> months.						</div>
					</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" value="nctRef1" onclick="switchDiv('nctState'), showHideRadio('r5','nctReq','nctRef'); nctStateclear();" /> Required within..				</div>
					<div class="row" id="nctState">
						<div class="floatLeft">
						<input type="text" class="textboxOne" name="nctInState" size="6" /> months for in-state and <input type="text" class="textboxOne" name="nctOutState" size="6" /> months for out-of state.						</div>
					</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" value="Not Required" onClick="showHideRadio('r5','nctState','nctReqNot'), showHideRadio('r5','nctReq','nctReqNot'); nctReqNotclear(); " /> Not Required.				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" value="Others" onClick="showHideRadio('r5','nctState','nctReqOth'), showHideRadio('r5','nctReq','nctReqOth');  nctReqOthclear();" /> Others.				</div>
</div>


<!-- **************************************** Part C of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partc');"><strong>Event Registration Form: Part C</strong> </div>
<div id="partc" class="formPart">

	<div class="rowHead">
		Tentative Time Schedule: &nbsp;<span class="asterisk">*</span>	</div>

			<div class="rowTwo">
				<span class="labelTwo">Day(mm/dd/yyyy)</span>
				<span class="labelTwo">Phase</span>
				<span class="labelTwo">Time</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="readOnly" size="10" name="DateImported1" readonly="true" value=""  />
					<a href="javascript:cal1.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="PhaseImported1"/></span>
				<span class="lableTwo">
									<select name="TimeImported1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hour</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>
									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option>
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>

									<select name="MinuteImported1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
												  <option value="00">00</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>
												  <option value="32">32</option>
												  <option value="33">33</option>
												  <option value="34">34</option>
												  <option value="35">35</option>
												  <option value="36">36</option>
												  <option value="37">37</option>
												  <option value="38">38</option>
												  <option value="39">39</option>
												  <option value="40">40</option>
												  <option value="41">41</option>
												  <option value="42">42</option>
												  <option value="43">43</option>
												  <option value="44">44</option>
												  <option value="45">45</option>
												  <option value="46">46</option>
												  <option value="47">47</option>
												  <option value="48">48</option>
												  <option value="49">49</option>
												  <option value="50">50</option>
												  <option value="51">51</option>
												  <option value="52">52</option>
												  <option value="53">53</option>
												  <option value="54">54</option>
												  <option value="55">55</option>
												  <option value="56">56</option>
												  <option value="57">57</option>
												  <option value="58">58</option>
									 			 <option value="59">59</option>
									</select>



									<select name="FormatImported1" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<option value="01">a.m</option>
									<option value="02">p.m</option>
						</select>
			  </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="readOnly" name="DateImported2" readonly="true" size="10" />
					<a href="javascript:cal2.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="PhaseImported2"size="10" /> </span>
				<span class="labelTwo">
									<select name="TimeImported2" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hour</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>
									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option>
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>

									<select name="MinuteImported2" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
									  <option value="00">00</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>
									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option>
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									  <option value="13">13</option>
									  <option value="14">14</option>
									  <option value="15">15</option>
									  <option value="16">16</option>
									  <option value="17">17</option>
									  <option value="18">18</option>
									  <option value="19">19</option>
									  <option value="20">20</option>
									  <option value="21">21</option>
									  <option value="22">22</option>
									  <option value="23">23</option>
									  <option value="24">24</option>
									  <option value="25">25</option>
									  <option value="26">26</option>
									  <option value="27">27</option>
									  <option value="28">28</option>
									  <option value="29">29</option>
									  <option value="30">30</option>
									  <option value="31">31</option>
									  <option value="32">32</option>
									  <option value="33">33</option>
									  <option value="34">34</option>


									  <option value="35">35</option>
									  <option value="36">36</option>
									  <option value="37">37</option>
									  <option value="38">38</option>
									  <option value="39">39</option>
									  <option value="40">40</option>
									  <option value="41">41</option>
									  <option value="42">42</option>
									  <option value="43">43</option>
									  <option value="44">44</option>
									  <option value="45">45</option>
									  <option value="46">46</option>
									  <option value="47">47</option>
									  <option value="48">48</option>
									  <option value="49">49</option>
									  <option value="50">50</option>
									  <option value="51">51</option>
									  <option value="52">52</option>
									  <option value="53">53</option>
									  <option value="54">54</option>
									  <option value="55">55</option>
									  <option value="56">56</option>
									  <option value="57">57</option>
									  <option value="58">58</option>
									  <option value="59">59</option>
									</select>



									<select name="FormatImported2" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<option value="01">a.m</option>
									<option value="02">p.m</option>
						</select> 
					</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="readOnly" name="DateImported3" readonly="true" size="10" />
					<a href="javascript:cal3.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="PhaseImported3" size="10" /> </span>
				<span class="labelTwo">
									<select name="TimeImported3" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hour</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>

									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option> 
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>

									<select name="MinuteImported3" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
												 <option value="00">00</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>
												  <option value="32">32</option>
												  <option value="33">33</option>
												  <option value="34">34</option>
												  <option value="35">35</option>
												  <option value="36">36</option>
												  <option value="37">37</option>
												  <option value="38">38</option>
												  <option value="39">39</option>
												  <option value="40">40</option>
												  <option value="41">41</option>
												  <option value="42">42</option>
												  <option value="43">43</option>
												  <option value="44">44</option>
												  <option value="45">45</option>
												  <option value="46">46</option>
												  <option value="47">47</option>
												  <option value="48">48</option>
												  <option value="49">49</option>
												  <option value="50">50</option>
												  <option value="51">51</option>
												  <option value="52">52</option>
												  <option value="53">53</option>
												  <option value="54">54</option>
												  <option value="55">55</option>
												  <option value="56">56</option>
												  <option value="57">57</option>
												  <option value="58">58</option>
									  			  <option value="59">59</option>
									</select>



									<select name="FormatImported3" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<option value="01">a.m</option>
									<option value="02">p.m</option>
						</select> 
					</span>			</div>


	<div class="rowHead">
		Awards: &nbsp;<span class="asterisk">*</span>	</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r6" value="awardOne" onclick="switchDiv('ribbons'), showHideRadio('r6','awrdOth','awardOne'); awrdOthclear(); awrdclear(); ribbonsclear(); " /> Trophy & Ribbons			</div>
				<div class="row" id="ribbons">
					<div class="floatLeft">
					 <input type="text" class="textboxOne" name="ribbons" size="10" /> No. of ribbons per division.				 </div>
			</div>
			<div class="rowHeightOne">
			<input type="radio" size="10" name="r6" value="awardTwo" onclick="showHideRadio('r6','ribbons','awardTwo'), showHideRadio('r6','awrdOth','awardTwo'); awrdOthclear(); awrdclear(); " /> Prize money will be paid by check and available at the secretary?s office immediately
			<input type="hidden" name="award2" value="Prize money paid by check" />
						after the <span style="margin-left:25px;">awards ceremony.</span>			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r6" value="awardThree" onclick="switchDiv('awrdOth'), showHideRadio('r6','ribbons','awardThree'); awrdclear(); " /> Other.			</div>
			<div class="row" id="awrdOth">
					<div class="floatLeft">
					<input type="text" class="textboxOne" name="awrdOth" size="45" />
					</div>
			</div>


	<div class="rowHead">
		<strong>Starting Times:</strong>	</div>
			<div class="row">
				<span class="label">Date Available:</span>
				<span class="formX"><input type="text" class="readOnly" name="dateAvailable" readonly="true" size="20" /> 
				<a href="javascript:cal4.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a> <span class="asterisk">*</span></span>			</div>
			<div class="colspan">
				Available from: &nbsp;<span class="asterisk">*</span>			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r7" value="The secretary" onclick="showHideRadio('r7','dateDivOth','dateOne'); awrdOthclear4();" /> The secretary.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r7" value="Postcards will be sent" onclick="showHideRadio('r7','dateDivOth','dateTwo'); awrdOthclear4(); " /> Postcards will be sent.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r7" value="dateThree" onclick="switchDiv('dateDivOth'); awrdOthclear4();" /> Other.			</div>
			<div class="row" id="dateDivOth">
					<div class="floatLeft">
					<input type="text" class="textboxOne" name="dateDivOth" size="50" />
					</div>
			</div>


	<div class="rowHead">
		<strong>Stabling / Veterinarian:</strong> &nbsp;<span class="asterisk">*</span>	</div>
			<div class="colspan">
				Stabling/Stall Info:			</div>

			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r8" value="stableOne" onClick="awrdOthclear2(); awrdOthclear1();"/> Limited stabling.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r8" value="stableTwo" onClick="awrdOthclear2(); awrdOthclear1();"/> Unlimited stabling.			</div>

					<div class="row" id="unlStbCom">

						<div >
						<input type="radio" size="10" name="r81" value="unlStbOne" onClick="awrdOthclear2(); awrdOthclear1();" /> Charges per stall per night.						</div>

								<div id="perStallOne">
								  <div > <strong>$</strong>
									<input type="text" class="textboxOne" name="perStallOne1" size="8" onClick="awrdOthclear2();"/>
								  </div>
								</div>

						<div >
						<input type="radio" size="10" name="r81" value="unlStbTwo" onClick="awrdOthclear2(); awrdOthclear1();" /> Per stall on a given time & date.						</div>

								<div id="perStalltwo">
									<div >
									<span > <strong>$</strong>
									<input type="text" class="textboxOne" name="amount1" size="8" />
									</span>,&nbsp;

									<span >
									<select name="stablingtime1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hours</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>
									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option>
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>

									<select name="stablingminute1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
												  <option value="00">00</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>
												  <option value="32">32</option>
												  <option value="33">33</option>
												  <option value="34">34</option>
												  <option value="35">35</option>
												  <option value="36">36</option>
												  <option value="37">37</option>
												  <option value="38">38</option>
												  <option value="39">39</option>
												  <option value="40">40</option>
												  <option value="41">41</option>
												  <option value="42">42</option>
												  <option value="43">43</option>
												  <option value="44">44</option>
												  <option value="45">45</option>
												  <option value="46">46</option>
												  <option value="47">47</option>
												  <option value="48">48</option>
												  <option value="49">49</option>
												  <option value="50">50</option>
												  <option value="51">51</option>
												  <option value="52">52</option>
												  <option value="53">53</option>
												  <option value="54">54</option>
												  <option value="55">55</option>
												  <option value="56">56</option>
												  <option value="57">57</option>
												  <option value="58">58</option>
									 			 <option value="59">59</option>
									</select>



									<select name="stablingformat1" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<option value="a.m">a.m</option>
									<option value="p.m">p.m</option>
						</select>
						</span>
									<span ><input type="text" class="readOnly" name="date1" readonly="true" size="8" /> 
									<a href="javascript:cal5.popup();">
				 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:left;" border="0"></a><strong> FromDate</strong></span>

									<span >
									<select name="stablingtime2" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hours</option>
									  <option value="01">01</option>
									  <option value="02">02</option>
									  <option value="03">03</option>
									  <option value="04">04</option>
									  <option value="05">05</option>
									  <option value="06">06</option>
									  <option value="07">07</option>
									  <option value="08">08</option>
									  <option value="09">09</option>
									  <option value="10">10</option>
									  <option value="11">11</option>
									  <option value="12">12</option>
									</select>

									<select name="stablingminute2" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
												  <option value="00">00</option>
												  <option value="01">01</option>
												  <option value="02">02</option>
												  <option value="03">03</option>
												  <option value="04">04</option>
												  <option value="05">05</option>
												  <option value="06">06</option>
												  <option value="07">07</option>
												  <option value="08">08</option>
												  <option value="09">09</option>
												  <option value="10">10</option>
												  <option value="11">11</option>
												  <option value="12">12</option>
												  <option value="13">13</option>
												  <option value="14">14</option>
												  <option value="15">15</option>
												  <option value="16">16</option>
												  <option value="17">17</option>
												  <option value="18">18</option>
												  <option value="19">19</option>
												  <option value="20">20</option>
												  <option value="21">21</option>
												  <option value="22">22</option>
												  <option value="23">23</option>
												  <option value="24">24</option>
												  <option value="25">25</option>
												  <option value="26">26</option>
												  <option value="27">27</option>
												  <option value="28">28</option>
												  <option value="29">29</option>
												  <option value="30">30</option>
												  <option value="31">31</option>
												  <option value="32">32</option>
												  <option value="33">33</option>
												  <option value="34">34</option>
												  <option value="35">35</option>
												  <option value="36">36</option>
												  <option value="37">37</option>
												  <option value="38">38</option>
												  <option value="39">39</option>
												  <option value="40">40</option>
												  <option value="41">41</option>
												  <option value="42">42</option>
												  <option value="43">43</option>
												  <option value="44">44</option>
												  <option value="45">45</option>
												  <option value="46">46</option>
												  <option value="47">47</option>
												  <option value="48">48</option>
												  <option value="49">49</option>
												  <option value="50">50</option>
												  <option value="51">51</option>
												  <option value="52">52</option>
												  <option value="53">53</option>
												  <option value="54">54</option>
												  <option value="55">55</option>
												  <option value="56">56</option>
												  <option value="57">57</option>
												  <option value="58">58</option>
									 			 <option value="59">59</option>
									</select>



									<select name="stablingformat2" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<option value="a.m">a.m</option>
									<option value="p.m">p.m</option>
						</select>
						</span>
									<span ><input type="text" class="readOnly" name="todate" readonly="true" size="8" />
									 <a href="javascript:cal6.popup();">
									 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:left;" border="0"></a><strong> toDate</strong></span>								  </div>
								</div>
					</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r8" value="stableThree" onclick="awrdOthclear2(); awrdOthclear1();"/> No stabling available.			</div>
</div>

<!-- **************************************** Part D of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partd');">Event Registration Form: Part D </div>
<div id="partd" class="formPart">



			<div class="colspan">
			<strong>	Type of stabling:</strong> &nbsp;<span class="asterisk">*</span>			</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableOne" onClick="clearone();"/> Permanent stalls on ground.				</div>
								<div class="rowNew" id="qtyOne">
									<div class="floatLeft">
									<input type="text" class="textboxOne" name="qtyOne" size="8" /> <strong>(Qty)</strong>									</div>
								</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableTwo" onClick="cleartwo();"/> Temporary stalls on ground.				</div>
								<div class="rowNew" id="qtyTwo">
									<div class="floatLeft">
										<span class="floatLeft"><input type="text" class="textboxOne" name="qtyTwo" size="8" /> <strong>(Qty)</strong></span>,&nbsp;									</div>
								</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableThree" onClick="clearthree();"/> Permanent/temporary stalls with approximate distance from event.				</div>
								<div class="rowNew" id="qtyThree">
									<div class="floatLeft">
										<span class="floatLeftTwo"><input type="text" class="textboxOne" name="amountnew" size="8" /> <strong>(Qty)</strong></span>,&nbsp;
										<span class="floatLeftTwo"><input type="text" class="textboxOne" name="timenew" size="8" /> <strong>Miles from event</strong></span>&nbsp;									</div>
								</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableFour" onClick="clearfour();"/> Stall doors & initial bedding only provided.				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableFive" onClick="clearfive();"/> Feed/Bedding/Hay available for purchase, further info from the secretary.				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableSix" onClick="clearsix();"/> Other type.				</div>
								<div class="rowNew" id="qTwo1">
									<div class="floatLeft">
										<span class="floatLeftTwo"><input type="text" class="textboxOne" name="qTwo1" size="25" /></span>									</div>
								</div>

			<div class="colspan">
				<strong>Veterinarian Info:</strong>			</div>
					<div class="row">
						<span class="label">Name:</span>
						<span class="formX"><input type="text" class="textboxOne" name="vetName"size="25" /><span class="asterisk">*</span></span>					</div>
					<div class="row">
						<span class="label">Veterinarian phone no. at event:</span>
						<span class="formX"><input type="text" class="textboxOne" name="phNum"size="25" /><span class="asterisk">*</span></span>					</div>
					<div class="row">
						<span class="label">Where Vet. no. will be posted at event:</span>
						<span class="formX"><input type="text" class="textboxOne" size="25" name="vetNo"/><span class="asterisk">*</span></span>					</div>

	<div class="rowHead">
		Accomodations:	</div>

			<div class="rowTwo">
				<span class="labelTwo">Hotel</span>
				<span class="labelTwo">Phone No.</span>
				<span class="labelTwo">Miles From Event</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" size="20" name="hotel1"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="phone1"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="mile1"/> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" size="20" name="hotel2"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="phone2"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="mile2"/> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" size="20" name="hotel3"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="phone3"/> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" size="10" name="mile3"/> </span>			</div>


	<div class="rowHead">
		Directions:	</div>
			<div class="rowTxtArea"><span class="label">
			  <textarea name="textarea" rows="5" cols="25" id="directions"></textarea>
			</span></div>
</div>

<!-- **************************************** Part E of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('parte');"><strong>Event Registration Form: Part E</strong> </div>
<div id="parte" class="formPart">

	<div class="rowHead">
		Dressage test for horse trials, two-day events & Combined tests:&nbsp;<span class="asterisk">*</span>	</div>

		<div class="rowTwo">
			<span class="labelTwo">Advanced Level</span>
			<span class="labelThree">Arena Size</span>		</div>
		<div>
    	
			<%! String x; %>
                            
			   <% 
							  int chkno=0;
                              
                              java.util.Vector dressageHorseTrialsVect=new Vector();
                              dressageHorseTrialsVect=(java.util.Vector)request.getAttribute("dressageHorseTrialsVect");
                              java.util.ArrayList arenasSizeVect=new ArrayList();
                              arenasSizeVect=(java.util.ArrayList)request.getAttribute("arenaSizeVect");
   
							 Enumeration itr= (Enumeration)dressageHorseTrialsVect.elements();
						//	 Enumeration it = (Enumeration)arenasSizeVect.elements();
											 
							 while(itr.hasMoreElements()){
					                                           
                                      String[] s = (String[]) itr.nextElement();                                    
                                      String level=s[1];			                                    
                                       String levelId=s[3];		                      
                                     
                                      String cbxlevelname="advlevel"+Integer.toString(chkno);
                                      String optarenaname="arena"+Integer.toString(chkno);   
			    %>
                            
			   
                               
                                   <% if(!(s[0].equals(x))){
                                   x=s[0];
                                   System.out.println(x);
                                   %>
                                   
				<div class="row">
					<span class="styleBoldOne">&nbsp;&nbsp;<%=x%></span>				</div>
                                <%}%>
								 <div class="row">
									<span class="label">
									<input type="checkbox" value="<%=levelId%>" size="10" name="<%=cbxlevelname%>" id="<%=cbxlevelname%>"/><%=level%>									</span>					
									<span class="labelFour">
											<select name="<%=optarenaname%>" id="selActivityId" class="selectboxOne" >
												<%
												
												ArrayList arenaSizeVect = (ArrayList)request.getAttribute("arenaSizeVect");
												if(arenaSizeVect!=null && arenaSizeVect.size()!=0){
												Iterator it = arenaSizeVect.iterator();
												while(it.hasNext()){
												String[] arena=(String[])it.next();
												
												%>
														
														<option value="<%=arena[0]%>"><%=arena[1]%></option>
													 <%
												}
											}
											  %>
										</select>
									</span>								</div>                        
				
                                
								 <% chkno++; } 
							 %>
								<input type="hidden" name="dtct" value="<%=dressageHorseTrialsVect.size()%>" />
	  			</div>
			 
<div class="spacer">&nbsp;</div>
	 
			<div class="row">
				<span class="label">Briefly describe footing:</span>
				<span class="formX"><input type="text" class="textboxOne" name="footing" size="45" /></span>			</div>


	<div class="rowHead">
		Cross-Country:&nbsp;<span class="asterisk">*</span>	</div>

			<div class="rowTwo">
				<span class="labelTwo">Division</span>
				<span class="labelTwo">Length</span>
				<span class="labelTwo">Speed</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" name="division1" size="20" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="length1" size="10" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="speed1" size="10" /> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" name="division2" size="20" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="length2" size="10" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="speed2" size="10" /> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" class="textboxOne" name="division3" size="20" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="length3" size="10" /> </span>
				<span class="labelTwo"><input type="text" class="textboxOne" name="speed3" size="10" /> </span>			</div>


			<div class="colspan">
				Describe your course(s). Choose from the list below or use your own description. &nbsp;<span class="asterisk">*</span>			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r10" value="Easy, good for first time at this level." /> Easy, good for first time at this level.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r10" value="Average, for horses with some experience at this level." /> Average, for horses with some experience at this level.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r10" value="Difficult, championship caliber course." /> Difficult, championship caliber course.			</div>

			<div class="colspan">
				<strong>Additional information.	</strong>		</div>
			<div class="rowTxtArea">
				<span class="label">
				<textarea id="additionalInfo" name="AdditionalInfo" rows="5" cols="25"></textarea>
				</span>			</div>

	<div class="rowHead">
		<strong>Other Information:</strong> <span class="labelTwo">( The course-closed date must be stated)</span>	</div>
			<div class="row">
			 <div class="floatLeft">	 Cross-country course officially closed on..</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" class="readOnly" name="CrossCountryDate" readonly="true" size="15" />
							<a href="javascript:cal7.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="asterisk">*</span>						</div>
			<div class="row">
				<div class="floatLeft"> Entry limit</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" class="textboxOne" name="EntryLimit" size="15" /> </span>						</div>
			<div class="row">
			  <div class="floatLeft">Riders limited to horse/level <span class="asterisk">*</span> <strong>(or)</strong> horse/entire event.<span class="asterisk">**</span></div>
			</div>
						<div class="rowTxtArea">
							<span id="ccCourse"><input type="text" class="textboxOne" name="RiderLimit1" size="15" /> <span class="asterisk">*</span></span>
							<span id="ccCourse"><input type="text" class="textboxOne" name="RiderLimit2" size="15" /> <span class="asterisk">**</span></span>						</div>
	  <div class="row">
				<div class="floatLeft"> Divisions further divided if entries warrant; state birth date on entry.</div>
				        <input type="text" class="readOnly" name="BirthDate" readonly="true" size="10">
				<a href="javascript:cal8.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="floatLeft"></span>			</div>
			<div class="row">
				<div class="floatLeft">Dogs must be leashed (and/or)</div>
				<div class="floatLeftTwo">
							<input type="radio" size="10" name="r11" value="true" /> Yes.
				    		<input type="radio" size="10" name="r11" value="false" /> No.			    </div>
			</div>
			<div class="row">
				<div class="floatLeft">Team of three of four, best three scores to count, all team members at same level. </div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" class="textboxOne" name="PerHead" size="15" /> <strong>$</strong> per team member. <strong>(or)</strong> </span>						</div>
						<div class="row">
							<span id="ccCourse"><input type="text" class="textboxOne" name="TeamTotal" size="50" /> </span>						</div>
			<div class="row">
				<div class="floatLeft"> Competitors/Volunteers/Officials Party</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" class="textboxOne" name="Party" size="35" /> </span>						</div>
			<div class="colspan">
				Additional information.			</div>
			<div class="rowTxtArea"><span class="label">
			  <textarea id="textarea" name="AdditionalInfo2" rows="5" cols="25"></textarea>
			</span></div>




	<div class="row" align="center">
		<span class="label">&nbsp;</span>
		<span class="formX"><input type="submit" value="Register Now" class="btn text_3 color_3" /></span>	</div>
</div>
</form>
</div>


 <script language="javascript">
	

	var cal1 = new calendar2(document.forms['myform'].elements['DateImported1']);
	cal1.year_scroll = true;
	cal1.time_comp = false;
	
	var cal2= new calendar2(document.forms['myform'].elements['DateImported2']);
	cal2.year_scroll = true;
	cal2.time_comp = false;
	
	var cal3= new calendar2(document.forms['myform'].elements['DateImported3']);
	cal3.year_scroll = true;
	cal3.time_comp = false;
	
	var cal4 = new calendar2(document.forms['myform'].elements['dateAvailable']);
	cal4.year_scroll = true;
	cal4.time_comp = false;
	
	var cal5= new calendar2(document.forms['myform'].elements['date1']);
	cal5.year_scroll = true;
	cal5.time_comp = false;
	
	var cal6= new calendar2(document.forms['myform'].elements['todate']);
	cal6.year_scroll = true;
	cal6.time_comp = false;
	
	var cal7 = new calendar2(document.forms['myform'].elements['CrossCountryDate']);
	cal7.year_scroll = true;
	cal7.time_comp = false;
	
	var cal8= new calendar2(document.forms['myform'].elements['BirthDate']);
	cal8.year_scroll = true;
	cal8.time_comp = false;
	
	
	
	
</script>
			<!-- CONTENTS END HERE -->			</td>
		  </tr>
	  </table>
	  
	  
	  
	  
	  <!--==============================================import content code end here============================================-->	  </td>
    </tr>
  </table>
</section>
  
<!--==============================================content end here============================================-->

<!--==============================================footer start here============================================-->
 <div>			 
			
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
 </div>
<!--==============================================footer end here============================================-->

</body>
</html>

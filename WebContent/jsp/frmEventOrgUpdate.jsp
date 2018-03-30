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
<%@ page import="com.hlcmro.util.*"%>
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
<script src="js/calendar3.js" type="text/javascript"></script>
<script type="text/javascript" src="js/tiny_mce/tiny_mce_dev.js"></script>
<script type="text/javascript" src="js/tiny_mce/classes/util/UnitTester.js"></script>

<%String indieventID=(String)request.getAttribute("indieventID");%>

<script type="text/javascript">
function focus_login()
{
	document.myform.eventtitle.focus();
}	
function forFocus()
  {
    setTimeout('focus_login()',4000);
  }	
   
</script>


<script type="text/javascript">
// ***************For javascript text editor*******************

var editor;
var unitTester = new tinymce.util.UnitTester('log', {
	debug : true,
	log_skipped : true
});

(function() {
	unitTester.add('commands', {
		html4TextStyles : function() {
			var t = this, c;

			editor.settings.inline_styles = false;
			editor.settings.convert_fonts_to_spans = false;



			editor.settings.inline_styles = true;
		},

		xhtmlTextStyles : function() {
			var t = this, c;


			editor.execCommand('SelectAll');
			editor.execCommand('FontName',false,'Arial');

		},

		alignInline : function() {
			var t = this;

			editor.settings.inline_styles = true;


		},

		blockquote : function() {
			var t = this;

		},

		blocks : function() {
			var t = this;


			try {
				//editor.execCommand('FormatBlock', false, 'div');
			} catch (ex) {
				//t.log('Failed: ' + ex.message);
			}

		},

		styles : function() {
			var t = this;


		},

		link : function() {
			var t = this;


		},

		unlink : function() {
			var t = this;


		},

		subscriptSuperscript : function() {
			var t = this;

		},

		insertHR : function() {
			var t = this, v;


		},

		indentOutdent : function() {
			var t = this;


		},

		removeFormat : function() {
			var t = this;


		},

		customCommands : function() {
			var t = this;


		}
	});

	unitTester.add('internals', {
		forcedBlocks : function() {
			var t = this;

		},

		explorerBugs : function() {
			var t = this;


		}
	});

	unitTester.add('urls', {
		relativeURLs : function() {
			var t = this;


		},

		absoluteURLs : function() {
			var t = this;

		}
	} );

	unitTester.add('editor_methods', {
		getParam : function() {
			var t = this;


		}
	});
})();

tinyMCE.init({


mode : "textareas",

theme : "advanced",

theme_advanced_buttons1 :

"undo,redo,|,bold,italic,underline,|,justifyleft,justifycenter,justifyright,justifyfull,|,bullist,numlist,|,link,unlink,",

theme_advanced_buttons2 : "",

theme_advanced_buttons3 : "",

theme_advanced_toolbar_location : "top", theme_advanced_toolbar_align : "left"

 
});




 function reportLink(){	
new_window=window.open('http://dashboard.useventing.com/resources/scripts/omnibus_preview/index.php?id=<%=indieventID%>') 
	}	

</script>
<!--==============================================JAVASCRIPT AND CSS LINK START HERE============================================-->


<!--==============================================JAVASCRIPT AND CSS LINK END HERE============================================-->
</head>
<%if(indieventID!=null){%>
<body onload="initCondition();focus_login();forFocus();reportLink();">
<%}else{%>


<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="initCondition();focus_login();forFocus();">

<%}%>

<%! 
String nullCheck(String fieldName){
	String retValue = "";
		if(fieldName!=null && fieldName.trim().length()!=0){
		retValue = fieldName;
		}
	return retValue;
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
                            <h2>Event Organizer: Update Omnibus Listing</h2>
                        </div>
                      
					<!--==============================Form Title=================================-->
					  <div class='panel-body'>
							
																																																																				  <p>Details from the most recent Omnibus listing for this event are shown in sections similar to the printed Omnibus. The text in each section can be edited by typing directly into it, similar to using a word processor. Use the zoom function of your internet browser (hold down Ctrl key and press + or - ) to enlarge the text to assist with viewing and editing.</p>
<p>To see how changes affect the actual Omnibus listing, click on the &quot;Update/View Omnibus>&quot; button at the bottom of this page. A new browser window will open up to show the full listing including changes. Close the new window to continue editing. When updating is complete, click &quot;Save changes/exit&quot; button to return to the Events Listing page.</p>
			
							<%
							String tempMsg=(String)request.getAttribute("msg");
							System.out.println("tempMsg"+tempMsg);
							
							%>
		<form class='form-horizontal' role='form' name="myform" id="myform" method="post" action="./OrganizerHLCEventReg.html" onsubmit="return check();"  >
		<input type="hidden" name="process" value="Update" />
		<input type="hidden" name="msg" id="msg" value="<%=tempMsg%>" />
									
									<%
									HLCEventDetailsVO objEventDet=new HLCEventDetailsVO();
												ArrayList eventDet = new ArrayList();
												eventDet=(ArrayList)request.getAttribute("eventDetails");
												
			
			
												if(eventDet != null && eventDet.size() != 0)
														{
															System.out.print(" eventDet.size() :" +eventDet.size());
															
															objEventDet=(HLCEventDetailsVO)eventDet.get(0);
																					
														}		
													
											%>



<!-- **************************************** Part A of the form starts here *********************************************** -->

<!--div class="rowExpand" onclick="expandColl('parta');"> 
  USEA Event Registration Form: Part A 
</div-->
<div  class="form-group" id="parta">
					<% 
						String eventId=objEventDet.getEventId();
					//   System.out.println("objEventDet.getEventId() in jsp :"+objEventDet.getEventId());
						
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
						 
					ArrayList omniCommts=(ArrayList) request.getAttribute("omniComments");	 
						
					String secretComt = "";
					String accomCommt= "";
					String directCommt = "";
					String dressCommt= "";
					String tentTimeCommt = "";
					String offCommt= "";
					String entriesCommt = "";
					String awardsCommt= "";
					String stTimeCommt = "";
					String stabVetCommt= "";
					String crsCounCommt = "";
					String othrCommt = "";
					String eveTitCommt = "";
					String eveFeeDCommt = "";
					String eveMgtCommt = "";
					String eveWebSit ="";
						 
					if(omniCommts!=null && omniCommts.size()!=0){
					Iterator itrs = omniCommts.iterator();
							
					while(itrs.hasNext()){
					String[] commts = (String[])itrs.next();
					String orgId=commts[0];
					 secretComt = commts[1];
					 accomCommt=commts[2];
					 directCommt =commts[3];
					 dressCommt=commts[4];
					 tentTimeCommt =commts[5];
					 offCommt=commts[6];
					 entriesCommt = commts[7];
					 awardsCommt=commts[8];
					 stTimeCommt = commts[9];
					 stabVetCommt=commts[10];
					 crsCounCommt =commts[11];
					 othrCommt =commts[12];
					 eveTitCommt =commts[13];
					 eveFeeDCommt =commts[14];
					 eveMgtCommt =commts[15];
					 eveWebSit =commts[16];
					
								}
							
					}	 
						 
						 
							%>
             <input type="hidden" name="eventId" value="<%=event_id%>" />		
			
		<div class='form-group'>
                                   <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input type="text" class="form-control"  name="eventtitle" value="<%=objEventReqVO.getEvent_title()%>"/>
										     </div>
										</div>
								 </div>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <textarea id="eveTitCommt" class="form-control" name="eveTitCommt"><%=nullCheck(eveTitCommt)%></textarea>
										     </div>
										</div>
								 </div>
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Website:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <input type="text" name="txtEveWeb" id="txtEveWeb" class="form-control" value="<%=nullCheck(eveWebSit)%>"  />
												 (e.g. www.myeventwebsite.com)
										      </div>
										</div>
								 </div>
								<div class='col-md-offset-2'> 
								<p class="para">Event Types and Levels:</p>
                                 </div>  
												
							
												<%
													Vector eventTypeDetails = (Vector)request.getAttribute("eventTypeDetails");
													HashMap eventTypeMap = (HashMap)request.getAttribute("eventTypeMap");
													int levelCount =0;
													if(eventTypeDetails!=null && eventTypeDetails.size()!=0){
													Enumeration it = eventTypeDetails.elements();
													while(it.hasMoreElements()){
													String[] eventDet1 =(String[])it.nextElement();
													String eventTypeId = eventDet1[0];
													String eventTypeName= eventDet1[1];
													String tmpVal="";
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
              			
										<%if(tmpVal!=""){%> 
										<%=eventTypeName%>
										<%=tmpVal%>
										<%}%> 
										<%}
										}  %>		
						<div class='col-md-offset-2'>				
						<p>Secretary:</p>	
						</div>
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Secretary Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <textarea id="textEditorJS" class="form-control" name="textEditorJS"><%=nullCheck(secretComt)%></textarea>
										      </div>
										</div>
								 </div>
							<div class='col-md-offset-2'>	 
							<p>	 Entries:</p>
							</div>
						<div class="form-group">	
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Entries Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="entriesCmmt" class="form-control" name="entriesCmmt"><%=nullCheck(entriesCommt)%></textarea>
										      </div>
										</div>
								 </div>
							</div>	 
			              <div class='col-md-offset-2'>
	                      <p>Official:</p>
						  </div>
						  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Official Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <textarea id="offCmmt" class="form-control" name="offCmmt"><%=nullCheck(offCommt)%></textarea>
										      </div>
										</div>
								 </div>
					 <div class='col-md-offset-2'>			 
					<p>	Event Management:</p>
					</div>
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Management Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="eveMgtCmmt" class="form-control" name="eveMgtCmmt"><%=nullCheck(eveMgtCommt)%></textarea>
										      </div>
										</div>
								 </div>																									

	
	
	
<!-- **************************************** Part B of the form starts here *********************************************** -->

<!--div class="rowExpand" onclick="expandColl('partb');"> USEA Event Registration Form: Part B </div-->
 <div class='col-md-offset-2'id="partb">
<p>Entry Fee:</p>	
</div>
 <div  class="form-group" id="partb">
    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Fees Directory Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="eveFeesDirtCommt" class="form-control" name="eveFeesDirtCommt"><%=nullCheck(eveFeeDCommt)%></textarea>
										      </div>
										</div>
								 </div>	
							</div>	 
			
			
	
<!-- **************************************** Part C of the form starts here *********************************************** -->

<!--div class="rowExpand" onclick="expandColl('partc');"> USEA Event Registration Form: Part C </div-->
<div  class="form-group" id="partc">
	<p>Tentative Time Schedule: </p>
	<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Tentative Time Schedule Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="timeComment" class="form-control" name="timeComment" ><%=nullCheck(tentTimeCommt)%></textarea>
										      </div>
										</div>
								 </div>	
                           </div>
				 <div class='col-md-offset-2'>		   
				<p>	Awards:</p>	   
				</div>
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Award Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="awardComment" class="form-control" name="awardComment"><%=nullCheck(awardsCommt)%></textarea>
										      </div>
										</div>
								 </div>	
                <div class='col-md-offset-2'>								 
				<p>	Starting Times:</p>	
				</div>
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Start Time Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="stComment" class="form-control" name="stComment" ><%=nullCheck(stTimeCommt)%></textarea>
										      </div>
										</div>
								 </div>	
        
                  
	
<!-- **************************************** Part D of the form starts here *********************************************** -->

<!--div class="rowExpand" onclick="expandColl('partd');"> USEA Event Registration Form: Part D </div-->
<div class='col-md-2' id='partd'>
<p>	Stabling / Vegeterian:</p>
</div>
<div id="partd" class="form-group">
       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Stabling / Veterinarian Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <textarea id="stbVetComment" class="form-control" name="stbVetComment" ><%=nullCheck(stabVetCommt)%></textarea>
										      </div>
										</div>
								 </div>		
					</div> 
		 <div class='col-md-offset-2'>
		 <p>	Accomodations:	</p>	
		 </div>
		  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Accomodation comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="accomodation" class="form-control" name="accomodation"><%=nullCheck(accomCommt)%></textarea>
										      </div>
										</div>
								 </div>
             <div class='col-md-offset-2'>								 
			 <p>	Direction:	</p>	
			 </div>
			 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Direction comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												 <textarea name="textarea" rows="5" cols="25" class="form-control" id="directions"><%=nullCheck(directCommt)%></textarea>
										      </div>
										</div>
								 </div>					 			
	
			
<!-- **************************************** Part E of the form starts here *********************************************** -->

<!--div class="rowExpand" onclick="expandColl('parte');"> USEA Event Registration Form: Part E </div-->
<div id="parte" class="form-group">
 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dressage Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="dressageComment" class="form-control" name="dressageComment"><%=nullCheck(dressCommt)%></textarea>
										      </div>
										</div>
								 </div>	
							</div>
             <div class='col-md-offset-2'>								 							
			<p>	Cross-Country information:</p>	
			</div>
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Cross Country Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="crossContCommts" name="crossContCommts" class="form-control"><%=nullCheck(crsCounCommt)%></textarea>
										      </div>
										</div>
								 </div>	
			   <div class='col-md-offset-2'>						 
			<p>	Other Information:</p>	
			</div>
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other Comments:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
												<textarea id="othrCommts" name="othrCommts" class="form-control"><%=nullCheck(othrCommt)%></textarea>
										      </div>
										</div>
								 </div>	
						</div> 	
						
						
				<div class='form-group'>
					<div class='col-md-offset-4 col-md-2'>
						<button class='btn-lg btn-primary' type="submit" value="Update/View" name="buttName" id="buttName" >Update/View</button>
					</div>
					<div class='col-md-0'>
						<button class='btn-lg btn-danger' type="submit" value="Exit" name="buttName" id="buttName" >Exit</button>
					</div>
				</div>	
		</div>			
	
   <input type="hidden" name="eventBeginDate" value="<%=eventBeginDate%>" />
   </form>



 <script language="javascript">
	

	/*var cal5= new calendar3(document.forms['myform'].elements['date1']);
	cal5.year_scroll = true;
	cal5.time_comp = false;
	
	var cal6= new calendar3(document.forms['myform'].elements['todate']);
	cal6.year_scroll = true;
	cal6.time_comp = false;*/

	
</script>
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

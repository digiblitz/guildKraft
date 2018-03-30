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
<%@ page import="java.text.SimpleDateFormat"%>
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



<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="initCondition(); ">

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
                            <h2>Organizer: Event Registration Form </h2>
                        </div>
                      
					<!--==============================Form Title=================================-->
					  <div class='panel-body'>

				<p>Organizers, use this Event Registration form to register an event. This form has been
				divided into five parts for it's easy handling.Click on the tabs seen below to Expand / Contract it
				and hence reveal the hidden parts of the form.</p>
<form class='form-horizontal' role='form' name="myform" id="myform"  method="post" action="./OrganizerHLCEventReg.html" onsubmit="return check();"  >
			
														<%
														
														try
														{
														
														System.out.print("::::::::::: Inside EventDetails jsp ::::::::::");
																	
														HLCEventDetailsVO objEventDet=new HLCEventDetailsVO();
														ArrayList eventDet = new ArrayList();
														eventDet=(ArrayList)request.getAttribute("eventDetails");
																	
														Vector accommodation = new Vector();
														Vector crossCountry = new Vector();
														Vector cogginsDetails = new Vector();
														Vector divisionLevels = new Vector();
														Vector judgesDetails = new Vector();
														Vector hDressage = new Vector();
														HLCOtherDetailsVO othersDet = new HLCOtherDetailsVO();
														Vector refundRuleDetails = new Vector();
														Vector tentativeTime= new Vector();
														
														if(eventDet != null && eventDet.size() != 0)
														{
															System.out.print(" eventDet.size() :" +eventDet.size());
															
															objEventDet=(HLCEventDetailsVO)eventDet.get(0);
															divisionLevels=(Vector)eventDet.get(1);
															judgesDetails=(Vector)eventDet.get(2);
															refundRuleDetails=(Vector)eventDet.get(3);
															cogginsDetails=(Vector)eventDet.get(4);
															tentativeTime=(Vector)eventDet.get(5);
															hDressage=(Vector)eventDet.get(6);
															crossCountry=(Vector)eventDet.get(7);
															othersDet=(HLCOtherDetailsVO)eventDet.get(8);
															accommodation=(Vector)eventDet.get(9);
															
															/*for(int i=0;i<HLCEventDetails.size();i++)
															{
																
															}*/
															
														}		
											
														%>
														
<!-- **************************************** Part A of the form starts here *********************************************** -->
<p>HLC Event Registration Form: Part A</p> <!--span class="textOne">(click to expand/contract)</span -->

<div id="parta" class="form-group">
					<%
						String eventTitle="";
						String eventSecId="";
						
						if(objEventDet.getEventSecretaryId()!=null && objEventDet.getEventSecretaryId().trim().length()!=0)
						{
							eventSecId=objEventDet.getEventSecretaryId();
						}
						else
						{
							eventSecId="";
						}
							
					%>
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=objEventDet.getEventTitle()%></label>
											  
											 </div>
										</div>
									</div>	
								<input type="hidden" name="process" value="insert" />	
						<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Secretary ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"><%=eventSecId%></label>
											  
											 </div>
										</div>
									</div>				
	
		<p>Event Types and Levels:	</p>
			
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
									 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=eventTypeName%></label>
											  
											 </div>
										</div>
									</div>	
												<%if(tmpVal!=""){%> 
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=tmpVal%></label>
											  
											 </div>
										</div>
									</div>	
									<%}else{%>
									  <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label">N/A</label>
											  
											 </div>
										</div>
									</div>	
											<%}%> 
												<%}
												}  %>

			<p>Officials:	</p>
                        <%/*

							  int chkoffct=0;
                                                          String chkoffnam="official";
							  String txtoffnam="officialtxt";	
                                                           ArrayList jdDet=new ArrayList();
                                                           jdDet=(ArrayList)request.getAttribute("jdDet");
                                                           Iterator i = jdDet.iterator();
                                                    															
														
							if(jdDet.size()!=0)
							{
							
								int judSiz=jdDet.size();
								String[] judSel=new String[judSiz];
								String[] judTxtVal=new String[judSiz];
								
								for(int kl=0;kl<judSiz;kl++)
								{
									judSel[kl]="";
									judTxtVal[kl]="";						
								}
									
								 int judSelCt=0;
								 	System.out.println("jdDet.size() :" +jdDet.size());
									
                                 while (i.hasNext())
								{
										String[] judList=(String[])i.next();
										String cbxofname=chkoffnam+Integer.toString(chkoffct);	
										String tbof=txtoffnam+Integer.toString(chkoffct);			              
										
										if(judgesDetails != null) 
				{
					if(judSelCt<judgesDetails.size())
					{
					
							System.out.print("judgesDetails.size() :"+judgesDetails.size());
							String[] judList1=(String[])judgesDetails.elementAt(judSelCt);
							int k=0;	
							
						for(k=0;k<jdDet.size();k++)
						{
							String[] comp = (String[]) jdDet.get(k);                                    
							
								System.out.print("comp[0] :"+comp[0]);
										//judList1[2].equalsIgnoreCase(judList[0]
								judSel[k]="";
								judTxtVal[k]="";
											
							if(judList1[2].equalsIgnoreCase(comp[0]))
							{							
								judSel[k]="checked";
								judTxtVal[k]=judList1[3];
													
								System.out.print("judList1[2] :"+judList1[2]);
								System.out.print("judList1[3] :"+judList1[3]);
							
							}
							else
							{
								judSel[k]="";
								judTxtVal[k]="";
							}
						}
					}
				}    
			
							
							if(judSel[judSelCt].equalsIgnoreCase("checked"))
							{			
							*/%>
							<%
							ArrayList offDetails =(ArrayList)request.getAttribute("jdDet");
							if(offDetails!=null && offDetails.size()!=0){
							Iterator it=offDetails.iterator();
							while(it.hasNext()){
							String[] official=(String[])it.next();
							String judgeTypeId=official[0];
							String judgeTypeName=official[1];
							String judgeName=official[2];
							
							%>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=judgeTypeName%></label>
											  
											 </div>
										</div>
									</div>	
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=judgeName%></label>
											  
											 </div>
										</div>
									</div>	
							
							<%}}%>
							<%/*  }chkoffct++;judSelCt++;
							}}
							
							*/%>
	</div>
<!-- **************************************** Part B of the form starts here *********************************************** -->

<div class="form-group" onclick="expandColl('partb');"> Event Registration Form: Part B </div>
<div id="partb" class="form-group">
<p>	Entries:	</p>

											<%
											String entFee=""; 
											String otherFee=""; 
											
											if(objEventDet.getEntryFee()!=null)
											{
												entFee=objEventDet.getEntryFee();
											}
											else
											{
												entFee="";
											}
											
											if(objEventDet.getOtherEntryFee()!=null)
											{
												otherFee=objEventDet.getOtherEntryFee();
											}
											else
											{
												otherFee="";
											}
											
											
										%>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Fees:</label>			
					            <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <label class="control-label"> <%=entFee%> (Per division)</label>
											</div>
										</div>
									</div>	
                           					
				
			
													
													<%
													if(!otherFee.equalsIgnoreCase(""))
													{%>
									<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Others:</label>			
					            <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <label class="control-label"><%=otherFee%></label>
											</div>
										</div>
									</div>	
                           									
			
												
												<%}%>
			
			<p>Check where applicable:</p>
			
												<%
												String membApp="";
												String membAppStat1="";
												String membAppStat2="";
															
												if(objEventDet.getMembershipApplicable()!=null)
												{
													membApp=objEventDet.getMembershipApplicable();
													String[] membAppSpStat=membApp.split("#");
													System.out.print("membApp selected :"+membApp);
													
													if(!membAppSpStat[0].equalsIgnoreCase("null"))
													{
														System.out.print("membAppSpStat[0] :"+membAppSpStat[0]);
														membAppStat1="checked";
													}
													else
													{
														membAppStat1="";
													}
													
													if(!membAppSpStat[1].equalsIgnoreCase("null"))
													{
														System.out.print("membAppSpStat[1] :"+membAppSpStat[1]);
														membAppStat2="checked";
													}
													else
													{
														membAppStat2="";
													}
												}
												else
												{
													membApp="";
												}
												%>
												
												<%
												if(membAppStat1.equalsIgnoreCase("checked"))
												{%>
												
		      <p>Membership required at all levels including BN</p>
			
					<%}
					
					if(membAppStat2.equalsIgnoreCase("checked"))
					{
					%>			
			<p> BNH/BNR competitors who are not members must pay an additional $25 fee with entry.	</p>
			
												<%}%>
												
			<p>Double Entries Accepted:	</p>
			
								<%
								
								String dblYes="No";
								//String dblNo="";
								String dblYesTxt="";
								
								if(objEventDet.getDoubleEntryFee()!=null)
								{
									if(objEventDet.getDoubleEntryFee().equalsIgnoreCase("yes"))
									{
										System.out.print("objEventDet.getDoubleEntryFee() :"+objEventDet.getDoubleEntryFee());
										dblYes="Yes";
										
										if(objEventDet.getOfficeFee()!=null)
										{
											dblYesTxt=objEventDet.getOfficeFee();
										}
										else
										{
											dblYesTxt="";
										}
									}
									else
									{
										System.out.print("objEventDet.getDoubleEntryFee() :"+objEventDet.getDoubleEntryFee());
										dblYes="No";
									}
								
								}
								
								String chkPayable="";
								
								if(objEventDet.getCheckPayableTo()!=null)
								{
									chkPayable=objEventDet.getCheckPayableTo();	
								}
								else
								{
									chkPayable="";
								}
								
								%>
							<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"><%=dblYes%></label>
											  
											 </div>
										</div>
									</div>		
			
			
										<%
										if(!dblYesTxt.equalsIgnoreCase(""))
										{%>
						 <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <label class="control-label"><%=dblYesTxt%> (Office Fees)	</label>
											</div>
										</div>
									</div>	
                           				
			
										
										<%}%>
			
			<p>	Payment Check Details:</p>
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Draw checks to the order of:</label>			
					            <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"> <%=chkPayable%></label>
											</div>
										</div>
									</div>	
			
			
								<%
									String one="";
									String two="";
									String three="";
									String pennyChgOne="";
									String pennyChgTwo="";
									String pennyChgThree="";
									 
									if(objEventDet.getPinniesPosition()!=null)
									{
										System.out.print("objEventDet.getPinniesPosition() :"+objEventDet.getPinniesPosition());
										System.out.print("objEventDet.getPinniesCharge() :"+objEventDet.getPinniesCharge());
																		
										if(objEventDet.getPinniesPosition().equalsIgnoreCase("0"))
										{
											one="checked";
											
											if(objEventDet.getPinniesCharge()!=null)
											{		
												pennyChgOne=objEventDet.getPinniesCharge();				
											}
										}
										
										if(objEventDet.getPinniesPosition().equalsIgnoreCase("1"))
										{
											two="checked";
											
											if(objEventDet.getPinniesCharge()!=null)
											{		
												pennyChgTwo=objEventDet.getPinniesCharge();			
											}				
											
										}
										
										if(objEventDet.getPinniesPosition().equalsIgnoreCase("2"))
										{
											three="checked";
											
											if(objEventDet.getPinniesCharge()!=null)
											{		
												pennyChgThree=objEventDet.getPinniesCharge();		
											}	
											
										}
										
										
									}
								
								
								%>		
							<div class="form-group">		
					            <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											   <%
												if(one.equalsIgnoreCase("checked"))
												{%>
						              <p>charge for lost pinny   <span id="span_astriesk">*</span>
									 </p>
									 </div>
								</div>
							</div>		  
					
						       <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<i class="fa fa-dollar"></i> <label class="control-label"><%=pennyChgOne%> (* No deposit required)		</label>
											</div>
										</div>
									</div>		
				      
				</div>
									
										<%}
										
									%>
									
									
									<%
										if(two.equalsIgnoreCase("checked"))
										{%>
						<p>charge for lost pinny <span id="span_astriesk">**</span></p>
						    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											<i class="fa fa-dollar"></i> <label class="control-label"><%=pennyChgTwo%>(** Send deposit with entry)		</label>
											</div>
										</div>
									</div>	
						
							
										<%}
										
									%>

									
									<%
										if(three.equalsIgnoreCase("checked"))
										{%>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Others:</label>			
					            <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <i class="fa fa-dollar"></i> <label class="control-label"><%=pennyChgThree%></label>
											</div>
										</div>
									</div>				
						
					<%}
					
				%>
	<p>Refunds:	</p>
			
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
													   int refSelCt=0;
													   int refSiz=getAllMapRuleSubRule.size();
														String ruleSel[]=new String[refSiz];   
														String ruleSelTxt[]=new String[refSiz];
														String[] selRefLevel=new String[refundRuleDetails.size()];
																					  
													 while(itratorsRule.hasMoreElements()){
																							   
																	  String[] s = (String[]) itratorsRule.nextElement();                                    
																	// String type=s[3];
																	   String subRuleName=s[4];
																		String mid=s[0];
																		String txt_status=s[5];
																		String cbxrfname=chkrefnam+Integer.toString(chkrefct);	
																					
																					
																		if(refundRuleDetails != null) 
												{
													if(refSelCt<refundRuleDetails.size())
													{
																										
																										   
															System.out.print("refundRuleDetails.size() :"+refundRuleDetails.size());
															selRefLevel=(String[])refundRuleDetails.elementAt(refSelCt);
								
															int j=0;	
															
														for(j=0;j<getAllMapRuleSubRule.size();j++)
														{
															String[] refRules = (String[]) getAllMapRuleSubRule.elementAt(j);                                     
															String RuleName=refRules[4];
															ruleSelTxt[j]="";
															ruleSel[j]="";
															
															System.out.print("RuleName :"+RuleName);
															//System.out.print("ruleSel[j].length :"+ruleSel.length);
																												
															if(RuleName.equalsIgnoreCase(selRefLevel[3]))
															{	
																System.out.print("selRefLevel[2] :"+selRefLevel[2]);				
																System.out.print("selRefLevel[3] :"+selRefLevel[3]);
																System.out.print("amount :"+selRefLevel[5]);
																
																ruleSel[j]="checked";
																ruleSelTxt[j]=selRefLevel[5];
															}
															else
															{
																//ruleSel[j]="";
															}
															
														}
													}
												} 
													
													if(ruleSel[refSelCt].equalsIgnoreCase("checked"))	
													{							
												%> 
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label"><%=selRefLevel[2]%></label>
											</div>
										</div>
									</div>				
								<div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
										
													<%=selRefLevel[3]%>
													
													<%if(!txt_status.equals("0"))
													{%>										
														<%=ruleSelTxt[refSelCt]%>
													<%}%>	
												</div>
											</div>
										</div>			
								
                                
									   <%}
									   else if(refSelCt==0)
								{%>
				                <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>
											 <label class="control-label">N/A</label>
											</div>
										</div>
									</div>	
					
									<%}   		
										   
											chkrefct++;refSelCt++; } 
								 %>
							<input type="hidden" name="rulecbxct" value="<%=chkrefct%>" />


				<%
				
						String cogAll="";
						String cogNreq="";
						String cogOther="";
						String reqWith="";
						String cogAllMnth="";
						String reqWithIn="";
						String reqWithOut="";
				
					if(cogginsDetails!=null)
					{
						System.out.print("cogginsDetails.size() :"+cogginsDetails.size());
						String CoggVal[]=(String[])cogginsDetails.elementAt(0);
						System.out.print("CoggVal.length :"+CoggVal.length);
						
						if(CoggVal[2]!=null && CoggVal[2].trim().length()!=0)
						{
							System.out.print("CoggVal[2] :"+CoggVal[2]);
							cogAll="checked";
							cogAllMnth=CoggVal[2];
						}
						
						if(CoggVal[3]!=null && CoggVal[3].trim().length()!=0 && CoggVal[4]!=null && CoggVal[4].trim().length()!=0)
						{
							reqWith="checked";
							reqWithIn=CoggVal[3];
							reqWithOut=CoggVal[4];
							
							System.out.print("CoggVal[3] :"+CoggVal[3]);
							System.out.print("CoggVal[4] :"+CoggVal[4]);
							
						}
						
						if(CoggVal[5]!=null && CoggVal[5].trim().length()!=0)
						{
							cogNreq="checked";
							
							System.out.print("CoggVal[5] :"+CoggVal[5]);
							
						}
						
						if(CoggVal[6]!=null && CoggVal[6].trim().length()!=0)
						{
							cogOther="checked";
							
							System.out.print("CoggVal[6] :"+CoggVal[6]);
							
						}
					}
				
				%>

			<p>	Negative Coggins Test	</p>
							<%
							if(cogAll.equalsIgnoreCase("checked"))
							{
							%>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Required for all horses :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label">within <%=cogAllMnth%> months.</label>
											 </div>
										</div>
								 </div>	
				
								
							<%}%>
							
							<%
							if(reqWith.equalsIgnoreCase("checked"))
							{
							%>
							<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Required within :	</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											   <label class="control-label"><%=reqWithIn%> months for in-state and <%=reqWithOut%> months for out-of state.</label>
											 </div>
										</div>
								 </div>	
				
					
				
								
								<%}%>
							
							<%
							if(cogNreq.equalsIgnoreCase("checked"))
							{
							%>
					
				<p> Not Required.	</p>
						
						<%}%>
						
						<%
						if(cogOther.equalsIgnoreCase("checked"))
						{
						%>
				
				<p> Others.		</p>
				
				<%}%>
</div>


<!-- **************************************** Part C of the form starts here *********************************************** -->

<div class="form-group" onclick="expandColl('partc');">Event Registration Form: Part C </div>
<div id="partc" class="form-group">

	<p>Tentative Time Schedule:</p>

			<p>Day(mm/dd/yyyy)
			     Phase
				Time</p>
			
									<%
									
									java.sql.Date[] day=new java.sql.Date[3];
									String[] phase=new String[3];
									String[] time=new String[3];
									String[] finalDay=new String[3];
									int hr[]=new int[3];
									int min[]=new int[3];
									int zone[]=new int[3];
									
									int tc=0;
									
									if(tentativeTime!=null)
									{
										System.out.print("tentativeTime.size() :"+tentativeTime.size());
										
										Enumeration enTT= (Enumeration)tentativeTime.elements();
										
										for(int x=0;x<3;x++)
											{
												phase[x]="";
												time[x]="";
												finalDay[x]="";
											}
										
										while(enTT.hasMoreElements())
										{
										
										try
										{
															
											ArrayList tentativeList=new ArrayList();
											tentativeList=(ArrayList)enTT.nextElement();
											//SimpleDateFormat sdf1 = new SimpleDateFormat("MM/dd/yyy");
											
											System.out.print("tentativeList.size() :"+tentativeList.size());
																
											day[tc]=(java.sql.Date)tentativeList.get(2);
											phase[tc]=(String)tentativeList.get(3);
											time[tc]=(String)tentativeList.get(4);
											
											String[] timeTemp1=time[tc].split(":");
											String[] timeTemp2=timeTemp1[1].split(" ");
											
											hr[tc]=Integer.parseInt(timeTemp1[0]);
											min[tc]=Integer.parseInt(timeTemp2[0]);
											zone[tc]=Integer.parseInt(timeTemp2[1]);
											
											System.out.print("hr[tc] :"+hr[tc]+"min[tc] :"+min[tc]+"zone[tc] :"+zone[tc]);
											
											String tempdat=day[tc].toString();
											String ttDay[]=tempdat.split("-");
											finalDay[tc]=ttDay[1]+"/"+ttDay[2]+"/"+ttDay[0];
						
																				
											System.out.print("finalDay[tc] :"+finalDay[tc]);
											System.out.print("phase[tc] :"+phase[tc]);
											System.out.print("time[tc] :"+time[tc]);
											
											tc++;
											}
											catch(Exception e)
											{
												System.out.print("error in jsp :" +e);
											}
										}
									}
									else
									{
															
											/*	finalDay[0]="";
												phase[0]="";
												time[0]="";						
												finalDay[1]="";
												phase[1]="";
												time[1]="";
												finalDay[2]="";
												phase[2]="";
												time[2]="";*/
									}				
							
													String zonView1="";
													String zonView2="";
													String zonView3="";
													String Tim2="";
													String Tim3="";
																				
													if(zone[0]==1)
													{
														zonView1="a.m";										
													}
													else if(zone[0]==2)
													{
														zonView1="p.m";	
													}
													
													if(zone[1]!=0)
													{							
													if(zone[1]==1)
													{
														zonView2="a.m";										
													}
													else if(zone[1]==2)
													{
														zonView2="p.m";	
													}
														Tim2=hr[1]+":"+min[1]+" "+zonView2;
													}
													
													if(zone[2]!=0)
													{							
													if(zone[2]==1)
													{
														zonView3="a.m";										
													}
													else if(zone[2]==2)
													{
														zonView3="p.m";	
													}
														Tim3=hr[2]+":"+min[2]+" "+zonView3;
													}
													
									
									%>
							<div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=finalDay[0]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=phase[0]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=hr[0]+":"+min[0]+" "+zonView1%></label>
                                            </div>		
                                   </div>
                             </div>	
							<div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=finalDay[1]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=phase[1]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=Tim2%></label>
                                            </div>		
                                   </div>
                            </div>		
							<div class="form-group">		
							     <div class='col-md-8'>
                                       <div class='col-md-2'>
                                             <label class='control-label'><%=finalDay[2]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=phase[2]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=Tim3%></label>
                                            </div>		
                                     </div>

                               </div>					
								
							
													  <%
													String awardTropy="";
													String awardTropyTxt="NA";
													String awardPrize="";
													String awardOthers="";
													String awardOthersTxt="NA";
													
													if(objEventDet.getAwardTrophy()!=null)
													{
														awardTropy="checked";
														awardTropyTxt=objEventDet.getAwardTrophy();
														
														System.out.print("awardTropy :"+awardTropy);
														System.out.print("awardTropyTxt :"+awardTropyTxt);
													}
													
													if(objEventDet.getAwardPrize()!=null)
													{
														awardPrize="checked";
														System.out.print("awardPrize :"+awardPrize);
														
													}
													
													if(objEventDet.getAwardOthers()!=null)
													{
														awardOthers="checked";
														awardOthersTxt=objEventDet.getAwardOthers();
														
														System.out.print("awardOthers :"+awardOthers);
														System.out.print("awardOthersTxt :"+awardOthersTxt);
													}
														
												%>
			<p>Awards:	</p>
			 
			 <%if(awardTropy.equalsIgnoreCase("checked"))
			 {%>
			     <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Trophy & Ribbons</label> 		
				             <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"> <%=awardTropyTxt%></label>
												 No. of ribbons per division.
											 </div>
										</div>
								 </div>
								<%}%>
								
								<%if(awardPrize.equalsIgnoreCase("checked"))
								{%>
			<p>Prize money will be paid by check and available at the secretary?s office immediately after the awards ceremony.</p>
					<%}%>
					
					
					<%if(awardOthers.equalsIgnoreCase("checked"))
					{%>
					<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other</label> 		
				             <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"> <%=awardOthersTxt%></label>
												
											 </div>
										</div>
								 </div>
			

											<%}%>
										
								<%			
								
									String startDat="";
									System.out.print("objEventDet.getDateAvailable() :"+objEventDet.getDateAvailable());
								
									if(objEventDet.getDateAvailable()!=null)
									{
										startDat=objEventDet.getDateAvailable();
										String val="";
										val=startDat.substring(2,3);
										System.out.print("val :"+val);
										
										if(val.equalsIgnoreCase("/"))
								
										{
											startDat=startDat;
										}
										else
										{
											SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyy");
											String[] dtTemp1=startDat.split(" ");
											String[] dtTemp2=dtTemp1[0].split("-");
											System.out.print("dtTemp2[1] dtTemp2[2] dtTemp2[0] :" +dtTemp2[1]+"/"+dtTemp2[2]+"/"+dtTemp2[0]);
											startDat=dtTemp2[1]+"-"+dtTemp2[2]+"-"+dtTemp2[0];
										}
										
										System.out.print("startDat :"+startDat);
										
									}
								
								%>

		<p>Starting Times:	</p>
		    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Date Available:</label> 		
				             <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"> <%=startDat%></label>
												
											 </div>
										</div>
								 </div>
			
			
								
								<%
									String sec="";
									String postCard="";
									String availableOthers="";
									String availableOthersTxt="";
									
									if(objEventDet.getAvailablePosition().equalsIgnoreCase("0"))
									{
										sec="checked";
										System.out.print("objEventDet.getAvailablePosition() :"+objEventDet.getAvailablePosition());
									}
									
									if(objEventDet.getAvailablePosition().equalsIgnoreCase("1"))
									{
										postCard="checked";
										System.out.print("objEventDet.getAvailablePosition() :"+objEventDet.getAvailablePosition());
									}
									
									if(objEventDet.getAvailablePosition().equalsIgnoreCase("2"))
									{
										availableOthers="checked";
										availableOthersTxt=objEventDet.getAvailableFromOther();
										
										System.out.print("objEventDet.getAvailablePosition() :"+objEventDet.getAvailablePosition());
										System.out.print("availableOthersTxt :"+availableOthersTxt);
									}
								
								%>
			<p>Available from:	</p>
						<%
						if(sec.equalsIgnoreCase("checked"))	
						{%>
			
			<p> The secretary.	</p>
						<%}%>
						
						<%
						if(postCard.equalsIgnoreCase("checked"))	
						{%>
			<p>Postcards will be sent.</p>
						<%}%>
						
						<%
						if(availableOthers.equalsIgnoreCase("checked"))	
						{%>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Other:</label> 		
				             <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"> <%=availableOthersTxt%></label>
												
											 </div>
										</div>
								 </div>		
			

										<%}%>
											<%
												String crgPerStPerNight="";
												String StallPernightPrice="";
												String PerStallPrice="";
												String PerStallRadio="";
												String unlimitedStab="";
												String noStab="";
												String perStalFromDat="";
												String perStalToDat="";
												
												int hr2=0;
												int min2=0;
												int zon2=0;
												
												int hr3=0;
												int min3=0;
												int zon3=0;
												
												
												
												System.out.print("objEventDet.getStablingLimited() :"+objEventDet.getStablingLimited());
												
												if(objEventDet.getStallPernightPrice()!=null)
												{
												
													if(!objEventDet.getStallPernightPrice().equalsIgnoreCase("0.0"))
													{
														unlimitedStab="checked";
														crgPerStPerNight="checked";
														StallPernightPrice=objEventDet.getStallPernightPrice();
														System.out.print("StallPernightPrice :"+StallPernightPrice);
													}
												}
												
												if(!objEventDet.getPerStallPrice().equalsIgnoreCase("0.0"))
												{
													unlimitedStab="checked";
													PerStallRadio="checked";
													PerStallPrice=objEventDet.getPerStallPrice();
													String frTimTmp=objEventDet.getPerStallFromTime();
													String[] frTim1=frTimTmp.split(" ");
													String[] frTim2=frTim1[0].split(":");
													String hr1=frTim2[0];
													String min1=frTim2[1];
													String zon1=frTim1[1];
													
													hr2=Integer.parseInt(hr1);
													min2=Integer.parseInt(min1);
													
													if(zon1.equalsIgnoreCase("a.m"))
													{
														zon2=1;
													}											
													else
													{
														zon2=2;
													}
													
													String toTimTmp=objEventDet.getPerStallToTime();
													String[] toTim1=toTimTmp.split(" ");
													String[] toTim2=toTim1[0].split(":");
													//System.out.print("objEventDet.getPerStallToTime() :"+objEventDet.getPerStallToTime());
													
													String hr4=toTim2[0];
													String min4=toTim2[1];
													String zon4=toTim1[1];
													
													hr3=Integer.parseInt(hr4);
													min3=Integer.parseInt(min4);
													
													if(zon4.equalsIgnoreCase("a.m"))
													{
														zon3=1;
													}											
													else
													{
														zon3=2;
													}
													
													if(objEventDet.getPerStallFromDate()!=null)
													{
													perStalFromDat=objEventDet.getPerStallFromDate();
													
													String valFrmDat="";
													valFrmDat=perStalFromDat.substring(2,3);
													System.out.print("valFrmDat :"+valFrmDat);
													
													if(valFrmDat.equalsIgnoreCase("/"))
													{
														perStalFromDat=perStalFromDat;
													}
													else
													{						
														String[] tempstabdat1=perStalFromDat.split(" ");
														String[] tempstabdat=tempstabdat1[0].split("-");
														perStalFromDat=tempstabdat[1]+"/"+tempstabdat[2]+"/"+tempstabdat[0];
													}
													
													System.out.print("perStalFromDat :"+perStalFromDat);												
													
													if(objEventDet.getPerStallToDate()!=null)
													{
													
													perStalToDat=objEventDet.getPerStallToDate();
													
													String valToDat="";
													valToDat=perStalToDat.substring(2,3);
													System.out.print("valToDat :"+valToDat);
													
													if(valToDat.equalsIgnoreCase("/"))
													{
														perStalToDat=perStalToDat;
													}
													else
													{	
													
													String[] tempstabdat4=perStalToDat.split(" ");
													String[] tempstabdat3=tempstabdat4[0].split("-");
													perStalToDat=tempstabdat3[1]+"/"+tempstabdat3[2]+"/"+tempstabdat3[0];
													
													}
													System.out.print("perStalToDat :"+perStalToDat);
													}
													
													System.out.print("PerStallPrice :"+PerStallPrice);
													System.out.print("hr1 :"+hr1 +"min1 :"+min1+"zon1 :"+zon1);
													System.out.print("hr3 :"+hr3 +"min3 :"+min3+"zon3 :"+zon3);
													
													}
													
												}
												
												if(objEventDet.getStablingLimited().equalsIgnoreCase("0"))
												{
													noStab="checked";
												}
												
														String zonStView1="";
														String zonStView2="";
														
														String TimSt2="";
														String TimSt3="";
																					
														if(zon3==1)
														{
															zonStView2="a.m";										
														}
														else if(zon3==2)
														{
															zonStView2="p.m";	
														}					
														TimSt3=hr3+":"+min3+" "+zonStView2;
														
														if(zon2==1)
														{
															zonStView1="a.m";										
														}
														else if(zon2==2)
														{
															zonStView1="p.m";	
														}					
														TimSt2=hr2+":"+min2+" "+zonStView1;
														
												
											%>

	<p>Stabling / Veterinarian:	</p>
			<p>Stabling/Stall Info:	</p>
				<%
				String limit="";
				if(!limit.equalsIgnoreCase(""))
				{%>
		<p> Limited stabling.</p>
						<%}%>
					
					<%
					if(unlimitedStab.equalsIgnoreCase("checked"))
					{%>
					
		<p>Unlimited stabling.</p>
							<%}%>
							
							<%
									
							if(crgPerStPerNight.equalsIgnoreCase("checked"))
							{%>
			
			           
								
			              <%}%>
								
						<%
						if(PerStallRadio.equalsIgnoreCase("checked"))
						{%>
							
						      <p> Per stall on a given time & date.	</p>
							  <div id="perStalltwo1">
								  <div class='col-md-offset-1'>
									 <i class="fa fa-dollar"></i><label class='control-label'> <%=PerStallPrice%>,From<%=TimSt2%><%=perStalFromDat%>;To<%=TimSt3%><%=perStalToDat%></label>
                                            </div>
										</div>
										
											
										

                                    
								
								
								<%}%>
					
			<%
			if(noStab.equalsIgnoreCase("checked"))
			{%>		
			<p>No stabling available.</p>			
			 
			<%}%>
	</div>		
			


<!-- **************************************** Part D of the form starts here *********************************************** -->

<div class="form-group" onclick="expandColl('partd');"><strong>Event Registration Form: Part D </div>
<div id="partd" class="form-group">

								<%
									String noOfStalls="";
									String noOfStallsTxt="";
									
									String noOfTmpStalls="";
									String noOfTmpStallsTxt="";
									
									String noOfTmpPermStalls="";
									String noOfTmpPermStallsTxt="";
									
									String mileFrmEventTxt="";
									
									System.out.print("objEventDet.getNoOfStalls() :"+objEventDet.getNoOfStalls());
									System.out.print("objEventDet.getNoOfTempStalls() :"+objEventDet.getNoOfTempStalls());
									System.out.print("objEventDet.getNoOfTempPermanentStalls() :"+objEventDet.getNoOfTempPermanentStalls());
									System.out.print("objEventDet.getMilesFromEvent() :"+objEventDet.getMilesFromEvent());
									
									if(!objEventDet.getNoOfStalls().equalsIgnoreCase("0"))
									{					
										noOfStalls="checked";
										noOfStallsTxt=objEventDet.getNoOfStalls();
									}	
									
									if(!objEventDet.getNoOfTempStalls().equalsIgnoreCase("0"))
									{					
										noOfTmpStalls="checked";
										noOfTmpStallsTxt=objEventDet.getNoOfTempStalls();
									}	
									
									if(!objEventDet.getNoOfTempPermanentStalls().equalsIgnoreCase("0"))
									{					
										noOfTmpPermStalls="checked";
										noOfTmpPermStallsTxt=objEventDet.getNoOfTempPermanentStalls();
										
										mileFrmEventTxt=objEventDet.getMilesFromEvent();
									}	
										
								%>

<p>Type of stabling:	</p>

				<%
				if(noOfStalls.equalsIgnoreCase("checked"))
				{
				%>
				<label class='control-label col-md-2 col-md-offset-2' for='id_title'> Permanent stalls on ground.</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=noOfStallsTxt%></label>
												(Qty)
											 </div>
										</div>
									</div>	
				<%}%>

				<%
				if(noOfTmpStalls.equalsIgnoreCase("checked"))
				{
				%>
				    <label class='control-label col-md-2 col-md-offset-2' for='id_title'>  Temporary stalls on ground.</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=noOfTmpStallsTxt%> </label>
												(Qty)
											 </div>
										</div>
									</div>	
				
				
								<%}%>
								
								<%
								if(noOfTmpPermStalls.equalsIgnoreCase("checked"))
								{
								%>
				<p> Permanent/temporary stalls with approximate distance from event.	</p>
				               <div class="form-group" id="qtyThree">
				                   <div class='col-md-offset-1'>
									     <label class='control-label'> <%=noOfTmpPermStallsTxt%>(Qty);<%=mileFrmEventTxt%>Miles from event; </label>
                                    </div>
								</div>	
								
				<%}%>				
								
				<%--<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableFour" onClick="clearfour();"/> Stall doors & initial bedding only provided.
				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableFive" onClick="clearfive();"/> Feed/Bedding/Hay available for purchase, further info from the secretary.
				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" value="typStableSix" onClick="clearsix();"/> Other type.
				</div>
								<div class="rowNew" id="qTwo1">
									<div class="floatLeft">
										<span class="floatLeftTwo"><input type="text" class="textboxOne" name="qTwo1" size="25" /></span>
									</div>
													</div>--%>
					<%
						String vetName="";
						String vetPh="";
						String vetPostAt="";
						
						if(objEventDet.getVeterinarianName()!=null)
						{
							vetName=objEventDet.getVeterinarianName();
							vetPh=objEventDet.getVeterinarianPhone();
							vetPostAt=objEventDet.getVeterinarianPlace();
						}
					%>
			<p>Veterinarian Info:	</p>
			         <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=vetName%></label>
											 </div>
										</div>
									</div>	
							 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Veterinarian phone no. at event:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=vetPh%></label>
											 </div>
										</div>
									</div>			
								 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Where Vet. no. will be posted at event:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=vetPostAt%></label>
											 </div>
										</div>
									</div>		
					
					
														
										<%
											String acc1[]=new String[5];
											String acc2[]=new String[5];
											String acc3[]=new String[5];
											
											int val=0;
											
											while(val<5)
											{
												acc1[val]="";
												acc2[val]="";
												acc3[val]="";
												
												val++;
											}
											
											if(accommodation!=null)
											{
												System.out.print("accommodation.size() :"+accommodation.size());
												
												if(accommodation.size()==1)
												{	
												
												while(val<5)
												{
												acc1[val]="";
												acc2[val]="";
												acc3[val]="";
												
												val++;
												}
												
													acc1=(String[])accommodation.elementAt(0);
													
													System.out.print("acc1[2] :"+acc1[2]);
												}
												
												if(accommodation.size()==2)
												{	
												
												while(val<5)
												{
												acc1[val]="";
												acc2[val]="";
												acc3[val]="";
												
												val++;
												}
												
													acc1=(String[])accommodation.elementAt(0);
													acc2=(String[])accommodation.elementAt(1);
													
													System.out.print("acc2[2] :"+acc2[2]);
												}
												
												if(accommodation.size()==3)
												{	
												
													while(val<5)
													{
													acc1[val]="";
													acc2[val]="";
													acc3[val]="";
													
													val++;
													}
												
													acc1=(String[])accommodation.elementAt(0);
													acc2=(String[])accommodation.elementAt(1);
													acc3=(String[])accommodation.elementAt(2);
													
													System.out.print("acc3[2] :"+acc3[2]);
												}
												
											}
											
											String dir="NA";
											System.out.print("objEventDet.getDirections() :"+objEventDet.getDirections());
											
											if(objEventDet.getDirections()!=null)
											{
												dir=objEventDet.getDirections();
											}
											
										%>
<p>Accomodations:	</p>
           <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'>Hotel</label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'>Phone No.</label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'>Miles From Event</label>
                                            </div>		
                                   </div>
                             </div>	
						 <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=acc1[2]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc1[3]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc1[4]%></label>
                                            </div>		
                                   </div>
                             </div>		 
						<%
								if(!acc2[2].equalsIgnoreCase(""))
								{
								%>
					 <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=acc2[2]%> </label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc2[3]%> </label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc2[4]%></label>
                                            </div>		
                                   </div>
                             </div>		 			
						
						<%}%>
						
						<%
						if(!acc3[2].equalsIgnoreCase(""))
						{
						%>
				 <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=acc3[2]%>  </label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc3[3]%> </label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=acc3[4]%> </label>
                                            </div>		
                                   </div>
                             </div>	
			
			<%}%>
			<div class="form-group">
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Directions:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=dir%></label>
											 </div>
										</div>
								 </div>
								</div> 
						</div>		



<!-- **************************************** Part E of the form starts here *********************************************** -->

<%

	/*java.util.Vector dressageHorseTrialsVect2=new Vector();
    dressageHorseTrialsVect2=(java.util.Vector)request.getAttribute("dressageHorseTrialsVect");

	if(hDressage!=null)
	{
		Enumeration dEnum=hDressage.elements();
		
		System.out.print("hDressage.size() :"+hDressage.size());
		
		while(dEnum.hasMoreElements())
		{
			String[] dElem=(String[])dEnum.nextElement();
		}
	}*/
	

%>


<div class="form-group" onclick="expandColl('parte');">Event Registration Form: Part E </div>
<div id="parte" class="form-group">

	<p>Dressage test for horse trials, two-day events & Combined tests:	</p>
		<p>Advanced Level
			Arena Size</p>
    	
			<%! String x; %>
                            
			   <% 
							  int chkno=0;
                              int arenaCt=0;
							   
                              java.util.Vector dressageHorseTrialsVect=new Vector();
                              dressageHorseTrialsVect=(java.util.Vector)request.getAttribute("dressageHorseTrialsVect");
                              java.util.ArrayList arenasSizeVect=new ArrayList();
                              arenasSizeVect=(java.util.ArrayList)request.getAttribute("arenaSizeVect");
   
							 Enumeration itr= (Enumeration)dressageHorseTrialsVect.elements();
						//	 Enumeration it = (Enumeration)arenasSizeVect.elements();
							 System.out.print("dressageHorseTrialsVect.size() :" +dressageHorseTrialsVect.size());
							 System.out.print("hSelDressage.size() :"+hDressage.size());
							 
							 int dressSiz=dressageHorseTrialsVect.size();
							 String dressSel[]=new String[dressSiz];
							 String arenaSel[]=new String[dressSiz];
						
					 /*
					  * Checking for check box matching records while load....
					  */
					
				if(hDressage != null) 
				{
					if(arenaCt<hDressage.size())
					{											
							String[] dressSelected=(String[])hDressage.elementAt(arenaCt);
							int j=0;	
							
						for(j=0;j<dressageHorseTrialsVect.size();j++)
						{
							String[] comp = (String[]) dressageHorseTrialsVect.elementAt(j);                                    
							String dispdressName=comp[1];
																					
							System.out.print("dispdressName :"+dispdressName); 
							System.out.print("dressSelected[2] :"+dressSelected[2]);
							 						
							if(dressSelected[2].equalsIgnoreCase(dispdressName))
							{							
								dressSel[j]="checked";
								arenaSel[j]=dressSelected[3];
								
								System.out.print("inside selected dressSelected[2] :"+dressSelected[2]);					
								System.out.print("inside selected dressSelected[3] :"+dressSelected[3]);
							}
							else
							{	
								arenaSel[j]="";
								dressSel[j]="";
							}
						}
					}
				}    
				
				
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
						
					          <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=x%></label>
                                            </div>	
								</div>				 	 		   
                                   
			                        <%
									if(dressSel[arenaCt].equalsIgnoreCase("checked"))
									{%>
									
									<p> <%=level%>	</p>						
									
								<p><%=arenaSel[arenaCt]%></p>						                      
								<%}%>
                                
								<p> <% chkno++;arenaCt++; } 
							 %></p>
						
					 <%
						String footing="NA";
						
						if(objEventDet.getFootingDesc()!=null)
						{
							footing=objEventDet.getFootingDesc();
							System.out.print("objEventDet.getFootingDesc() :"+objEventDet.getFootingDesc());
						}
					 
					 %>
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Briefly describe footing:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=footing%></label>
											 </div>
										</div>
								 </div>
			
													
													<%
														String[] cctry1=new String[7];
														String[] cctry2=new String[7];
														String[] cctry3=new String[7];	
														String courseInfo="";
														String addInfo="NA";
																
														int ccCt=0;
													
														if(crossCountry!=null)
														{
															System.out.print("crossCountry.size() :"+crossCountry.size());
															
															if(crossCountry.size()==1)
															{	
															
															while(ccCt<7)
															{
															cctry1[ccCt]="";
															cctry2[ccCt]="";
															cctry3[ccCt]="";
															
															ccCt++;
															}
															
																cctry1=(String[])crossCountry.elementAt(0);
																courseInfo=cctry1[5];
																addInfo=cctry1[6];
																
																System.out.print("cctry1[2] :"+cctry1[2]);
																
															}
															
															if(crossCountry.size()==2)
															{	
															
															while(ccCt<7)
															{
															cctry1[ccCt]="";
															cctry2[ccCt]="";
															cctry3[ccCt]="";
															
															ccCt++;
															}
															
																cctry1=(String[])crossCountry.elementAt(0);
																cctry2=(String[])crossCountry.elementAt(1);
																
																courseInfo=cctry1[5];
																addInfo=cctry1[6];
																
																System.out.print("cctry2[2] :"+cctry2[2]);
															}
															
															if(crossCountry.size()==3)
															{	
															
																while(ccCt<7)
															{
															cctry1[ccCt]="";
															cctry2[ccCt]="";
															cctry3[ccCt]="";
															
															ccCt++;
															}
															
																cctry1=(String[])crossCountry.elementAt(0);
																cctry2=(String[])crossCountry.elementAt(1);
																cctry3=(String[])crossCountry.elementAt(2);
																
																courseInfo=cctry1[5];
																addInfo=cctry1[6];
																
																System.out.print("cctry3[2] :"+cctry3[2]);
															}
															
															System.out.print("courseInfo :"+courseInfo);
															System.out.print("addInfo :"+addInfo);
															
														}
														%>
<p>Cross-Country:	</p>
            <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'>Division</label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'>Length</label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'>Speed</label>
                                            </div>		
                                   </div>
                             </div>	
					   <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=cctry1[2]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry1[3]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry1[4]%></label>
                                            </div>		
                                   </div>
                             </div>	
		 <%
			if(!cctry2[2].equalsIgnoreCase(""))
			{%>
			  <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=cctry2[2]%> </label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry2[3]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry2[4]%></label>
                                            </div>		
                                   </div>
                             </div>	
			
			<%}%>
			
			<%
			if(!cctry3[2].equalsIgnoreCase(""))
			{%>
			 <div class="form-group">		
							     <div class='col-md-8'>
                                        <div class='col-md-2'>
                                             <label class='control-label'><%=cctry3[2]%></label>
                                            </div>
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry3[3]%></label>
                                            </div>	
										<div class='col-md-2'>
                                             <label class='control-label'><%=cctry3[4]%></label>
                                            </div>		
                                   </div>
                             </div>	
			
			<%}%>

			<%
				String optOne="";
				String optTwo="";
				String optThree="";
												
				if(courseInfo.equalsIgnoreCase("Easy, good for first time at this level."))
				{
					optOne="checked";
				}
				
				if(courseInfo.equalsIgnoreCase("Average, for horses with some experience at this level."))
				{
					optTwo="checked";
				}
				
				if(courseInfo.equalsIgnoreCase("Difficult, championship caliber course."))
				{
					optThree="checked";
				}
			
			
			%>
<p>Describe your course(s). Choose from the list below or use your own description.		</p>
			
			<%
			if(optOne.equalsIgnoreCase("checked"))
			{
			%>
			<p> Easy, good for first time at this level.	</p>
			<%}%>
			
			<%
			if(optTwo.equalsIgnoreCase("checked"))
			{
			%>
			<p> Average, for horses with some experience at this level.	</p>
			<%}%>
			
			<%
			if(optThree.equalsIgnoreCase("checked"))
			{
			%>
			<p>Difficult, championship caliber course.	</p>
			<%}%>
			
			<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Additional information</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=addInfo%></label>
											 </div>
										</div>
								 </div>
			
			<%
				java.util.Date calDat=null;
				String courseClDat="NA";
				String EntryLimit="NA";
				String riderHorseLevelLimit="NA";
				String ridHorseLevelEntryLimit="NA";
				String divEntBirthDat="NA";
				java.util.Date divEntBDate=null;
				
				if(othersDet.getCourseCloseDate()!=null)
				{
					calDat=othersDet.getCourseCloseDate();
					System.out.print("othersDet.getCourseCloseDate() :"+othersDet.getCourseCloseDate());
					
					String tempCCDat=calDat.toString();
					String ccDay[]=tempCCDat.split("-");
					courseClDat=ccDay[1]+"/"+ccDay[2]+"/"+ccDay[0];
				}	
				
				if(othersDet.getEntryLimit()!=null)
				{
					EntryLimit=othersDet.getEntryLimit();
				}
				
				System.out.print("othersDet.getEntryLimit() :"+othersDet.getEntryLimit());
				
				if(othersDet.getRidersHorseLevelLimit()!=null)
				{
					riderHorseLevelLimit=othersDet.getRidersHorseLevelLimit();
				}
								
				System.out.print("othersDet.getRidersHorseLevelLimit() :"+othersDet.getRidersHorseLevelLimit());
				
				if(othersDet.getRidersHorseEntireLimit()!=null)
				{
					ridHorseLevelEntryLimit=othersDet.getRidersHorseEntireLimit();
				}
				
				System.out.print("othersDet.getRidersHorseEntireLimit() :"+othersDet.getRidersHorseEntireLimit());
					
				if(othersDet.getDivisionEntryBirthDate()!=null)
				{
					divEntBDate=othersDet.getDivisionEntryBirthDate();
					System.out.print("othersDet.getDivisionEntryBirthDate() :"+othersDet.getDivisionEntryBirthDate());
					
					String divDat=divEntBDate.toString();
					String divDay[]=divDat.split("-");
					divEntBirthDat=divDay[1]+"/"+divDay[2]+"/"+divDay[0];
				}		
						
				boolean dogLease= othersDet.isLeaseDogs();		
				System.out.print("othersDet.isLeaseDogs() :"+othersDet.isLeaseDogs());		
				
				String dogLeaseYes="";
				String dogLeaseNo="";
				
				if(othersDet.isLeaseDogs()==true)
				{
					dogLeaseYes=" Yes.";
				}
				else
				{
					dogLeaseYes="No.";
				}
									
			%>
<p>Other Information: ( The course-closed date must be stated)</p>
            <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Cross-country course officially closed on..</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=courseClDat%></label>
											 </div>
										</div>
								 </div>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Entry limit</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=EntryLimit%></label>
											 </div>
										</div>
								 </div>				 
		
			<p>Riders limited to horse/level <span style="color:#FF0000">*</span> (or)horse/entire event.<span style="color:#FF0000">**</span></p>
						<p><%=riderHorseLevelLimit%></p>
						<p><%=ridHorseLevelEntryLimit%></p>
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Divisions further divided if entries warrant; state birth date on entry :</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=divEntBirthDat%></label>
											 </div>
										</div>
								 </div>		
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Dogs must be leashed (and/or)</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=dogLeaseYes%></label>
											 </div>
										</div>
								 </div>					 	
	 
			
								<%
									String perTimePrice="NA";
									String teamTotal="NA";
									String partyName="NA";
									String finalAddInfo="NA";
									
									if(!othersDet.getPerTimePrice().equalsIgnoreCase("0") && !othersDet.getPerTimePrice().equalsIgnoreCase("0.0"))
									{
										perTimePrice=othersDet.getPerTimePrice();
									}
								
									if(!othersDet.getTeamCompetition().equalsIgnoreCase("0") && !othersDet.getTeamCompetition().equalsIgnoreCase("0.0"))
									{
										teamTotal=othersDet.getTeamCompetition();
									}
								
									if(othersDet.getPartyName() != null && othersDet.getPartyName().trim().length()!=0)
									{
										partyName=othersDet.getPartyName();
									}
									
									if(othersDet.getAddInfo()!=null && othersDet.getAddInfo().trim().length()!=0)
									{
										finalAddInfo=othersDet.getAddInfo();
									}
									
									System.out.print("othersDet.getPerTimePrice() :"+othersDet.getPerTimePrice());
									System.out.print("othersDet.getTeamCompetition() :"+othersDet.getTeamCompetition());				
									System.out.print("othersDet.getPartyName() :"+othersDet.getPartyName());
									System.out.print("othersDet.getAddInfo() :"+othersDet.getAddInfo());
									
								%>
			
			<p>Team of three of four, best three scores to count, all team members at same level. </p>
			       
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=perTimePrice%></label>
												$ per team member.(or)
											 </div>
										</div>
								 </div>
								  <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=teamTotal%></label>
											 </div>
										</div>
								 </div>
								<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Competitors/Volunteers/Officials Party:</label>
                                   <div class='col-md-8'>
								       <div class='col-md-3 indent-small'>
										    <div class='form-group internal'> 
											    <label class="control-label"><%=partyName%> </label>
											 </div>
										</div>
								 </div>		 
						
		<p>	Additional information.	</p>
			

						<%
					
							}
							catch(Exception e)
							{
								System.out.print("Error in jsp : ");
								e.printStackTrace();		
							}
						%>
	</div>		


               <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary'  type="button" value="Back" onClick="javascript:history.back(-1);">Back</button>
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

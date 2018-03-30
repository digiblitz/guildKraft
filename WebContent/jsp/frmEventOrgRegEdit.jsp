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

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1" onload="initCondition();switchDiv('dblEntry');switchDiv('lpOne');switchDiv('lpTwo');switchDiv('lpOther');switchDiv('nctReq');switchDiv('nctState');switchDiv('ribbons');switchDiv('awrdOth');switchDiv('dateDivOth'); ">

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
				divided into five parts for it's easy handling. Click on the tabs seen below to Expand / Contract it
				and hence reveal the hidden parts of the form.</p>			
		<form class='form-horizontal' role='form' name="myform" id="myform" class="formcss" method="post" action="./editEventDetails.html" onsubmit="return check();"  >
			
			<input type="hidden" name="process" value="update" />
			
							<%
							
							try
							{
							System.out.print("::::::::::: Inside EventDetails jsp ::::::::::");
										
							HLCEventDetailsVO objEventDet=new HLCEventDetailsVO();
							ArrayList eventDet = new ArrayList();
							eventDet=(ArrayList)request.getAttribute("HLCEventDetails");
										
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

<div class="for-control" onclick="expandColl('parta');"> 
 <p> HLC Event Registration Form: Part A</p> <!--span class="textOne">(click to expand/contract)</span -->

<div id="parta" class="form-group">
					<%
                                                String eventId=objEventDet.getEventId();
                                                System.out.println("objEventDet.getEventId() in jsp :"+objEventDet.getEventId());
                                                
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
					<input type="hidden" name="eventId" value="<%=eventId%>" />
				 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Title:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                           <input type="text" class="form-control"  value="<%=objEventDet.getEventTitle()%>" name="eventtitle" /> 
							                <span id="span_astriesk">*</span>							
									 </div>
						     </div>
						</div>	 
					 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Event Secretary ID:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                          <input type="text" class="textboxOne" value="<%=eventSecId%>" size="25" name="eventsecid" onBlur="HLCMemberDetails();"//>
							                <span id="span_astriesk">*</span>							
									 </div>
						     </div>
						</div>	 	
			
                        
                        <input type="hidden" name="process" value="update" />
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Name:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                          <input type="text" class="readOnly" size="25" name="hlcstaffname" readonly="true"/>
							            						
									 </div>
						     </div>
						</div>	 
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Address for entries to be sent:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                          <input type="text" class="readOnly" size="30" name="address" readonly="true"/>
							               						
									 </div>
						     </div>
						</div>	 
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>City:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                         <input type="text" class="readOnly" size="30"  name="city" readonly="true"/>
									 </div>
						     </div>
						</div>	 
						 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Telephone:</label>
                                    <div class='col-md-8'>
                                        <div class='col-md-3 indent-small'>
                                            <div class='form-group internal'>	
                                        <input type="text" class="readOnly" size="20" name="phone" readonly="true"/>
									 </div>
						     </div>
						</div>	 
                        
			
			
			
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
		Divisions: <span class="labelTwo">(Select the division(s) & level(s) that will be offered)</span>	</div>
			<div >
            				
			<%!String x1; %>
			
			<% 
			        
			int chksfx=0;
            String cbx="divlevel";
			java.util.Vector allTypesVect=new Vector();
			allTypesVect=(java.util.Vector)request.getAttribute("allTypesVect");
			
			Enumeration itrators= (Enumeration)allTypesVect.elements();
			int divSelCt=0;
			System.out.print("allTypesVect.size() :" +allTypesVect.size());
			int arrSiz=allTypesVect.size();
			String divSel[]=new String[arrSiz];
			//System.out.print("divSel.length :"+divSel.length);
			
			while(itrators.hasMoreElements()){
				String[] s = (String[]) itrators.nextElement();                                    
				String code=s[4];
				String mid=s[0];
					
				if(divisionLevels != null) 
				{
					if(divSelCt<divisionLevels.size())
					{
					
							System.out.print("divisionLevels.size() :"+divisionLevels.size());
							String[] divLevel=(String[])divisionLevels.get(divSelCt);
							int j=0;	
							
						for(j=0;j<allTypesVect.size();j++)
						{
							String[] comp = (String[]) allTypesVect.get(j);                                    
							String code2=comp[4];
													
							if(code2.equalsIgnoreCase(divLevel[2]))
							{							
								divSel[j]="checked";
													
								System.out.print("divLevel[2] :"+divLevel[2]);
							}
							else
							{
								divSel[j]="";
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
                           
            <input type="hidden" name="divcbxct" value="<%=allTypesVect.size()%>" />
			<div class="colspan"><%=x1%></div>
				<%}%>
			<div class="row">
				<span>
				<input type="checkbox" <%=divSel[divSelCt]%> size="10" name="<%=cbxname%>" value="<%=mid%>" /><%=code%>				</span>			</div>   
			<%  
			chksfx++;divSelCt++;} 
			%>
			</div>

		<div class="rowHead">
			Officials:		</div>
                        <%

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
			
										
							%>

							<div class="colspan">
											<input type="checkbox" <%=judSel[judSelCt]%> value="<%=judList[0]%>" id="<%=cbxofname%>" name="<%=cbxofname%>" /> <span class="labelTwo"><%=judList[1]%></span>							</div>
							<div class="row">
								<span class="label">Name:</span>
										<span class="formX"><input type="text" value="<%=judTxtVal[judSelCt]%>" class="textboxOne" size="25" name="<%=tbof%>" id="<%=tbof%>" /></span>							</div>
                                                    <%  chkoffct++;judSelCt++;
													 }}
	
                        %>
			
                                                    <input type="hidden" name="offct" value="<%=chkoffct%>" /> 
	</div>
<!-- **************************************** Part B of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partb');"> <strong>Event Registration Form: Part B </strong></div>
<div id="partb" class="formPart">

	<div class="rowHead">
		Entries:	</div>

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
				
			<div class="row">
				<span class="label">Fees:</span>
				<span class="formX"><strong>$</strong> <input type="text" value="<%=entFee%>" class="textboxOne" size="5" name="fees" maxlength="7"/> (Per division) <span class="asterisk">*</span></span>			</div>
			<div class="row">
				<span class="label">Others:</span>
				<span class="formX"><input type="text" value="<%=otherFee%>" class="textboxOne" name="others" size="10" /> </span>			</div>
			<div class="colspan">
				Check where applicable:			</div>
			
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
			
			<div class="row">
				<div class="floatLeft"><input type="checkbox" <%=membAppStat1%> value="HLC membership required at all levels including BN" name="memblevel" size="10" /> Membership required at all levels including BN</div>
			</div>
			<div class="row">
				<div class="floatLeft"><input type="checkbox" <%=membAppStat2%> value="BNH/BNR competitors who are not HLC members must pay an additional $25 fee with entry." name="comppay" size="10" /> BNH/BNR competitors who are not members must
						pay an additional $25 fee with entry.				</div>
			</div>
			<div class="row">
				<div style="text-align:left;" class="textBold">Double Entries Accepted:				</div>
			</div>
			
			<%
			
			String dblYes="";
			String dblNo="";
			String dblYesTxt="";
			
			if(objEventDet.getDoubleEntryFee()!=null)
			{
				if(objEventDet.getDoubleEntryFee().equalsIgnoreCase("yes"))
				{
					System.out.print("objEventDet.getDoubleEntryFee() :"+objEventDet.getDoubleEntryFee());
					dblYes="checked";
					
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
					dblNo="checked";
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
			
			<div class="row">
				<div class="floatLeft">
				<input type="radio" size="10" <%=dblYes%> name="dblE" value="yes" /> Yes
				<input type="radio" size="10" <%=dblNo%> name="dblE" value="no" onClick="dblEntryclear();"/> No  <span class="asterisk">*</span>				</div>
			</div>
			<div class="row" id="dblEntry">
				<div class="floatLeft">
				<input type="text" value="<%=dblYesTxt%>" class="textboxOne" name="dblEntry" size="10" /> <strong>$</strong> (Office Fees)				</div>
			</div>

			<div class="colspan">
				Payment Check Details:			</div>
			<div class="row">
				<span class="label">Draw checks to the order of:</span>
				<span class="formX"><input type="text" value="<%=chkPayable%>" class="textboxOne" size="40" name="drawCheck"/> <span class="asterisk">*</span></span>			</div>
			
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
			
			<div class="row">
				<div class="floatLeft">
				<input type="radio" size="10" <%=one%> name="r1" value="0" onClick=" lpTwoclear(); lpOtherclear()" /> charge for lost pinny <span>*</span>
				<input type="radio" size="10" <%=two%> name="r1" value="1" onClick=" lpOneclear(); lpOtherclear();" /> charge for lost pinny <span>**</span>
				<input type="radio" size="10" <%=three%> name="r1" value="2" onClick=" lpOneclear(); lpTwoclear();" /> Other				</div>
			</div>
			<div class="row" id="lpOne">
				<div class="floatLeft">
				<strong>$</strong> <input type="text" value="<%=pennyChgOne%>" class="textboxOne" name="lpOne" size="10" /> (* No deposit required)				</div>
			</div>
			<div class="row" id="lpTwo">
				<div class="floatLeft">
				<strong>$</strong> <input type="text" value="<%=pennyChgTwo%>" class="textboxOne" name="lpTwo" size="10" /> (** Send deposit with entry)				</div>
			</div>
			<div class="row" id="lpOther">
				<div class="floatLeft">
				 <strong>$</strong> <input type="text" value="<%=pennyChgThree%>" class="textboxOne" name="lpOther" size="10" />
				</div>
			</div>

	<div class="rowHead">
		Refunds:	</div>

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
                       int refSelCt=0;
					   int refSiz=getAllMapRuleSubRule.size();
					    String ruleSel[]=new String[refSiz];   
						String ruleSelTxt[]=new String[refSiz];
												      
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
							String[] selRefLevel=(String[])refundRuleDetails.elementAt(refSelCt);




							int j=0;	
							
						for(j=0;j<getAllMapRuleSubRule.size();j++)
						{
							String[] refRules = (String[]) getAllMapRuleSubRule.elementAt(j);                                     
							String RuleName=refRules[4];
							ruleSelTxt[j]="";
							
							System.out.print("RuleName :"+RuleName);
							//System.out.print("ruleSel[j].length :"+ruleSel.length);
																				
							if(RuleName.equalsIgnoreCase(selRefLevel[3]))
							{					
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
													
			    %>
                            
			 
                               
                                   <% if(!(s[3].equals(xRule))){
								   xRule=s[3];
                                   %>
                                   
				 <div class="colspan"><%=xRule%></div>
                                <%}
									System.out.print("ruleSel[refSelCt] :"+ruleSel[refSelCt]);
								%>
                                <div class="row">
									<span >
										<input type="checkbox" <%=ruleSel[refSelCt]%> size="10" name="<%=cbxrfname%>" value="<%=mid%>" /><%=subRuleName%>
										<%
												
											
											if(!txt_status.equals("0")){
											String tb=txtrefnam+Integer.toString(chkrefct);
											%>
											<input type="text" value="<%=ruleSelTxt[refSelCt]%>" class="textboxOne" size="10" name="<%=tb%>" />
											<%
											}
												
										%>
									</span>              					</div>   
				
                                
					   <% chkrefct++;refSelCt++; } 
			 %>
							<input type="hidden" name="rulecbxct" value="<%=chkrefct%>" />
</div>

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


				<div class="rowHead">
				Negative Coggins Test			</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" <%=cogAll%> value="nctRef" onClick=" nctReq1clear();" />  Required for all horses..				</div>
					<div class="row" id="nctReq">
						<div class="floatLeft">
						within <input type="text" value="<%=cogAllMnth%>" class="textboxOne" name="nctReq1" size="6" /> months.						</div>
					</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r5" <%=reqWith%> value="nctRef1" onclick=" nctStateclear();" /> Required within..				</div>
					<div class="row" id="nctState">
						<div class="floatLeft">
						<input type="text" class="textboxOne" value="<%=reqWithIn%>" name="nctInState" size="6" /> months for in-state and <input type="text" value="<%=reqWithOut%>" class="textboxOne" name="nctOutState" size="6" /> months for out-of state.						</div>
					</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" <%=cogNreq%> name="r5" value="Not Required" onClick=" nctReqNotclear(); " /> Not Required.				</div>
				<div class="floatLeftTwo">
				<input type="radio" size="10" <%=cogOther%> name="r5" value="Others" onClick=" nctReqOthclear();" /> Others.				</div>
</div>


<!-- **************************************** Part C of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partc');"><strong>Event Registration Form: Part C </strong></div>
<div id="partc" class="formPart">

	<div class="rowHead">
		Tentative Time Schedule:	</div>

			<div class="rowTwo">
				<span class="labelTwo">Day(mm/dd/yyyy)</span>
				<span class="labelTwo">Phase</span>
				<span class="labelTwo">Time</span>			</div>
			
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
			
			
			%>
			
			
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=finalDay[0]%>" class="readOnly" size="10" name="DateImported1" readonly="true" />
					<a href="javascript:cal1.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" value="<%=phase[0]%>" class="textboxOne" size="10" name="PhaseImported1"/> <span class="asterisk">*</span></span>
				<span class="lableTwo">
									<select name="TimeImported1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hour</option>

									 <%
									  	for(int h=00;h<13;h++)
										{
										if(h==hr[0])
										{
										%>
											 <option selected="selected" value="<%=h%>"><%=h%></option>
										<%}else if(hr[0]==0)
										{%>
											<option value="" selected="selected">Hour</option>
										<%}else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}}
									  
									  %>
									</select>

									<select name="MinuteImported1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
									<%
									
									  for(int m=00;m<61;m++)
										{
										if(m==min[0])
										{
										%>
												  <option selected="selected" value="<%=m%>"><%=m%></option>
										<%}
										else if(min[0]==0)
										{%>
											<option value="" selected="selected">Mins</option>
										<%}else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}}%>
									</select>



									<select name="FormatImported1" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									
									<%if(zone[0]==1)
									{%>
										<option selected="selected" value="01">a.m</option>
										<option value="02">p.m</option>										
									<%}
									else if(zone[0]==0)
									{%>
										<option value="" selected="selected">Mdrn</option>
									<%}else
									{%>
										<option value="01">a.m</option>
										<option selected="selected" value="02">p.m</option>
									<%}%>
						</select>
			  </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=finalDay[1]%>" class="readOnly" name="DateImported2" readonly="true" size="10" />
					<a href="javascript:cal2.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" value="<%=phase[1]%>" class="textboxOne" name="PhaseImported2"size="10" /> <span class="asterisk">*</span></span>
				<span class="labelTwo">
									<select name="TimeImported2" id="select" class="selectboxOne">
									 
									<%
										int hflag1=0;
										
									  	for(int h=1;h<13;h++)
										{
										if(h==hr[1])
										{
										%>
											 <option selected="selected" value="<%=h%>"><%=h%></option>
										<%}else if(hr[1]==0)
										{
										if(hflag1==0)
										{
										h=h-1;
										%>
											<option value="" selected="selected">Hour</option>
										<%} 
										else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}
										hflag1=1;
										}else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}}
									  
									  %>
									</select>

									<select name="MinuteImported2" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
									<%
										int mflag1=0;
									
									  for(int m=1;m<61;m++)
										{
										if(m==min[1])
										{
										%>
												  <option selected="selected" value="<%=m%>"><%=m%></option>
										<%}
										else if(min[1]==0)
										{
										if(mflag1==0)
										{
										m=m-1;
										%>
											<option value="" selected="selected">Mins</option>
										<%
										}
										else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}
										mflag1=1;
										
										}else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}}%>
									</select>



									<select name="FormatImported2" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									
									<%
									 if(zone[1]!=0)
									 {
									if(zone[1]==1)
									{%>
										<option selected="selected" value="01">a.m</option>
										<option value="02">p.m</option>										
									<%}
									else
									{%>
										<option value="01">a.m</option>
										<option selected="selected" value="02">p.m</option>
									<%}
									}else
									{
									%>									
										<option value="01">a.m</option>
										<option value="02">p.m</option>
									<%}%>
						</select> 
					</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=finalDay[2]%>" class="readOnly" name="DateImported3" readonly="true" size="10" />
					<a href="javascript:cal3.popup();">
					 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0">					</a>				</span>
				<span class="labelTwo"><input type="text" value="<%=phase[2]%>" class="textboxOne" name="PhaseImported3" size="10" /> <span class="asterisk">*</span></span>
				<span class="labelTwo">
									<select name="TimeImported3" id="select" class="selectboxOne">
									  <option value="" selected="selected">Hour</option>
									  
									  	<%
										int hflag2=0;
										
									  	for(int h=1;h<13;h++)
										{
										if(h==hr[2])
										{
										%>
											 <option selected="selected" value="<%=h%>"><%=h%></option>
										<%}else if(hr[2]==0)
										{
										if(hflag2==0)
										{
										h=h-1;
										%>
											<option value="" selected="selected">Hour</option>
										<%} 
										else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}
										hflag2=1;
										}else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}}
									  
									  %>
									</select>

									<select name="MinuteImported3" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
									<%
										int mflag2=0;
									
									  for(int m=1;m<61;m++)
										{
										if(m==min[2])
										{
										%>
												  <option selected="selected" value="<%=m%>"><%=m%></option>
										<%}
										else if(min[2]==0)
										{
										if(mflag2==0)
										{
										m=m-1;
										%>
											<option value="" selected="selected">Mins</option>
										<%
										}
										else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}
										mflag2=1;
										
										}else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}}%>
									</select>



									<select name="FormatImported3" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									<%
									 if(zone[2]!=0)
									 {
									if(zone[2]==1)
									{%>
										<option selected="selected" value="01">a.m</option>
										<option value="02">p.m</option>										
									<%}
									else
									{%>
										<option value="01">a.m</option>
										<option selected="selected" value="02">p.m</option>
									<%}
									}else
									{
									%>									
										<option value="01">a.m</option>
										<option value="02">p.m</option>
									<%}%>
						</select> 
					</span>			</div>


	<%
							String awardTropy="";
							String awardTropyTxt="";
							String awardPrize="";
							String awardOthers="";
							String awardOthersTxt="";
							
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

	<div class="rowHead">
		Awards:	</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r6" <%=awardTropy%> value="awardOne" onclick=" awrdOthclear(); awrdclear();  " /> Trophy & Ribbons			</div>
				<div class="row" id="ribbons">
					<div class="floatLeft">
					 <input type="text" class="textboxOne" value="<%=awardTropyTxt%>" name="ribbons" size="10" /> No. of ribbons per division.				 </div>
			</div>
			<div class="rowHeightOne">
			<input type="radio" size="10" name="r6" <%=awardPrize%> value="awardTwo" onclick=" awrdOthclear(); awrdclear();ribbonsclear();" /> Prize money will be paid by check and available at the secretary?s office immediately
			<input type="hidden" name="award2" value="Prize money paid by check" />
						after the <span style="margin-left:25px;">awards ceremony.</span>			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r6" <%=awardOthers%> value="awardThree" onclick=" awrdclear();ribbonsclear();" /> Other.			</div>
			<div class="row" id="awrdOth">
					<div class="floatLeft">
					<input type="text" class="textboxOne" value="<%=awardOthersTxt%>" name="awrdOth" size="45" />
					</div>
			</div>

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
			startDat=dtTemp2[1]+"/"+dtTemp2[2]+"/"+dtTemp2[0];
		}
		
		System.out.print("startDat :"+startDat);
		
	}
	
%>

	<div class="rowHead">
		Starting Times:	</div>
			<div class="row">
				<span class="label">Date Available:</span>
				<span class="formX"><input type="text" value="<%=startDat%>" class="readOnly" name="dateAvailable" readonly="true" size="20" /> 
				<a href="javascript:cal4.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a> <span class="asterisk">*</span></span>			</div>
			
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
			
			<div class="colspan">
				Available from:			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=sec%> name="r7" value="The secretary" onclick=" awrdOthclear4();" /> The secretary.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=postCard%> name="r7" value="Postcards will be sent" onclick=" awrdOthclear4(); " /> Postcards will be sent.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=availableOthers%> name="r7" value="dateThree" /> Other.			</div>
			<div class="row" id="dateDivOth">
					<div class="floatLeft">
					<input type="text" value="<%=availableOthersTxt%>" class="textboxOne" name="dateDivOth" size="50" />
					</div>
			</div>

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
					
					String hr1="";
					String min1="";
					String zon1="";
					
					String hr4="";
					String min4="";
					String zon4="";
						
					unlimitedStab="checked";
					
					System.out.print("objEventDet.getStablingLimited() :"+objEventDet.getStablingLimited());
					System.out.print("objEventDet.getPerStallFromTime() :"+objEventDet.getPerStallFromTime());
					System.out.print("objEventDet.getPerStallPrice() :"+objEventDet.getPerStallPrice());
					System.out.print("objEventDet.getPerStallFromDate() :"+objEventDet.getPerStallFromDate());
					System.out.print("objEventDet.getPerStallToDate() :"+objEventDet.getPerStallToDate());
					
					if(objEventDet.getStallPernightPrice()!=null)
				    {
						if(!objEventDet.getStallPernightPrice().equalsIgnoreCase("0.0"))
						{
							crgPerStPerNight="checked";
							StallPernightPrice=objEventDet.getStallPernightPrice();
							System.out.print("StallPernightPrice :"+StallPernightPrice);
						}
					}
					
					if(objEventDet.getPerStallPrice()!=null)
					{
					if(!objEventDet.getPerStallPrice().equalsIgnoreCase("0.0"))
				    {
					if(!objEventDet.getPerStallPrice().equalsIgnoreCase("0"))
					{
						PerStallRadio="checked";
						PerStallPrice=objEventDet.getPerStallPrice();
						
						if(objEventDet.getPerStallFromTime()!=null)
						{
						String frTimTmp=objEventDet.getPerStallFromTime();
						String[] frTim1=frTimTmp.split(" ");
						String[] frTim2=frTim1[0].split(":");
						hr1=frTim2[0];
						min1=frTim2[1];
						zon1=frTim1[1];
						
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
						}
						
						if(objEventDet.getPerStallToTime()!=null)
						{
						String toTimTmp=objEventDet.getPerStallToTime();
						String[] toTim1=toTimTmp.split(" ");
						String[] toTim2=toTim1[0].split(":");
						//System.out.print("objEventDet.getPerStallToTime() :"+objEventDet.getPerStallToTime());
						
						hr4=toTim2[0];
						min4=toTim2[1];
						zon4=toTim1[1];
						
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
						}
						}
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
					
				%>

	<div class="rowHead">
		<strong>Stabling / Veterinarian:</strong>	</div>
			<div class="colspan">
				Stabling/Stall Info:			</div>

			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r8" value="stableOne" onClick="awrdOthclear2(); awrdOthclear1();"/> Limited stabling.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=unlimitedStab%> name="r8" value="stableTwo" onClick="awrdOthclear2(); awrdOthclear1();"/> Unlimited stabling.			</div>

					<div class="row" id="unlStbCom">

						<div >
						<input type="radio" size="10" <%=crgPerStPerNight%> name="r81" value="unlStbOne" onClick="awrdOthclear2(); awrdOthclear1();" /> Charges per stall per night.						</div>

								<div id="perStallOne">
								  <div > <strong>$</strong>
									<input type="text" class="textboxOne" value="<%=StallPernightPrice%>" name="perStallOne1" size="8" onClick="awrdOthclear2();"/>
								  </div>
								</div>

						<div >
						<input type="radio" size="10" name="r81" <%=PerStallRadio%> value="unlStbTwo" onClick="awrdOthclear2(); awrdOthclear1();" /> Per stall on a given time & date.						</div>

								<div id="perStalltwo">
									<div >
									<span > <strong>$</strong>
									<input type="text" class="textboxOne" value="<%=PerStallPrice%>" name="amount1" size="8" />
									</span>,&nbsp;

									<span >
									<select name="stablingtime1" id="select" class="selectboxOne">
									  								  
									  
									  <%
									  
									  int hflag3=0;
										
									  	for(int h=1;h<13;h++)
										{
										if(h==hr2)
										{
										%>
											 <option selected="selected" value="<%=h%>"><%=h%></option>
										<%}else if(hr2==0)
										{
										if(hflag3==0)
										{
										h=h-1;
										%>
											<option value="" selected="selected">Hours</option>
										<%} 
										else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}
										hflag3=1;
										}else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}}
									  								  
									  
									  %>
									</select>


									<select name="stablingminute1" id="select" class="selectboxOne">
									  <option value="" selected="selected">Mins</option>
									<%  
										int mflag3=0;
									
									  for(int m=1;m<61;m++)
										{
										if(m==min2)
										{
										%>
												  <option selected="selected" value="<%=m%>"><%=m%></option>
										<%}
										else if(min2==0)
										{
										if(mflag3==0)
										{
										m=m-1;
										%>
											<option value="" selected="selected">Mins</option>
										<%
										}
										else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}
										mflag3=1;
										
										}else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}}%>
									</select>



									<select name="stablingformat1" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									
									<%
									 if(zon2!=0)
									 {
									if(zon2==1)
									{%>
										<option selected="selected" value="01">a.m</option>
										<option value="02">p.m</option>										
									<%}
									else
									{%>
										<option value="01">a.m</option>
										<option selected="selected" value="02">p.m</option>
									<%}
									}else
									{
									%>									
										<option value="01">a.m</option>
										<option value="02">p.m</option>
									<%}%>
						</select>
						</span>
									<span ><input type="text" class="readOnly" value="<%=perStalFromDat%>" name="date1" readonly="true" size="8" /> 
									<a href="javascript:cal5.popup();">
				 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:left;" border="0"></a><strong> FromDate</strong></span>

									<span >
									<select name="stablingtime2" id="select" class="selectboxOne">
									 									 
									  <%
									  
									  int hflag4=0;
										
									  	for(int h=1;h<13;h++)
										{
										if(h==hr3)
										{
										%>
											 <option selected="selected" value="<%=h%>"><%=h%></option>
										<%}else if(hr3==0)
										{
										if(hflag4==0)
										{
										h=h-1;
										%>
											<option value="" selected="selected">Hours</option>
										<%} 
										else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}
										hflag4=1;
										}else
										{%>
											<option value="<%=h%>"><%=h%></option>
										<%}}							  
									  
									  	
										%>
									</select>

									<select name="stablingminute2" id="select" class="selectboxOne">
									  								  
										<%
										
										int mflag4=0;
									
									  for(int m=1;m<61;m++)
										{
										if(m==min3)
										{
										%>
												  <option selected="selected" value="<%=m%>"><%=m%></option>
										<%}
										else if(min3==0)
										{
										if(mflag4==0)
										{
										m=m-1;
										%>
											<option value="" selected="selected">Mins</option>
										<%
										}
										else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}
										mflag4=1;
										
										}else
										{%>
											<option value="<%=m%>"><%=m%></option>
										<%}}%>										
									</select>



									<select name="stablingformat2" id="select" class="selectboxOne">
									<option value="" selected="selected">Mdrn</option>
									
									<%
									
									 if(zon3!=0)
									 {
									if(zon3==1)
									{%>
										<option selected="selected" value="01">a.m</option>
										<option value="02">p.m</option>										
									<%}
									else
									{%>
										<option value="01">a.m</option>
										<option selected="selected" value="02">p.m</option>
									<%}
									}else
									{
									%>									
										<option value="01">a.m</option>
										<option value="02">p.m</option>
									<%}
									
									%>
						</select>
						</span>
									<span ><input type="text" value="<%=perStalToDat%>" class="readOnly" name="todate" readonly="true" size="8" />
									 <a href="javascript:cal6.popup();">
									 <img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:left;" border="0"></a><strong> toDate</strong></span>								  </div>
								</div>
					</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" name="r8" <%=noStab%> value="stableThree" onclick="awrdOthclear2(); awrdOthclear1();"/> No stabling available.			</div>
</div>

<!-- **************************************** Part D of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partd');"><strong>Event Registration Form: Part D</strong> </div>
<div id="partd" class="formPart">

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


			<div class="colspan">
				Type of stabling:			</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" <%=noOfStalls%> name="r9" value="typStableOne" onClick="clearone();"/> Permanent stalls on ground.				</div>
								<div class="rowNew" id="qtyOne">
									<div class="floatLeft">
									<input type="text" value="<%=noOfStallsTxt%>" class="textboxOne" name="qtyOne" size="8" /> <strong>(Qty)</strong>									</div>
								</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" <%=noOfTmpStalls%> value="typStableTwo" onClick="cleartwo();"/> Temporary stalls on ground.				</div>

								<div class="rowNew" id="qtyTwo">
									<div class="floatLeft">
										<span class="floatLeft"><input type="text" value="<%=noOfTmpStallsTxt%>" class="textboxOne" name="qtyTwo" size="8" /> <strong>(Qty)</strong></span>,&nbsp;									</div>
								</div>

				<div class="floatLeftTwo">
				<input type="radio" size="10" name="r9" <%=noOfTmpPermStalls%> value="typStableThree" onClick="clearthree();"/> Permanent/temporary stalls with approximate distance from event.				</div>
								<div class="rowNew" id="qtyThree">
									<div class="floatLeft">
										<span class="floatLeftTwo"><input type="text" value="<%=noOfTmpPermStallsTxt%>" class="textboxOne" name="amountnew" size="8" /> <strong>(Qty)</strong></span>,&nbsp;
										<span class="floatLeftTwo"><input type="text" value="<%=mileFrmEventTxt%>" class="textboxOne" name="timenew" size="8" /> <strong>Miles from event</strong></span>&nbsp;									</div>
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
			<div class="colspan">
				<strong>Veterinarian Info:	</strong>		</div>
					<div class="row">
						<span class="label">Name:</span>
						<span class="formX"><input type="text" value="<%=vetName%>" class="textboxOne" name="vetName"size="25" /></span>					</div>
					<div class="row">
						<span class="label">Veterinarian phone no. at event:</span>
						<span class="formX"><input type="text" value="<%=vetPh%>" class="textboxOne" name="phNum"size="25" /></span>					</div>
					<div class="row">
						<span class="label">Where Vet. no. will be posted at event:</span>
						<span class="formX"><input type="text" value="<%=vetPostAt%>" class="textboxOne" size="25" name="vetNo"/></span>					</div>

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
	
	String dir="";
	System.out.print("objEventDet.getDirections() :"+objEventDet.getDirections());
	
	if(objEventDet.getDirections()!=null)
	{
		dir=objEventDet.getDirections();
	}
	
%>

	<div class="rowHead">
		<strong>Accomodations:</strong>	</div>

			<div class="rowTwo">
				<span class="labelTwo">Hotel</span>
				<span class="labelTwo">Phone No.</span>
				<span class="labelTwo">Miles From Event</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=acc1[2]%>" class="textboxOne" size="20" name="hotel1"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc1[3]%>" class="textboxOne" size="10" name="phone1"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc1[4]%>" class="textboxOne" size="10" name="mile1"/> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=acc2[2]%>" class="textboxOne" size="20" name="hotel2"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc2[3]%>" class="textboxOne" size="10" name="phone2"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc2[4]%>" class="textboxOne" size="10" name="mile2"/> </span>			</div>
			<div class="row">

				<span class="labelTwo"><input type="text" value="<%=acc3[2]%>" class="textboxOne" size="20" name="hotel3"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc3[3]%>" class="textboxOne" size="10" name="phone3"/> </span>
				<span class="labelTwo"><input type="text" value="<%=acc3[4]%>" class="textboxOne" size="10" name="mile3"/> </span>			</div>


	<div class="rowHead">

		Directions:	</div>
			<div class="rowTxtArea"><span class="label">
			  <textarea name="textarea" rows="5" cols="25" id="directions"><%=dir%></textarea>
			</span></div>
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

<div class="rowExpand" onclick="expandColl('parte');"><strong>Event Registration Form: Part E</strong> </div>
<div id="parte" class="formPart">

	<div class="rowHead">
		Dressage test for horse trials, two-day events & Combined tests:	</div>

		<div class="rowTwo">
			<span class="labelTwo">Advanced Level</span>
			<span class="labelThree">Arena Size</span>		</div>
		<div>
    	
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
                                   
				<div class="row">
					<span class="styleBoldOne">&nbsp;&nbsp;<%=x%></span>				</div>
                                <%}%>
								 <div class="row">
									<span class="label">
									<input type="checkbox" <%=dressSel[arenaCt]%> value="<%=levelId%>" size="10" name="<%=cbxlevelname%>" /><%=level%>									</span>					
									<span class="labelFour">
											<select name="<%=optarenaname%>" id="selActivityId" class="selectboxOne" >
												<%
												
												ArrayList arenaSizeVect = (ArrayList)request.getAttribute("arenaSizeVect");
												if(arenaSizeVect!=null && arenaSizeVect.size()!=0){
												Iterator it = arenaSizeVect.iterator();
												
												while(it.hasNext())
												{
												
												String[] arena=(String[])it.next();
												
												if(arenaSel[arenaCt].equalsIgnoreCase(arena[1]))
												{
												%>														
													<option selected="selected" value="<%=arena[0]%>"><%=arena[1]%></option>
												<%
												}else
												{%>
													<option value="<%=arena[0]%>"><%=arena[1]%></option>
												<%}
												}
												}											
											  %>
										</select>
									</span>								</div>                        
				
                                
								 <% chkno++;arenaCt++; } 
							 %>
								<input type="hidden" name="dtct" value="<%=dressageHorseTrialsVect.size()%>" />
	  			</div>
			 
<div class="spacer">&nbsp;</div>
	 <%
	 	String footing="";
		
	 	if(objEventDet.getFootingDesc()!=null)
		{
			footing=objEventDet.getFootingDesc();
			System.out.print("objEventDet.getFootingDesc() :"+objEventDet.getFootingDesc());
		}
	 
	 %>
			<div class="row">
				<span class="label">Briefly describe footing:</span>
				<span class="formX"><input type="text" value="<%=footing%>" class="textboxOne" name="footing" size="45" /></span>			</div>

<%
	String[] cctry1=new String[7];
	String[] cctry2=new String[7];
	String[] cctry3=new String[7];	
	String courseInfo="";
	String addInfo="";
		 	
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

	<div class="rowHead">
		Cross-Country:	</div>

			<div class="rowTwo">
				<span class="labelTwo">Division</span>
				<span class="labelTwo">Length</span>
				<span class="labelTwo">Speed</span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=cctry1[2]%>" class="textboxOne" name="division1" size="20" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry1[3]%>" class="textboxOne" name="length1" size="10" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry1[4]%>" class="textboxOne" name="speed1" size="10" /> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=cctry2[2]%>" class="textboxOne" name="division2" size="20" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry2[3]%>" class="textboxOne" name="length2" size="10" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry2[4]%>" class="textboxOne" name="speed2" size="10" /> </span>			</div>
			<div class="row">
				<span class="labelTwo"><input type="text" value="<%=cctry3[2]%>" class="textboxOne" name="division3" size="20" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry3[3]%>" class="textboxOne" name="length3" size="10" /> </span>
				<span class="labelTwo"><input type="text" value="<%=cctry3[4]%>" class="textboxOne" name="speed3" size="10" /> </span>			</div>


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

			<div class="colspan">
				Describe your course(s). Choose from the list below or use your own description.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=optOne%> name="r10" value="Easy, good for first time at this level." /> Easy, good for first time at this level.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=optTwo%> name="r10" value="Average, for horses with some experience at this level." /> Average, for horses with some experience at this level.			</div>
			<div class="floatLeftTwo">
			<input type="radio" size="10" <%=optThree%> name="r10" value="Difficult, championship caliber course." /> Difficult, championship caliber course.			</div>

			<div class="colspan">
				Additional information.			</div>
			<div class="rowTxtArea">
				<span class="label">
				<textarea id="additionalInfo" name="AdditionalInfo" rows="5" cols="25"><%=addInfo%></textarea>
				</span>			</div>
			<%
				java.sql.Date calDat=null;
				String courseClDat="";
				String EntryLimit="";
				String riderHorseLevelLimit="";
				String ridHorseLevelEntryLimit="";
				String divEntBirthDat="";
				java.util.Date divEntBDate=null;
								
				if(othersDet.getCourseCloseDate()!=null)
				{
					calDat=(java.sql.Date)othersDet.getCourseCloseDate();
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
				
				/*	if(objEventDet.getDateAvailable()!=null)
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
								startDat=dtTemp2[1]+"/"+dtTemp2[2]+"/"+dtTemp2[0];
							}
							
							System.out.print("startDat :"+startDat);
							
						}*/
					
				if(othersDet.getDivisionEntryBirthDate()!=null)
				{
				
							divEntBDate=othersDet.getDivisionEntryBirthDate();
							String divDat=divEntBDate.toString();
							
							System.out.print("othersDet.getDivisionEntryBirthDate() :"+othersDet.getDivisionEntryBirthDate());
					
							String valBDat="";
							valBDat=divDat.substring(2,3);
							System.out.print("valBDat :"+valBDat);
							
							if(valBDat.equalsIgnoreCase("/"))
							{
								divEntBirthDat=divDat;
							}
							else
							{
							
								
								String divDay[]=divDat.split("-");
								divEntBirthDat=divDay[1]+"/"+divDay[2]+"/"+divDay[0];
								
							}
							
							System.out.print("divEntBirthDat :"+divEntBirthDat);
				}		
						
				boolean dogLease= othersDet.isLeaseDogs();		
				System.out.print("othersDet.isLeaseDogs() :"+othersDet.isLeaseDogs());		
				
				String dogLeaseYes="";
				String dogLeaseNo="";
				
				if(othersDet.isLeaseDogs()==true)
				{
					dogLeaseYes="checked";
				}
				else
				{
					dogLeaseNo="checked";
				}
									
			%>
	<div class="rowHead">
		Other Information: <span class="labelTwo">( The course-closed date must be stated)</span>	</div>
			<div class="row">
			 <div class="floatLeft">	 Cross-country course officially closed on..</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" value="<%=courseClDat%>" class="readOnly" name="CrossCountryDate" readonly="true" size="15" />
							<a href="javascript:cal7.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="row"></span> </span>						</div>
			<div class="row">
				<div class="floatLeft"> Entry limit</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" value="<%=EntryLimit%>" class="textboxOne" name="EntryLimit" size="15" /> </span>						</div>
			<div class="row">
			  <div class="floatLeft">Riders limited to horse/level <span class="asterisk">*</span> <strong>(or)</strong> horse/entire event.<span class="asterisk">**</span></div>
			</div>
						<div class="rowTxtArea">
							<span id="ccCourse"><input type="text" value="<%=riderHorseLevelLimit%>" class="textboxOne" name=RiderLimit1 size="15" /> <span class="asterisk">*</span></span>
							<span id="ccCourse"><input type="text" value="<%=ridHorseLevelEntryLimit%>" class="textboxOne" name=RiderLimit2 size="15" /> <span class="asterisk">**</span></span>						</div>
	  <div class="row">
				<div class="floatLeft"> Divisions further divided if entries warrant; state birth date on entry.</div>
				        <input type="text" class="readOnly" value="<%=divEntBirthDat%>" name="BirthDate" readonly="true" size="10">
				<a href="javascript:cal8.popup();">
				<img src="images/calendar.jpg"  alt="Click To View Calendar" width="20" height="20" style="vertical-align:bottom;" border="0"></a><span class="floatLeft"></span>			</div>
			<div class="row">
				<div class="floatLeft">Dogs must be leashed (and/or)</div>
				<div class="floatLeftTwo">
							<input type="radio" <%=dogLeaseYes%> size="10" name="r11" value="true" /> Yes.
				    		<input type="radio" <%=dogLeaseNo%> size="10" name="r11" value="false" /> No.			    </div>
			</div>
			
			<%
				String perTimePrice="";
				String teamTotal="";
				String partyName="";
				String finalAddInfo="";
				
				if(!othersDet.getPerTimePrice().equalsIgnoreCase("0") && !othersDet.getPerTimePrice().equalsIgnoreCase("0.0"))
				{
					perTimePrice=othersDet.getPerTimePrice();
				}
			
				if(!othersDet.getTeamCompetition().equalsIgnoreCase("0") && !othersDet.getTeamCompetition().equalsIgnoreCase("0.0"))
				{
					teamTotal=othersDet.getTeamCompetition();
				}
			
				if(othersDet.getPartyName() != null)
				{
					partyName=othersDet.getPartyName();
				}
				
				if(othersDet.getAddInfo()!=null)
				{
					finalAddInfo=othersDet.getAddInfo();
				}
				
				System.out.print("othersDet.getPerTimePrice() :"+othersDet.getPerTimePrice());
				System.out.print("othersDet.getTeamCompetition() :"+othersDet.getTeamCompetition());				
			    System.out.print("othersDet.getPartyName() :"+othersDet.getPartyName());
				System.out.print("othersDet.getAddInfo() :"+othersDet.getAddInfo());
				
			%>
			
			<div class="row">
				<div class="floatLeft">Team of three of four, best three scores to count, all team members at same level. </div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" value="<%=perTimePrice%>" class="textboxOne" name="PerHead" size="15" /> <strong>$</strong> per team member. <strong>(or)</strong> </span>						</div>
						<div class="row">
							<span id="ccCourse"><input type="text" value="<%=teamTotal%>" class="textboxOne" name="TeamTotal" size="50" /> </span>						</div>
			<div class="row">
				<div class="floatLeft"> Competitors/Volunteers/Officials Party</div>
			</div>
						<div class="row">
							<span id="ccCourse"><input type="text" value="<%=partyName%>" class="textboxOne" name="Party" size="35" /> </span>						</div>
			<div class="colspan">
				Additional information.			</div>
			<div class="rowTxtArea">
				<span class="label">
				<textarea id="additionalInfo" name="AdditionalInfo2" rows="5" cols="25"><%=finalAddInfo%></textarea>
				</span>			</div>

<%
	}
		catch(Exception e)
		{
			System.out.print("Error in jsp : ");
			e.printStackTrace();		
		}
%>


	<div class="row" align="center">
		<span class="label">&nbsp;</span>
		<span class="formX"><input type="submit" value="Update Now" class="btn text_3 color_3" /></span>	</div>
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

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
<script language="javascript" />

function validate()
{

	if(document.myform.statusId.value == "")
	{
		alert("Please select a Status");
		document.myform.statusId.focus();
		return false;
	}

	/*if(document.myform.comments.value == "" && document.myform.comments.value.indexOf(" ") ==0)
	{
		alert("Enter your comments");
		document.myform.comments.focus();
		return false;
	}*/
	
}

</script>

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
				<strong>HLC Organizer: <span class="styleBoldTwo">HLC Event Registration Form</span></strong>			</div>
			<div id="commonBG" class="textCommon">
				Organizers, use this HLC Event Registration form to register an event under HLC. This form has been
				divided into five parts for it's easy handling. <strong>Click on the tabs seen below to Expand / Contract it</strong>
				and hence reveal the hidden parts of the form.			</div>
<form name="myform" id="myform" class="formcss" method="post" action="./EventOrgRenewal.html" onsubmit="return validate();"  >
			
			<%
			
			try
			{
			
			System.out.print("::::::::::: Inside HLCEventDetails jsp ::::::::::");
						
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
<input name="eventProcess" type="hidden" value="statusChange" />
<input name="eventId" type="hidden" value="<%=objEventDet.getEventId()%>" />

<div class="rowExpand" onclick="expandColl('parta');"> 
 <strong> HLC Event Registration Form: Part A</strong> <!--span class="textOne">(click to expand/contract)</span -->
</div>
<div id="parta" class="formPart">
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
					
			<div class="row">
				<span class="label">Event Title: </span>
				<span class="formX">
	            <%=objEventDet.getEventTitle()%></span>	  </div>
			<div class="row">
               
				<span class="label">Event Secretary ID:</span>
				<span class="formX"><%=eventSecId%></span>			</div>
			
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
			String[] divLevel=new String[divisionLevels.size()];
			
			while(itrators.hasMoreElements()){
				String[] s = (String[]) itrators.nextElement();                                    
				String code=s[4];
				String mid=s[0];
					
				if(divisionLevels != null) 
				{
					if(divSelCt<divisionLevels.size())
					{
					
							System.out.print("divisionLevels.size() :"+divisionLevels.size());
							divLevel=(String[])divisionLevels.get(divSelCt);
							int j=0;	
							
						for(j=0;j<allTypesVect.size();j++)
						{
							String[] comp = (String[]) allTypesVect.get(j);                                    
							String code2=comp[4];
													
							if(code2.equalsIgnoreCase(divLevel[2]))
							{							
								divSel[j]="checked";
								%>
								<div class="colspan"><%=divLevel[1]%></div>
				
								<div class="row">
									<span>
									<%=divLevel[2]%>									</span>								</div>   
					</div>
							<%	
								System.out.print("divLevel[1] :"+divLevel[1]);					
								System.out.print("divLevel[2] :"+divLevel[2]);
								System.out.print("divLevel[3] :"+divLevel[3]);
								
							}
							else
							{
								divSel[j]="";
							}
						}
					
			if(divSel[divSelCt].equalsIgnoreCase("checked"))
			{
			%>   
			   
			<%--<div class="colspan"><%=divLevel[1]%></div>
				
			<div class="row">
				<span>
				<%=//divLevel[2]%>
				</span>    
			</div>   
		
			</div>--%>
			
			<%}%>
			
		<%divSelCt++;}
			}
		}    
		%>
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
			
							
							if(judSel[judSelCt].equalsIgnoreCase("checked"))
							{			
							%>
							
							<div class="colspan">
								<span class="labelTwo"><%=judList[1]%></span>							</div>
							<div class="row">
								<span class="label">Name:</span>
										<span class="formX"><%=judTxtVal[judSelCt]%></span>							</div>
                                                    <%  }chkoffct++;judSelCt++;
													 }}
	
                        %>
	</div>
<!-- **************************************** Part B of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partb');"> <strong>HLC Event Registration Form: Part B</strong> </div>
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
				<span class="formX"><strong>$</strong> <%=entFee%> (Per division)</span>			</div>
			
			<%
			if(!otherFee.equalsIgnoreCase(""))
			{%>
			
			<div class="row">
				<span class="label">Others:</span>
				<span class="formX"><%=otherFee%></span>			</div>
			
			<%}%>
			
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
			
			<%
			if(membAppStat1.equalsIgnoreCase("checked"))
			{%>
			
			<div class="row">
				<div class="floatLeft">HLC membership required at all levels including BN</div>
			</div>
			<%}
			
			if(membAppStat2.equalsIgnoreCase("checked"))
			{
			%>			
			<div class="row">
				<div class="floatLeft"> BNH/BNR competitors who are not HLC members must pay an additional $25 fee with entry.				</div>
			</div>
			
			<%}%>
			
			<div class="row">
				<div style="text-align:left;" class="textBold">Double Entries Accepted:				</div>
			</div>
			
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
			
			<div class="row">
				<div class="floatLeft">
				<%=dblYes%>				</div>
			</div>
			
			<%
			if(!dblYesTxt.equalsIgnoreCase(""))
			{%>
			
			<div class="row" id="dblEntry1">
				<div class="floatLeft">
				<strong>$</strong> <%=dblYesTxt%> (Office Fees)				</div>
			</div>
			<%}%>
			
			<div class="colspan">
				<strong>Payment Check Details:	</strong>		</div>
			<div class="row">
				<span class="label">Draw checks to the order of:</span>
				<span class="formX"><%=chkPayable%></span>			</div>
			
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
				<%
					if(one.equalsIgnoreCase("checked"))
					{%>
						charge for lost pinny <span>*</span>
						<div>
						<div class="row" id="lpOne1">
				<div class="floatLeft">
				<strong>$</strong> <%=pennyChgOne%> (* No deposit required)				</div>
				</div>
									
					<%}
					
				%>
				
				
				<%
					if(two.equalsIgnoreCase("checked"))
					{%>
						charge for lost pinny <span>**</span>
						<div>
						<div class="row" id="lpTwo1">
				<div class="floatLeft">
				<strong>$</strong>  &nbsp;<%=pennyChgTwo%>  &nbsp; &nbsp;(** Send deposit with entry)				</div>
					</div>				
					<%}
					
				%>

				
				<%
					if(three.equalsIgnoreCase("checked"))
					{%>
						 Other
					<div>	
						<div class="row" id="lpOther1">
				<div class="floatLeft">
				<strong>$</strong>  &nbsp;<%=pennyChgThree%>				</div>
				</div>			
					<%}
					
				%>
			
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
                                   
				 <div class="colspan"><%=selRefLevel[2]%></div>
                                
								 <div class="row">
									<span >
										<%=selRefLevel[3]%>
										
										<%if(!txt_status.equals("0"))
										{%>										
											<%=ruleSelTxt[refSelCt]%>
										<%}%>	
									</span>              					</div>   
				
                                
					   <%}
					   else if(refSelCt==0)
				{%>
				<div class="row">
					<span >
						N/A					</span>				</div>
				<%}   		
					   
					    chkrefct++;refSelCt++; } 
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
				<%
				if(cogAll.equalsIgnoreCase("checked"))
				{
				%>
				<div class="floatLeftTwo">
				 Required for all horses :				</div>
					<div class="row" id="nctReq1">
						<div class="floatLeft">
						within <%=cogAllMnth%> months.						</div>
					</div>
					
				<%}%>
				
				<%
				if(reqWith.equalsIgnoreCase("checked"))
				{
				%>
					
				<div class="floatLeftTwo">
				Required within :				</div>
					<div class="row" id="nctState1">
						<div class="floatLeft">
						<%=reqWithIn%> months for in-state and <%=reqWithOut%> months for out-of state.						</div>
					</div>
					
					<%}%>
				
				<%
				if(cogNreq.equalsIgnoreCase("checked"))
				{
				%>
					
				<div class="floatLeftTwo">
				 Not Required.				</div>
				
				<%}%>
				
				<%
				if(cogOther.equalsIgnoreCase("checked"))
				{
				%>
				
				<div class="floatLeftTwo">
				 Others.				</div>
				
				<%}%>
</div>


<!-- **************************************** Part C of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partc');"><strong> HLC Event Registration Form: Part C</strong> </div>
<div id="partc" class="formPart">

	<div class="rowHead">
		T	</div>

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
			
			<div class="row">
				<span class="labelTwo"><%=finalDay[0]%>				</span>
				<span class="labelTwo"><%=phase[0]%></span>
				<span class="lableTwo"><%=hr[0]+":"+min[0]+" "+zonView1%>			  </span>			</div>
			<div class="row">
				<span class="labelTwo"><%=finalDay[1]%>				</span>
				<span class="labelTwo"><%=phase[1]%></span>
				<span class="labelTwo"><%=Tim2%></span>			</div>
			<div class="row">
				<span class="labelTwo"><%=finalDay[2]%>				</span>
				<span class="labelTwo"><%=phase[2]%></span>
				<span class="labelTwo"><%=Tim3%></span>			</div>


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

	<div class="rowHead">
		Awards:	</div>
			<div class="floatLeftTwo">
			 
			 <%if(awardTropy.equalsIgnoreCase("checked"))
			 {%>
			 Trophy & Ribbons			</div>
				<div class="row" id="ribbons1">
					<div class="floatLeft">
					 <%=awardTropyTxt%> &nbsp; No. of ribbons per division.				 </div>
			</div>
			<%}%>
			
			<%if(awardPrize.equalsIgnoreCase("checked"))
			{%>
			<div class="rowHeightOne">
			 Prize money will be paid by check and available at the secretary?s office immediately			
						after the awards ceremony.</span>			</div>
			<%}%>
			
			
			<%if(awardOthers.equalsIgnoreCase("checked"))
			{%>
			<div class="floatLeftTwo">
			 Other.			</div>
						
			<div class="row" id="awrdOth1">
					<div class="floatLeft">
					<%=awardOthersTxt%>					</div>
			</div>

			<%}%>
			
<%
	String startDat="NA";
	
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

	<div class="rowHead">
		Starting Times:	</div>
			<div class="row">
				<span class="label">Date Available:</span>
				<span class="label"><%=startDat%></span>			<span class="rowHead">entative Time Schedule:</span></div>
			
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
			<%
			if(sec.equalsIgnoreCase("checked"))	
			{%>
			
			<div class="floatLeftTwo">
			 The secretary.			</div>
			<%}%>
			
			<%
			if(postCard.equalsIgnoreCase("checked"))	
			{%>
			<div class="floatLeftTwo">
			 Postcards will be sent.			</div>
			<%}%>
			
			<%
			if(availableOthers.equalsIgnoreCase("checked"))	
			{%>
			<div class="floatLeftTwo">
			 Other.			</div>
			<div class="row" id="dateDivOth1">
					<div class="floatLeft">
					<%=availableOthersTxt%>					</div>
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

	<div class="rowHead">
		<strong>Stabling / Veterinarian:	</strong></div>
			<div class="colspan">
				Stabling/Stall Info:			</div>
			
			<%
			String limit="";
			if(!limit.equalsIgnoreCase(""))
			{%>
			<div class="floatLeftTwo">
			 Limited stabling.			</div>
			<%}%>
			
			<%
			if(unlimitedStab.equalsIgnoreCase("checked"))
			{%>
			
			<div class="floatLeftTwo">
			 Unlimited stabling.			</div>
			<%}%>
			
			<%
					
			if(crgPerStPerNight.equalsIgnoreCase("checked"))
			{%>
				<div class="row" id="unlStbCom">
						<div >
						 Charges per stall per night.						</div>

								<div id="perStallOne1">
								  <div > <strong>$</strong>
									<%=StallPernightPrice%>"									</div>
								</div>
			<%}%>
								
						<%
						if(PerStallRadio.equalsIgnoreCase("checked"))
						{%>
						<div >
						 Per stall on a given time & date.						</div>
						
								<div id="perStalltwo1">
									<div >
									<span > <strong>$</strong>
									<%=PerStallPrice%>									</span>,&nbsp;
									<span >From </span>
									<span ><%=TimSt2%></span>
									<span ><%=perStalFromDat%></span>&nbsp;
									
									<span >To </span>
									<span ><%=TimSt3%></span>
									<span ><%=perStalToDat%></span>								  </div>
								</div>
								<%}%>
					</div>
			
			
			<%
			if(noStab.equalsIgnoreCase("checked"))
			{%>		
			<div class="floatLeftTwo1">
			 No stabling available.			</div>
			<%}%>
</div>

<!-- **************************************** Part D of the form starts here *********************************************** -->

<div class="rowExpand" onclick="expandColl('partd');"><strong> HLC Event Registration Form: Part D </strong></div>
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

				<%
				if(noOfStalls.equalsIgnoreCase("checked"))
				{
				%>
				<div class="floatLeftTwo">
				 Permanent stalls on ground.				</div>
								<div class="rowNew" id="qtyOne">
									<div class="floatLeft">
									<%=noOfStallsTxt%> <strong>(Qty)</strong>									</div>
								</div>

				<%}%>

				<%
				if(noOfTmpStalls.equalsIgnoreCase("checked"))
				{
				%>
				
				<div class="floatLeftTwo">
				 Temporary stalls on ground.				</div>
								<div class="rowNew" id="qtyTwo">
									<div class="floatLeft">
										<span class="floatLeft"><%=noOfTmpStallsTxt%> <strong>(Qty)</strong></span>&nbsp;									</div>
								</div>
				<%}%>
				
				<%
				if(noOfTmpPermStalls.equalsIgnoreCase("checked"))
				{
				%>
				<div class="floatLeftTwo">
				 Permanent/temporary stalls with approximate distance from event.				</div>
								<div class="rowNew" id="qtyThree">
									<div class="floatLeft">
										<span class="floatLeftTwo"><%=noOfTmpPermStallsTxt%> <strong>(Qty)</strong></span>,&nbsp;
										<span class="floatLeftTwo"><%=mileFrmEventTxt%> <strong>Miles from event</strong></span>&nbsp;									</div>
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
			<div class="colspan">
				<strong>Veterinarian Info:	</strong>		</div>
					<div class="row">
						<span class="label">Name:</span>
						<span class="formX"><%=vetName%></span>					</div>
					<div class="row">
						<span class="label">Veterinarian phone no. at event:</span>
						<span class="formX"><%=vetPh%></span>					</div>
					<div class="row">
						<span class="label">Where Vet. no. will be posted at event:</span>
						<span class="formX"><%=vetPostAt%></span>					</div>

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

	<div class="rowHead">
		Accomodations:	</div>

			<div class="rowTwo">
				<span class="labelTwo">Hotel</span>
				<span class="labelTwo">Phone No.</span>
				<span class="labelTwo">Miles From Event</span>			</div>
			<div class="row">
				<span class="labelTwo"><%=acc1[2]%></span>
				<span class="labelTwo"><%=acc1[3]%></span>
				<span class="labelTwo"><%=acc1[4]%></span>			</div>
			
			<%
			if(!acc2[2].equalsIgnoreCase(""))
			{
			%>
			<div class="row">
				<span class="labelTwo"><%=acc2[2]%> </span>
				<span class="labelTwo"><%=acc2[3]%> </span>
				<span class="labelTwo"><%=acc2[4]%> </span>			</div>
			
			<%}%>
			
			<%
			if(!acc3[2].equalsIgnoreCase(""))
			{
			%>
			<div class="row">

				<span class="labelTwo"><%=acc3[2]%> </span>
				<span class="labelTwo"><%=acc3[3]%> </span>
				<span class="labelTwo"><%=acc3[4]%> </span>			</div>

			<%}%>

	<div class="rowHead">

		Directions:	</div>
	
			<div class="row">
				<span class="label"><%=dir%></span>			</div>
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


<div class="rowExpand" onclick="expandColl('parte');"><strong> HLC Event Registration Form: Part E</strong> </div>
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
									
									<%
									if(dressSel[arenaCt].equalsIgnoreCase("checked"))
									{%>
									
									<span class="label">
									 <%=level%>									</span>					
									
									<span class="labelFour"><%=arenaSel[arenaCt]%>									</span>								</div>                        
								<%}%>
                                
								 <% chkno++;arenaCt++; } 
							 %>
	  			</div>
			 
<div class="spacer">&nbsp;</div>
	 <%
	 	String footing="NA";
		
	 	if(objEventDet.getFootingDesc()!=null)
		{
			footing=objEventDet.getFootingDesc();
			System.out.print("objEventDet.getFootingDesc() :"+objEventDet.getFootingDesc());
		}
	 
	 %>
			<div class="row">
				<span class="label">Briefly describe footing:</span>
				<span class="formX"><%=footing%></span>			</div>

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

	<div class="rowHead">
		Cross-Country:	</div>

			<div class="rowTwo">
				<span class="labelTwo">Division</span>
				<span class="labelTwo">Length</span>
				<span class="labelTwo">Speed</span>			</div>
			<div class="row">
				<span class="labelTwo"><%=cctry1[2]%> </span>
				<span class="labelTwo"><%=cctry1[3]%> </span>
				<span class="labelTwo"><%=cctry1[4]%> </span>			</div>
			
			<%
			if(!cctry2[2].equalsIgnoreCase(""))
			{%>
			<div class="row">
				<span class="labelTwo"><%=cctry2[2]%> </span>
				<span class="labelTwo"><%=cctry2[3]%> </span>
				<span class="labelTwo"><%=cctry2[4]%> </span>			</div>
			<%}%>
			
			<%
			if(!cctry3[2].equalsIgnoreCase(""))
			{%>
			<div class="row">
				<span class="labelTwo"><%=cctry3[2]%> </span>
				<span class="labelTwo"><%=cctry3[3]%> </span>
				<span class="labelTwo"><%=cctry3[4]%> </span>			</div>
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

			<div class="colspan">
				Describe your course(s). Choose from the list below or use your own description.			</div>
			
			<%
			if(optOne.equalsIgnoreCase("checked"))
			{
			%>
			<div class="floatLeftTwo">
			 Easy, good for first time at this level.			</div>
			<%}%>
			
			<%
			if(optTwo.equalsIgnoreCase("checked"))
			{
			%>
			<div class="floatLeftTwo">
			 Average, for horses with some experience at this level.			</div>
			<%}%>
			
			<%
			if(optThree.equalsIgnoreCase("checked"))
			{
			%>
			<div class="floatLeftTwo">
			 Difficult, championship caliber course.			</div>
			<%}%>
			
			<div class="colspan">
				Additional information.			</div>
			<div class="row">
				<span class="label">
				<%=addInfo%>				</span>			</div>
			
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
	<div class="rowHead">
		Other Information: <span class="labelTwo">( The course-closed date must be stated)</span>	</div>
			<div class="row">
			 <div class="floatLeft">	 Cross-country course officially closed on..</div>
			</div>
						<div class="row">
							<span id="ccCourse"><%=courseClDat%>			    			 </span>			</div>
			<div class="row">
				<div class="floatLeft"> Entry limit</div>
			</div>
						<div class="row">
							<span id="ccCourse"><%=EntryLimit%> </span>						</div>
			<div class="row">
			  <div class="floatLeft">Riders limited to horse/level <span class="asterisk">*</span> <strong>(or)</strong> horse/entire event.<span class="asterisk">**</span></div>
			</div>
						<div class="rowTxtArea">
							<span id="ccCourse"><%=riderHorseLevelLimit%></span>
							<span id="ccCourse"><%=ridHorseLevelEntryLimit%></span>						</div>
	  <div class="row">
				<div class="floatLeft"> Divisions further divided if entries warrant; state birth date on entry :</div>
				        <%=divEntBirthDat%>			</div>
			<div class="row">
				<div class="floatLeft">Dogs must be leashed (and/or)</div>
				<div class="floatLeftTwo">
							 <%=dogLeaseYes%>			    </div>
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
			
			<div class="row">
				<div class="floatLeft">Team of three of four, best three scores to count, all team members at same level. </div>
			</div>
						<div class="row">
							<%=perTimePrice%> <strong>$</strong> per team member. <strong>(or)</strong> </span>						</div>
						<div class="row">
							<span id="ccCourse"><%=teamTotal%> </span>						</div>
			<div class="row">
				<div class="floatLeft"> Competitors/Volunteers/Officials Party</div>
			</div>
						<div class="row">
							<span id="ccCourse"><%=partyName%> </span>						</div>
			<div class="colspan">
				Additional information.			</div>
			<div class="row">
				<span class="label">
				<%=finalAddInfo%>				</span>			</div>

	<%
		}
		catch(Exception e)
		{
			System.out.print("Error in jsp : ");
			e.printStackTrace();		
		}
	%>

			<div class="colspan">
				Change Status.			</div>

			<div class="row">
					  <span class="label">	Status &nbsp; </span>	
					  <span class="label">		  
					  <select name="statusId" class="selectboxOne" >
                        <option selected="selected" value="">Select One</option>
												
						<option value="Pending" >Pending</option>
						<option value="Approved" >Approved</option>
						<option value="Rejected" >Rejected</option>
					  </select>
					  </span>				</div>
				  
				<div class="rowTxtArea">
				<span class="label">Comments &nbsp; </span>
				<textarea id="comments" name="comments" rows="5" ></textarea>
			</div>  
				  
	<div class="row">
		<span class="label">&nbsp;</span><span class="formX">
		<center><input type="submit" name="butVal" value="Approve" class="btn text_3 color_3" /></center>
		</span></div>
</div>
</form>
</div>


 
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

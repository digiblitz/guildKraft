<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

 <script language="javascript">

//window.onload=call();
 
  function approved() {
 //alert("approved");
	 
var chkBoxCnt = document.artifactlist.chk.length;
 
		 if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
			   {
			  // alert("approved 2");
					for(var i=0;i<chkBoxCnt;i++)
					{
//alert("approved 3");
						 	if(document.artifactlist.chk[i].checked==true)
						 {
						 //alert("approved 4");
								var StageValue= document.artifactlist.StageValue[i].value;
								var StageName= document.artifactlist.StageName[i].value;
								var ArtifactId= document.artifactlist.ArtifactId[i].value;
								var ProcessId= document.artifactlist.ProcessId[i].value;
								//alert("StageName"+StageName);
								var stageNo= document.artifactlist.StageNo[i].value;
								var ReqquestId= document.artifactlist.ReqquestId[i].value;
								//alert("StageName"+StageName);

								 strURL = "./SysMgmt.html?process=BPapproved&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
                                 window.location.href = strURL;

						 }
						
					}
			   }


			   else{
		//	 alert("approved 5");
			   	if(document.artifactlist.chk.checked==true)
			{
//alert("approved 6");
var StageValue= document.artifactlist.StageValue.value;

								var StageName= document.artifactlist.StageName.value;
								var ArtifactId= document.artifactlist.ArtifactId.value;
								var ProcessId= document.artifactlist.ProcessId.value;
								var stageNo= document.artifactlist.StageNo.value;
                            var ReqquestId= document.artifactlist.ReqquestId.value;
								 strURL = "./SysMgmt.html?process=BPapproved&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
                                 window.location.href = strURL;



			}
			}




	 
		
	}
 
  function denied() {
		
var chkBoxCnt = document.artifactlist.chk.length;
		 if(chkBoxCnt!=undefined && chkBoxCnt!='undefined')
			   {
					for(var i=0;i<chkBoxCnt;i++)
					{

						 	if(document.artifactlist.chk[i].checked==true)
						 {
								
var StageValue= document.artifactlist.StageValue[i].value;
								var StageName= document.artifactlist.StageName[i].value;
								var ArtifactId= document.artifactlist.ArtifactId[i].value;
								var ProcessId= document.artifactlist.ProcessId[i].value;
								var stageNo= document.artifactlist.StageNo[i].value;
								var ReqquestId= document.artifactlist.ReqquestId[i].value;
								 strURL = "./SysMgmt.html?process=BPdenied&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
      window.location.href = strURL;


						 }
						
					}
			   }


			   else{
			   
			   	if(document.artifactlist.chk.checked==true)
			{
					
					var StageValue= document.artifactlist.StageValue.value;
								var StageName= document.artifactlist.StageName.value;
								var ArtifactId= document.artifactlist.ArtifactId.value;
								var ProcessId= document.artifactlist.ProcessId.value;
								var stageNo= document.artifactlist.StageNo.value;
								var ReqquestId= document.artifactlist.ReqquestId.value;

 strURL = "./SysMgmt.html?process=BPdenied&StageValue="+StageValue+"&StageName="+StageName+"&ArtifactId="+ArtifactId+"&ProcessId="+ProcessId+"&StageNo="+stageNo+"&RequestID="+ReqquestId;
      window.location.href = strURL;
			}
			   }


	 
	}


	
	 </script>
<!-- <link href="css/core-ie.css" type="text/css" rel="stylesheet" /> -->
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
            <div class="col-md-10">
			
                <div class='container'>
				
                    <div class='panel panel-primary dialog-panel'>
					
					<!--==============================Form Title=================================-->
                        <div class='panel-heading'>
                            <h2>Bussiness process Voting List</h2>
                        </div>
					<!--==============================Form Title=================================-->
						
                        <div class='panel-body'>
						
						<!--==============================Form Description=================================-->
      
     
     
                      <form class='form-horizontal' role='form' action="SysMgmt.html" name="artifactlist" id="artifactlist">
                        
						
						 
					 		 <div class="form-group">
							 	<div class="container">
									<div class="col-md-12 gp ">
									  	 <div class="row"> 
												<div class=' col-md-1'>
												<label class='control-label label1'>Serial Id </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 '>Artifact Name </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 mar '> Artifact Description</label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 mar '>Date of Request Raised</label>
												</div>
												<div class=' col-md-2'>
												<label class='control-label label1  '>Stage Name </label>
												</div>
												<div class=' col-md-1 '>
												<label class='control-label label1 mar'>Actions </label>
												</div>
												<div class=' col-md-2 '>
												<label class='control-label label1 mar'>Comments</label>
												</div>
											</div>
										</div>
									</div>
								</div>
							
                             
															
															<%
								   Map <Integer,String[]> artifactlist=(HashMap)request.getAttribute("BPvotinglist");
									//System.out.println  ("artifactData"+artifactData.size());                                           
																				 
								   if (artifactlist != null && artifactlist.size() != 0) {  
																							
								   Iterator iter = artifactlist.entrySet().iterator();
													//String [] userType = {ID, name };
																	while (iter.hasNext()) {
																		Map.Entry mEntry = (Map.Entry) iter.next();
																		
																		String [] artiType=(String[])mEntry.getValue();
																		int id=(Integer)mEntry.getKey();
																		String ArtifactName=artiType[0];
																		String ArtifactDescription=artiType[1];
																		String DORequest=artiType[2]; 
																		String StageName=artiType[3];
																		String Comments=artiType[4];
																		String ProcessId=artiType[5];
																		String ArtifactId=artiType[6];
																		String StageValue=artiType[7];
																		String StageNo=artiType[8];
																		 String reqId=artiType[9];
																		 
																		 if(Comments==null){
																		 Comments="NA";
																		 }
	
													%>
													
						
						
					 		
							 <div class="form-group">
							 	
								<div class="container">
								
									<div class="col-md-12 gp ">
									  	
										 <div class="row">
												<div class=' col-md-1'>
													<input type="radio" name="chk" value="<%=id%>" />
												</div>
												<div class=' col-md-2'>
												<label class='control-label '><%=ArtifactName%></label>
												</div>
												<div class=' col-md-2'>
												<label class='control-label '><%=ArtifactDescription%></label>
												</div>
												<div class=' col-md-2'>
												<label class='control-label '><%=DORequest%></label>
												</div>
												<div class=' col-md-2'>
												<label class='control-label '><%=StageName%></label>
												</div>
												<div class=' col-md-1'>
												 <button class='btn-lg btn-primary'  name="button" type="button" onclick="approved()" value="Approve" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#66CCFF;color:#3366FF;">Approve</button>
												  <button class='btn-lg btn-primary' name="button" type="button" onclick="denied()" value="Deny" style="border-bottom-style:groove;border-bottom-width:thin;border-bottom-color:#66CCFF;color:#3366FF;">Deny</button>
												 </div>
								  
									  <input type="hidden" value="<%=reqId%>" name="ReqquestId"/>
									  <input type="hidden" value="<%=StageName%>" name="StageName"/>
									  <input type="hidden" value="<%=StageNo%>" name="StageNo"/>
									  <input type="hidden" value="<%=StageValue%>" name="StageValue"/>
									  <input type="hidden" value="<%=ArtifactId%>"  name="ArtifactId"/>
									  <input type="hidden" value="<%=ProcessId%>" name="ProcessId"/>
									  
									  		<div class=' col-md-2'>
												<label class='control-label '><%=Comments%></label>
											</div>
										</div>
									</div>
								</div>
							</div>
							
								 
								<%}
								   }
								   else{
									   %>
								
											<div class="form-group">
												<div class=' col-md-5'>
													</div>
													<div class=' col-md-5'>
														No DATA 
													</div>
											</div>
								
								<%}%>
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


<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page language="java" contentType="text/html; charset=iso-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
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
                            <h2>Membership Registration: :Confirmation.</h2>
                        </div>
                        <div class='panel-body'>
					<!--==============================Form Title=================================-->
					
                      
	
    
			           <%
                       String usrnam=(String)request.getAttribute("usrname");
                       String pwd=(String)request.getAttribute("cpwd");
                       String actStat=(String)request.getAttribute("actStat");
                       String regStatus="";
                       
                       if(actStat!=null)
                       {
                           System.out.println(" request.getAttribute(actStat) in JSP :"+actStat);
                           regStatus="Active";
                       }
                       else
                       {
                           regStatus="Pending until payment processed";
                       }
                       
                    %>
                    
                    
			
	<form  class='form-horizontal' role='form' name="confirmation" method="post" action="MemberLogin.html" />
								<%
									String redirurl = "";
									String source = (String)session.getAttribute("forEE");
									String membid=(String)request.getAttribute("memberId");
									String membTyp=(String)request.getAttribute("membTyp");
									String amt=(String)request.getAttribute("tot_amt");
									 Date expdate=(Date)session.getAttribute("exp_date");
									 String finalDate= "N/A";
									 if(expdate!=null){
										 String temp_date = expdate.toString();
										 String[] split_date = temp_date.split("-");
										 String yr = split_date[0];
										 String month = split_date[1];
										 String day = split_date[2];
										 finalDate = month+"-"+day+"-"+yr;
									 }
							
									Calendar c = Calendar.getInstance();
									int day = c.get(Calendar.DATE);
									int month = c.get(Calendar.MONTH);
									int year = c.get(Calendar.YEAR);
									month=month+1;
									String date = month+"-"+day+"-"+year;
									String regDat="";
									if(session.getAttribute("regStatus")!=null){
										regDat=(String)session.getAttribute("regStatus");
									}
									String s = amt;
									if(s.indexOf('.')==-1){
										s= s+".00";
										amt=s;
									}
									if(s.indexOf('.')!=-1){
									String t = s.substring(s.indexOf('.'));
										if(t.length()==2){
											s=s+"0";
											amt=s;
										}
									}
									
									if(source!=null && source.equalsIgnoreCase("fromEventEntry")){
										redirurl = "OEEDemo.html?process=UserListing";
									}else{
										redirurl = "index.jsp";
									}
								%>
								
      <p>You have successfully registered. Registration details are as follows:</p>
	   <div class='form-group'>
                       <label class='control-label col-md-2 col-md-offset-2' for='id_title'>No.:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"><%=membid%></label>
										</div>
								  </div>
							</div>	
   
                           <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Member Type:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"><%=membTyp%></label>
										</div>
								  </div>
							</div>	
							  <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Expiry Date:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"> <%=finalDate%></label>
										</div>
								  </div>
							</div>	
   
     
      
	  <%
		  SimpleDateFormat formatter=new SimpleDateFormat("MM/dd/yyyy");
		  session.setAttribute("exp_date",null);
		  session.setAttribute("regStatus",null);
		  
		//expdate.setDate(expdate.getDate() +1);
		%>
		 <label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Date:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"><%=date%></label>
										</div>
								  </div>
							</div>	
		<label class='control-label col-md-2 col-md-offset-2' for='id_title'>Registration Status:</label>
                                    <div class='col-md-8'>
								<div class='col-md-3 indent-small'>
										<div class='form-group internal'> 
												<label class="control-label"><%=regStatus%></label>
										</div>
								  </div>
							</div>	
						</div>	
	 
	 <p>  If paying by check, please mail your payment of $ <%=amt%>(U.S. Dollars)  to:</p>
	 
      <p>
      Membership Registration<br />
      525 Old Waterford Road NW<br />
      Leesburg, VA 20176<br />
     </p>
	  <p>Please include member's name and No. on check!
     </p>
	   <div class='form-group'>
					<div class='col-md-offset-4 col-md-1'>
						<button class='btn-lg btn-primary' name="Button"  type="button" value="Back" onclick="location.href='<%=redirurl%>'">Back</button>
					</div>
					<div class='col-md-2'>
						<button class='btn-lg btn-primary'  name="button" type="button" value="Print This Page" onclick="window.print();">Print This Page</button>
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

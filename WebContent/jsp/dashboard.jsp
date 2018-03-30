<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=(String)session.getAttribute("title")%></title>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script>
<script type="text/javascript">
// jQuery Document
$(document).ready(function(){
 
});
</script>
			<style>
				form, p, span {
    margin:0;
    padding:0; }
  
input { font:12px arial; }
  
a {
    color:#0000FF;
    text-decoration:none; }
  
    a:hover { text-decoration:underline; }
  
#wrapper, #loginform {
    margin:0 auto;
    padding-bottom:25px;
    background:#EBF4FB;
    width:100%;
    border:1px solid #ACD8F0; }
  
#loginform { padding-top:18px; }
  
    #loginform p { margin: 5px; }
  
#chatbox {
    text-align:left;
    margin:0 auto;
    margin-bottom:25px;
    padding:10px;
    background:#fff;
    height:270px;
    width:100%;
    border:1px solid #ACD8F0;
    overflow:auto; }
  
#usermsg {
    width:100%;
    border:1px solid #ACD8F0;
    border: 1px solid #bfbfbf;
    padding: 10px;
    box-shadow: 0 3px 11px #ccc;	}
  
#submit { width: 60px; }
  
.error { color: #ff0000; }
  
#menu { padding:12.5px 25px 12.5px 25px; }
  
.welcome { float:left; }
  
.logout { float:right; }
  
.msgln { margin:0 0 2px 0; }
	input#submitmsg {
    background: #cc0001;
    color: #fff;
    outline: mediumblue;
    border: none;
    padding: 7px;
    text-align: center;
    /* float: right; */
    margin: 10px 7px;
}
			</style>

</head>

<body hoe-navigation-type="vertical" hoe-nav-placement="left" theme-layout="wide-layout" theme-bg="bg1">
	<div id="hoeapp-wrapper" class="hoe-hide-lpanel" hoe-device-type="desktop">
		<%@ include file = "../../include/HeaderProcess.jsp" %>
 


	 <div id="" hoe-color-type="lpanel-bg2" hoe-lpanel-effect="shrink">
	 <section id="">
				 <%String []digiblitztech = {};ArrayList <String[]>roleEntityMapList = new ArrayList();%>
				 
                <div class="inner-content">
                    <div class="panel theme-panel">
                        <div class="panel-heading">
                            <span class="panel-title">
								Welcome to guildKraft
							</span>
							<p>Here you could efficiently Manage your Memberships, Events, and various Internal Operational Process at ease. Business Digital Transformation Guild is a highly scalable centralized association process automation system with Business Process Management (BPM) and Service Orientation capabilities bundled under one umbrella; So, whether your association has few hundred or few thousand members and employees, It's not a tough job to run the show.</p>
							<p style="color:#cc0001;"><i class="fa fa-cog"></i>&nbsp;&nbsp;Available Services</p>
                        </div>
						<div class="panel-body">
						
						 
		 
		
                            <div class="row clearfix">
						<%
						ArrayList headEntityList = (ArrayList)session.getAttribute("DBEntityList");
						if(headEntityList!=null && headEntityList.size()!=0){
							Iterator itEntList = headEntityList.iterator();
							int i=1;
							while(itEntList.hasNext()){
							
								String strRolelist[]= (String[])itEntList.next();
								String heRoleId = strRolelist[1];
								String heRoleName = strRolelist[3];
								String heEntityId = strRolelist[2];
								String heEntityName = strRolelist[4];
								String heEntityUrl = strRolelist[5];
								
								String []newname = 	{strRolelist[4]};
								System.out.println("newname ::::::"+i+":::::::"+newname[0]);
								
								digiblitztech=newname;
								roleEntityMapList.add(digiblitztech);
								
								
								
											
					            
								if(heEntityUrl==null){	
									
							%>
                        
                                <div class="col-md-3 column">
                                    <a  href="<%=request.getContextPath()%>/login.html?cmd=initIndex&entityId=<%=heEntityId%>&roleId=<%=heRoleId%>&UsrId=<%=userId%>&membId=<%=memberShipId%>">
									
										<div class="feature-box">
											<span class="feature-icon">
											<%if(i==1){%>
											<i class="fa fa-volume-up">
											</i>
											<%}if(i==2){%>
											<i class="fa fa-mobile">
											</i>
											<%}if(i==3){%>
											<i class="fa fa-th-list">
											</i>
											<%}if(i==4){%>
											<i class="fa fa-user-md">
											</i>
											<%}if(i==5){%>
											<i class="fa fa-slideshare">
											</i>
											<%}if(i==6){%>
											<i class="fa fa-info">
											</i>
											<%}if(i==7){%>
											<i class="fa fa-building-o">
											</i>
											<%}if(i==8){%>
											<i class="fa fa fa-cog">
											</i>
											<%}if(i==9){%>
											<i class="fa fa-group">
											</i>
											<%}if(i==10){%>
											<i class="fa fa-book">
											</i>
											<%}if(i==11){%>
											<i class="fa fa-warning">
											</i>
											<%}if(i==12){%>
											<i class="fa fa-tasks">
											</i>
											<%}if(i==13){%>
											<i class="fa fa-briefcase">
											</i>
											<%}if(i==14){%>
											<i class="fa fa-truck">
											</i>
											<%}if(i==15){%>
											<i class="fa fa-stack-exchange">
											</i>
											<%}if(i==16){%>
											<i class="fa fa-dot-circle-o">
											</i>
											<%}%>
											</span>
										  <span style="margin-bottom:10px"><%=heEntityName%></span> 
										</div>
									</a>
									 </div>
                               
                       
									
							 
			
			     				<%}else{%>
						  		
						  		<li><a href="<%=request.getContextPath()+heEntityUrl%>"><span><%=heEntityName%></span></a></li>
						  	<%}i++;}}%>		
							 </div>
                    </div>
									
                               
                </div>
			 </div> 
          </section>

</div>
<!--=======footer=================================-->
	 
                    <!-- FOOTER STARTS HERE -->
                        
						<%@ include file = "../../include/FooterProcess.jsp" %>
                    <!-- FOOTER ENDS HERE -->
               
</div>

<div id="styleSelector">
                <div class="selector-toggle">
                    <a href="javascript:void(0)">Chat</a>
                </div>
                <ul>
                    <li>
                        <p class="selector-title">Chat</p>
                    </li>
					
					<li class="theme-option">
                        
                        <div id="wrapper">
							<div id="menu">
								<p class="welcome">Welcome, <b></b></p>
								<p class="logout"><a id="exit" href="#">Exit Chat</a></p>
									<div style="clear:both"></div>
							</div>
     
							<div id="chatbox"></div>
     
							<form name="message" action="">
								<input name="usermsg" type="text" id="usermsg" size="63" />
								<input name="" type="submit"  id="submitmsg" value="Send" />
							</form>
						</div>
					</li>

                    
                </ul>
            </div>


</body>
</html>

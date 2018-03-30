<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
<%@page import="com.hlccommon.util.HLCMenuListVO"%>
<%@ page import="java.util.*"%>
	
    <style>
        .panel-body p {
            font-size: 18px;
            line-height: 30px;
            color: #333;
			padding-bottom:30px;
        }

        .panel-body {
            background: #e6e6e6;
            box-shadow: 0 1px 18px #727272;
            display: block;
        }

        .media i {
            font-size: 38px;
            color: #fff;
        }

        #hoe-left-panel[hoe-position-type="absolute"] {
            position: relative;
        }

        #hoe-left-panel {
            background: #FFF none repeat scroll 0 0;
            color: #7e7e7e;
            width: 238px;
            top: 0;
            position: relative;
            float: left;
            min-height: 100%;
            z-index: 100;
            box-shadow: 0 1px 4px 0 rgba(0, 0, 0, 0.2);
        }

        .site-footer {
            background: #373d4b;
            width: 100%;
            padding: 10px 0;
        }

        .copyrights p {
            text-align: center;
            color: #fff;
            font-size: 14px;
        }

            .copyrights p a {
                color: #fff;
                font-weight: bold;
                text-decoration: underline;
            }

        .copyrights {
            border-top-color: #ce434a;
            border-top-width: 2px;
            width: 100%;
            margin: 30px 0 0 0;
            border-top-style: solid;
            padding: 10px 0;
        }

        .rightMenu {
            padding: 30px 0;
        }

        .Table {
            border: 2px solid #ccc;
            padding: 15px 7px;
        }

            .Table p {
                font-size: 13px;
                color: #000;
            }

        .pad {
            padding: 0;
        }

        h5.media-heading {
            color: #000;
            font-weight: bold;
        }

        .panel-primary > .panel-heading {
            color: #fff;
            background-color: #3498db;
            border-color: #337ab7;
        }

        .panel-primary {
               border-color: #337ab7;
    margin: 20px 0;
    max-height: 100%;
    position: relative;
    width: 100%;
    display: block;
    overflow: hidden;
        }

            .panel-primary h2 {
                font-size: 22px;
                margin: 0;
            }
    </style>
	


    <aside id="hoe-left-panel" hoe-position-type="absolute">

        <div class="profile-box">
		
            <div class="media">
			
                <span class="hoe-sidebar-toggle">
                    <a href="javascript:void(0)" class="pull-left">
                        <i class="fa fa-th-list"></i>
                    </a>
                </span>

                <div class="media-body">
                    <h5 class="media-heading">Welcome <span><%=fullName%></span></h5>
                    <small><%=roleName%></small>
                </div>
				
            </div>
			
        </div>
		
        <ul class="nav panel-list">

            <li class="hoe-has-menu">
                <a href="javascript:void(0)">
                    <i class="fa fa-user"></i>
                    <span class="menu-text">My Profile</span>
                    <span class="selected"></span>
                </a>
				
                <ul class="hoe-sub-menu">
				
                    <li>
                        <a href="user.html?cmd=edit">
                            <span class="menu-text">Edit Profile</span>
                            <span class="selected"></span>
                        </a>
                    </li>
					
                    <li>
                        <a href="user.html?cmd=initchgPwd">
                            <span class="menu-text">Change Password </span>
                            <span class="selected"></span>
                        </a>
                    </li>
					
                    <li>
                        <a href="user.html?cmd=profiledetails">
                            <span class="menu-text">Profile Details</span>
                            <span class="selected"></span>
                        </a>
                    </li>
					
                    <li>
                        <a href="user.html?cmd=product_package">
                            <span class="menu-text">Plan and Package</span>
                            <span class="selected"></span>
                        </a>
                    </li>
					
                    <li>
                        <a href="user.html?cmd=security">
                            <span class="menu-text">Security</span>
                            <span class="selected"></span>
                        </a>
                    </li>
					
                </ul>
				
            </li>
			
            <%
            ArrayList headEntityList = (ArrayList)session.getAttribute("privList");
            if(headEntityList!=null && headEntityList.size()!=0){
            Iterator itEntList = headEntityList.iterator();

            while(itEntList.hasNext()){

            String strRolelist[]= (String[])itEntList.next();
            String heRoleId = strRolelist[1];
            String heRoleName = strRolelist[3];
            String heEntityId = strRolelist[2];
            String heEntityName = strRolelist[4];
            String heEntityUrl = strRolelist[5];
            String privName= strRolelist[6];
            String priviId = strRolelist[7];

            if(heEntityUrl==null){
            //System.out.println(heEntityName);
            %>

            <li class="hoe-has-menu">
                <a href="javascript:void(0)">
                    <i class="fa fa-sitemap"></i>
                    <span class="menu-text"><%=privName%></span>
                    <span class="selected"></span>
                </a>
				
                <ul class="hoe-sub-menu">

                    <%
                    ArrayList headAllList = (ArrayList)session.getAttribute("DBAllList");
                    if(headAllList!=null && headAllList.size()!=0){
                    Iterator itAllList = headAllList.iterator();

                    while(itAllList.hasNext()){

                    String strAlllist[]= (String[])itAllList.next();

                    String allEntityId = strAlllist[2];
                    String allEntityName = strAlllist[4];

                    String hePrivName = strAlllist[6];
                    String hePrivId = strAlllist[7];
                    String accessName = strAlllist[8];
                    String accessUrl = strAlllist[9];

                    //System.out.println("accessUrl in jsp::"+accessUrl);

                    String tempAccesURL="";

                    boolean tempURL = accessUrl.contains("viewMaster.do?process");
                    boolean membRegiURL = accessUrl.contains("MembershipReg.do?process=reg");
                    //System.out.println("Result : "+tempURL);
                    if(tempURL == true){
                    tempAccesURL=accessUrl.replace("viewMaster.do?process","artifactMapping.html?artiMapProcess");
                    }
                    else if(membRegiURL == true){
                    tempAccesURL=accessUrl.replace("MembershipReg.do?process=reg","MembershipReg.html?process=preMemReg");
                    }
                    else{
                    tempAccesURL=accessUrl.replaceAll("do","html");
                    }

                    //System.out.println("tempAccesURL in jsp::"+tempAccesURL);
                    if(hePrivId.equals(priviId)){

                    %>
					
                    <li>
                        <a href="<%=tempAccesURL%>">
                            <span class="menu-text"><%=accessName%></span>
                            <span class="selected"></span>
                        </a>
                    </li>

                    <%}}}%>

                </ul>
				
            </li>

            <%}else{%>

            <li class="hoe-has-menu">
                <a href="<%=request.getContextPath()+heEntityUrl%>">
                    <i class="fa fa-files-o"></i>
                    <span class="menu-text"><%=heEntityName%></span>
                    <span class="selected"></span>
                </a>
            </li>

            <%}}}%>
			
        </ul>
		
    </aside>


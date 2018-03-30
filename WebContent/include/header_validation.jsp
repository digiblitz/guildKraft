<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link rel="shortcut icon" href="images/favicon.ico" />
    <!-- CSS includes //-->
    <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,400italic,700,700italic' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css' />
    <link href='https://fonts.googleapis.com/css?family=Archivo+Black' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css" />
    <link rel="stylesheet" href="css/hoe.css" type="text/css" />
    <link rel="stylesheet" href="css/1.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css">
	
	<!-- JS includes //-->
    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries //-->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!--script src="js/1.11.2.jquery.min.js"></script>-->
	
		
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/hoe.js"></script>
    <script type="text/javascript">
        // jQuery Document
        $(document).ready(function () {

        });
    </script>
	

<script src="js/jquery.colorbox-min.js"></script>

<script src="js/jquery.rivathemes.js"></script>


<script src="js/biss.js"></script>


    <style>
        i.fa.fa-chevron-right {
            border-radius: 25%;
            background: #cc0001;
            color: #fff;
            font-size: 14px;
            margin-right: 10px;
            line-height: 12px;
            padding: 5px;
        }

        .hoe-right-header > ul {
            display: inline-block;
            margin: 0;
            padding: 1.25rem 0;
        }

        .right-navbar {
            float: right;
            padding: 1.25rem 7px 0 0 !important;
        }
    </style>
	
	
    <%String fstnam=(String)session.getAttribute("firstName");
    String lstnam=(String)session.getAttribute("lastName");
    String imagedata=(String)session.getAttribute("imagedata");

    //System.out.println("last name : "+lstnam);

    String roleName=(String)session.getAttribute("roleName");
    String fullName=fstnam+" "+lstnam;

    String lnk="";
    String memberShipId="";
    String memId=(String)session.getAttribute("memberId");

    System.out.println("memId in HPro:"+memId);


    System.out.println("fstnam::::"+fullName);

    String userId=(String)session.getAttribute("userId");
    System.out.println("UserId in headerProcess : "+userId);

    String userName=(String)session.getAttribute("userName");
    String userPassword=(String)session.getAttribute("userPassword");

    session.setAttribute("userName",userName);
    session.setAttribute("userPassword",userPassword);

    System.out.println("username&password in the headerprocess::::"+userName+"" +userPassword);


    if(memId!=null)
    {
    memberShipId=memId;

    }
    else
    {
    memberShipId="Join Now!";

    }

    session.setAttribute("memberId",memberShipId);
    %>
	
</head>

    <header id="hoe-header" hoe-lpanel-effect="shrink">
	
        <div class="hoe-left-header">
		
            <a href="login.html?cmd=initLogin"><img src="images/logo.png" style="width:65%;" /></a>
            <span class="hoe-sidebar-toggle"><a href="#"></a></span>

        </div>

        <div class="hoe-right-header" hoe-position-type="relative">
		
           
			
        </div>
		
    </header>

<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
    <style>
        form, p, span {
            margin: 0;
            padding: 0;
        }

        input {
            font: 12px arial;
        }

        a {
            color: #0000FF;
            text-decoration: none;
        }

            a:hover {
                text-decoration: underline;
            }

        #wrapper, #loginform {
            margin: 0 auto;
            padding-bottom: 25px;
            background: #EBF4FB;
            width: 100%;
            border: 1px solid #ACD8F0;
        }

        #loginform {
            padding-top: 18px;
        }

            #loginform p {
                margin: 5px;
            }

        #chatbox {
            text-align: left;
            margin: 0 auto;
            margin-bottom: 25px;
            padding: 10px;
            background: #fff;
            height: 270px;
            width: 100%;
            border: 1px solid #ACD8F0;
            overflow: auto;
        }

        #usermsg {
            width: 100%;
            border: 1px solid #ACD8F0;
            border: 1px solid #bfbfbf;
            padding: 10px;
            box-shadow: 0 3px 11px #ccc;
        }

        #submit {
            width: 60px;
        }

        .error {
            color: #ff0000;
        }

        #menu {
            padding: 12.5px 25px 12.5px 25px;
        }

        .welcome {
            float: left;
        }

        .logout {
            float: right;
        }

        .msgln {
            margin: 0 0 2px 0;
        }

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
                        <!-- <p class="logout"><a id="exit" href="#">Exit Chat</a></p> -->
                        <div style="clear:both"></div>
                    </div>

                    <div id="chatbox"></div>

                    <form name="message" action="">
                        <input name="usermsg" type="text" id="usermsg" size="63" />
                        <input name="" type="button" id="submitmsg" value="Send" />
                    </form>
					
                </div>

            </li>


        </ul>
		
    </div>

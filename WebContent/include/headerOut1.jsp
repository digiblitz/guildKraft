<!---
Copyright: 2018 digiBlitz Foundation

License: digiBlitz Public License 1.0 (DPL) 
Administered by digiBlitz Foundation. www.digiblitz.org/dpl/

Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)

Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.

"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
--->
 <header class="header">
       <div class="header-top clearfix">
          <div class="container">
            <div class="row">
              <div class="col-xs-12">
                <ul class="social-net list-inline">
                  <li class="social-net__item"><a href="https://twitter.com/digiBlitz" target="_blank" class="social-net__link"><i class="icon fa fa-twitter"></i></a></li>
                  <li class="social-net__item"><a href="https://www.facebook.com/digiblitz" target="_blank" class="social-net__link"><i class="icon fa fa-facebook"></i></a></li>
                  <li class="social-net__item"><a href="https://www.linkedin.com/company/digiblitz-technologies" target="_blank" class="social-net__link"><i class="icon fa fa-linkedin"></i></a></li>
                  <div style="margin-left: 0px;" class="header-contact__item avatar footer__contact">
					  <a href="#" id="chat" style="font-size:larger;font-weight:800;cursor: default" class="hov" >Call to Sales: (+1)5712976808</a></div> 
                </ul>
                <!-- end social-list-->
                <div class="header-contact">
                 <!--  <div class="header-contact__item">Call  :<span class="header-contact__info"> <a id='__imgButtonClickToCall' href='#'  onclick="window.open('https://acctmgr.evoice.com/AcctMgr/ClickToCall/ClickToConnectSession.aspx?key=ebd893c1-5f13-4555-a486-6036b751462f','','width=570,height=280, left=40, top=100, resizable=no,scroll=yes,status=no,titlebar=no,toolbar=no,addressbar=no,copyhistory=no,navigationtoolbar=no')"  style='cursor:pointer;border:none'>+1-703-956-2520</a> </span></div>-->
                  <div class="header-contact__item">Sales Email  :<a href="mailto:sales@guildkraft.com" class="header-contact__info"> sales@guildkraft.com</a></div>
				   <div class="header-contact__item">Billing Email  :<a href="mailto:billing@guildkraft.com" class="header-contact__info"> billing@guildkraft.com</a></div>
				    <div class="header-contact__item">Support Email  :<a href="mailto:support@guildkraft.com" class="header-contact__info"> support@guildkraft.com</a></div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="header-main">
          <div class="container">
            <div class="row">
              <div class="col-xs-12"><a href="login.html?cmd=initLogin" class="logo"><img src="images/logo.png" alt="Logo" class="logo__img img-responsive"/></a>
                <div class="header-nav">
                  <div class="navbar-trigger visible-xs">
                    <button type="button" data-toggle="collapse" data-target="#navbar-collapse-1" class="navbar-toggle"><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
                  </div>
                  <div class="search-trigger">
				  <button class="btn btn-primary btn-lg" href="#signup" data-toggle="modal" data-target=".bs-modal-sm">Signin</button>
				  </div>
                  <nav class="navbar yamm">
                     <div id="navbar-collapse-1" class="navbar-collapse collapse">
                      <ul class="nav navbar-nav">
                        <li><a href="login.html?cmd=initLogin">Home</a>
                        </li>
                        <li><a href="whyGuildKraft.jsp">Why guildKraft?</a>
                        </li>
                        <li><a href="pricing.jsp">Pricing</a></li>
                        <li><a href="frmContacts.jsp">Contact Us</a></li>
						<li><a href="https://www.digiblitz.com/support/category/guildkraft/" target="_blank">Help</a></li>
						<li><a href="https://digiblitz.com/community/" target="_blank">Community</a></li>
                      </ul>
                    </div>
                   <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        
        <div class="bs-example bs-example-tabs">
            <h2>Signin</h2>
        </div>
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
       
        <div class="tab-pane fade active in" id="signin">
           
            <form class="form-horizontal" action="login.html?cmd=initDash" method="post">
            <fieldset>
            <!-- Sign In Form -->
            <!-- Text input-->
            <div class="control-group">
              <label class="control-label" for="useremail"><strong>User Name</strong></label>
              <div class="controls">
			  
			    <input type="text" class="form-control" name="textfield" onfocus="this.value = '';" class="input-medium" placeholder="Username" required/>
               
              </div><!--end controls-->
            </div><!--end control-group-->

            <!-- Password input-->
            <div class="control-group">
              <label class="control-label" for="passwordinput"><strong>Password:</strong></label>
              <div class="controls">
			  
				<input type="password"  name="textfield2" class="form-control" onfocus="this.value = '';" class="input-medium"  placeholder="Password" required/>
               
              </div><!--end controls-->
            </div><!--end control-group-->

            <!-- Multiple Checkboxes (inline) -->
            <!--<div class="control-group">
              <label class="control-label" for="rememberme"></label>
              <div class="controls">
                <label class="checkbox inline" for="rememberme-0">
                  <input type="checkbox" name="rememberme" id="rememberme-0" value="Remember me">
                  Remember me
                </label>
              </div>
            </div>-->
            
            <br>
            

            <!-- Button -->
            <!--<div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="signin" name="signin" class="btn btn-success">Sign In</button>
              </div>
            </div>-->
            
            <div class="form-group last">
                <div class="col-sm-12" align="center">
                    <button type="submit" class="btn btn-success">
                      Signin
                    </button>
                   
                </div>
            </div>
            
            
            <div class="panel-footer">
			
			 <a href="user.html?cmd=initUsrReg" style="float:left;">New User Signup?</a>
              <a href="user.html?cmd=view" >Forgot Password?</a>
             
            </div>
            
            
            </fieldset>
            </form>
        </div>
		
		<!--end sign-in-->
       
    </div><!--End Modal-Conent-->
</div><!--End Modal-Dialogue-->
      <div class="modal-footer">
        <center>
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </center>
      </div>
                  </nav>
                  <!-- end nav-->
                </div>
              </div>
            </div>
          </div>
        </div>
      </header>
      <!-- end header-->

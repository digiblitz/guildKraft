//
//Copyright: 2018 digiBlitz Foundation
//
//License: digiBlitz Public License 1.0 (DPL) 
//Administered by digiBlitz Foundation. www.digiblitz.org/dpl/
//
//Inventor: Suresh Kannan (Maya Suresh Kannan Balabisegan ) (www.sureshkannan.org)
//
//Authors: Suresh Kannan (Maya Suresh Kannan Balabisegan )& digiBlitz.
//
//"Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software in accordance to the rules & restrictions of the digiBlitz Public License."
//
function arCheck(param){
	var b = param;
	if(b=="" ){
			document.getElementById("ownerUseaNo2_id").value = "";
			document.getElementById("ownerFname2_id").value = "";
			document.getElementById("ownerLname2_id").value = "";
			document.getElementById("ownerPhone2_id").value = "";	 
			
	 }
	 else{
	 additionalRiderDetails(b);																		
	 }
}
var req;
     function additionalRiderDetails(riderId){
		 param = riderId;
		 
			var  url = null;
			if(param.length==0)
			return;
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			req.onreadystatechange = processAddRider;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function processAddRider(){ 
    			if (req.readyState == 4){ 
						  // alert(req.status);
							if(req.status == 200){ 
							 
								 var xmlDoc = req.responseXML.documentElement;
								    var userNoId =param;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
																	
								 	var addfirstNameObj = document.getElementById("ownerFname2_id");
								    var addlastNameObj = document.getElementById("ownerLname2_id");
									var addphoneObj = document.getElementById("ownerPhone2_id"); 
							        var userObj = document.getElementById("ownerUseaNo2_id"); 
															 
								     addfirstNameObj.value =  firstName;
								     addlastNameObj.value = lastName ;
									 addphoneObj.value = phone ; 
							      	 userObj.value =  userNoId;  
								
							} 
											if(req.status==500) {
											//addRiderClear();
											document.getElementById("ownerUseaNo2_id").value = "";
											document.getElementById("ownerFname2_id").value = "";
											document.getElementById("ownerLname2_id").value = "";
											document.getElementById("ownerUseaNo2_id").value = "";
											
											alert("Membership Id is not valid");
											document.myform.ownerUseaNo2_id.focus();
											}
											else{ 
												
											} 
						}	
						
					} 
//-------------------------------------for trainer is the owner-------------------------------------------------------
function ownerCheck(param){
	var b = param;
	if(b=="" ){
			document.getElementById("txtUserName").value = "";
			document.getElementById("txtFirstName").value = "";
			document.getElementById("txtLastName").value = "";
			document.getElementById("txtPhone").value = "";	 
			
	 }
	 else{
	 additionalOwnerDetails(b);																		
	 }
}
var req;
     function additionalOwnerDetails(ownerId){
		 param = ownerId;
		 
			var  url = null;
			if(param.length==0)
			return;
			url = "annualAjax.do?method=memDetails&nonmemberId="+escape(param);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			req.onreadystatechange = processAddOwner;         
			req.open("GET", url, true);
			req.send(null);  
} 
          function processAddOwner(){ 
    			if (req.readyState == 4){ 
						  // alert(req.status);
							if(req.status == 200){ 
							 
								 var xmlDoc = req.responseXML.documentElement;
								    var userNoId =param;
									var firstName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
																	
								 	var addfirstNameObj = document.getElementById("txtFirstName");
								    var addlastNameObj = document.getElementById("txtLastName");
									var addphoneObj = document.getElementById("txtPhone"); 
							        var userObj = document.getElementById("txtUserName"); 
															 
								     addfirstNameObj.value =  firstName;
								     addlastNameObj.value = lastName ;
									 addphoneObj.value = phone ; 
							      	 userObj.value =  userNoId;  
	
							} 
											if(req.status==500) {
											//addRiderClear();
											document.getElementById("txtUserName").value = "";
											document.getElementById("txtFirstName").value = "";
											document.getElementById("txtLastName").value = "";
											document.getElementById("txtPhone").value = "";
											
											alert("User Name is not valid");
											document.myform.txtUserName.focus();
											}
											else{ 
												
											} 
						}	
						
					} 

//-------------------------------- User status validation Ajax Script ------------------------------------------------
var httpRequest;
function usrStat(){
if(document.myform.newAddFirstNameIdComp.value!="" && document.myform.newAddFirstNameIdComp.value.indexOf(' ')!=0){
   var chsUserName=document.myform.newAddFirstNameIdComp.value;
   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.do?process=checkusrnam&chsUserName="+chsUserName; 
        if (window.ActiveXObject){ 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest){ 
            httpRequest = new XMLHttpRequest(); 
        } 
        httpRequest.open("GET", url, true); 
        httpRequest.onreadystatechange =processUser; 
        httpRequest.send(null); 
   } 
   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processUser(){ 
   
        if (httpRequest.readyState == 4){ 
            if(httpRequest.status == 200){ 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
                 updateHTML(salutationXML); 
            } 
            else{ 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML){ 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 
		if(salutationText != "false"){
			alert("Company Name already Exists Chose Another !");
			document.myform.newAddFirstNameIdComp.value="";
			document.myform.newAddFirstNameIdComp.focus();
		}
    } 




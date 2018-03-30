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
						//document.frmForgetPwd1.sAnswer2.value=salutationText;	
                        dispDiv(salutationText);		
					//}
              
            } 
            else 
            { 
                alert("Error loading page\n"+ shttpRequest.status +":"+ shttpRequest.statusText); 
            } 
        } 
    } 


function dispDiv(scrQue){
	if(scrQue != "" && scrQue != "null"){
		document.getElementById('secretQuest').style.display = "block";
		document.getElementById('noSecretQuest').style.display = "none";
		document.frmForgetPwd1.sAnswer2.value=scrQue;
	}
	else{
		document.getElementById('noSecretQuest').style.display = "block";
		document.getElementById('secretQuest').style.display = "none";

			document.frmForgetPwd1.sAnswer2.value="";
			document.frmForgetPwd1.sAnswer.value="";
	}

if(scrQue == "close")
{
	document.getElementById('noSecretQuest').style.display = "none";
	document.getElementById('secretQuest').style.display = "none";
}

}


var httpRequest;

function usrStat()
{
 

if(document.frmForgetPwd1.usrname.value!="" && document.frmForgetPwd1.usrname.value.indexOf(' ')!=0)
	{

   var chsUserName=document.frmForgetPwd1.usrname.value;

   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "UsrSignupAjax.html?cmd=checkusrnam&chsUserName="+chsUserName; 

        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processRequest; 
        httpRequest.send(null); 
   } 

else
	{

		var val="close";
		//alert(val);
		dispDiv(val);
		document.frmForgetPwd1.usrname.value="";
		document.frmForgetPwd1.sAnswer2.value="";
		document.frmForgetPwd1.sAnswer.value="";
	}

   }
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processRequest() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("userstatus")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
     
                //Update the HTML 
                updateHTML(salutationXML); 
            } 
            else 
            { 
                alert("Error loading page\n"+ httpRequest.status +":"+ httpRequest.statusText); 
            } 
        } 
    } 
        
   /** 
    * This function parses the XML and updates the  
    * HTML DOM by creating a new text node is not present 
    * or replacing the existing text node. 
    */ 
    function updateHTML(salutationXML) 
    { 
        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 

		if(salutationText != "false")
		{
			forPwdSqa();
			
		}
		else
		{
			
			alert("User Name Doesnt Exist !!");
			document.frmForgetPwd1.usrname.value="";
			document.frmForgetPwd1.sAnswer2.value="";
			document.frmForgetPwd1.sAnswer.value="";

			document.frmForgetPwd1.usrname.focus();
		}
      
    } 
 

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
				document.frmMembRegi.smob_txt1.focus();
						document.getElementById("smob_txt1").innerHTML="Enter mobile number ";
				return false;
			}
			if(document.frmMembRegi.smob_txt1.value.length<10){
			
				document.frmMembRegi.smob_txt1.focus();
						document.getElementById("smob_txt1").innerHTML="Enter mobile number ";
				return false;
			}
			
				else{
			    document.frmMembRegi.smob_txt1.focus();
				document.getElementById("smob_txt1").innerHTML="";
				}
			if(document.frmMembRegi.smob_txt1.value.length>12){
			
					document.frmMembRegi.smob_txt1.focus();
							document.getElementById("smob_txt1").innerHTML="Enter mobile number";
					return false;
				}
				
					else{
				    document.frmMembRegi.smob_txt1.focus();
					document.getElementById("smob_txt1").innerHTML="";
					}

		}


		//-------------------------------------------------------------------------------------------------------
		//----------------------IF ENTER EITHER Primary Phone Number OR Primary mobile Number
		if(document.frmMembRegi.smob_txt1.value=="")
		{ //alert("Enter Secondary Phone Number");
		  document.frmMembRegi.smob_txt1.focus();
		  document.getElementById("smob_txt1").innerHTML="Enter Numeric only";
		  return false;}
		else{
			document.frmMembRegi.smob_txt1.focus();
			document.getElementById("smob_txt1").innerHTML="";
			}
		if(Dospace(document.frmMembRegi.smob_txt1.value)){
					
			     	document.frmMembRegi.smob_txt1.focus();
			     	document.getElementById("smob_txt1").innerHTML="Enter Numeric only";
			  		return false;
					}
		else{
			document.frmMembRegi.smob_txt1.focus();
			document.getElementById("smob_txt1").innerHTML="";
			}
					if(document.frmMembRegi.smob_txt1.value.indexOf(" ")==0){
				
				document.frmMembRegi.smob_txt1.focus();
				document.getElementById("smob_txt1").innerHTML="Enter Numeric only";
				return false; 
			}
					else{
						document.frmMembRegi.smob_txt1.focus();
						document.getElementById("smob_txt1").innerHTML="";
						}

 //-----------------------------------------Secondary fax--------------------------------

		if(document.frmMembRegi.sfax_txt1.value!=""){		  
			len7=document.frmMembRegi.sfax_txt1.value.length;
			strnum = document.frmMembRegi.sfax_txt1.value;
			var GoodChars = "0123456789()- ";
			valid = 1;
			for(j=0;j<len7;j++){
				if(GoodChars.indexOf(strnum.charAt(j))==-1){
					valid=0;
				}
			}
			if(valid!=1){
//				
				document.frmMembRegi.sfax_txt1.focus();
						document.getElementById("sfax_txt1").innerHTML="Enter fax number ";
				return false;
			}
			if(document.frmMembRegi.sfax_txt1.value.length<10){
			
				document.frmMembRegi.sfax_txt1.focus();
						document.getElementById("sfax_txt1").innerHTML="Enter fax number ";
				return false;
			}
			
				else{
			    document.frmMembRegi.sfax_txt1.focus();
				document.getElementById("sfax_txt1").innerHTML="";
				}
			if(document.frmMembRegi.sfax_txt1.value.length>12){
			
					document.frmMembRegi.sfax_txt1.focus();
							document.getElementById("sfax_txt1").innerHTML="Enter fax number";
					return false;
				}
				
					else{
				    document.frmMembRegi.sfax_txt1.focus();
					document.getElementById("sfax_txt1").innerHTML="";
					}

		}


		//-------------------------------------------------------------------------------------------------------
		//----------------------IF ENTER EITHER Primary Phone Number OR Primary mobile Number
		if(document.frmMembRegi.sfax_txt1.value=="")
		{ //alert("Enter Secondary Phone Number");
		  document.frmMembRegi.sfax_txt1.focus();
		  document.getElementById("sfax_txt1").innerHTML="Enter Numeric only";
		  return false;}
		else{
			document.frmMembRegi.sfax_txt1.focus();
			document.getElementById("sfax_txt1").innerHTML="";
			}
		if(Dospace(document.frmMembRegi.sfax_txt1.value)){
					
			     	document.frmMembRegi.sfax_txt1.focus();
			     	document.getElementById("sfax_txt1").innerHTML="Enter Numeric only";
			  		return false;
					}
		else{
			document.frmMembRegi.sfax_txt1.focus();
			document.getElementById("sfax_txt1").innerHTML="";
			}
					if(document.frmMembRegi.sfax_txt1.value.indexOf(" ")==0){
				
				document.frmMembRegi.sfax_txt1.focus();
				document.getElementById("sfax_txt1").innerHTML="Enter Numeric only";
				return false; 
			}
					else{
						document.frmMembRegi.sfax_txt1.focus();
						document.getElementById("sfax_txt1").innerHTML="";
						}

		}

	return true;

	}

//-------------------------------- User status validation Ajax Script ------------------------------------------------

var httpRequest;

function usrStat()
{

if(document.frmMembRegi.usrname.value!="" && document.frmMembRegi.usrname.value.indexOf(' ')!=0)
	{

   var chsUserName=document.frmMembRegi.usrname.value;

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
    function processUser() 
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
			//alert("User Name already Exists Choose Another !");
			document.frmMembRegi.usrname.value="";
			document.frmMembRegi.usrname.focus();
			document.getElementById("usrname").innerHTML = "User Name already Exists Choose Another !"; 
		}
		else
		{
			//alert("User Name already Exists Choose Another !");
			document.frmMembRegi.usrname.value="";
			document.frmMembRegi.usrname.focus();
			document.getElementById("usrname").innerHTML = ""; 
		}
		      
    } 

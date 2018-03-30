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
							req.open("GET", url, true);
							req.send(null);  
				} 
				   
                     function processRequest(){ 
						if (req.readyState == 4){ 
						   //alert(req.readyState);
							if(req.status == 200){ 
							//alert(req.status);
								//clearFields();
								//get the XML send by the servlet 
								    var xmlDoc = req.responseXML.documentElement;
									var fName =xmlDoc.getElementsByTagName('userfirstName')[0].childNodes[0].nodeValue;
									var lName =xmlDoc.getElementsByTagName('userlastName')[0].childNodes[0].nodeValue; 
									var ph =xmlDoc.getElementsByTagName('userphone')[0].childNodes[0].nodeValue; 
									//var usId =xmlDoc.getElementsByTagName('useruserId')[0].childNodes[0].nodeValue; 
									//var usrdob =xmlDoc.getElementsByTagName('userdob')[0].childNodes[0].nodeValue;
									//var usrage =xmlDoc.getElementsByTagName('userage')[0].childNodes[0].nodeValue; 

									
							} 
							if(req.status==500) {
							 
							  return;
							}
							else{ 
							//alert("document.frmMembRegi.usrSessionNam.value :"+document.frmMembRegi.usrSessionNam.value);
							//alert("document.frmMembRegi.usrname.value :"+document.frmMembRegi.usrname.value);
							                                                            
							  alert("UserName Exists Choose Another");
							  clear();
							  document.frmMembRegi.usrname.focus();
							  return false;
                                                          
							} 
							  
						}	
					} 
		          function clear() {
						document.getElementById("usrname").value = "";
						
						
					}


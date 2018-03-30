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
$(document).ready(function(){


$(".close").click(function(){
	
    $(".msg_box").hide();
});

$(".user").click(function(){
	
	
   $('.msg_box').show();
});

$(".arrow_down").click(function(){
	
    $(".msg_slideDown").slideToggle('slow');
	$(".arrow_up").show();
	$(".arrow_down").hide();
});

$(".arrow_up").click(function(){
	
    $(".msg_slideDown").slideToggle('slow');
	$(".arrow_up").hide();
	$(".arrow_down").show();
});


/*$('textarea').keypress(
    function(e){
        if (e.keyCode == 13) {
            var msg = $(this).val();
			$(this).val('');
			$("<div class='msg_b'>"+msg+"</div>").insertBefore('.msg_insert');
			$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
			
			//alert(msg);
			sendResponse(msg);
			sendResquest(msg);
			
        }
    });*/

		function sendRequest(msg) {
			var message = msg;
		        
			$.get('login.html?cmd=storeChatMessages&qOra=Question', {
		    	message : message        	      	
		    }, function(response) {			
		    	       
		    });		
		}
		

	
	
	function sendResponse1(msg) {
		var message = msg;
		
		$.get('login.html?cmd=storeChatMessages&qOra=Answer', {
        	message : message        	     	
        }, function(response) {			
        	       
        });		
    }

	
	
});

var searchType = null;
var tagSearchVal = null;
var userQuestion = null;
var userEmail = null;
var firstName = null;
var lastName = null;
var userQuery = null;

function sendUserRequest(fname,lname,msg,email) {
	firstName = fname;
	lastName = lname;
	userQuery = msg;
	var message = msg;
	var qOra = null;
	var ans = null;
	userEmail = email;
	var ques = null;
	$.get('storeChatMessages.html?chatProcess=storeChatMessages&user=User', {
    	message : message,
		email : email
    }, function(response) {			
    	       //alert(response);
    	if(response != null){
            $.each(response, function(index, value) {
            //alert( value + " is " + index );
            if(value[0] == "greg"){
         	   searchType = "greg";
				   //alert(value[1]);
				   qOra = value[1];
				   tagSearchVal = value[2];
         	   //return searchType;
            }else if(value[0] == "mark"){
         	   searchType = "mark";
				   //alert(value[1]);
				   qOra = value[1];
				   tagSearchVal = value[2];
         	   //return searchType;
            }else if(value[0] == "general"){
            	//alert(value[1]);
            	
            	searchType = "generalChat";
				
            	qOra = value[1];
				
				   tagSearchVal = value[2];
				  
				   
            }
            	else if(value[0] == "notfound"){
            
         	   searchType = "notfound";
				   //alert(value[1]);
				   qOra = "notfound";
         		   //return searchType;
            }else if(value[0] == "both"){
         	   searchType = "both";
				   //alert(value[1]);
         	  qOra = value[1]+"--"+value[2];
				   //qOra = value[1];
				   //alert("value[1]---"+value[1]);
				   //alert("value[2]---"+value[2]);
				   tagSearchVal = value[3];
         		   //return searchType;
				   userQuestion = qOra;
            }
        });
					
				   getLavlitaResponse(msg, email, searchType, qOra, tagSearchVal);
             } 
			 
			 
    });
}


	/* function getSearchValue(ques){
			//var message = ques;
			alert('message');
		    var output = null;
			
			$.get('SearchGeneralMsg.html?chatProcess=SearchXmlValue', {
		    	
				ques : ques
				
		    }, function(response) {	
			alert('inside function');
		    	if(response != null){
					alert('response'+response);
					var tempOut = response;
		    		 $("#temp").val(tempOut);
		    		alert('===> '+$("#temp").val());
					ques(tempOut);
	             } 
				 
	    });		
	//alert('--- '+output);
				//return output;
	*/
	
function myGregFunction(){
	//alert("testGreg");
	var gregQuery = null;
	gregQuery = userQuestion;
	var array = gregQuery.split('--');
	var a = array[0];
	//alert("gregQuery------->"+a);
	searchType = "greg";
	getLavlitaResponse(userQuestion, userEmail, 'greg', a, tagSearchVal);
}
function myMarkFunction(){
	//alert("testMark");
	var markQuery = null;
	markQuery = userQuestion;
	var array = markQuery.split('--');
	var b = array[0];
	//alert("markQuery------->"+b);
	searchType = "mark";
	getLavlitaResponse(userQuestion, userEmail, 'mark', b, tagSearchVal);
}
function getLavlitaResponse(msg, email, searchType, qOra, tagSearchVal) {
	var sendMsg = msg;
	
	//alert(qOra);
    //alert('sending response '+msg);
	//var urll = 'http://www.digiblitzonline2.com:8983/solr/exampledocs/select?indent=on&q=*'+msg+'*&wt=json';
	//window.location.assign(url);

//using xml call	
/*	//var parm1 = document.getElementById('q').value;
	var params = {q: sendMsg}
    $.ajax({
        type: "GET",
        url: "http://www.digiblitzonline2.com:8983/solr/exampledocs/select?indent=on&wt=xml",
		data: params,
        dataType: "xml",
        success: function(xml){
            $(xml).find('doc').each(function(){
            var sTitle = $(this).find('str').text();
            var sPublisher = $(this).find('arr').text();
            $("<div class='msg_a'>"+sTitle+", "+sPublisher+"</div>").insertBefore('.msg_insert');
			$('.msg_body').scrollTop($('.msg_body')[0].scrollHeight);
        });
        },
        error: function() {
        alert("An error occurred while processing XML file.");
        }
    });
	*/
	//alert("test");
	//alert("getLavlitaResponse---"+searchType);
	//using json call
	//alert("searchType----"+searchType);
	if(searchType == "both"){
			$("<div class='msg_a'><div class='other'><div class='avatar'><img src='jsp/LavlitaChatApp/images/lavlita.png' draggable=false'/></div><div class='msg'><p>Does your search related to Sales or technical?<br><input type='button' id='btnmark' value='Technical' onclick='myMarkFunction()'/>&nbsp;<input type='button' id='btngreg' value='Sales' onclick='myGregFunction()'/></p></div>").insertBefore('.msg_insert');
			 $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
		}/*else if(searchType == "general"){   
		
			
			$.get('SearchGeneralMsg.html?chatProcess=SearchXmlValue&ques='+qOra,
				function(response){
				//alert('success '+response);
			$("<div class='msg_a'><div class='other'><div class='avatar'><img src='jsp/LavlitaChatApp/images/lavlita.png' draggable=false'/></div><div class='msg'><p>" +response+ "</p></div>").insertBefore('.msg_insert');
			
			});
		}*/else{
		
	 $.getJSON("https://www.digiblitzonline2.com:8983/solr/"+searchType+"/select?indent=on&q="+qOra+"&rows=1&start=0&wt=json&json.wrf=?", function(result){
		//alert(JSON.stringify(result.response.numFound));
		var Parent = document.getElementById('rs');
		
		if(JSON.stringify(result.response.numFound) == 0){
			sendNoResponseToSupportTeam(email);
			$("<div class='other'><div class='avatar'><img src='jsp/LavlitaChatApp/images/lavlita.png' draggable=false'/></div><div class='msg'><div class='msg_a'><p>Sorry I do not understand, perhaps rephrase your question, or you can email support at care@digiblitz.com</p></div>").insertBefore('.msg_insert');
		 $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
		}else{
		for (var i = 0; i < result.response.docs.length; i++) {
		//var thisResult = "<b>"+(i+1)+". "+ result.response.docs[i].question + "</b><br>"+ result.response.docs[i].answer;
		var thisResult =  result.response.docs[i].answer;
		var textResult = result.response.docs[i].question + " " + result.response.docs[i].answer;
		//var textResult = (i+1)+". " + result.response.docs[i].answer;
		//alert(thisResult);
		/*var thisResult = "<b>Sno - "+(i+1)+" "+ result.response.docs[i].question + "</b><br>" + result.response.docs[i].answer
		  + ", " + result.response.docs[i].cat + "<br>";*/
		  //var NewDiv = document.createElement("DIV");
		  //NewDiv.innerHTML = thisResult;
		  //Parent.appendChild(NewDiv);
		  
		/*Removed double quoutes*/
		/*
		var thisResult = "<b>Sno - "+i+" "+ JSON.stringify(result.response.docs[i])+ "</b><br>";
		thisResult = thisResult.replace(/"/g, "");
		thisResult = thisResult.replace(/[{}]/g, "");
		thisResult = thisResult.replace(/[[]]/g, "");
		thisResult = thisResult.replace(/[\[\]']+/g,'')
		
		/**/
		
		$("<div class='other'><div class='avatar'><img src='jsp/LavlitaChatApp/images/lavlita.png' draggable=false'/></div><div class='msg'><div class='msg_a'><p>"+thisResult+"</p></div>").insertBefore('.msg_insert');
		 $('#scroll').scrollTop($('#scroll')[0].scrollHeight);
		sendLavlitaResponse(textResult, email);
		
		
		//filterSolrResponse(qOra, JSON.stringify(result.response.docs[i].question));
		}
		}
		
	});
		}
	
	
}

function filterSolrResponse(qOra, solrResponse){
	var filterRes = null;
	//alert("test filter");
	filterRes = solrResponse;
	filterRes = filterRes.replace(/\n/g, "");
	$.get('filterSolrResponse.html', {
    	solrResponse : filterRes,
    	keywords : qOra
    }, function(response) {			
    	       
    });	
}

function sendLavlitaResponse(msg,email) {
	var message = msg;
	//var qOra = 'Answer';
    
	$.get('storeChatMessages.html?chatProcess=storeChatMessages&user=Lavlita', {
    	message : message,
		email : email
    }, function(response) {			
    	       
    });		
}

function sendChatHistory(fname,lname,email) {
	var email = email;
	var fname = fname;
	var lname = lname;
	var localSearchType = searchType;
	var localSearchVal = tagSearchVal;
	//alert(fname+" "+lname+" " +email);
	//var qOra = 'Question';
    
	$.get('sendChatMessages.html?chatProcess=sendChatMessages', {
    	fname : fname,
    	lname : lname,
		email : email,
		searchType : localSearchType,
		tagSearchVal : localSearchVal
    }, function(response) {			
    	       
    });		
}

function sendNoResponseToSupportTeam(email) {

	//alert(firstName+" "+lastName+" " +email+" "+userQuery);
    
	$.get('sendNoResponseToSupportTeam.html?chatProcess=NoResponse', {
    	firstName : firstName,
    	lastName : lastName,
		email : email,
		userQuery : userQuery,
    }, function(response) {			
    	       
    });	

}




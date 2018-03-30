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
	     var txtval= document.getElementById(''+txtname).value;
		 if(isnotIntegerDecimal(txtval) == false)
		 {
	     	sum= Number(txtval) +sum;
		 }
		 else
		 {
			alert("Enter a valid Donation Amount");
			document.getElementById(''+txtname).focus();
			return false;
		 }
	  }
	}
	
	/*if(document.frmMembRegi.donAmt_sel.selectedIndex!=0)
	{if(document.frmMembRegi.donAmt_sel.value==5)
	 {sum = 5+sum;}
	 else if(document.frmMembRegi.donAmt_sel.value==10)
	 {sum= 10 + sum;}
	 else if(document.frmMembRegi.donAmt_sel.value==15)
	 {sum = 15 + sum;}
	  else if(document.frmMembRegi.donAmt_sel.value==20)
	 {sum = 20 + sum;}
	 else if(document.frmMembRegi.donAmt_sel.value==25)
	 {sum = 25 +sum;}
	 else if(document.frmMembRegi.donAmt_sel.value=="Others")
	 {sum = Number(document.frmMembRegi.donAmnt_txt.value)+ sum;}
	}
	if(document.frmMembRegi.selectmail.selectedIndex!=0)
 	{sum = Number(document.frmMembRegi.amountTwo_txt.value)+sum;}
	
	if(document.frmMembRegi.memTyp_sel.selectedIndex==2 || document.frmMembRegi.memTyp_sel.selectedIndex==6 )
	{sum= Number(document.frmMembRegi.famAdd_sel.value) * Number(document.frmMembRegi.addOnAmount.value) + sum;}
	
	/*var cbxct=document.frmMembRegi.cbxct.value
	
	for(i=0;i<cbxct;i++)
	{
		var cxname="document.frmMembRegi.cbx+i.checked";alert();
	if(document.frmMembRegi.cbx+i.checked)
	{
		sum=50+sum	;
	}
	
	}*/
	/*var val=document.frmMembRegi.memTyp_sel.value;
	sp=val.split("#");
		//alert(sp[1]);
	if(sp[1]!="Life Member" && sp[1]!="Full Member")
	{
		f = document.forms['frmMembRegi'].elements;	
		
		for(v=0 ; v< f.length; v++){
		if(f[v].type == "checkbox"){
			f[v].checked=false;
		}
		}
		
	}*/
	
	/* ====================== for renewal family addon chk bx price calc block =========== 
	
	var chkValue = "";
	e = document.forms['frmMembRegi'].elements;
	var count =0;
	for(i=0 ; i< e.length; i++){
		if(e[i].type == "checkbox"){
			//var chkBoxNameChk = e[i].value.substring(e[i].value.length-3,e[i].value.length);
			//alert(chkBoxNameChk);
			 if(e[i].checked == true) {
				 count++;
				 chkValue +=  e[i].value + "#";
			}
		}
	}*/
	//alert(count);
	var addonamt=document.frmMembRegi.addOnAmount.value;
	
	//alert(addonamt);
		
	//var tot=0;
	//tot=count*addonamt;
	//alert(tot);
	
	
	var ctryAmt=document.frmMembRegi.ctryAmt.value;//alert(Number(ctryAmt));
	sum=sum+Number(ctryAmt);
	
	var conval=document.frmMembRegi.memTyp_sel.value;//alert(conval);
//	if(document.frmMembRegi.memTyp_sel.selectedIndex!=0)
if(document.getElementById('memTyp_sel').value!="")
	{
	spval=conval.split("#");
	//alert(spval[1]);
	
	if(spval[1]=="Full Member" || spval[1]=="Life Member")
	{//alert("inside");
		var famMemb=document.frmMembRegi.famMemb.value;
		sum=sum+famMemb*addonamt;
	}
	}
		//sum=sum+tot;
		armBandPrice=document.frmMembRegi.armband.value;
		sum=sum+Number(armBandPrice);
		
	//--------- service charge -----------------
	
	if(document.frmMembRegi.cbxct.value!=0)
	{
		
	chksfx=0;
	var cbx="classification";
	ct= document.frmMembRegi.cbxct.value;
	
	for(i=0;i<ct;i++)
	{   
		var cbxname1=cbx+i;
    	if(document.getElementById(''+cbxname1).checked)
		{
			var chkdVal=document.getElementById(''+cbxname1).value;
			val=chkdVal.split("#");
			amt=val[2];
			sum = sum+Number(amt);
		}
		
		chksfx++;
	}
		
	}
	
	sum = format(sum,2);
	document.frmMembRegi.totalAmount.value= sum;
	//alert("sum:"+sum);
	
	var s = document.getElementById('totalAmount').value;
	  if(s.indexOf('.')==-1){
		s= s+".00";
		document.getElementById('totalAmount').value=s;
	  }
	  if(s.indexOf('.')!=-1){
		var t = s.substring(s.indexOf('.'));
			//alert(t.length);
			if(t.length==2){
			s=s+"0";
			document.getElementById('totalAmount').value=s;
			}
	  }
	

	
}
function format(obj, decimal) {
	//alert("obj" +obj);
 //decimal  - the number of decimals after the digit from 0 to 3
//-- Returns the passed number as a string in the xxx,xxx.xx format.
	   anynum=eval(obj);
	   divider =10;
	   switch(decimal){
			case 0:
				divider =1;
				break;
			case 1:
				divider =10;
				break;
			case 2:
				divider =100;
				break;
			default:  	 //for 3 decimal places
				divider =1000;
		}

	   workNum=Math.abs((Math.round(anynum*divider)/divider));

	   workStr=""+workNum

	   if (workStr.indexOf(".")==-1){workStr+="."}

	   dStr=workStr.substr(0,workStr.indexOf("."));dNum=dStr-0
	   pStr=workStr.substr(workStr.indexOf("."))

	   while (pStr.length-1< decimal){pStr+="0"}

	   if(pStr =='.') pStr ='';

	   //--- Adds a comma in the thousands place.    
	   /*if (dNum>=1000) {
		  dLen=dStr.length
		  dStr=parseInt(""+(dNum/1000))+","+dStr.substring(dLen-3,dLen)
	   }

	   //-- Adds a comma in the millions place.
	   if (dNum>=1000000) {
		  dLen=dStr.length
		  dStr=parseInt(""+(dNum/1000000))+","+dStr.substring(dLen-7,dLen)
	   }*/
	   retval = dStr + pStr
	   //-- Put numbers in parentheses if negative.
	   if (anynum<0) {retval="("+retval+")";}

	  
	//You could include a dollar sign in the return value.
	  //retval =  "$"+retval
	  //alert("retval" + retval);
	  return retval;
 }
//--------------------------------------------------------------------------------
//-------------------function for character validation in Names and City--------------------
function isnotName(str){
stringCheck="!@#$%^&*()_+|<>?/=~,0123456789;:][{}"+"\\";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}
//--------------------------------------------------------------------------------
//-------------------function for character validation--------------------
function isnotAlpha(str){
stringCheck="!@#$%^&*()_+|<>?/=-~.,`0123456789;:][{}"+"\\"+"\'";
f1=1;
for(j=0;j<str.length;j++)
{ if(stringCheck.indexOf(str.charAt(j))!=-1)
   { f1=0;}}
if(f1==0)
{ return true; }else {return false;}
}
//---------------------------------------------------------------------------------------	
//------------------for chk date------------------------------------------------------------------------

function isnotAlphaNumeric1(str){
stringAlphaNumCheck="!@#$%^&*()_+|<>?=~-`.,;:][{}"+"\\";
f3=1;
for(j=0;j<str.length;j++)
{if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1)
{f3=0;}}
if(f3==0)
{return true;}else{return false;}
}

//------------------------function for Alpha Numeric
function isnotAlphaNumeric(str){
stringAlphaNumCheck="!@#$%^&*()_+|<>?/=~,;:][{}"+"\\";
f3=1;
for(j=0;j<str.length;j++)
{if(stringAlphaNumCheck.indexOf(str.charAt(j))!=-1)
{f3=0;}}
if(f3==0)
{return true;}else{return false;}
}
//----------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------
//--------------------------------function for Valid Email
function isnotVlaidEmail(str){
			 strmail=str;
			 firstat = strmail.indexOf("@");
			 lastat = strmail.lastIndexOf("@");
			 strmain=strmail.substring(0,firstat);
			 strsub=strmail.substring(firstat,str.length);
			 flag=false;
			 if(strmail.length>120)
			 { flag=true;//alert("1");
			 }
			 if(strmain.indexOf('  ')!=-1 || firstat==0 || firstat!=lastat || strsub.indexOf(' ')!=-1 )
			 {flag=true;}

			stringMailCheck1="!#$%^&*()+|<>?/=~,;:][{}"+"\\"+"\'"+"\"";
			f3=1;
			for(j=0;j<strsub.length;j++)
			{if(stringMailCheck1.indexOf(strsub.charAt(j))!=-1)
			{f3=0;}}
			if(f3==0)
			{flag=true;}

			stringMailCheck2="!@#$%^&*()+|<>?/=~,;:][{}"+"\\"+"\'"+"\"";
			f4=1;
			for(j=0;j<strmain.length;j++)
			{if(stringMailCheck2.indexOf(strmain.charAt(j))!=-1)
			{f4=0;}}
			if(f4==0)
			{flag=true;}
			
			 k=0;
			 strlen=strsub.length;
			 for(i=0;i<strlen-1;i++)
			 { if(strsub.charAt(i)=='.')
			 {k=k+1;}}
			 if(k>3)
			 { flag=true;}
			 if(firstat==-1 || lastat==-1)
			 {flag=true;}
			 if(Number(strmain))
			 {flag=true;}
			 if(firstat != lastat )
			 {flag=true;}
			 firstdot=strmail.indexOf(".",firstat);
			 lastdot=strmail.lastIndexOf(".");
			 if(firstdot == -1 || lastdot == -1 || lastdot==strmail.length-1)
			 {flag=true;}
			
			return flag;
}
//-----------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------------
//-----------------------function for pure Integer Numbers
function isnotInteger(str){
stringIntCheck="0123456789";
f2=1;
for(j=0;j<str.length;j++)
{ if(stringIntCheck.indexOf(str.charAt(j))==-1)
 {f2=0;}}
if(f2==0)
{return true;} else { return false;}
}
//-----------------------------------------------------------------------------------------------
//---------------------------------------------------------------------------------
//-------------for dynamic value to textbox
//---------------------------------------------------------------------------------
function checkclear(){
		document.frmMembRegi.checkNo.value="";
		document.frmMembRegi.inFavorof.value="";
		document.frmMembRegi.nameOnchk.value="";
    var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	document.frmMembRegi.checkDate.value = nowMonth+"/"+nowDate+"/"+nowYear;
}

function cardclear(){
		document.frmMembRegi.cardselect.selectedIndex=0;
		document.frmMembRegi.cardNo.value="";
		document.frmMembRegi.cVVNo.value="";
		document.frmMembRegi.printName.value="";
		document.frmMembRegi.expirymonth.selectedIndex=0;
		document.frmMembRegi.expiryyear.selectedIndex=0;
}
//==============================================Amateur Check box validation====================
 function tempValidate()
{
if(document.frmMembRegi.amatCrdPoss.checked==false && document.frmMembRegi.amatCrdElig.checked==false){
	document.frmMembRegi.nameAmat.value="";
	return false;
	}
	else{
	document.frmMembRegi.nameAmat.value;
	return false;
	} 

return true;  
}

//==============================================Amateur Check box validation for family One====================
 function tempValidate1()
{
if(document.frmMembRegi.amatCrdPoss1.checked==false && document.frmMembRegi.amatCrdElig1.checked==false){
	document.frmMembRegi.nameAmat1.value="";
	return false;
	}
	else{
	document.frmMembRegi.nameAmat1.value;
	return false;
	} 

return true;  
}

//==============================================Amateur Check box validation for family Two====================
 function tempValidate2()
{
if(document.frmMembRegi.amatCrdPoss2.checked==false && document.frmMembRegi.amatCrdElig2.checked==false){
	document.frmMembRegi.nameAmat2.value="";
	return false;
	}
	else{
	document.frmMembRegi.nameAmat2.value;
	return false;
	} 

return true;  
}

//==============================================Amateur Check box validation for family Three====================
 function tempValidate3()
{
if(document.frmMembRegi.amatCrdPoss3.checked==false && document.frmMembRegi.amatCrdElig3.checked==false){
	document.frmMembRegi.nameAmat3.value="";
	return false;
	}
	else{
	document.frmMembRegi.nameAmat3.value;
	return false;
	} 

return true;  
}
//==============================================Amateur Check box validation for family Four====================
 function tempValidate4()
{
if(document.frmMembRegi.amatCrdPoss4.checked==false && document.frmMembRegi.amatCrdElig4.checked==false){
	document.frmMembRegi.nameAmat4.value="";
	return false;
	}
	else{
	document.frmMembRegi.nameAmat4.value;
	return false;
	} 

return true;  
}
//-----------------------------------------------------------------------------------------------
//---------------------------------function for Family Member Add On------------------------
function MemberoneValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member One-----------
	 if(document.frmMembRegi.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmMembRegi.selectSalute1.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmMembRegi.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if((document.frmMembRegi.firstname1.value.indexOf('  ')!=-1)||(document.frmMembRegi.firstname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmMembRegi.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if((document.frmMembRegi.middlename1.value.indexOf('  ')!=-1)||(document.frmMembRegi.middlename1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmMembRegi.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");

	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if((document.frmMembRegi.lastname1.value.indexOf('  ')!=-1)||(document.frmMembRegi.lastname1.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	 if(document.frmMembRegi.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmMembRegi.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmMembRegi.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmMembRegi.selectDay1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");

	 document.frmMembRegi.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmMembRegi.selectYear1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmMembRegi.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmMembRegi.gender1[i1].checked)
		{	chosen1= document.frmMembRegi.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone1.value=="" && document.frmMembRegi.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmMembRegi.phone2.value!="")
{		var s1=document.frmMembRegi.phone1.value.indexOf('(');
		var s2=document.frmMembRegi.phone1.value.indexOf(')');
		var s5=document.frmMembRegi.phone1.value.indexOf('+');
		var s6=document.frmMembRegi.phone1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone1.value.indexOf('-');
		var s8=document.frmMembRegi.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
																					  
 len7=document.frmMembRegi.phone1.value.length;
 strnum = document.frmMembRegi.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmMembRegi.phone1.focus();
 return false;}
 if(document.frmMembRegi.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/

	var s1=document.frmMembRegi.fax1.value.indexOf('(');
		var s2=document.frmMembRegi.fax1.value.indexOf(')');
		var s5=document.frmMembRegi.fax1.value.indexOf('+');
		var s6=document.frmMembRegi.fax1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax1.value.indexOf('-');
		var s8=document.frmMembRegi.fax1.value.lastIndexOf('-');

		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}

 len7=document.frmMembRegi.fax1.value.length;
 strnum = document.frmMembRegi.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmMembRegi.fax1.focus();
 return false;}
 
 if(document.frmMembRegi.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmMembRegi.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmMembRegi.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	 
return true;
}
function MembertwoValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member two-----------
	 if(document.frmMembRegi.selectSalute2.selectedIndex==0)
	 {alert("Select a salutation in Family Member two");
	 document.frmMembRegi.selectSalute2.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmMembRegi.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if((document.frmMembRegi.firstname2.value.indexOf('  ')!=-1)||(document.frmMembRegi.firstname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmMembRegi.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if((document.frmMembRegi.middlename2.value.indexOf('  ')!=-1)||(document.frmMembRegi.middlename2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmMembRegi.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if((document.frmMembRegi.lastname2.value.indexOf('  ')!=-1)||(document.frmMembRegi.lastname2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmMembRegi.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmMembRegi.suffix2.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	if((document.frmMembRegi.suffix2.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmMembRegi.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmMembRegi.selectDay2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmMembRegi.selectYear2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmMembRegi.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmMembRegi.gender2[i2].checked)
		{	chosen2= document.frmMembRegi.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmMembRegi.phone2.value=="" && document.frmMembRegi.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmMembRegi.phone2.value!="")
{		var s1=document.frmMembRegi.phone2.value.indexOf('(');

		var s2=document.frmMembRegi.phone2.value.indexOf(')');
		var s5=document.frmMembRegi.phone2.value.indexOf('+');
		var s6=document.frmMembRegi.phone2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone2.value.indexOf('-');
		var s8=document.frmMembRegi.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
																					  
 len7=document.frmMembRegi.phone2.value.length;
 strnum = document.frmMembRegi.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmMembRegi.phone2.focus();
 return false;}
 if(document.frmMembRegi.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
if(isnotInteger(document.frmMembRegi.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmMembRegi.mobile2.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/

	var s1=document.frmMembRegi.fax2.value.indexOf('(');
		var s2=document.frmMembRegi.fax2.value.indexOf(')');
		var s5=document.frmMembRegi.fax2.value.indexOf('+');
		var s6=document.frmMembRegi.fax2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax2.value.indexOf('-');
		var s8=document.frmMembRegi.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s5!==s6){

			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}

 len7=document.frmMembRegi.fax2.value.length;
 strnum = document.frmMembRegi.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmMembRegi.fax2.focus();
 return false;}
 
 if(document.frmMembRegi.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmMembRegi.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmMembRegi.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
return true;
}
//----------------------------------------------------------------------------------------

function MemberthreeValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member three-----------
	 if(document.frmMembRegi.selectSalute3.selectedIndex==0)
	 {alert("Select a salutation in Family Member three");
	 document.frmMembRegi.selectSalute3.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmMembRegi.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(document.frmMembRegi.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if((document.frmMembRegi.firstname3.value.indexOf('  ')!=-1)||(document.frmMembRegi.firstname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmMembRegi.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if((document.frmMembRegi.middlename3.value.indexOf('  ')!=-1)||(document.frmMembRegi.middlename3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmMembRegi.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(document.frmMembRegi.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if((document.frmMembRegi.lastname3.value.indexOf('  ')!=-1)||(document.frmMembRegi.lastname3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}

//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmMembRegi.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmMembRegi.suffix3.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	if((document.frmMembRegi.suffix3.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmMembRegi.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmMembRegi.selectDay3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmMembRegi.selectYear3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmMembRegi.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmMembRegi.gender3[i3].checked)
		{	chosen3= document.frmMembRegi.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone3.value=="" && document.frmMembRegi.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmMembRegi.phone3.value!="")
{		var s1=document.frmMembRegi.phone3.value.indexOf('(');
		var s2=document.frmMembRegi.phone3.value.indexOf(')');
		var s5=document.frmMembRegi.phone3.value.indexOf('+');
		var s6=document.frmMembRegi.phone3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone3.value.indexOf('-');
		var s8=document.frmMembRegi.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
																					  
 len7=document.frmMembRegi.phone3.value.length;
 strnum = document.frmMembRegi.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmMembRegi.phone3.focus();
 return false;}
 if(document.frmMembRegi.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
if(isnotInteger(document.frmMembRegi.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmMembRegi.mobile3.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/

	var s1=document.frmMembRegi.fax3.value.indexOf('(');
		var s2=document.frmMembRegi.fax3.value.indexOf(')');
		var s5=document.frmMembRegi.fax3.value.indexOf('+');
		var s6=document.frmMembRegi.fax3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax3.value.indexOf('-');
		var s8=document.frmMembRegi.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}

 len7=document.frmMembRegi.fax3.value.length;
 strnum = document.frmMembRegi.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmMembRegi.fax3.focus();
 return false;}
 
 if(document.frmMembRegi.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmMembRegi.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmMembRegi.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
return true;
}
function MemberfourValidate(){
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member four-----------
	 if(document.frmMembRegi.selectSalute4.selectedIndex==0)
	 {alert("Select a salutation in Family Member four");
	 document.frmMembRegi.selectSalute4.focus();
	 return false;}
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member four--------

	if(document.frmMembRegi.firstname4.value=="")
	{alert("Enter First Name of Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if(document.frmMembRegi.firstname4.value.length>80)
	{alert("Enter valid First Name of Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname4.value))
	{alert("Enter a valid First Name in Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if((document.frmMembRegi.firstname4.value.indexOf('  ')!=-1)||(document.frmMembRegi.firstname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid First Name in Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member four-------------------------------------
	if(document.frmMembRegi.middlename4.value.length>80)
	{alert("Enter Middle Name of Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename4.value))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
	if((document.frmMembRegi.middlename4.value.indexOf('  ')!=-1)||(document.frmMembRegi.middlename4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member four------------------------
	if(document.frmMembRegi.lastname4.value=="")
	{alert("Enter Last Name of Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if(document.frmMembRegi.lastname4.value.length>80)
	{alert("Enter valid Last Name of Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname4.value))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if((document.frmMembRegi.lastname4.value.indexOf('  ')!=-1)||(document.frmMembRegi.lastname4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member four-----------------------
	/*if(document.frmMembRegi.suffix4.value=="")
	{alert("Enter Suffix in Family Member four");
	 document.frmMembRegi.suffix4.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix4.value.length>80)
	{alert("Enter valid Suffix of Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix4.value))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}
	if((document.frmMembRegi.suffix4.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member four-----------
	if(document.frmMembRegi.selectMonth4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectMonth4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member four-----------
	if(document.frmMembRegi.selectDay4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectDay4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member four-----------
	if(document.frmMembRegi.selectYear4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectYear4.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member four--------------------------
	chosen4="";
	len4 = document.frmMembRegi.gender4.length ;
	for(i4=0;i4<len4;i4++){
		if(document.frmMembRegi.gender4[i4].checked)
		{	chosen4= document.frmMembRegi.gender4[i4].value;	}	}

	if(chosen4=="")
	{	alert("Check any of Gender Option in Family Member four.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone4.value=="" && document.frmMembRegi.mobile4.value=="" )
{ alert("Enter a Contact Number in Family Member four");
  document.frmMembRegi.phone4.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member four --------------


if(document.frmMembRegi.phone4.value!="")
{		var s1=document.frmMembRegi.phone4.value.indexOf('(');
		var s2=document.frmMembRegi.phone4.value.indexOf(')');
		var s5=document.frmMembRegi.phone4.value.indexOf('+');
		var s6=document.frmMembRegi.phone4.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone4.value.indexOf('-');
		var s8=document.frmMembRegi.phone4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
																					  
 len7=document.frmMembRegi.phone4.value.length;
 strnum = document.frmMembRegi.phone4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member four");
 document.frmMembRegi.phone4.focus();
 return false;}
 if(document.frmMembRegi.phone4.value.length>40)
  {alert("Enter valid Phone Number in Family Member four");
  document.frmMembRegi.phone4.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member four----------------
if(isnotInteger(document.frmMembRegi.mobile4.value))
{alert("Enter a valid Mobile Number in Family Member four.");
document.frmMembRegi.mobile4.focus();
return false;}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/

	var s1=document.frmMembRegi.fax4.value.indexOf('(');
		var s2=document.frmMembRegi.fax4.value.indexOf(')');
		var s5=document.frmMembRegi.fax4.value.indexOf('+');
		var s6=document.frmMembRegi.fax4.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax4.value.indexOf('-');
		var s8=document.frmMembRegi.fax4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}

 len7=document.frmMembRegi.fax4.value.length;
 strnum = document.frmMembRegi.fax4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member four");
 document.frmMembRegi.fax4.focus();
 return false;}
 
 if(document.frmMembRegi.fax4.value.length>40)
  {alert("Enter valid Fax in Family Member four");
  document.frmMembRegi.fax4.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member four-------------------------
	if(document.frmMembRegi.email4.value=="")
	{alert("Enter Email in Family Member four");
	 document.frmMembRegi.email4.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email4.value))
	{alert("Enter a valid Email in Family Member four");
	 document.frmMembRegi.email4.focus();
	 return false;}
return true;
}
	 
function clrAmt()
{
	document.frmMembRegi.amountTwo_txt.value=0;	
	
	var n = document.frmMembRegi.pub_ct.value;
	
	for(i=0;i<n;i++){
	var str="mailOpt1"+i;
	document.getElementById(''+str).checked=false;
	
}
}
	 
function myvalidate(){
	totalDonation();
//-----------------------------------------------------------------------------------------
//--------------------------for Membership Type Select

	//if(document.frmMembRegi.memTyp_sel.selectedIndex==0)
	if(document.frmMembRegi.membTypes.value=="")
	{alert("Select any of the Membership Type");
	document.frmMembRegi.membTypes.focus();
	return false;}

if(document.getElementById('regiSect').value==0){
	var flg =0;
	if(document.frmMembRegi.regiOpt[0].checked ==true){
		flg=0;
	}
	else if(document.frmMembRegi.regiOpt[1].checked ==true){
		flg=0;		
	}
	else{
		flg=1;
	}
	if(flg==1){
		alert('Select any one of the membership year to register');
		document.frmMembRegi.membTypes.focus();
		return false;
	}
}
	//---------------------for Family Member ------------------------------------------
	
	/*var mem=document.frmMembRegi.memTyp_sel.value;
	seltyp=mem.split("#");
	var selec=seltyp[1];
	alert(selec);
	
	if(selec=="Family Member")
	{if(document.frmMembRegi.memberid.value=="" && document.frmMembRegi.memberid.indexOf(" ")==0)
	{alert("Enter Member Id ");
	 document.frmMembRegi.memberid.focus();
	 return false;
	 }
	}
	 if(isnotAlphaNumeric(document.frmMembRegi.memberid.value))
	{alert("Enter valid Member Id ");
	 document.frmMembRegi.memberid.focus();
	 return false;}
	if(document.frmMembRegi.memberid.value.length>80)
	{alert("Enter valid Member Id ");
	 document.frmMembRegi.memberid.focus();
	 return false;}
	
	}*/
	
	//--------------------------for non hlc  Membership Id  
    chbxnum1=document.frmMembRegi.orgCbxCt.value;
   for(i=0;i<chbxnum1;i++)
	{ chbxname = "orgNameCbx"+i;
	  txtname="orgNameTxtId"+i;
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
		/* if(txtval=="" ||txtval==0)
		  {alert("Enter the Non HLC Organization Member Id");
		  document.getElementById(''+txtname).focus();
		  return false;}*/
		  /*alert(document.getElementById(''+txtname).length);
		  if(document.getElementById(''+txtname).length>20)
		  {
			  alert("Non HLC Organization Member Id exceeds the Range");
		  	  document.getElementById(''+txtname).focus();
			  return false;
		  
		  }*/
		 // alert(chbxname);
		
	  }
	  //return false;
	}
	
	
	//------------------------------for Donation Amount
	
	
	  chbxnum2=document.frmMembRegi.donCbxCt.value;
    //alert(chbxnum2);
	for(i=0;i<chbxnum2;i++)
	{ chbxname = "donCb"+i;
	  txtname="donTb"+i;
	  dontxtname="donNametb"+i;
	  
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  var txtval= document.getElementById(''+txtname).value;
		 if(txtval=="" ||txtval==0)
		  {alert("Enter the Donation Amount");
		  document.getElementById(''+txtname).focus();
		  return false;}
		 // alert(chbxname);
		 if(!Number(txtval))
		 {alert("Enter valid Donation Amount");
		  document.getElementById(''+txtname).focus();
		  return false;}
		   
		  if(document.getElementById(''+dontxtname).value=="" || document.getElementById(''+dontxtname).value.indexOf(" ")==0)
		  {alert("Enter the Donation Name");
		  document.getElementById(''+dontxtname).focus();
		  return false;}
		  
	  }
	  // return false;
	}
	
//-----------------------------------------------------------------------------------------
//--------------------------for Membership Id  

/*	if(document.frmMembRegi.selectmemType.selectedIndex!=0)
	{if(document.frmMembRegi.memid.value=="")
	{alert("Enter a MemberID");
	document.frmMembRegi.memid.focus();
	return false;} }
	//alert(document.frmMembRegi.famAdd_sel.value);*/
	
	//---------------------for don amt others ------------------------------------------
	/*if(document.frmMembRegi.donAmt_sel.value=="Others")
	{
		if(document.frmMembRegi.otherdon.value=="" || document.frmMembRegi.otherdon.value==0)
		{
			alert("Enter A Donation Amount");
			document.frmMembRegi.otherdon.focus();
			return false;
		}
	}*/
	
	
	//-------------------------- for family member parent id ---------------------
	
	//alert(document.frmMembRegi.memTyp_sel.value);
	var conval=document.frmMembRegi.memTyp_sel.value;
	spval=conval.split("#");
	//alert(spval[1]);
	


	if(spval[1]=="Family Member")
	{//alert("inside");
		if(document.frmMembRegi.memberid.value=="")
		{
			alert("Enter the Parent Id");
			document.frmMembRegi.memberid.focus();
			return false;
		}
		
		if(document.frmMembRegi.memberid.value.indexOf(' ')==0)
		{
			alert("Enter a valid Parent Id");
			document.frmMembRegi.memberid.focus();
			return false;
		}
		
		if(document.frmMembRegi.confFam_Id.checked==false){
		alert("Please ensure that you are confirmed to Full/Life member.");
		document.frmMembRegi.confFam_Id.focus();
		return false;
	}
	
	}


if(spval[1] != "Subscribing Member" && spval[1] != "Non-Competing Member")
	{
		if(document.frmMembRegi.nameAmat.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat.focus();
			return false;	
		}
if(document.frmMembRegi.nameAmat.value!=""){
  if(document.frmMembRegi.amatCrdPoss.checked==false && document.frmMembRegi.amatCrdElig.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section");
   document.frmMembRegi.nameAmat.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss.checked==true || document.frmMembRegi.amatCrdElig.checked==true){
	if(document.frmMembRegi.nameAmat.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration");
	document.frmMembRegi.nameAmat.focus();
    return false;
	}
	} 		
		
				
	}
	
	if(document.frmMembRegi.famAdd_sel.value == 1)
	{
	if(document.frmMembRegi.nameAmat1.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat1.focus();
			return false;	
		}
  if(document.frmMembRegi.nameAmat1.value!=""){
  if(document.frmMembRegi.amatCrdPoss1.checked==false && document.frmMembRegi.amatCrdElig1.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member One");
   document.frmMembRegi.nameAmat1.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss1.checked==true || document.frmMembRegi.amatCrdElig1.checked==true){
	if(document.frmMembRegi.nameAmat1.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member One");
	document.frmMembRegi.nameAmat1.focus();
    return false;
	}
	} 		
		
	}
	
	if(document.frmMembRegi.famAdd_sel.value == 2)
	{
		if(document.frmMembRegi.nameAmat1.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat1.focus();
			return false;	
		}
		
if(document.frmMembRegi.nameAmat1.value!=""){
  if(document.frmMembRegi.amatCrdPoss1.checked==false && document.frmMembRegi.amatCrdElig1.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member One");
   document.frmMembRegi.nameAmat1.focus();
    return false;
	 } 
     }
	 
	if(document.frmMembRegi.amatCrdPoss1.checked==true || document.frmMembRegi.amatCrdElig1.checked==true){
	if(document.frmMembRegi.nameAmat1.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member One");
	document.frmMembRegi.nameAmat1.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat2.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat2.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat2.value!=""){
  if(document.frmMembRegi.amatCrdPoss2.checked==false && document.frmMembRegi.amatCrdElig2.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Two");
   document.frmMembRegi.nameAmat2.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss2.checked==true || document.frmMembRegi.amatCrdElig2.checked==true){
	if(document.frmMembRegi.nameAmat2.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Two");
	document.frmMembRegi.nameAmat2.focus();
    return false;
	}
	}
		
	}
	
	if(document.frmMembRegi.famAdd_sel.value == 3)
	{
		if(document.frmMembRegi.nameAmat1.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat1.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat1.value!=""){
  if(document.frmMembRegi.amatCrdPoss1.checked==false && document.frmMembRegi.amatCrdElig1.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member One");
   document.frmMembRegi.nameAmat1.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss1.checked==true || document.frmMembRegi.amatCrdElig1.checked==true){
	if(document.frmMembRegi.nameAmat1.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member One");
	document.frmMembRegi.nameAmat1.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat2.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat2.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat2.value!=""){
  if(document.frmMembRegi.amatCrdPoss2.checked==false && document.frmMembRegi.amatCrdElig2.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Two");
   document.frmMembRegi.nameAmat2.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss2.checked==true || document.frmMembRegi.amatCrdElig2.checked==true){
	if(document.frmMembRegi.nameAmat2.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Two");
	document.frmMembRegi.nameAmat2.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat3.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat3.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat3.value!=""){
  if(document.frmMembRegi.amatCrdPoss3.checked==false && document.frmMembRegi.amatCrdElig3.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Three");
   document.frmMembRegi.nameAmat3.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss3.checked==true || document.frmMembRegi.amatCrdElig3.checked==true){
	if(document.frmMembRegi.nameAmat3.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Three");
	document.frmMembRegi.nameAmat3.focus();
    return false;
	}
	}
	
	}
	
	if(document.frmMembRegi.famAdd_sel.value == 4)
	{
		if(document.frmMembRegi.nameAmat1.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat1.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat1.value!=""){
  if(document.frmMembRegi.amatCrdPoss1.checked==false && document.frmMembRegi.amatCrdElig1.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member One");
   document.frmMembRegi.nameAmat1.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss1.checked==true || document.frmMembRegi.amatCrdElig1.checked==true){
	if(document.frmMembRegi.nameAmat1.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member One");
	document.frmMembRegi.nameAmat1.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat2.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat2.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat2.value!=""){
  if(document.frmMembRegi.amatCrdPoss2.checked==false && document.frmMembRegi.amatCrdElig2.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Two");
   document.frmMembRegi.nameAmat2.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss2.checked==true || document.frmMembRegi.amatCrdElig2.checked==true){
	if(document.frmMembRegi.nameAmat2.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Two");
	document.frmMembRegi.nameAmat2.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat3.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat3.focus();
			return false;	
		}
		
if(document.frmMembRegi.nameAmat3.value!=""){
  if(document.frmMembRegi.amatCrdPoss3.checked==false && document.frmMembRegi.amatCrdElig3.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Three");
   document.frmMembRegi.nameAmat3.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss3.checked==true || document.frmMembRegi.amatCrdElig3.checked==true){
	if(document.frmMembRegi.nameAmat3.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Three");
	document.frmMembRegi.nameAmat3.focus();
    return false;
	}
	}
		
		if(document.frmMembRegi.nameAmat4.value.length>80)
		{
			alert("Amateure Name Range Exceeds 80 Char.");
			document.frmMembRegi.nameAmat4.focus();
			return false;	
		}
		
		if(document.frmMembRegi.nameAmat4.value!=""){
  if(document.frmMembRegi.amatCrdPoss4.checked==false && document.frmMembRegi.amatCrdElig4.checked==false){
   alert("Check the proper option(s) in the Amateur Rider section for Family Member Four");
   document.frmMembRegi.nameAmat4.focus();
    return false;
	 }
     }
	 
	if(document.frmMembRegi.amatCrdPoss4.checked==true || document.frmMembRegi.amatCrdElig4.checked==true){
	if(document.frmMembRegi.nameAmat4.value==""){
	alert("Enter Amateur name in Amateur Rider Declaration for Family Member Four");
	document.frmMembRegi.nameAmat4.focus();
    return false;
	}
	}
	
	}
//========================================================================================================
//===============================for One Family Member Add on
	if(document.frmMembRegi.famAdd_sel.value == 1)
	{

//------------------------for Registry Option in Family Member One--------------------------
	/*chosenmem1="";
	lenmem1 = document.frmMembRegi.famUser1.length ;
	for(i1=0;i1<lenmem1;i1++){
		if(document.frmMembRegi.famUser[i1].checked)
		{	chosen1= document.frmMembRegi.famUser[i1].value;	}	}

	if(chosenmem1=="")
	{	alert("Check the registration Option in Family Member One.");
		return false; }*/
	/*if(chosenmem1=="no")
	{ */
	//alert(document.frmMembRegi.famUser1[1].checked);
	
	if(document.frmMembRegi.famUser1[0].checked==true)
	{ if(document.frmMembRegi.memberAdd1.value=="" || document.frmMembRegi.memberAdd1.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member One");
	   document.frmMembRegi.memberAdd1.focus();
	
	   return false;}
	}
	
	if(document.frmMembRegi.famUser1[2].checked==true)
	{ 
//-----------------------------for Salutation for Family Member One-----------
	/* if(document.frmMembRegi.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmMembRegi.selectSalute1.focus();
	 return false;}
	 */
//--------------------------------for First Name in Family Member One--------

	if(document.frmMembRegi.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	
	if(isnotName(document.frmMembRegi.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmMembRegi.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if((document.frmMembRegi.middlename1.value.indexOf('  ')!=-1))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmMembRegi.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if((document.frmMembRegi.lastname1.value.indexOf('  ')!=-1))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	 if(document.frmMembRegi.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmMembRegi.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmMembRegi.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmMembRegi.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmMembRegi.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmMembRegi.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmMembRegi.gender1[i1].checked)
		{	chosen1= document.frmMembRegi.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone1.value=="" && document.frmMembRegi.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmMembRegi.phone1.value!="")
{
	/*
		var s1=document.frmMembRegi.phone1.value.indexOf('(');
		var s2=document.frmMembRegi.phone1.value.indexOf(')');
		var s5=document.frmMembRegi.phone1.value.indexOf('+');
		var s6=document.frmMembRegi.phone1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone1.value.indexOf('-');
		var s8=document.frmMembRegi.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		} */																					  
 len7=document.frmMembRegi.phone1.value.length;
 strnum = document.frmMembRegi.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmMembRegi.phone1.focus();
 return false;}
 if(document.frmMembRegi.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

if(document.frmMembRegi.mobile1.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile1.value.length;
 strnum = document.frmMembRegi.mobile1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile1.focus();
 return false;}
 if(document.frmMembRegi.mobile1.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile1.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax1.value.indexOf('(');
		var s2=document.frmMembRegi.fax1.value.indexOf(')');
		var s5=document.frmMembRegi.fax1.value.indexOf('+');
		var s6=document.frmMembRegi.fax1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax1.value.indexOf('-');
		var s8=document.frmMembRegi.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax1.value.length;
 strnum = document.frmMembRegi.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmMembRegi.fax1.focus();
 return false;}
 
 if(document.frmMembRegi.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmMembRegi.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmMembRegi.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	 
	 //-------------------for User Name in Family Member One ----
/*alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");

 document.frmMembRegi.loginName1.focus();
 return false;}

if(document.frmMembRegi.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName1.value)|| document.frmMembRegi.loginName1.value.length > 25 || document.frmMembRegi.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmMembRegi.loginName1.focus();
 return false;}*/

	}
	
	if(document.frmMembRegi.famUser1[1].checked==true)
	{ if(document.frmMembRegi.userNameId1.value=="" || document.frmMembRegi.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmMembRegi.userNameId1.focus();
	
	   return false;}

	}
	
	}
	
	
//--------------------------------------------------------------------------------
//-----------------------for two Members Add on------------------------
if(document.frmMembRegi.famAdd_sel.value == 2)
	{
	//------------------------------------------------------------------------------------------

	if(document.frmMembRegi.famUser1[0].checked==true)
	{ if(document.frmMembRegi.memberAdd1.value=="" || document.frmMembRegi.memberAdd1.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member One");
	   document.frmMembRegi.memberAdd1.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser1[2].checked==true)
	{
		//-----------------------------for Salutation for Family Member One-----------
	/* if(document.frmMembRegi.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmMembRegi.selectSalute1.focus();
	 return false;}
	*/
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmMembRegi.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member One2");
	document.frmMembRegi.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmMembRegi.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(document.frmMembRegi.middlename1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmMembRegi.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmMembRegi.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmMembRegi.suffix1.focus();
	return false;}
	
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmMembRegi.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmMembRegi.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmMembRegi.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmMembRegi.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmMembRegi.gender1[i1].checked)
		{	chosen1= document.frmMembRegi.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone1.value=="" && document.frmMembRegi.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmMembRegi.phone1.value!="")
{		
		/*
		var s1=document.frmMembRegi.phone1.value.indexOf('(');
		var s2=document.frmMembRegi.phone1.value.indexOf(')');
		var s5=document.frmMembRegi.phone1.value.indexOf('+');
		var s6=document.frmMembRegi.phone1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone1.value.indexOf('-');
		var s8=document.frmMembRegi.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();

			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		*/
										
 len7=document.frmMembRegi.phone1.value.length;
 strnum = document.frmMembRegi.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmMembRegi.phone1.focus();
 return false;}
 if(document.frmMembRegi.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

if(document.frmMembRegi.mobile1.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile1.value.length;
 strnum = document.frmMembRegi.mobile1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile1.focus();
 return false;}
 if(document.frmMembRegi.mobile1.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile1.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax1.value.indexOf('(');
		var s2=document.frmMembRegi.fax1.value.indexOf(')');
		var s5=document.frmMembRegi.fax1.value.indexOf('+');
		var s6=document.frmMembRegi.fax1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax1.value.indexOf('-');
		var s8=document.frmMembRegi.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax1.value.length;
 strnum = document.frmMembRegi.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmMembRegi.fax1.focus();
 return false;}
 
 if(document.frmMembRegi.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmMembRegi.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmMembRegi.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	 
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}

if(document.frmMembRegi.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName1.value)|| document.frmMembRegi.loginName1.value.length > 25 || document.frmMembRegi.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmMembRegi.loginName1.focus();
 return false;}*/
	}
if(document.frmMembRegi.famUser1[1].checked==true )
	{ if(document.frmMembRegi.userNameId1.value=="" || document.frmMembRegi.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmMembRegi.userNameId1.focus();
	   return false;}
	}
	

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

if(document.frmMembRegi.famUser2[0].checked==true)
	{ if(document.frmMembRegi.memberAdd2.value=="" || document.frmMembRegi.memberAdd2.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Two");
	   document.frmMembRegi.memberAdd2.focus();
	
	   return false;}
	}

if(document.frmMembRegi.famUser2[2].checked==true)
	{
   /*
    if(document.frmMembRegi.selectSalute2.selectedIndex==0)
	 {alert("Select a salutation in Family Member two");
	 document.frmMembRegi.selectSalute2.focus();
	 return false;}
	*/
	if(document.frmMembRegi.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmMembRegi.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(document.frmMembRegi.middlename2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmMembRegi.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmMembRegi.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmMembRegi.suffix2.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	if((document.frmMembRegi.suffix2.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmMembRegi.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmMembRegi.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmMembRegi.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmMembRegi.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmMembRegi.gender2[i2].checked)
		{	chosen2= document.frmMembRegi.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmMembRegi.phone2.value=="" && document.frmMembRegi.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmMembRegi.phone2.value!="")
{		
		/*var s1=document.frmMembRegi.phone2.value.indexOf('(');
		var s2=document.frmMembRegi.phone2.value.indexOf(')');
		var s5=document.frmMembRegi.phone2.value.indexOf('+');
		var s6=document.frmMembRegi.phone2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone2.value.indexOf('-');
		var s8=document.frmMembRegi.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone2.value.length;
 strnum = document.frmMembRegi.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmMembRegi.phone2.focus();
 return false;}
 if(document.frmMembRegi.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
/*if(isnotInteger(document.frmMembRegi.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmMembRegi.mobile2.focus();
return false;}*/

if(document.frmMembRegi.mobile2.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile2.value.length;
 strnum = document.frmMembRegi.mobile1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile2.focus();
 return false;}
 if(document.frmMembRegi.mobile2.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile2.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax2.value.indexOf('(');
		var s2=document.frmMembRegi.fax2.value.indexOf(')');
		var s5=document.frmMembRegi.fax2.value.indexOf('+');
		var s6=document.frmMembRegi.fax2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax2.value.indexOf('-');
		var s8=document.frmMembRegi.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax2.value.length;
 strnum = document.frmMembRegi.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmMembRegi.fax2.focus();
 return false;}
 
 if(document.frmMembRegi.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmMembRegi.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmMembRegi.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	 
	}

	
if(document.frmMembRegi.famUser2[1].checked==true)
	{ if(document.frmMembRegi.userNameId2.value=="" || document.frmMembRegi.userNameId2.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Two");
	   document.frmMembRegi.userNameId2.focus();
	   return false;}
	
	
	}
	}
//--------------------------------------------------------------------------------

/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}

if(document.frmMembRegi.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName2.value)|| document.frmMembRegi.loginName2.value.length > 25 || document.frmMembRegi.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmMembRegi.loginName2.focus();
 return false;}*/
	
 	

if(document.frmMembRegi.famAdd_sel.value==3)
	{
	//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmMembRegi.famUser1[0].checked==true)
	{ if(document.frmMembRegi.memberAdd1.value=="" || document.frmMembRegi.memberAdd1.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member One");
	   document.frmMembRegi.memberAdd1.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser1[2].checked==true)
	{
//-----------------------------for Salutation for Family Member One-----------
	 /*if(document.frmMembRegi.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmMembRegi.selectSalute1.focus();
	 return false;}
	 */


	if(document.frmMembRegi.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmMembRegi.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(document.frmMembRegi.middlename1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmMembRegi.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmMembRegi.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmMembRegi.suffix1.focus();
	return false;}
	
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmMembRegi.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmMembRegi.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmMembRegi.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmMembRegi.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmMembRegi.gender1[i1].checked)
		{	chosen1= document.frmMembRegi.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone1.value=="" && document.frmMembRegi.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmMembRegi.phone1.value!="")
{		
		/*var s1=document.frmMembRegi.phone1.value.indexOf('(');
		var s2=document.frmMembRegi.phone1.value.indexOf(')');
		var s5=document.frmMembRegi.phone1.value.indexOf('+');
		var s6=document.frmMembRegi.phone1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone1.value.indexOf('-');
		var s8=document.frmMembRegi.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
				*/											  
 len7=document.frmMembRegi.phone1.value.length;
 strnum = document.frmMembRegi.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmMembRegi.phone1.focus();
 return false;}
 if(document.frmMembRegi.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

if(document.frmMembRegi.mobile1.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile1.value.length;
 strnum = document.frmMembRegi.mobile1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile1.focus();
 return false;}
 if(document.frmMembRegi.mobile1.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile1.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax1.value.indexOf('(');
		var s2=document.frmMembRegi.fax1.value.indexOf(')');
		var s5=document.frmMembRegi.fax1.value.indexOf('+');
		var s6=document.frmMembRegi.fax1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax1.value.indexOf('-');
		var s8=document.frmMembRegi.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax1.value.length;
 strnum = document.frmMembRegi.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmMembRegi.fax1.focus();
 return false;}
 
 if(document.frmMembRegi.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmMembRegi.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmMembRegi.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	 
	}
	
	if(document.frmMembRegi.famUser1[1].checked==true)
	{ if(document.frmMembRegi.userNameId1.value=="" || document.frmMembRegi.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmMembRegi.userNameId1.focus();
	   return false;}
	}
	
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}

if(document.frmMembRegi.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName1.value)|| document.frmMembRegi.loginName1.value.length > 25 || document.frmMembRegi.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmMembRegi.loginName1.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmMembRegi.famUser2[0].checked==true)
	{ if(document.frmMembRegi.memberAdd2.value=="" || document.frmMembRegi.memberAdd2.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Two");
	   document.frmMembRegi.memberAdd2.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser2[2].checked==true)
	{
	 
	 /*if(document.frmMembRegi.selectSalute2.selectedIndex==0)
	 {alert("Select a salutation in Family Member two");
	 document.frmMembRegi.selectSalute2.focus();
	 return false;}
	 */
	 
	if(document.frmMembRegi.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmMembRegi.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(document.frmMembRegi.middlename2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmMembRegi.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmMembRegi.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");
	 document.frmMembRegi.suffix2.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	if((document.frmMembRegi.suffix2.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmMembRegi.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmMembRegi.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmMembRegi.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmMembRegi.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmMembRegi.gender2[i2].checked)
		{	chosen2= document.frmMembRegi.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmMembRegi.phone2.value=="" && document.frmMembRegi.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmMembRegi.phone2.value!="")
{		
		/*
		var s1=document.frmMembRegi.phone2.value.indexOf('(');
		var s2=document.frmMembRegi.phone2.value.indexOf(')');
		var s5=document.frmMembRegi.phone2.value.indexOf('+');
		var s6=document.frmMembRegi.phone2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone2.value.indexOf('-');
		var s8=document.frmMembRegi.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone2.value.length;
 strnum = document.frmMembRegi.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmMembRegi.phone2.focus();
 return false;}
 if(document.frmMembRegi.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
/*if(isnotInteger(document.frmMembRegi.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmMembRegi.mobile2.focus();
return false;}*/

if(document.frmMembRegi.mobile2.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile2.value.length;
 strnum = document.frmMembRegi.mobile2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile2.focus();
 return false;}
 if(document.frmMembRegi.mobile2.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile2.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax2.value.indexOf('(');
		var s2=document.frmMembRegi.fax2.value.indexOf(')');
		var s5=document.frmMembRegi.fax2.value.indexOf('+');
		var s6=document.frmMembRegi.fax2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax2.value.indexOf('-');
		var s8=document.frmMembRegi.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax2.value.length;
 strnum = document.frmMembRegi.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmMembRegi.fax2.focus();
 return false;}
 
 if(document.frmMembRegi.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmMembRegi.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmMembRegi.email2.value=="")
	{alert("Enter Email in Family Member Two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email2.value))
	{alert("Enter a valid Email in Family Member Two");
	 document.frmMembRegi.email2.focus();
	 return false;}

	}
	
	if(document.frmMembRegi.famUser2[1].checked==true || document.frmMembRegi.userNameId2.value.indexOf(" ")==0)
	{ if(document.frmMembRegi.userNameId2.value=="")
	  {alert("Enter the User Name for Family Member Two");
	   document.frmMembRegi.userNameId2.focus();
	   return false;}
	}
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}

if(document.frmMembRegi.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName2.value)|| document.frmMembRegi.loginName2.value.length > 25 || document.frmMembRegi.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmMembRegi.loginName2.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmMembRegi.famUser3[0].checked==true)
	{ if(document.frmMembRegi.memberAdd3.value=="" || document.frmMembRegi.memberAdd3.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Three");
	   document.frmMembRegi.memberAdd3.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser3[2].checked==true)
	{
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member three-----------
	/* if(document.frmMembRegi.selectSalute3.selectedIndex==0)
	 {alert("Select a salutation in Family Member three");
	 document.frmMembRegi.selectSalute3.focus();
	 return false;}
	 */
	if(document.frmMembRegi.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(document.frmMembRegi.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(document.frmMembRegi.firstname3.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmMembRegi.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if(document.frmMembRegi.middlename3.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmMembRegi.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(document.frmMembRegi.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(document.frmMembRegi.lastname3.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmMembRegi.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmMembRegi.suffix3.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	if((document.frmMembRegi.suffix3.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmMembRegi.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmMembRegi.selectDay3.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmMembRegi.selectYear3.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmMembRegi.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmMembRegi.gender3[i3].checked)
		{	chosen3= document.frmMembRegi.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone3.value=="" && document.frmMembRegi.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmMembRegi.phone3.value!="")
{		
		/*var s1=document.frmMembRegi.phone3.value.indexOf('(');
		var s2=document.frmMembRegi.phone3.value.indexOf(')');
		var s5=document.frmMembRegi.phone3.value.indexOf('+');
		var s6=document.frmMembRegi.phone3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone3.value.indexOf('-');
		var s8=document.frmMembRegi.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		*/
																					  
 len7=document.frmMembRegi.phone3.value.length;
 strnum = document.frmMembRegi.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmMembRegi.phone3.focus();
 return false;}
 if(document.frmMembRegi.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
/*if(isnotInteger(document.frmMembRegi.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmMembRegi.mobile3.focus();
return false;}*/

if(document.frmMembRegi.mobile3.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile3.value.length;
 strnum = document.frmMembRegi.mobile3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile3.focus();
 return false;}
 if(document.frmMembRegi.mobile3.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile3.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax3.value.indexOf('(');
		var s2=document.frmMembRegi.fax3.value.indexOf(')');
		var s5=document.frmMembRegi.fax3.value.indexOf('+');
		var s6=document.frmMembRegi.fax3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax3.value.indexOf('-');
		var s8=document.frmMembRegi.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax3.value.length;
 strnum = document.frmMembRegi.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmMembRegi.fax3.focus();
 return false;}
 
 if(document.frmMembRegi.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmMembRegi.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmMembRegi.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
	 
	}
	
	if(document.frmMembRegi.famUser3[1].checked==true)
	{ if(document.frmMembRegi.userNameId3.value=="" || document.frmMembRegi.userNameId3.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Three");
	   document.frmMembRegi.userNameId3.focus();
	   return false;}
	}
	 
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName3.value=="")
{ alert("Enter a User Name in Family Member Three");
 document.frmMembRegi.loginName3.focus();
 return false;}

if(document.frmMembRegi.loginName3.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Three");
 document.frmMembRegi.loginName3.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName3.value)|| document.frmMembRegi.loginName3.value.length > 25 || document.frmMembRegi.loginName3.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Three");
  document.frmMembRegi.loginName3.focus();
 return false;}*/

	}
//--------------------------------------------------------------------------------

	
if(document.frmMembRegi.famAdd_sel.value==4)
	{		 


	if(document.frmMembRegi.famUser1[0].checked==true)
	{ if(document.frmMembRegi.memberAdd1.value=="" || document.frmMembRegi.memberAdd1.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member One");
	   document.frmMembRegi.memberAdd1.focus();
	
	   return false;}
	}
	
	if(document.frmMembRegi.famUser1[2].checked==true)

	{
//-----------------------------for Salutation for Family Member One-----------
	 /*if(document.frmMembRegi.selectSalute1.selectedIndex==0)
	 {alert("Select a salutation in Family Member one");
	 document.frmMembRegi.selectSalute1.focus();
	 return false;}
	 */
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member One--------

	if(document.frmMembRegi.firstname1.value=="")
	{alert("Enter First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.length>80)
	{alert("Enter valid First Name of Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname1.value))
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
	if(document.frmMembRegi.firstname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member One");
	document.frmMembRegi.firstname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member One-------------------------------------
	if(document.frmMembRegi.middlename1.value.length>80)
	{alert("Enter Middle Name of Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename1.value))
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
	if(document.frmMembRegi.middlename1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member One");
	document.frmMembRegi.middlename1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member One------------------------
	if(document.frmMembRegi.lastname1.value=="")
	{alert("Enter Last Name of Family Member One");

	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.length>80)
	{alert("Enter valid Last Name of Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname1.value))
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
	if(document.frmMembRegi.lastname1.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member One");
	document.frmMembRegi.lastname1.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member One-----------------------
	
	 if(document.frmMembRegi.suffix1.value.length>80)
	{alert("Enter valid Suffix of Family Member One");
	document.frmMembRegi.suffix1.focus();
	return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member One-----------
	if(document.frmMembRegi.selectMonth1.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectMonth1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member One-----------
	if(document.frmMembRegi.selectDay1.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectDay1.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member One-----------
	if(document.frmMembRegi.selectYear1.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member One.");
	 document.frmMembRegi.selectYear1.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member One--------------------------
	chosen1="";
	len1 = document.frmMembRegi.gender1.length ;
	for(i1=0;i1<len1;i1++){
		if(document.frmMembRegi.gender1[i1].checked)
		{	chosen1= document.frmMembRegi.gender1[i1].value;	}	}

	if(chosen1=="")
	{	alert("Check any of Gender Option in Family Member One.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone1.value=="" && document.frmMembRegi.mobile1.value=="" )
{ alert("Enter a Contact Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member One --------------


if(document.frmMembRegi.phone1.value!="")
{		
		/*var s1=document.frmMembRegi.phone1.value.indexOf('(');
		var s2=document.frmMembRegi.phone1.value.indexOf(')');
		var s5=document.frmMembRegi.phone1.value.indexOf('+');
		var s6=document.frmMembRegi.phone1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone1.value.indexOf('-');
		var s8=document.frmMembRegi.phone1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member One");
			document.frmMembRegi.phone1.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone1.value.length;
 strnum = document.frmMembRegi.phone1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member One");
 document.frmMembRegi.phone1.focus();
 return false;}
 if(document.frmMembRegi.phone1.value.length>40)
  {alert("Enter valid Phone Number in Family Member One");
  document.frmMembRegi.phone1.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member One----------------
/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

if(document.frmMembRegi.mobile1.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile1.value.length;
 strnum = document.frmMembRegi.mobile1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile1.focus();
 return false;}
 if(document.frmMembRegi.mobile1.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile1.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
		/*
		var s1=document.frmMembRegi.fax1.value.indexOf('(');
		var s2=document.frmMembRegi.fax1.value.indexOf(')');
		var s5=document.frmMembRegi.fax1.value.indexOf('+');
		var s6=document.frmMembRegi.fax1.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax1.value.indexOf('-');
		var s8=document.frmMembRegi.fax1.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/

 len7=document.frmMembRegi.fax1.value.length;
 strnum = document.frmMembRegi.fax1.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member One");
 document.frmMembRegi.fax1.focus();
 return false;}
 
 if(document.frmMembRegi.fax1.value.length>40)
  {alert("Enter valid Fax in Family Member One");
  document.frmMembRegi.fax1.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member One-------------------------
	if(document.frmMembRegi.email1.value=="")
	{alert("Enter Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email1.value))
	{alert("Enter a valid Email in Family Member One");
	 document.frmMembRegi.email1.focus();
	 return false;}

	}
	
	if(document.frmMembRegi.famUser1[1].checked==true)
	{ if(document.frmMembRegi.userNameId1.value=="" || document.frmMembRegi.userNameId1.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member One");
	   document.frmMembRegi.userNameId1.focus();
	   return false;}
	}
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName1.value=="")
{ alert("Enter a User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}

if(document.frmMembRegi.loginName1.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member One");
 document.frmMembRegi.loginName1.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName1.value)|| document.frmMembRegi.loginName1.value.length > 25 || document.frmMembRegi.loginName1.value.length < 4 )
 {alert("Enter a valid User Name in Family Member One");
  document.frmMembRegi.loginName1.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member two--------

	if(document.frmMembRegi.famUser2[0].checked==true)
	{ if(document.frmMembRegi.memberAdd2.value=="" || document.frmMembRegi.memberAdd2.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Two");
	   document.frmMembRegi.memberAdd2.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser2[2].checked==true)
	{
	 
	 /*if(document.frmMembRegi.selectSalute2.selectedIndex==0)
	 {alert("Select a salutation in Family Member two");
	 document.frmMembRegi.selectSalute2.focus();
	 return false;}
	 */

	if(document.frmMembRegi.firstname2.value=="")
	{alert("Enter First Name of Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.length>80)
	{alert("Enter valid First Name of Family Member two");

	document.frmMembRegi.firstname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname2.value))
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
	if(document.frmMembRegi.firstname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member two");
	document.frmMembRegi.firstname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member two-------------------------------------
	if(document.frmMembRegi.middlename2.value.length>80)
	{alert("Enter Middle Name of Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename2.value))
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
	if(document.frmMembRegi.middlename2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member two");
	document.frmMembRegi.middlename2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member two------------------------
	if(document.frmMembRegi.lastname2.value=="")
	{alert("Enter Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.length>80)
	{alert("Enter valid Last Name of Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname2.value))
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
	if(document.frmMembRegi.lastname2.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member two");
	document.frmMembRegi.lastname2.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member two-----------------------
	/*if(document.frmMembRegi.suffix2.value=="")
	{alert("Enter Suffix in Family Member two");

	 document.frmMembRegi.suffix2.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix2.value.length>80)
	{alert("Enter valid Suffix of Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix2.value))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}
	if((document.frmMembRegi.suffix2.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix2.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member two");
	document.frmMembRegi.suffix2.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member two-----------
	if(document.frmMembRegi.selectMonth2.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectMonth2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member two-----------
	if(document.frmMembRegi.selectDay2.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectDay2.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member two-----------
	if(document.frmMembRegi.selectYear2.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member two.");
	 document.frmMembRegi.selectYear2.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member two--------------------------
	chosen2="";
	len2 = document.frmMembRegi.gender2.length ;
	for(i2=0;i2<len2;i2++){
		if(document.frmMembRegi.gender2[i2].checked)
		{	chosen2= document.frmMembRegi.gender2[i2].value;	}	}

	if(chosen2=="")
	{	alert("Check any of Gender Option in Family Member two.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE in family Member two

if(document.frmMembRegi.phone2.value=="" && document.frmMembRegi.mobile2.value=="" )
{ alert("Enter a Contact Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member two --------------


if(document.frmMembRegi.phone2.value!="")
{		
		/*var s1=document.frmMembRegi.phone2.value.indexOf('(');
		var s2=document.frmMembRegi.phone2.value.indexOf(')');
		var s5=document.frmMembRegi.phone2.value.indexOf('+');
		var s6=document.frmMembRegi.phone2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone2.value.indexOf('-');
		var s8=document.frmMembRegi.phone2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member two");
			document.frmMembRegi.phone2.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone2.value.length;
 strnum = document.frmMembRegi.phone2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member two");
 document.frmMembRegi.phone2.focus();
 return false;}
 if(document.frmMembRegi.phone2.value.length>40)
  {alert("Enter valid Phone Number in Family Member two");
  document.frmMembRegi.phone2.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member two----------------
/*if(isnotInteger(document.frmMembRegi.mobile2.value))
{alert("Enter a valid Mobile Number in Family Member two.");
document.frmMembRegi.mobile2.focus();
return false;}*/

if(document.frmMembRegi.mobile2.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile2.value.length;
 strnum = document.frmMembRegi.mobile2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile2.focus();
 return false;}
 if(document.frmMembRegi.mobile2.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile2.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax2.value.indexOf('(');
		var s2=document.frmMembRegi.fax2.value.indexOf(')');
		var s5=document.frmMembRegi.fax2.value.indexOf('+');
		var s6=document.frmMembRegi.fax2.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax2.value.indexOf('-');
		var s8=document.frmMembRegi.fax2.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member two");
			document.frmMembRegi.fax2.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax2.value.length;
 strnum = document.frmMembRegi.fax2.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member two");
 document.frmMembRegi.fax2.focus();
 return false;}
 
 if(document.frmMembRegi.fax2.value.length>40)
  {alert("Enter valid Fax in Family Member two");
  document.frmMembRegi.fax2.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member two-------------------------
	if(document.frmMembRegi.email2.value=="")
	{alert("Enter Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email2.value))
	{alert("Enter a valid Email in Family Member two");
	 document.frmMembRegi.email2.focus();
	 return false;}
	 
	}
	
	if(document.frmMembRegi.famUser2[1].checked==true)
	{ if(document.frmMembRegi.userNameId2.value=="" || document.frmMembRegi.userNameId2.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Two");
	   document.frmMembRegi.userNameId2.focus();
	   return false;}
	}
	
	

/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName2.value=="")
{ alert("Enter a User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}

if(document.frmMembRegi.loginName2.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Two");
 document.frmMembRegi.loginName2.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName2.value)|| document.frmMembRegi.loginName2.value.length > 25 || document.frmMembRegi.loginName2.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Two");
  document.frmMembRegi.loginName2.focus();
 return false;}*/

//------------------------------------------------------------------------------------------

//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member three--------

	if(document.frmMembRegi.famUser3[0].checked==true)
	{ if(document.frmMembRegi.memberAdd3.value=="" || document.frmMembRegi.memberAdd3.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Three");
	   document.frmMembRegi.memberAdd3.focus();
	
	   return false;}
	}

	if(document.frmMembRegi.famUser3[2].checked==true)
	{
//------------------------------------------------------------------------------------------
//-----------------------------for Salutation for Family Member three-----------
	/* if(document.frmMembRegi.selectSalute3.selectedIndex==0)
	 {alert("Select a salutation in Family Member three");
	 document.frmMembRegi.selectSalute3.focus();
	 return false;}
	*/
	
	if(document.frmMembRegi.firstname3.value=="")
	{alert("Enter First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(document.frmMembRegi.firstname3.value.length>80)
	{alert("Enter valid First Name of Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname3.value))
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
	if(document.frmMembRegi.firstname3.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member three");
	document.frmMembRegi.firstname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member three-------------------------------------
	if(document.frmMembRegi.middlename3.value.length>80)
	{alert("Enter Middle Name of Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename3.value))
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
	if(document.frmMembRegi.middlename3.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member three");
	document.frmMembRegi.middlename3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member three------------------------
	if(document.frmMembRegi.lastname3.value=="")
	{alert("Enter Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(document.frmMembRegi.lastname3.value.length>80)
	{alert("Enter valid Last Name of Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname3.value))
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
	if(document.frmMembRegi.lastname3.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member three");
	document.frmMembRegi.lastname3.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member three-----------------------
	/*if(document.frmMembRegi.suffix3.value=="")
	{alert("Enter Suffix in Family Member three");
	 document.frmMembRegi.suffix3.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix3.value.length>80)
	{alert("Enter valid Suffix of Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix3.value))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}
	if((document.frmMembRegi.suffix3.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix3.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member three");
	document.frmMembRegi.suffix3.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member three-----------
	if(document.frmMembRegi.selectMonth3.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectMonth3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member three-----------
	if(document.frmMembRegi.selectDay3.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectDay3.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member three-----------
	if(document.frmMembRegi.selectYear3.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member three.");
	 document.frmMembRegi.selectYear3.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member three--------------------------
	chosen3="";
	len3 = document.frmMembRegi.gender3.length ;
	for(i3=0;i3<len3;i3++){
		if(document.frmMembRegi.gender3[i3].checked)
		{	chosen3= document.frmMembRegi.gender3[i3].value;	}	}

	if(chosen3=="")
	{	alert("Check any of Gender Option in Family Member three.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone3.value=="" && document.frmMembRegi.mobile3.value=="" )
{ alert("Enter a Contact Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member three --------------


if(document.frmMembRegi.phone3.value!="")
{		
		/*var s1=document.frmMembRegi.phone3.value.indexOf('(');
		var s2=document.frmMembRegi.phone3.value.indexOf(')');
		var s5=document.frmMembRegi.phone3.value.indexOf('+');
		var s6=document.frmMembRegi.phone3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone3.value.indexOf('-');
		var s8=document.frmMembRegi.phone3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member three");
			document.frmMembRegi.phone3.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone3.value.length;
 strnum = document.frmMembRegi.phone3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member three");
 document.frmMembRegi.phone3.focus();
 return false;}
 if(document.frmMembRegi.phone3.value.length>40)
  {alert("Enter valid Phone Number in Family Member three");
  document.frmMembRegi.phone3.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member three----------------
/*if(isnotInteger(document.frmMembRegi.mobile3.value))
{alert("Enter a valid Mobile Number in Family Member three.");
document.frmMembRegi.mobile3.focus();
return false;}*/

if(document.frmMembRegi.mobile3.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile3.value.length;
 strnum = document.frmMembRegi.mobile3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)

   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile3.focus();
 return false;}
 if(document.frmMembRegi.mobile3.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile3.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------

 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax3.value.indexOf('(');
		var s2=document.frmMembRegi.fax3.value.indexOf(')');
		var s5=document.frmMembRegi.fax3.value.indexOf('+');
		var s6=document.frmMembRegi.fax3.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax3.value.indexOf('-');
		var s8=document.frmMembRegi.fax3.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member three");
			document.frmMembRegi.fax3.focus();
			return false;
		}
		*/
 len7=document.frmMembRegi.fax3.value.length;
 strnum = document.frmMembRegi.fax3.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member three");
 document.frmMembRegi.fax3.focus();
 return false;}
 
 if(document.frmMembRegi.fax3.value.length>40)
  {alert("Enter valid Fax in Family Member three");
  document.frmMembRegi.fax3.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member three-------------------------
	if(document.frmMembRegi.email3.value=="")
	{alert("Enter Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email3.value))
	{alert("Enter a valid Email in Family Member three");
	 document.frmMembRegi.email3.focus();
	 return false;}
	 
	}
	
	if(document.frmMembRegi.famUser3[1].checked==true)
	{ if(document.frmMembRegi.userNameId3.value=="" || document.frmMembRegi.userNameId3.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Three");
	   document.frmMembRegi.userNameId3.focus();
	   return false;}
	}
	
	 /*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName3.value=="")
{ alert("Enter a User Name in Family Member Three");
 document.frmMembRegi.loginName3.focus();
 return false;}

if(document.frmMembRegi.loginName3.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Three");
 document.frmMembRegi.loginName3.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName3.value)|| document.frmMembRegi.loginName3.value.length > 25 || document.frmMembRegi.loginName3.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Three");
  document.frmMembRegi.loginName3.focus();
 return false;}*/
	 
//------------------------------------------------------------------------------------------
//-----------------------------fosr Salutation for Family Member four-----------

if(document.frmMembRegi.famUser4[0].checked==true)
	{ if(document.frmMembRegi.memberAdd4.value=="" || document.frmMembRegi.memberAdd4.value.indexOf(" ")==0)
	  {alert("Enter the MemberId for Family Member Four");
	   document.frmMembRegi.memberAdd4.focus();
	
	   return false;}
	}


if(document.frmMembRegi.famUser4[2].checked==true)
	{

	/* if(document.frmMembRegi.selectSalute4.selectedIndex==0)
	 {alert("Select a salutation in Family Member four");
	 document.frmMembRegi.selectSalute4.focus();
	 return false;}
	 */
//------------------------------------------------------------------------------------------
//--------------------------------for First Name in Family Member four--------

	if(document.frmMembRegi.firstname4.value=="")
	{alert("Enter First Name of Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if(document.frmMembRegi.firstname4.value.length>80)
	{alert("Enter valid First Name of Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.firstname4.value))
	{alert("Enter a valid First Name in Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
	if(document.frmMembRegi.firstname4.value.indexOf('  ')!=-1)
	{alert("Enter a valid First Name in Family Member four");
	document.frmMembRegi.firstname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Middle Name in Family Member four-------------------------------------
	if(document.frmMembRegi.middlename4.value.length>80)
	{alert("Enter Middle Name of Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.middlename4.value))
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
	if(document.frmMembRegi.middlename4.value.indexOf('  ')!=-1)
	{alert("Enter a valid Middle Name in Family Member four");
	document.frmMembRegi.middlename4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Last Name in Family Member four------------------------
	if(document.frmMembRegi.lastname4.value=="")
	{alert("Enter Last Name of Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if(document.frmMembRegi.lastname4.value.length>80)
	{alert("Enter valid Last Name of Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if(isnotName(document.frmMembRegi.lastname4.value))
	{alert("Enter a valid Last Name in Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
	if(document.frmMembRegi.lastname4.value.indexOf('  ')!=-1)
	{alert("Enter a valid Last Name in Family Member four");
	document.frmMembRegi.lastname4.focus();
	return false;}
//-----------------------------------------------------------------------------------------------
//---------------------------------for Suffix in Family Member four-----------------------
	/*if(document.frmMembRegi.suffix4.value=="")
	{alert("Enter Suffix in Family Member four");
	 document.frmMembRegi.suffix4.focus();
	 return false;}*/
	 if(document.frmMembRegi.suffix4.value.length>80)
	{alert("Enter valid Suffix of Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}
	/*if(isnotAlpha(document.frmMembRegi.suffix4.value))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}
	if((document.frmMembRegi.suffix4.value.indexOf('  ')!=-1)||(document.frmMembRegi.suffix4.value.indexOf(' ')!=-1))
	{alert("Enter a valid Suffix in Family Member four");
	document.frmMembRegi.suffix4.focus();
	return false;}*/
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth  - Month field in Famliy Member four-----------
	if(document.frmMembRegi.selectMonth4.selectedIndex==0)
	 {alert("Select a Month in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectMonth4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Day field in Famliy Member four-----------
	if(document.frmMembRegi.selectDay4.selectedIndex==0)
	 {alert("Select a Day in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectDay4.focus();
	 return false;}
//--------------------------------------------------------------------------------------------
//---------------------------for Date Of Birth - Year field in Famliy Member four-----------
	if(document.frmMembRegi.selectYear4.selectedIndex==0)
	 {alert("Select a Year in Date Of Birth in Family Member four.");
	 document.frmMembRegi.selectYear4.focus();
	 return false;}
//-----------------------------------------------------------------------------------------
//------------------------for Gender in Family Member four--------------------------
	chosen4="";
	len4 = document.frmMembRegi.gender4.length ;
	for(i4=0;i4<len4;i4++){
		if(document.frmMembRegi.gender4[i4].checked)
		{	chosen4= document.frmMembRegi.gender4[i4].value;	}	}

	if(chosen4=="")
	{	alert("Check any of Gender Option in Family Member four.");
		return false; }
//---------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------
//----------------------IF ENTER EITHER PHONE 

if(document.frmMembRegi.phone4.value=="" && document.frmMembRegi.mobile4.value=="" )
{ alert("Enter a Contact Number in Family Member four");
  document.frmMembRegi.phone4.focus();
  return false;}
//------------------------------------------------------------------------------------
//--------------------------------PHONE NUMBER in Family Member four --------------


if(document.frmMembRegi.phone4.value!="")
{		
		/*var s1=document.frmMembRegi.phone4.value.indexOf('(');
		var s2=document.frmMembRegi.phone4.value.indexOf(')');
		var s5=document.frmMembRegi.phone4.value.indexOf('+');
		var s6=document.frmMembRegi.phone4.value.lastIndexOf('+');
		var s7=document.frmMembRegi.phone4.value.indexOf('-');
		var s8=document.frmMembRegi.phone4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s5!=s6){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}
		if(s7!=s8){
			alert("Enter valid Phone Number in Family Member four");
			document.frmMembRegi.phone4.focus();
			return false;
		}*/
																					  
 len7=document.frmMembRegi.phone4.value.length;
 strnum = document.frmMembRegi.phone4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;

 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid Phone Number in Family Member four");
 document.frmMembRegi.phone4.focus();
 return false;}
 if(document.frmMembRegi.phone4.value.length>40)
  {alert("Enter valid Phone Number in Family Member four");
  document.frmMembRegi.phone4.focus();
  return false;}
 
}
//------------------------------------------------------------------------------------
//-----------------------------for Mobile in Family Member four----------------
/*if(isnotInteger(document.frmMembRegi.mobile4.value))
{alert("Enter a valid Mobile Number in Family Member four.");
document.frmMembRegi.mobile4.focus();
return false;}*/

if(document.frmMembRegi.mobile4.value!="")
{

/*if(isnotInteger(document.frmMembRegi.mobile1.value))
{alert("Enter a valid Mobile Number in Family Member One.");
document.frmMembRegi.mobile1.focus();
return false;}*/

 len7=document.frmMembRegi.mobile4.value.length;
 strnum = document.frmMembRegi.mobile4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)

{alert("Enter valid Mobile Number in Family Member One");
 document.frmMembRegi.mobile4.focus();
 return false;}
 if(document.frmMembRegi.mobile4.value.length>40)
  {alert("Enter valid Mobile Number in Family Member One");
  document.frmMembRegi.mobile4.focus();
  return false;}

}

//------------------------------------------------------------------------------------
//-----------------------------------------FAX--------------------------------
 
		/*if(document.frmMembRegi.fax1.value=="")
		{	alert("Enter fax in Family Member One");
			document.frmMembRegi.fax1.focus();
			return false;
		}*/
	/*
	var s1=document.frmMembRegi.fax4.value.indexOf('(');
		var s2=document.frmMembRegi.fax4.value.indexOf(')');
		var s5=document.frmMembRegi.fax4.value.indexOf('+');
		var s6=document.frmMembRegi.fax4.value.lastIndexOf('+');
		var s7=document.frmMembRegi.fax4.value.indexOf('-');
		var s8=document.frmMembRegi.fax4.value.lastIndexOf('-');
		var s3=1+s2;
		var s4=1+s1;
		if(s1==s3){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}
		if(s2==s4){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}
		if(s5!==s6){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;3
		}
		if(s7!==s8){
			alert("Enter valid fax in Family Member four");
			document.frmMembRegi.fax4.focus();
			return false;
		}*/

 len7=document.frmMembRegi.fax4.value.length;
 strnum = document.frmMembRegi.fax4.value;
  var GoodChars = "0123456789()-+ ";
 valid = 1;
 for(j=0;j<len7;j++)
{ if(GoodChars.indexOf(strnum.charAt(j))==-1)
   { valid=0;} }
if(valid!=1)
{alert("Enter valid fax in Family Member four");
 document.frmMembRegi.fax4.focus();
 return false;}
 
 if(document.frmMembRegi.fax4.value.length>40)
  {alert("Enter valid Fax in Family Member four");
  document.frmMembRegi.fax4.focus();
  return false;}
//------------------------------------------------------------------------------------
//-----------------------for Email in Family Member four-------------------------
	if(document.frmMembRegi.email4.value=="")
	{alert("Enter Email in Family Member four");
	 document.frmMembRegi.email4.focus();
	 return false;}
	if(isnotVlaidEmail(document.frmMembRegi.email4.value))
	{alert("Enter a valid Email in Family Member four");
	 document.frmMembRegi.email4.focus();
	 return false;}

	}
	
	if(document.frmMembRegi.famUser4[1].checked==true)
	{ if(document.frmMembRegi.userNameId4.value=="" || document.frmMembRegi.userNameId4.value.indexOf(" ")==0)
	  {alert("Enter the User Name for Family Member Four");
	   document.frmMembRegi.userNameId4.focus();
	   return false;}
	}
	
	
	
/*-------------------for User Name in Family Member One ----
//alert(document.frmUserSignup.chsUserName.value);
if(document.frmMembRegi.loginName4.value=="")
{ alert("Enter a User Name in Family Member Four");
 document.frmMembRegi.loginName4.focus();
 return false;}

if(document.frmMembRegi.loginName4.value.indexOf(" ")==0)
{ alert("Enter a Valid User Name in Family Member Four");
 document.frmMembRegi.loginName4.focus();
 return false;}
 
if(isnotAlphaNumeric(document.frmMembRegi.loginName4.value)|| document.frmMembRegi.loginName4.value.length > 25 || document.frmMembRegi.loginName4.value.length < 4 )
 {alert("Enter a valid User Name in Family Member Four");
  document.frmMembRegi.loginName4.focus();
 return false;}*/
	
	}
	
	//---- publication details ----------------------
	if(document.getElementById('memTyp_sel').value!="")
	{
	spval=conval.split("#");
	
	if(spval[1]!="Family Member")
	{
		if(spval[1]=="Subscribing Member"){
			var n = document.frmMembRegi.pub_ct1.value;
			var ch=0;
			i=0;
			var str="submailOpt10";
			
			if(document.getElementById(''+str).checked)
			{
				ch=1;
			}	
			if(ch==0)
			{
				if(!document.frmMembRegi.mailOptQuestion.checked)
				{
					alert("Select at least one of the options in the Publications Mailings section ");
					return false;					
				}
			}
		}
		else{
		
			var n = document.frmMembRegi.pub_ct.value;
			var ch=0;
			
			for(i=0;i<n;i++)
		{
			var str="mailOpt1"+i;
			
			
			if(document.getElementById(''+str).checked)
			{
				ch=1;
			}	
			
		}
			
			if(ch==0)
			{
				if(!document.frmMembRegi.mailOptQuesti.checked)
				{
					alert("Select at least one of the options in the Publications Mailings section ");
					return false;
				}
			}
	}
	}
	}
	
//-------------------------------------------------------------------------------------
//----------------------------for Payment Option----------------------------


tempSec="";
tempSec= document.frmMembRegi.cc11.value;
//alert("tempSec" +tempSec);

if(tempSec=="usrsec2"){
//alert("user" +tempSec);
	
	//================================== For Card Type =========================================

		if ( document.frmMembRegi.ccTypeId.selectedIndex == 0 ){
			alert ( "Please select card type." );
			document.frmMembRegi.ccTypeId.focus();
			return false;
		}
//================================== For Card Number =========================================
		if(document.frmMembRegi.txtCard.value==""){
			alert("Enter a Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}

		if(!Number(document.frmMembRegi.txtCard.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	
	if ( document.frmMembRegi.ccTypeId.selectedIndex == 3 ){
		if(document.frmMembRegi.txtCard.value.length!=15 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	}
	
	if ( document.frmMembRegi.ccTypeId.selectedIndex == 1 || document.frmMembRegi.ccTypeId.selectedIndex == 2 ){
		if(document.frmMembRegi.txtCard.value.length!=16 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	}
	
		if(document.frmMembRegi.txtCard.value.indexOf('.')!=-1){
			alert("Enter Valid Card Number in the Card Details.");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
		
	//================================== For CVV Number =========================================
		if(document.frmMembRegi.txtCvvId.value==""){
				alert("Enter CVV Number in Card Details");
				document.frmMembRegi.txtCvvId.focus();
				return false;
		}
		if(document.frmMembRegi.txtCvvId.value.indexOf(" ")==0 ){
			alert("Empty space(s) are not allowed for CVV Number");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		if(document.frmMembRegi.txtCvvId.value.indexOf('  ')!=-1){
			alert("Empty space(s) are not allowed for CVV Number");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		if ( document.frmMembRegi.ccTypeId.selectedIndex == 1 || document.frmMembRegi.ccTypeId.selectedIndex == 2 ){
			if(document.frmMembRegi.txtCvvId.value.length !=3){
			alert("Enter valid CVV Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		    }
		}
		if ( document.frmMembRegi.ccTypeId.selectedIndex == 3 ){
			if(document.frmMembRegi.txtCvvId.value.length !=4){
			alert("Enter valid CVV Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
			}
		}
		
		if(document.frmMembRegi.txtCvvId.value.indexOf('.')!=-1){
			alert("Enter Valid Cvv Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		
		if(isnotInteger(document.frmMembRegi.txtCvvId.value)){
			alert("Enter Valid Cvv Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}	
	
		
	//================================= For Print Name on Card =================================	
		if(document.frmMembRegi.txtPrName.value==""){
			alert("Enter Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(document.frmMembRegi.txtPrName.value.length>80){
			alert("Entered Print Name in Card Details is out of Range.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(isnotName(document.frmMembRegi.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(Number(document.frmMembRegi.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(document.frmMembRegi.txtPrName.value.indexOf(' ')==0){
			alert("Enter a Valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;

		}
	
		if(document.frmMembRegi.txtPrName.value.indexOf('  ')!=-1){
			alert("Enter Valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
		
		//================================= For Expiry Month =================================	
	
		var rightNow=new Date();
		var theYear=rightNow.getYear();
		var tMonth=rightNow.getMonth();
		var theMonth=1+tMonth;
		var theDate=rightNow.getDate();
	
		if ( document.frmMembRegi.selExpMonthId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration Month." );
			document.frmMembRegi.selExpMonthId.focus();
			return false;
		}
	
		if (document.frmMembRegi.selExpYearId.value==theYear){
			 if(document.frmMembRegi.selExpMonthId.value<theMonth){
				alert("Please Select Valid Card Expiration Month.");
				document.frmMembRegi.selExpMonthId.focus();
				return(false);   
			}
		}

//================================= For Expiry Year =================================	
	
		if ( document.frmMembRegi.selExpYearId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration year." );
			document.frmMembRegi.selExpYearId.focus();
			return false;
		}
	
		if (document.frmMembRegi.selExpYearId.value<theYear){
			alert("Please Select Valid Card Expiration Year.");
			document.frmMembRegi.selExpYearId.focus();
			return false;   
		}	

}

if(tempSec=="adsec1"){
//alert("admin" +tempSec);
	
chosenrd="";
	lenrd = document.frmMembRegi.r11.length ;
	
	for(ird=0;ird<lenrd;ird++){
		if(document.frmMembRegi.r11[ird].checked){
			chosenrd= document.frmMembRegi.r11[ird].value;
		}
	}

	if(chosenrd==""){
		alert("Check any of the Payment Option.");
		return false;
	}	
//=============================== For Card Details ===========================================
//=============================== For Check Number ===========================================

	if(chosenrd=="check"){
				
		if(document.frmMembRegi.txtChNumber.value==""){
			alert("Enter Check Number in Check Details");
			document.frmMembRegi.txtChNumber.focus();
			return false;
		}

		if(isnotAlphaNumeric(document.frmMembRegi.txtChNumber.value)){
			alert("Enter valid Check Number in Check Details.");
			document.frmMembRegi.txtChNumber.focus();
    		return false;
		}

		if(document.frmMembRegi.txtChNumber.value.indexOf('.')!=-1){
			alert("Enter a Valid check number in Check Details.");
			document.frmMembRegi.txtChNumber.focus();
			return false;
		}
		
		if(document.frmMembRegi.txtChNumber.value.indexOf(" ")==0){
			alert("Enter a Valid check number in Check Details.");
			document.frmMembRegi.txtChNumber.focus();
			return false;
		}

//--------------------------------
//--------for Check Date----------------------------------

//maxdays=0;
if(document.frmMembRegi.checkDate.value=="")
 { alert("Enter a Check Date in Payment Details");

  document.frmMembRegi.checkDate.focus();
  return false;
}
//---------------------------------------
 if(isnotAlphaNumeric1(document.frmMembRegi.checkDate.value))
	{alert("Enter a valid Check Date in the Payment Details");
	 document.frmMembRegi.checkDate.focus();
	 return false;
     }

if (isDate(document.frmMembRegi.checkDate.value)==false){
			document.frmMembRegi.checkDate.focus()
			return false; 
		}


       
//------------
/*if(!(document.frmMembRegi.checkDate.value==""))
{	 todaysDate=new Date();
	 nowDate=todaysDate.getDate();
	 nowYear=todaysDate.getYear();
	 nowMonth1=todaysDate.getMonth();
	 nowMonth=1+nowMonth1;
	if(nowDate<10)
	{nowDate="0"+nowDate;}
	if(nowMonth<10)
	{nowMonth="0"+nowMonth;}
	 
	 
strdate=document.frmMembRegi.checkDate.value;
mm = Number(strdate.substring(0,2));
dd = Number(strdate.substring(3,5));
yyyy=Number(strdate.substring(6,10));
if(mm >12 || mm< 1)
{alert("Enter valid month123 in the Check Date in the Payment Details");
 document.frmMembRegi.checkDate.focus();
 return false;}
 //if(yyyy<nowYear || yyyy>2100)
//{alert("Enter valid year in the Check Date in the Payment Details");
 //document.frmMembRegi.checkDate.focus();
//return false;}
switch (mm) {
case 1:
case 3:
case 5:
case 7:
case 8:
case 10:
case 12:
maxdays=31;
break;
case 4:
case 6:
case 9:
case 11:
maxdays=30;
break;
case 2:
maxdays=(yyyy%4==0?29:28);
default:
maxdays=0;
} 
//if((yyyy==nowYear)&&(mm<nowMonth))
//{alert("Enter valid date in the Check Date in the Payment Details");
//document.frmMembRegi.checkDate.focus();
//return false;
//}

if(nowMonth.length>2)
 {
 alert("Please enter2 a valid month")
		return false;
 }
if (nowMonth.length<1 || nowMonth<1 || nowMonth>12){
		alert("Please enter1 a valid month")
		return false;
	}


if(dd>maxdays || dd<1)
{ alert("Enter valid date in the Check Date in the Payment Details");
 document.frmMembRegi.checkDate.focus();
 return false;}

if (dd.length<0)
{ alert("Enter ");
 document.frmMembRegi.checkDate.focus();
return false;}
 //if((dd<nowDate)&&(mm==nowMonth)&&(yyyy==nowYear))
//{alert("Enter valid date in the Check Date in the Payment Details");
//document.frmMembRegi.checkDate.focus();
//return false;}*/
	

//if(document.frmMembRegi.logBy.value=="Admin")
	//{
	if(isnotIntegerChk(document.frmMembRegi.chckAmount.value))
   {
		alert("Enter a valid Check Amount");
		document.frmMembRegi.chckAmount.focus();
		return false;
	}
	//}
//-------validate activation date------------------
//if(document.frmMembRegi.logBy.value=='Admin')
//{

if(document.frmMembRegi.activeDate.value=="")
 { alert("Enter a Activation Date in Payment Details");
  document.frmMembRegi.activeDate.focus();
  return false;
}

 if(isnotAlphaNumeric1(document.frmMembRegi.activeDate.value))
	{alert("Enter a valid Activation Date in the Payment Details");
	 document.frmMembRegi.activeDate.focus();
	 return false;
     }

if (isDate1(document.frmMembRegi.activeDate.value)==false){
			document.frmMembRegi.activeDate.focus()
			return false;
		}
//}


//------------------------------
//--------for In Favor of

if(document.frmMembRegi.inFavorof.value=="")
 { alert("Enter a Bank Name info in Payment Information");
  document.frmMembRegi.inFavorof.focus();
  return false;}

if(document.frmMembRegi.inFavorof.value.indexOf(' ')==0)
 { alert("Enter valid Bank Name info in Payment Information");
  document.frmMembRegi.inFavorof.focus();
  return false;}

  
/*if(document.frmMembRegi.inFavorof.value.length>80)
 { alert("In Favor of info in Payment Information is out of range");
  document.frmMembRegi.inFavorof.focus();
  return false;}*/

/*if(isnotAlpha(document.frmMembRegi.inFavorof.value))
{alert("Enter valid Bank Name Info in Payment Information");
 document.frmMembRegi.inFavorof .focus();
  return false;}*/
  	
	
	//-----------------------for Name on check


if(document.frmMembRegi.nameOnchk.value.indexOf(' ')==0)
 { alert("Enter valid Name on Check info in Payment Information");
  document.frmMembRegi.nameOnchk.focus();
  return false;}
if(document.frmMembRegi.nameOnchk.value=="")
 { alert("Enter valid Name on Check info in Payment Information");
  document.frmMembRegi.nameOnchk.focus();
  return false;}
if(document.frmMembRegi.nameOnchk.value.length>80)
 { alert(" Name on Check info in Payment Information is out of range");
  document.frmMembRegi.nameOnchk.focus();
  return false;}

if(isnotName(document.frmMembRegi.nameOnchk.value))
{ alert("Enter valid Name on Check info in Payment Information");
  document.frmMembRegi.nameOnchk.focus();
  return false;}


/*if(isnotAlpha(document.frmMembRegi.nameOnchk.value))
{alert("Enter valid name in the Name on Check Info in Payment Information");
 document.frmMembRegi.nameOnchk.focus();
  return false;}*/
 /* if(Dospace(document.frmMembRegi.nameOnchk.value))
  {alert("Enter valid name in the Name on Check Info in Payment Information");
   document.frmMembRegi.nameOnchk.focus();
  return false;}*/
	
	}
//================================== For Card Details ========================================

	if(chosenrd=="card"){
//================================== For Card Type =========================================

		if ( document.frmMembRegi.ccTypeId.selectedIndex == 0 ){
			alert ( "Please select card type." );
			document.frmMembRegi.ccTypeId.focus();
			return false;
		}
//================================== For Card Number =========================================
		if(document.frmMembRegi.txtCard.value==""){
			alert("Enter a Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}

		if(!Number(document.frmMembRegi.txtCard.value)){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	
	if ( document.frmMembRegi.ccTypeId.selectedIndex == 3 ){
		if(document.frmMembRegi.txtCard.value.length!=15 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	}
	
	if ( document.frmMembRegi.ccTypeId.selectedIndex == 1 || document.frmMembRegi.ccTypeId.selectedIndex == 2 ){
		if(document.frmMembRegi.txtCard.value.length!=16 ){
			alert("Enter valid Card Number in the Card Details");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	}
	
		if(document.frmMembRegi.txtCard.value.indexOf('.')!=-1){
			alert("Enter Valid Card Number in the Card Details.");
			document.frmMembRegi.txtCard.focus();
			return false;
		}
	
//================================== For CVV Number =========================================
	
		if(document.frmMembRegi.txtCvvId.value!=""){
				
		if(document.frmMembRegi.txtCvvId.value.indexOf(" ")==0 ){
			alert("Empty space(s) are not allowed for CVV Number");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		if(document.frmMembRegi.txtCvvId.value.indexOf('  ')!=-1){
			alert("Empty space(s) are not allowed for CVV Number)");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		if ( document.frmMembRegi.ccTypeId.selectedIndex == 1 || document.frmMembRegi.ccTypeId.selectedIndex == 2 ){
			if(document.frmMembRegi.txtCvvId.value.length !=3){
			alert("Enter valid CVV Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		    }
		}
		if ( document.frmMembRegi.ccTypeId.selectedIndex == 3 ){
			if(document.frmMembRegi.txtCvvId.value.length !=4){
			alert("Enter valid CVV Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
			}
		}
		
		if(document.frmMembRegi.txtCvvId.value.indexOf('.')!=-1){
			alert("Enter Valid Cvv Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}
		
		if(isnotInteger(document.frmMembRegi.txtCvvId.value)){
			alert("Enter Valid Cvv Number in Card Details");
			document.frmMembRegi.txtCvvId.focus();
			return false;
		}	
		}
		
		
	
//================================= For Print Name on Card =================================	
		if(document.frmMembRegi.txtPrName.value==""){
			alert("Enter Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(document.frmMembRegi.txtPrName.value.length>80){
			alert("Entered Print Name in Card Details is out of Range.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(isnotName(document.frmMembRegi.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(Number(document.frmMembRegi.txtPrName.value)){
			alert("Enter a valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
	
		if(document.frmMembRegi.txtPrName.value.indexOf(' ')==0){
			alert("Enter a Valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;

		}
	
		if(document.frmMembRegi.txtPrName.value.indexOf('  ')!=-1){
			alert("Enter Valid Print Name in Card Details.");
			document.frmMembRegi.txtPrName.focus();
			return false;
		}
//---------------------activeDate----card---
	//if(document.frmMembRegi.logBy.value=='Admin')
//{

 	if(document.frmMembRegi.activeDate2.value=="")
 	{	 alert("Enter a Activation Date in Payment Details");
 	 	document.frmMembRegi.activeDate2.focus();
  		return false;
	 }

 	if(isnotAlphaNumeric1(document.frmMembRegi.activeDate2.value))
	{	alert("Enter a valid Activation Date in the Payment Details");
	 	document.frmMembRegi.activeDate2.focus();
		 return false;
     }

	if (isDate1(document.frmMembRegi.activeDate2.value)==false){
			document.frmMembRegi.activeDate2.focus()
			return false;
		}
//}
//================================= For Expiry Month =================================	
	
		var rightNow=new Date();
		var theYear=rightNow.getYear();
		var tMonth=rightNow.getMonth();
		var theMonth=1+tMonth;
		var theDate=rightNow.getDate();
	
		if ( document.frmMembRegi.selExpMonthId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration Month." );
			document.frmMembRegi.selExpMonthId.focus();
			return false;
		}
	
		if (document.frmMembRegi.selExpYearId.value==theYear){
			 if(document.frmMembRegi.selExpMonthId.value<theMonth){
				alert("Please Select Valid Card Expiration Month.");
				document.frmMembRegi.selExpMonthId.focus();
				return(false);   
			}
		}
		
//================================= For Expiry Year =================================	
	
		if ( document.frmMembRegi.selExpYearId.selectedIndex == 0 ){
			alert ( "Please select a Card Expiration year." );
			document.frmMembRegi.selExpYearId.focus();
			return false;
		}
	
		if (document.frmMembRegi.selExpYearId.value<theYear){
			alert("Please Select Valid Card Expiration Year.");
			document.frmMembRegi.selExpYearId.focus();
			return(false);   
		}
	}
}
//===========================================================================================================
//alert('membertypeId '+document.frmMembRegi.memberTypeId.value);


//---------------------------------------------------------------------------------
	
return true;
}
function clrRad()
{
	
	chosenrd="";
	lenrd = document.frmMembRegi.r11.length ;
	for(ird=0;ird<lenrd;ird++){
		if(document.frmMembRegi.r11[ird].checked){
			chosenrd= document.frmMembRegi.r11[ird].value;
		}
	}
	tempSec1="";
	tempSec1=document.frmMembRegi.cc11.value;
	//alert(tempSec1);
if(chosenrd=="check")
{
		
		document.frmMembRegi.cardselect.selectedIndex=0;
		document.frmMembRegi.cardNo.value="";
		document.frmMembRegi.cVVNo.value="";
		document.frmMembRegi.printName.value="";
		document.frmMembRegi.expirymonth.selectedIndex=0;
		document.frmMembRegi.expiryyear.selectedIndex=0;
		
	
  if(tempSec1=="adsec1"){
   
    var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getFullYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	document.frmMembRegi.activeDate2.value = nowMonth+"/"+nowDate+"/"+nowYear;
   }
		
}
else
{
		document.frmMembRegi.checkNo.value="";
		//document.frmMembRegi.checkDate.value="";
		document.frmMembRegi.inFavorof.value="";
		document.frmMembRegi.nameOnchk.value="";
    var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getFullYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	document.frmMembRegi.checkDate.value = nowMonth+"/"+nowDate+"/"+nowYear;
  if(tempSec1=="adsec1"){
   
    var todayDate=new Date();
	var nowDate=todayDate.getDate();
	var nowYear=todayDate.getFullYear();
	var nowMonth1=todayDate.getMonth();
	var nowMonth=1+nowMonth1;
	if(nowDate<10){nowDate="0"+nowDate;}
	if(nowMonth<10){nowMonth="0"+nowMonth;}
	document.frmMembRegi.activeDate.value = nowMonth+"/"+nowDate+"/"+nowYear;
   }
	
}

}
	
	function sameUsr1()
	{
		// alert(document.frmMembRegi.logNam.value);
	     if(document.frmMembRegi.logNam.value == document.frmMembRegi.userNameId1.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmMembRegi.userNameId1.focus();
		 
		    document.getElementById("userNameId1").value = "";
			document.getElementById("firstNameId1").value = "";
			document.getElementById("lastNameId1").value = "";
			document.getElementById("phoneId1").value = "";
						
		}
		   
		   return false;
   }
   
   function sameUsr2()
	{
		// alert(document.frmMembRegi.logNam.value);
	     if(document.frmMembRegi.logNam.value == document.frmMembRegi.userNameId2.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmMembRegi.userNameId2.focus();
		 
		    document.getElementById("userNameId2").value = "";
			document.getElementById("firstNameId2").value = "";
			document.getElementById("lastNameId2").value = "";
			document.getElementById("phoneId2").value = "";
						
		}
		   
		   return false;
   }

	function sameUsr3()
	{
		// alert(document.frmMembRegi.logNam.value);
	     if(document.frmMembRegi.logNam.value == document.frmMembRegi.userNameId3.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmMembRegi.userNameId3.focus();
		 
		    document.getElementById("userNameId3").value = "";
			document.getElementById("firstNameId3").value = "";
			document.getElementById("lastNameId3").value = "";
			document.getElementById("phoneId3").value = "";
						
		}
		   
		   return false;
   }
   
   function sameUsr4()
	{
		// alert(document.frmMembRegi.logNam.value);
	     if(document.frmMembRegi.logNam.value == document.frmMembRegi.userNameId4.value)
		 {
		   alert("You can't Register for Another Membership !");
		   document.frmMembRegi.userNameId4.focus();
		 
		    document.getElementById("userNameId4").value = "";
			document.getElementById("firstNameId4").value = "";
			document.getElementById("lastNameId4").value = "";
			document.getElementById("phoneId4").value = "";
						
		}
		   
		   return false;
   }
   
   function nonComp()
   {
		var conval=document.getElementById('memTyp_sel').value;//alert(conval);
		
		if(document.getElementById('memTyp_sel').value!="")
		{
		spval=conval.split("#");
		//alert(spval[1]);
		
		document.frmMembRegi.ctryAmt.value=0;
		//alert(document.frmMembRegi.ctryAmt.value);
		if(spval[1] != "Life Member" && spval[1] != "Family Member")
		{//alert("inside");
			//document.frmMembRegi.periodicals[0].checked = true;
			
			if(document.frmMembRegi.country.value != "USA")
			{
				//alert(document.frmMembRegi.country.value);
				ctryPrize();	
				//switchDiv('mAddress');
			}
		}
			//var famMemb=document.frmMembRegi.famMemb.value;
			//sum=sum+famMemb*addonamt;
		}	   
	   
   }
   
   
   //================== display Country Price =======================

function ctryPrize()
{
//alert(rid);

   var memTypSel=document.frmMembRegi.memTyp_sel.value
   memTypId=memTypSel.split("#");
   var ctry=document.frmMembRegi.country.value;
   
   /** 
    * This method is called when the author is selected 
    * It creates XMLHttpRequest object to communicate with the  
    * servlet  
    */ 
        url= "./MembCtryPrizeAjax.do?ctryName="+ctry+"&memTypId="+memTypId[0]; 
//alert(url);
        if (window.ActiveXObject) 
        { 
            httpRequest = new ActiveXObject("Microsoft.XMLHTTP"); 
        } 
        else if (window.XMLHttpRequest) 
        { 
            httpRequest = new XMLHttpRequest(); 
        } 
     
        httpRequest.open("GET", url, true); 
        
        httpRequest.onreadystatechange =processRequest11; 
        httpRequest.send(null); 
   } 
   
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
    function processRequest11() 
    { 
   
        if (httpRequest.readyState == 4) 
        { 
            if(httpRequest.status == 200) 
            { 
                //get the XML send by the servlet 
                 var salutationXML = httpRequest.responseXML.getElementsByTagName("ctryPrice")[0]; 
                 var salutationText = salutationXML.childNodes[0].nodeValue; 
                //Update the HTML 
                updateHTML11(salutationXML); 
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
    function updateHTML11(salutationXML) 
    { 

        

        //The node valuse will give actual data 
        var salutationText = salutationXML.childNodes[0].nodeValue; 
       
        
        
		 if(salutationText==undefined || salutationText==null || salutationText=="null" || salutationText=="")
        {
        document.frmMembRegi.ctryAmt.value="0";
        }else
        document.frmMembRegi.ctryAmt.value=salutationText;
	Sumup();

	}


//----------------------------------------------

function bandPrice()
{
	//alert("document.myform.armbandQty.value :" +document.myform.armbandQty.value);	
	if(isnotInteger(document.frmMembRegi.armbandQty.value)){
		alert('Enter Numeric value in Arm Band');
		document.frmMembRegi.armbandQty.value=0;
		document.frmMembRegi.armband.value=0;
		Sumup();
		document.frmMembRegi.armbandQty.focus();
		return false;
	}
	else{
		if((document.frmMembRegi.armbandQty.value=="")||(document.frmMembRegi.armbandQty.value.indexOf(' ')==0)){
			document.frmMembRegi.armbandQty.value=0;
			document.frmMembRegi.armband.value=0;
			Sumup();
		}
		else{
			qty=document.frmMembRegi.armbandQty.value;
			price=qty*5;
			//alert("price :"+price);	
			document.frmMembRegi.armband.value=price;
			Sumup();
		}


	}
}


function mailAmt(){
	
var n = document.frmMembRegi.pub_ct.value;
j=0;
//alert(n);
	for(i=0;i<n;i++){
	var str="mailOpt1"+i;
	if(document.getElementById(''+str).checked){
		ctryPrize();
		j++;
	//document.frmMembRegi.mailOptQuesti.checked=true;
	}
	}
	if(j==0){
		//alert(j);
		document.frmMembRegi.amountTwo_txt.value=0;	
		Sumup();
	}
	//alert(j);
 var exists = document.frmMembRegi.subsMailExist.value;
  j = 0;
 if(exists=="1"){
  	j = 0;
	var str="submailOpt10";
	if(document.getElementById(''+str).checked){	 
		ctryPrize();
		j =1;
	}
	if(j==0){
		//alert(j);
		document.frmMembRegi.amountTwo_txt.value=0;	
		Sumup();
	}	
 }
 
	
}

/* -------------------------------------------------------
 Detecting User's Browser & OS
---------------------------------------------------------*/
var BrowserDetect = {
	init: function init () {
		this.browser = this.searchString(this.dataBrowser) || "An unknown browser";
		this.version = this.searchVersion(navigator.userAgent)
			|| this.searchVersion(navigator.appVersion)
			|| "an unknown version";
		this.OS = this.searchString(this.dataOS) || "an unknown OS";
	},
	searchString: function (data) {
		for (var i=0;i<data.length;i++)	{
			var dataString = data[i].string;
			var dataProp = data[i].prop;
			this.versionSearchString = data[i].versionSearch || data[i].identity;
			if (dataString) {
				if (dataString.indexOf(data[i].subString) != -1)
					return data[i].identity;
			}
			else if (dataProp)
				return data[i].identity;
		}
	},
	searchVersion: function (dataString) {
		var index = dataString.indexOf(this.versionSearchString);
		if (index == -1) return;
		return parseFloat(dataString.substring(index+this.versionSearchString.length+1));
	},
	dataBrowser: [
		{
			string: navigator.vendor,
			subString: "Apple",
			identity: "Safari"
		},
		{
			prop: window.opera,
			identity: "Opera"
		},
		{
			string: navigator.userAgent,
			subString: "Firefox",
			identity: "Firefox"
		},
		{	// for newer Netscapes (6+)
			string: navigator.userAgent,
			subString: "Netscape",
			identity: "Netscape"
		},
		{
			string: navigator.userAgent,
			subString: "MSIE",
			identity: "Explorer",
			versionSearch: "MSIE"
		},
		{
			string: navigator.userAgent,
			subString: "Gecko",
			identity: "Mozilla",
			versionSearch: "rv"
		},
		{ 	// for older Netscapes (4-)
			string: navigator.userAgent,
			subString: "Mozilla",
			identity: "Netscape",
			versionSearch: "Mozilla"
		}
	],
	dataOS : [
		{
			string: navigator.platform,
			subString: "Win",
			identity: "Windows"
		},
		{
			string: navigator.platform,
			subString: "Mac",
			identity: "Mac"
		},
		{
			string: navigator.platform,
			subString: "Linux",
			identity: "Linux"
		}
	]

};
BrowserDetect.init()


/* -------------------------------------------------------

 Swapping Stylesheets
---------------------------------------------------------*/
var csstype="external";
var IECSS='css/core-ie.css';
var IESVNCSS='css/core-iesvn.css';
var FFCSS='css/core-mff.css'; 

function ieDetect()
{
	//alert("hi");
if (csstype=="external"){
	if(BrowserDetect.browser == "Explorer"){
		//alert(BrowserDetect.browser);
		if(BrowserDetect.version == "7.0"){
			//alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version );
			//alert("IE 7.0 is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");
			
			//alert("Your have been detected using Internet "+BrowserDetect.browser+" "+BrowserDetect.version+" "+"it's not supported. For best experience, use Internet Explorer 5.5 or 6.0!");
				
			//document.write('<link rel="stylesheet" type="text/css" href="'+ (IESVNCSS) +'" />');
			
	
		/*frmMembRegi.method="post";
		frmMembRegi.action="membershipDloadPDF.do?process=reg"; 
		frmMembRegi.submit();*/
		
		alert("Your browser might not support a clean view of this form, \nso please download the registration form and register manually");
		location.href('membershipDloadPDF.do?process=reg');
		//location.href('MembershipReg.do?process=renew');

}
			
		}else{
			document.write('<link rel="stylesheet" type="text/css" href="'+ (IECSS) +'" />');
		}
	}else if(BrowserDetect.browser == "Firefox"){
		alert("Your have been detected using "+BrowserDetect.browser+" "+BrowserDetect.version );
		alert("Your browser is not supported. For best experience, use Internet Explorer 5.5 or 6.0!");
		history.back(-1);
		document.write('<link rel="stylesheet" type="text/css" href="'+ (FFCSS) +'" />');
	}
}

//------- fam addon member 1------------------------------

var req;

function membDetails1(param){
//alert("param.value :"+param.value);
			var  url = null;
			if(param.value.length==0 || param.value.indexOf(" ")==0)
			{
				clearFields1();
			return;
			}
			
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = membRequest1;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function membRequest1(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
													
							clearFields1();
													
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									
									//alert(firstName);
									//alert(lastName);
									//alert(phone);
									var firstNameObj = document.getElementById("firstNameAdd1");
									
									var lastNameObj = document.getElementById("lastNameAdd1");
									var phoneObj = document.getElementById("phoneAdd1"); 
																		
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
									if(phone=="null"){
									 phone = "xxxx";
									 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
									
									
							} 
							if(req.status==500) {
							  alert("MembershipId does'nt exists");
							  clearFields1();
							  document.getElementById("memberAdd1").value = "";
							  document.frmMembRegi.memberAdd1.focus();
							  return;
							}
							else{ 
								
							} 
						}	
						
					} 
		 
 function clearFields1() {		
	    
		document.getElementById("firstNameAdd1").value = "";
		document.getElementById("lastNameAdd1").value = "";		
		document.getElementById("phoneAdd1").value = "";
		
 }
 
 // - ---------------- fam addon member 2 ----------------------------
 
 function membDetails2(param){
//alert("param.value :"+param.value);
			var  url = null;
			if(param.value.length==0 || param.value.indexOf(" ")==0)
			{
				clearFields2();
			return;
			}
			
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = membRequest2;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function membRequest2(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
													
							clearFields2();
													
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									
									//alert(firstName);
									//alert(lastName);
									//alert(phone);
									var firstNameObj = document.getElementById("firstNameAdd2");
									
									var lastNameObj = document.getElementById("lastNameAdd2");
									var phoneObj = document.getElementById("phoneAdd2"); 
																		
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
									if(phone=="null"){
									 phone = "xxxx";
									 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
									
									
							} 
							if(req.status==500) {
							  alert("MembershipId does'nt exists");
							  clearFields2();
							  document.getElementById("memberAdd2").value = "";
							  document.frmMembRegi.memberAdd2.focus();
							  return;
							}
							else{ 
								
							} 
						}	
						
					} 
		 
 function clearFields2() {
	    
		document.getElementById("firstNameAdd2").value = "";
		document.getElementById("lastNameAdd2").value = "";		
		document.getElementById("phoneAdd2").value = "";
		
 }
 
 // - ---------------- fam addon member 3 ----------------------------
 
 function membDetails3(param){
//alert("param.value :"+param.value);
			var  url = null;
			if(param.value.length==0 || param.value.indexOf(" ")==0)
			{
				clearFields3();
			return;
			}
			
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = membRequest3;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function membRequest3(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
													
							clearFields3();
													
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									
									//alert(firstName);
									//alert(lastName);
									//alert(phone);
									var firstNameObj = document.getElementById("firstNameAdd3");
									
									var lastNameObj = document.getElementById("lastNameAdd3");
									var phoneObj = document.getElementById("phoneAdd3"); 
																		
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
									if(phone=="null"){
									 phone = "xxxx";
									 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
									
									
							} 
							if(req.status==500) {
							  alert("MembershipId does'nt exists");
							  clearFields3();
							  document.getElementById("memberAdd3").value = "";
							  document.frmMembRegi.memberAdd3.focus();
							  return;
							}
							else{ 
								
							} 
						}	
						
					} 
		 
 function clearFields3() {		
		
		document.getElementById("firstNameAdd3").value = "";
		document.getElementById("lastNameAdd3").value = "";		
		document.getElementById("phoneAdd3").value = "";
		
 }
 
 // - ---------------- fam addon member 4 ----------------------------
 
 function membDetails4(param){
//alert("param.value :"+param.value);
			var  url = null;
			if(param.value.length==0 || param.value.indexOf(" ")==0)
			{
			clearFields4();
			return;
			}
			
			url = "annualAjax.do?method=memberDetail&memberId="+escape(param.value);
			if (window.ActiveXObject){ 
				req = new ActiveXObject("Microsoft.XMLHTTP"); 
			} 
			else if (window.XMLHttpRequest){ 
				req = new XMLHttpRequest(); 
			} 
			
			req.onreadystatechange = membRequest4;         
			req.open("GET", url, true);
			req.send(null);  
} 
   /** 
    * This is the call back method 
    * If the call is completed when the readyState is 4 
    * and if the HTTP is successfull when the status is 200 
    * update the profileSection DIV 
    */ 
         function membRequest4(){ 
    			if (req.readyState == 4){ 
						   
							if(req.status == 200){ 
													
							clearFields4();
													
								 var xmlDoc = req.responseXML.documentElement;
								  //  var userNoId =xmlDoc.getElementsByTagName('userNo')[0].childNodes[0].nodeValue;
									var firstName =xmlDoc.getElementsByTagName('firstName')[0].childNodes[0].nodeValue;
									var lastName =xmlDoc.getElementsByTagName('lastName')[0].childNodes[0].nodeValue; 
									var phone =xmlDoc.getElementsByTagName('phone')[0].childNodes[0].nodeValue; 
									
									//alert(firstName);
									//alert(lastName);
									//alert(phone);
									var firstNameObj = document.getElementById("firstNameAdd4");
									
									var lastNameObj = document.getElementById("lastNameAdd4");
									var phoneObj = document.getElementById("phoneAdd4"); 
																		
									firstNameObj.value=firstName;
									lastNameObj.value=lastName;
									if(phone=="null"){
									 phone = "xxxx";
									 }
									 
										var phLen = phone.length;
										var minPhLen = phLen - 4;
										phoneObj.value=phone.substring(minPhLen,phLen);
									
									
							} 
							if(req.status==500) {
							  alert("MembershipId does'nt exists");
							  clearFields4();
							  document.getElementById("memberAdd4").value = "";
							  document.frmMembRegi.memberAdd4.focus();
							  return;
							}
							else{ 
								
							} 
						}	
						
					} 
		 
 function clearFields4() {		
		
		document.getElementById("firstNameAdd4").value = "";
		document.getElementById("lastNameAdd4").value = "";		
		document.getElementById("phoneAdd4").value = "";
		
 }
 
 //Calculate the total amount for dontations

function totalDonation(){
	document.frmMembRegi.totDonaAmt.value=0;
	sum=0;
	//sum=Number(document.frmMembRegi.amount_txt.value)+sum;
	finalVal = 0;
	chbxnum2=document.frmMembRegi.donCbxCt.value;
    //alert(chbxnum2);
	for(i=0;i<chbxnum2;i++)
	{ chbxname = "donCb"+i;
	  txtname="donTb"+i;
	  //alert(chbxname); 
	  if(document.getElementById(''+chbxname).checked)
	  {  	  	 
	     var txtval= document.getElementById(''+txtname).value;
		 if(isnotIntegerDecimal(txtval) == false)
		 {
	     	sum= Number(txtval) +sum;
			finalVal = sum;
		 }
		 else
		 {
			alert("Enter a valid Donation Amount");
			document.getElementById(''+txtname).focus();
			return false;
		 }
	  }
	}
	//alert("finalVal :"+finalVal);
	document.frmMembRegi.totDonaAmt.value=finalVal;
}

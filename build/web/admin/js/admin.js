// JavaScript Document
//function to trim spaces from string
function trim(s){
  return s.replace(/^\s+|\s+$/, '');
}
	
	
//function to check if email address is valid or not and return error
function isValidEmail(form_id,email,errorcolor,normalcolor) {
    var error="";
	var fld = document.forms[form_id].elements[email];
    var tfld = trim(fld.value);                        // value of field with whitespace trimmed off
    var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
    var illegalChars= /[\(\)\<\>\,\;\:\$\#\\\"\[\]]/ ;
   
    if (fld.value == "") {
        fld.style.background = errorcolor;
        error = "You didn't enter an email address.\n";
		fld.focus();  
    } else if (!emailFilter.test(tfld)) {              //test email for illegal characters
        fld.style.background = errorcolor;
        error = "Please enter a valid email address.\n";
		fld.focus();  
    } else if (fld.value.match(illegalChars)) {
        fld.style.background = errorcolor;
        error = "The email address contains illegal characters.\n";
		fld.focus();  
    } else {
        fld.style.background = normalcolor;
    }
    return error;
}
	
//function to check if username is valid or not and return error
function isValidUsername(form_id,username,errorcolor,normalcolor) {
    var error = "";
    var illegalChars = /\W/; // allow letters, numbers, and underscores
	var fld = document.forms[form_id].elements[username];
	  
    if (fld.value == "") {
        fld.style.background = errorcolor; 
        error = "You didn't enter a " + username + ".\n";
		fld.focus(); 
    } else if ((fld.value.length < 3) || (fld.value.length > 50)) {
        fld.style.background = errorcolor; 
        error = "The " + username + " is the wrong length. It must be 4 to 50 characters long \n";
		fld.focus(); 
    } else if (illegalChars.test(fld.value)) {
        fld.style.background = errorcolor; 
        error = "The " + username + "contains illegal characters. It must contain only letters and numbers and underscores\n";
		fld.focus(); 
    } else {
        fld.style.background = normalcolor;
    }
	
    return error;
}


//function to check if field contans special characters  or not and return error
function isSpecialCharacters(form_id,username,errorcolor,normalcolor){
	var error="";
	var fld = document.forms[form_id].elements[username];
    	                       // value of field with whitespace trimmed off   
    var illegalChars= /[\(\)\<\>\,\;\:\$\#\\\"\[\]]/ ;
   
    if (fld.value == "") {
        fld.style.background = errorcolor;
        error = "You didn't enter " + username + ".\n";
		fld.style.background = errorcolor;
		fld.focus();  
    }else if (fld.value.match(illegalChars)) {
        fld.style.background = errorcolor;
        error = "The " + username + " contains illegal characters.\n";
		fld.focus();  
    } else {
	    fld.style.background = normalcolor;
    }
    return error;
}


//function to check if phone number is valid or not and return error

function isValidNumber(form_id,number,errorcolor,normalcolor) {    	
	var error="";
	var fld = document.forms[form_id].elements[number];
	var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
	    
   if (fld.value == "") {
        error = "You didn't enter a "+ number + " number.\n";
        fld.style.background = errorcolor;
		fld.focus();  
    } else if (isNaN(parseInt(stripped))) {
        error = "The "+ number + " number contains illegal characters.\n";
        fld.style.background = errorcolor;
		fld.focus(); 
    } 
	else
	fld.style.background = normalcolor;
	  
    return error;
}


function isValidPhone(form_id,phone,errorcolor,normalcolor) {    	
	var error="";
	var fld = document.forms[form_id].elements[phone];
	var stripped = fld.value.replace(/[\(\)\.\-\ ]/g, '');
	    
   if (fld.value == "") {
        error = "You didn't enter a "+ phone + " number.\n";
        fld.style.background = errorcolor;
		fld.focus();  
    } else if (isNaN(parseInt(stripped))) {
        error = "The "+ phone + " number contains illegal characters.\n";
        fld.style.background = errorcolor;
		fld.focus(); 
    } else if ((stripped.length < 10)) {
        error = "The "+ phone + " number is too short. Make sure you included an area code.\n";
        fld.style.background = errorcolor;
		fld.focus(); 
    }else if ((stripped.length > 12)) {
        error = "The "+ phone + " number is too long. \n";
        fld.style.background = errorcolor;
		fld.focus(); 
    }
	else
	fld.style.background = normalcolor;
	  
    return error;
}


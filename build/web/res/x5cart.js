var imLocale = new Array();
var imExpireDays = 14 * 24 * 60 * 60 * 1000; //cookie expire date

//set a cookie value
function imSetCookie(sName,sValue,iExpireDays) {
	var dExdate = new Date();
	dExdate.setTime(dExdate.getTime()+iExpireDays);
	document.cookie = sName + "=" + escape(sValue) + ((iExpireDays==null) ? ";" : ";expires=" + dExdate.toGMTString());
}

//set a cookie value
function imGetCookie(sName) {
	if (document.cookie.length > 0) {
		var iStart = document.cookie.indexOf(sName + "=");
		if (iStart != -1) {
			iStart = iStart+sName.length+1;
			var iEnd = document.cookie.indexOf(";",iStart);
			if (iEnd == -1)
				iEnd = document.cookie.length;
			return unescape(document.cookie.substring(iStart,iEnd));
		}
	}
	return null;
}

//test cookie
function imTestCookie() {
	imSetCookie("imTest","test");
	var sValue = imGetCookie("imTest");
	if(sValue != "test")
		alert((imLocale["Err_Cookie"]!=undefined?imLocale["Err_Cookie"]:"Cookie must be enabled!"));
}

//format currency
function imCFormat(number,bExt) {
	number = Math.round(number*100)/100;
	var sCurrency = (bExt == true) ? imCurrencyEx : imCurrency;
	if (imFormat2Digit)
		number = (number == Math.floor(number)) ? number + ".00" : ( (number*10 == Math.floor(number*10)) ? number + "0" : number);   
	if (imFormatRight)
		return number + " " + sCurrency;
	else
		return sCurrency + " " + number ;     
}
function imCFormatVal(number) {
	number = Math.round(number*100)/100;
	if (imFormat2Digit)
		number = (number == Math.floor(number)) ? number + ".00" : ( (number*10 == Math.floor(number*10)) ? number + "0" : number);   
		return number.toString();
}

//get product
function imCGetProduct(sCategKey,sProdKey) {
	for(var i = 0;i < imCProducts.length;i++)
		if(imCProducts[i][0] == sCategKey && imCProducts[i][1] == sProdKey)
			return imCProducts[i];
	return null;
}

//add product to cart from link 
function imCAddProdLink(sInName,sCategKey,sProdKey,sOptKey,iQty) {
  imTestCookie();
  imCLoad(sInName);
  imCAddProd(sCategKey,sProdKey,sOptKey,iQty,false,false);
  imOpenLocation("imcart.html");
}

//add product to cart
function imCAddProd(sCategKey,sProdKey,sOptKey,iQty,bUpd,bJump) {
	var bTrov = false;
	if(iQty > 0) {
		var sCart = imGetCookie("imOrder");
		if(sCart != null && sCart != "") {
			var aCart = sCart.split("|");
			for(var i = 0;i < aCart.length && !bTrov;i++){
				aCartProd = aCart[i].split(":");
				if(aCartProd[0] == sCategKey && aCartProd[1] == sProdKey && aCartProd[2] == sOptKey) {
					if(bUpd)
						aCartProd[3] = parseInt(iQty);
					else
						aCartProd[3] = parseInt(aCartProd[3]) + parseInt(iQty);
					aCart[i] = aCartProd.join(":");
					var bTrov = true;
				}
			}
			if(!bTrov)
				aCart[i] = sCategKey + ":" + sProdKey + ":" + sOptKey + ":" + iQty;
			sCart = aCart.join("|");
		}
		else
			sCart = sCategKey + ":" + sProdKey + ":" + sOptKey + ":" + iQty;
		imSetCookie("imOrder",sCart,imExpireDays);
		if (bJump)
			imOpenLocation("imcart.html");
	}
	else if(iQty == 0 && bUpd)
		imCDelProd(sCategKey,sProdKey,sOptKey);
	else
		alert((imLocale["Err_Qty"]!=undefined?imLocale["Err_Qty"]:"Invalid value!"));
	if(bJump)
		imOpenLocation("imcart.html");
}

//delete a product from cart
function imCDelProd(sCategKey,sProdKey,sOptKey,bJump) {
	var sCart = imGetCookie("imOrder");
	if(sCart != null && sCart != "") {
		var aCart = sCart.split("|");
		sCart = "";
		for(var i=0;i < aCart.length;i++) {
			aCartProd = aCart[i].split(":");
			if(aCartProd[0] != sCategKey || aCartProd[1] != sProdKey || aCartProd[2] != sOptKey) {
				if(sCart != "")
					sCart += "|" + aCart[i];
				else
					sCart += aCart[i];
			}
		}
		imSetCookie("imOrder",sCart,imExpireDays);
	}
	if(bJump)
		window.location.reload();
		//imOpenLocation("imcart.html");
}

function imCEmptyCart(sInName,bAll){
	//Delete products
	imSetCookie("imOrder","");
	if (bAll) {
		var sName = (sInName==""?imName:sInName);
		//Delete all other data
		imSetCookie("imShipment","0",imExpireDays);
		imSetCookie("imData","",imExpireDays);
		imSetCookie("imOrderNumber","",imExpireDays);
		imSetCookie("imName",sName,imExpireDays);
	}
	else
		//window.location.reload();
		imOpenLocation("imcart.html");
}

//Load Data
function imCLoad(sInName) {
	var sName = (sInName==""?imName:sInName);
	var sGetName = imGetCookie("imName"); 
	if(sGetName != sName)
		imCEmptyCart(sName,true);
}

//show cartegory
function imCShowCateg(sKey) {
	imCLoad("");
	var sBuf = "";
	var bFound = false;
	for(var i = 0; i < imCProducts.length;i++)
		if(imCProducts[i][0] == sKey && imCProducts[i][5] != 0)
			bFound = true;
	sBuf += "<form name=\"imForm\"><table><tr>";
	sBuf += "<th class=\"imName\">" + imLocale["Name"] + "</th>";
	sBuf += "<th class=\"imDescr\">" + imLocale["Descr"] + "</th>";
	if(bFound)
		sBuf += "<th class=\"imOpt\">" + imLocale["Opt"] + "</th>";
	sBuf += "<th class=\"imPrice\">" + imLocale["Price"] + "</th>";
	sBuf += "<th class=\"imQty\">" + imLocale["Qty"] + "</th>";
	sBuf += "<th class=\"imCmd\">&nbsp;</th></tr>";
	var j;
	for(var i = 0; i < imCProducts.length;i++){
		if(imCProducts[i][0] == sKey){
			sBuf += "<tr><td class=\"imName\">" + imCProducts[i][2] + "</td>";
			sBuf += "<td class=\"imDescr\"> " + imCProducts[i][3] + "</td>";
			if(bFound) {
				sBuf += "<td class=\"imOpt\">";
				if(imCProducts[i][5] != 0) {
					sBuf += "<select class=\"imOptField\" name=\"imOpt"+ i + "\">";
					for(j = 0; j < imCProducts[i][5].length;j++){
						sBuf += "<option value=\"" + (j+1) + "\">" + imCProducts[i][5][j] + "</option>";
					}
					sBuf += "</select>";
				}
				sBuf += "</td>";
			}
			sBuf += "<td class=\"imPrice\">" + imCFormat(imCProducts[i][4],false) + "</td>";
			sBuf += "<td class=\"imQty\"><input class=\"imQtyField\" name=\"imQty"+ i + "\" type=\"text\" value=\"1\" size=\"4\" maxlength=\"4\" /></td>";
			sBuf += "<td class=\"imCmd\"><img src=\"res/imcartadd.gif\" onclick=\"imCAddProd('" + imCProducts[i][0] + "','" + imCProducts[i][1] + "'," + (imCProducts[i][5] != 0 ? "document.imForm.imOpt"+ i + ".value" : "0") + ",document.imForm.imQty" + i + ".value,false,true);\" /></td>";
			sBuf += "</tr>";
		}
	}
	sBuf += "</table></form>";
	document.write(sBuf);
}

//get all cart products
function imCGetCart(bReport) {
	imCLoad("");
	var sBuf = "";
	var iTotal = 0;
	var i,j;
	var bFound = false;
	var sCart = imGetCookie("imOrder");
	var aCart = "";
	if(sCart != null && sCart != "")
		aCart = sCart.split("|");
	else
		aCart = new Array();
	for(i = 0;i < aCart.length && !bFound;i++) {
		aCartProd = aCart[i].split(":");
		if(aCartProd[2] != 0)
			bFound = true;
	}
	sBuf += "<table><tr>";
	sBuf += "<th class=\"imDescr\">" + imLocale["Descr"] + "</th>";
	if(bFound)
		sBuf += "<th class=\"imOpt\">" + imLocale["Opt"] + "</th>";
	//sBuf += "<th class=\"imPrice\">" + imLocale["Price"] + "</th>";
	sBuf += "<th class=\"imQty\">" + imLocale["Qty"] + "</th>";
	//sBuf += "<th class=\"imPrice\">" + imLocale["SubTot"] + "</th>";
	if(!bReport)
		sBuf += "<th class=\"imCmd\">&nbsp;</th></tr>";
	if(aCart.length == 0)
		sBuf += "<tr><td colspan=\"5\">" + imLocale["Err_EmptyCart"] + "</td></tr>";
	else
		for(i = 0;i < aCart.length;i++){
			aCartProd = aCart[i].split(":");
			aProd = imCGetProduct(aCartProd[0],aCartProd[1]);
			sBuf += "<tr><td class=\"imDescr\">" + aProd[2] + " - " + aProd[3] + "</td>";
			if(bFound) {
				sBuf += "<td class=\"imOpt\">";
				if(aProd[5] != 0 && !bReport) {
					sBuf += "<select name=\"imOpt"+ i + "\" class=\"imOptField\" onchange=\"imCDelProd('" + aCartProd[0] + "','" + aCartProd[1] + "','" + aCartProd[2] + "',false); imCAddProd('" + aCartProd[0] + "','" + aCartProd[1] + "',this.value,imGetLayer('imQty" + i + "').value,false,true);\">";
					for(j = 0; j < aProd[5].length; j++)
						sBuf += "<option value=\"" + (j+1) + "\"" + (j+1 == parseInt(aCartProd[2]) ? " selected=\"selected\"" : "") + ">" + aProd[5][j] + "</option>";
					sBuf += "</select>";
				}
				else if(aProd[5] != 0 && bReport)
					sBuf += aProd[5][aCartProd[2]-1];
				sBuf += "</td>";
			}
			//sBuf += "<td class=\"imPrice\"> " + imCFormat(aProd[4],false) + "</td>";
			sBuf += "<td class=\"imQty\">" + (bReport ? aCartProd[3] : "<input type=\"text\" id=\"imQty" + i + "\" class=\"imQtyField\" onchange=\"imCAddProd('" + aCartProd[0] + "','" + aCartProd[1] + "','" + aCartProd[2] + "',this.value,true,true);\" onkeypress=\"if(imIsEnter(event)) {imCAddProd('" + aCartProd[0] + "','" + aCartProd[1] + "','" + aCartProd[2] + "',this.value,true,true); return false;}\" value=\"" + aCartProd[3] + "\" size=\"4\" />") + "</td>";
			//sBuf += "<td class=\"imPrice\"> "+ imCFormat(aProd[4]*aCartProd[3],false) + "</td>";
			iTotal += aProd[4]*aCartProd[3];
			if(!bReport)
				sBuf += "<td class=\"imCmd\"><img onclick=\"imCDelProd('" + aCartProd[0] + "','" + aCartProd[1] + "','" + aCartProd[2] + "',true);\" src=\"res/imcartdel.gif\" /></td>";
			sBuf += "</tr>";
		}
	if(!bReport){
		if(aCart.length != 0) {
			//sBuf += "<tr><td colspan=\"" + (bFound ? 4 : 3) + "\" style=\"text-align: right; \">" + imLocale["Total"] + ":</td>";
			//sBuf += "<td style=\"text-align: right; \"><b>" + imCFormat(iTotal,false) + "</b></td></tr>";
		}
	}
	else {
		iShipmentType = imGetCookie("imShipment");
		if(iShipmentType == null)
			iShipmentType = 0;
		sBuf += "<tr><td colspan=\"" + (bFound ? 4 : 3) + "\">" + imCShipment[iShipmentType][0] + "</td>";
		sBuf += "<td style=\"text-align: right;\"> " + imCFormat(imCShipment[iShipmentType][2],false) + "</td></tr>";
		sBuf += "<tr><td colspan=\"" + (bFound ? 4 : 3) + "\" style=\"text-align: right; border: none; \">" + imLocale["Total"] + ":</td>";
		sBuf += "<td style=\"text-align: right; border: none; \"><b>" + imCFormat(iTotal+Number(imCShipment[iShipmentType][2]),false) + "</b></td></tr>";
		if (imVAT != 0) {
      sBuf += "<tr><td colspan=\"" + (bFound ? 4 : 3) + "\" style=\"text-align: right; border: none; \">" + imLocale["TotalVAT"] + " (" + imVAT + "%)" + ":</td>";
      sBuf += "<td style=\"text-align: right; border: none; \"><b>" + imCFormat((iTotal+Number(imCShipment[iShipmentType][2]))*Number(1+imVAT/100),false) + "</b></td></tr>";  		
		}
	}
	sBuf += "</table>";
	document.write(sBuf); 
}

//Show Shipment options
function imCShowShipment(){
	var sBuf = "";
	var sCart = imGetCookie("imOrder");
	if(sCart == null)
		sCart = "";
	var iShipmentType = imGetCookie("imShipment");
	if(iShipmentType == null)
		iShipmentType = 0;
	for(var i = 0;i < imCShipment.length;i++)
		sBuf += "<p style=\"display:none\" class=\"imShipItem\"><label for=\"imOption" + i + "\"><input name=\"imOption\" id=\"imOption" + i + "\" type=\"radio\" " + ( (i == iShipmentType) ? "checked=\"checked\"" : "" ) + "/><b>" + imCShipment[i][0] + "</b>" + (imCShipment[i][2] != 0 ? " (" + imCFormat(imCShipment[i][2],false) + ")" : "") + "<br />" + imCShipment[i][1] + "</label></p>";
	sBuf += "<p class=\"imAlign_center\"><input type=\"button\" class=\"imCartButton\" value=\"" + imLocale["GoShop"] + "\" onclick=\"imOpenLocation('" + imShopPage + "')\" /><input type=\"button\" class=\"imCartButton\" value=\"" + imLocale["EmptyCart"] + "\" onclick=\"imCEmptyCart('',false);\" />";
	if(sCart != "")
		sBuf += "<input type=\"submit\" class=\"imCartButton\" value=\"" + imLocale["GoNext"] + "\" />";
	document.write(sBuf);
}

//add shipment cost
function imCCheckout(){
	var i = 0;
	var bTrov = false;
	for(var j = 0;j < document.frmShipment.length && !bTrov; j++)
		if(document.frmShipment[j].name == "imOption"){
			if(document.frmShipment[j].checked==true){
				iShipmentType = i;
				bTrov = true;
			}
			i++;
		}
	imSetCookie("imShipment",iShipmentType,imExpireDays);
	imOpenLocation("imform.html");
}

//get user info
function imCGetUserData() {
	var j = 0;
	var sUserData = imGetCookie("imData");
	if(sUserData != null && sUserData != "") {
		var aUserData = sUserData.split("|");
		sUserData = "";
		for(var i = 0;i < document.imFormTableDat.elements.length;i++) {
			if(document.imFormTableDat.elements[i].name == "imTxtDat") {
				if(aUserData[j] == "")
					document.imFormTableDat.elements[i].value="";
				else
					document.imFormTableDat.elements[i].value=aUserData[j];
				aUserData[j] = imCLabels[j] + "::" + aUserData[j];
				j++;
			}
		}
	}
	return aUserData.join("||");
}

//set user info
function imCSetUserData() {
	var sUserData = "";
	for(var i = 0;i < document.imFormTableDat.elements.length; i++)
		if (document.imFormTableDat.elements[i].name == "imTxtDat") {
			var sItem = document.imFormTableDat.elements[i].value;
			if(sItem == "")
				sItem = " ";
        sItem = sItem.split('"');
        sItem = sItem.join('\'');
			if(sUserData != "")
				sUserData  += "|" + sItem;
			else
				sUserData  += sItem;
		}
	imSetCookie("imData",sUserData,imExpireDays);
	imOpenLocation("imreport.html"); 	
}

//get order info
function imCGetOrderData() {
	var iTotal = 0;
	var sCart = imGetCookie("imOrder");
	var aCart = sCart.split("|");
	var iShipmentType = imGetCookie("imShipment");
	for(var i = 0;i < aCart.length;i++) {
		aCartProd = aCart[i].split(":");
		aProd = imCGetProduct(aCartProd[0],aCartProd[1]);
		aCart[i] = aProd[2] + "::" + aProd[3] + (aProd[5] != 0 ? "::" + aProd[5][aCartProd[2]-1] : "") + "::" + imCFormat(aProd[4],true) + "::" + aCartProd[3] + "::" + imCFormat(aProd[4]*aCartProd[3],true);
		iTotal += aProd[4]*aCartProd[3];
	}
	aCart[i] = imCShipment[iShipmentType][0] + "::" + imCFormat(imCShipment[iShipmentType][2],true);
	aCart[i+1] = imLocale["Total"] + "::" + imCFormat(iTotal+Number(imCShipment[iShipmentType][2]),true);
	if (imVAT != 0) 
     aCart[i+2] = imLocale["TotalVAT"] + " (" + imVAT + ")::" + imCFormat((iTotal+Number(imCShipment[iShipmentType][2]))*(1+(imVAT/100)),true);
	sCart = aCart.join("||");
	return sCart;
}

//get mail text
function imCGetOrderNo() {
	var dToday = new Date(); //today
	var sOrderNumber = (dToday.getFullYear() + "").substring(2,4) + (1+dToday.getMonth()) + dToday.getDate() + "-" + dToday.getHours() + dToday.getMinutes() + dToday.getSeconds();
	imSetCookie("imOrderNumber",sOrderNumber,imExpireDays);
	
	sOrderNumber = imLocale["Order_No"] + ": " + sOrderNumber;
	return sOrderNumber;
}

//Show order number
function imCShowOrderNo() {
	var sBuf = "";
	var sOrderNumber = imGetCookie("imOrderNumber");
	sBuf = "<div id=\"imOrderID\">" + imLocale["Order_No"] + ": <b>" + sOrderNumber + "</b></div>";
	document.write(sBuf);
}

//Show PayNow Button
function imCShowPayButton() {
	//Show PayNow 
	var iTotal = 0;
	var sCart = imGetCookie("imOrder");
	var aCart = sCart.split("|");
	var iShipmentType = imGetCookie("imShipment");
	var sOrderNumber = imGetCookie("imOrderNumber");
	for(var i = 0;i < aCart.length;i++) {
		aCartProd = aCart[i].split(":");
		aProd = imCGetProduct(aCartProd[0],aCartProd[1]);
		iTotal += aProd[4]*aCartProd[3];
	}
	
	if (imPayLink != "" && imCShipment[iShipmentType][3] == 1) {
		var sBuf = "";
		var sPrice = "";
    //Format total
		sPrice = imCFormatVal((iTotal+Number(imCShipment[iShipmentType][2]))*(1+(imVAT/100)));
		if (imPayMode == 0)
			sPrice = escape(sPrice);
		sBuf = imPayLink.replace(/\[PRICE]/, sPrice);
		sBuf = sBuf.replace(/\[ORDER_NO]/, sOrderNumber);
		if (imPayMode == 0) {
			//Pay Pal
			sBuf = "<p class=\"imAlign_center\"><input class=\"imCartButton\" type=\"button\" value=\""+imLocale["PayNow_Button"]+"\" onclick=\"imOpenLocation('" + sBuf + "')\" /></p>";
			sBuf = imLocale["PayNow"] + sBuf + "<br />";
		}
		document.write(sBuf);
	}
  //Empty cookie
	imSetCookie("imOrder","");
}

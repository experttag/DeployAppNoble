<%@page import="com.noble.admin.utility.StringHelper" %>

<%String baseUrl = StringHelper.getBaseUrl(request);%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Noble furniture : Price Inquiry</title>
<script src="admin/js/admin.js"></script>
<style type="text/css">
body {
margin:0;
padding:0;
}

.outerTable
{
font-family:Arial, Helvetica, sans-serif;
width:440px;
border:dashed 1px #001674;
font-weight:bold;
}

.prodTitleTD
{
font-size:13px;
background:#576F31;
color:#FFFFFF;
padding:5px;
}

.outerTableTd
{
padding:10px;
}

.priceInquiryLabel
{
font-size:13px;
color:#333333;
padding:6px;
text-align:left;
}

.priceInquiryField
{
font-size:13px;
padding:6px;
text-align:left;
}

.priceInquryTextField
{
width:280px;
}

.requiredSymbol
{
color:#FF0000;
}


</style>

<script>


function validateEnquiry() {
   var error="";
   errorcolor = "Yellow";
   normalcolor = "white";

   error=isValidUsername("inquiryFrm","inq_name",errorcolor,normalcolor)
   error=isValidEmail("inquiryFrm","inq_email",errorcolor,normalcolor);
   //error=isValidPhone("inquiryFrm","inq_phone",errorcolor,normalcolor);
   error= isSpecialCharacters("inquiryFrm","inq_ques",errorcolor,normalcolor);    

   if((error!="")) {
      alert(error);
      return false;
   }
   this.close();
   return true;
}


</script>

</head>
<body>

<table class="outerTable" style="" align="center" valign="top" border="0" cellpadding="0" cellspacing="0">
	<tr>
	<td class="outerTableTd">
		<form action="<%=baseUrl %>Mail.do" target="_parent" method="post"  name="inquiryFrm" id="inquiryFrm" onsubmit="return validateEnquiry()">
		<table width="100%" align="left" cellpadding="0" cellspacing="0" border="0">
			<tr>
				<td class="prodTitleTD" colspan="2">
                    <%=request.getParameter("productName")==null?"": request.getParameter("productName")%>
				</td>                
			</tr>
			
			<tr><td style="height:15px;"></td></tr>


			<tr>
				<td class="priceInquiryLabel" style="width:30%;">
					<span class="requiredSymbol">*</span>Full Name:
				</td>
				<td class="priceInquiryField" style="width:70%;">
					<input class="priceInquryTextField" type="text" name="inq_name" id="inq_name" value="" />
				</td>
			</tr>

			<tr>
				<td class="priceInquiryLabel" >
					<span class="requiredSymbol">*</span>Email:
				</td>
				<td class="priceInquiryField" >
					<input class="priceInquryTextField" type="text" name="inq_email" id="inq_email" value="" />
				</td>
			</tr>

			<tr>
				<td class="priceInquiryLabel" >
					Phone:
				</td>
				<td class="priceInquiryField" >
					<input class="priceInquryTextField" type="text" name="inq_phone" id="inq_phone" value="" />
				</td>
			</tr>

			<tr>
				<td class="priceInquiryLabel" >
					City:
				</td>
				<td class="priceInquiryField" >
					<input class="priceInquryTextField" type="text" name="inq_city" id="inq_city" value="" />
				</td>
			</tr>

			<tr>
				<td class="priceInquiryLabel" >
					State:
				</td>
				<td class="priceInquiryField" >
					<input class="priceInquryTextField" type="text" name="inq_state" id="inq_state" value="" />
				</td>
			</tr>

	
			<!--tr>
				<td class="priceInquiryLabel" >
					How you want us to contact you back :
				</td>
				<td class="priceInquiryField" >
					<select name="inq_method" id="inq_method" size="1" style="height:22px; width:150px;">
						<option value="Phone" >Phone</option>
						<option value="Email" >Email</option>
					</select>
				</td>
			</tr-->

			<tr>
				<td class="priceInquiryLabel" >
					<span class="requiredSymbol">*</span>Questions:
				</td>
				<td class="priceInquiryField" >
					<textarea rows="7" cols="33" name="inq_ques" id="inq_ques" ></textarea>
				</td>
			</tr>

			<tr>
				<td class="priceInquiryLabel" >&nbsp;

				</td>
				<td class="priceInquiryField" >
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="hidden" name="item_id" id="item_id" value="<%=request.getParameter("productId") %>" />
                    <input type="hidden" name="method" value="enquiry">
					<input type="submit" name="inquirySubmit" id="inquirySubmit" value="Send" />
				</td>
			</tr>

			<tr>
				<td colspan="2" style="text-align:right;">

				</td>
			</tr>

		</table>
		</form>

	</td>
	</tr>
</table>

</body>
</html>
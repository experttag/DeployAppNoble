<%@page import="java.util.ArrayList" %> 
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>
 
<%
        String username = (String)session.getAttribute("username");
        ArrayList priceranges  = (ArrayList)session.getAttribute("priceranges");
        ArrayList categories   =(ArrayList)session.getAttribute("categories");

        int numCategory=0 , numRange=0;

        if(categories!=null) numCategory = categories.size();
        if(priceranges!=null) numRange = priceranges.size();

        IntPair range = null;
        IntStringPair category = null;

        String baseUrl = StringHelper.getBaseUrl(request);

if (username == null) {
%>
    <jsp:forward page="login.jsp" />
<%}%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Noble furniture - adminstration</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="<%=baseUrl%>admin/css/experttag_style.css" rel="stylesheet" type="text/css" />
<script src="<%=baseUrl%>admin/js/admin.js"></script>


<script>

function validateaddform(){
	
			var error="";
			errorcolor = "#000";
			normalcolor = "#000";
		   
		   error=error+ isSpecialCharacters("addproduct","productname",errorcolor,normalcolor);
		   error=error+ isSpecialCharacters("addproduct","productdescription",errorcolor,normalcolor);
		   error=error+ isValidNumber("addproduct","productprice",errorcolor,normalcolor);
		   
		   		   
		   if((error!="")) {
			  alert(error);	  
			  return false;
		   }
		   
		   return true;
	}


   function validateupdateform(){

			var error="";
			errorcolor = "#000";
			normalcolor = "#000";

		   error=error+ isSpecialCharacters("updateproduct","update_productname",errorcolor,normalcolor);
		   error=error+ isSpecialCharacters("updateproduct","update_productdescription",errorcolor,normalcolor);
		   error=error+ isValidNumber("updateproduct","update_productprice",errorcolor,normalcolor);


		   if((error!="")) {
			  alert(error);
			  return false;
		   }

		   return true;
	}



 function validateremoveform(){

     if(confirm("This action will remove the product details permanently from system. \n Do you want to continue?")=="OK")
         return true;
     else
         return false;

 }


	
function openupdateproduct(){

 	window.open("<%=baseUrl%>admin/findproduct.jsp" , "findproduct" , "height=600,width=600");
}

function opendeleteproduct(){

 	window.open("<%=baseUrl%>admin/findproduct.jsp" , "findproduct" , "height=600,width=600");
}

function showaddproduct(){
        hideall();
        document.getElementById("addsection").style.display="";
}

function showupdateproduct(){
        hideall();
        document.getElementById("updatesection").style.display="";
}

function showdeleteproduct(){
        hideall();
        document.getElementById("deletesection").style.display="";
}

function hideall(){
    document.getElementById("addsection").style.display="none";
    document.getElementById("updatesection").style.display="none";
    document.getElementById("deletesection").style.display="none";
    document.getElementById("infosection").style.display="none";

}


function updateproduct (productId,productname,productdescription , productImage, prodCategoryId,prodCategoryName, productprice,newArrivalInd){
    
    document.forms["updateproduct"].elements["productname"].value=productname;
    document.forms["updateproduct"].elements["productdescription"].value=productdescription;
    //document.forms["updateproduct"].elements["productImage"].value=productImage;
    document.forms["updateproduct"].elements["prodCategoryId"].value=prodCategoryId;
    document.forms["updateproduct"].elements["productprice"].value=productprice;
    if(newArrivalInd==0)
        document.getElementById("update_newArrivalInd1").checked=false;
    else
        document.getElementById("update_newArrivalInd2").checked=true;

    document.forms["updateproduct"].elements["productId"].value=productId;

    showupdateproduct();
}


function removeproduct (productId,productname,productdescription , productImage, prodCategoryId,prodCategoryName, productprice,newArrivalInd){

    
    document.getElementById("del_productId").value=productId;    
    document.getElementById("del_productname").innerHTML=productname;
    document.getElementById("del_productdescription").innerHTML=productdescription;
    document.getElementById("del_productImage").innerHTML=productImage;
    document.getElementById("del_prodCategoryId").innerHTML=prodCategoryName;
    document.getElementById("del_productprice").innerHTML=productprice;
    if(newArrivalInd==0)
        document.getElementById("del_newArrivalInd").innerHTML="No";
    else
        document.getElementById("del_newArrivalInd").innerHTML="Yes";

    showdeleteproduct();
}

</script>

</head>

<body>
    <jsp:include page="header.jsp?item=admin"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

            
        
        	<div id="experttag_left_section" >


                <div id="infosection" class="experttag_post"><!-- start : info product-->

                	<div class="experttag_post_top">
                    	<h1>Welcome to admin section</h1>
                    </div>
                    <div class="experttag_post_mid">

                    <% String message = (String)session.getAttribute("message");

                        if(message==null){
                     %>
                     <p>
                        Please choose operaions from right mejnu.
                        <br>Do not try to refresh page.
                       <br><br>
                     </p>
                     <% }else{%>
                     <p> <%=message%> </p>
                     <%}
                        session.setAttribute("message",null);
                    %>


                        <div class="clear"></div>

                    </div>


				</div><!-- end : delete product-->

               

            	
                <div id="addsection" class="experttag_post" style="display:none"><!-- start : add product-->
                
                	<div class="experttag_post_top">
                    	<h1>add new product</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="addproduct" action="<%=baseUrl%>AdminProduct.do" name="addproduct" ENCTYPE="multipart/form-data" method="post" onsubmit="return validateaddform()" >
						<table >
							  <tr>
								<td colspan="2">1. product name</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text" class="textfield" name="productname" id="productname" ></td>
							  </tr>
							  <tr>
								<td colspan="2">2. product description</td>
							  </tr>
							  <tr>
								<td colspan="2"><textarea class="textfield" name="productdescription" id="productdescription" style="height:40px;"> </textarea></td>
							  </tr>
							  <tr>
								<td>3. product category</td>
							    <td>4. product price</td>								
							  </tr>
							  <tr>
								<td>
									<select class="textfield"  id="prodCategoryId" name="prodCategoryId" style="height:25px; width:200px;">
									   <%
                                         if(numCategory>0){
                                             for(int i=0; i<numCategory;i++){
                                                 category = (IntStringPair)categories.get(i);
                                       %>
                                       <option value="<%=category.getId() %>" ><%=category.getValue() %></option>
                                       <%}}%>
									</select>
								</td>
							  
								<td><input type="text" class="textfield" name="productprice" id="productprice"  style="width:150px;"></td>
							  </tr>
							  <tr>
								<td>5. is new arrival ?</td>
								<td>6. productImage</td>
							  </tr>
							  <tr>
								<td>
								<input type="radio" class="optionfield"   name="newArrivalInd"  id="newArrivalInd" checked="checked" value="0"/>no
								<br><input type="radio" class="optionfield"   name="newArrivalInd"  id="newArrivalInd" value="1"/>yes
								<br><br>
								</td>							  
								<td><input  class="textfield" style="height:25px;width:150px;" type="file" name="productImage" id="productImage"></td>
							  </tr>
							  <tr>
								<td colspan="2"><hr></td>
							  </tr>
							  <tr>
								<td  colspan="2" align="center"><input type="submit" class="buttonfield" name="add product" value="Add product"></td>
							  </tr>
						</table>

                            <input type="hidden" name="method" value="addproduct" />
						</form>

					
                        <div class="clear"></div>
                        
                    </div>
                    <div class="experttag_post_bottom">
                    
                    	<span class="post">* special characters are not allowed in input fields</span>
						<br><span class="post">* filesize must be less than 10 mb</span>
                        <br><br>
                    </div>
                    
				</div><!-- end : add product-->
				
				
                 <div id="updatesection" class="experttag_post" style="display:none"><!-- start : update product-->

                	<div class="experttag_post_top">
                    	<h1>update product</h1>
                    </div>
                    <div class="experttag_post_mid">

                        <form id="updateproduct" action="<%=baseUrl%>AdminProduct.do" name="updateproduct" ENCTYPE="multipart/form-data"  method="post" onsubmit="return validateupdateform()" >
						<table >
							  <tr>
								<td colspan="2">1. product name</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text" class="textfield" name="productname" id="update_productname" ></td>
							  </tr>
							  <tr>
								<td colspan="2">2. product description</td>
							  </tr>
							  <tr>
								<td colspan="2"><textarea class="textfield" name="productdescription" id="update_productdescription" style="height:40px;"> </textarea></td>
							  </tr>
							  <tr>
								<td>3. product category</td>
							    <td>4. product price</td>
							  </tr>
							  <tr>
								<td>
									<select class="textfield"  id="update_prodCategoryId" name="prodCategoryId" style="height:25px; width:150px;">
									   <%
                                         if(numCategory>0){
                                             for(int i=0; i<numCategory;i++){
                                                 category = (IntStringPair)categories.get(i);
                                       %>
                                       <option value="<%=category.getId() %>" ><%=category.getValue() %></option>
                                       <%}}%>
									</select>
								</td>

								<td><input type="text" class="textfield" name="productprice" id="update_productprice"  style="width:150px;"></td>
							  </tr>
							  <tr>
								<td>5. is new arrival ?</td>
								<td>6. productImage</td>
							  </tr>
							  <tr>
								<td>
								<input type="radio" class="optionfield"   name="newArrivalInd"  id="update_newArrivalInd1"  value="0"/>no
								<br><input type="radio" class="optionfield"   name="newArrivalInd"  id="update_newArrivalInd2" value="1"/>yes
								<br><br>
								</td>
								<td><input  class="textfield" style="height:25px;width:150px;color:black;" name="productImage" id="update_productImage" type="file"></td>
							  </tr>
							  <tr>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td align="right"><input type="submit" class="buttonfield" style="width:120px;" name="update product" value="update product"></td>
							  </tr>
						</table>
                        <input type="hidden" name="productId" id="update_productId" value="" />
                        <input type="hidden" name="method" value="updateproduct" />
						</form>


                        <div class="clear"></div>

                    </div>
                    <div class="experttag_post_bottom">

                    	<span class="post">* special characters are not allowed in input fields</span>
						<br><span class="post">* filesize must be less than 10 mb</span>
                        <br><br>
                    </div>

				</div><!-- end : update product-->



                 <div id="deletesection" class="experttag_post" style="display:none"><!-- start : delete product-->

                	<div class="experttag_post_top">
                    	<h1>remove product</h1>
                    </div>
                    <div class="experttag_post_mid">

                        <form id="deleteproduct" action="<%=baseUrl%>AdminProduct.do" name="deleteproduct" ENCTYPE="multipart/form-data" method="post" onsubmit="return validateremoveform()" >
						<table class="deleteproduct">
							  <tr>
								<td colspan="2">1. product name</td>
							  </tr>
							  <tr>
                                <td colspan="2"><span id="del_productname" ></span> </td>
							  </tr>
							  <tr>
								<td colspan="2">2. product description</td>
							  </tr>
							  <tr>
                                <td colspan="2"><span id="del_productdescription" > </span> </td>
							  </tr>
							  <tr>
								<td>3. product category</td>
							    <td>4. product price</td>
							  </tr>
							  <tr>
								<td>
                                    <span  id="del_prodCategoryId"> </span>
								</td>

                                <td><span  id="del_productprice"></span> </td>
							  </tr>
							  <tr>
								<td>5. is new arrival ?</td>
								<td>6. productImage</td>
							  </tr>
							  <tr>
								<td><span  id="del_newArrivalInd" > </span></td>
								<td><span  id="del_productImage" > </span></td>
							  </tr>
							  <tr>
								<td colspan="2"><hr></td>
							  </tr>
							  <tr>
								<td  colspan="2" align="center"><input type="submit" class="buttonfield" style="width:120px;" name="remove product" value="remove product"></td>
							  </tr>
						</table>
                            <input type="hidden" id="del_productId" name="productId" value="" />
                            <input type="hidden" name="method" value="removeproduct" />
						</form>


                        <div class="clear"></div>

                    </div>
                   

				</div><!-- end : delete product-->
				
            </div><!-- end of left section-->
            
            <div id="experttag_right_section">
            	                
                <div class="experttag_section_box">
                	<div class="experttag_section_box_top">
                    
                    	<h1>Select operation</h1>
                        
                    </div>
					<div class="experttag_section_box_mid">
                   		
						<ul>
                        	<li><a href="javascript:showaddproduct()">add new product</a></li>
                            <li><a href="javascript:openupdateproduct()">update existing product</a></li>
                            <li><a href="javascript:opendeleteproduct()">remove existing product</a></li>
                        </ul>
					</div>
                    <div class="experttag_section_box_bottom"></div>
                </div><!-- end of section box -->
                
            
            </div><!-- end of right Section -->
            
        </div><!-- end of container-->
	</div><!-- end of background middle-->
    
    <jsp:include page="footer.jsp" />
    
</body>

</html>
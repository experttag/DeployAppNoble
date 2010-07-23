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
    <jsp:forward page="login.html" />
<%}%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Noble furniture - adminstration</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="admin/css/experttag_style.css" rel="stylesheet" type="text/css" />
<script src="admin/js/admin.js"></script>


<script>

function validateaddform(){
	
			var error="";
			errorcolor = "#000";
			normalcolor = "#000";
		   
		   error=error+ isValidUsername("addproduct","productname",errorcolor,normalcolor);
		   error=error+ isSpecialCharacters("addproduct","productdescription",errorcolor,normalcolor);
		   error=error+ isValidNumber("addproduct","productprice",errorcolor,normalcolor);
		   
		   		   
		   if((error!="")) {
			  alert(error);	  
			  return false;
		   }
		   
		   return true;
	}
	
function openupdateproduct(){

 	window.open("<%=baseUrl%>admin/findproduct.jsp" , "findproduct" , "height=600,width=600");
}


function showaddproduct(){
        document.getElementById("addsection").style.display="";
}

function showupdateproduct(){
        document.getElementById("updatesection").style.display="";
}

function showdeleteproduct(){
        document.getElementById("deletesection").style.display="";
}

function hideall(){


}


</script>

</head>

<body>
    <jsp:include page="header.jsp?item=admin"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

            <div id="infosection" class="experttag_post">
                    <% String message = (String)session.getAttribute("message");

                        if(message==null){
                     %>
                     <p>
                        Welcome to product admin section.
                       <br><br>
                     </p>
                     <% }else{%>
                     <p> <%=message%> </p>
                     <%}
                        session.setAttribute("message",null);
                    %>


                </div>
        
        	<div id="experttag_left_section" style="display:none">
            	
                <div id="addsection" class="experttag_post"><!-- start : add product-->
                
                	<div class="experttag_post_top">
                    	<h1>add new product</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="addproduct" action="AdminProduct.do" name="addproduct" ENCTYPE="multipart/form-data" method="post" onsubmit="return validateaddform()" >
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

                        <form id="updateproduct" action="ProductAdmin" name="updateproduct" method="post" onsubmit="return validateupdateform()" >
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
									<select class="textfield"  id="prodCategoryId" name="prodCategoryId" style="height:25px; width:150px;">
									   <option>bedroom</option>
									   <option>kitchen</option>
									   <option>sopha</option>
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
								<td><input  class="textfield" style="height:25px;width:150px;" type="file"></td>
							  </tr>
							  <tr>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td align="right"><input type="submit" class="buttonfield" name="add product" value="Add product"></td>
							  </tr>
						</table>
						</form>


                        <div class="clear"></div>

                    </div>
                    <div class="experttag_post_bottom">

                    	<span class="post">* special characters are not allowed in input fields</span>
						<br><span class="post">* filesize must be less than 10 mb</span>
                        <br><br>
                    </div>

				</div><!-- end : update product-->
				
				
            </div><!-- end of left section-->
            
            <div id="experttag_right_section">
            	                
                <div class="experttag_section_box">
                	<div class="experttag_section_box_top">
                    
                    	<h1>Select operation</h1>
                        
                    </div>
					<div class="experttag_section_box_mid">
                   		
						<ul>
                        	<li><a href="javascript:openaddproduct()">add new product</a></li>
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
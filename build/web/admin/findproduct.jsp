<%@page import="java.util.ArrayList" %>
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>

<%
        String username = (String)session.getAttribute("username");
        ArrayList categories   =(ArrayList)session.getAttribute("categories");
        ArrayList products = (ArrayList)request.getAttribute("products") ;

        int numCategory=0 , numProducts=0 ;

        if(categories!=null) numCategory = categories.size();
        if(products!=null) numProducts = products.size();

        IntStringPair category = null;
        ProductBean product=null;

        String baseUrl = StringHelper.getBaseUrl(request);

if (username == null) {
%>
    <jsp:forward page="login.html" />
<%}%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Noble furniture - adminstratoin</title>
<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="<%=baseUrl%>admin/css/experttag_style.css" rel="stylesheet" type="text/css" />

<script>



</script>

</head>

<body>
	<div id="">
    
    	<div style="margin-left:30px;">
		
		          <div class="experttag_post"><!-- start  : search product-->
                
                	<div class="experttag_post_top">
                    	<h1>search product for updation or removal</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="searchproduct" action="<%=baseUrl%>AdminProduct.do" name="searchproduct" method="post"  >
						<table >
							  <tr>
								<td >product name</td>
                                <td >product category</td>
							  </tr>
							  <tr>
								<td ><input type="text" class="textfield" name="productname" id="productname" style="width:250px;" ></td>
                                <td  >
									<select class="textfield"  id="prodCategoryId" name="prodCategoryId" style="height:25px;width:200px; ">
									   <option value="0"></option>
									    <%
                                         if(numCategory>0){
                                             for(int i=0; i<numCategory;i++){
                                                 category = (IntStringPair)categories.get(i);
                                       %>
                                            <option value="<%=category.getId() %>" ><%=category.getValue() %></option>
                                       <%}}%>
									</select>
								</td>
							  </tr>
							  <tr>
								<td colspan="2">product description</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text"  class="textfield" name="productdescription" id="productdescription" ></td>
							  </tr>
							  
							  <tr>
								<td align="right"><input type="submit" class="buttonfield" name="find product" value="find product"></td>
							  </tr>
						</table>
                        <input type="hidden" name="method" value="searchproduct" />
						</form>


						
                        
                        
                    </div>
                    
                    
				</div><!-- end  : search product-->
				
                
				
                <div class="experttag_post"><!-- start  : search list-->
                
                	<div class="experttag_post_top">
                    	<h1>search result</h1>
                    </div>
                    <div class="experttag_post_mid" style="height:270px;">
                        <table>
                            <tr>
                                <td style="background-color:gray">Sr.</td>
                                <td style="background-color:gray">ProductId</td>
                                <td style="background-color:gray">ProductName</td>
                                <td style="background-color:gray">Desciption</td>
                                <td style="background-color:gray">&nbsp;</td>
                                <td style="background-color:gray">&nbsp;</td>
                            </tr>
                            <%

                             for(int i=0;i<numProducts;i++){
                                 product = (ProductBean)products.get(i);
                            %>
                            <tr style="border-bottom:.1em solid black;">
                                <td><%=i+1%></td>
                                <td><%=product.getProductId() %></td>
                                <td><%= StringHelper.truncatString(product.getProductName(),30) %></td>
                                <td><%= StringHelper.truncatString(product.getProductDescription(),30) %></td>
                                <td><a href="javascript:update()">update</a></td>
                                <td><a href="javascript:add()">edit</a></td>
                            </tr>
                            <%}%>

                        </table>


						
                        <div class="clear"></div>
                        
                    </div>
					
                </div> <!-- end search result list -->
				


    </div>
	</div>

</body>

</html>
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

function validateuploadform(){
	
			var error="";
			errorcolor = "#000";
			normalcolor = "#000";
		   
            error=error+ isValidUsername("addoffer","offerdetail",errorcolor,normalcolor);
		   		   
		   if((error!="")) {
			  alert(error);	  
			  return false;
		   }
		   
		   return true;
	}

</script>

</head>

<body>
    <jsp:include page="header.jsp?item=uploadoffer"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

        
        	<div id="experttag_left_section" >


            	
                <div id="addsection" class="experttag_post" ><!-- start : add profile-->
                
                	<div class="experttag_post_top">
                    	<h1>update your profile</h1>
                    </div>
                    <div class="experttag_post_mid">
                        <p><%= (session.getAttribute("message"))==null?"":(String)session.getAttribute("message") %></p>
                        <form id="addoffer" action="<%=baseUrl%>AdminUpload.do" name="addoffer" ENCTYPE="multipart/form-data" method="post" onsubmit="return validateuploadform()" >
						<table class="addprofile">
							  <tr>
								<td colspan="2">Offer Details</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text" class="textfield" name="offerdetail" id="offerdetail" ></td>
							  </tr>
							  <tr>
								<td colspan="2"><input  class="textfield" style="height:25px;width:150px;" type="file" name="productImage" id="productImage"></td>
							  </tr>
							  
                              <tr>
								<td colspan="2"><hr></td>
							  </tr>
							  <tr>
								<td  colspan="2" align="center"><input type="submit" class="buttonfield" name="add offer" value="Add offer"></td>
							  </tr>
						</table>
                            
                            <input type="hidden" name="method" value="banner" />
						</form>

					
                        <div class="clear"></div>
                        
                    </div>
                    <div class="experttag_post_bottom">
                    
                    	<span class="post">* special characters are not allowed in input fields</span>
						<br><span class="post">* only letters and nubers are allowed</span>
                        <br><br>
                    </div>
                    
				</div><!-- end : add product-->
				
			
				
            </div><!-- end of left section-->
            
           
            
        </div><!-- end of container-->
	</div><!-- end of background middle-->
    
    <jsp:include page="footer.jsp" />
    
</body>

</html>
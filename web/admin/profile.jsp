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

function validateupdateprofile(){
	
			var error="";
			errorcolor = "#000";
			normalcolor = "#000";
		   
            error=error+ isValidUsername("addprofile","password",errorcolor,normalcolor);

            if(document.forms["addprofile"].elements["password"].value!=document.forms["addprofile"].elements["confirmpassword"].value){
                error=error+ "\n confirm password do not match password";
                document.forms["addprofile"].elements["confirmpassword"].focus();
                document.forms["addprofile"].elements["confirmpassword"].style.background=errorcolor;
            }
            else{
                document.forms["addprofile"].elements["confirmpassword"].style.background=normalcolor;
            }
		   
		   		   
		   if((error!="")) {
			  alert(error);	  
			  return false;
		   }
		   
		   return true;
	}

</script>

</head>

<body>
    <jsp:include page="header.jsp?item=profile"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

        
        	<div id="experttag_left_section" >


            	
                <div id="addsection" class="experttag_post" ><!-- start : add profile-->
                
                	<div class="experttag_post_top">
                    	<h1>update your profile</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="addprofile" action="<%=baseUrl%>AdminProfile.do" name="addprofile" method="post" onsubmit="return validateupdateprofile()" >
						<table class="addprofile">
							  <tr>
								<td colspan="2">username</td>
							  </tr>
							  <tr>
								<td colspan="2"><span><%= username %></span></td>
							  </tr>
							  <tr>
								<td colspan="2">password</td>
							  </tr>
							  <tr>
								<td colspan="2"> <input type="password" class="textfield" name="password" id="password" style="width:300px;" maxlength="15"></td>
							  </tr>
                              <tr>
								<td colspan="2">confirm password</td>
							  </tr>
							  <tr>
								<td colspan="2"> <input type="password" class="textfield" name="confirmpassword" id="confirmpassword" style="width:300px;" maxlength="15" ></td>
							  </tr>

                              <tr>
								<td colspan="2"><hr></td>
							  </tr>
							  <tr>
								<td  colspan="2" align="center"><input type="submit" class="buttonfield" name="add profile" value="Add profile"></td>
							  </tr>
						</table>

                            <input type="hidden" name="username" value="<%= username %>" />
                            <input type="hidden" name="method" value="updateprofile" />
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
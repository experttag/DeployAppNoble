<%@page import="com.noble.admin.utility.StringHelper" %>

<%
String baseUrl = StringHelper.getBaseUrl(request);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Noble furniture - adminstratoin</title>

<meta name="keywords" content="" />
<meta name="description" content="" />

<link href="<%= baseUrl %>admin/css/experttag_style.css" rel="stylesheet" type="text/css" />
<script src="<%= baseUrl %>admin/js/admin.js"></script>


<script>

function validateloginform(){
	
			var error="";
			errorcolor = "#000";
			normalcolor = "#000";
		   
		   error=error+ isValidUsername("loginfrm","username",errorcolor,normalcolor);
		   error=error+ isValidUsername("loginfrm","userpassword",errorcolor,normalcolor);
		   		   
		   		   
		   if((error!="")) {
			  alert(error);	  
			  return false;
		   }
		   
		   return true;
	}
	

</script>

</head>

<body>
    
    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container" style="margin-top:10em;">
        <center>
        	
            	
                <div class="experttag_post"><!-- start : add product-->
                
                	<div class="experttag_post_top">
                    	<h1>admin login</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="loginfrm" name="loginfrm" action="<%= baseUrl %>AdminLogin.do" method="post" onsubmit="return validateloginform()" >
						<table >
							  <tr>
								<td colspan="2">user name</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text" class="textfield" name="username" id="username" style="width:250px;" ></td>
							  </tr>
							  <tr>
								<td colspan="2">user password</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="password" class="textfield" name="userpassword" id="userpassword" style="width:250px;" ></td>
							  </tr>
							  
							  <tr>
								<td>&nbsp;</td>
							  </tr>
							  <tr>
								<td colspan="2" align="center"><input type="submit" class="buttonfield" name="Login" value="Login"></td>
							  </tr>
						</table>
                             <input type="hidden" name="method" value="login">
						</form>


                        <div class="clear"></div>
                        
                    </div>
                   
                    
				</div><!-- end : add product-->
				
				               
				
             
            
         </center>
        </div><!-- end of container-->
	</div><!-- end of background middle-->
   
   

</body>

</html>
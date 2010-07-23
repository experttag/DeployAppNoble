<%@page import="java.util.ArrayList" %> 
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>
 
<%
        String username = (String)session.getAttribute("username");
        ArrayList priceranges  = (ArrayList)session.getAttribute("priceranges");
        
        int numRange=0;

        if(priceranges!=null) numRange = priceranges.size();

        IntPair range = null;
        
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

    function validaterange(){

            var error="";
			errorcolor = "#000";
			normalcolor = "#000";
            
            error=error+ isValidNumber("addrangefrm","rangevalue",errorcolor,normalcolor);
		   
		   if((error!="")) {
			  alert(error);
			  return false;
		   }

		   return true;
	}



    function deleterange(rangeId){
        if(confirm("This action will remove the range permanently from system. \n Do you want to continue?")){
            document.forms["displayrangefrm"].elements["rangeId"].value = rangeId;
            document.forms["displayrangefrm"].submit();
        }
    }

        
    

    function showaddrange(){
        hideall();
        document.getElementById("addsection").style.display="";
    }

    function hideall(){
        document.getElementById("addsection").style.display="none";
        document.getElementById("infosection").style.display="none";
    }

</script>

</head>

<body>
    <jsp:include page="header.jsp?item=pricerange"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

       
        	<div id="experttag_left_section" >

                <div id="infosection" class="experttag_post" ><!-- start : add profile-->

                	<div class="experttag_post_top">
                    	<h1>range admin</h1>
                    </div>
                    
                    <div class="experttag_post_mid">

                        <p><%=session.getAttribute("message")==null?"": session.getAttribute("message")%></p>
                        <% session.setAttribute("message",null); %>

                        <form id="displayrangefrm" action="<%=baseUrl%>AdminRange.do" name="displayrangefrm" method="post"  >
						<table class="addprofile">
							  <tr>
                                <td><b>srno</b></td>
                                <td><b>range</b></td>
								<td>&nbsp;</td>
							  </tr>
							  <%
                                         
                                             for(int i=0; i<numRange;i++){
                                                 range = (IntPair)priceranges.get(i);
                              %>
                              <tr>
								<td ><%=i+1%></td>
                                <td ><%=range.getValue()%></td>
                                <td ><a href="javascript:deleterange(<%=range.getId()%>)">Delete</a></td>
							  </tr>
                             <%}%>
                              
							  
						</table>
                            <input type="hidden" name="rangeId" value="" />
                            <input type="hidden" name="method" value="deleterange" />
						</form>
                        <br><br>

                        <div class="clear"></div>

                    </div>

				</div><!-- end : add product-->

                <div id="addsection" class="experttag_post" style="display:none;" ><!-- start : add profile-->
                
                	<div class="experttag_post_top">
                    	<h1>add range</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        <form id="addrangefrm" action="<%=baseUrl%>AdminRange.do" name="addrangefrm" method="post" onsubmit="return validaterange()" >
						<table class="addprofile">
							  
							  <tr>
								<td colspan="2">Range Value</td>
							  </tr>
							  <tr>
								<td colspan="2"><input type="text" class="textfield" onkeypress="return onlyNumbers(event);" name="rangevalue" id="rangevalue" ></td>
							  </tr>
                              

                              <tr>
								<td colspan="2"><hr></td>
							  </tr>
							  <tr>
								<td  colspan="2" align="center"><input type="submit" class="buttonfield" name="add range" value="Add range"></td>
							  </tr>
						</table>
                            <input type="hidden" name="method" value="addrange" />
						</form>

					
                        <div class="clear"></div>
                        
                    </div>
                    <div class="experttag_post_bottom">
                    
                    	<span class="post">* Only numbers are not allowed in input fields</span>
						
                        <br><br>
                    </div>
                    
				</div><!-- end : add product-->
				
			
				
            </div><!-- end of left section-->
            
           <div id="experttag_right_section">

                <div class="experttag_section_box">
                	<div class="experttag_section_box_top">

                    	<h1>Select operation</h1>

                    </div>
					<div class="experttag_section_box_mid">
                        <br>
						<ul>
                        	<li><a href="javascript:showaddrange()">add new range</a></li>
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
<%@page import="java.util.ArrayList" %> 
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>
 
<%
        String username = (String)session.getAttribute("username");
        
        ArrayList orders   =(ArrayList)session.getAttribute("orders");
        int numOrders=0;
        if(orders!=null) numOrders=orders.size();

        OrderBean order =null;

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


</script>

</head>

<body>
    <jsp:include page="header.jsp?item=orders"/>

    <div id="experttag_background_section_middle">
    
    	<div class="experttag_container">

        
        	<div id="experttag_left_section" >


            	
                <div id="addsection" class="experttag_post" ><!-- start : display order-->
                
                	<div class="experttag_post_top">
                    	<h1>Orders recieved so far</h1>
                    </div>
                    <div class="experttag_post_mid">
                    	                        
                        
						<table class="addprofile">
							  <!--tr>
                                <td><b>srno</b></td>
                                <td><b>OrderNo</b></td>
								<td><b>OrderData</b></td>
                                <td><b>UserMail</b></td>
                                <td><b>UserData</b></td>
							  </tr-->
							  <%
                               for(int i=0; i<numOrders;i++){
                                  order = (OrderBean)orders.get(i);
                              %>
                              <tr><td ><%=i+1%></td></tr>
                                <tr><td ><%=order.getOrderNo() %></td></tr>
                                <tr><td ><b>Order details :</b></td></tr>
                                <tr><td ><%= StringHelper.parseOrder(order.getOrderData()) %></td></tr>
                                <tr><td ><b>Customer Address :</b></td></tr>
                                <tr><td ><%=StringHelper.parseAddress(order.getUserData()) %></td></tr>
                                							  
                              <tr><td colspan="1"><hr><br> </td></tr>
                             <%}%>


						</table>

                            
					
                        <div class="clear"></div>
                        
                    </div>
                    
				</div><!-- end : display order-->
				
			
				
            </div><!-- end of left section-->
            
           
            
        </div><!-- end of container-->
	</div><!-- end of background middle-->
    
    <jsp:include page="footer.jsp" />
    
</body>

</html>
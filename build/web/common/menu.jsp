<%@page import="java.util.ArrayList" %>
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.constant.DataConstant" %>
<%@page import="com.noble.admin.utility.StringHelper" %>

<%
        
        ArrayList priceranges  = (ArrayList)session.getAttribute("priceranges");
        ArrayList categories   =(ArrayList)session.getAttribute("categories");

        int numCategory=0 , numRange=0 ;

        if(categories!=null) numCategory = categories.size();
        if(priceranges!=null) numRange = priceranges.size();        
        

        IntPair range = null;        
        IntStringPair category = null;

        String baseUrl = StringHelper.getBaseUrl(request);

%>

<div id="imMenuMain">

<!-- Menu START -->
<a name="imGoToMenu"></a><p class="imInvisible">Main menu:</p>
<div id="imMnMn">
<ul>
	<li><a class="imMnItm_1" href="<%=baseUrl %>index.jsp" title=""><span class="imHidden">Home Page</span></a></li>
	<li><a class="imMnItm_2" href="<%=baseUrl %>Product.do?method=bycategory" title=""><span class="imHidden">Products by category</span></a>
<ul>
                            <% for(int i=0; i < numCategory;i++){
                            category = (IntStringPair)categories.get(i);
                            %>
                            <!--li class="imMenuSubCur">upto 100 <span class="imHidden"> &larr;</span></li-->
                            <li><a href="<%=baseUrl %>Product.do?method=bycategory&categoryId=<%=category.getId() %>&categoryIdName=<%=category.getValue()%>" title=""><%=category.getValue()%></a></li>
                            <%}%>

                            <li><a href="<%=baseUrl %>Product.do?method=bycategory&categoryId=<%=DataConstant.CATEGORY_ALL %>&categoryIdName=All categories" title="">All Categories</a></li>
</ul>
</li>
	<li><a class="imMnItm_3" href="<%=baseUrl %>Product.do?method=byprice" title=""><span class="imHidden">Products by price range</span></a>
<ul>

    <% for(int i=0; i < numRange;i++){
     range = (IntPair)priceranges.get(i);
    %>
        <li><a href="<%=baseUrl %>Product.do?method=byprice&range=<%=range.getValue()%>" title="">upto <%=DataConstant.currencySymbol + " "+range.getValue()%></a></li>
    <%}%>
    <li><a href="<%=baseUrl %>Product.do?method=byprice&range=<%=DataConstant.RANGE_ALL %>" title="">All</a></li>
                            
</ul>
</li>
	<li><a class="imMnItm_4" href="<%=baseUrl %>about_us.jsp" title=""><span class="imHidden">About us</span></a></li>
	<li><a class="imMnItm_5" href="<%=baseUrl %>contact_us.jsp" title=""><span class="imHidden">Contact us</span></a></li>
	<li><a class="imMnItm_6" href="<%=baseUrl %>feedback.jsp" title=""><span class="imHidden">Feedback</span></a></li>
</ul>
</div>
<!-- Menu END -->

	</div>
<hr class="imInvisible" />
<a name="imGoToCont"></a>
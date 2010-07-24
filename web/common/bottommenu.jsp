<%@page import="com.noble.admin.utility.StringHelper" %>

<%
        String baseUrl = StringHelper.getBaseUrl(request);

%>

<p id="imFooterSiteMap">
    <a href="<%=baseUrl %>index.jsp" title="">Home Page</a> |
    <a href="<%=baseUrl %>Product.do?method=bycategory" title="">Products by category</a> |
    <a href="<%=baseUrl %>Product.do?method=byprice" title="">Products by price range</a> |
    <a href="<%=baseUrl %>about_us.jsp" title="">About us</a> |
    <a href="<%=baseUrl %>contact_us.jsp" title="">Contact us</a> |
    <a href="<%=baseUrl %>feedback.jsp" title="">Feedback</a> |
    <a href="<%=baseUrl %>imsitemap.jsp" title="General Site Map">Site Map</a> |
    <a href="<%=baseUrl %>admin/login.jsp" title="administrator screen">admin</a>
</p>
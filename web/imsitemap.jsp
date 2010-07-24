<%@page import="java.util.ArrayList" %>
<%@page import="com.noble.admin.modal.*" %>
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

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <title>General Site Map</title>

        <!-- Contents -->
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <meta http-equiv="Content-Language" content="en" />
        <meta http-equiv="last-modified" content="03/04/2010 07:25:55" />
        <meta http-equiv="Content-Type-Script" content="text/javascript" />
        <meta name="description" content="We are a one stop destination for all your Furniture needs displaying a wide spectrum of products including Bedroom Sets, Sofa Sets, Wall Units, Dining Sets and an array of Furniture Accessories" />
        <meta name="keywords" content="bedroom furniture,bedroom furniture set,bedroom set,buy furniture,dining furniture, dining room furniture,discount furniture,discounted furniture,fine furniture, furniture,furniture beds,furniture for sale,furniture outlet,furniture sale,furniture sales,furniture sets,furniture shop,furniture sofa,furniture store,furniture stores,furniture warehouse,home furniture,living room furniture,living room sets,livingroom furniture,office furniture,quality furniture,wood furniture" />
        <!-- imCustomHead -->
        <meta http-equiv="Expires" content="0" />
        <meta name="Resource-Type" content="document" />
        <meta name="Distribution" content="global" />
        <meta name="Robots" content="index, follow" />
        <meta name="Revisit-After" content="21 days" />
        <meta name="Rating" content="general" />
        <!-- Others -->
        <meta name="Author" content="greenworks" />
        <meta name="Generator" content="Incomedia WebSite X5 Evolution Evolution 8.0.9 - www.websitex5.com" />
        <meta http-equiv="ImageToolbar" content="False" />
        <meta name="MSSmartTagsPreventParsing" content="True" />

        <!-- Parent -->
        <link rel="sitemap" href="sitemap.xml" title="General Site Map" />
        <!-- Res -->
        <script type="text/javascript" src="res/x5engine.js"></script>
        <link rel="stylesheet" type="text/css" href="res/styles.css" media="screen, print" />
        <link rel="stylesheet" type="text/css" href="res/template.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="res/print.css" media="print" />
        <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="res/iebehavior.css" media="screen" /><![endif]-->
        <link rel="stylesheet" type="text/css" href="res/imsitemap.css" media="screen, print" />
        <script type="text/javascript" src="res/x5cart.js"></script>
        <link rel="stylesheet" type="text/css" href="res/handheld.css" media="handheld" />
        <link rel="alternate stylesheet" title="High contrast - Accessibility" type="text/css" href="res/accessibility.css" media="screen" />

    </head>
    <body>
        <div id="imSite">
            <jsp:include page="common/header.jsp" />

            <div id="imBody">
                <jsp:include page="common/menu.jsp" />
                <div id="imContent">
                    <h2>General Site Map</h2>
                    <div id="imMap" class="imDefText">
                        <ul>
                            <li class="page">
                                <p class="title"><a class="imDefText" href="<%=baseUrl %>index.sp" title="">Home Page</a></p>
                            </li>
                            <li class="imMap_open">
                                <p class="title" onmousedown="imMapSwap(this.parentNode);">Products by category</p>

                                <ul>                                    
                                    
                                         <% for(int i=0; i < numCategory;i++){
                                        category = (IntStringPair)categories.get(i);
                                        %>
                                        <!--li class="imMenuSubCur">upto 100 <span class="imHidden"> &larr;</span></li-->
                                        <li class="page"><p class="title"><a class="imDefText" href="<%=baseUrl %>Product.do?method=bycategory&categoryId=<%=category.getId() %>&categoryIdName=<%=category.getValue()%>" title=""><%=category.getValue()%></a></p></li>
                                        <%}%>

                                        <li  class="page"><p class="title"><a class="imDefText" href="<%=baseUrl %>Product.do?method=bycategory" title="">All Categories</a></p></li>


                                </ul>
                            </li>
                            <li class="imMap_open">
                                <p class="title" onmousedown="imMapSwap(this.parentNode);">Products by price range</p>

                                <ul>
                                    
                                        <% for(int i=0; i < numRange;i++){
                                         range = (IntPair)priceranges.get(i);
                                        %>
                                            <li class="page"><p class="title"><a class="imDefText" href="<%=baseUrl %>Product.do?method=byprice&range=<%=range.getValue()%>" title="">upto <%=range.getValue()%></a></p></li>
                                        <%}%>
                                        <li class="page"><p class="title"><a class="imDefText" href="<%=baseUrl %>Product.do?method=byprice" title="">All</a></p></li>


                                </ul>
                            </li>
                            <li class="page">
                                <p class="title"><a class="imDefText" href="<%=baseUrl %>about_us.jsp" title="">About us</a></p>
                            </li>
                            <li class="page">
                                <p class="title"><a class="imDefText" href="<%=baseUrl %>contact_us.jsp" title="">Contact us</a></p>
                            </li>
                            <li class="page">
                                <p class="title"><a class="imDefText" href="<%=baseUrl %>feedback.jsp" title="">Feedback</a></p>
                            </li>
                        </ul>
                    </div>
                    <br />
                    <jsp:include page="common/bottommenu.jsp" />
                </div>
                <jsp:include page="common/footer.jsp" />
            </div>
        </div>
        <jsp:include page="common/bottom.jsp" />
    </body>
</html>

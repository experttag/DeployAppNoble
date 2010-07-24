<%@page import="java.util.ArrayList" %>
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>

<%
        String currentcategory = (String)session.getAttribute("currentcategory");
        ArrayList products = (ArrayList)session.getAttribute("products");        
        ArrayList categories   =(ArrayList)session.getAttribute("categories");

        int numCategory=0 ,  numProducts=0;

        if(categories!=null) numCategory = categories.size();        
        if(products!=null) numProducts = products.size();
        if(currentcategory ==null) currentcategory = "all";

        
        ProductBean product=null;
        IntStringPair category = null;

        String baseUrl = StringHelper.getBaseUrl(request);

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <title>Products by range</title>

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
        <meta http-equiv="ImageToolbar" content="False" />
        <meta name="MSSmartTagsPreventParsing" content="True" />

        <!-- Parent -->
        <link rel="sitemap" href="<%=baseUrl%>sitemap.xml" title="General Site Map" />
        <!-- Res -->
        <script type="text/javascript" src="<%=baseUrl%>res/x5engine.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/styles.css" media="screen, print" />
        <link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/template.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/print.css" media="print" />
        <!--[if lt IE 7]><link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/iebehavior.css" media="screen" /><![endif]-->
        <link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/p008.css" media="screen, print" />
        <script type="text/javascript" src="<%=baseUrl%>res/x5cart.js"></script>
        <link rel="stylesheet" type="text/css" href="<%=baseUrl%>res/handheld.css" media="handheld" />
        <link rel="alternate stylesheet" title="High contrast - Accessibility" type="text/css" href="<%=baseUrl%>res/accessibility.css" media="screen" />

    </head>
    <body>
        <div id="imSite">
            
            <jsp:include page="common/header.jsp" />

            <div id="imBody">
            <jsp:include page="common/menu.jsp" />
               <div id="imContent">
                    <div id="imPageSub">

                        <!-- Page START -->
                        <h2>Category <%=currentcategory %> ( <%=numProducts %> products )</h2>
                        <p id="imPathTitle">Products by price range</p>
                        <div id="imPage" style="height:<%=((numProducts/2+1)*180)==0?"180":String.valueOf((numProducts/2+1)*180) %>px;">

                            <div id="imCel9_01" style="height: <%=((numProducts/2+1)*156)==0?"156":String.valueOf((numProducts/2+1)*156) %>px;">
                                <div id="imCel9_01_Cont" style="height:<%=((numProducts/2+1)*156)==0?"156":String.valueOf((numProducts/2+1)*156) %>px;">
                                    <div id="imObj9_01">
                                        <div >
                                            <%
                                              for(int i =0; i<numProducts; i++){
                                                  product = (ProductBean)products.get(i);

                                            %>
                                            <div class="imCartBrd">
                                                <div class="imCartItem">
                                                    <div class="imCRImg">
                                                        <a href="javascript:imShowBox('cart/<%= product.getProductImage() %>',500,420,'','IMG','t');">
                                                            <img src="cart/<%= product.getProductImage() %>" alt="<%= product.getProductName() %>" width="117" height="139" style="margin-top:1px; border: none;" />
                                                        </a>
                                                    </div>
                                                    <div class="imCRDescF"><strong><%= product.getProductName() %></strong><br /><%= product.getProductDescription() %></div>
                                                    <div class="imCRLast"> </div>
                                                    <div class="imCRLast" style="text-align: right;">
                                                        <input id="imQty<%= product.getProductId() %>" type="text" value="1" size="4" maxlength="4" />
                                                        <input id="imDesc<%= product.getProductId() %>" type="hidden" value="<%= product.getProductName() %>"  />
                                                        <img src="res/imcartadd.gif" alt="Add to Cart" style="vertical-align: bottom; cursor: pointer" onclick="imCAddProdLink('im28158','<%= product.getProductId() %>',imGetLayer('imDesc<%= product.getProductId() %>').value,'',imGetLayer('imQty<%= product.getProductId() %>').value)" />

                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- Page END -->
                        <jsp:include page="common/bottommenu.jsp" />
                    </div>
                    <div id="imMenuSub">
                        <hr class="imHidden" />
                        <p class="imHidden">Sub-Menu:</p>
                        <ul>
                            <% for(int i=0; i < numCategory;i++){
                            category = (IntStringPair)categories.get(i);
                            %>
                            <!--li class="imMenuSubCur">upto 100 <span class="imHidden"> &larr;</span></li-->
                            <li><a href="<%=baseUrl %>Product.do?method=bycategory&categoryId=<%=category.getId() %>&categoryIdName=<%=category.getValue()%>" title=""><%=category.getValue()%></a></li>
                            <%}%>
                            
                            <li><a href="<%=baseUrl %>Product.do?method=bycategory" title="">All Categories</a></li>
                        </ul>
                    </div>

                </div>
                <jsp:include page="common/footer.jsp" />

            </div>
        </div>
        <jsp:include page="common/bottom.jsp" />
    </body>
</html>

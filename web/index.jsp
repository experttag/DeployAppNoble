<%@page import="java.util.ArrayList" %>
<%@page import="com.noble.admin.modal.*" %>
<%@page import="com.noble.admin.utility.StringHelper" %>

<%

        ArrayList priceranges  = (ArrayList)session.getAttribute("priceranges");
        ArrayList categories   =(ArrayList)session.getAttribute("categories");
        String offer = (String)session.getAttribute("offer");
        
        int numCategory=0 , numRange=0 ;

        if(categories!=null) numCategory = categories.size();
        if(priceranges!=null) numRange = priceranges.size();

        if(offer==null||(offer.trim()).equalsIgnoreCase("")) offer = "NOBLE_FURNITURE_14JULY.pdf";


        IntPair range = null;
        IntStringPair category = null;

        String baseUrl = StringHelper.getBaseUrl(request);


if((categories==null||priceranges==null)&&session.getAttribute("reloaded")==null){
%>
<jsp:forward page="Product.do?method=reloadproducts" />
<%}%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <title>Noble furnitures</title>

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
        <link rel="stylesheet" type="text/css" href="res/home.css" media="screen, print" />
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

                    <!-- Page START -->
                    <div id="imPage">

                        <div id="imCel6_01">
                            <div id="imCel6_01_Cont">
                                <div id="imObj6_01">
                                    <div id="imSSCont_1">
                                        <div id="imSSBackg_1" onmouseover="imSSDescrHide(1);" onmouseout="imSSDescrShow(1);">
                                            <div id="imSSImages_1">
                                                <img id="imSSImage_1" src="slideshow/home_1_1.jpg" onclick="imLink(1);" alt=""  />
                                                <img id="imSSImage_1_back" src="" onclick="imLink(1);" alt="" style=" display: none;" />
                                            </div>
                                            <div id="imSSDescr_1" style="display: none; bottom: 0;"><div id="imSSDescr_1_content"><div id="imSSDescr_1_bg"></div><div id="imSSDescr_1_text"></div></div></div>
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        imSSLoad(1,[["home_1_1.jpg",469,312,3,1,"","#"],["home_1_2.jpg",350,306,3,1,"","#"],["home_1_3.jpg",434,312,3,1,"","#"],["home_1_4.jpg",312,312,3,1,"","#"],["home_1_5.jpg",287,264,3,1,"","#"],["home_1_6.jpg",312,312,3,1,"","#"],["home_1_7.jpg",400,312,3,1,"","#"],["home_1_8.jpg",356,312,3,1,"","#"],["home_1_9.jpg",500,296,3,1,"","#"],["home_1_10.jpg",312,312,3,1,"","#"]]);
                                        imLoadList += "imSSPlay(1,1);";
                                    </script>
                                </div>
                            </div>
                        </div>

                        <div id="imCel0_01">
                            <div id="imCel0_01_Cont">
                                <div id="imObj0_01">
                                    <p class="imAlign_left"><span class="ff2 fc0 fs10 ">We are a one stop destination for all your furniture needs displaying a wide spectrum of products including Bedroom Sets, Sofa Sets, Wall Units, Dining Sets and an array of Furniture Accessories.<br /><br />Noble furniture offers quality Furniture at Honest Value for Money prices in an ambience that facilitates hassle free shopping backed up by our team of customer associates and carpenters offering prompt after sales service. </span><span class="ff1 fc0 fs10 ">
                                    <br /></span></p>
                                </div>
                            </div>
                        </div>

                        <div id="imCel0_00">
                            <div id="imCel0_00_Cont">
                                <div id="imObj0_00">
                                    <p class="imAlign_left"><span class="ff0 fc0 fs16 fb ">Categories</span><span class="ff0 fc0 fs12 ">
                                    <br /><br /></span></p>
                                    <ul class="imBullet">
                                        
                                       <% for(int i=0; i < numCategory;i++){
                                        category = (IntStringPair)categories.get(i);
                                        %>
                                        <!--li class="imMenuSubCur">upto 100 <span class="imHidden"> &larr;</span></li-->
                                        <li class="imAlign_left"><span class="ff5 fc2 fs10 ">
                                            <a  class="ImLink" href="<%=baseUrl %>Product.do?method=bycategory&categoryId=<%=category.getId() %>&categoryIdName=<%=category.getValue()%>" title=""><%=category.getValue()%></a></span></li>
                                        <%}%>

                                   </ul>
                                    

                                </div>
                            </div>
                        </div>

                        <div id="imCel0_03">
                            <div id="imCel0_03_Cont">
                                <div id="imObj0_03">
                                    <p class="imAlign_left"><span class="ff2 fc0 fs16 fb ">Welcome</span><span class="ff2 fc0 fs10 ">
                                    <br /><br /></span><span class="ff2 fc2 fs10 ">noble furnitures welcome you to unique shopping experience with us.<br /><br />Formally began operations in 1995 , the main purpose of opening the store is to provide our customers affordable and customized furniture as per their taste.<br /></span></p>
                                    <p class="imAlign_right"><span class="ff2 fc2 fs10 "><a class="ImLink" href="about_us.jsp" title=""> Read more</a></span><span class="ff3 fc0 fs22 fb ">
                                    <br /></span></p>
                                    <p class="imAlign_left"><span class="ff1 fc0 fs10 ">
                                    <br /></span></p>
                                </div>
                            </div>
                        </div>

                        <div id="imCel5_00">
                            <div id="imCel5_00_Cont">
                                <div id="imObj5_00" style="text-align:center;">
                                    
                                    <br><br><br><br><br><br>
                                        
                                   <div style="font-size:4em; ">
                                       <a href="<%=baseUrl %>files/<%=offer%>" target="_blank" style="text-decoration:none;color:brown;">
                                           <img src="res/Door_in.gif" style="border-style:none"><br>Download current Offers</a>
                                   </div>

                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- Page END -->

                    <jsp:include page="common/bottommenu.jsp" />

                </div>
                <jsp:include page="common/footer.jsp" />
            </div>
        </div>
        <jsp:include page="common/bottom.jsp" />
    </body>
</html>

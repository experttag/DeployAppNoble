
<%
Object products = session.getAttribute("products");
Object priceranges  = session.getAttribute("priceranges");
%>


<%if((products==null||priceranges==null)&&session.getAttribute("reloaded")==null){
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
                                    <p class="imAlign_left"><span class="ff2 fc0 fs10 ">We are a one stop destination for all your furniture needs displaying a wide spectrum of products including Bedroom Sets, Sofa Sets, Wall Units, Dining Sets and an array of Furniture Accessories.<br /><br />Nobel furniture offers quality Furniture at Honest Value for Money prices in an ambience that facilitates hassle free shopping backed up by our team of customer associates and carpenters offering prompt after sales service. </span><span class="ff1 fc0 fs10 ">
                                    <br /></span></p>
                                </div>
                            </div>
                        </div>

                        <div id="imCel0_00">
                            <div id="imCel0_00_Cont">
                                <div id="imObj0_00">
                                    <p class="imAlign_left"><span class="ff0 fc0 fs16 fb ">Categories</span><span class="ff0 fc0 fs12 ">
                                    <br /><br /></span></p>
                                    <ul class="imBullet"><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="bed_room_complete_sets.html" title=""> Bedroom complete sets </a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="tv_stereo_units.html" title=""> TV Stereo Units </a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="chests.html" title=""> Living room sets</a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="chests.html" title=""> Dining room sets</a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="chests.html" title=""> Armoire</a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="chests.html" title=""> Chest </a></span></li><li class="imAlign_left"><span class="ff5 fc2 fs10 "><a class="ImLink" href="chests.html" title=""> Accents</a></span></li></ul>
                                </div>
                            </div>
                        </div>

                        <div id="imCel0_03">
                            <div id="imCel0_03_Cont">
                                <div id="imObj0_03">
                                    <p class="imAlign_left"><span class="ff2 fc0 fs16 fb ">Welcome</span><span class="ff2 fc0 fs10 ">
                                    <br /><br /></span><span class="ff2 fc2 fs10 ">Nobel furnitures welcome you to unique shopping experience with us.<br /><br />Formally began operations in 1995 , the main purpose of opening the store is to provide our customers affordable and customized furniture as per their taste.<br /></span></p>
                                    <p class="imAlign_right"><span class="ff2 fc2 fs10 "><a class="ImLink" href="about_us.html" title=""> Read more</a></span><span class="ff3 fc0 fs22 fb ">
                                    <br /></span></p>
                                    <p class="imAlign_left"><span class="ff1 fc0 fs10 ">
                                    <br /></span></p>
                                </div>
                            </div>
                        </div>

                        <div id="imCel5_00">
                            <div id="imCel5_00_Cont">
                                <div id="imObj5_00">
                                    <div class="imFGPanel">
                                        <img src="res/imarrl.gif" class="imFGArrowL" onclick="imFGMove(0,25,2,2)" onmouseover="imFGMove(0,8,2,0)" onmouseout="imFGMove(0,8,2,1)" width="22" height="47" alt="" />
                                        <div id="imFGImgCont_0">
                                            <div id="imFGImgList_0" style="left: 0; top: 0; ">
                                                <img class="imImagePNG" src="imagebrowser/home_0_1.png" width="67" height="67" alt="" id="imFGItem_0_1" onclick="imFGShow(0,'ib_home_0_1.jpg',151,126,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_2.png" width="67" height="67" alt="" id="imFGItem_0_2" onclick="imFGShow(0,'ib_home_0_2.jpg',151,118,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_3.png" width="67" height="67" alt="" id="imFGItem_0_3" onclick="imFGShow(0,'ib_home_0_3.jpg',151,141,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_4.png" width="67" height="67" alt="" id="imFGItem_0_4" onclick="imFGShow(0,'ib_home_0_4.jpg',151,119,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_5.png" width="67" height="67" alt="" id="imFGItem_0_5" onclick="imFGShow(0,'ib_home_0_5.jpg',151,85,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_6.png" width="67" height="67" alt="" id="imFGItem_0_6" onclick="imFGShow(0,'ib_home_0_6.jpg',151,145,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_7.png" width="67" height="67" alt="" id="imFGItem_0_7" onclick="imFGShow(0,'ib_home_0_7.jpg',151,143,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_8.png" width="67" height="67" alt="" id="imFGItem_0_8" onclick="imFGShow(0,'ib_home_0_8.jpg',102,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_9.png" width="67" height="67" alt="" id="imFGItem_0_9" onclick="imFGShow(0,'ib_home_0_9.jpg',115,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_10.png" width="67" height="67" alt="" id="imFGItem_0_10" onclick="imFGShow(0,'ib_home_0_10.jpg',104,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_11.png" width="67" height="67" alt="" id="imFGItem_0_11" onclick="imFGShow(0,'ib_home_0_11.jpg',104,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_12.png" width="67" height="67" alt="" id="imFGItem_0_12" onclick="imFGShow(0,'ib_home_0_12.jpg',114,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_13.png" width="67" height="67" alt="" id="imFGItem_0_13" onclick="imFGShow(0,'ib_home_0_13.jpg',123,201,'','#',1)" /><img class="imImagePNG" src="imagebrowser/home_0_14.png" width="67" height="67" alt="" id="imFGItem_0_14" onclick="imFGShow(0,'ib_home_0_14.jpg',104,201,'','#',1)" />
                                            </div>
                                        </div>
                                        <img src="res/imarrr.gif" class="imFGArrowR" onclick="imFGMove(0,25,1,2)" onmouseover="imFGMove(0,8,1,0)" onmouseout="imFGMove(0,8,1,1)" width="22" height="47" alt="" />
                                    </div>
                                    <div id="imFGMain_0" onmouseover="imFGDescrHide(0);" onmouseout="imFGDescrShow(0);">
                                        <div id="imFGImage_0_cont">
                                            <img id="imFGImage_0" src="" style="display: none; "/>
                                            <img id="imFGImage_0_back" src="" style="display: none; "/>
                                        </div>
                                        <div id="imFGDescr_0" style="display: none; bottom: 0;"><div id="imFGDescr_0_content"><div id="imFGDescr_0_bg"></div><div id="imFGDescr_0_text"></div></div></div>
                                    </div>
                                    <script type="text/javascript">
                                        imLoadList += "imFGShow(0,'ib_home_0_1.jpg',151,126,'','#',1);";
                                    </script>
                                    <noscript><div class="imError">This object require JavaScript enabled</div></noscript>

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

<%@page import="com.noble.admin.utility.StringHelper" %>

<%String baseUrl = StringHelper.getBaseUrl(request);%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <title>Step 4 - Order report</title>

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
        <link rel="stylesheet" type="text/css" href="res/imcart.css" media="screen, print" />
        <script type="text/javascript" src="res/x5cart.js"></script>
        <link rel="stylesheet" type="text/css" href="res/handheld.css" media="handheld" />
        <link rel="alternate stylesheet" title="High contrast - Accessibility" type="text/css" href="res/accessibility.css" media="screen" />
        <script type="text/javascript" src="res/x5products.js"></script>

    </head>
    <body>
        <div id="imSite">
            <jsp:include page="common/header.jsp" />
            <div id="imBody">
               <jsp:include page="common/menu.jsp" />
                <div id="imContent">
                    <h2>Step 4 - Order report</h2>
                    <div id="imCartText">Please check if all the following details are correct, then click to confirm your order.
                        <script type="text/javascript">imCGetCart(true);
                        </script>
                        <noscript><div class="imError">This object require JavaScript and cookie enabled</div></noscript>
                        <form class="imUserData" name="imFormTableDat" action="<%=baseUrl%>Checkout.do" method="post">
                            <fieldset>
                                <div>
                                    <label for="Itm_1">
                                        <span class="imLabel">Name:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_0" type="text" name="imTxtDat" id="Itm1" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_2">
                                        <span class="imLabel">Address:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_0" type="text" name="imTxtDat" id="Itm2" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_3">
                                        <span class="imLabel">City:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_0" type="text" name="imTxtDat" id="Itm3" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_7">
                                        <span class="imLabel">Country:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_1" type="text" name="imTxtDat" id="Itm7" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_8">
                                        <span class="imLabel">Telephone:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_2" type="text" name="imTxtDat" id="Itm8" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_16">
                                        <span class="imLabel">E-mail:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <input class="imField imField_Label imInput_1" type="text" name="imTxtDat" id="Itm16" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div>
                                    <label for="Itm_Note">
                                        <span class="imLabel">Note:<br class="imHidden" /></span>
                                        <span class="imLabel_Cont">
                                            <textarea class="imField imField_Label imInput_0" name="imTxtDat" id="Itm_Note" rows="3" cols="15" readonly="readonly"></textarea>
                                        </span>
                                    </label>
                                </div>
                                <div class="imAlign_center">
                                    <input class="imCartButton" type="button" value="Back to cart" onclick="imOpenLocation('imcart.jsp')" />
                                    <input class="imCartButton" type="button" value="Edit data" onclick="imOpenLocation('imform.jsp')" />
                                    <input class="imCartButton" type="submit" value="Next" />
                                </div>
                                <script type="text/javascript"><!--
                                    var sOrderNo = imCGetOrderNo();
                                    var sUserData = imCGetUserData();
                                    var sOrderData = imCGetOrderData();
                                    var sLocal = imLocale["Name"] + "||" + imLocale["Descr"] + "||" + imLocale["Opt"] + "||" + imLocale["Price"] + "||" + imLocale["Qty"] + "||" + imLocale["SubTot"];
                                    var sShipType = imGetCookie("imShipment");
                                    document.write("<input name=\"imOrderNo\" type=\"hidden\" value=\"" + sOrderNo + "\">");
                                    document.write("<input name=\"imUserData\" type=\"hidden\" value=\"" + sUserData + "\">");
                                    document.write("<input name=\"imOrderData\" type=\"hidden\" value=\"" + sOrderData + "\">");
                                    document.write("<input name=\"imShipment\" type=\"hidden\" value=\"" + sShipType + "\">");
                                    document.write("<input name=\"imUserMail\" type=\"hidden\" value=\"" + imGetLayer("Itm16").value + "\">");
                                    document.write("<input name=\"imLocale\" type=\"hidden\" value=\"" + sLocal + "\">");
                                    //--></script>
                            </fieldset>
                    </form></div>

                </div>
                <jsp:include page="common/footer.jsp" />
            </div>
        </div>
        <jsp:include page="common/bottom.jsp" />

    </body>
</html>

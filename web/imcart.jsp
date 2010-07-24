<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en" dir="ltr">
    <head>
        <title>Step 2 - Shipment and payment choice</title>

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
                    <h2>Step 2 - Products of your interest</h2>
                    <div id="imCartText">The following table lists all products in the cart .
                        <form name="frmShipment" class="imShipment" action="javascript:imCCheckout()">
                            <fieldset>
                                <script type="text/javascript">imCGetCart(false);</script>
                                Click on the 'Next' button to send product enquiry.<br /><br />
                                <script type="text/javascript">imCShowShipment();</script>
                                <noscript><div class="imError">This object require JavaScript and cookie enabled</div></noscript>
                            </fieldset>
                        </form>
                    </div>

                </div>
                <jsp:include page="common/footer.jsp" />
            </div>
        </div>
        <jsp:include page="common/bottom.jsp" />
    </body>
</html>

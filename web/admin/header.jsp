<%
String item = request.getParameter("item");

if(item==null) item="admin";

%>

<div id="experttag_background_section_top">

    	<div class="experttag_container">

        	<div id="experttag_header">
				<div id="experttag_logo_section">
		        	<h1>Noble furnitures</h1>
					<h2>Website Administration</h2>
				</div>
                <!--div id="experttag_search_box">
	                <form action="#" method="post">
    	            	<input name="search" type="text" id="textfield" value=""/>
        	            <input type="submit" name="Search" value="" alt="Search" id="button" title="Search" />
					</form>
                </div-->
         	</div><!-- end of headder -->

    		<div id="experttag_menu_panel">

    			<div id="experttag_menu_section">

            		<ul>
                        <li><a href="profile.jsp" <%= item.equalsIgnoreCase("profile")?"class='current'":"" %> >Profile</a></li>
        		        <li><a href="admin.jsp" <%= item.equalsIgnoreCase("admin")?"class='current'":"" %> >Products</a></li>
		                <li><a href="category.jsp" <%= item.equalsIgnoreCase("category")?"class='current'":"" %> >Categories</a></li>
        		        <li><a href="pricerange.jsp" <%= item.equalsIgnoreCase("pricerange")?"class='current'":"" %> >Price Range</a></li>
                		<li><a href="contact.jsp" <%= item.equalsIgnoreCase("contact")?"class='current'":"" %> >Contact</a></li>
		            </ul>

				</div>

		    </div> <!-- end of menu -->

		</div><!-- end of container-->

	</div><!-- end of experttag_background_section_top-->

<%-- 
    Document   : paymentdetail
    Created on : 13 Mar, 2017, 1:40:27 PM
    Author     : Irshed
--%>

<%@page import="General.Batch"%>
<%@page import="General.AcademicYear"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">

    
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
	
		
		</head>
                
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
		        
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                            

	<nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Payment</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="paymentdetail.jsp">Payment Details</a>
            
            </ul>
        </li>     
    </ul>
</nav>					
						

						
						
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
             <center>
            <form action="${pageContext.request.contextPath}/PaymentDetails" class="sky-form" method="post">
                <header>TECHNOLOGY</header>
    <fieldset>					
					<section>
                   <label class="input">
                     <div align="left" size="3px"><b>
                               Type :  </b></div>
                <label class="select">
                    
                 <select id="batch" name="banktype" required>
                   <option disabled selected>select</option>
                
                <option value="ibank">Indian Bank  </option>
                <option value="otherbank">Other Banks </option>
             </select>  
             
                <i></i>
                    </label>
            </label>
                                               
                            <br><br>
                  
               <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Academic Year : </b></div>
                <label class="select">
                    
                 <select id="batch" name="Year" required>
                <option disabled selected>Select   </option>
                <%=AcademicYear.getHTMLContent()%>
            </select>   
           
                <i></i>
                    </label>
            </label>
                 <br><br> 
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Batch : </b></div>
                <label class="select">
                    
                 <select id="batch" name="Batch" required>
                <option disabled selected>Select   </option>
                <%=Batch.getHTMLContent()%>
            </select>   
           
                <i></i>
                    </label>
            </label>
                 <br><br>
                
             <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Department : </b></div>
                <label class="select">
                    
                 <select id="batch" name="dept" required>
                <option disabled selected>Select </option>
                <option value ="all">All</option>
                <option value ="cse">CSE</option>
                <option value ="ece">ECE</option>
                <option value ="eee">EEE</option>
                <option value ="mech">MECH</option>
                <option value ="civil">CIVIL</option>
                <option value ="it">IT</option>
            </select>   
           
                <i></i>
                    </label>
            </label>
            <br><br>
             <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                            From Date</b></div>
                <label class="date">
            
            <input type="date" id="nfrom" placeholder="dd-mm-yyyy" name="from" />
            
             <i></i>
            <br> <br>
                </label></label>
                  
                 <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                            To Date</b></div>
                <label class="date">
            
            <input type="date" id="nfrom" placeholder="dd-mm-yyyy" name="to" />
            
             <i></i>
            <br> <br>
                </label></label>
                 <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
                                        </section>
    </fieldset>
                
            
            </form></center>



</div></div></section>

</section>
		
						<footer id="footer-widgets">
			<div class="container clearfix">
								Powered by St.Joseph's
							</div>
		</footer>
			<!-- #page-container -->
			</div>
			

	<footer id="page-footer">
		<div class="container clearfix">
			<div class="copy"></div>
			<nav id="footer-nav">
                            			<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>
				
    			</nav>
		</div>
	</footer>





<script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
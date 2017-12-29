<%-- 
    Document   : home
    Created on : 12 Nov, 2017, 5:24:40 PM
    Author     : Fluffy
--%>

<%@page import="Actor.Staff"%>
<%@page import="Downloads.Department"%>
<%@page import="Downloads.Exam"%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    <%
            String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");
    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/main.css">

        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/bootstraptab.css" rel="stylesheet">
        
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>    


       
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
                            <ul id="auth-nav">
                                <li>
                                    <div class="auth-nav-register">
                                        <a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
                                    </div>
                                </li>
                            </ul>






<nav id="main-nav">
    
      <ul id="menu-main-menu" class="menu">
          
                                    <li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778">
                                        <a href="home.jsp">Home</a></li> 
    
                               
                                    <li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page ">
                                        <a href="IdData.jsp">Download Data</a></li> </ul>      
                            </nav>
                        </div>
                    </div>
                </div>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>
                            <section class="landing">


    <div class="page-header">
        <h1>Circulars</h1>
    </div>
    <div class="row">
      
        <div  class="col-md-1"></div>
        <div  class="col-md-10">
            <div class="panel with-nav-tabs panel-primary">
                <div class="panel-heading">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1primary" data-toggle="tab">COLLEGE</a></li>
                           <li><a href="#tab4primary" data-toggle="tab">EVENTS</a></li>
                            
                        </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1primary"><%out.write(Circular.getHTMLContent(College.getAll("circular",clg)));%></div>
                      <div class="tab-pane fade" id="tab4primary"><%out.write(Circular.getHTMLContent(College.getAll("event",clg)));%></div>
                       
                    </div>
                </div>
            </div>
        </div>
      
	</div>

                                </section>



                        </div></div>

                    <br><br></section></center>		

            <footer id="footer-widgets">
                <div class="container clearfix">
                    Powered by St.Joseph's
                </div>
            </footer>
            <!-- #page-container -->
        </div>
    </div>

    <footer id="page-footer">
        <div class="container clearfix">
            <div class="copy"></div>
            <!--<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>-->
            <nav id="footer-nav">
                <ul id="menu-footer-menu" class="menu">
                    <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="../credits.html">Credits</a></li>
                    <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="../index.jsp">Logout</a></li>

                </ul>			</nav>
        </div>
    </footer>





    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
$("#menu-toggle").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});
$("#menu-toggle1").click(function (e) {
    e.preventDefault();
    $("#wrapper").toggleClass("toggled");
});
    </script>


    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html>
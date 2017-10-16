<%-- 
    Document   : home
    Created on : 18 Nov, 2016, 5:57:23 PM
    Author     : Home
--%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">

    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type = rsss.getString("type");
                }
                if (type.equals("placement")) {

    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/main.css">

        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>





        <link rel="stylesheet" href="../css/angular-material.css">



        <link rel="stylesheet" href="../css/angulartab.css">
        <script src="../js/angular.js"></script>
        <script src="../js/angular-animate.min.js"></script>
        <script src="../js/angular-route.min.js"></script>
        <script src="../js/angular-aria.min.js"></script>
        <script src="../js/angular-message.min.js"></script>
        <script src="../js/svg-assert-cache.js"></script>
        <script src="../js/angular-material.js"></script>
        <script src="../js/angulartab.js"></script>




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




                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="selectBatch.jsp">Student Details</a>

                                    </li>










                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>
                            <section class="landing">


                                <md-toolbar class="demo-toolbar md-primary _md _md-toolbar-transitions" style="width: 70%">

                                    <div class="md-toolbar-tools">

                                        <h3 class="ng-binding" style="text-align:center;">Circulars</h3>
                                        <span flex="" class="flex"></span>

                                    </div>
                                </md-toolbar>
                                <div ng-cloak="" class="tabsdemoDynamicHeight" ng-app="MyApp" style="width:70%"> 
                                    <md-content>
                                        <md-tabs md-dynamic-height="" md-border-bottom="">
                                            <md-tab label="College">
                                                <md-content class="md-padding">
                                                    <h1 class="md-display-2"></h1>

                                                    <%out.write(Circular.getHTMLContent(College.getAll("circular")));%>
                                                </md-content>
                                            </md-tab>

                                            </md-tab>
                                            <md-tab label="Events">
                                                <md-content class="md-padding">
                                                    <h1 class="md-display-2"></h1>
                                                    <%out.write(Circular.getHTMLContent(College.getAll("event")));%>
                                                </md-content>
                                            </md-tab>
                                        </md-tabs>
                                    </md-content>



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
            <nav id="footer-nav">
                <ul id="menu-footer-menu" class="menu">
                    <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
                    <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
                </ul>

            </nav>
        </div>
    </footer>






    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->



    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>
    <%
                } else {
                    response.sendRedirect("../index.jsp");
                }
            }

            if (sttt != null) {
                sttt.close();
            }
            if (connn != null) {
                connn.close();
            } else {
                response.sendRedirect("../index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../index.jsp");
        }

    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
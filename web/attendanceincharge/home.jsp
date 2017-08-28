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
                if (type.equals("yearincharge")) {


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

        <script src="../js/tabtab.min.js"></script>




        <!-- Google Analytics -->
        <script src="../js/analytics.js">


        </script>

        <script src="../js/plugin.js"></script>
        <script>
            $(window).load(function () {
                $(".tabs").tabtab({animateHeight: !1, fixedHeight: !1}), $(".tabdemo--one").tabtab({animateHeight: !0, fixedHeight: !1, scale: 1, rotateX: 0, speed: 500, transformOrigin: "center left", rotateY: 90, easing: "easeInOutCubic", translateX: 0, tabMenu: ".tabdemo__menu", tabContent: ".tabdemo__content"}), $(".tabdemo--two").tabtab({animateHeight: !0, fixedHeight: !1, scale: 1, rotateX: 0, speed: 500, transformOrigin: "center left", rotateY: 90, easing: "easeInOutCubic", translateX: 0, tabMenu: ".tabdemo__menu", tabContent: ".tabdemo__content"}), $(".package-managers-toggle").toggle({"class": "open", target: !1})
            });
        </script>
        <!-- Custom CSS -->



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







                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Attendance Report</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="attendancereport.jsp">Semester Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="DailyReportQuery.jsp">Daily Report</a>
                                        </ul></li>




                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Update Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updateattendance.jsp">Mark Absentees</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="editattendance.jsp">Edit</a>
                                        </ul></li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="requests.jsp">Grant OutPass</a>

                                    </li>

                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="sms.jsp">SMS</a>


                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Fee</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BasicFee.jsp">Basic Fee</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SpecialFee.jsp">Individual Fee</a>
                                        </ul></li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 "><a href="#">Student Update</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812  "><a href="sectionUpdate.jsp">Section</a>

                                        </ul></li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>
                            <section class="landing">

                                <div class="tabs" role="tabs">


                                    <div class="tabs__content">
                                        <div class="tabs__content-item active">
                                            <center><div style="color:#333333; margin-top: -75px;font-family: inherit;font-size:2.5em;">College Circular<br><br></div></center>
                                            <div style="width:100%;height:300px;line-height:3em;overflow-y:scroll;padding:5px; solid : #149dd2;">
                                                <div align="left">
                                                    <%            Connection conbatch = new dbcon().getConnection("sjitportal");
                                                        Statement stmt = conbatch.createStatement();
                                                        ResultSet rst = stmt.executeQuery("select * from circular where type='circular'");
                                                        String com1 = null, name1 = null, description1 = null, path1 = null;
                                                        rst.beforeFirst();
                                                        while (rst.next()) {
                                                            name1 = rst.getString("name");
                                                            description1 = rst.getString("des");
                                                            path1 = rst.getString("path");
                                                            com1 = name1 + " - " + description1;
                                                    %>
                                                    <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=name1%>&path=<%=path1%>&type1=circular" ><%=com1%></a>

                                                    <br>
                                                    <%
                                                        }
                                                        if (stmt != null) {
                                                            stmt.close();
                                                        }
                                                        if (conbatch != null) {
                                                            conbatch.close();
                                                        }
                                                    %>
                                                </div></div>
                                        </div>





                                        <div class="tabs__content-item">
                                            <center><div style="color:#333333; margin-top: -75px;font-family: inherit;font-size:2.5em;">Events<br><br></div></center>
                                            <div style="width:100%;height:300px;line-height:3em;overflow-y:scroll;padding:5px; solid #149dd2;">

                                                <div align="left">
                                                    <%
                                                        conbatch = new dbcon().getConnection("sjitportal");
                                                        stmt = conbatch.createStatement();

                                                        rst = stmt.executeQuery("select * from circular where type='event'");
                                                        rst.beforeFirst();
                                                        while (rst.next()) {
                                                            name1 = rst.getString("name");
                                                            description1 = rst.getString("des");
                                                            path1 = rst.getString("path");
                                                            com1 = name1 + " - " + description1;
                                                    %>
                                                    <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=name1%>&path=<%=path1%>&type1=circular" ><%=com1%></a>

                                                    <br>
                                                    <%
                                                        }
                                                        if (stmt != null) {
                                                            stmt.close();
                                                        }
                                                        if (conbatch != null) {
                                                            conbatch.close();
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </div>

                                    </div>

                                    <ul class="tabs__menu">
                                        <li class="tabs__menu-item yanone active" style="width: 50%" ><a href="#">College Circular</a></li>
                                        <li class="tabs__menu-item " style="width: 50%" ><a href="#">Events</a></li>
                                    </ul>

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
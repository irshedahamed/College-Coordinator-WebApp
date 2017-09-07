<%@page import="Actor.Councillor"%>
<%@page import="Actor.Student"%>
<%@page import="Actor.Staff"%>
<%@page import="General.AcademicYear"%>
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
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {

                session.setAttribute("deptname", Find.sdept(username));

    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../../css/main.css">
        <link href="../../css/sky-forms.css" rel="stylesheet">
        <link type="text/css" media="all" href="../../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        <!-- Custom CSS -->
        <link href="../../css/simple-sidebar.css" rel="stylesheet">

        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="../../js/jquery.js"></script>


        <link rel="stylesheet" href="../../css/angular-material.css">

        <link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">


        <link rel="stylesheet" href="../../css/angulartab.css">

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
        <script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>

        <script src="../../js/angulartab.js"></script>
    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">

                <%        Connection con = new dbcon().getConnection(Find.sdept(username));
                    Statement stmtd = con.createStatement();
                    ResultSet rsd = stmtd.executeQuery("select * from staff_general where staffid='" + username + "'");
                    if (rsd.next()) {
                %>
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#menu-toggle1" id="menu-toggle1">

                        </a>
                    </li>
                    <center>
                        <img src="../../images/face.jpg" height="95px">





                    </center>
                    <br>
                    <br>

                    <li>

                    <center>
                        <a href="#"><b><%=rsd.getString("tittle") + rsd.getString("name")%></b></a>
                    </center>
                    </li>
                    <li>
                    <center>
                        <a href="#"><b><%=username%></b></a>
                    </center>
                    </li>
                    <li >
                    <center>
                        <a href="#"><b><%=rsd.getString("desg")%></b></a>
                    </center>
                    </li>
                    <li >
                    <center>
                        <a href="#"><b><%=Find.sdept(username).toUpperCase()%></b></a>
                    </center>
                    </li>
                </ul>
            </div>

            <%}
                if (stmtd != null) {
                    stmtd.close();
                }
                if (con != null) {
                    con.close();
                }
            %>

            <header id="page-header"  class="fixed-header">

                <div id="page-header-inner">

                    <div id="header-container">
                        <div class="container clearfix">
                            <div id="main-logo">
                                <a href="#">
                                    <img src="../../images/sjit.png"  height="70px"></a>
                            </div>
                            <ul id="auth-nav">
                                <li>
                                    <div class="auth-nav-register">
                                        <a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
                                    </div>
                                </li>
                            </ul>







                            <nav id="main-nav">
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="StudentDisplay.jsp">Student Details</a>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Update Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812 "><a href="attendance.jsp">Mark Absentees</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812 "><a href="editattendance.jsp">Edit</a></li>


                                        </ul>
                                    </li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 "><a href="">Attendance Report</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="DailyReport.jsp">Daily Report</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SemReport.jsp">Semester Report</a></li>




                                        </ul>
                                    </li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">View Marks</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmarkbonus.jsp">Consolidated Report</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmark.jsp">View Marks</a></li>



                                        </ul>
                                    </li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="../home.jsp">Staff View</a>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>

                            <form action="attUpdate.jsp" class="sky-form">

                                <header>ATTENDANCE</header>

                                <fieldset>
                                    <label class="input">

                                        <div align="left" size="3px"><b>
                                                Date:</b></div>
                                        <label class="input">                             
                                            <input type="date" id="datepicker" placeholder="yyyy/mm/dd" name="datepicker" />

                                            <i></i>
                                            <br> <br>
                                        </label>  </label>





                                    <input type="submit" id="submit" value="Submit">
                                </fieldset>

                            </form>      

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
<%
        } else {
            response.sendRedirect("../../index.jsp");
        }
        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../../index.jsp");
    }


%>
</html>
<%-- 
    Document   : monthlyReport
    Created on : 27 Dec, 2016, 9:08:49 PM
    Author     : Home
--%>

<%@page import="com.action.Find"%>
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
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>




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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>




                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="">Add Entry</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="guest.jsp">Guest</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="entry.jsp">Staff & Students</a>
                                        </ul>
                                    </li>


                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#"> Report</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="monthlyReport.jsp">Monthly Report</a>
                                        </ul></li>










                                </ul>						</nav>
                        </div>
                    </div>
                </div>

                <script>

                    $(document).ready(function () {
                        $("#choose").on('change keydown', function () {

                            if ($(this).val() === "guest")
                                $(".dept").hide();
                            else
                                $(".dept").show();
                        });
                    });

                </script>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>
                            <section class="landing">


                                <center><form action="display.jsp" class="sky-form" method="post" target="_blank">
                                        <header>MONTHLY REPORT</header>
                                        <fieldset>					
                                            <section>

                                                <label class="input">
                                                    <div align="left" size="3px"><b>USER TYPE</b></div>
                                                    <label class="select">

                                                        <select id="choose" name="choose" required>
                                                            <option  disabled selected>Select</option>

                                                            <option value="staff">STAFF</option>
                                                            <option value="student">STUDENT</option>
                                                            <option value="guest">GUEST</option>

                                                        </select>
                                                        <i></i>                                    </label>
                                                </label>
                                                <div class="dept">
                                                    <br><br>           
                                                    <label class="input">
                                                        <div align="left" size="3px"><b>DEPARTMENT</b></div>
                                                        <label class="select">

                                                            <select id="dept" name="dept" required>

                                                                <%=Find.getDeptHTMLContent()%>
                                                                <option value="all">ALL</option>

                                                                <option value="first">Science & Humanities</option> 

                                                            </select>
                                                            <i></i>                                    </label>
                                                    </label>
                                                </div>                    
                                                <br><br>


                                                <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                            Start  Date</b></div>
                                                    <label class="input">

                                                        <input type="date" id="datepicker" placeholder="yyyy/mm/dd" name="datepicker" />

                                                        <i></i>
                                                        <br> <br>
                                                    </label></label>

                                                <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                            End  Date</b></div>
                                                    <label class="input">

                                                        <input type="date" id="datepicker" placeholder="yyyy/mm/dd" name="enddatepicker" />

                                                        <i></i>
                                                        <br> <br>
                                                    </label></label>
                                            </section>


                                            <div align="left">
                                                <input type="submit" id="submit" value="Submit" /></div>
                                            <br>
                                        </fieldset>
                                    </form></center>


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
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
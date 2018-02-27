<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">
    <%
            String username = session.getAttribute("username").toString();
     
    %>

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">


    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand"></li>

                </ul>
            </div>



            <header id="page-header"  class="fixed-header">

                <div id="page-header-inner">

                    <div id="header-container">
                        <div class="container clearfix">
                            <div id="main-logo">
                                <a href="#">
                                    <img src="../images/sjit.png"  height="70px"></a>
                            </div>








                            <nav id="main-nav">
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="subjectallocation.jsp">Subject Allocation</a>
                                        <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="courses/index.html">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="HourAttd.jsp">Update Attendance</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="Attd.jsp">View Attendance</a>

                                            </li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesReport.jsp">Notes Report</a>
                                            </li>
                                        </ul></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="circular.jsp">Circular</a>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="cireveupdates.jsp">Department Uploads</a>
                                    </li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="studentanalysis.jsp">Student Analysis</a>

                                    </li>
                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix">


                    <div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
                            <div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>College Circular</h2><br><br>
                                        <div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
                                            <div align="left">
                                                <%        Connection conbatch = new dbcon().getConnection("sjitportal");
                                                 //   Statement stmt = conbatch.createStatement();
                                                 PreparedStatement stmt=conbatch.prepareStatement("select * from circular where type='circular'");
                                                 ResultSet rs = stmt.executeQuery();
                                                    String com = null, name = null, description = null, path = null;
                                                    rs.beforeFirst();
                                                    while (rs.next()) {
                                                        name = rs.getString("name");
                                                        description = rs.getString("des");
                                                        path = rs.getString("path");
                                                        com = name + " - " + description;
                                                %>
                                                <a href="${pageContext.request.contextPath}/formsdownload?ind1=<%=name%>&path=<%=path%>&type1=circular" ><%=com%></a>

                                                <br>
                                                <%
                                                    }

                                                    if (stmt != null) {
                                                        stmt.close();
                                                    }
                                                    if (conbatch != null) {
                                                        ;//conbatch.close();
                                                    }
                                                %>
                                            </div>
                                    </center>
                                </div>
                            </div>
                        </div>
                    </div>

                </div

            </section>

        </section>
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
        <div class="copy">© All rights reserved, IncredibleBytes, 2014</div>
        <button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
        <nav id="footer-nav">
            <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>

                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
            </ul>			</nav>
    </div>
</footer>





<script src="../js/jquery.js"></script>

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
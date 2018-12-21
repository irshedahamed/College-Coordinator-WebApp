<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
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


        <script>
            $("#id1").click(function (e) {
                e.preventDefault();//this will prevent the link trying to navigate to another page
                var href = $(this).attr("href");//get the href so we can navigate later
                document.getElementById("id1").setAttribute("filename1", "filename1")

                //do the update

                //when update has finished, navigate to the other page
                window.location = href;
            });
        </script>


    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#menu-toggle1" id="menu-toggle1">
                            Aravind S
                        </a>
                    </li>
                    <center>
                        <img src="../images/face.jpg" height="95px">





                    </center>
                    <br>
                    <br>

                    <%                    String name1 = session.getAttribute("name1").toString();
                        String rollno1 = session.getAttribute("rollno1").toString();
                        String course1 = session.getAttribute("course1").toString();
                        String sec1 = session.getAttribute("sec1").toString();


                    %>

                    <li >


                        <a href="#"><b>NAME : <%=name1%></b></a>

                    </li>
                    <li>
                        <a href="#"><b>ROLL NO : <%=rollno1%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>COURSE : <%=course1%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>DEPT : CSE</b></a>
                    </li>
                    <li >
                        <a href="#"><b>SECTION : <%=sec1%></b></a>
                    </li>
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
                            <ul id="auth-nav">
                                <li>
                                    <div class="auth-nav-register">
                                        <a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
                                    </div>
                                </li>
                            </ul>







                            <nav id="main-nav">
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">Contact Details</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="ViewAttd.jsp">Hour Attendance</a>

                                            </li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Circular</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="circular.jsp">General Circular</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="examcircular.jsp">Exam Circular</a>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href=" deptcircular.jsp">Department Circular</a>

                                            </li>
                                        </ul>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Fee</a>

                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="forms.jsp">Forms</a>

                                    </li>
                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>

            <%

                List<String> list = new ArrayList<String>();
                List<String> list1 = new ArrayList<String>();

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    Connection connection1 = new dbcon().getConnection("sjitportal");
                    //Statement statement1 = connection1.createStatement();
                    PreparedStatement statement1=connection1.prepareStatement("select * from exam_circular");
                    ResultSet rs = statement1.executeQuery();
                    String path = Base.path + "/portal/exam/";
                    session.setAttribute("path", path);

                    while (rs.next()) {
                        String file = rs.getString("file_name");
                        String desc = rs.getString("descp");
                        list.add(file);
                        list1.add(desc);

                    }

            %>
            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


                        <div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>EXAM CIRCULAR</h2><br><br>
                                            <div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
                                                <div align="left">


                                                    <%                for (int i = 0; i < list.size(); i++) {

                                                            //session.setAttribute(str,list.get(i));

                                                    %>
                                                    <a href="${pageContext.request.contextPath}/notesdownload?ind1=<%=list.get(i)%>" ><%=list1.get(i)%></a>
                                                    <br>
                                                    <%

                                                            }
                                                            session.setAttribute("size", list.size());
                                                            if (statement1 != null) {
                                                                statement1.close();
                                                            }
                                                            if (connection1 != null) {
                                                                connection1.close();
                                                            }
                                                        } catch (Exception e) {

                                                        }
                                                    %></div>
                                            </div>
                                        </center>
                                    </div>
                                </div>


                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>Department Events</h2><br><br>
                                            <div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2; background-color: #fff;">
                                                <div align="left">

                                                </div>
                                            </div>
                                        </center></div></div>
                            </div><ul class="dm3-tabs-nav"></ul></div>
                    </div></div></section>

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
                <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
                <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
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
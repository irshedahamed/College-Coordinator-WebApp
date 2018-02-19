<%@page import="Actor.Student"%>
<%@page import="Downloads.Notes"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
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


    <%                    String batch = "", name = "", rollno = "", course = "", sec = "";

        Student s = Student.getById(username);
        name = s.getById(username).getName();
        rollno = s.getById(username).getId();
        course = s.getById(username).getCourse();
        sec = s.getById(username).getSec();
        batch = s.getById(username).getBatch();


    %>


    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#menu-toggle1" id="menu-toggle1">

                        </a>
                    </li>
                    <center>

                        <img src="../../StudentPhotos/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />






                    </center>
                    <br>
                    <br>

                    <li >


                        <a href="#"><b>NAME : <%=name%></b></a>
                    </li>
                    <li>
                        <a href="#"><b>ROLL NO : <%=rollno%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>COURSE : <%=course%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>DEPT : <%=Find.sdept(username)%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>SECTION : <%=sec%></b></a>
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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">General Details</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>


                                    </li>
                                </ul>
                                </li>

                                <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="notes.jsp">Notes</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="fee.jsp">Fee</a>

                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="forms.jsp">Forms</a>

                                </li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>

            <%
                String ayear = request.getParameter("ayear");
                course = request.getParameter("course");
                String dept = request.getParameter("dept");
                batch = request.getParameter("batch");
                String sem = request.getParameter("sem");
                String subject1 = request.getParameter("subject");
                String subcode = request.getParameter("subject");
                String[] parts = subcode.split("-");
                subcode = parts[0];
                String subject = parts[1];
                String notes = request.getParameter("notes");
                String a = subject1.toUpperCase();

                Notes n = new Notes();
                n.setAcademicyr(ayear);
                n.setSem(sem);
                n.setSubcode(subcode);
                n.setType(notes);


            %>
            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


                        <div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><h2><%=a%></h2><br><br>
                                            <div style="width:60%;height:300px;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
                                                <div align="left">

                                                    <%=Notes.getHTMLContent(Notes.getAll(dept, n))%>


                                                </div>
                                            </div>
                                        </center>
                                    </div>
                                </div>



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
                        <div class="copy"></div>
                        <nav id="footer-nav">
                            <ul id="menu-footer-menu" class="menu">
                                <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
                                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
                            </ul>			</nav>
                    </div>
                </footer>




                <script src="../js/jquery.js"></script>

                <!-- Bootstrap Core JavaScript -->
                <script src="../js/bootstrap.min.js"></script>    <script src="../js/mobileToggle.js"></script>

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
<%-- 
    Document   : paynow
    Created on : 29 Jan, 2017, 5:23:49 PM
    Author     : Home
--%>
<%@page import="Actor.Student"%>
<%@page import="Fee.MUResponse"%>
<%@page import="Downloads.Exam"%>
<%@page import="Downloads.Department"%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    <%
            String username = session.getAttribute("username").toString();
                session.setAttribute("deptname", Find.sdept(username));

    %>

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./css/main.css">

        <link type="text/css" media="all" href="./wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        <!-- Custom CSS -->
        <link href="./css/simple-sidebar.css" rel="stylesheet">

        <link href="./css/bootstrap.min.css" rel="stylesheet">
        <link href="./css/sky-forms.css" rel="stylesheet">
        <script src="./js/jquery.js"></script>




    </head>


    <%                    //Connection conection = new dbcon().getConnection(Find.sdept(username));
        //Statement st1 = conection.createStatement();
        String batch = "", name = "", rollno = "", course = "", sec = "";
        Student s1 = Student.getById(username);
        //ResultSet rs1 = st1.executeQuery("select * from student_personal where rollno='"+username+"'");
        //if(rs1.next())
        //{
        name = s1.getName();
        rollno = s1.getId();
        course = s1.getCourse();
        sec = s1.getSec();
        batch = s1.getBatch();
        session.setAttribute("name1", name);
        session.setAttribute("rollno1", rollno);
        session.setAttribute("course1", course);
        session.setAttribute("sec1", sec);

        //if(st1!=null)
        //                    st1.close();
        //                    if(conection!=null)
        //                       conection.close();

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

                        <img src="./../StudentPhotos/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='./images/face.jpg';" />




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
                        <a href="#"><b>DEPT : <%=Find.sdept(rollno).toUpperCase()%></b></a>
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
                                    <img src="./images/sjit.png"  height="70px"></a>
                            </div>
                            <ul id="auth-nav">
                                <li>
                                    <div class="auth-nav-register">
                                        <a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
                                    </div>
                                </li>
                            </ul>







                            <nav id="main-nav">
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="student/home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="student/personal.jsp">Personal Details</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="student/contact.jsp">General Details</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="student/other.jsp">Other Details</a></li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="student/overallattendance.jsp">Overall Attendance</a></li>


                                    </li>
                                </ul>
                                </li>

                                <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="student/marks.jsp">Marks</a></li>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="student/notes.jsp">Notes</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="fee.jsp">Fee</a>

                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="student/forms.jsp">Forms</a>

                                </li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>




            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                            <section class="landing">
                                <h2> Challan has been Generated Successfully</h2><br><br>
                                <center>  
                                    <form  class="sky-form" method="post" action="./redirectPay" >
                                        <header>Choose Mode Of Pay</header>
                                        <fieldset>					
                                            <section>








                                                <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            MODE </b></div>
                                                    <label class="select">

                                                        <select id="mode" name="mode" required>
                                                            <option disabled selected>select</option>
                                                            <option value="offline">Via Challan In Indian Bank Counter</option>
                                                            <option value="indianbank">NetBanking (Indian Bank Only)</option>
                                                            <option value="others">Credit/Debit Cards/Net Banking</option>

                                                        </select>
                                                        <i></i>
                                                        <br> <br>
                                                    </label></label>


                                            </section>


                                            <div align="right">
                                                <input type="hidden" value="<%=((MUResponse) session.getAttribute("MUResponse")).getRefno()%>" name="munumber">
                                                <input type="submit" id="submit" value="Submit" /></div>
                                            <br>
                                        </fieldset>
                                    </form><br><br></center>
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
                    <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="./Credits.html">Credits</a></li>
                    <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="./index.jsp">Logout</a></li>
                </ul>			</nav>
        </div>
    </footer>





    <!-- Bootstrap Core JavaScript -->
    <script src="./js/bootstrap.min.js"></script>
    <script src="./js/mobileToggle.js"></script>

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


    <script type="text/javascript" defer src="./wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html>

<%-- 
    Document   : fee.jsp
    Created on : 29 Jan, 2017, 2:41:09 PM
    Author     : Home
--%>

<%@page import="General.AcademicYear"%>
<%@page import="Fee.MUResponse"%>
<%@page import="Actor.Student"%>
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
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from student_login_details where rollno='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {

                session.setAttribute("deptname", Find.sdept(username));

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
        <link href="../css/tabledesign.css" rel="stylesheet">

        <script src="../js/jquery.js"></script>




    </head>


    <%                    String batch = "", name = "", rollno = "", course = "", sec = "";
        Student s1 = Student.getById(username);

        name = s1.getName();
        rollno = s1.getId();
        course = s1.getCourse();
        sec = s1.getSec();
        batch = s1.getBatch();
        session.setAttribute("name1", name);
        session.setAttribute("rollno1", rollno);
        session.setAttribute("course1", course);
        session.setAttribute("sec1", sec);


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
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="fee.jsp">Fee</a>

                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="forms.jsp">Forms</a>

                                </li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <%
                Student s = Student.getById(username);
            %>			

            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br>
                            <section class="landing">

                                <div style="border: 2px; width: 400px">
                                    <table class="bordered">
                                        <thead>
                                            <tr>
                                                <th>Student Name</th>
                                                <th> RollNo</th>    
                                            </tr>
                                        </thead>

                                        <tr>

                                            <td style="padding-right:3px;"><%= s.getName()%> </td>


                                            <td><%= s.getId()%></td>
                                        </tr>


                                    </table>


                                    <%
                                        Integer sum = 0;
                                        boolean paidCurrent = false;
                                    %>

                                    <h2> Payment History </h2>
                                    <table class="bordered" style="width:100%;">
                                        <thead>
                                            <tr>
                                                <th>S No</th>
                                                <th>Academic Year </th>    
                                                <th>Reference Number</th>
                                                <th>Fee Amount </th>
                                            </tr>
                                        </thead>

                                        <%
                                            int sno = 0;
                                            for (MUResponse paid : MUResponse.getPaidMUP(username)) {
                                                if (paid.getAcyear().equals(AcademicYear.getFeeYear().getYear())) {
                                                    paidCurrent = true;
                                                }
                                        %>

                                        <td><%=++sno%></td>
                                        <td><%=Integer.parseInt(paid.getAcyear()) + 1%></td>
                                        <td><a href="../showReceipt?mup=<%=paid.getRefno()%>&acyear=<%=paid.getAcyear()%>"><%=paid.getRefno()%><br>Click to View</a></td>
                                        <td><%=paid.getTotalamt()%></td>

                                        <%}

                                        %>
                                    </table>
                                    <%               if (!paidCurrent) {

                                    %>
                                    <table class="bordered">
                                        <thead>
                                            <tr>
                                                <th>Fee Name</th>
                                                <th>Fee Amount </th>    
                                            </tr>
                                        </thead>

                                        <%                    try {
                        Fee.Fee f = Fee.Fee.getFeeById(s.getId());
                        for (String type : Fee.Fee.getsubCategory()) {%>
                                        <tr>
                                            <td><%=Fee.Find.getType(type)%></td>
                                            <td align="right"><%= f.getByType(type)%></td>
                                        </tr>
                                        <%
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            }
                                        %>
                                    </table>
                                    <form method="post" action="../generateMUP">
                                        <input type="submit"  id="submit" value="Generate  Challan">
                                    </form>

                                    <%
                                        }
                                    %>
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
                </ul>			</nav>
        </div>
    </footer>





    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/mobileToggle.js"></script>

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
            response.sendRedirect("../index.jsp");
        }
        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            ;//connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }


%>
</html>

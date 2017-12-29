<%-- 
    Document   : SubjectView
    Created on : 16 May, 2016, 6:20:04 PM
    Author     : Arun
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
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
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">


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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Academics</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
                                                </ul>
                                            </li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="course.jsp">Course</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                                                        <ul class="sub-menu">
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=cse">CSE</a>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=ece">ECE</a>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=eee">EEE</a>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=mech">MECH</a>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=civil">CIVIL</a>
                                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=it">IT</a>
                                                        </ul></li>
                                                </ul></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="feedetails.jsp">Fee Details</a></li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Students</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentprofiles.jsp">Profile</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileupdate.jsp">Add Profile</a>

                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileedit.jsp">Update Profile</a>

                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profiledelete.jsp">Delete Profile</a>
                                                </ul></li>	
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="studentpasswords.jsp">Passwords</a>

                                            </li>
                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Staff</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Profile</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofileupdate.jsp">Add Profile</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofiledelete.jsp">Delete Profile</a>
                                                </ul></li>	


                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffpasswords.jsp">Passwords</a></li>

                                        </ul>
                                    </li>

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">SMS</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="generalsms.jsp">General</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="absentieessms.jsp">Absentees</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksms.jsp">Mark</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffsms.jsp">Staff</a></li>

                                        </ul>
                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Email</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="sendemail.jsp">Send Email</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="emailstatus.jsp">View Email Status</a>

                                            </li>
                                        </ul>

                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circularupload.jsp">Circular Uploads</a>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Forms</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formupload.jsp">Form Upload</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formmanage.jsp">Manage</a></li>

                                        </ul>
                                    </li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Reports</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="PasswordReport.jsp">Password</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="AddressReport.jsp">Address</a>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="verificationReport.jsp">Verification</a>


                                            </li>
                                        </ul>

                                </ul>					


                            </nav>
                        </div>
                    </div>
                </div>
            </header>

            <form action="${pageContext.request.contextPath}/deleteSubject" method="post">
                <link href="../css/tabledesign.css" rel="stylesheet">
                <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <center>
                                <table class="bordered">
                                    <tr>
                                        <th><center>REGULATION</center></th>
                                    <th><center>SEM</center></th>
                                    <th><center>SUBJECT CODE</center></th>
                                    <th><center>SUBJECT NAME</center></th>
                                    <th><center>SUBJECT TYPE</center></th>
                                    <th><center>Delete</center></th>
                                    </tr> 

                                    <%                try {
                                            String dept = request.getParameter("dept");

                                            Connection con = new dbcon(clg).getConnection(dept);
                                            //Statement st = con.createStatement();
                                            PreparedStatement st=con.prepareStatement("select * from subject_sem_table order by regulation,sem");
                                            ResultSet rs = st.executeQuery();
                                            String subcode, regulation, subname, sem, subtype;
                                            while (rs.next()) {
                                                subcode = rs.getString("subcode");
                                                regulation = rs.getString("regulation");
                                                subname = rs.getString("subname");
                                                sem = rs.getString("sem");
                                                subtype = rs.getString("subtype");
                                    %>

                                    <input type="hidden" value="<%= dept%>" name="dept">

                                    <tr>
                                        <td><%=regulation%></td>
                                        <td><%=sem%></td>
                                        <td><%=subcode%></td>
                                        <td><%=subname%></td>
                                        <td><%=subtype%></td>
                                        <td><center>

                                        <input type="checkbox" name="check" value="<%= rs.getString("subcode") + " "%><%= rs.getString("regulation")%>"></center>
                                    </td>
                                    </tr>


                                    <%  }
                                            if (st != null) {
                                                st.close();
                                            }
                                            if (con != null) {
                                                ;//con.close();
                                            }
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                    %>

                                </table>    
                                <input type="submit" id="submit" value="Delete">
                            </center>
                        </div></div></section></form>



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
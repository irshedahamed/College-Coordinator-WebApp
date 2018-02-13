<%-- 
    Document   : PasswordReport
    Created on : Aug 10, 2016, 9:38:34 AM
    Author     : Lenovo
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%-- 
    Document   : studentpassword
    Created on : 14 May, 2016, 6:56:07 PM
    Author     : Arun
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    

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
                            <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Academics</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
                                            </ul>
                                        </li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Academic Year</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="InsertYear1.jsp">Insert Academic Year</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="odd.jsp">Update Current</a>
                                            </ul>
                                        </li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                                                    <ul class="sub-menu">
                                                        <% for (String dept : Find.Depts) {%>
                                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=<%=dept%>"><%=dept.toUpperCase()%></a>
                                                        <%}%>     </ul></li>
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

                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="absentieessms.jsp">Absentiees</a></li>
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


                                <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Reports</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="PasswordReport.jsp">Password</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="AddressReport.jsp">Address</a>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="verificationReport.jsp">Verification</a>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="BoardingptReport.jsp">Boarding Point</a>


                                        </li>
                                    </ul>

                            </ul>					


                        </nav>
                    </div>
                </div>
            </div>
        </header>


        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                    <center>
                        <form action="${pageContext.request.contextPath}/admin/PasswordReport.jsp" class="sky-form" method="post">
                            <header>STUDENT PASSWORDS</header>
                            <fieldset>					
                                <section>
                                    <label class="input">
                                        <div align="left" size="3px"><b>
                                                Dept: </b></div>
                                        <label class="select">

                                            <select name="dept">
                                                <%=Find.getDeptHTMLContent()%>

                                            </select>

                                            <i></i>
                                        </label>
                                    </label>
                                    <br><br>
                                    <label class="input">
                                        <div align="left" size="3px"><b>
                                                Batch:</b></div>
                                        <label class="select">
                                            <select id="batch" name="batch" required>
                                                <option disabled selected>select</option>
                                                <%=Batch.getHTMLContent()%>
                                            </select>
                                            <i></i>
                                        </label></label>
                                    <br><br>
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                </section>
                            </fieldset>


                        </form></center>



                    <%

                        Connection con = new dbcon().getConnection("login");
                        //Statement st = con.createStatement();
                        String batch;
                        String rollno, pass, dept;
                        if (request.getParameter("dept") != null) {
                    %>

                    <br><br><br>

                    <style>
                        .bodered{
                            padding: 0px;
                        }

                    </style>
                    <link href="../css/tabledesign.css" rel="stylesheet">
                    <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                                <%
                                    dept=request.getParameter("dept");
                                    batch = request.getParameter("batch");
                                    PreparedStatement st=con.prepareStatement("select l.*,p.name from student_login_details l,?.student_personal p where l.rollno=p.rollno and p.batch=?");
                                  st.setString(1, dept);
                                    st.setString(2, batch);
                                    ResultSet rs = st.executeQuery();

                                    while (rs.next()) {
                                        rollno = rs.getString("rollno");
                                        pass = rs.getString("password");
                                        Student s = Student.getById(rollno);
                                %>
                                <center>

                                    <table class="bordered" style="border: 2px solid;page-break-inside: avoid;">
                                        <tr>

                                            <th><center>Name</center></th>
                                        <th style="border: 2px solid;"><center>URL</center></th>
                                        <th style="border: 2px solid;"><center>User Name</center></th>
                                        <th style="border: 2px solid;"><center>Password</center></th>

                                        </tr>
                                        <tr style="border: 2px solid;">
                                            <td style="border: 2px solid;"><center><%=s.getName()%></center></td>
                                        <td style="border: 2px solid;"><center>www.portal.stjosephstechnology.ac.in</center></td>
                                        <td style="border: 2px solid;"><center><%=rollno.toUpperCase()%></center></td>
                                        <td><center><%=pass%></center></td>
                                        </tr>
                                    </table>
                                </center>


                                <%
                                        }
                                    }

                                    
                                    if (con != null) {
                                        ;//con.close();
                                    }
                                %>

                            </div></div></section>




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
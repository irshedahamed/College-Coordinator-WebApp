<%-- 
    Document   : ElectiveView
    Created on : 17 Jul, 2016, 5:02:54 PM
    Author     : Home
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="General.AcademicYear"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <%
            String username = session.getAttribute("username").toString();
     
    %>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->

        <link href="../css/sky-forms.css" rel="stylesheet">



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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="subjectallocation.jsp">Subject Allocation</a>
                                        <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>


                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
                                        </ul>
                                    </li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Elective Selection</a>
                                        <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectSelection.jsp">Assign</a></li>

                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="ElectiveView.jsp">View</a></li> 
                                        </ul>
                                    </li>


                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Student</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="YrAttendance.jsp">View Attendance</a></li>

                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="marks.jsp">View Marks</a></li>

                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="BonusQuery.jsp">Bonus Remove</a></li>
                                        </ul></li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesReport.jsp">Notes Report</a>
                                            </li>
                                        </ul></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="cireveupdates.jsp">Department Uploads</a>
                                    </li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="studentanalysis.jsp">Student Analysis</a>

                                    </li>
                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                        <center>
                            <form action="${pageContext.request.contextPath}/dept/ElectiveView.jsp" class="sky-form" method="post">
                                <header>ELECTIVE VIEW</header>
                                <fieldset>					
                                    <section>
                                        <%           Connection connection = null;
                                     //       Statement statement = null;
                                            try {

                                                String departmentname = Find.dept(username);

                                                connection = new dbcon().getConnection("sjitportal");
                                       //         statement = connection.createStatement();
                                       PreparedStatement statement=connection.prepareStatement("select distinct(regulation) from regulations ");
                                       ResultSet rs = statement.executeQuery();
                                                String regulation = "";

                                        %>   




                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Department: </b></div>
                                            <label class="select change">

                                                <select id="dept" name="dept">

                                                    <option value=<%=departmentname%>><%= departmentname%></option>



                                                </select>
                                                <i></i>
                                            </label>
                                        </label>
                                        <br><br>



                                        <div align="left" size="3px"><b>
                                                Regulation: </b></div>
                                        <label class="select change">

                                            <select id="regulation" name="regulation">
                                                <%    while (rs.next()) {

                                                        regulation = rs.getString("regulation");

                                                %>
                                                <option value="<%= regulation%>"><%= regulation%></option>
                                                <%
                                                    }
                                                %> 

                                            </select>
                                        </label>
                                        <i></i>
                                        <br> <br>
                                        <%
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                            } finally {
                                             //   if (statement != null) {
                                               //     statement.close();
                                               // }
                                                if (connection != null) {
                                                    connection.close();
                                                }
                                            }

                                        %>


                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Semester: </b></div>
                                            <label class="select change">

                                                <select id="sem" name="sem" >
                                                    <option value="00">select</option>
                                                    <option value="01">1</option>
                                                    <option value="02">2</option>
                                                    <option value="03">3</option>
                                                    <option value="04">4</option>
                                                    <option value="05">5</option>
                                                    <option value="06">6</option>
                                                    <option value="07">7</option>
                                                    <option value="08">8</option>
                                                </select>
                                                <i></i>
                                            </label>
                                        </label>

                                        <br><br>



                                        <label class="select">
                                            <div align="left" size="3px"><b>
                                                    Academic Year:</b></div>
                                            <label class="input">
                                                <select id="ayear" name="ayear">
                                                    <%=AcademicYear.getHTMLContent()%>
                                                </select>
                                                <i></i>
                                            </label>
                                        </label>
                                        <br> <br>




                                    </section>       
                                    <div align="left">
                                        <center><input type="submit" id="submit" value="View" /></center></div>
                                    <br>
                                </fieldset>


                            </form></center>
                            <%

                                Connection con = new dbcon().getConnection(Find.dept(username));
                           //     Statement st = con.createStatement();
                                String regulation, subcode, subname;
                                if (request.getParameter("ayear") != null) {
                            %>
                        <br><br><br>
                        <link href="../css/tabledesign.css" rel="stylesheet">
                        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                                    <center>
                                        <script>

                                            window.scrollTo(0, document.body.scrollHeight);

                                        </script>
                                        <table class="bordered">
                                            <tr>

                                                <th><center>Subject Code</center></th>
                                            <th><center>Subject Name</center></th>

                                            </tr>
                                            <%
                                                String acyear=request.getParameter("ayear");
                                                String sem=request.getParameter("sem");
                                                 regulation=request.getParameter("regulation");
                                                PreparedStatement st=con.prepareStatement("select * from subject_sem_table where ayear like 'elective%"+acyear+"%' and sem=? and regulation=?");

                                                st.setString(1, sem);
                                                st.setString(2, regulation);
                                                ResultSet rs = st.executeQuery();
                                                while (rs.next()) {
                                                    subcode = rs.getString("subcode");
                                                    subname = rs.getString("subname");
                                            %>
                                            <tr>
                                                <td><%=subcode%></td>
                                                <td><%=subname%></td>
                                            </tr>
                                            <%
                                                }
                                            %>
                                        </table>
                                    </center>
                                    <%
                                        }

                                    //    if (st != null) {
                                      //      st.close();
                                        //}
                                        if (con != null) {
                                            ;//con.close();
                                        }
                                    %>

                                </div></div></section>
                    </div></div></section>


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
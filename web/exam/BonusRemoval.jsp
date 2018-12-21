<%-- 
    Document   : BonusRemoval
    Created on : 25 Aug, 2016, 8:42:27 PM
    Author     : Home
--%>
<%@page import="java.sql.PreparedStatement"%>
<%-- 
    Document   : BonusQuery
    Created on : 25 Aug, 2016, 7:54:36 PM
    Author     : Home
--%>

<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en-US">
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type1 = rsss.getString("type");
                }
                if (type1.equals("exam")) {


    %>

    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <link href="../css/tabledesign.css" rel="stylesheet">

        <!-- Custom CSS -->



        <script src="../js/jquery.js"></script>
        <script>
            $(document).ready(function () {
                $(".tick").on('change', function (e) {
                    //console.log(this); 
                    if ($(this).val() === "add")
                        $(this).closest('tr').css({"background": "#e1070a"});
                    if ($(this).val() === "delete")
                        $(this).closest('tr').css({"background": "green"});
                });
            });
        </script>
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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>




                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="#">Marks</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemarks.jsp">Update Marks</a></li>

                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmark.jsp">View Marks</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="ExamDate.jsp">End Date Entry</a></li>



                                    </li>
                                </ul>
                                </li>


                                <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="#">Report Generation</a>
                                    <ul class="sub-menu">
                                           <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="AnalysisReport.jsp">Exam Report</a></li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="reportgeneration.jsp">Marks Report Staff</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmarkbonus.jsp">Marks Report Student</a></li>



                                </li>
                                </ul>
                                </li>



                                <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Student</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemodeltype.jsp">Update Model Type</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="regnoupdate.jsp">Update Register No.</a></li>

                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BonusQuery.jsp">Bonus Assignment</a></li>
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="StudentNo.jsp">Student no display</a></li>

                                    </ul>
                                </li>



                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>


                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="examuploads.jsp">Exam Uploads</a>

                                </li></ul>						</nav>		</div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                        <form method="post" action="${pageContext.request.contextPath}/RemoveBonus">
                            <%                                String sem = request.getParameter("sem");
                                String sec = request.getParameter("section");
                                String batch = request.getParameter("batch");
                                String exam = request.getParameter("exam");
                                String dept = request.getParameter("dept");
                            %>
                            <input type="hidden" name="exam" value="<%=exam%>">	
                            <input type="hidden" name="sem" value="<%=sem%>">
                            <input type="hidden" name="batch" value="<%=batch%>">
                            <input type="hidden" name="section" value="<%=sec%>">
                            <input type="hidden" name="dept" value="<%=dept%>">


                            <%
                                Connection conn = null;
                                //Statement stmt=null;

                                try {
                                    conn = new dbcon().getConnection(dept);
                                    // stmt=conn.createStatement();
                            %>

                            <center><table  class="bordered">
                                    <thead>
                                    <th>Tick to Provide Again</th>
                                    <th>Rollno</th>
                                    <th>Name</th>
                                    <th>Tick to Remove Bonus</th>

                                    </thead>

                                    <%
                                        String sql2 = "select * from student_personal where batch=? and sec=? order by rollno";
                                        PreparedStatement stmt = conn.prepareStatement(sql2);
                                        stmt.setString(1, batch);
                                        stmt.setString(2, sec);
                                        ResultSet rs = stmt.executeQuery();
                                        while (rs.next()) {
                                            String rollno = rs.getString("rollno");
                                            String name = rs.getString("name");
                                    %>
                                    <%
                                        String bsql = "select * from bonuscut where rollno=? and sem=?";
                                        //Statement bstmt=conn.createStatement();
                                        PreparedStatement bstmt = conn.prepareStatement(bsql);
                                        bstmt.setString(1, rollno);
                                        bstmt.setString(2, sem);
                                        ResultSet brs = bstmt.executeQuery();
                                        int assessment = 0;
                                        if (brs.next()) {
                                            if ((Integer.valueOf(brs.getString("assessment")) <= Integer.valueOf(exam)) && sem.equals(brs.getString("sem"))) {
                                    %>
                                    <tr  style="background: #e1070a;">
                                        <%   } else {
                                        %>
                                    <tr>
                                        <%  }
                                        } else {
                                        %>
                                    <tr>
                                        <%}%>
                                        <td><center><input type="radio" class="tick" name="<%=rollno%>" value="delete"></center></td>
                                    <td><%=rollno%></td>
                                    <td><%=name%></td>
                                    <td><input type="radio" name="<%=rollno%>" class="tick" value="add"></td>
                                    </tr>



                                    <%
                                            }

                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        } finally {

                                            //     if(stmt!=null)
                                            //       stmt.close();
                                            if (conn != null)
                                    ;//conn.close();
                                        }


                                    %>
                                </table>

                                <input type="submit" id="submit" value="Submit">
                            </center>   
                        </form>        
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
<%            } else {
                response.sendRedirect("../index.jsp");
            }
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
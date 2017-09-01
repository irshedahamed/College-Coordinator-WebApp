<%-- 
    Document   : personalDisplay
    Created on : 27 Dec, 2016, 9:25:23 PM
    Author     : Home
--%>
<%@page import="General.Hostel"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.SQLException"%>
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
            String type = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type = rsss.getString("type");
                }
                if (type.equals("hostel")) {


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
        <link href="../css/simple-sidebar.css" rel="stylesheet">



    <center>
        <img src="../images/logo2.png" height="165px" width="700px" />	</center>
</head>

<body class="home page page-id-115 page-template-default has-toolbar">
    <div id="wrapper" class="toggled">




        <style rel="stylesheet">
            .bordered td{
                padding: 0px;
                text-align: center;
            }
            .bordered th{
                text-align: center;

            }

        </style>


        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                    <%    int i = 0;
                        String id = request.getParameter("id");
                        String dept = Find.sdept(id);

                        Connection conn = null;
                        Statement stmt = null;
                        try {

                            // Class.forName("com.mysql.jdbc.Driver").newInstance();                      
                            conn = new dbcon().getConnection("sjitportal");

                            stmt = conn.createStatement();
                            String sql;

                            sql = "select a.rollno,a.reason,a.from,a.till,b.rollno,b.name from outpassform a," + dept + ".student_personal b where  a.rollno='" + id + "'  and a.rollno=b.rollno and a.status='Accepted'";
                            ResultSet rs = stmt.executeQuery(sql);


                    %>

                    <center>

                        <h3>Personal Report </h3><br>
                        <h4>Category: <%=username.toUpperCase()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            Department: <%=dept.toUpperCase()%></h4> <br>    
                        <table class="bordered">
                            <thead>
                                <tr>   
                                    <th>S.No</th>
                                    <th>ID</th>
                                    <th>NAME</th>
                                    <th>DEPT</th>
                                    <th>REASON</th>
                                    <th>FROM</th>
                                    <th>TILL</th></tr></thead>
                                        <%while (rs.next()) {

                                                Student stu = Student.getById(rs.getString("rollno"));

                                                boolean flag = Hostel.AuthenticateAccess(username, stu);
                                                if (flag) {
                                        %>
                            <tr>
                                <td> <%=++i%> </td>
                                <td> <%=rs.getString("rollno")%> </td>
                                <td> <%=rs.getString("name")%> </td>
                                <td><%=dept.toUpperCase()%> </td>

                                <td> <%=rs.getString("reason")%> </td>
                                <td> <%=Find.getFormattedDate(rs.getString("from"))%> </td>
                                <td> <%=Find.getFormattedDate(rs.getString("till"))%> </td>

                            </tr>
                            <%
                                    }
                                }
                            %>


                        </table>
                    </center>     
                    <%} catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            try {
                                if (stmt != null) {
                                    stmt.close();
                                }
                                if (conn != null) {
                                    conn.close();
                                }
                            } catch (SQLException ex) {
                                ex.printStackTrace();
                            }
                        }
                    %>
                </div></div></section>


    </div>
</div>






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
<%
            } else {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
</html>
<%-- 
    Document   : display
    Created on : 15 Feb, 2017, 4:42:16 PM
    Author     : Home
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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



    </head>
    <center>
        <img src="../images/logo2.png" height="165px" width="700px" />	</center>	
    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
        </div>
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

                    <%                int i = 0;
                        String deptReq = request.getParameter("dept");
                        String dateonentry = request.getParameter("datepicker");
                        String enddate;
                        if (request.getParameter("enddatepicker") == null) {
                            enddate = dateonentry;
                        } else {
                            enddate = request.getParameter("enddatepicker");
                        }

                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                        Calendar c = Calendar.getInstance();
                        c.setTime(sdf.parse(enddate));
                        c.add(Calendar.DATE, 1);
                        enddate = sdf.format(c.getTime());


                    %>

                    <center>
                        <h3>Out Pass Report from <%=Find.getFormattedDate(dateonentry)%> till <%=Find.getFormattedDate(enddate)%></h3><br>
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

                            Department: <%=deptReq.toUpperCase()%></h4> 
                        <br>    
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

                            <%
                                Connection conn = null;
                                //Statement stmt = null;
                                try {
                                    String[] depts = new String[15];
                                    if (deptReq.equals("all")) {
                                        depts = Find.Depts;
                                    } else {
                                        depts[0] = new String(deptReq);
                                    }

                                    // Class.forName("com.mysql.jdbc.Driver").newInstance();                      
                                    conn = new dbcon().getConnection("sjitportal");

                                   // stmt = conn.createStatement();
                                    String sql;
                                    for (String dept : depts) {
                                        sql = "select a.rollno,a.reason,a.from,a.till,b.rollno,b.name from outpassform a," + dept + ".student_personal b where  (`from` >= '" + dateonentry + "' and `from` <= '" + enddate + "')  and a.rollno=b.rollno and a.status='Accepted'";
                                       PreparedStatement stmt=conn.prepareStatement(sql);
                                       
                                        ResultSet rs = stmt.executeQuery();

                            

                            %>

                            <%while (rs.next()) {

                                    Student stu = Student.getById(rs.getString("rollno"));

                                    boolean flag = false;
                                    if (username.contains("girl")) {
                                        if (stu.getSex().contains("F")) {
                                            flag = true;
                                        }
                                    } else if (!stu.getSex().contains("F")) {
                                        flag = true;
                                    }
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


                            <% }
                                }
                            %>

                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
//                                    try {
//                                       // if (stmt != null) {
//                                         //    stmt.close();
//                                       // }
//                                        if (conn != null) {
//                                            ;//conn.close();
//                                        }
//                                    } catch (SQLException ex) {
//                                        ex.printStackTrace();
//                                    }
                                }%>
                        </table>
                    </center>     
                </div></div></section>








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
                ;//connn.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("../index.jsp");
        }

    %>
</html>
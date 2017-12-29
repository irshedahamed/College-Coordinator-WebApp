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
            }

        </style>




        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                    <%                int i = 0;
                        String user = request.getParameter("choose");
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

                        if (user.equals("student") || user.equals("staff")) {%>

                    <center>
                        <h3>Entry Report from <%=Find.getFormattedDate(dateonentry)%> till <%=Find.getFormattedDate(enddate)%></h3><br>
                        <h4>Category: <%=user.toUpperCase()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
                            Department: <%=deptReq.toUpperCase()%></h4>
                        <br>    
                        <table class="bordered">
                            <thead>  <tr>   
                                    <th>S.No</th>
                                    <th>ID</th>
                                    <th>NAME</th>
                                    <th>DESIGNATION</th>
                                    <th>MOBILE NO</th>
                                    <th>DEPARTMENT</th>
                                    <th>IN TIME</th>
                                    <th>OUT TIME</th></tr></thead>

                            <%
                                Connection conn = null;
                                Statement stmt = null;
                                try {
                                    String[] depts = new String[25];
                                    if (deptReq.equals("all")) {
                                        depts = Find.Depts;
                                    } else {
                                        depts[0] = new String(deptReq);
                                    }

                                    // Class.forName("com.mysql.jdbc.Driver").newInstance();                      
                                    conn = new dbcon(clg).getConnection("portal?zeroDateTimeBehavior=convertToNull");

                                    stmt = conn.createStatement();
                                    String sql;
                                    for (String dept : depts) {
                                        if (user.equals("student")) {
                                            sql = "select a.rollno,a.intime,a.outtime,b.rollno,b.name,b.mobileno from entry a," + dept + ".student_personal b where ( (intime >= '" + dateonentry + "%' and intime <= '" + enddate + "%') or (outtime >= '" + dateonentry + "%' and outtime <= '" + enddate + "%')) and a.rollno=b.rollno";
                                        } else {
                                            sql = "select a.rollno,a.intime,a.outtime,CONCAT(b.tittle,b.name) as name,b.mobile1 as mobileno,b.desg from entry a," + dept + ".staff_general b where ( (intime >= '" + dateonentry + "%' and intime <= '" + enddate + "%') or (outtime >= '" + dateonentry + "%' and outtime <= '" + enddate + "%')) and a.rollno=b.staffid";
                                        }
                                        ResultSet rs = stmt.executeQuery(sql);

                            

                            %>

                            <%while (rs.next()) {
                            %>
                            <tr>
                                <td> <%=++i%> </td>
                                <td> <center><%=rs.getString("rollno")%></center> </td>
                            <td> <%=rs.getString("name")%> </td>

                            <%if (user.equals("student")) {%>

                            <%if (Student.getById(rs.getString("rollno")).isHostel()) { %>
                            <td><center> STUDENT HS</center> </td>
                                <%} else {
                                %>
                            <td><center> STUDENT DS</center> </td>
                                <%
                                    }
                                %>
                                <%} else {%>
                            <td><center><%=rs.getString("desg")%></center></td>
                                <%}%>


                            <td><center> <%=rs.getString("mobileno")%></center> </td>
                            <td><center> <%=dept.toUpperCase()%></center> </td>
                                <%
                                    if (rs.getString("intime") != null) {
                                        String format = rs.getString("intime").substring(0, rs.getString("intime").length() - 2);
                                        format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];
                                %>
                            <td><center> <%=format%></center> </td>
                                <%
                                } else {
                                %>
                            <td></td>
                            <%
                                }
                            %>
                            <%
                                if (rs.getString("outtime") != null) {
                                    String format = rs.getString("outtime").substring(0, rs.getString("outtime").length() - 2);
                                    format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];

                            %>
                            <td><center> <%=format%></center> </td></tr>
                                <%
                                } else {
                                %>
                            <td></td>
                            <%
                                }
                            %>


                            <%}
                            %>

                            <%}
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if (stmt != null) {
                                            stmt.close();
                                        }
                                        if (conn != null) {
                                            ;//conn.close();
                                        }
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }%>
                        </table>
                    </center>     
                    <%
                    } else {
                        Connection conn = null;
                        Statement stmt = null;
                        try {

                            // Class.forName("com.mysql.jdbc.Driver").newInstance();                      
                            conn = new dbcon(clg).getConnection("portal?zeroDateTimeBehavior=convertToNull");

                            stmt = conn.createStatement();
                            String sql;

                            sql = "select a.rollno,a.intime,a.outtime,b.name,b.sex,b.mobile,b.meet,b.reason from entry a,guest b where ( (intime >= '" + dateonentry + "%' and intime <= '" + enddate + "%') or (outtime >= '" + dateonentry + "%' and outtime <= '" + enddate + "%')) and a.rollno=b.id";
                            ResultSet rs = stmt.executeQuery(sql);


                    %>

                    <center>
                        <h3>Entry Report from <%=Find.getFormattedDate(dateonentry)%> till <%=Find.getFormattedDate(enddate)%></h3><br>
                        <h4>Category: <%=user.toUpperCase()%></h4>
                        <br>    
                        <table class="bordered">
                            <thead>   <tr>   
                                    <th>S.No</th>
                                    <th>ID</th>
                                    <th>NAME</th>
                                    <th>CATEGORY</th>
                                    <th>GENDER</th>
                                    <th>MOBILE NO</th>
                                    <th>MEET</th>
                                    <th>REASON</th>
                                    <th>IN TIME</th>
                                    <th>OUT TIME</th></tr></thead>
                                        <%while (rs.next()) {
                                        %>
                            <tr>
                                <td> <%=++i%> </td>
                                <td> <center><%=rs.getString("rollno")%></center> </td>
                            <td> <center><%=rs.getString("name")%> </center></td>


                            <td><center><%=Find.category(rs.getString("rollno"))%></center></td>



                            <td><center> <%=rs.getString("sex")%> </center></td>
                            <td><center> <%=rs.getString("mobile")%></center> </td>
                                <%
                                    String[] meet = rs.getString("meet").split("_");
                                %>
                            <td> <%=meet[meet.length - 1]%> </td>
                            <td> <%=rs.getString("reason")%> </td>
                            <%
                                if (rs.getString("intime") != null) {
                                    String format = rs.getString("intime").substring(0, rs.getString("intime").length() - 2);
                                    format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];

                            %>
                            <td> <%=format%> </td>
                            <%
                            } else {
                            %>
                            <td></td>
                            <%
                                }
                            %>
                            <%
                                if (rs.getString("outtime") != null) {
                                    String format = rs.getString("outtime").substring(0, rs.getString("outtime").length() - 2);
                                    format = Find.getFormattedDate(format.split(" ")[0]) + " " + format.split(" ")[1];

                            %>
                            <td> <%=format%> </td></tr>
                            <%
                            } else {
                            %>
                            <td></td>
                            <%
                                }
                            %>


                            <%}
                            %>

                            <%} catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    try {
                                        if (stmt != null) {
                                            stmt.close();
                                        }
                                        if (conn != null) {
                                            ;//conn.close();
                                        }
                                    } catch (SQLException ex) {
                                        ex.printStackTrace();
                                    }
                                }
                            %>
                        </table>
                    </center>    
                    <%
                        }


                    %>
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
</html>
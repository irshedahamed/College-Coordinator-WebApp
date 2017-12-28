<%-- 
    Document   : editatt
    Created on : Jul 20, 2016, 10:03:39 AM
    Author     : Lenovo
--%>

<%-- 
    Document   : UpdateAttd
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>

    <body>

        <form action="${pageContext.request.contextPath}/attinchargeedit" method="post">
            <table class="bordered">
                <thead>
                    <%
                        String date = request.getParameter("datepicker");

                    %>

                    <tr>
                        <th name="cc">Roll No</th>
                        <th>Name</th>
                        <th><%=date%>(Tick if Present)</th>
                    </tr>
                </thead>
                <%

                    Connection con = null;
                   // Statement st = null;
               //     Statement st1 = null;

                    String dept = request.getParameter("dept");
                    try {

                        String batch = request.getParameter("batch");
                        String sem = request.getParameter("sem");

                        con = new dbcon().getConnection(dept);
                 //       st = con.createStatement();
                   //     st1 = con.createStatement();
                        int count = 0;
                        String sql = "select * from overallattendence where date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, date);
                        ResultSet rs = st.executeQuery();

                        while (rs.next()) {

                            String rollno = rs.getString("rollno");
                            String date1 = String.valueOf(rs.getDate("date"));

                            //sql = ;
                            PreparedStatement st1=con.prepareStatement("select name from student_personal where rollno=? and batch=? order by name");
                            st1.setString(1, rollno);
                            st1.setString(2, batch);
                            ResultSet rs1 = st1.executeQuery();
                            if (rs1.next()) {

                                String name = rs1.getString("name");

                %>

                <tr>
                    <td><%=rollno%></td>
                    <td><%=name%></td>
                    <td>

                        <input type="checkbox" name="val<%=count%>" value="<%=rollno%>">



                    </td>

                </tr>      



                <%
                                count++;
                            }
                        }

                        session.setAttribute("count", count);
                        session.setAttribute("date", date);

                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
               //         if (st != null) {
                 //           st.close();
                   //     }
                     //   if (st1 != null) {
                       //     st1.close();
                     //   }

                        if (con != null) {
                            ;//con.close();
                        }
                    }
                %>



            </table>
            <input type="hidden" name="dept" value="<%=dept%>">
            <input type="submit" value="submit">
        </form>
    </body>
</html>

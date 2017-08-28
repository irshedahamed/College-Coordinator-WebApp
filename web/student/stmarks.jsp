<%@page import="Actor.Student"%>
<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from student_login_details where rollno='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {

    %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%        String dept = "", rollno1 = username, subname = "";

        dept = session.getAttribute("deptname").toString();

        Connection con = new dbcon().getConnection(dept);
        //Statement st1= con.createStatement();
        //ResultSet rs1 = st1.executeQuery("select batch from student_personal where rollno='"+rollno1+"'");
        //rs1.next();
        Student s1 = Student.getById(username);
        String batch = s1.getBatch();
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");

        String regulation = null;
        String subcode, rollno, name;
        Connection con1 = new dbcon().getConnection("sjitportal");
        Statement st = con1.createStatement();
        String sql = "select * from regulations where batch='" + batch + "'";
        ResultSet rs = st.executeQuery(sql);
        while (rs.next()) {
            regulation = rs.getString("regulation");
        }
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("batch", batch);

        session.setAttribute("dept", dept);
        session.setAttribute("exam", exam);

    %>
    <body>


        <table class="bordered">
            <thead>

                <tr>
                    <th name="cc">SUBJECTS</th>
                    <th>MARKS</th>
                </tr>
            </thead>

            <%            st = con.createStatement();

                String sql1 = "select * from subject_sem_table where regulation='" + regulation + "' and sem='" + sem + "' and subtype='theory' order by subcode";
                rs = st.executeQuery(sql1);

                while (rs.next()) {

                    subcode = rs.getString("subcode");
                    subname = rs.getString("subname");
                    Statement st2 = con.createStatement();
                    ResultSet rs3 = st2.executeQuery("select * from marks_table where subcode='" + subcode + "' and rollno='" + rollno1 + "'");
                    while (rs3.next()) {
                        String mark = rs3.getString(exam);


            %>
            <tr>
                <td><%=subcode%>-<%=subname%></td>
                <td><%=mark%></td>
            </tr>



            <% }
                    rs3.close();
                }
                rs.close();
            %>






        </table>


    </body>
    <%
                if (st != null) {
                    st.close();
                }

                if (con1 != null) {
                    con1.close();
                }
                if (con != null) {
                    con.close();
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

<%-- 
    Document   : updated
    Created on : Feb 3, 2016, 10:03:37 AM
    Author     : Divya Sri
--%>

<%@page import="com.action.Find"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%
            String visible = "";
            String a1 = request.getParameter("word");
            if (a1 != null) {
                if (a1.equals("yes")) {
                    visible = "hidden";
                    String formName = "";
                    formName = "test.doc";
                    File filepath = new File(formName);
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=" + filepath);
                }
            }


        %>
        <%            String batch = session.getAttribute("batch").toString();
            String sem = session.getAttribute("sem").toString();
            String subcode = session.getAttribute("subject").toString();
            String sec = session.getAttribute("sec").toString();
            String dept = session.getAttribute("dept").toString();
            String exam = session.getAttribute("exam").toString();
            try {
                String username = session.getAttribute("username").toString();
                String password = session.getAttribute("password").toString();

                Connection connn = new dbcon().getConnection(Find.sdept(username));
                Statement sttt = connn.createStatement();
                String type1 = "";
                ResultSet rsss = sttt.executeQuery("select * from staff_table where staffid='" + username + "'");
                String name = "";
                if (rsss.next()) {
                    name = rsss.getString("staffname");
                }
        %>
    <center><h1>St.Joseph's Institute of Technoogy</h1></center>
    <br>
    <br>
    <br>
    <br>

    <center><h2><%=name%> has updated the marks for Batch = <%=batch%>, Sem = <%=sem%>, Subject = <%=subcode%>, Sec = <%=sec%>, Dept = <%=dept%>, Exam =<%=exam%></h2></center>




    <%
            if (sttt != null) {
                sttt.close();
            }
            if (connn != null) {
                connn.close();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    %>
</body>
<center><div>
        <a href='updated.jsp?word=yes'>DOWNLOAD STATEMENT</a></center>
</div>
</html>

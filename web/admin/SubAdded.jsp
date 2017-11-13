<%-- 
    Document   : SubAdded
    Created on : 14 May, 2016, 8:22:08 PM
    Author     : Arun
--%>

<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
            String type = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type = rsss.getString("type");
                }
                if (type.equals("admin")) {

    %>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%String msg = request.getParameter("msg");%>
        <h1 align='center'><%=msg%>  </h1>
    <center>
        <div align="center">
            <a href="SubjectAdd.jsp"><input type='submit' value='Back'></a>
        </div>
    </div>
</div>


</center>
</section>
</body>
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

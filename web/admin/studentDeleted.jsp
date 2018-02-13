<%-- 
    Document   : studentDeleted
    Created on : 11 Oct, 2016, 9:31:13 PM
    Author     : Home
--%>
<%-- 
    Document   : StaffAdded
    Created on : 11 Jul, 2016, 9:35:09 PM
    Author     : Home
--%>

<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <%String msg = request.getParameter("msg");%>
        <h1 align='center'><%=msg%>  </h1>
    <center>
        <div align="center">
            <a href="profiledelete.jsp"><input type='submit' value='Back'></a>
        </div>
    </div>
</div>


</center>
</section>
</body>
</html>

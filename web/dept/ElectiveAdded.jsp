<%-- 
    Document   : ElectiveAdded
    Created on : 17 Jul, 2016, 4:10:15 PM
    Author     : Home
--%>

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
            <a href="SubjectSelection.jsp"><input type='submit' value='Back'></a>
        </div>
    </div>
</div>


</center>
</section>
</body>
</html>

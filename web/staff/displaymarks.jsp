<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>

<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="com.action.Find"%>
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
            ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {


    %>

    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String subcode = request.getParameter("subject");
        String s = exam.toUpperCase();
        if(exam.contains("unit")){
            s = exam.replace("unit","IAE");
        }
    %>
    <body>
    <center><h1><u>DEPARTMENT OF <%=dept.toUpperCase()%></u></h1></center>
    <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
    <center><h1><%=s.toUpperCase()%> EXAM MARK LIST</h1></center>
    <form action="${pageContext.request.contextPath}/markupdate" method="post">
        <center> <table class="bordered">
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th name="cc">Roll No</th>
                        <th>Register No </th>
                        <th>Name</th>
                        <th><%=subcode%></th>
                    </tr>
                </thead>
                <%
                    List<Student> list = Student.getAll(dept, batch, sec);
                    int p = 0;
                    Mark m = new Mark();
                    m.setSubcode(subcode);
                    m.setType(exam);
                    for (Student stu : list) {
                        m.setRollno(stu.getId());
                %>
                <tr>
                    <td><%=p + 1%></td>
                    <td><%=stu.getId()%></td>
                    <td><%=stu.getRegno()%></td>
                    <td><%=stu.getName().toUpperCase()%></td>
                    <td><%= Mark.getUserMark(dept, m).getMark()%></td>
                    <%
                            p++;
                        }
                    %>
                </tr>        
            </table></center>
    </form>
</body>
<%           } else {
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

<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>

<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="Subjects.Subjects"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Mark</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        if (dept == null) {
            dept = session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        String regulation = Batch.getRegulation(batch);
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("batch", batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept", dept);
        session.setAttribute("exam", exam);
    %>
    <body>
        <div id="yourTableIdName1">
            <center><h1><u><%=dept.toUpperCase()%> <%=sec%></u></h1></center>
            <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
            <center><h1>MARKS REPORT</h1></center>
        </div>
    <center>
        <form>
            <table class="bordered">
                <thead>
                    <tr>
                        <th name="cc">Roll No</th>
                        <th>Name</th>
                            <%
                                Subjects s = new Subjects();
                                s.setAyear(ayear);
                                s.setRegulation(regulation);
                                s.setSem(sem);
                                List<String> Subcodelist = Subjects.getTherorySubCode(dept, s);
                                for (String subcode : Subcodelist) {
                            %>
                        <th><%=subcode%></th>
                            <%
                                }
                            %>
                    </tr>
                </thead>
                <%
                    List<Student> list = Student.getAll(dept, batch, sec);
                    for (Student stu : list) {
                %>
                <tr>
                    <td><%=stu.getId()%></td>        
                    <td><%=stu.getName()%></td>
                    <%
                        for (String subcode : Subcodelist) {
                            Mark m = new Mark();
                            m.setRollno(stu.getId());
                            m.setSubcode(subcode);
                            m.setType(exam);
                    %>
                    <td><%=Mark.getUserMark(dept, m).getMark()%></td>
                    <%
                            }
                        }
                    %>
                </tr>        
            </table>
        </form>
    </center>
</body>
</html>

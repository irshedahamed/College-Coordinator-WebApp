<%-- 
    Document   : EditLabMark
    Created on : Sep 24, 2017, 11:31:02 PM
    Author     : irshed
--%>

<%@page import="Actor.Student"%>
<%@page import="Mark.Mark"%>
<%@page import="Subjects.Subjects"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="General.Batch"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
               String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");
 %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Mark</title>
    </head>
    <%        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String ayear = request.getParameter("ayear");
        
        String regulation = Batch.getRegulation(batch,clg);
        session.setAttribute("regulation", regulation);
        session.setAttribute("sem", sem);
        session.setAttribute("ayear", ayear);
        session.setAttribute("batch", batch);
        session.setAttribute("dept", dept);
        session.setAttribute("exam", exam);
    %>
    <body>
    <center><h1>Mark Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester</h1></center>
    <form action="${pageContext.request.contextPath}/LabMarkUpdate" id="marks" method="post">
        <center>
            <table class="bordered">
                <thead>
                    <tr>
                        <th name="cc">Roll No</th>
                        <th>Register No</th>
                        <th>Name</th>
                            <%
                                Subjects s = new Subjects(clg);
                                s.setAyear(ayear);
                                s.setRegulation(regulation);
                                s.setSem(sem);
                                List<String> Subcodelist = Subjects.getLabSubCode(dept, s,clg);
                                for (String subcode : Subcodelist) {
                            %>
                        <th><%=subcode%></th>
                            <% }%>
                    </tr>
                </thead>
                <%
                    List<Student> list = Student.getAll(dept, batch, "%",clg);
                    for (Student stu : list) {
                %>
                <tr>
                    <td><%=stu.getId()%></td> 
                    <td><%=stu.getRegno()%></td>
                    <td><%=stu.getName()%></td>
                    <%
                        int i = 0;
                        for (String sub : Subcodelist) {
                            Mark m = new Mark(clg);
                            m.setRollno(stu.getId());
                            m.setSubcode(sub);
                            m.setType(exam);
                            String a1 = stu.getId() + "_" + i;;
                            if (Mark.isMarkAvailable(dept, m,clg)) {
                                m = Mark.getUserMark(dept, m,clg);
                                 
                    %>
                    <td><input type="text" size="3" class="marks" maxlength="3" name="<%=a1%>" id="<%=a1%>" value="<%=m.getMark()%>"></td>
                        <%
                        } else {
                        %>
                    <td><input type="text" size="3" class="marks" maxlength="3" name="<%=a1%>" id="<%=a1%>" value="" ></td>
                        <%                    }
                                    i++;
                                }
                            }
                        %>
                </tr>        
            </table>
                <br><br>    
            <input id="submit" type="submit" value="submit">
        </center>
    </form>
</body>
</html>

<%@page import="General.AcademicYear"%>
<%@page import="com.action.Find"%>
<%@page import="java.util.List"%>
<%@page import="General.Batch"%>
<%@page import="Subjects.Subjects"%>
<%@page import="Mark.Mark"%>
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
                    String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

    %>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%        String dept = "", rollno1 = username, subname = "";

        dept = session.getAttribute("deptname").toString();

        
        //Statement st1= con.createStatement();
        //ResultSet rs1 = st1.executeQuery("select batch from student_personal where rollno='"+rollno1+"'");
        //rs1.next();
        Student s1 = Student.getById(username);
        String batch = s1.getBatch();
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");

        String regulation = null;
        String  rollno, name;
       
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

            <%          Subjects s = new Subjects(clg);
        s.setSem(sem);
        s.setAyear(Find.getAcyear(batch, sem,clg));
        s.setRegulation(Batch.getRegulation(Student.getById(username).getBatch(),clg));
        List<String> list = Subjects.getTherorySubCode(Find.sdept(username), s,clg);
        for(String subcode:list){
                    Mark m = new Mark(clg);
                    m.setSubcode(subcode);
                    m.setType(exam);
                    m.setRollno(rollno1);
            %>
            <tr>
                <td><%=subcode%>-<%=Subjects.getBySubcode(Find.sdept(username), subcode,clg).getSubname() %></td>
                <td><%= Mark.getUserMark(dept, m,clg).getMark()%></td>
            </tr>



            <%
                }
                
            %>






        </table>


    </body>
 </html>

<%-- 
    Document   : getmarks
    Created on : 04 JAN, 2018, 2:39:34 PM
    Author     : Keertheswaran
--%>


<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%@page import="Subjects.Subjects"%>
<%@page import="com.action.Find"%>
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
       %>
    <body>
    <center> <img src="../images/logo2.png" height="165px" width="700px" /></center>
    <div id="yourTableIdName1">
        <center><h2 style="font-size: 22px;">DEPARTMENT OF <%=Find.getDeptFullForm(dept).toUpperCase()%> </h2></center>
        <center><h3>Student Number</h3></center>
        <center><h3 style="">BATCH: <%=batch%> </h3>
            <table class="bordered">
                <th>S.no</th>
                <th>Rollno</th>
                <th>Register no</th>
               <th>Name</th>
                <th>Ph.no</th>
               
                <% int count=1;%>
            <% for (Student s : Student.getAll(dept, batch, sec)) {
                
                  %>
                 
                  
                  <tr> <td><%=count %></td>
                   <td><%=s.getId() %></td>
                   <td><%=s.getRegno()%></td>
                   <td><%=s.getName()%></td>
                  <td><%=s.getMobile()%></td></tr>
                      
                      
                      
                      
                      
                  
        <%
            count++;
                }
            
        %>
        </table>
    </center> 
    </div>
    <center>
       
    </center>
</body>
</html>

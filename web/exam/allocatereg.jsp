<%-- 
    Document   : allocatereg
    Created on : Aug 21, 2015, 10:41:07 AM
    Author     : Divya Sri
--%>


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
        <title>JSP Page</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection(dept);
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
      
        String subcode,rollno,name;
       
        
       
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
       
       
        %>
        <body>
        <h1>Hello World!</h1>
        <form action="${pageContext.request.contextPath}/regupdate" method="post">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        
        
        
            
        <th>Register No</th>
        
       
    </tr>
    </thead>
    
    <%
        Statement st = con.createStatement();
        String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
     ResultSet rs=st.executeQuery(sql2);
     int i=1;
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
      
         
       
        %>
      
    <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
                
        <td><input type="text" size="12" maxlength="12" name="reg<%=i%>" id="reg<%=i%>"></td>
        </tr>       

       <%
        i++;
        
     }
     
     rs.close();
     
     %>
     
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
</html>


<%@page import="Actor.Student"%>
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
    <body>
    
    <form action ="${pageContext.request.contextPath}/updatemodeltype" method="post">
        <center><h1>SELECT MODEL CATEGORY</h1></center>
        <center>
        <table class="bordered">
            <thead>
                <th>REG NO</th>
                <th>NAME</th>
                <th>SELECT CGPA Range </th>
                
        </thead>
        <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        
        
        
        session.setAttribute("dept",dept);
         session.setAttribute("batch",batch);
         session.setAttribute("sec", sec);
       
        int i =0;   
        String[] regno = new String[100];
        String[] name = new String[100];
      
        
        for(Student s:Student.getAll(dept, batch, sec))
        {
            regno[i]= s.getRegno();
            name[i] = s.getName();
        %>
       
            <tr>
               <td><%= regno[i] %> </td><td> <%= name[i] %></td>
         <td>
            <center>  
                <select name="<%=s.getId() %>">
                    <option value="<%=s.getModel_type() %>"><%=s.getModel_type() %></option>
                    <option value="0">Arrears</option>
                    <option value="8+">8.1-10</option>
                    <option value="7+">7.0-8.0</option>
                    <option value="<7">less than 7.0</option>
                    
                    
                </select>
            </center>
                </td>
            </tr>
        
        <%
        i++;
        }

      %>      
        </table>
        </center>
    <input type="submit" value="submit">
        </form>
    </body>
</html


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
        <center><h1>SELECT THE CHECKBOXES IF SPECIAL MODEL</h1></center>
        <center>
        <table class="bordered">
            <thead>
                <th>SELECT IF SM </th>
                <th>REG NO</th>
                <th>NAME</th>
        </thead>
        <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection(dept);
   
        String sem = request.getParameter("sem");
        
        session.setAttribute("dept",dept);
       
        int i =0;   
        String[] regno = new String[100];
        String[] name = new String[100];
      
        
        Statement st= con.createStatement();
        String sql="select * from student_personal where batch='"+batch+"' and sec='"+sec+"'";
        ResultSet rs= st.executeQuery(sql);
        while(rs.next())
        {
            regno[i]= rs.getString("regno");
            name[i] = rs.getString("name");
        %>
       
            <tr>
                <td>
            <center>   <input type="checkbox" name="id" value="<%= regno[i] %>"> </center>
                </td><td><%= regno[i] %> </td><td> <%= name[i] %></td>
        </tr>
        
        <%
        i++;
        }

                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
      %>      
        </table>
        </center>
    <input type="submit" value="submit">
        </form>
    </body>
</html

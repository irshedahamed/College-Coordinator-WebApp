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
    
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
      
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
        String subcode = request.getParameter("subject");
       
       
        
        String regulation=null;
        String rollno=null,name=null,regno=null;
        
        session.setAttribute("subject",subcode);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam);
        String permit = "true";
       
      
        
        int count=0;
            Connection con = new dbcon().getConnection(dept);
    Statement st=con.createStatement();
    
        
   
   if(permit.equals("true"))
   {
        %>
        <body>
        <form action="${pageContext.request.contextPath}/staffmarkupdate" method="post">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <th>Register No</th>
        <%
   
        
       
           
        
        
        
        
        
        %>
        
        
            
        <th><%=subcode%></th>
        
       
       
    </tr>
    </thead>
    
    <%
       String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' and rollno like '__c%' order by name";
    ResultSet rs=st.executeQuery(sql2);
     int i=0;
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         regno=rs.getString("regno");
         
       
        %>
      
    <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
        <td><%=regno%></td>
        <%
      
            String a1=rollno+"_"+i;
            i++;
        
        %>
        
        <td><input type="text" size="3" maxlength="3" name="<%=a1%>" id="<%=a1%>"></td>
    </tr>

       <%
       
     }
     
     rs.close();
      String sql3= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' and rollno like '__l%' order by name";
    ResultSet rs1=st.executeQuery(sql3);
     
     while(rs1.next())
     {
         rollno=rs1.getString("rollno");
         name = rs1.getString("name");
         regno=rs1.getString("regno");
         
       
        %>
      
    <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
        <td><%=regno%></td>
        <%
      
            String a1=rollno+"_"+i;
            i++;
        
        %>
        
        <td><input type="text" size="3" maxlength="3" name="<%=a1%>" id="<%=a1%>"></td>
    </tr>

       <%
       
     }
     
     rs1.close();
   }
     %>
    </tr>        
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
</html>

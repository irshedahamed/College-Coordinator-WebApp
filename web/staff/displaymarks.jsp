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
   /*try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type = rsss.getString("type");
        }
        if(type.equals("exam"))
        {
    */
    
    %>
    
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <%
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection("cse");
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
       String subcode = request.getParameter("subject");
       String examm1=exam.toUpperCase();
        
        String regulation=null;
        String rollno,name;
        
        
        Statement st = con.createStatement();
       
        int count=0;
        %>
        <body>
        <center><h1><u>DEPARTMENT OF CSE</u></h1></center>
        <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
        <center><h1><%=examm1%> EXAM MARK LIST</h1></center>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
            <center> <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
         <th><%=subcode%></th>
        
        
    </tr>
    </thead>
    
    <%
       String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
    ResultSet rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         %>
         <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
         <%
         
    
      
        String sql6 = "select * from marks_table where rollno='"+rollno+"' and subcode='"+subcode+"'";
         Statement st2 = con.createStatement();
        ResultSet rs2 = st2.executeQuery(sql6);
      
       
        if(rs2.next())
        {
        String marks= rs2.getString(exam);
       
         
        
        %>
      
    
       <td><%=marks%></td>

       <%
        }
        else
        {
            %>
            <td>   
            <%
        }
        
        rs2.close();
       }
        
     
     
     
     %>
    </tr>        
    
        
                </table></center>
    
        </form>
    </body>
   <%
  /*  }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    */
    %>
</html>

<%-- 
    Document   : getmarks
    Created on : 26 May, 2015, 2:39:34 PM
    Author     : aravind
--%>

<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        
    
    
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
        Connection con = new dbcon().getConnection(dept);
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
       String subcode = request.getParameter("subject");
       String examm1=exam.toUpperCase();
        
        String regulation=null;
        String regno,rollno,name;
        
        
        Statement st = con.createStatement();
       
        int count=0;
        %>
        <body>
        <center><h1><u>DEPARTMENT OF <%=dept.toUpperCase()%></u></h1></center>
        <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
        <center><h1><%=examm1%> EXAM MARK LIST</h1></center>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
            <center> <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Register No </th>
        <th>Name</th>
         <th><%=subcode%></th>
        
        
    </tr>
    </thead>
    
    <%
       String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
    ResultSet rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         regno=rs.getString("regno");
         %>
         <tr>
        <td><%=rollno%></td>
        <td><%=regno%></td>
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
        
} 
                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
       
        
     
     
     
     %>
    </tr>        
    
        
                </table></center>
    
        </form>
    </body>
   <%
    }
    else
    {
        response.sendRedirect("../index.jsp");
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
          
          %>
    
   
</html>

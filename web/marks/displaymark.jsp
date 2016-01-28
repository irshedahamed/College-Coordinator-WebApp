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
        if(dept==null)
        {
            dept= session.getAttribute("dept").toString();
        }
        String batch = request.getParameter("batch");
        String sec = request.getParameter("section");
        Connection con = new dbcon().getConnection("sjitportal");
   
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
       
       
        
        String regulation=null;
        String subcode,rollno,name;
        
        Statement st= con.createStatement();
        String sql="select * from regulations where batch='"+batch+"'";
        ResultSet rs= st.executeQuery(sql);
        while(rs.next())
        {
            regulation=rs.getString("regulation");
        }
        session.setAttribute("regulation",regulation);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
        session.setAttribute("sec", sec);
        session.setAttribute("dept",dept);
        session.setAttribute("exam", exam);
        rs.close();
        st.close();
        con.close();
        int count=0;
        %>
        <body>
        <h1>Hello World!</h1>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <%
       con = new dbcon().getConnection(dept);
    st=con.createStatement();
        
   
       String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
     rs=st.executeQuery(sql1);
        
        while(rs.next())
        {
           
        subcode = rs.getString("subcode");
        count++;
        
        
        
        
        %>
        
        
            
        <th><%=subcode%></th>
        
        <% }
        rs.close();
        %>
    </tr>
    </thead>
    
    <%
       String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
     rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno");
         name = rs.getString("name");
         %>
         <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
         <%
         
       String sql5 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
       Statement st1 = con.createStatement();
     ResultSet rs1=st1.executeQuery(sql5);
    
        
        while(rs1.next())
        {
           
        subcode = rs1.getString("subcode");
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
        rs1.close();
     }
     rs.close();
     
     %>
    </tr>        
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
</html>

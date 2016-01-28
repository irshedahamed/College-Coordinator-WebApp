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
        String dept = "cse",rollno1="12cs1203",subname="";
        if(dept==null)
        {
            dept= session.getAttribute("dept").toString();
        }
       
        Connection con = new dbcon().getConnection(dept);
   Statement st1= con.createStatement();
   ResultSet rs1 = st1.executeQuery("select batch from student_personal where rollno='"+rollno1+"'");
   rs1.next();
   String batch=rs1.getString("batch");
        String sem = request.getParameter("sem");
        String exam = request.getParameter("exam");
       
       
        
        String regulation=null;
        String subcode,rollno,name;
        Connection con1 = new dbcon().getConnection("sjitportal");
        Statement st= con1.createStatement();
        String sql="select * from regulations where batch='"+batch+"'";
        ResultSet rs= st.executeQuery(sql);
        while(rs.next())
        {
            regulation=rs.getString("regulation");
        }
        session.setAttribute("regulation",regulation);
        session.setAttribute("sem",sem);
        session.setAttribute("batch",batch);
       
        session.setAttribute("dept",dept);
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
        
        <%
     
    st=con.createStatement();
        
   
       String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
     rs=st.executeQuery(sql1);
        
        while(rs.next())
        {
           
        subcode = rs.getString("subcode");
        subname = rs.getString("subname");
      Statement st2=con.createStatement();
      ResultSet rs3 = st2.executeQuery("select * from marks_table where subcode='"+subcode+"' and rollno='"+rollno1+"'");
      while(rs3.next())
      {
          String mark= rs3.getString(exam);
          
      
        
        
        
        
        %>
        <tr>
        <td><%=subcode%>-<%=subname%></td>
        <td><%=mark%></td>
        </tr>
            
      
        
        <% }
      rs3.close();
        }
        rs.close();
        %>
       
    
    
           
    
        
</table>
   
        
    </body>
</html>

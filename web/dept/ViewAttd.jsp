<%-- 
    Document   : UpdateAttd
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        
        <form action="UpdatedAttendance.jsp">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
    
        <%
        
        
       
            
        String batch=request.getParameter("batch");
        String sec=request.getParameter("section");
        String sem=request.getParameter("sem");
        
        
        Connection con = new dbcon().getConnection("cse");
        Statement st=con.createStatement();
        Statement st1=con.createStatement();
        Statement st2=con.createStatement();
        
        int count =0;
        String sql="select * from student_personal where batch='"+batch+"' and dept='cse' and sec='"+sec+"' group by rollno";
        ResultSet rs=st.executeQuery(sql);
        ResultSet rs1,rs2;
        String rollno=null,name=null,subject=null;
        //String[] str1=new String[100];
        //String[] str2=new String[100];
        String sql2="select * from subject_sem_table where sem='"+sem+"'";
        rs2=st2.executeQuery(sql2);
        while(rs2.next())
        {
            %>
            <th><%=rs2.getString("subcode") %></th>
            <%
        }
        %>
    </tr>
    </thead>
            <%
        
        
        while(rs.next())
        {
           
        
        
        String rn=rs.getString(1);
        
        
        rs2.beforeFirst();
        
        rollno=rs.getString("rollno");
        name=rs.getString("name");
        %>
        <tr>
            <td><%=rollno %></td>
            <td><%=name %></td>
        <%
       while(rs2.next())
       {
           String sql1="select * from hourattendence where rollno='"+rn+"' and sem='"+sem+"'";
           rs1=st1.executeQuery(sql1);
           subject=rs2.getString("subcode");
           count=0;
           while(rs1.next())
                {
                 
            
                 
                for(int j=3;j<=12;j++)
        {
            if(rs1.getString(j)!=null && rs1.getString(j).equals(subject))
            count++; 
        }
               
        
            }
           %>
           <td><%=count %></td>
           <%
       }
            %>
        
        
        </tr>  
            
 
        
        <% 
        }
        session.setAttribute("count",count);
        rs.close();
        %>
        
         
   
    
        
</table>
        </form>
    </body>
</html>

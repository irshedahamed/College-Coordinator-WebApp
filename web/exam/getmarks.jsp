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
   try
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
       String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
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
        for(int i=0;i<count;i++)
        {
            String a1=rollno+"_"+i;
        
        %>
        
        <td><input type="text" size="3" maxlength="3" name="<%=a1%>" id="<%=a1%>"></td>

       <%
       }
     }
     rs.close();
     
                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
     %>
    </tr>        
    
        
</table>
    <input type="submit" value="submit">
        </form>
    </body>
   <%
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
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

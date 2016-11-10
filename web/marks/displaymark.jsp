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
        <style rel="stylesheet">
            /*
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
*/
/* 
    Created on : 26 May, 2015, 3:36:50 PM
    Author     : aravind
*/



table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 70%;  
    overflow-x : auto; 
}


.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}
            
        </style>
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
        String ayear=request.getParameter("ayear");
       
        
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
        <div id="yourTableIdName1">
        <center><h1><u><%=dept.toUpperCase()%> <%=sec%></u></h1></center>
        <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
        <center><h1>MARKS REPORT</h1></center>
        </div>
        <center>
        <form action="${pageContext.request.contextPath}/markupdate" method="post">
        <table class="bordered">
    <thead>

    <tr>
        <th name="cc">Roll No</th>
        <th>Name</th>
        <%
       con = new dbcon().getConnection(dept);
    st=con.createStatement();
        
   
       String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and (ayear like '%elective%"+ayear+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
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
      // String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
       String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
  
      rs=st.executeQuery(sql2);
     while(rs.next())
     {
         rollno=rs.getString("rollno").toUpperCase();
         name = rs.getString("name").toUpperCase();
         %>
         <tr>
        <td><%=rollno%></td>        
        <td><%=name%></td>
         <%
         
       String sql5 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and (ayear like '%elective%"+ayear+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
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

                            if(st!=null)
                            st.close();
                              if(con!=null)
                                con.close();
     
     %>
    </tr>        
    
        
</table>
        </form>
        </center>
    </body>
</html>

<%-- 
    Document   : verificationReportDisplay
    Created on : 13 Oct, 2016, 7:48:15 PM
    Author     : Home
--%>


<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
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
    padding: 4px;
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

h2{
    font-size: 18px;
    margin: 0px;
    padding: 0px;
}
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    
    <body>
        <%
            String dept = request.getParameter("dept");
              
           String sec = request.getParameter("sec");
               String batch=request.getParameter("batch");
        
        %>
         <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
      <center><h2>Department Of <%=dept.toUpperCase()%></h2></center>

      <center>
             <h2>Batch :<%=batch%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;Section <%=sec%> </h2>
           </center>
   
        <form action="${pageContext.request.contextPath}/attinchargeedit" method="post">
      <center>  <table class="bordered">
    <thead>
  
    <tr>
        
        <th> Sno</th>
        <th name="cc">Roll No</th>
        <th>Register No</th>
        <th>Name</th>
        <th>Father Name<br>Mobile<br>(E-Mail)</th>
        <th>Mother Name<br>Mobile<br>(E-Mail)</th>
        <th>Signature</th>
  
    </tr>
    </thead>
        <%
        
        Connection con=null;
        Statement st=null;
        Statement st1=null;
        Statement st2=null;
        
        
	try{
            
       
      
       
        
         con = new dbcon().getConnection(dept);
        
         st1=con.createStatement();
         st2=con.createStatement();
         
        int count =0;
        
     
        int sno=1;
     
           
       
       
        String sql="select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
        ResultSet rs1=st1.executeQuery(sql);
        while(rs1.next())
        {    
            
         String rollno=rs1.getString("rollno");   
        String name=rs1.getString("name");
        String regno=rs1.getString("regno");
        
        ResultSet rs2;
        String mommail="",dadmail="",fname="",fmobile="",mname="",mmobile="";
         rs2=st2.executeQuery("select f.fathers_name,f.mobile,m.mothers_name,m.mobileno,f.mailid as dadmail,m.mailid as mommail from student_father_details f,student_mother_details m where f.rollno='"+rollno+"' and m.rollno='"+rollno+"'");
         if(rs2.next()){
         fname=rs2.getString("fathers_name");
         fmobile=rs2.getString("mobile");
         mname=rs2.getString("mothers_name");
         mmobile=rs2.getString("mobileno");
         mommail=rs2.getString("mommail");
          dadmail=rs2.getString("dadmail");
         }
        
        %>
        
        <tr>
            <td><%=sno++%></td>
            <td><%=rollno.toUpperCase() %></td>
            <td><%=regno %></td>
            
            <td><%=name.toUpperCase() %></td>

           <td><%=fname.toUpperCase()%><br><%=fmobile%><br>(<%=dadmail %>)</td>
           <td><%=mname.toUpperCase()%><br><%=mmobile%><br>(<%=mommail%>)</td>         
           <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>      
            
 
        
        <% 


}


        
    
       
        
}catch(Exception e){
e.printStackTrace();
}finally{
                            if(st2!=null)
                            st2.close();
                            if(st1!=null)
                            st1.close();
        
                            if(con!=null)
                                con.close();
}       
%>
   
    
        
</table></center>
<input type="hidden" name="dept" value="<%=dept%>">
    
        </form>
    </body>
</html>

<%-- 
    Document   : DailyReport
    Created on : 25 Sep, 2016, 2:40:41 PM
    Author     : Home
--%>

<%-- 
    Document   : editatt
    Created on : Jul 20, 2016, 10:03:39 AM
    Author     : Lenovo
--%>

<%-- 
    Document   : UpdateAttd
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    
    <body>
        <%
            String dept = request.getParameter("dept");
              String date=request.getParameter("datepicker");
           String sem = request.getParameter("sem");
               String batch=request.getParameter("batch");
        
        %>
         <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
      <center><h2>Department Of <%=dept.toUpperCase()%></h2></center>

      <center><h2 >Daily Attendance Report</h2>
             <h2>Batch :<%=batch%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;</h2>
            <h2>Semester: <%=sem%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: <%=date%></h2></center>
   
        <form action="${pageContext.request.contextPath}/attinchargeedit" method="post">
      <center>  <table class="bordered">
    <thead>
  
    <tr>
        
        <th> Sno</th>
        <th name="cc">Roll No</th>
        <th>Register No</th>
        <th>Name</th>
        <th>No Of Days Leave</th>
        <th>Reason</th>
        <th>Father Name<br>(Mobile)</th>
        <th>Mother Name<br>(Mobile)</th>
  
    </tr>
    </thead>
        <%
        
        Connection con=null;
        Statement st=null;
        Statement st1=null;
        Statement st2=null;
        
        
	try{
            
       
      
       
        
         con = new dbcon().getConnection(dept);
         st=con.createStatement();
         st1=con.createStatement();
         st2=con.createStatement();
         
        int count =0;
        
        String sql="select * from overallattendence where date='"+date+"' and sem='"+sem+"'";
        ResultSet rs=st.executeQuery(sql);
        int sno=1;
        while(rs.next())
        {
           
        String rollno=rs.getString("rollno");
        String reason=rs.getString("reason");
       // String date1=String.valueOf(rs.getDate("date"));
        
        sql="select * from student_personal where rollno='"+rollno+"' and batch='"+batch+"' order by name";
        ResultSet rs1=st1.executeQuery(sql);
        if(rs1.next())
        {    
            
            
        String name=rs1.getString("name");
        String regno=rs1.getString("regno");
        ResultSet rs2=st2.executeQuery("select count(*) as days from overallattendence where rollno='"+rollno+"' and sem='"+sem+"'");
        String days="0";
        if(rs2.next())
        days=String.valueOf(rs2.getInt("days")-1);
        
        String fname="",fmobile="",mname="",mmobile="";
         rs2=st2.executeQuery("select f.fathers_name,f.mobile,m.mothers_name,m.mobileno from student_father_details f,student_mother_details m where f.rollno='"+rollno+"' and m.rollno='"+rollno+"'");
         if(rs2.next()){
         fname=rs2.getString("fathers_name");
         fmobile=rs2.getString("mobile");
         mname=rs2.getString("mothers_name");
         mmobile=rs2.getString("mobileno");
         }
        
        %>
        
        <tr>
            <td><%=sno++%></td>
            <td><%=rollno.toUpperCase() %></td>
            <td><%=regno %></td>
            
            <td><%=name.toUpperCase() %></td>
           <td><%=days%></td>
           <td><%=reason%></td>
           <td><%=fname.toUpperCase()%><br>(<%=fmobile%>)</td>
           <td><%=mname.toUpperCase()%><br>(<%=mmobile%>)</td>         
        </tr>      
            
 
        
        <% 
count++; 

}
}
if(st2!=null)
    st2.close();
        
        session.setAttribute("count",count);
        session.setAttribute("date",date);
        
}catch(Exception e){
e.printStackTrace();
}finally{
                            if(st!=null)
                            st.close();
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

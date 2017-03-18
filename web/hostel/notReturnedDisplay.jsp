

<%@page import="General.Hostel"%>
<%@page import="com.action.Find"%>
<%@page import="Forms.OutPass"%>
<%@page import="Actor.Student"%>
<%-- 
    Document   : SendGeneralSMS
    Created on : 20 Oct, 2016, 12:40:45 PM
    Author     : Home
--%>

<%-- 
    Document   : SendMarkSMS
    Created on : 19 Oct, 2016, 8:11:20 PM
    Author     : Home
--%>
<%@page import="Actor.Parent"%>
<%-- 
    Document   : SendSMS
    Created on : Jul 21, 2016, 2:52:23 PM
    Author     : Lenovo
--%>
<%-- 
    Document   : editatt
    Created on : Jul 20, 2016, 10:03:39 AM
    Author     : Lenovo
--%>


<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/sky-forms.css" rel="stylesheet">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	
        
        <title>JSP Page</title>
           <script type="text/javascript" src="../js/jquery.js"></script>
  
<center>
    <img src="../images/logo2.png" height="165px" width="700px" />	</center>
        
    </head>
    
      
    <body>
  <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

    <%String date=request.getParameter("date");%>
              <center> 
                  <h4>NOT REPORTED HOSTEL STUDENTS ON <%=Find.getFormattedDate(date) %></h4>
                  <form action="#" class="" method="post">
    <br><br><br>
      
    
            <table class="bordered">
    <thead>
       

    <tr>
       
        <th>Rollno</th>
        <th >Name</th>
        <th>Left On</th>
        <th>Return By</th>
        <th>Parent Number</th>
        
    </tr>
    </thead>
        <%
        
   
        String username = session.getAttribute("username").toString();
    
         String department=request.getParameter("dept");
	
      
        
           String sql="";
       String[] depts=new String[15]; 
       if(department.equals("all"))
           depts=Find.Depts;
       else
           depts[0]=new String(department);
       
        for(String dept:depts){
        for(String s:General.Entry.getUnreportedList(date))
        {    
            Student stu=Student.getById(s);
            String rollno=stu.getId();
            String regno=null;
               regno=stu.getRegno();
            
            String name=stu.getName();
            
            String phone;
            phone=Parent.getNumber(rollno);
            OutPass o=OutPass.getbyIdReturnDate(rollno,date);
                    
                    if(Find.sdept(stu.getId()).equals(dept)&&Hostel.AuthenticateAccess(username, stu)){
                        
                    String num=Parent.getNumber(rollno);
        %>
        
        <tr>
            
            <td id="rollno<%=rollno%>"><%=rollno%></td>
            
         
            <td id="name<%=rollno%>"><%=name %></td>
           
            <td id="from<%=rollno%>"><%=Find.getFormattedDate(o.getFrom())%></td>
            <td id="till<%=rollno%>"><%=Find.getFormattedDate(o.getTill()) %></td>
               
            <td>
                        
               <div id="parent<%=rollno%>" class="send"><%=num%></div>
                            
                            
                        
                        </td>
                    
        </tr>      
            
 
        
        <% 
 }
}

        
}
        
     
%>
   
    
        
</table>
<br><br>   
       <br><br> 
        </form></center>
   
                </div></div></section>
    </body>
    
</html>

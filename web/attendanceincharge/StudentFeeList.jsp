<%-- 
    Document   : StudentFeeList
    Created on : 16 Jan, 2017, 10:02:13 PM
    Author     : Home
--%>

<%@page import="Fee.SpecialFee"%>
<%@page import="General.AcademicYear"%>
<%@page import="Fee.BasicFee"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
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
     
     
         <script type="text/javascript" src="../js/checkall.js"></script>
         
         <script>
             $(document).ready(function(){
                 
                 $(".amount").on("change keydown",function(){
                     console.log($(this).parent().parent().attr("id"));
                     console.log($(this).parent().parent().find("#placement").val());
                     $(this).parent().parent().css('background','red');
                     
                 });
             });
             
         </script>
    </head>
    
      
    <body>
  <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

              <center><h1>Confirm List </h1></center>
    <center> <form action="#" class="" method="post">
    <br><br><br>
            <table class="bordered">
    <thead>
     
    <tr>
        <th>Register Number</th>
        <th >Roll No</th>
        <th>Name</th>
        <th>Tution</th>
        <th>Transport</th>
        <th>Placement</th>
        <th>Hostel</th>
        <th>Save</th>
    </tr>
    </thead>
        <%
         String dept = request.getParameter("dept");
          String username = session.getAttribute("username").toString();
          String batch=Batch.getByYrIncharge(username).getBatch();  
          List<Student> list=Student.getAll(dept, batch, "_");
            
        List<BasicFee> fee=BasicFee.getByBatch(batch);
       String cyear=AcademicYear.getCurrentYear().getYear();
        for(Student s:list){
            SpecialFee sfee=SpecialFee.getFee(s.getId(), cyear);
            if(sfee==null){
                BasicFee bf=BasicFee.getByType(fee, "Government");
    
%>
   
        <tr id="<%=s.getId()%>" >
           <td><%=s.getRegno() %></td> 
           <td><%=s.getId() %></td>
           <td><%=s.getName()%></td>
           <td><input type="text" class="amount" value="<%=bf.getTution() %>" id="tution" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=bf.getTransport()%>" id="transport" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=bf.getPlacement()%>" id="placement" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=bf.getHostel()%>" id="hostel" style="background:white"></td>
           <td><input type="button" value="Update" id="submit"></td>
        </tr>      
            
 
        <% }else{
%>
        <tr id="<%=s.getId()%>">
           <td><%=s.getRegno() %></td> 
           <td><%=s.getId() %></td>
           <td><%=s.getName()%></td>
          <td><input type="text" class="amount" value="<%=sfee.getTution() %>" id="tution" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=sfee.getTransport()%>" id="transport" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=sfee.getPlacement()%>" id="placement" style="background:white"></td>
           <td><input type="text" class="amount" value="<%=sfee.getHostel()%>" id="hostel" style="background:white"></td>
           <td><input type="button" value="Update" id="submit"></td>
        </tr>      
        <%

}

}
        %>
       
     
     
      
    
        
</table>
<input type="hidden" name="dept" value="<%=dept%>">
<br><br>   
<input type="submit" id="submit" value="submit">
       <br><br> 
        </form></center>
   
                </div></div></section>
    </body>
    
</html>

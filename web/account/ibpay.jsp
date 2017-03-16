<%-- 
    Document   : ibpay
    Created on : 9 Mar, 2017, 12:13:22 PM
    Author     : Irshed
--%>


<%@page import="Actor.Student"%>
<%@page import="Fee.IBResponse"%>
<%@page import="Fee.MUResponse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link href="../css/sky-forms.css" rel="stylesheet">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="css/tabledesign.css" rel="stylesheet">
        <title>JSP Page</title>
        
    </head>
    
    <body>
  <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
        <center><h1>Payment List </h1></center>
       <center> 
    <br><br><br>
            <table class="bordered">
    <thead>
     
    <tr>
        
        <th >Roll No</th>
        <th>Register Number</th>
        
        <th>Mup No</th>
        <th>Name</th>
        <th>Amount</th>
        <th>Date</th>
         </tr>
    </thead>
    <%
        
        String Acyear = (String) request.getAttribute("Acyear");
        String Batch = (String) request.getAttribute("Batch");
        String Dept = (String) request.getAttribute("Dept");
               
         ArrayList<MUResponse> List = (ArrayList<MUResponse>) MUResponse.fetchby(Acyear);
           for(MUResponse m : List)
         {
             String s = m.getRefno();
             IBResponse i = IBResponse.fetchby(s);
             String p = i.getMup();
             
             if(p!=null)
             {
                 
             String r = m.getRollno();
             
             
             Student stu = Student.getById(r);
             if(Batch.equals(stu.getBatch()) && ((Dept.equals(stu.getDept()) || Dept.equals("%")) ))
             {
    %>
            
    <tr>
        <td> <%= r %> </td>
        <td><%= stu.getRegno() %></td>
        <td><%= m.getRefno() %></td>
        <td><%= stu.getName() %></td>
        <td><%= m.getTotalamt() %></td>
        <td><%= i.getTxndate() %></td>
        
    </tr>
    <%
        }

    }

}
        
        %>
            </table>
       </center>
          </div></div></section>
    </body>
</html>

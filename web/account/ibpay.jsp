<%-- 
    Document   : ibpay
    Created on : 9 Mar, 2017, 12:13:22 PM
    Author     : Irshed
--%>


<%@page import="java.util.Map"%>
<%@page import="Actor.Student"%>
<%@page import="Fee.IBResponse"%>
<%@page import="Fee.MUResponse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        	<link href="css/bootstrap.min.css" rel="stylesheet">
   <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="css/tabledesign.css" rel="stylesheet">
        <title>JSP Page</title>
        
    </head>
    
    <center>
    <img src="images/logo2.png" height="165px" width="700px" />	</center>	

    <body>
  <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
        <center><h1>PAYMENT LIST INDIAN BANK </h1></center>
       <center> 
    <br><br><br>
            <table class="bordered">
    <thead>
     
    <tr>
        <th>S No</th>
        <th >Roll No</th>
        <th>Register Number</th>
        
        <th>Mup No</th>
        <th>Name</th>
        <th>Amount</th>
        <th>Date</th>
         </tr>
    </thead>
    <%
                    String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

        String Acyear = (String) request.getAttribute("Acyear");
        String Batch = (String) request.getAttribute("Batch");
        String Dept = (String) request.getAttribute("Dept");
        String From = (String) request.getAttribute("From");
        String To = (String) request.getAttribute("To");
        
       int sno=0;        
         ArrayList<MUResponse> List = (ArrayList<MUResponse>) MUResponse.fetchby(Acyear,clg);
           for(Map.Entry<MUResponse,IBResponse> entry : IBResponse.fetchby(List, From, To,clg).entrySet())
         {   
             MUResponse m=entry.getKey();
             IBResponse i=entry.getValue();
             Student stu = Student.getById(m.getRollno());
             if(Batch.equals(stu.getBatch()) && ((Dept.equals(stu.getDept()) || Dept.equals("%")) ))
             {
    %>
            
    <tr>
         <td><%= ++sno %></td>
        <td> <%= m.getRollno() %> </td>
        <td><%= stu.getRegno() %></td>
        <td><%= m.getRefno() %></td>
        <td><%= stu.getName() %></td>
        <td><%= (Float.valueOf(m.getTotalamt())+Float.valueOf(m.getBankchrge())) %></td>
        <td><%= i.getTxndate() %></td>
        
    </tr>
    <%
        

    }

}
    %>
            </table>
       </center>
          </div></div></section>
    </body>
</html>

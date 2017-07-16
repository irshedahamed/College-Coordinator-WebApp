<%-- 
    Document   : Techprocess
    Created on : 13 Mar, 2017, 11:45:08 AM
    Author     : Irshed
--%>

<%@page import="Actor.Student"%>
<%@page import="Fee.TechProcessResponse"%>
<%@page import="Fee.MUResponse"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="css/tabledesign.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
   
	
		

		</head>
    </head>
    <center>
    <img src="images/logo2.png" height="165px" width="700px" />	</center>	

    <body>
     <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
        <center><h1>PAYMENT LIST OTHER BANK </h1></center>
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
        
        String Acyear = (String) request.getAttribute("Acyear");
        String Batch = (String) request.getAttribute("Batch");
        String Dept = (String) request.getAttribute("Dept");
        String From = (String) request.getAttribute("From");
        String To = (String) request.getAttribute("To");
        
        int sno=0;
         ArrayList<MUResponse> List = (ArrayList<MUResponse>) MUResponse.fetchby(Acyear);
           for(TechProcessResponse i : TechProcessResponse.fetchby(List,From,To))
         {
             
             String p = i.getRefno();
              if(p!=null)
             {
                 
             String r = i.getRollno();
                          
             Student stu = Student.getById(r);
             if(Batch.equals(stu.getBatch()) && (Dept.equals(stu.getDept()) || Dept.equals("%") ))
             {
    %>
            
    <tr>
        <td><%= ++sno %></td>
        <td> <%= i.getRollno() %> </td>
        <td><%= stu.getRegno() %></td>
        <td><%= i.getRefno() %></td>
        <td><%= stu.getName() %></td>
        <td><%= i.getAmount() %></td>
        <td><%= i.getTime() %></td>
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

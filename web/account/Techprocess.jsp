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
	<link href="../css/bootstrap.min.css" rel="stylesheet">
         <link href="../css/sky-forms.css" rel="stylesheet">
          <link href="css/tabledesign.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    
	
		

		</head>
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
             TechProcessResponse i = TechProcessResponse.fetchby(s);
             String p = i.getRefno();
              if(p!=null)
             {
                 
             String r = m.getRollno();
                          
             Student stu = Student.getById(r);
             if(Batch.equals(stu.getBatch()) && (Dept.equals(stu.getDept()) || Dept.equals("%") ))
             {
    %>
            
    <tr>
        <td> <%= r %> </td>
        <td><%= stu.getRegno() %></td>
        <td><%= m.getRefno() %></td>
        <td><%= stu.getName() %></td>
        <td><%= m.getTotalamt() %></td>
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

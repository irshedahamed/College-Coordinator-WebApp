<%@page import="Actor.Student"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
   
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
        if(type.equals("admin")||type.equals("dataentry"))
        {
    
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
         <link href="../css/sky-forms.css" rel="stylesheet">
          <link href="../css/tabledesign.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    
	
		
		</head>
<center>
    <img src="../images/logo2.png" height="165px" width="700px" />	</center>	
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
</div>
    <style rel="stylesheet">
        .bordered td{
            padding: 0px;
        }
        
    </style>
		
	

<%
String rollno=request.getParameter("rollno");
Student s=Student.getById(rollno);
%>
<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            
            <h3>  Student Details</h3><br>
Roll No :<%=s.getId().toUpperCase() %><br>
Name :<%=s.getName().toUpperCase() %><br>
Dept :<%=s.getDept().toUpperCase() %><br>
Address :<%=s.getContact().getDoorno() %>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getStreet() %>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getArea() %>
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=s.getContact().getCity() %>
<br>
Blood Group :<%=s.getBloodgrp() %><br>
D.O.B :<%=s.getGeneral().getDob() %><br>
Boarding point :<%=s.getGeneral().getBoarding() %><br>
E-mail :<%=s.getMailid() %><br>
Mobile :<%=s.getMobile() %><br>
<h3>Father's Details</h3><br>
Name :<%=s.getFatherDetails().getFathername().toUpperCase() %><br>
Occupation :<%=s.getFatherDetails().getOccupation()%><br>
Address :<%=s.getFatherDetails().getAddress() %><br>
E- Mail :<%=s.getFatherDetails().getMail() %><br>
Mobile :<%=s.getFatherDetails().getMobile() %><br>
<h3>Mother's Details</h3><br>
Name :<%=s.getMotherDetails().getMothername().toUpperCase() %><br>
Occupation :<%=s.getMotherDetails().getOccupation() %><br>
Address :<%=s.getMotherDetails().getAddress() %><br>
E- Mail :<%=s.getMotherDetails().getMail() %><br>
Mobile :<%=s.getMotherDetails().getMobile() %><br>
<br><br><br>
<div style="position: absolute">Signature of Student</div> <div align="center" style="position: absolute;margin-left: 35%;">Signature of Father</div> <div align="right" style="position: absolute;margin-left: 70%;">Signature of Mother</div>

        </div></div></section>








<script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    <script>
    $("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
     $("#menu-toggle1").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("toggled");
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
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
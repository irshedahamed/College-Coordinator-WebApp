<%-- 
    Document   : grantBulkOutPass
    Created on : 14 Jun, 2017, 10:58:44 PM
    Author     : Irshed
--%>
<%@page import="General.Hostel"%>
<%@page import="Actor.Student"%>
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
        if(type.equals("hostel"))
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
    
	
		
<center>
    <img src="../images/logo2.png" height="165px" width="700px" />	</center>
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
		        
	
		
	
    <style rel="stylesheet">
        .bordered td{
            padding: 0px;
            text-align: center;
        }
        .bordered th{
            text-align: center;
            
        }
        
    </style>
    
   
    <%
    String dept = request.getParameter("dept");
    String batch = request.getParameter("batch");
    String from = request.getParameter("from");
    String till = request.getParameter("till");
    String reason = request.getParameter("reason");
    %>
    <center>
    
      <h3>BULK OUTPASS </h3><br>
   <h4>Category: <%=username.toUpperCase()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Department: <%=dept.toUpperCase()%></h4> <br>
        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            
          <section class="landing">
        <form class="skyform" action="${pageContext.request.contextPath}/processBulkOutPass" method="post">
            <fieldset>
 <table class="bordered">
      <input type="hidden" name="status" value="Accepted"> 
      <input type="hidden" name="from" value="<%=from %>"> 
        <input type="hidden" name="till" value="<%=till %>"> 
        <input type="hidden" name="reason" value="<%=reason %>"> 
                                                                                                
                                <thead>
                                <tr>   
                                <th>S.No</th>
                                <th>ROLL NO</th>
                                <th>NAME</th>
                                <th>FATHER</th>
                                <th>MOTHER</th>
                                <th>LOCAL GUARDIAN 1</th>
                                <th>LOCAL GUARDIAN 2</th>
                                <th>OUT PASS</th></tr></thead>
                                <% 
                                    List<Student> newlist = new ArrayList<Student>();
                                List<Student> list = Student.getAllHostel(dept, batch, "%");
                                for(Student s : list)
                                {
                                     boolean flag=Hostel.AuthenticateAccess(username, s);
                 
                                     if(flag){
                                         newlist.add(s);
                                     }
                                }
                                int i = 0;
                                
                                for(Student stu : newlist){
                                %>
  
                                <tr>
                                    <td><%= ++i %></td>
                                    <td><%= stu.getId() %></td>
                                    <td>
                                        <img src="../../StudentPhotos/Batch<%=stu.getBatch() %>/<%=stu.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                        <br><%= stu.getName() %>
                                    </td>
                                    <td>
                                        <img src="../../Father/Batch<%=stu.getBatch() %>/<%=stu.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                        <br><%= stu.getFatherDetails().getFathername() %>
                                    </td>
                                    <td>
                                         <img src="../../Mother/Batch<%=stu.getBatch() %>/<%=stu.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                         <br><%= stu.getMotherDetails().getMothername() %>
                                    </td>
                                    <td>
                                        <img src="../../LocalGuardian1/Batch<%=stu.getBatch() %>/<%=stu.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                        <br><%= stu.getLocalGuardian().getName() %>
                                    </td>
                                    <td>
                                         <img src="../../LocalGuardian2/Batch<%=stu.getBatch() %>/<%=stu.getId().toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                                         
                                            </td>
                                            <td>
                                                <input class="check" type="checkbox" name="outpass"  value="<%=stu.getId()%>"/>
                                                <label>Generate Outpass</label>
                                            </td>
                                    
                                </tr>
        
                                <%  } %>        
        
        
        
        
 </table><br><br>
        
 
                                <input align="center"  type="submit" id="submit" value="Accepted" />
 
        <br><br><br>
            </fieldset> 
        </form>  
          </section></div></div></section>
                               <footer id="page-footer">
		<div class="container clearfix">
			<div class="copy"></div>
			<nav id="footer-nav">
                            			<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>
				
    			</nav>
		</div>
	</footer>
                               
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


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>   
    
    
    
    
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
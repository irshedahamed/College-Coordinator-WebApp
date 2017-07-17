<%-- 
    Document   : localguardiandisplay
    Created on : 22 Jun, 2017, 6:04:45 PM
    Author     : Praveen
--%>

<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="com.action.Base"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
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

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        	     <link rel="stylesheet" href="../css/main.css">
     
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
 <script src="../js/jquery.js"></script>
         
     



<link rel="stylesheet" href="../css/angular-material.css">

<link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">


<link rel="stylesheet" href="../css/angulartab.css">

<script src="../js/angular.js"> </script>
<script src="../js/angular-animate.min.js"></script>
<script src="../js/angular-route.min.js"></script>
<script src="../js/angular-aria.min.js"></script>
<script src="../js/angular-message.min.js"></script>
<script src="../js/svg-assert-cache.js"></script>
<script src="../js/angular-material.js"></script>
<script src="../js/angulartab.js"></script>
         
     
	
		
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">

		        
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                           

						
						

						
						

						<nav id="main-nav">
                                                    
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>

    

<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="RoomNoChange.jsp">ROOM CHANGE</a>
  

<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="HostelProfile.jsp">HostelStudentDetails</a>

   <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="requests.jsp">Grant OutPass</a>
  
</li>


<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="Setup.jsp">Holiday Setup</a>
<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">LOCAL GUARDIAN2</a>
            <ul class="sub-menu">
         
 <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="local_guradian2.jsp">Add Detais</a>

                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="localguardiandisplay.jsp">View Details</a>
            </ul>            
</li>            
            
<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#"> Report</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="monthlyReport.jsp">Monthly Report</a>
      <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="notReturnedReport.jsp">Not Returned Report</a>

</ul></li>
            </ul>
        </li>




</ul>						
                                                </nav>
					</div>
				</div>
			</div>
		</header>
   

<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
    <center>
<link href="../css/tabledesign.css" rel="stylesheet">

<center><h1>LOCAL GUARDIAN2 DETAILS</h1></center>
<table class="bordered">            

   
            <tr>
<th><center>ROLL NO</center></th>
<th><center>NAME</center></th>
<th><center>PHONE NO</center></th>
<th><center>DOOR NO</center></th>
<th><center>STREET</center></th>
<th><center>AREA</center></th>
<th><center>CITY</center></th>
<th><center>PINCODE</center></th>
<th><center>EDIT</center></th>
</tr>
    
            <%
              Connection con = new dbcon().getConnection("sjitportal");
                Statement st = con.createStatement();
               String sql = "select * from localguardian";
            ResultSet rs = st.executeQuery(sql);
            while(rs.next())
            {
                String rollno=rs.getString("rollno");
                String name=rs.getString("name");
                String phoneno=rs.getString("phoneno");
                String doorno=rs.getString("doorno");
                String street=rs.getString("street");
                String area=rs.getString("area");
                String city=rs.getString("city");
                String pincode=rs.getString("pincode");


%>
                 
                 
                <tr>
             <td><%=rollno%></td>
             <td><%=name%></td>
             <td><%=phoneno%></td>
             <td><%=doorno%></td>
             <td><%=street%></td>
             <td><%=area%></td>
             <td><%=city%></td>
             <td><%=pincode%></td>
            <td><input type="button" name="Edit" value="Edit" style="background-color:green;font-weight:bold;color:white;" onClick="javascript:window.location='upd.jsp'" ></td>


                </tr>
             
             <% } %>
            
            </table>
            </center>

</section>
     		


						<footer id="footer-widgets">
			<div class="container clearfix">
								Powered by St.Joseph's
							</div>
		</footer>
			<!-- #page-container -->
			</div>
			

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






    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>

    <!-- Menu Toggle Script -->
    


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>
<%
    }
        else
    {
        response.sendRedirect("../index.jsp");
    }
    }

                            if(sttt!=null)
                            sttt.close();
                              if(connn!=null)
                                connn.close();
    else
    {
        response.sendRedirect("../index.jsp");
    }
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>        
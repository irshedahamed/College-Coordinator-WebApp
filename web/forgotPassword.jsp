<%-- 
    Document   : forgotPassword
    Created on : 5 Mar, 2017, 9:40:08 PM
    Author     : Home
--%>

<%@page import="Actor.Staff"%>
<%@page import="Actor.Parent"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/sky-forms.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/simple-sidebar.css" rel="stylesheet">
	
		
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
		        
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="images/sjit.png"  height="70px"></a>
						</div>
                                            

						
		
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            <center>
                
                 <%
                     String user=request.getParameter("Username");
                 String number=null;
                 Student s=Student.getById(user);
                 if(s!=null)
                 number=Parent.getNumber(s.getId()).substring(0, 7);
                 else{
                 Staff st=Staff.getByid(user);
                 if(st!=null)
                     number=st.getMobile().substring(0, 7);
                 else
                     number="User Not Found";
                 }
                 %>
            <form action="${pageContext.request.contextPath}/SendPasswordSMS" class="sky-form" method="post">
                <header>FORGOT PASSWORD</header>
    <fieldset>					
					<section>
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Username: </b></div>
                <label class="input">
                    
                    <input type="text"  disabled value="<%=user %>">
           <input type="hidden"  name="user" value="<%=user %>">
                <i></i>
                    </label>
            </label>
                 <br><br>
                 <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Mobile Number: </b></div>
                <label class="input">
                    
                    <input type="text" id="mobile" name="mobile" value="<%=number%>">
           
                <i></i>
                    </label>
            </label>
                 <br><br> 
                 <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
                                        </section>
    </fieldset>
                
            
            </form></center>



</div></div></section>

</section>
						<footer id="footer-widgets">
			<div class="container clearfix">
								Powered by St.Joseph's
							</div>
		</footer>
			<!-- #page-container -->
			</div>
			</div>

	<footer id="page-footer">
		<div class="container clearfix">
			
			
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="credits.html">Credits</a></li>
</ul>			</nav>
		</div>
	</footer>





<script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

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


<script type="text/javascript" defer src="wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html>
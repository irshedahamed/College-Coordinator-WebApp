<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<html lang="en-US">
     <% 
   try
    {
    String username = session.getAttribute("username").toString();
    String password = session.getAttribute("password").toString();
    
    Connection connn = new dbcon().getConnection("login");
    Statement sttt = connn.createStatement();
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head> 
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/tablecs.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
	
		
		</head>
		
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
<div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">
                       Aravind S
                    </a>
                </li>
                <center>
                    <img src="../images/face.jpg" height="95px">
                    
                               
                           
                        
                   
                </center>
                <br>
                <br>
                
                <li>
                    <a href="#"><b>NAME : Aravind S</b></a>
                </li>
                <li>
                    <a href="#"><b>ROLL NO : 12CS1203</b></a>
                </li>
                <li >
                    <a href="#"><b>COURSE : B.E</b></a>
                </li>
                <li >
                    <a href="#"><b>DEPT : CSE</b></a>
                </li>
              <li >
                    <a href="#"><b>SECTION : A</b></a>
                </li>
            </ul>
        </div>

    
	
		
		<header id="page-header"  class="fixed-header">
		
			<div id="page-header-inner">

				<div id="header-container">
					<div class="container clearfix">
						<div id="main-logo">
							<a href="#">
								<img src="../images/sjit.png"  height="70px"></a>
						</div>
                                            <ul id="auth-nav">
							<li>
								<div class="auth-nav-register">
									<a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
								</div>
							</li>
						</ul>

						
						

						
						

						 <nav id="main-nav">
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	

        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Attendance</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="HourAttd.jsp">Update Attendance</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="SubjectWise.jsp">View Attendance</a>
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="">Marks</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="markupdate.jsp">Update Marks</a></li>
	

        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksview.jsp">View Marks</a></li>
    </ul>
</li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesdownload.jsp">View Notes</a></li>
	</ul></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>




</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PERSONAL DETAILS</b></font><br><br><br>
            <TABLE WIDTH=30% align ="center" border="1">
<%
    
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/project?user=root&password=root");
              Statement statement = connection.createStatement();
              ResultSet rs= statement.executeQuery("select * from personal where rollno="+"'"+username+"'");
              String rollno="", name="", dept="", addr="", mobileno="", eid="";

              while(rs.next())
              {
                  rollno=rs.getString("rollno");
				   name=rs.getString("name");
				   dept=rs.getString("dept");
                  addr=rs.getString("addr");            
                  mobileno=rs.getString("mobileno");
                  eid=rs.getString("eid");
		  %> 
               
         
          <TR CLASS="defaultText odd-row">
               <TD><b>rollno</b></TD>
               <TD><%= rollno %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Name</b></TD>
               <TD><%= name %></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><b>Department</b></TD>
               <TD><%= dept %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Contact address</b></TD>
               <TD><%= addr %></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><b>Mobile No.</b></TD>
               <TD><%= mobileno %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Mail ID</b></TD>
               <TD><%= eid %></TD>
           </TR>
           </center>
		
           <%
               }
           %>
           </TABLE> <br>
</center>
</div>
</div>


<div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>UG DETAILS</b></font><br><br><br>
             <TABLE WIDTH=30% align ="center" border="1"><br>
		    <%
              ResultSet rs2= statement.executeQuery("select * from q where rollno="+"'"+username+"'");
              String dr="", yr="", course="", cgpa="", clg="",university="";

              while(rs2.next())
              {
                   rollno=rs2.getString("rollno");
			      dr=rs2.getString("dr");
                   yr=rs2.getString("yr");				   
                  course=rs2.getString("course");              
                  cgpa=rs2.getString("cgpa");
                  clg=rs2.getString("clg");
                  university=rs2.getString("university"); 
		  %>   
         <center> 
                
          <TR CLASS="defaultText odd-row">
              <TD><b>Degree</b></TD>
               <TD><%= dr %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Year of PAssing</b></TD>
               <TD><%= yr %></TD>
           </TR>		   
		   <TR CLASS="defaultText odd-row">
               <TD><b>Course</b></TD>
               <TD><%= course %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>CGPA</b></TD>
               <TD><%= cgpa %></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><b>College</b></TD>
               <TD><%= clg %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>University</b></TD>
               <TD><%= university %></TD>
           </TR>
           </center>
          
		
           <%
               }
              %></table><br></center></div></div>
       <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PG DETAILS</b></font><br><br><br>
                   <TABLE WIDTH=30% align ="center" border="1"><br>
	   <%
              ResultSet rs3= statement.executeQuery("select * from q1 where rollno="+"'"+username+"'");
              String dr1="", yr1="", course1="", cgpa1="", clg1="", university1="";

              while(rs3.next())
              {
                  rollno=rs3.getString("rollno");
			      dr1=rs3.getString("dr1");
                  yr1=rs3.getString("yr1");				   
                  course1=rs3.getString("course1");              
                  cgpa1=rs3.getString("cgpa1");
                  clg1=rs3.getString("clg1");
                  university1=rs3.getString("university1"); 
		  %>   
         
                  <center> 
                      
          <TR CLASS="defaultText odd-row">
               <TD><b>Degree</b></TD>
               <TD><%= dr1 %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD> <b>Year of Passing</b></TD>
               <TD><%= yr1 %></TD>
           </TR>		   
		   <TR CLASS="defaultText odd-row">
               <TD><b>Course</b></TD>
               <TD><%= course1 %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>CGPA</b></TD>
               <TD><%= cgpa1 %></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><b>College</b></TD>
               <TD><%= clg1 %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>University</b></TD>
               <TD><%= university1 %></TD>
           </TR>
          
		
           <%
               }
           %></TABLE></center></div></div>
           <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>Ph.D DETAILS</b></font><br><br><br>
                   <%
              ResultSet rs4= statement.executeQuery("select * from q2 where rollno="+"'"+username+"'");
              String dr2="", yr2="", university2="", tt="";

              while(rs4.next())
              {
                  rollno=rs4.getString("rollno");
			      dr2=rs4.getString("dr2");
                  yr2=rs4.getString("yr2");				                                                 
                  university2=rs4.getString("university2"); 
				  tt=rs4.getString("tt"); 
		  %>   
        
                   <center> 
                           <TABLE>
          <TR CLASS="defaultText odd-row">
               <TD><b>Degree</b></TD>
               <TD><%= dr2 %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b> Year of Ph.D Awarded</b></TD>
               <TD><%= yr2 %></TD>
           </TR>		   		   
		   <TR CLASS="defaultText odd-row">
               <TD><b>University</b></TD>
               <TD><%= university2 %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Thesis Topic</b></TD>
               <TD><%= tt %></TD>
           </TR>
           </center>
		</TABLE>
           <%
               }
           %></center></div></div>
</div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li></ul></div>
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
			<div class="copy">© All rights reserved, IncredibleBytes, 2014</div>
			<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
</ul>			</nav>
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
        ilass("toggled");
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
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>
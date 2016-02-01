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
    ResultSet rsss = sttt.executeQuery("select * from student_login_details where rollno='"+username+"' and password='"+password+"'");
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
                
                <%
                    String name1 = session.getAttribute("name1").toString();
                    String rollno1 = session.getAttribute("rollno1").toString();
                    String course1 = session.getAttribute("course1").toString();
                    String sec1 = session.getAttribute("sec1").toString();
                    
                    
                    %>
                
                <li >
                
                    
                    <a href="#"><b>NAME : <%=name1%></b></a>
                </li>
                <li>
                    <a href="#"><b>ROLL NO : <%=rollno1%></b></a>
                </li>
                <li >
                    <a href="#"><b>COURSE : <%=course1%></b></a>
                </li>
                <li >
                    <a href="#"><b>DEPT : CSE</b></a>
                </li>
              <li >
                    <a href="#"><b>SECTION : <%=sec1%></b></a>
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-768"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">Contact Details</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="courses/index.html">Attendance</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="ViewAttd.jsp">Hour Attendance</a>
	
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Circular</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="circular.jsp">General Circular</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="examcircular.jsp">Exam Circular</a>
	
</li>
</ul>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Fee</a>

<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Forms</a>

</li>
</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
        <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PERSONAL DETAILS</b></font></center><br><br>
<%
    try {
      
  String departmentname= session.getAttribute("deptname").toString();
             Connection connection = new dbcon().getConnection(departmentname);
              Statement statement = connection.createStatement();
              ResultSet rs= statement.executeQuery("select * from student_personal where rollno='12cs1203'");
              String rollno="", regno="", initial="", name="", course="", sec="", dept="",gender="",food="",mobileno="", mailid="",bldgrp="",batch="",accomodation="";

              while(rs.next())
              {
                  rollno=rs.getString("rollno");
                  regno=rs.getString("regno");
		  name=rs.getString("name");
		  
                  course=rs.getString("course");              
                  sec=rs.getString("sec");
                  dept=rs.getString("dept");
                  gender=rs.getString("gender"); 
                  food=rs.getString("food");
                  mobileno=rs.getString("mobileno");
                  mailid=rs.getString("mailid");
                  bldgrp=rs.getString("bloodgrp");
                  batch=rs.getString("batch");
		accomodation=rs.getString("accomodation");
              }
		  %>   
                  <center> <br>
         <TABLE WIDTH=30% align ="center" border="1">
            
            
          <TR CLASS="defaultText odd-row">
              <TD><font size="3px"><b>Roll No</b></TD>
               <TD><font size="3px"><%=rollno%></font></TD>
           </TR>
		   
		   
		   <TR CLASS="defaultText">
                       <TD><font size="3px"><b>Name </b></font></TD>
               <TD><font size="3px"><%= name %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
                       <TD><font size="3px"><b>Gender</b></font></TD>
               <TD><font size="3px"><%= gender %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
                       <TD><font size="3px"><b>Blood Group</b></font></TD>
               <TD><font size="3px"><%= bldgrp %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Batch</b></font></TD>
               <TD><font size="3px"><%= batch %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Course</b></font></TD>
               <TD><font size="3px"><%= course %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Department</b></font></TD>
               <TD><font size="3px"><%= dept %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Section</b></font></TD>
               <TD><font size="3px"><%= sec %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Mobile No.</b></font></TD>
               <TD><font size="3px"><%= mobileno %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Mail ID</b></font></TD>
               <TD><font size="3px"><%= mailid %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>food</b></font></TD>
               <TD><font size="3px"><%= food %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Accomodation</b></font></TD>
               <TD><font size="3px"><%= accomodation %></font></TD>
           </TR>
           
		
           
           </TABLE>
</center>
</div>
</div>


<div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>GENERAL DETAILS</b></font><br><br><br>
		   <%
         ResultSet rs1= statement.executeQuery("select * from student_general where rollno='12cs1203'");
              String dob="", caste="", community="", religion="",nationality="",mothertongue="",memberof="";
			  int annualincome=0;

              while(rs1.next())
              {
                                rollno=rs1.getString("rollno");
                               
                                dob=rs1.getString("dob");
                                caste=rs1.getString("caste");
                                community=rs1.getString("community");
                                annualincome=rs1.getInt("parents_annual_income");
                                religion=rs1.getString("religion");
                                nationality=rs1.getString("nationality");
                                mothertongue=rs1.getString("mother_tongue");
                                memberof=rs1.getString("club_member");
		  %>   
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="3px"><b>Date of Birth</b></font></TD>
                      <TD><font size="3px"><%= dob %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="3px"><b>Caste</b></font></TD>
                      <TD><font size="3px"><%= caste %></font></TD>
             </TR>
             <TR class="defaultText odd-row">
                      <TD><font size="3px"><b>Community</b></font></TD>
                      <TD><font size="3px"><%= community %></font></TD>
             </TR>
             <TR class="defaultText ">
                      <TD><font size="3px"><b>Parents Annual Income</b></font></TD>
                      <TD><font size="3px"><%= annualincome %></font></TD>
             </TR>
             <TR class="defaultText odd-row">
                      <TD><font size="3px"><b>Religion</b></font></TD>
                      <TD><font size="3px"><%= religion %></font></TD>
             </TR>
             <TR class="defaultText ">
                      <TD><font size="3px"><b>Nationality</b></font></TD>
                      <TD><font size="3px"><%= nationality %></font></TD>
             </TR>
             <TR class="defaultText odd-row">
                      <TD><font size="3px"><b>Mother Tongue</b></font></TD>
                      <TD><font size="3px"><%= mothertongue %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="3px"><b>Member of( NSS/ YRC/NCC/Others)</b></font></TD>
                      <TD><font size="3px"><%= memberof %></font></TD>
             </TR>
		   
           <%
               }
           %>
       </TABLE><br></center></div></div>
       <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>FATHER DETAILS</b></font><br><br><br>
	   <%
              ResultSet rs11= statement.executeQuery("select * from student_father_details where rollno='12cs1203'");
              String fname="", fqual="",foccu="",faddress="",fdesig="",fmail="",fland="",fccode="",fstdcode="",fmobile="";

              while(rs11.next())
              {
                                 rollno=rs11.getString("rollno");
                            
                                 fname=rs11.getString("fathers_name");
                                 fland=rs11.getString("landline");
                                 fmobile=rs11.getString("mobile");              
                                 faddress=rs11.getString("address");
				 fqual=rs11.getString("qualification");
				 foccu=rs11.getString("occupation");
				 fdesig=rs11.getString("designation");
				 fmail=rs11.getString("mailid");
				 fccode=rs11.getString("country_code");
				 fstdcode=rs11.getString("std_code");
				 			
			}
                  
		  %>   
         <TABLE WIDTH=30% align ="center" border="1">
          <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Father's Name</b></font></TD>
               <TD><font size="3px"><%= fname %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Qualification</b></font></TD>
               <TD><font size="3px"><%= fqual %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Occupation</b></font></TD>
               <TD><font size="3px"><%= foccu %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Designation</b></font></TD>
               <TD><font size="3px"><%= fdesig %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Address </b></font></TD>
               <TD><font size="3px"><%= faddress %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Land Line</b> </font></TD>
               <TD><font size="3px"><%= fland %></font></TD>
           </TR>
           <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Mobile</b> </font></TD>
               <TD><font size="3px"><%= fmobile %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Mail ID</b></font></TD>
               <TD><font size="3px"><%= fmail %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Country Code</b></font></TD>
               <TD><font size="3px"><%= fccode %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>STD Code</b></font></TD>
               <TD><font size="3px"><%= fstdcode %></font></TD>
           </TR>
         </TABLE></center></div></div>
           <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>MOTHER DETAILS</b></font><br><br><br>
                    <%
              ResultSet rs12= statement.executeQuery("select * from student_mother_details where rollno='12cs1203'");
              String mname="", mqual="",moccu="",maddress="",mdesig="",mmail="",mland="",mccode="",mstdcode="",mmobile="";

              while(rs12.next())
              {
                                 rollno=rs12.getString("rollno");
                                 
                                 mname=rs12.getString("mothers_name");
                                 mland=rs12.getString("landline");
                                 mmobile=rs12.getString("mobileno");              
                                 maddress=rs12.getString("address");
				 mqual=rs12.getString("qualification");
				 moccu=rs12.getString("occupation");
				 mdesig=rs12.getString("designation");
				 mmail=rs12.getString("mailid");
				 mccode=rs12.getString("country_code");
				 mstdcode=rs12.getString("std_code");
				 			
			}
    
                  
		  %>   
         <TABLE WIDTH=30% align ="center" border="1">
          <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Mother's Name</b></font></TD>
               <TD><font size="3px"><%= mname %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Qualification</b></font></TD>
               <TD><font size="3px"><%= mqual %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Occupation</b></font></TD>
               <TD><font size="3px"><%= moccu %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Designation</b></font></TD>
               <TD><font size="3px"><%= mdesig %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Address </b></font></TD>
               <TD><font size="3px"><%= maddress %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Land Line </b></font></TD>
               <TD><font size="3px"><%= mland %></font></TD>
           </TR>
           <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Mobile</b></font> </TD>
               <TD><font size="3px"><%= mmobile %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>Mail ID</b></font></TD>
               <TD><font size="3px"><%= mmail %></font></TD>
           </TR>
		   <TR CLASS="defaultText odd-row">
               <TD><font size="3px"><b>Country Code</b></font></TD>
               <TD><font size="3px"><%= mccode %></font></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><font size="3px"><b>STD Code</b></font></TD>
               <TD><font size="3px"><%= mstdcode %></font></TD>
           </TR>
         </TABLE>
               <%}catch(Exception e)
            {
                System.out.println(e);
            }
%></center></div></div>
</div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li></ul></div>
</div></div></section>


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
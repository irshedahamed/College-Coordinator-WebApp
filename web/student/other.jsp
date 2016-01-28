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
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Circular</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="circular.jsp">General Circular</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="examcircular.jsp">Exam Circular</a>
	
</li>
</ul><li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>
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
<div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>ADMISSION DETAILS</b></font><br><br>
 <% username="12cs1203";
              String departmentname= session.getAttribute("deptname").toString();
              Connection connection = new dbcon().getConnection(departmentname);
              Statement statement = connection.createStatement();
         ResultSet rs5= statement.executeQuery("select * from student_admission_details where rollno="+"'"+username+"'");
              String  doa="", admall="", govt_mang="",ovrallrank="",cmtyrank="",sprtsad="", moi="", gamename="" ,rollno,regno;
              try
              {

              while(rs5.next())
              {
                  rollno=rs5.getString("rollno");
                  regno=rs5.getString("regno");
                  doa=rs5.getString("doa");
                  admall=rs5.getString("adminallotment");
				  govt_mang=rs5.getString("govt_mang");
				 
				  ovrallrank=rs5.getString("overallrank");
				  cmtyrank=rs5.getString("community_rank");
				  sprtsad=rs5.getString("sports_admin");
				  moi=rs5.getString("MOI");
				  gamename=rs5.getString("gamename");
				                    
									
		  %>   
		  
                  
  
                    
                        <center><br>
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b> Date of admission</b></font></TD>
                      <TD><font size="2px"><%= doa %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Admission allotment</b></font></TD>
                      <TD><font size="2px"><%= admall %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Government/management</b></font></TD>
                      <TD><font size="2px"><%= govt_mang %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Overall Rank</b></font></TD>
                      <TD><font size="2px"><%= ovrallrank %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Community rank</b></font></TD>
                      <TD><font size="2px"><%= cmtyrank %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Sports Admission</b></font></TD>
                      <TD><font size="2px"><%= sprtsad %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Game Name</b></font></TD>
                      <TD><font size="2px"><%= gamename %></font></TD>
             </TR><TR class="defaultText">
                      <TD><font size="2px"><b>Medium of Instruction</b></font></TD>
                      <TD><font size="2px"><%= moi %></font></TD>
             </TR>
						 
           <%
               }
           %>
       </TABLE>
</center>
</div>
</div>


<div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>OTHERS DETAILS</b></font><br><br><br>
		   <%
         ResultSet rs4= statement.executeQuery("select * from student_other_details where rollno="+"'"+username+"'");
              String tfoi="", instname="", readmitted="", trto="", inst="", ccit="",present_status="",rfd="" ;
              int yor=0,yop=0;

              while(rs4.next())
              {
                  rollno=rs4.getString("rollno");
                  regno=rs4.getString("regno");
                  tfoi=rs4.getString("transfer_from_other_inst");
                  instname=rs4.getString("instname");
				  readmitted=rs4.getString("readmitted_student");
				  trto=rs4.getString("transfer_request_to_otherinst");
				  inst=rs4.getString("inst_name");
				  ccit=rs4.getString("course_completed_in_time");
				  present_status=rs4.getString("present_status");
				  rfd=rs4.getString("reason_for_discontinuation");
				  yor=rs4.getInt("yoreadmission");
				  yop=rs4.getInt("yopassing");
				                   
		  %>   
                  
  
                  <center><br>
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Transferred from other Institution</b></font> </TD>
                      <TD><font size="2px"><%= tfoi %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Institution Name</b></font></TD>
                      <TD><font size="2px"><%= instname %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Readmitted Student </b></font></TD>
                      <TD><font size="2px"><%= readmitted %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>year of Readmission</b></font></TD>
                      <TD><font size="2px"><%= yor %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Transfer Reaquest to other Institution</b></font></TD>
                      <TD><font size="2px"><%= trto %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Institution Name</b></font></TD>
                      <TD><font size="2px"><%= inst %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Course completed in time</b></font></TD>
                      <TD><font size="2px"><%= ccit %></font></TD>
             </TR><TR class="defaultText">
                      <TD><font size="2px"><b>Present Status </b></font></TD>
                      <TD><font size="2px"><%= present_status %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Year of Passing </b></font></TD>
                      <TD><font size="2px"><%= yop %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Reason for discontinuation</b></font></TD>
                      <TD><font size="2px"><%= rfd %></font></TD>
             </TR>
			 
           <%
               }
           %>
         </TABLE><br></center></div></div>
       <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>ACADEMIC DETAILS</b></font><br><br><br>
	   <%
         ResultSet rs13= statement.executeQuery("select * from student_academic_details where rollno="+"'"+username+"'");
              String  tenscl="",twlscl="",dipcoll="",ugcoll="",pgcoll="";
			  float tenmrks=0,twlmrks=0,dipmrks=0,ugmrks=0, pgmrks=0 ;

              while(rs13.next())
              {
                  rollno=rs13.getString("rollno");
                  regno=rs13.getString("regno");
                  tenscl=rs13.getString("tenscl");
                  tenmrks=rs13.getFloat("itenmrks");
				  twlscl=rs13.getString("twlscl");
                  twlmrks=rs13.getFloat("twlmrks");
				  dipcoll=rs13.getString("dipcoll");
                  dipmrks=rs13.getFloat("dipmrks");
				  ugcoll=rs13.getString("ugcoll");
                  ugmrks=rs13.getFloat("ugmrks");
				  pgcoll=rs13.getString("pgcoll");
                  pgmrks=rs13.getFloat("pgmrks");
				  				
		  %>   
		  
  
                    <center><br>
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Tenth School</b></font></TD>
                      <TD><font size="2px"><%= tenscl %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Tenth Percentage</b></font></TD>
                      <TD><font size="2px"><%= tenmrks %></font></TD>
             </TR>
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Twelfth School</b></font></TD>
                      <TD><font size="2px"><%= twlscl %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Twelfth Percentage</b></font></TD>
                      <TD><font size="2px"><%= twlmrks %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Diploma College</b></font></TD>
                      <TD><font size="2px"><%= dipcoll %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>Diploma Percentage</b></font></TD>
                      <TD><font size="2px"><%= dipmrks %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>UG College</b></font></TD>
                      <TD><font size="2px"><%= ugcoll %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>UG Percentage</b></font></TD>
                      <TD><font size="2px"><%= ugmrks %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>PG College</b></font></TD>
                      <TD><font size="2px"><%= pgcoll %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>PG Percentage</b></font></TD>
                      <TD><font size="2px"><%= pgmrks %></font></TD>
             </TR>
						 
           <%
               }
           %>
       </TABLE></center></div></div>
           <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PASSPORT DETAILS</b></font><br><br><br>
                    <%
         ResultSet rs8= statement.executeQuery("select * from student_passport_details where rollnno="+"'"+username+"'");
              String  forgn="",passno="", doexp="" ;

              while(rs8.next())
              {
                  rollno=rs8.getString("rollnno");
                  regno=rs8.getString("regno");
                  doexp=rs8.getString("doe");
                  forgn=rs8.getString("forgn");
				  passno=rs8.getString("passno");
				  									
		  %>   
                  <br>
                  <center> <br>
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b> Foreign student</b></font></TD>
                      <TD><font size="2px"><%= forgn %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Passport No.</b></font></TD>
                      <TD><font size="2px"><%= passno %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Date of Expiry</b></font></TD>
                      <TD><font size="2px"><%= doexp %></font></TD>
             </TR>
			  
           <%
               }
           %>
       </TABLE></center></div></div>
       <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>VISA DETAILS</b></font><br><br><br>
                   <%
         ResultSet rs6= statement.executeQuery("select * from student_visa_details where rollnno="+"'"+username+"'");
              String visano="",typeofvisa="", doe="" ;

              while(rs6.next())
              {
                  rollno=rs6.getString("rollnno");
                  regno=rs6.getString("regno");
                  doe=rs6.getString("doe");
                  visano=rs6.getString("visano");
				  typeofvisa=rs6.getString("typeofvisa");
				  									
		  %> <br>
                  <center><br>		  
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>VISA No.</b><font></TD>
                      <TD><font size="2px"><%= visano %><font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Type of visa</b><font></TD>
                      <TD><font size="2px"><%= typeofvisa %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Date of expiry</b><font></TD>
                      <TD><font size="2px"><%= doe %></font></TD>
             </TR>
			  
           <%
               }
              }catch(Exception e)
              {
                  System.out.println(e);
              }
           %>
       </TABLE></center><br></div></div>
</div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li></ul></div>
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
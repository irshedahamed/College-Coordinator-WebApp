<%@page import="com.action.Find"%>
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
		
                	
                
                <%
        Connection conection = new dbcon().getConnection(Find.sdept(username));
    Statement st1 = conection.createStatement();
    String batch="",name="",rollno="",course="",sec="";
   
    ResultSet rs1 = st1.executeQuery("select * from student_personal where rollno='"+username+"'");
    if(rs1.next())
    {
        name= rs1.getString("name");
        rollno = rs1.getString("rollno");
        course = rs1.getString("course");
        sec = rs1.getString("sec");
        batch= rs1.getString("batch");
        
    }
      if(st1!=null)
                            st1.close();
                              if(conection!=null)
                                conection.close();
        
        
        
        %>
        
        
<body class="home page page-id-115 page-template-default has-toolbar">
<div id="wrapper" class="toggled">
<div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">
                      
                    </a>
                </li>
                <center>
                    
                        <img src="../../StudentPhotos/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />
                               
                           
                            
                           
                        
                   
                </center>
                <br>
                <br>
                
                <li >
                
                    
                    <a href="#"><b>NAME : <%=name%></b></a>
                </li>
                <li>
                    <a href="#"><b>ROLL NO : <%=rollno%></b></a>
                </li>
                <li >
                    <a href="#"><b>COURSE : <%=course%></b></a>
                </li>
                <li >
                    <a href="#"><b>DEPT : <%=Find.sdept(username)%></b></a>
                </li>
              <li >
                    <a href="#"><b>SECTION : <%=sec%></b></a>
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">General Details</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>
	
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Fee</a>

<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="forms.jsp">Forms</a>

</li>

</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
<center><font size="5px"><b>GENERAL DETAILS</b></font><br><br>
<%
    
	       String departmentname= session.getAttribute("deptname").toString();
             Connection connection = new dbcon().getConnection(departmentname);
              Statement statement = connection.createStatement();
              ResultSet rs= statement.executeQuery("select * from student_personal where rollno="+"'"+username+"'");
              String accomodation=null;
              while(rs.next())
              {
                   accomodation=rs.getString("accomodation");
              }
	    if(accomodation.equalsIgnoreCase("Dayscholar"))
		  {
         ResultSet rs10= statement.executeQuery("select * from student_contact_details where rollno="+"'"+username+"'");
              String  doorno="",streetno="",area="",city="",district="",country="",state="",pin="" ;

              while(rs10.next())
              {
                  rollno=rs10.getString("rollno");
                  
                  doorno=rs10.getString("Doorno");
                  streetno=rs10.getString("street");
				  area=rs10.getString("area");
				  city=rs10.getString("city");
				  district=rs10.getString("district");
				  country=rs10.getString("country");
				  state=rs10.getString("state");
				  pin=rs10.getString("pincode");
			}	  				
		  %> 
       <div class="dm3-tab"><div class="dm3-tab-inner"><Br>		  
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Door No.</b></font></TD>
                      <TD><font size="2px"><%= doorno %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Street Name</b></font></TD>
                      <TD><font size="2px"><%= streetno %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Area</b></font></TD>
                      <TD><font size="2px"><%= area %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>City</b></font></TD>
                      <TD><font size="2px"><%= city %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>District</b></font></TD>
                      <TD><font size="2px"><%= district %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>State</b></font></TD>
                      <TD><font size="2px"><%= state %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Country</b></font></TD>
                      <TD><font size="2px"><%= country %></font></TD>
             </TR><TR class="defaultText">
                      <TD><font size="2px"><b>Pin Code</b></font></TD>
                      <TD><font size="2px"><%= pin %></font></TD>
             </TR>
         </TABLE>	</div></div></center>		 
           <%
               }
			   else
               { 
           
		   ResultSet rs10= statement.executeQuery("select * from student_contact_details where rollno="+"'"+username+"'");
              String  doorno="",streetno="",area="",city="",district="",country="",state="",pin="" ;

              while(rs10.next())
              {
                  rollno=rs10.getString("rollno");
                  
                  doorno=rs10.getString("doorno");
                  streetno=rs10.getString("street");
				  area=rs10.getString("area");
				  city=rs10.getString("city");
				  district=rs10.getString("district");
				  country=rs10.getString("country");
				  state=rs10.getString("state");
				  pin=rs10.getString("pincode");
			}  if(statement!=null)
                            statement.close();
                              if(connection!=null)
                                connection.close();	  				
		  %> 
          <div class="dm3-tab"><div class="dm3-tab-inner">
                   
         <TABLE WIDTH=30% align ="center" border="1">
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Roll No.</b></font></TD>
                      <TD><font size="2px"><%= username %></font></TD>
             </TR>
             
             <TR class="defaultText">
                      <TD><font size="2px"><b>Name</b></font></TD>
                      <TD><font size="2px"><%= name %></font></TD>
             </TR>
             <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Door No.</b></font></TD>
                      <TD><font size="2px"><%= doorno %></font></TD>
             </TR>
             <TR class="defaultText">
                      <TD><font size="2px"><b>Street Name</b></font></TD>
                      <TD><font size="2px"><%= streetno %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                             <TD><font size="2px"><b>Area</b></font></TD>
                      <TD><font size="2px"><%= area %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>City</b></font></TD>
                      <TD><font size="2px"><%= city %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>District</b></font></TD>
                      <TD><font size="2px"><%= district %></font></TD>
             </TR>
			 <TR class="defaultText">
                      <TD><font size="2px"><b>State</b></font></TD>
                      <TD><font size="2px"><%= state %></font></TD>
             </TR>
			 <TR class="defaultText odd-row">
                      <TD><font size="2px"><b>Country</b></font></TD>
                      <TD><font size="2px"><%= country %></font></TD>
             </TR><TR class="defaultText">
                      <TD><font size="2px"><b>Pin Code</b></font></TD>
                      <TD><font size="2px"><%= pin %></font></TD>
             </TR>
			</TABLE>
</center>
</div>
</div>
             <% } %>



       
           
</div>
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
			<div class="copy"></div>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>			</nav>
		</div>
	</footer>



<script src="../js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../js/bootstrap.min.js"></script>    <script src="../js/mobileToggle.js"></script>

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
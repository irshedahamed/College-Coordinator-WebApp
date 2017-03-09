<%-- 
    Document   : education
    Created on : 12 Jul, 2016, 9:53:02 PM
    Author     : Home
--%>
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
    
    <% 
    Connection con=new dbcon().getConnection(Find.sdept(username));
    Statement stmtd=con.createStatement();
    ResultSet rsd=stmtd.executeQuery("select * from staff_general where staffid='"+username+"'");
    if(rsd.next())
    {
    %>
    <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">
                       
                    </a>
                </li>
                <center>
                    <img src="../images/face.jpg" height="95px">
                    
                               
                           
                        
                   
                </center>
                <br>
                <br>
                
                <li >
                
                    <center>
                    <a href="#"><b><%=rsd.getString("tittle")+rsd.getString("name")%></b></a>
                    </center>
                    </li>
                <li>
                    <center>
                    <a href="#"><b><%=username%></b></a>
                    </center>
                    </li>
                <li >
                <center>
                    <a href="#"><b><%=rsd.getString("desg")%></b></a>
                </center>
                </li>
                <li >
                <center>
                    <a href="#"><b><%=Find.sdept(username).toUpperCase()%></b></a>
                </center>
                </li>
            </ul>
        </div>
		        
	<%}
        if(stmtd!=null)
            stmtd.close();
        if(con!=null)
            con.close();
        %>
		
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="general.jsp">General Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="education.jsp">Education Details</a></li>
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="experience.jsp">Experience Details</a></li>
	

    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Log Book</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Update Attendance</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="#">Syllabus Coverage</a>
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Marks</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="markupdate.jsp">Update Marks</a></li>
	

        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksview.jsp">View Marks</a></li>
    </ul>
</li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesdownload.jsp">View Notes</a></li>
	</ul></li>
    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="displayform.jsp">Forms</a>

</li>



</ul>						</nav>
					</div>
				</div>
			</div>
		</header>

<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

<div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">

<%
    
              Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection connection = new dbcon().getConnection(Find.sdept(username));
              Statement statement = connection.createStatement();
              ResultSet rs= statement.executeQuery("select * from staff_edu where staffid="+"'"+username+"'");
              String category=null,nod=null,spl=null,yop=null,college=null,university=null,gpa=null,pclass=null;
              String filename="";
              while(rs.next())
              {
                  category=rs.getString("category");
                  nod=rs.getString("nod");
                  spl=rs.getString("spl");
                  yop=rs.getString("yop");
                  college=rs.getString("college");
                  university=rs.getString("university");
                  gpa=rs.getString("gpa");
                  pclass=rs.getString("pclass");
                  filename=rs.getString("filename");
                  
                  %> 
               
         
<div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>ACADEMIC DETAILS</b></font><br><br><br>
            <TABLE WIDTH=30% align ="center" border="1">
          <TR CLASS="defaultText odd-row">
               <TD><b>Category</b></TD>
               <TD><%= category %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Name Of Degree</b></TD>
               <TD><%= nod %></TD>
           </TR>
	<TR CLASS="defaultText odd-row">
               <TD><b>Specialization</b></TD>
               <TD><%= spl %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Year Of Passing</b></TD>
               <TD><%= yop %></TD>
           </TR>	   
           <TR CLASS="defaultText odd-row">
               <TD><b>College/School</b></TD>
               <TD><%= college %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>University</b></TD>
               <TD><%= university %></TD>
           </TR>
           <TR CLASS="defaultText odd-row">
               <TD><b>CGPA/Percentage</b></TD>
               <TD><%= gpa %></TD>
           </TR>
		   <TR CLASS="defaultText">
               <TD><b>Class</b></TD>
               <TD><%= pclass %></TD>
           </TR>
           		   <TR CLASS="defaultText">
                               <TD colspan="2"><center><a href="../StaffEduDownload?staffid=<%=username%>&filename=<%= filename %>">Download Certificate</a></center></TD>
           </TR>

		           </TABLE> <br>
</center>
</div>
</div>

           <%
               }
           %>



           
      
           
          </div><ul class="dm3-tabs-nav">
              <%
              rs.beforeFirst();
              int a=1;
              while(rs.next())
              {
              %>
              <li><a href="#"><%=a%></a></li>
          <%
              a++;
          }
          %>
          </ul></div>
</div></div></section>

           	
           <%
               
                        if(statement!=null)
                            statement.close();
                              if(connection!=null)
                                connection.close();
           %>

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
			<div class="copy"></div>
			<!--<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>-->
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="../credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="../index.jsp">Logout</a></li>

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
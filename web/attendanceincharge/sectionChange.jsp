<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
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
    String type1 ="";
    ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='"+username+"' and password='"+password+"'");
    if(rsss.isBeforeFirst())
    {
        while(rsss.next())
        {
            type1 = rsss.getString("type");
        }
        if(type1.equals("yearincharge"))
        {
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<link href="../css/tabledesign.css" rel="stylesheet">
    <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
	
    <title>Section Change</title>
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

    


     


<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Attendance Report</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="attendancereport.jsp">Semester Report</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="DailyReportQuery.jsp">Daily Report</a>
</ul></li>




<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Update Attendance</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updateattendance.jsp">Mark Absentees</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="editattendance.jsp">Edit</a>
</ul></li>

   <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="requests.jsp">Grant OutPass</a>
  
</li>

    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="sms.jsp">SMS</a>


<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Fee</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BasicFee.jsp">Basic Fee</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SpecialFee.jsp">Individual Fee</a>
</ul></li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Student Update</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812  "><a href="sectionUpdate.jsp">Section</a>
                   
</ul></li>


</ul>						</nav>
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

            
                        <center><form action="../SectionUpdate" class="sky-form" method="post" target="_blank">
    <fieldset>					
					<section>
                                            
           <table class="bordered">
               <thead>
               <th>Roll number</th>
               <th>Name</th>
               <th>Current Section</th>
               <th>New Section</th>
               </thead>
               
               <tbody>
                    <%
                        String dept=request.getParameter("dept");
                        String batch=request.getParameter("batch");
                        Connection con = new dbcon().getConnection(dept);
                    Statement stmt = con.createStatement();
                    ResultSet rs=stmt.executeQuery("select name,rollno,sec from student_personal where batch like '"+batch+"'");
                    //String batch=null;
                    rs.beforeFirst();
                    while(rs.next())
                    {
                       // batch=rs.getString("batch");
                %>
                <tr><td><%=rs.getString("rollno")%></td>
                <td><%=rs.getString("name")%></td>
                <td><%=rs.getString("sec")%></td>
                <td>
                    
                    <select id="section" name="section<%=rs.getString("rollno")%>" required>
                
    
                                                    <option value="No Change">No Change</option>
                                                    <option value="A">A</option>
                                                    <option value="B">B</option>
                                                    <option value="C">C</option>
                                                    <option value="D">D</option>
                                                  
               
            </select>
                </td>
                </tr>
                <%
                }
                            if(stmt!=null)
                            stmt.close();
                              if(con!=null)
                                con.close();
                %> 
               </tbody>
               
                                            </table>                            
			                <br><br>
            
           <br> <br>
           
            
            
                                        </section>
            
                <input type="hidden" value="<%=batch%>" name="batch">
                
                <input type="hidden" value="<%=dept%>" name="dept">
             <div align="center">
            <input type="submit" id="submit" value="Submit" /></div>
            <br>
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
			<div class="copy">© All rights reserved, IncredibleBytes, 2014</div>
			<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>

<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
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
    }
catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>
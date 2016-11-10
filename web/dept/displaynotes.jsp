<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.lang.String"%>
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
        if(type1.equals("dept"))
        {
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    
    
    <script>
        $("#id1").click(function(e){
    e.preventDefault();//this will prevent the link trying to navigate to another page
    var href = $(this).attr("href");//get the href so we can navigate later
    document.getElementById("id1").setAttribute("filename1","filename1")

    //do the update

    //when update has finished, navigate to the other page
    window.location = href;
});
        </script>
	
		
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="subjectallocation.jsp">Subject Allocation</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectallocation.jsp">Allocate</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="subjectview.jsp">View</a></li> 
 </ul>
 </li>
 <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Elective Selection</a>
 <ul class="sub-menu">  <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectSelection.jsp">Assign</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="ElectiveView.jsp">View</a></li> 
 </ul>
 </li>
 
                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Student</a>
<ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="YrAttendance.jsp">View Attendance</a></li>
                
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="marks.jsp">View Marks</a></li>
                
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="BonusQuery.jsp">Bonus Remove</a></li>
	</ul></li>


<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
	</ul></li>
<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="cireveupdates.jsp">Department Uploads</a>
    </li>


<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marksreport.jsp">Mark Sheet</a>

</li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="studentanalysis.jsp">Student Analysis</a>

</li>
</ul>						</nav>
					</div>
				</div>
			</div>
		</header>

<% 
        String ayear = request.getParameter("ayear");
        String course = request.getParameter("course");
        String dept = request.getParameter("dept");
        String batch = request.getParameter("batch");
        String sem = request.getParameter("sem");
        String subject1 = request.getParameter("subject");
        String subcode = request.getParameter("subject");
        String[] parts = subcode.split("-");
        subcode = parts[0];
        String subject = parts[1];
        String notes = request.getParameter("notes");
        String path = Base.path+"/notes/"+ayear+"/"+dept+"/"+batch+"/"+sem+"/"+subcode+"/"+notes+"/";
        List<String> list = new ArrayList<String>();
        List<String> list1 = new ArrayList<String>();
        List<String> listdescp=new ArrayList<String>();
        String a = subject1.toUpperCase();
        
        list1.add(path);
          try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection connection1 = new dbcon().getConnection(Find.dept(username));
            Statement statement1 = connection1.createStatement();
            ResultSet rs = statement1.executeQuery("select filename,descp from notes where path = '"+path+"'");
            
          
            while(rs.next())
            {
                String file = rs.getString("filename");
               
                 list.add(file);
                 listdescp.add(rs.getString("descp"));
            }
            
            %>
<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner"><center><h2><%=a%></h2><br><br>
<div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2;background-color: #fff;">
<div align="left">

            
            <%
           
            for(int i=0; i<list.size();i++)
              {
                  String str=list.get(i);
                  //session.setAttribute(str,list.get(i));
                  session.setAttribute("path",path);
            %>
            <a href="${pageContext.request.contextPath}/notesdownload?ind1=<%=str %>" ><%= list.get(i)+"-"+listdescp.get(i) %></a>
<br>
<%
           
           }
            session.setAttribute("size",list.size());
              if(statement1!=null)
                            statement1.close();
                              if(connection1!=null)
                                connection1.close();
          }
          catch(Exception e)
          {
               
          }
%></div>
</div>
</center>
</div>
</div>


<div class="dm3-tab"><div class="dm3-tab-inner"><center><h2>Department Events</h2><br><br>
<div style="width:60%;height:300px;line-height:3em;overflow:scroll;padding:5px;border:1px solid #149dd2; background-color: #fff;">
<div align="left">
   
         </div>
</div>
</center></div></div>
</div><ul class="dm3-tabs-nav"></ul></div>
</div></div></section>

</section>						<footer id="footer-widgets">
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
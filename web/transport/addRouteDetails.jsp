<%-- 
    Document   : home
    Created on : 23 Apr, 2017, 4:09:51 PM
    Author     : Fluffy
--%>

<%@page import="Transport.BoardingPoint"%>
<%@page import="Transport.Route"%>
<%-- 
    Document   : home
    Created on : 18 Nov, 2016, 5:57:23 PM
    Author     : Home
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
        if(type.equals("transport"))
        {
    
    
    %>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        	     <link rel="stylesheet" href="../css/main.css">
     
                     <link rel="stylesheet" href="../css/sky-forms.css">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />

        <script src="../js/jquery.js"></script>

        <script src="../js/select2.js"></script>

	<link href="../css/bootstrap.min.css" rel="stylesheet">
 
     

<script type="text/javascript">
$(document).ready(function() {
  $('select.boarding').select2();
 // alert();
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>

    


   <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Routes</a>
 <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="displayRoute.jsp">Display</a></li>
	
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="addRouteDetails.jsp">Add</a></li>
	

</ul>    
</li>

    




   




</ul>						</nav>
					</div>
				</div>
			</div>
		</header>

<%
if(request.getParameter("msg")!=null){
%>

<script>
    alert("<%=request.getParameter("msg") %>");
    </script>
<%}%>
<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br><br><br>
          <section class="landing">
                   
    <center><form action="${pageContext.request.contextPath}/addMapping" class="sky-form" method="post">
    <header>SELECT ROUTE</header>
    <fieldset>					
					<section>
                                            
                <label class="input">
                                            <div align="left" size="3px"><b>ROUTE</b></div>
                                            <label class="select">

                                                <select id="route" name="route" required>
                                                    <option >Select</option>
                                                    <%
                                                        List<Route> list=Route.getAll();
                                                   for(Route r:list){
                                                   %>
                                                   <option value="<%=r.getId() %>"><%=r.getName() %>(<%=r.getId() %>)</option>
                                                   <%
                                                   }
                                                   %>
                                                </select>
                                                <i></i>                                    </label>
                                        </label>

                                    
                                        
                                            <br><br>
            
        
                                            <label class="input">
                                            <div align="left" size="3px"><b>BOARDING POINT</b></div>
                                            <label class="select">
                    </label>
                                        </label>

                                                <select class="boarding"  id="boarding" name="boarding" required>
                                                    <option >Select</option>
                                                     <%
                                                        List<String> blist= BoardingPoint.getAll();
                                                   for(String s:blist){
                                                   %>
                                                   <option value="<%=s %>"><%=s%></option>
                                                   <%
                                                   }
                                                   %>
                                                </select>
                                                <i></i>                
                                    
                                        
                                            <br><br>
            
                                            
                                            
                                            
                                            
                                            <label class="input">
                                            <div align="left" size="3px"><b>PRIORITY</b></div>
                                            <label class="select">

                                                <select id="priority" name="priority" required>
                                                    <option >Select</option>
                                                   <option value="High">High</option>
                                                   <option value="Medium">Medium</option>
                                                   <option value="Low">Low</option>
                                                </select>
                                                <i></i>                                    </label>
                                        </label>

                                    
                                        
                                            <br><br>
        </section>

                                            <div align="left">
            <input type="submit" id="submit" value="Submit" /></div>
            <br>
    </fieldset>
                </form></center>
        
        


            

</div></div>

<br><br></section></center>		


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
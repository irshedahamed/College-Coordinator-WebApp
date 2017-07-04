<%-- 
    Document   : bulkOutPass
    Created on : 14 Jun, 2017, 10:58:02 PM
    Author     : Irshed
--%>


<%@page import="com.action.Find"%>
<%@page import="General.Holidays"%>
<%@page import="General.Batch"%>
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
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
        	     <link rel="stylesheet" href="../css/main.css">
     
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
 <script src="../js/jquery.js"></script>
         
     



<link rel="stylesheet" href="../css/angular-material.css">
      
     
<link rel="stylesheet" href="../css/sky-forms.css">
      
	
		
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
                                                    
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>

    


  
   <li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Grant OutPass</a>
  <ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="requests.jsp">Single OutPass</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="bulkOutPass.jsp">Bulk OutPass</a>
  </ul></li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notreturned.jsp">SMS</a>


</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 "><a href="Setup.jsp">Holiday Setup</a>


</li>

<li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#"> Report</a>
<ul class="sub-menu">
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="monthlyReport.jsp">Monthly Report</a>
      <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="notReturnedReport.jsp">Not Returned Report</a>

</ul></li>



</ul>						
                                                </nav>
					</div>
				</div>
			</div>
                    
                    <script>
                        $(document).ready(function(){
                            
                         console.log();   
                            $(".change").on('change keydown',function(){
                              var batch=$("#batch").val();
                              var dept=$("#dept").val();
                              var holiday=$("#holidayname").val();
                                    if(batch!== null && dept!==null&&holiday!== null ){
                                        $.post('../HolidayData',{
                                            batch : batch,
                                            dept : dept,
                                            name : holiday
                                        },function(response){
                                            
                                           // console.log(response);
                                            $("#from").val(response.from);
                                            $("#till").val(response.till);
                                        });
                                          
                                      }
                            });
                        });
                        
                    </script>
		</header>


<center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                <br><br><br><br>
          <section class="landing">
              <center><form action="grantBulkOutPass.jsp" class="sky-form" method="post" >
    <header>BULK OUTPASS</header>
    <fieldset>					
					<section>
						<label class="input">
                                                    <div align="left" size="3px"><b>DEPARTMENT</b></div>
							<label class="select">
           
               <select id="dept" name="dept" class="change" required>
                    <%=Find.getDeptHTMLContent() %>
               
            </select>
                    <i></i>                                    </label>
                                                </label>
                                        
                                            <br><br>
            <label class="input">
                                                    <div align="left" size="3px"><b>BATCH</b></div>
							<label class="select">
           
               <select id="batch" class="change" name="batch" required>
                <option  disabled selected value="">Select</option>
  
                <%=Batch.getHTMLContent() %>
            </select>
                    <i></i>                                    </label>
                                                </label>
                                        
                                            <br><br>
          <label class="input"><label class="input">
                                                         <div align="left" size="3px"><b>
                                                            Reason: </b></div> 
                                                    <input type="text" id="preason" name="reason"  />
                                                    </label> </label>                              
                                            <br><br>
            
                                            <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                             FROM</b></div>
                <label class="input">
            
            <input type="date" id="from"   name="from" />
            
             <i></i>
            <br> <br>
                </label></label>
            
                                             <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                             TILL</b></div>
                <label class="input">
            
            <input type="date" id="till"   name="till" />
            
             <i></i>
            <br> <br>
                </label></label>
                                        </section>
            
                           
             <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
            <br>
    </fieldset>
                </form></center>     
              
            
        </section>


            

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
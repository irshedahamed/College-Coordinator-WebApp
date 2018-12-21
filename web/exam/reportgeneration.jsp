<%-- 
    Document   : reportgeneration
    Created on : 27-May-2015, 14:13:45
    Author     : Aravind Tyson
--%>

<%@page import="General.Batch"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        
    
    
    %>
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
         <link href="../css/sky-forms.css" rel="stylesheet">
         <link rel="stylesheet" href="../css/jquery-ui1.css">
         
         
        
    <!-- Custom CSS -->
    <script src="../js/jquery-1.10.2.js"></script>
    <script src="../js/jquery-ui.js">
    </script>
    <script src="../js/script.js"></script>
    
    
     <script src="../js/modernizr-2.6.2.min.js"></script> 
    
    <link href="../css/simple-sidebar.css" rel="stylesheet">
    
  <script>
      
            
            function sltdept1() {
 
    
     var selected = document.getElementById("dept").value;
      
    callAjaxFunctionlab(selected);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab(department){
  var url="index1.jsp?index=i1&index1="+department;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
  
  function updatepagelab(response){
//alert(str);
document.getElementById("div2").innerHTML = response;
}   

function sltdept2() {
 
    
     var selected = document.getElementById("dept").value;
     
     var selected1 = document.getElementById("batch").value;
      
    callAjaxFunctionlab1(selected,selected1);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab1(department,batch){
  var url="index1.jsp?index=i2&index1="+department+"&index2="+batch;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab1(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
  
  function updatepagelab1(response){
//alert(str);
document.getElementById("div3").innerHTML = response;
} 
            
            function sltdept3() {
 
    
     var selected = document.getElementById("dept").value;
     
     var selected1 = document.getElementById("batch").value;
     
     var selected2 = document.getElementById("sem").value;
     
     
      
    callAjaxFunctionlab2(selected,selected1,selected2);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab2(department,batch,sem){
  var url="index1.jsp?index=i3&index1="+department+"&index2="+batch+"&index3="+sem;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab2(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
  
  function updatepagelab2(response){
//alert(str);
document.getElementById("div4").innerHTML = response;
} 
            
            function sltdept4() {
 
    
     var selected = document.getElementById("dept").value;
     
     var selected1 = document.getElementById("batch").value;
    
     var selected2 = document.getElementById("sem").value;
     
     var selected3 = document.getElementById("section").value;
      
    callAjaxFunctionlab3(selected,selected1,selected2,selected3);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunctionlab3(department,batch,sem,section){
  var url="index1.jsp?index=i4&index1="+department+"&index2="+batch+"&index3="+sem+"&index4="+section;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState === 4) {
 
            updatepagelab3(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
  
  function updatepagelab3(response){
//alert(str);
document.getElementById("div5").innerHTML = response;
} 
            
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="home.jsp">Home</a></li>

    


                                                            <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="#">Marks</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemarks.jsp">Update Marks</a></li>
	
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmark.jsp">View Marks</a></li>
        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="ExamDate.jsp">End Date Entry</a></li>
        
        
	
</li>
</ul>
</li>


                                                            <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Report Generation</a>
<ul class="sub-menu">
       <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="AnalysisReport.jsp">Exam Report</a></li>
    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="reportgeneration.jsp">Marks Report Staff</a></li>
	
        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="viewmarkbonus.jsp">Marks Report Student</a></li>
        
        
	
</li>
</ul>
</li>



                                                            <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="#">Student</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updatemodeltype.jsp">Update Model Type</a></li>
	
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="regnoupdate.jsp">Update Register No.</a></li>
	
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BonusQuery.jsp">Bonus Assignment</a></li>
        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="StudentNo.jsp">Student no display</a></li>

</ul>
</li>



<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circular.jsp">Circular</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="events.jsp">Events</a>


<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="examuploads.jsp">Exam Uploads</a>

</li></ul>						</nav>	
					</div>
				</div>
			</div>
		</header>


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner">
        <center>    
        <form action="reportgenerationpage.jsp" class="sky-form" method="post" target="_blank">
    <header>Report Generation</header>
    <fieldset>					
					<section>
						<label class="input">
                                                    <div align="left" size="3px" id="div1"><b>DEPARTMENT</b></div>
							<label class="select">
           
               <select id="dept" name="dept">
                <option  disabled selected>Select</option>
               
                   <%=Find.getDeptHTMLContent() %>
                
               
            </select>
                    <i></i>                                    </label>
                                                </label>
                                        
                                            <br><br>
                                            <div id="div2">
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Batch:</b></div>
                <label class="select">
            <select id="batch" name="batch">
                <option disabled selected>Select</option>
         <%= Batch.getHTMLContent() %>
            </select>
                    <i></i>
                </label></label>
            <br> <br>
                                            </div>
                                            <div id="div3">
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             SEM </b></div>
                <label class="select">
           
            <select id="sem" name="sem">
                <option disabled selected>select</option>
                <option value="01">1</option>
                <option value="02">2</option>
                <option value="03">3</option>
                <option value="04">4</option>
                <option value="05">5</option>
                <option value="06">6</option>
                <option value="07">7</option>
                <option value="08">8</option>
            </select>
                    <i></i>
                    </label>
            </label>
            <br> <br>
                                            </div>
                
                                            <div id="div4">
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Section </b></div>
                <label class="select">
            
            <select id="section" name="section">
                <option disabled selected>select</option>
                <option value="A">A</option>
                <option value="B">B</option>
                <option value="C">C</option>
                <option value="D">D</option>
            </select>
                    <i></i>
                </label></label>
                                                 <br> <br>
                                            </div>
                                            
                                            <div id="div4">
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Exam Type </b></div>
                <label class="select">
            
            <select id="examtype" name="examtype">
                <option disabled selected>select</option>
            <option value="1">Model-1</option>
                <option value="2">Model-2</option>
                <option value="3">Model-3</option>
            </select>
                    <i></i>
                </label></label>
                                                 <br> <br>
                                            </div>
            
                                            <div id="div4">
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Exam Type </b></div>
                <label class="select">
            
            <select id="modeltype" name="modeltype">
               
                <option value="gen">General</option>
                <option value="spl">Special</option>
            </select>
                    <i></i>
                </label></label>
                                                 <br> <br>
                                            </div>
            
                                        </section>
            
                           
             <div align="left">
            <input type="submit" id="submit" value="Submit" /></div>
            <br>
    </fieldset>
                </form>
        </center>
</div>
</div>



</div><ul class="dm3-tabs-nav">/ul></div>
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
			<div class="copy"></div>
			<nav id="footer-nav">
				<ul id="menu-footer-menu" class="menu">
<li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="../Credits.html">Credits</a></li>
<li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
</ul>			</nav>
		</div>
	</footer>


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
    
    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>


 </body>

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
                                ;//connn.close();
    }catch(Exception e)
    {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
    
    %>
</html>

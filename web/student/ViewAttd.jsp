<%@page import="com.action.Find"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
<div id="sidebar-wrapper">
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
                    <a href="#"><b>DEPT : <%=Find.sdept(rollno1)%></b></a>
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
							<ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page "><a href="home.jsp">Home</a></li>
<li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
    <ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
	
	<li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">General Details</a></li>
        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
    </ul>
</li>

                                                            <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Attendance</a>
<ul class="sub-menu">
	<li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>
	
	
</li>
</ul>
</li>

<li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="fee.jsp">Fee</a>

<li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="forms.jsp">Forms</a>

</li>

</ul>						</nav>
					</div>
				</div>
			</div>
		</header>
    <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">


<div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
<div class="dm3-tab"><div class="dm3-tab-inner">
        <center>    
        <form action="Attd.jsp" class="sky-form" method="post" target="_blank">
    <header>Hour Attendance</header>
    <fieldset>					
					<section>
						
                                            <div id="div3">
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             SEM </b></div>
                <label class="select">
           
            <select id="sem" name="sem" required >
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
            
            <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                             From Date</b></div>
                <label class="select">
            
            <input type="text" id="datepicker3" placeholder="dd/mm/yyyy" name="datepicker1" />
            
             <i></i>
            <br> <br>
                </label></label>
            
            <label class="input">
                                                    <div align="left" size="3px" id="div7"><b>
                                                             To Date</b></div>
                <label class="select">
            
            <input type="text" id="datepicker4" placeholder="dd/mm/yyyy" name="datepicker2" />
            
             <i></i>
            <br> <br>
                </label></label>
            
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
    });
    </script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
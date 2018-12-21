<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en-US">
     <% 
   String username = session.getAttribute("username").toString();
    
    
    %>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
    <script type="text/javascript" src="../js/jspdf.js"></script>
    <script type="text/javascript" src="../js/from_html.js"></script>
    <script type="text/javascript" src="../js/split_text_to_size.js"></script>
    <script type="text/javascript" src="../js/standard_fonts_metrics.js"></script>
 <script type="text/javascript" src="../js/cell.js"></script> 
    <script type="text/javascript" src="../js/FileSaver.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
       
            $("#exportpdf").click(function() {
                
                var pdf = new jsPDF('l', 'pt', 'a4');
                // source can be HTML-formatted string, or a reference
                // to an actual DOM element from which the text will be scraped.
                pdf.setFont('Times','bold');
               
                pdf.text(50,30,'St.Joseph"s Institute of Technology');
                
                  pdf.setFont('Times','normal');
                source = $('#suballoc')[0];

                // we support special element handlers. Register them with jQuery-style 
                // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                // There is no support for any other type of selectors 
                // (class, of compound) at this time.
                specialElementHandlers = {
                    // element with id of "bypass" - jQuery style selector
                    '#bypassme' : function(element, renderer) {
                        // true = "handled elsewhere, bypass text extraction"
                        return true
                    }
                };
                margins = {
                    top : 50,
                    bottom : 60,
                    left : 60,
                    width : 322
                };
                // all coords and widths are in jsPDF instance's declared units
                // 'inches' in this case
                pdf.fromHTML(source, // HTML string or DOM elem ref.
                margins.left, // x coord
                margins.top, { // y coord
                    'width' : margins.width,
                    'table_2'           : true,
            // max width of content on PDF
                    'elementHandlers' : specialElementHandlers
                },

                function(dispose) {
                    // dispose: object with X, Y of the last line add to the PDF 
                    //          this allow the insertion of new lines after html
                    pdf.save('stjosephsportal.pdf');
                }, margins);
            });

        });
    </script>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
	<link href="../css/bootstrap.min.css" rel="stylesheet">
        <style>
        table.bordered {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width:70%;
    overflow-x : auto; 
    background: #ffffff
}
table.bordered1 {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%; 
    height: 170px;
    overflow-x : auto; 
    background: #ffffff
}
.bordered1 td, .bordered1 th {
   
    
    text-align: left;    
}


.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}
</style>
<link href="../css/sky-forms.css" rel="stylesheet">

<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
<script>
     
 
 
 function disp() {
 
    var selectedIndexVal = document.getElementById("staff").selectedIndex;
    var selected =document.getElementById("staff").options[selectedIndexVal].value;
     var selectedIndexVal1 = document.getElementById("acyear").selectedIndex;
    var selected1 =document.getElementById("acyear").options[selectedIndexVal1].value;
         
    callAjaxFunction(selected,selected1);
   
  }
 
/* function called to do Ajax Request */
  function callAjaxFunction(index,acyear){
  var url="showallocatedsubjects.jsp?index="+index+"&acyear="+acyear;
 
    var xmlHttp;
        if (window.XMLHttpRequest) { // Mozilla, Safari, ...
 
        var xmlHttp = new XMLHttpRequest();
 
      } else if (window.ActiveXObject) { // IE
 
        var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
      }
 
    xmlHttp.open('POST', url, true);
    xmlHttp.onreadystatechange = function() {
 
        if (xmlHttp.readyState  === 4) {
 
            updatepage(xmlHttp.responseText);
        }
 
    };
xmlHttp.send(url);
  }
 
/* Call back function of Ajax Response*/
function updatepage(response){
//alert(str);
document.getElementById("displaycontent").innerHTML = response;
}
    

    </script>
    <!-- Custom CSS -->
	
		
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
<li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="subjectallocation.jsp">Subject Allocation</a>
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


<li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
    <ul class="sub-menu">
		<li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
		<li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notes.jsp">View Notes</a></li>
                <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesReport.jsp">Notes Report</a>
            </li>
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


<section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
            <center>
<form action="showallocatedsubjects.jsp" class="sky-form" method="post" target='_blank'>
    <header>View Allocation</header>
    <fieldset>					
					<section>
                                            
                                            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Academic Year </b></div>
                <label class="select">
           
            <%    
          
         java.util.Date t = new java.util.Date();
         int year = t.getYear()+1900;
         
            %>
                    <select id="acyear" name="acyear" >
                <option value="0">select</option>
                <option value="<%=year-2-2000%>"><%=year-2%>-<%=year-1%></option>
                 <option value="<%=year-1-2000%>"><%=year-1%>-<%=year%></option>
                <option value="<%=year-2000%>"><%=year%>-<%=year+1%></option>
                <option value="<%=year+1-2000%>"><%=year+1%>-<%=year+2%></option>
                <option value="<%=year+2-2000%>"><%=year+2%>-<%=year+3%></option>
                <option value="<%=year+3-2000%>"><%=year+3%>-<%=year+4%></option>
                <option value="<%=year+4-2000%>"><%=year+4%>-<%=year+5%></option>
            </select>
                    <i></i>
                    </label>
            </label><br><br>
						
            <label class="input">
                                                    <div align="left" size="3px"><b>
                                                            Staff Name:</b></div>
                <label class="select">
            <select id="staff" name="staff" >
                <option value="null" selected disabled>Select</option>
                <option value="all" >ALL</option>
                <%
                    //int i=Integer.parseInt(request.getParameter("val"));
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
              Connection connection = new dbcon().getConnection(Find.dept(username));
            //  Statement statement = connection.createStatement();
               PreparedStatement statement=connection.prepareStatement("select staffid,staffname from staff_table");
              ResultSet rs= statement.executeQuery();
                   
              String staffname,staffid = "";
                    
                    
              while(rs.next())
              {
                  staffname=rs.getString("staffname");
                  staffid = rs.getString("staffid");
                  
              
              %>
              <option value="<%=staffid%>"><%=staffid%>-<%=staffname%></option>
              <% } %>
            </select>
                    <i></i>
                </label>
            </label>
                    <br>
                <br>
                    
         <label class="input">
                                                    <div align="left" size="3px"><b>
                                                             Sem </b></div>
                <label class="select">
           
      
                    <select id="sem" name="sem" >
                <option value="#">select</option>
                <option value="Odd">Odd</option>
                 <option value="Even">Even</option>
            </select>
                    <i></i>
                    </label>
            </label><br><br>
            
            
                    </section>       
            <div align="left">
                <input type="submit" id="submit" value="View" onclick="javascript: form.action='showallocatedsubjects.jsp'" />
                <input type="submit" id="submit" value="Edit" onclick="javascript: form.action='Editallocatedsubjects.jsp'" /></div>
            <br>
    </fieldset>
   
</form></center><br><br>
            <div id="displaycontent"></div>
            <br>
            
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
</html>
<%-- 
    Document   : cireveupdates
    Created on : Aug 19, 2015, 9:46:27 AM
    Author     : Divya Sri
--%>

<%@page import="com.action.Find"%>
<%-- 
    Document   : deptuploadeve
    Created on : Aug 18, 2015, 7:46:55 PM
    Author     : Divya Sri
--%>

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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">

        <script src="../js/jquery-1.11.1.js" type="text/javascript"></script>

        <!-- Custom CSS -->
        <script>
            $(document).on('change', '[id^="sem"]', function () {
                var sem = $("select#sem").val();
                var dept = $("select#dept").val();
                var batch = $("select#batch").val();

                if (dept !== 'null' && batch !== 'null')
                {
                    $.get('${pageContext.request.contextPath}/JsonServlet', {
                        semester: sem,
                        department: dept,
                        batch: batch

                    }, function (response) {

                        var select = $('#subject');
                        select.find('option').remove();
                        $.each(response, function (index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });

                    });
                }


            });

            $(document).on('change', '[id^="dept"]', function () {
                var sem = $("select#sem").val();
                var dept = $("select#dept").val();
                var batch = $("select#batch").val();
                if (sem !== 'null' && batch !== 'null')
                {
                    $.get('${pageContext.request.contextPath}/JsonServlet', {
                        semester: sem,
                        department: dept,
                        batch: batch
                    }, function (response) {

                        var select = $('#subject');
                        select.find('option').remove();
                        $.each(response, function (index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });

                    });
                }


            });
            $(document).on('change', '[id^="batch"]', function () {
                var sem = $("select#sem").val();
                var dept = $("select#dept").val();
                var batch = $("select#batch").val();
                if (sem !== 'null' && dept !== 'null')
                {
                    $.get('${pageContext.request.contextPath}/JsonServlet', {
                        semester: sem,
                        department: dept,
                        batch: batch
                    }, function (response) {

                        var select = $('#subject');
                        select.find('option').remove();
                        $.each(response, function (index, value) {
                            $('<option>').val(value).text(value).appendTo(select);
                        });

                    });
                }


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
                                    </li><li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Elective Selection</a>
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
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="cireveupdates.jsp">Department Uploads</a>
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
                            <form action="${pageContext.request.contextPath}/cvrupdates"  enctype="multipart/form-data" class="sky-form" method="post">
                                <header>DEPARTMENT UPLOAD</header>
                                <fieldset>					
                                    <section>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Circular or Event: </b></div>
                                            <label class="select">

                                                <select id="type" name="type">
                                                    <option>select</option>
                                                    <option value="circular">circular</option>
                                                    <option value="event">event</option>


                                                </select>
                                                <i></i>
                                            </label>
                                        </label>

                                        <br><br>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Choose File:  </b></div>
                                            <br>
                                            <label class="file">
                                                <input type="file" name="file" />


                                            </label>
                                        </label>
                                        <br><br>
                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Description </b></div>
                                            <br>
                                            <label class="text" name="desc">

                                                <textarea name="desc" rows="4" cols="50"></textarea>


                                            </label>
                                        </label>

                                    </section>       
                                    <div align="left">
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
        <nav id="footer-nav">
            <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="../credits.html">Credits</a></li>

                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="../index.jsp">Logout</a></li>
            </ul>			</nav>
    </div>
</footer>





<script src="../js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="../js/bootstrap.min.js"></script>

<!-- Menu Toggle Script -->
<script>
            $("#menu-toggle").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
            $("#menu-toggle1").click(function (e) {
                e.preventDefault();
                $("#wrapper").toggleClass("toggled");
            });
</script>


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
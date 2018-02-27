<%@page import="General.AcademicYear"%>
<%@page import="General.Batch"%>
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
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">

        <script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
        <script>
            $(document).on('change', '[id^="sem"]', function () {
                var sem = $("select#sem").val();
                var dept = $("select#dept").val();
                var batch = $("select#batch").val();
                var ayear = $("select#ayear").val();

                if (dept !== 'null' && batch !== 'null' && ayear !== 'null')
                {

                    $.get('${pageContext.request.contextPath}/JsonServlet', {
                        semester: sem,
                        department: dept,
                        batch: batch,
                        ayear: ayear

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

                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766 "><a href="MarkReport.jsp">Marks Report</a></li>	
                                        </ul></li>


                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Notes</a>
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
                            <form action="displaynotes.jsp" class="sky-form" method="post">
                                <header>NOTES DOWNLOAD</header>
                                <fieldset>					
                                    <section>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Academic Year:</b></div>
                                            <label class="select">
                                                <select id="ayear" name="ayear">
                                                    <%= AcademicYear.getHTMLContent()%>
                                                </select>
                                                <i></i>
                                            </label>
                                        </label>
                                        <br> <br>


                                        <%                    try {

                                                String departmentname = Find.dept(username);


                                        %>   


                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Department: </b></div>
                                            <label class="select">

                                                <select id="dept" name="dept">

                                                    <option value=<%=departmentname%>><%= departmentname%></option>



                                                </select>
                                                <i></i>
                                            </label>
                                        </label>
                                        <br><br>
                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Batch: </b></div>
                                            <label class="select">

                                                <select id="batch" name="batch">

                                                    <%= Batch.getHTMLContent()%>


                                                    <%
                                                        } catch (Exception e) {
                                                            e.printStackTrace();
                                                        }

                                                    %>

                                                </select>
                                                <i></i>
                                                <br> <br>
                                            </label></label>

                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Semester: </b></div>
                                            <label class="select">

                                                <select id="sem" name="sem" >
                                                    <option value="00">select</option>
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

                                        <br><br>
                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Subject Name:</b></div>
                                            <label class="select">

                                                <select id="subject" name="subject">
                                                    <option>select</option>
                                                </select>
                                                <i></i>
                                            </label>
                                        </label>

                                        <br><br>
                                        <label class="input">
                                            <div align="left" size="3px"><b>
                                                    Notes Type:  </b></div>
                                            <label class="select">
                                                <select id="notes" name="notes" >
                                                    <option value="0">select</option>
                                                    <option value="class_notes">Class Notes</option>
                                                    <option value="question_bank">Question Bank</option>
                                                    <option value="prev_univ_quest">Previous University Questions</option>
                                                    <option value="model_keys">Model Keys</option>
                                                    <option value="Unit_Keys">Unit</option>
                                                    <option value="Cycle_Test">Cycle test Questions</option>
                                                    <option value="Syllabus">Syllabus</option>
                                                    <option value="Prev_univ_ans">Previous University Answers</option>
                                                    <option value="Assignment_ques">Assignment Questions</option>
                                                </select>

                                                <i></i>
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
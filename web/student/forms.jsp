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

            function displayform() {

                var selectedIndexVal = document.getElementById("form").selectedIndex;
                var selected = document.getElementById("form").options[selectedIndexVal].value;


                callAjaxFunction(selected);

            }

            /* function called to do Ajax Request */
            function callAjaxFunction(index) {
                var url = "displayform.jsp?index=" + index;

                var xmlHttp;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...

                    var xmlHttp = new XMLHttpRequest();

                } else if (window.ActiveXObject) { // IE

                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

                xmlHttp.open('POST', url, true);
                xmlHttp.onreadystatechange = function () {

                    if (xmlHttp.readyState === 4) {

                        updatepage(xmlHttp.responseText);
                    }

                };
                xmlHttp.send(url);
            }

            /* Call back function of Ajax Response*/
            function updatepage(response) {
        //alert(str);
                document.getElementById("result").innerHTML = response;
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

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom "><a href="#">Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>

                                    </li>
                                </ul>
                                </li>

                                <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="marks.jsp">Marks</a></li>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="notes.jsp">Notes</a>
                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="fee.jsp">Fee</a>

                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="forms.jsp">Forms</a>

                                </li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                        <center>

                            <header>FORMS DOWNLOAD</header>
                            <fieldset>					
                                <section>

                                    <label class="input">
                                        <div align="left" size="3px"><b>
                                                Select Form Category:</b></div>
                                        <label class="select">
                                            <select id="form" name="form" onchange="displayform();">

                                                <option>Select Form Type</option>
                                                <option value="abhsformat">ABHS Formats</option>
                                                <option value="hostelformat">Hostel Formats</option>
                                                <option value="studentsformat">Student Formats</option>


                                            </select>
                                            <i></i>
                                        </label>
                                    </label>
                                    <br> <br>
                                    <div id="result"></div>

                            </fieldset>
                        </center>

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
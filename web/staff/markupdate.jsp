<%-- 
    Document   : HourAttd
    Created on : 27-May-2015, 14:13:45
    Author     : Aravind Tyson
--%>

<%@page import="Actor.Staff"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from staff_login_details where staffid='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {


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
            function callAjaxFunctionlab(department) {
                var url = "index1.jsp?index=i1&index1=" + department;

                var xmlHttp;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...

                    var xmlHttp = new XMLHttpRequest();

                } else if (window.ActiveXObject) { // IE

                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }

                xmlHttp.open('POST', url, true);
                xmlHttp.onreadystatechange = function () {

                    if (xmlHttp.readyState === 4) {

                        updatepagelab(xmlHttp.responseText);
                    }

                };
                xmlHttp.send(url);
            }
            function updatepagelab(response) {
                //alert(str);
                document.getElementById("div2").innerHTML = response;
            }
            function sltdept2() {
                var selected = document.getElementById("dept").value;
                var selected1 = document.getElementById("batch").value;
                callAjaxFunctionlab1(selected, selected1);
            }
            /* function called to do Ajax Request */
            function callAjaxFunctionlab1(department, batch) {
                var url = "index1.jsp?index=i2&index1=" + department + "&index2=" + batch;
                var xmlHttp;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                    var xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) { // IE
                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlHttp.open('POST', url, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState === 4) {
                        updatepagelab1(xmlHttp.responseText);
                    }
                };
                xmlHttp.send(url);
            }
            function updatepagelab1(response) {
                //alert(str);
                document.getElementById("div3").innerHTML = response;
            }
            function sltdept3() {
                var selected = document.getElementById("dept").value;
                var selected1 = document.getElementById("batch").value;
                var selected2 = document.getElementById("sem").value;
                callAjaxFunctionlab2(selected, selected1, selected2);
            }
            /* function called to do Ajax Request */
            function callAjaxFunctionlab2(department, batch, sem) {
                var url = "index1.jsp?index=i3&index1=" + department + "&index2=" + batch + "&index3=" + sem;
                var xmlHttp;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                    var xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) { // IE
                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlHttp.open('POST', url, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState === 4) {
                        updatepagelab2(xmlHttp.responseText);
                    }
                };
                xmlHttp.send(url);
            }
            function updatepagelab2(response) {
                //alert(str);
                document.getElementById("div4").innerHTML = response;
            }
            function sltdept4() {
                var selected = document.getElementById("dept").value;
                var selected1 = document.getElementById("batch").value;
                var selected2 = document.getElementById("sem").value;
                var selected3 = document.getElementById("section").value;
                callAjaxFunctionlab3(selected, selected1, selected2, selected3);
            }
            /* function called to do Ajax Request */
            function callAjaxFunctionlab3(department, batch, sem, section) {
                var url = "index1.jsp?index=i4&index1=" + department + "&index2=" + batch + "&index3=" + sem + "&index4=" + section;
                var xmlHttp;
                if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                    var xmlHttp = new XMLHttpRequest();
                } else if (window.ActiveXObject) { // IE
                    var xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                xmlHttp.open('POST', url, true);
                xmlHttp.onreadystatechange = function () {
                    if (xmlHttp.readyState === 4) {
                        updatepagelab3(xmlHttp.responseText);
                    }
                };
                xmlHttp.send(url);
            }
            function updatepagelab3(response) {
                //alert(str);
                document.getElementById("div5").innerHTML = response;
            }
        </script>
        <script>
            $(document).ready(function () {
                var dept, batch, sem, i;
                $(document).on('change', "#dept", function () {
                    dept = $(this).val();
                });
                $(document).on('change', "#batch", function () {
                    batch = $(this).val();
                });
                $(document).on('change', "#sem", function () {
                    sem = $(this).val();
                    $.post("../DateCheck", {"dept": dept, "batch": batch, "sem": sem}, function (list)
                    {
                        for (i = 0; i < list.length; i++) {
                            var x = list[i];
                            if(x==="unit1" || x==="unit2" || x==="unit3" ||"unit4" ){
                                  var res = x.replace(/unit/gi, "IAE");
                                  x = res;
                            }
                            if (x[0] === 'z') {
                                x = x.substring(1);
                            }
                            function uppercase(str)
                            {
                                var array1 = str.split(' ');
                                var newarray1 = [];
                                for (var x = 0; x < array1.length; x++) {
                                    newarray1.push(array1[x].charAt(0).toUpperCase() + array1[x].slice(1));
                                }
                                return newarray1.join(' ');
                            }
                            $("#exam").append(' <option value=' + list[i] + '>' + uppercase(x) + '</option>');
                        }
                    });
                });
            });
        </script>
    </head>
    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">
                <%        Connection con = new dbcon().getConnection(Find.sdept(username));
                 //   Statement stmtd = con.createStatement();
                   // ResultSet rsd = stmtd.executeQuery("select * from staff_general where staffid='" + username + "'");
                    //if (rsd.next()) {
    Staff s=Staff.getByid(username);
%>
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
                    <li >
                    <center>
                        <a href="#"><b><%=s.getName()%></b></a>
                    </center>
                    </li>
                    <li>
                    <center>
                        <a href="#"><b><%=username%></b></a>
                    </center>
                    </li>
                    <li>
                    <center>
                        <a href="#"><b><%=s.getDesg()%></b></a>
                    </center>
                    </li>
                    <li >
                    <center>
                        <a href="#"><b><%=Find.sdept(username).toUpperCase()%></b></a>
                    </center>
                    </li>
                </ul>
            </div>

            <%//}
      //          if (stmtd != null) {
        //            stmtd.close();
          //      }
            //    if (con != null) {
              //      ;//con.close();
                //}
            %>

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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="home.jsp">Home</a></li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="general.jsp">General Details</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="education.jsp">Education Details</a></li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="experience.jsp">Experience Details</a></li>
                                        </ul>
                                    </li>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Log Book</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Update Attendance</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="#">Syllabus Coverage</a>
                                            </li>
                                        </ul>
                                    </li>
                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Marks</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="markupdate.jsp">Update Marks</a></li>
                                            <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksview.jsp">View Marks</a></li>
                                        </ul>
                                    </li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Notes</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-766" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-766"><a href="notesupload.jsp">Upload Notes</a></li>
                                            <li id="menu-item-767" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-item current_page_item menu-item-767"><a href="notesdownload.jsp">View Notes</a></li>
                                        </ul></li>
                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="displayform.jsp">Forms</a>
                                    </li>
                                    <%
                                      //  Staff s = new Staff(username);
                                        if (s.getCouncillorDetails().getBatch() != null) {
                                    %>
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="councillor/home.jsp">Councillor View</a>
                                        <%
                                            }
                                        %>
                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>
            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                        <div class="dm3-tabs-testimonials" data-autoscroll=""><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner">
                                        <center>    
                                            <form action="SetMark.jsp" class="sky-form" method="post" target="_blank">
                                                <header>Marks Update</header>
                                                <fieldset>					
                                                    <section>
                                                        <label class="input">
                                                            <div align="left" size="3px" id="div1"><b>DEPARTMENT</b></div>
                                                            <label class="select">

                                                                <select id="dept" name="dept" required onchange="sltdept1();">
                                                                    <option  disabled selected>Select</option>
                                                                    <%
                                                                        //int i=Integer.parseInt(request.getParameter("val"));
                                                                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                                        Connection connection = new dbcon().getConnection(Find.sdept(username));
                                                                      //  Statement statement = connection.createStatement();
                                                                      PreparedStatement statement=connection.prepareStatement("select distinct(dept) from subject_allocation where staffid=?");
                                                                      statement.setString(1, username);
                                                                      ResultSet rs = statement.executeQuery();
                                                                        String dept;
                                                                        while (rs.next()) {
                                                                            dept = rs.getString("dept");
                                                                    %>
                                                                    <option value="<%=dept%>"><%=dept%></option>
                                                                    <% }
                                                                        if (statement != null) {
                                                                            statement.close();
                                                                        }
                                                                        if (connection != null) {
                                                                            connection.close();%>
                                                                </select>
                                                                <i></i>                                    </label>
                                                        </label>
                                                        <br><br>
                                                        <div id="div2">
                                                            <label class="input">
                                                                <div align="left" size="3px"><b>
                                                                        Batch:</b></div>
                                                                <label class="select">
                                                                    <select id="batch" name="batch" required onchange="sltdept2();">
                                                                        <option disabled selected>Select</option>
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
                                                                    <select id="sem" name="sem" required onchange="sltdept3();">
                                                                        <option disabled selected>select</option>
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
                                                                    <select id="section" name="section" required onchange="sltdept4();">
                                                                        <option disabled selected>select</option>
                                                                    </select>
                                                                    <i></i>
                                                                </label></label>
                                                            <br> <br>
                                                        </div>
                                                        <div id="div5">
                                                            <label class="input">
                                                                <div align="left" size="3px"><b>
                                                                        Subject</b></div>
                                                                <label class="select">
                                                                    <select id="subject" name="subject" required>
                                                                        <option disabled selected>select</option>
                                                                    </select>
                                                                    <i></i>
                                                                    <br> <br>
                                                                </label></label>
                                                        </div>
                                                        <label class="select">
                                                            <label class="input">
                                                                <div align="left" size="3px"><b>
                                                                        Exam</b></div>
                                                                <select id="exam" name="exam" required >
                                                                    <option value="">Select</option>
                                                                </select>
                                                                <i></i>
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
        <!--<button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>-->
        <nav id="footer-nav">
            <ul id="menu-footer-menu" class="menu">
                <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="../credits.html">Credits</a></li>
                <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-770"><a href="../index.jsp">Logout</a></li>
            </ul>			</nav>
    </div>
</footer>
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
<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
<%
            } else {
                response.sendRedirect("../index.jsp");
            }
            if (sttt != null) {
                sttt.close();
            }
            if (connn != null) {
                ;//connn.close();
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }
%>
</html>

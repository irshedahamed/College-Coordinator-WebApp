<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
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

        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">

    </head>
    <style>
        table.bordered {
            *border-collapse: collapse; /* IE7 and lower */
            border-spacing: 0;
            width: 50%;  
            overflow-x : auto; 
            background: #ffffff
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

</head>
<script>
    function call()
    {

        var selectedIndexVal = document.getElementById("sem").selectedIndex;
        var sem = document.getElementById("sem").options[selectedIndexVal].value;
        var selectedIndexVal1 = document.getElementById("exam").selectedIndex;
        var exam = document.getElementById("exam").options[selectedIndexVal1].value;
        callAjaxFunctionlab(sem, exam);
    }
    function callAjaxFunctionlab(index, index1) {
        var url = "stmarks.jsp?sem=" + index + "&exam=" + index1;

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

    /* Call back function of Ajax Response*/
    function updatepagelab(response) {
//alert(str);
        document.getElementById("test").innerHTML = response;
    }
</script>



<%                    String batch = "", name = "", rollno = "", course = "", sec = "";

    Student s1 = Student.getById(username);
    name = s1.getById(username).getName();
    rollno = s1.getById(username).getId();
    course = s1.getById(username).getCourse();
    sec = s1.getById(username).getSec();
    batch = s1.getById(username).getBatch();


%>

<body class="home page page-id-115 page-template-default has-toolbar">
    <div id="wrapper" class="toggled">
        <div id="sidebar-wrapper">
            <ul class="sidebar-nav">
                <li class="sidebar-brand">
                    <a href="#menu-toggle1" id="menu-toggle1">

                    </a>
                </li>
                <center>



                    <img src="../../StudentPhotos/Batch<%=batch%>/<%=rollno.toUpperCase()%>.JPG" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />




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
                    <a href="#"><b>DEPT : <%=Find.sdept(username)%></b></a>
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
                            <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Profile</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personal.jsp">Personal Details</a></li>

                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="contact.jsp">General Details</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="other.jsp">Other Details</a></li>
                                    </ul>
                                </li>

                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Attendance</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="overallattendance.jsp">Overall Attendance</a></li>

                                </li>
                            </ul>
                            </li>

                            <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="marks.jsp">Marks</a></li>
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
                    <center>  
                        <form  class="sky-form" method="post" >
                            <header>View Marks</header>
                            <fieldset>					
                                <section>








                                    <label class="input">
                                        <div align="left" size="3px"><b>
                                                SEM </b></div>
                                        <label class="select">

                                            <select id="sem" name="sem" required>
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
                                            <br> <br>
                                        </label></label>

                                    <label class="input">
                                        <div align="left" size="3px"><b>
                                                EXAM</b></div>
                                        <label class="select">

                                            <select id="exam" name="exam" required>
                                                <option disabled selected>select</option>
                                                <option value="unit1">IAE 1</option>
                                                <option value="unit2">IAE 2</option>
                                                <option value="unit3">IAE 3</option>
                                                <option value="unit4">IAE 4</option>               
                                                <option value="model3">Model(IAE 5)</option>
                                                <option value="model1">Model 1</option>  
                                                <option value="model2">Model 2</option>   
                                                <option value="cycle1">Cycle 1</option>     

                                            </select>
                                            <i></i>
                                            <br> <br>
                                        </label></label>
                                </section>


                                <div align="left">
                                    <input type="button" id="submit" value="Submit" onclick="call()"/></div>
                                <br>
                            </fieldset>
                        </form><br><br></center>
                    <center>
                        <div id="test"></div>
                    </center>
                    </section>

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
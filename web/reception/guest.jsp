<%-- 
    Document   : guest
    Created on : 8 Dec, 2016, 5:32:37 PM
    Author     : Home
--%>

<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="Actor.Guest"%>
<%@page import="General.Batch"%>
<%-- 
    Document   : addStudent
    Created on : 18 Nov, 2016, 7:16:34 PM
    Author     : Home
--%>
<%@page import="java.util.Date"%>
<%@page import="com.action.Find"%>
<%-- 
    Document   : addEntry
    Created on : 18 Nov, 2016, 6:16:29 PM
    Author     : Home
--%>
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
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type = rsss.getString("type");
                }
                if (type.equals("reception")) {


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


        <link href="../css/simple-sidebar.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">





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





                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Add Entry</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="guest.jsp">Guest</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="entry.jsp">Staff & Students</a>
                                        </ul>
                                    </li>



                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#"> Report</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="personalReport.jsp">Personal Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="dailyReport.jsp">Daily Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="monthlyReport.jsp">Monthly Report</a>
                                        </ul></li>









                                </ul>						</nav>
                        </div>
                    </div>
                </div>  <style>
                    td {
                        padding: 10px;
                    }
                    label {
                        display: inline-block;
                        width: 140px;
                        text-align: right;
                    }
                </style>

                <script>

                    $(document).ready(function () {
                        function display() {
                            $("input").prop("disabled", true);
                            $("#guestid").prop("disabled", false);
                            $(".button").prop("disabled", false);
                            $("select").prop("disabled", true);
                        }

                        $(".button").click(function () {


                            $("[name='entry']").val($(this).val());

                        });
                        $("#submitform").submit(function () {

                            //console.log($(this).val());
                            var dataURL = canvas.toDataURL('image/jpeg', 0.5);
                            var blob = dataURItoBlob(dataURL);
                            var fd = new FormData();

                            var fileOfBlob = new File([blob], 'photo.jpg');
                            fd.append("upload", fileOfBlob);
                            //fd.append("append","data");
                            var xmlhttp = new XMLHttpRequest();
                            xmlhttp.open('POST', '../GuestEntry', false);
                            xmlhttp.onreadystatechange = function (respone) {
                                if (xmlhttp.status === 200 && xmlhttp.readyState === 4) {

                                    console.log(xmlhttp.responseText);
                                }
                            };
                            xmlhttp.send(fd);



                        });
                    });

                </script>
                <script src="../js/URItoBlob.js"></script>

                <script>

                    $(document).ready(function () {
                        // Put event listeners into place
                        var canvas = document.getElementById('canvas');
                        $("#canvas").hide();
                        $("#resnap").hide();
                        window.addEventListener("DOMContentLoaded", function () {
                            // Grab elements, create settings, etc.

                            var context = canvas.getContext('2d');
                            var video = document.getElementById('video');
                            var mediaConfig = {video: true};
                            var errBack = function (e) {
                                console.log('An error has occurred!', e);
                            };

                            // Put video listeners into place
                            if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {
                                navigator.mediaDevices.getUserMedia(mediaConfig).then(function (stream) {
                                    video.src = window.URL.createObjectURL(stream);
                                    video.play();
                                });
                            }

                            /* Legacy code below! */
                            else if (navigator.getUserMedia) { // Standard
                                navigator.getUserMedia(mediaConfig, function (stream) {
                                    video.src = stream;
                                    video.play();
                                }, errBack);
                            } else if (navigator.webkitGetUserMedia) { // WebKit-prefixed
                                navigator.webkitGetUserMedia(mediaConfig, function (stream) {
                                    video.src = window.webkitURL.createObjectURL(stream);
                                    video.play();
                                }, errBack);
                            } else if (navigator.mozGetUserMedia) { // Mozilla-prefixed
                                navigator.mozGetUserMedia(mediaConfig, function (stream) {
                                    video.src = window.URL.createObjectURL(stream);
                                    video.play();
                                }, errBack);
                            }

                            // Trigger photo take
                            $("#resnap").click(function () {
                                $("#video").show();
                                $("#canvas").hide();
                                $("#snap").show();
                                $(this).hide();

                            });
                            document.getElementById('snap').addEventListener('click', function () {
                                $("#video").hide();
                                $("#canvas").show();
                                $("#snap").hide();
                                $("#resnap").show();
                                context.drawImage(video, 0, 0, 200, 120);

                                //fd.append("canvasImage", blob);

                            });
                        }, false);

                    });

                </script>
                <script>

                    $(document).ready(function () {
                        $("#newguest").hide();

                        $(".guest").click(function () {
                            $("#old").hide();
                            $("#newguest").show();
                            $("#submitform")[0].reset();
                            $("#resnap").click();
                        });

                        var meet, batch = "", dept;

                        $("#meet").change(function () {


                            var data = $(this).val();
                            meet = data;
                            if (data === "Student" || data === "Staff" || data === "HOD") {

                                var eledept = "<select id='dept' style='background:white'>   <option value=''>Dept</option>" +
                                        "<%=Find.getDeptHTMLContent()%>" +
                                        " <option value=\"first\">Science & Humanities</option></select>";

                                $("#sublist").html(eledept);
                            } else {
                                $("#sublist").html("");
                                $("#sublistbatch").html("");
                                $("#sublistperson").html("");
                            }


                            var value = $(this).data("once");
                            if (value === "yup")
                            {
                                return;
                            }
                            $(this).data("once", "yup");

                            $("#sublist").after("<input type='hidden' name='hperson' id='hperson' value='" + data + "'>");
                        });
                        $(document).on('change', '#batch', function () {
                            batch = $(this).val();
                            getPersonList();

                        });
                        $(document).on('change', '#dept', function () {
                            dept = $(this).val();
                            if (meet === 'Student') {

                                var elebatch = "<select id='batch' style='background:white'> <option value=''>Batch</option>" +
                                        " <%=Batch.getHTMLContent()%>"
                                        + "  </select>";
                                //console.log(elebatch);
                                $("#sublistbatch").html(elebatch);
                            } else if (meet === 'Staff') {
                                $("#sublistbatch").html("");
                                getPersonList();
                            } else if (meet === 'HOD') {
                                $("#hperson").val(meet + "_" + dept);

                            }
                        });

                        $(document).on('change', '#person', function () {
                            var data = $(this).val();
                            $("#hperson").val(meet + "_" + data);





                        });
                        function getPersonList() {
                            $.get('../PersonList', {
                                meet: meet,
                                dept: dept,
                                batch: batch
                            }, function (response) {
                                // console.log(response);
                                var eleperson = "<select id='person' style='background:white'><option value=''>Person</option>";
                                $.each(response, function (index, value) {
                                    // console.log(value);
                                    var data = value.split('-');
                                    eleperson += "<option value='" + data[0] + "'>" + data[1] + "</option>";
                                });
                                eleperson += "</select>";

                                $("#sublistperson").html(eleperson);

                            });
                            //alert('list');

                        }
                        function setSelectedValue(selectObj, valueToSet) {
                            for (var i = 0; i < selectObj.options.length; i++) {
                                if (selectObj.options[i].text === valueToSet) {
                                    selectObj.options[i].selected = true;
                                    return;
                                }
                            }
                        }
                        $("#mobile").on('keyup change', function () {

                            $.post('../JsonGuest', {
                                mobile: $(this).val()
                            }, function (response) {
                                if (response.id !== undefined) {
                                    $("#name").val(response.name);
                                    $("#address").val(response.address);
                                    $("#name").val(response.name);
                                    $("#sex").val(response.sex);
                                    $("#category").val(response.id.substring(0, 2));
                                    $("#city").val(response.city);
                                    $("#mail").val(response.mail);


                                }

                            });
                        });
                    });
                    $(document).ready(function () {
                        $("form").submit(function () {

                            flag = 0;
                            $(".check").each(function (index) {
                                if ($(this).val() === '')
                                {
                                    $(this).focus();
                                    $(this).css({"border-color": "#9ecaed",
                                        "box-shadow": " 0 0 10px #9ecaed"});
                                    flag = 1;
                                } else {
                                    $(this).css({"border-color": "",
                                        "box-shadow": ""});
                                }

                                //  console.log(index + ": " + $( this ).val());
                            });
                            if (flag === 1)
                            {
                                alert("Please Fill all Mandatory Fields");
                                return false;
                            }
                        });
                    });

                </script>



            </header>


            <center>
                <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">



                            <div id ="manual">


                                <br>
                                <br>
                                <form method="post" action="guest.jsp" >
                                    <label> Guest Id :</label><input type="text" style="background: white" id="guestid" name="search">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="submit" class="button" id="submit" value="Submit" />
                                </form>
                                <br><br></div>


                            <input  type="button"  id="submit" class="guest" value="New Guest" />
                            <%
                                String id = request.getParameter("search");
                                Connection con = null;
                                Statement stmt = null;
                                if (request.getParameter("search") != null) {
                                    Guest g = Guest.getById(id);
                                    if (g.getId() != null) {
                            %>
                            <div id="old">
                                <table>
                                    <tr><td rowspan="7">
                                            <%
                                                FileInputStream input = new FileInputStream(new File(Base.path + "/reception/" + g.getId() + ".jpg"));
                                                File op = new File("./guest.jpg");
                                                //op.createNewFile();
                                                FileOutputStream output = new FileOutputStream(new File(getServletContext().getRealPath("") + "/guest.jpg"));
                                                int b;
                                                while ((b = input.read()) != -1) {
                                                    output.write(b);
                                                }

                                            %>
                                            <img src="../guest.jpg" height="95px" onerror="this.onerror=null;this.src='../images/face.jpg';" />


                                        </td></tr>

                                    <tr><td>
                                            <label>Category : </label><select name="category"  style="background: white" disabled>
                                                <option value=""><%=Find.category(g.getId())%></option>

                                            </select>
                                        </td></tr>
                                    <tr><td>
                                            <label>Name : </label><input type="text" value="<%=g.getName()%>" style="background: white" id="name" name="gname" disabled>
                                        </td></tr>

                                    <tr><td>
                                            <label>Sex : </label><input type="text" value="<%=g.getSex()%>" style="background: white" id="name" name="gname" disabled>
                                        </td></tr>
                                    <tr><td>
                                            <label class="textarea" style="width:150px;">Address :<textarea  disabled style="background: white;position: relative;left: 150px;"  name="address" rows="5" cols="20"><%=g.getAddress()%></textarea> </label>
                                        </td></tr>

                                    <tr><td>
                                            <label>City : </label><input type="text" value="<%=g.getCity()%>" disabled style="background: white" id="city" name="city">
                                        </td></tr>
                                    <tr><td>
                                            <label>Mobile : </label><input type="text" value="<%=g.getMobile()%>" disabled style="background: white" id="mobile" name="mobile">
                                        </td></tr>
                                    <tr><td>
                                            <label>Mail : </label><input type="text" value="<%=g.getMail()%>" disabled style="background: white" id="mail" name="mail">
                                        </td></tr>



                                    <tr><td>
                                            <label>Date & Time : </label><input disabled type="text" style="background: white" id="mail" value="<%=new Date()%>" disabled >
                                        </td></tr>                
                                </table>

                                <form id="submitform" action="../addEntry" method="post">

                                    <input type="hidden" class="button" name="rollno" value="<%=id.toUpperCase()%>">
                                    <input type="hidden" class="button" value=""  name="entry" >

                                    <input type="submit" value="IN" class="button" id="submit">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="submit" value="OUT" class="button" id="submit">


                                </form>
                            </div>
                            <%
                                    }
                                }
                            %>
                            <br><br>
                            <div id="newguest">
                                <form method="post" id="submitform" action="${pageContext.request.contextPath}/GuestEntry" >
                                    <table>
                                        <tr><td rowspan="7">
                                                <video id="video" width="200" height="120" autoplay></video><br><br>
                                                <button id="snap" onclick="return false;">Snap Photo</button>
                                                <button id="resnap" onclick="return false;">Re Snap</button>
                                                <canvas id="canvas" width="200" height="120"></canvas>
                                                <!--  <img src="../images/face.jpg" height="120px"  /> -->

                                            </td></tr>
                                        <tr><td>
                                                <label>Mobile : </label><input  class="check" type="text" style="background: white" id="mobile" name="mobile">
                                            </td></tr>
                                        <tr><td>
                                                <label>Category : </label><select id="category" class="check" name="category" style="background: white">
                                                    <option value="">Select</option>
                                                    <option value="AD">Admission</option>
                                                    <option value="VE">Vendor</option>
                                                    <option value="VI">Visitor</option>
                                                    <option value="AL">Alumni</option>
                                                    <option value="PA">Parent</option>
                                                    <option value="LG">Guardian</option>
                                                    <option value="DR">Driver</option>


                                                </select>
                                            </td></tr>
                                        <tr><td>
                                                <label>Name : </label><input type="text" id="name" class="check" style="background: white"  name="gname">
                                            </td></tr>
                                        <tr><td>
                                                <label>Gender : </label><select   style="background: white" id="sex" name="sex">
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>

                                                </select>
                                            </td></tr>
                                        <tr><td>
                                                <label class="textarea" style="width:150px;">Address :<textarea class="check" style="background: white;position: relative;left: 150px;" id="address" name="address" rows="5" cols="20"></textarea> </label>
                                            </td></tr>

                                        <tr><td>
                                                <label>City : </label><input type="text" style="background: white" class="check" id="city" name="city">
                                            </td></tr>

                                        <tr><td>
                                                <label>Mail : </label><input type="text" style="background: white" class="" id="mail" name="mail">
                                            </td></tr>

                                        <tr><td>
                                                <label>Whom do you want to meet ?  </label><select class="check" id="meet" name="person">
                                                    <option value="">Select</option>
                                                    <option value="HOD">HOD</option>
                                                    <option value="Staff">Staff</option>
                                                    <option value="Student">Student</option>
                                                    <option value="Chairman">Chairman</option>
                                                    <option value="Director">Director</option>
                                                    <option value="CEO">CEO</option>
                                                    <option value="Principal">Principal</option>
                                                    <option value="Manager">Manager</option>
                                                    <option value="Year I/C">Year I/C</option>
                                                    <option value="Exam Controller">Exam Controller</option>
                                                    <option value="Purchase Committee">Purchase Committee</option>
                                                    <option value="ABHS">ABHS</option>
                                                    <option value="R&D">R&D</option>
                                                    <option value="Office">Office</option>



                                                </select>
                                            </td>
                                            <td>
                                                <div id="sublist"></div>

                                            </td> <td>
                                                <div id="sublistbatch"></div>

                                            </td>
                                            <td>
                                                <div id="sublistperson"></div>

                                            </td>
                                        </tr>
                                        <tr><td>
                                                <label>No of People : </label><input class="check" type="text" style="background: white" id="numpeople" name="numpeople">
                                            </td></tr>
                                        <tr><td>
                                                <label>Reason : </label><input class="check" type="text" style="background: white" id="reason" name="reason">
                                            </td></tr>

                                        <tr><td>
                                                <label>Date & Time : </label><input type="text" style="background: white" id="mail" value="<%=new Date()%>" disabled >
                                            </td></tr>                
                                    </table>

                                    <input type="hidden" class="button" value=""  name="entry" >

                                    <input type="submit" value="IN" class="button" id="submit">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <input type="submit" value="OUT" class="button" id="submit">

                                </form>

                            </div>
                        </div>



                    </div></div></section>



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
            } else {
                response.sendRedirect("../index.jsp");
            }
        }

        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            connn.close();
        } else {
            response.sendRedirect("../index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->
</html>
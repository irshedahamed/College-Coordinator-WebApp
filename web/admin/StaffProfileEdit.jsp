
<%@page import="Actor.Staff"%>
<%@page import="Downloads.Department"%>
<%@page import="Downloads.Exam"%>
<%@page import="Downloads.Circular"%>
<%@page import="Downloads.College"%>
<%@page import="com.action.Base"%>
<%@page import="com.action.Find"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en-US">
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/main.css">

        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../../css/sky-forms.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">

        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>


        <link rel="stylesheet" href="../css/angular-material.css">

        <link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">


        <link rel="stylesheet" href="../css/angulartab.css">

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
        <script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>

        <script src="../js/angulartab.js"></script>
    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
        </div>


        <header id="page-header"  class="fixed-header">

            <div id="page-header-inner">

                <div id="header-container">
                    <div class="container clearfix">
                        <div id="main-logo">
                            <a href="#">
                                <img src="../images/sjit.png"  height="70px"></a>
                        </div>







                        <nav id="main-nav">
                            <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>
                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Academics</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
                                            </ul>
                                        </li>

                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="course.jsp">Course</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="">Subjects</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectAdd.jsp">Subject Add</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Subject View</a>
                                                    <ul class="sub-menu">
                                                        <% for (String dept : Find.Depts) {%>
                                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SubjectView.jsp?dept=<%=dept%>"><%=dept.toUpperCase()%></a>
                                                        <%}%> </ul></li>
                                            </ul></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="feedetails.jsp">Fee Details</a></li>
                                    </ul>
                                </li>

                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Students</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="studentprofiles.jsp">Profile</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileupdate.jsp">Add Profile</a>

                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profileedit.jsp">Update Profile</a>

                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="profiledelete.jsp">Delete Profile</a>
                                            </ul></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="studentpasswords.jsp">Passwords</a>

                                        </li>
                                    </ul>
                                </li>

                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768  current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Staff</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Profile</a>
                                            <ul class="sub-menu">
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofileupdate.jsp">Add Profile</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofiledelete.jsp">Delete Profile</a>
                                                <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="StaffProfileEdit.jsp">Edit Profile</a>       
                                            </ul></li>


                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffpasswords.jsp">Passwords</a></li>

                                    </ul>
                                </li>

                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">SMS</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="generalsms.jsp">General</a></li>

                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="absentieessms.jsp">Absentiees</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="marksms.jsp">Mark</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffsms.jsp">Staff</a></li>

                                    </ul>
                                </li>
                                <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Email</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="sendemail.jsp">Send Email</a></li>

                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="emailstatus.jsp">View Email Status</a>

                                        </li>
                                    </ul>

                                <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="circularupload.jsp">Circular Uploads</a>
                                <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Forms</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formupload.jsp">Form Upload</a></li>

                                        <li id="menu-item-765" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="formmanage.jsp">Manage</a></li>

                                    </ul>
                                </li>


                                <li id="menu-item-769" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="#">Reports</a>
                                    <ul class="sub-menu">
                                        <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="PasswordReport.jsp">Password</a></li>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="AddressReport.jsp">Address</a>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="verificationReport.jsp">Verification</a>
                                        <li id="menu-item-765" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor current-menu-parent menu-item-has-children menu-item-765"><a href="BoardingptReport.jsp">Boarding Point</a>


                                        </li>
                                    </ul>

                            </ul>


                        </nav>
                    </div>
                </div>
            </div>
        </header>
        <style>td {
                padding: 10px;
            }
            label {
                display: inline-block;
                width: 140px;
                text-align: right;
            }
        </style>

    <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                    <br><br>
                    <form method="post" action="StaffProfileEdit.jsp" >
                        <center> <label> Staff ID :</label><input type="text" style="background: white" id="rollno" name="search"></center>
                        <div align="center">
                            <br><br>
                            <input type="submit" id="submit" value="Submit" />
                            <br><br></div></form>
                            <%
                                if (request.getParameter("search") != null) {
                                    String id = request.getParameter("search");
                                    Staff s1=Staff.getByid(id);
                                    //Connection connection = new dbcon().getConnection(Find.sdept(id));
                                   // Statement statement = connection.createStatement();
                                   // ResultSet rs11 = statement.executeQuery("select * from staff_general where staffid='" + id + "'");
                                  //   if (rs11.next()) {
                            %>

                    <img style="position:absolute;left: 1000px;top:250px;" src="../../StaffPhotos/<%=id.toUpperCase()%>.JPG" height="120px" onerror="this.onerror=null;this.src='../images/face.jpg';" />

                    <center> <form method="post" name="general" action="${pageContext.request.contextPath}/StaffProfileEdit">

                            <center><h3>General Details</h3></center>


                            <table cellspacing="10">
                                <tr>
                                    <td>

                                        <label> Staff ID :</label> <input type="text" style="background: white" id="rollno"  value="<%=s1.getId()%>" disabled >
                                        <input type="hidden" name="rollno" value="<%=s1.getId()%>">
                                    </td>

                                    <td>
                                        <% 
                                            String[] name = s1.getName().split(".");
                                        
                                        %>

                                        <label>Title :</label> <input type="text" style="background: white" name="title"  value="<%=name[0]%>" >
                                    </td>
                                    <td>
                                        <label> Name :</label><input type="text" style="background: white" id="name" name="name" value="<%=name[1]%>">
                                    </td>
                                    <td><label>Designation :</label><input type="text" style="background: white" id="desg" name="desg" value="<%=s1.getDesg()%>">
                                    </td>

                                </tr>
                                <tr>
                                <br>
                                <td>
                                    <label>Date of Joining :</label><input type="date" style="background: white" id="doj" name="doj" value="<%=s1.getDoj()%>">
                                </td>

                                <td>
                                    <label>Gender :</label><input type="text" style="background: white" id="gender" name="gender" value="<%=s1.getSex()%>">
                                </td>


                                <td>
                                    <label>Address 1 :</label><input type="text" style="background: white" id="add1" name="add1" value="<%=s1.getAdd1()%>">
                                </td>
                                <td>
                                    <label>Address 2 :</label><input type="text" style="background: white" id="add2" name="add2" value="<%=s1.getAdd2()%>">
                                </td>
                                </tr>
                                <tr>


                                    <td>
                                        <label> City :</label> <input type="text" style="background: white" id="city" name="city" value="<%=s1.getCity()%>">
                                    </td>
                                    <td>
                                        <label>State :</label><input type="text" style="background: white" id="state" name="state" value="<%=s1.getState()%>">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text" style="background: white" id="pincode" name="pincode" value="<%=s1.getPincode()%>">
                                    </td>

                                    <td>
                                        <label>Permanent Address 1 :</label><input type="text" style="background: white" id="padd1" name="padd1" value="<%=s1.getPadd1()%>">
                                    </td>

                                </tr>

                                <tr>
                                    <td>
                                        <label>Permanent Address 2 :</label><input type="text" style="background: white" id="padd2" name="padd2" value="<%=s1.getPadd2()%>">
                                    </td>

                                    <td>
                                        <label>Permanent City :</label><input type="text" style="background: white" id="pcity" name="pcity" value="<%=s1.getPcity()%>">
                                    </td>
                                    <td>
                                        <label>Permanent State :</label><input type="text" style="background: white" id="pstate" name="pstate" value="<%=s1.getPstate()%>">
                                    </td>
                                    <td>
                                        <label>Permanent Pin Code :</label><input type="text" style="background: white" id="ppincode" name="ppincode" value="<%=s1.getPpincode()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Contact Number 1 :</label><input type="text" style="background: white" id="mobile1" name="mobile1" value="<%=s1.getMobile1()%>">
                                    </td>
                                    <td>
                                        <label>Contact Number 2 :</label><input type="text" style="background: white" id="mobile2" name="mobile2" value="<%=s1.getMobile2()%>">
                                    </td> 
                                    <td>
                                        <label>E-mail ID :</label><input type="text" style="background: white" id="email" name="email" value="<%=s1.getEmail()%>">
                                    </td>
                                    <td>
                                        <label>Land line Number :</label><input type="text" style="background: white" id="ll" name="ll" value="<%=s1.getLl()%>">
                                    </td>
                                </tr>
                            </table>
                            <input type="hidden" name="formtype" value="general">


                            <div align="right">
                                <input type="submit" id="submit" value="Submit" /></div>
                            <br><br>
                        </form></center>
                    

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


<script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html>
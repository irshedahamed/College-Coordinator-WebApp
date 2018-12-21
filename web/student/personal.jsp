<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
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
        <link href="../css/tablecs.css" rel="stylesheet">
        <!-- Custom CSS -->
        <link href="../css/simple-sidebar.css" rel="stylesheet">


    </head>


    <%                                  //       Connection conection = new dbcon().getConnection(Find.sdept(username));
        // Statement st1 = conection.createStatement();
        String batch = "", name = "", rollno = "", course = "", sec = "";
        Student s1 = Student.getById(username);
        //ResultSet rs1 = st1.executeQuery("select * from student_personal where rollno='"+username+"'");
        //if(rs1.next())
        //{
        name = s1.getName();
        rollno = s1.getId();
        course = s1.getCourse();
        sec = s1.getSec();
        batch = s1.getBatch();

        //}
        //if(st1!=null)
        //                    st1.close();
        //                    if(conection!=null)
        //                      conection.close();

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

                    <li >


                        <a href="#"><b>NAME : <%=name%></b></a>
                    </li>
                    <li>
                        <a href="#"><b>ROLL NO : <%=rollno%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>COURSE : <%=course%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>DEPT : <%=Find.sdept(username)%></b></a>
                    </li>
                    <li >
                        <a href="#"><b>SECTION : <%=sec%></b></a>
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
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
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


                        <div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PERSONAL DETAILS</b></font></center><br><br>
                                            <%
                                                try {

                                                    String departmentname =  s1.getDept();
                                                    //Connection connection = new dbcon().getConnection(departmentname);
                                                    //Statement statement = connection.createStatement();
                                                    //ResultSet rs= statement.executeQuery("select * from student_personal where rollno='"+username+"'");
                                                    String regno = "", initial = "", dept = "", gender = "", food = "", mobileno = "", mailid = "", bldgrp = "", accomodation = "";

                                                    //while(rs.next())
                                                    //{
                                                    rollno = s1.getId();
                                                    regno = s1.getRegno();
                                                    name = s1.getName();

                                                    course = s1.getCourse();
                                                    sec = s1.getSec();
                                                    dept = s1.getDept();
                                                    gender = s1.getSex();
                                                    food = s1.getFood();
                                                    mobileno = s1.getMobile();
                                                    mailid = s1.getMailid();
                                                    bldgrp = s1.getBloodgrp();
                                                    batch = s1.getBatch();
                                                    accomodation = s1.getAccomodation();
                                                    //}
%>   
                                        <center> <br>
                                            <TABLE WIDTH=30% align ="center" border="1">


                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Roll No</b></TD>
                                                    <TD><font size="3px"><%=rollno%></font></TD>
                                                </TR>

                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Register No</b></TD>
                                                    <TD><font size="3px"><%=regno%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Name </b></font></TD>
                                                    <TD><font size="3px"><%= name%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Gender</b></font></TD>
                                                    <TD><font size="3px"><%= gender%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Blood Group</b></font></TD>
                                                    <TD><font size="3px"><%= bldgrp%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Batch</b></font></TD>
                                                    <TD><font size="3px"><%= batch%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Course</b></font></TD>
                                                    <TD><font size="3px"><%= course%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Department</b></font></TD>
                                                    <TD><font size="3px"><%= dept%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Section</b></font></TD>
                                                    <TD><font size="3px"><%= sec%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Mobile No.</b></font></TD>
                                                    <TD><font size="3px"><%= mobileno%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Mail ID</b></font></TD>
                                                    <TD><font size="3px"><%= mailid%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>food</b></font></TD>
                                                    <TD><font size="3px"><%= food%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Accomodation</b></font></TD>
                                                    <TD><font size="3px"><%= accomodation%></font></TD>
                                                </TR>



                                            </TABLE>
                                        </center>
                                    </div>
                                </div>



                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>FATHER DETAILS</b></font><br><br><br>
                                            <%
                                                //ResultSet rs11= statement.executeQuery("select * from student_father_details where rollno='"+username+"'");
                                                String fname = "", fqual = "", foccu = "", faddress = "", fdesig = "", fmail = "", fland = "", fmobile = "";

                                                //while(rs11.next())
                                                //{
                                                rollno = s1.getId();

                                                fname = s1.getFatherDetails().getFathername();
                                                fland = s1.getFatherDetails().getLandline();
                                                fmobile = s1.getFatherDetails().getMobile();
                                                faddress = s1.getFatherDetails().getAddress();
                                                fqual = s1.getFatherDetails().getQualification();
                                                foccu = s1.getFatherDetails().getOccupation();
                                                fdesig = s1.getFatherDetails().getDesig();
                                                fmail = s1.getFatherDetails().getMail();

                                                //	}

                                            %>   
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Father's Name</b></font></TD>
                                                    <TD><font size="3px"><%= fname%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Qualification</b></font></TD>
                                                    <TD><font size="3px"><%= fqual%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Occupation</b></font></TD>
                                                    <TD><font size="3px"><%= foccu%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Designation</b></font></TD>
                                                    <TD><font size="3px"><%= fdesig%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Address </b></font></TD>
                                                    <TD><font size="3px"><%= faddress%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Land Line</b> </font></TD>
                                                    <TD><font size="3px"><%= fland%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Mobile</b> </font></TD>
                                                    <TD><font size="3px"><%= fmobile%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Mail ID</b></font></TD>
                                                    <TD><font size="3px"><%= fmail%></font></TD>
                                                </TR>

                                            </TABLE></center></div></div>
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>MOTHER DETAILS</b></font><br><br><br>
                                            <%
                                                //ResultSet rs12= statement.executeQuery("select * from student_mother_details where rollno='"+username+"'");
                                                String mname = "", mqual = "", moccu = "", maddress = "", mdesig = "", mmail = "", mland = "", mmobile = "";

                                                //while(rs12.next())
                                                //{
                                                rollno = s1.getId();

                                                mname = s1.getMotherDetails().getMothername();
                                                mland = s1.getMotherDetails().getLandline();
                                                mmobile = s1.getMotherDetails().getMobile();
                                                maddress = s1.getMotherDetails().getAddress();
                                                mqual = s1.getMotherDetails().getQualification();
                                                moccu = s1.getMotherDetails().getOccupation();
                                                mdesig = s1.getMotherDetails().getDesig();
                                                mmail = s1.getMotherDetails().getMail();

                                                //	}

                                            %>   
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Mother's Name</b></font></TD>
                                                    <TD><font size="3px"><%= mname%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Qualification</b></font></TD>
                                                    <TD><font size="3px"><%= mqual%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Occupation</b></font></TD>
                                                    <TD><font size="3px"><%= moccu%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Designation</b></font></TD>
                                                    <TD><font size="3px"><%= mdesig%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Address </b></font></TD>
                                                    <TD><font size="3px"><%= maddress%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Land Line </b></font></TD>
                                                    <TD><font size="3px"><%= mland%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Mobile</b></font> </TD>
                                                    <TD><font size="3px"><%= mmobile%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Mail ID</b></font></TD>
                                                    <TD><font size="3px"><%= mmail%></font></TD>
                                                </TR>

                                            </TABLE>
                                        </center></div></div>


                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>LOCAL GUARDIAN DETAILS</b></font><br><br><br>
                                            <%
                                                //rs11= statement.executeQuery("select * from student_local_guardian where rollno='"+username+"'");
                                                String lname = "", lphno = "", ldoorno = "", lstreet = "", larea = "", lcity = "", lpincode = "";
                                                //while(rs11.next())
                                                //{
                                                lname = s1.getLocalGuardian().getName();
                                                lphno = s1.getLocalGuardian().getPhonenum();
                                                ldoorno = s1.getLocalGuardian().getDoorno();
                                                lstreet = s1.getLocalGuardian().getStreet();
                                                larea = s1.getLocalGuardian().getArea();
                                                lcity = s1.getLocalGuardian().getCity();
                                                lpincode = s1.getLocalGuardian().getPincode();

                                                //	}

                                            %>   
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Name</b></font></TD>
                                                    <TD><font size="3px"><%= lname%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Phone Number</b></font></TD>
                                                    <TD><font size="3px"><%= lphno%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Door Number</b></font></TD>
                                                    <TD><font size="3px"><%= ldoorno%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>Street name</b></font></TD>
                                                    <TD><font size="3px"><%= lstreet%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Area </b></font></TD>
                                                    <TD><font size="3px"><%= larea%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><font size="3px"><b>City</b> </font></TD>
                                                    <TD><font size="3px"><%= lcity%></font></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><font size="3px"><b>Pin code</b> </font></TD>
                                                    <TD><font size="3px"><%= lpincode%></font></TD>
                                                </TR>

                                            </TABLE></center></div></div>

                            </div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li></ul></div>
                    </div></div></section>
                    <%
                        } catch (Exception e) {
                            System.out.println(e);
                        }
                    %>

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
            ilass("toggled");
        });
    </script>


    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

<!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

</html>
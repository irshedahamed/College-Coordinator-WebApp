<%@page import="Actor.Student"%>
<%@page import="Actor.Student.Admission"%>
<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<%@page import="java.sql.Connection"%>
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

    <%                    String batch = "", name = "", rollno = "", course = "", sec = "";

        Student s2 = Student.getById(username);
        name = s2.getById(username).getName();
        rollno = s2.getById(username).getId();
        course = s2.getById(username).getCourse();
        sec = s2.getById(username).getSec();
        batch = s2.getById(username).getBatch();


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
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812 "><a href="personal.jsp">Personal Details</a></li>

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
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>ADMISSION DETAILS</b></font><br><br>
                                            <%
                                                // String departmentname= session.getAttribute("deptname").toString();

                                                Student a1 = Student.getById(username);
                                                String doa = "", admall = "", govt_mang = "", ovrallrank = "", cmtyrank = "", sprtsad = "", moi = "", gamename = "";

                                                rollno = a1.getId();

                                                doa = a1.getAdmissionDetails().getDoa();
                                                admall = a1.getAdmissionDetails().getAllotment();
                                                govt_mang = a1.getAdmissionDetails().getGovt_mang();

                                                ovrallrank = a1.getAdmissionDetails().getOrank();
                                                cmtyrank = a1.getAdmissionDetails().getCrank();
                                                sprtsad = a1.getAdmissionDetails().getSport();
                                                moi = a1.getAdmissionDetails().getMoi();
                                                gamename = a1.getAdmissionDetails().getGname();


                                            %>   




                                            <center><br>
                                                <TABLE WIDTH=30% align ="center" border="1">
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b> Date of admission</b></font></TD>
                                                        <TD><font size="2px"><%= doa%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Admission allotment</b></font></TD>
                                                        <TD><font size="2px"><%= admall%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Government/management</b></font></TD>
                                                        <TD><font size="2px"><%= govt_mang%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Overall Rank</b></font></TD>
                                                        <TD><font size="2px"><%= ovrallrank%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Community rank</b></font></TD>
                                                        <TD><font size="2px"><%= cmtyrank%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Sports Admission</b></font></TD>
                                                        <TD><font size="2px"><%= sprtsad%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Game Name</b></font></TD>
                                                        <TD><font size="2px"><%= gamename%></font></TD>
                                                    </TR><TR class="defaultText">
                                                        <TD><font size="2px"><b>Medium of Instruction</b></font></TD>
                                                        <TD><font size="2px"><%= moi%></font></TD>
                                                    </TR>


                                                </TABLE>
                                            </center>
                                    </div>
                                </div>

                                <div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>GENERAL DETAILS</b></font><br><br><br>
                                            <%

                                                String dob = "", caste = "", community = "", religion = "", nationality = "", mothertongue = "", memberof = "", annualincome = "";

                                                rollno = a1.getId();

                                                dob = a1.getGeneral().getDob();
                                                caste = a1.getGeneral().getCaste();
                                                community = a1.getGeneral().getCommunity();
                                                annualincome = a1.getGeneral().getParentincome();
                                                religion = a1.getGeneral().getReligion();
                                                nationality = a1.getGeneral().getNationality();
                                                mothertongue = a1.getGeneral().getMothertongue();
                                                memberof = a1.getGeneral().getClub();

                                            %>   
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <TR class="defaultText odd-row">
                                                    <TD><font size="3px"><b>Date of Birth</b></font></TD>
                                                    <TD><font size="3px"><%= dob%></font></TD>
                                                </TR>
                                                <TR class="defaultText">
                                                    <TD><font size="3px"><b>Caste</b></font></TD>
                                                    <TD><font size="3px"><%= caste%></font></TD>
                                                </TR>
                                                <TR class="defaultText odd-row">
                                                    <TD><font size="3px"><b>Community</b></font></TD>
                                                    <TD><font size="3px"><%= community%></font></TD>
                                                </TR>
                                                <TR class="defaultText ">
                                                    <TD><font size="3px"><b>Parents Annual Income</b></font></TD>
                                                    <TD><font size="3px"><%= annualincome%></font></TD>
                                                </TR>
                                                <TR class="defaultText odd-row">
                                                    <TD><font size="3px"><b>Religion</b></font></TD>
                                                    <TD><font size="3px"><%= religion%></font></TD>
                                                </TR>
                                                <TR class="defaultText ">
                                                    <TD><font size="3px"><b>Nationality</b></font></TD>
                                                    <TD><font size="3px"><%= nationality%></font></TD>
                                                </TR>
                                                <TR class="defaultText odd-row">
                                                    <TD><font size="3px"><b>Mother Tongue</b></font></TD>
                                                    <TD><font size="3px"><%= mothertongue%></font></TD>
                                                </TR>
                                                <TR class="defaultText">
                                                    <TD><font size="3px"><b>Member of( NSS/ YRC/NCC/Others)</b></font></TD>
                                                    <TD><font size="3px"><%= memberof%></font></TD>
                                                </TR>


                                            </TABLE><br></center></div></div>
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>OTHERS DETAILS</b></font><br><br><br>
                                            <%

                                                //ResultSet rs4= statement.executeQuery("select * from student_other_details where rollno="+"'"+username+"'");
                                                String tfoi = "", instname = "", prev_addr = "", group = "", yearadm = "", yearrelif = "", coursecomp = "", boardofstudy = "";
                                                String medium = "", reason = "";

                                                rollno = a1.getId();

                                                tfoi = a1.getOtherDetails().getTransferfrom();
                                                instname = a1.getOtherDetails().getInstname();
                                                prev_addr = a1.getOtherDetails().getPrevaddress();
                                                group = a1.getOtherDetails().getGroup();
                                                yearadm = a1.getOtherDetails().getYearofadmission();
                                                yearrelif = a1.getOtherDetails().getYearrelif();
                                                coursecomp = a1.getOtherDetails().getCourse_completed_in_time();
                                                boardofstudy = a1.getOtherDetails().getBoard();
                                                medium = a1.getOtherDetails().getMedium();
                                                reason = a1.getOtherDetails().getReasonfordiscontinue();


                                            %>   


                                            <center><br>
                                                <TABLE WIDTH=30% align ="center" border="1">
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Transferred from other Institution</b></font> </TD>
                                                        <TD><font size="2px"><%= tfoi%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Institution Name</b></font></TD>
                                                        <TD><font size="2px"><%= instname%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Address </b></font></TD>
                                                        <TD><font size="2px"><%= prev_addr%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Group</b></font></TD>
                                                        <TD><font size="2px"><%= group%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Year & Month of Admission</b></font></TD>
                                                        <TD><font size="2px"><%= yearadm%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Year & Month of Relief</b></font></TD>
                                                        <TD><font size="2px"><%= yearrelif%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Course completed in time</b></font></TD>
                                                        <TD><font size="2px"><%= coursecomp%></font></TD>
                                                    </TR><TR class="defaultText">
                                                        <TD><font size="2px"><b>Board </b></font></TD>
                                                        <TD><font size="2px"><%= boardofstudy%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Medium of Study </b></font></TD>
                                                        <TD><font size="2px"><%= medium%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Reason for Discontinuation</b></font></TD>
                                                        <TD><font size="2px"><%= reason%></font></TD>
                                                    </TR>


                                                </TABLE><br></center></div></div>
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>ACADEMIC DETAILS</b></font><br><br><br>
                                            <%
                                                //ResultSet rs13= statement.executeQuery("select * from student_academic_details where rollno="+"'"+username+"'");

                                                String tenscl;
                                                String tenmark;
                                                String tenboard;
                                                String tenmed;
                                                String tenyop;
                                                String twlscl;
                                                String twlmark;
                                                String twlboard;
                                                String twlmed;
                                                String twlyop;
                                                String dipcol;
                                                String dipmark;
                                                String dipboard;
                                                String dipmed;
                                                String dipyop;

                                                rollno = a1.getId();
                                                tenscl = a1.getAcademic().getTenthschool();
                                                tenmark = a1.getAcademic().getTenthmark();
                                                tenboard = a1.getAcademic().getTenthboard();
                                                tenmed = a1.getAcademic().getTenthmedium();
                                                tenyop = a1.getAcademic().getTenthyearofpass();
                                                twlscl = a1.getAcademic().getTwelfthschool();
                                                twlmark = a1.getAcademic().getTwelfthmark();
                                                twlboard = a1.getAcademic().getTwelfthboard();
                                                twlmed = a1.getAcademic().getTwelfthmedium();
                                                twlyop = a1.getAcademic().getTwelfthyearofpass();
                                                dipcol = a1.getAcademic().getDiplomaclg();
                                                dipmark = a1.getAcademic().getDiplomamark();
                                                dipboard = a1.getAcademic().getDiplomaboard();
                                                dipmed = a1.getAcademic().getDiplomamedium();
                                                dipyop = a1.getAcademic().getDiplomayearofpass();

                                            %>   


                                            <center><br>
                                                <TABLE WIDTH=30% align ="center" border="1">
                                                    <TR class="defaultText">
                                                        <TD colspan="2"><center><font size="2px" ><b>Tenth</b></font></center></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Tenth School</b></font></TD>
                                                        <TD><font size="2px"><%= tenscl%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Percentage</b></font></TD>
                                                        <TD><font size="2px"><%=tenmark%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Board</b></font></TD>
                                                        <TD><font size="2px"><%= tenboard%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Medium of Instruction</b></font></TD>
                                                        <TD><font size="2px"><%=tenmed%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Year of Passing</b></font></TD>
                                                        <TD><font size="2px"><%= tenyop%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD colspan="2"><center><font size="2px" ><b>Twelfth</b></font></center></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Twelfth School</b></font></TD>
                                                        <TD><font size="2px"><%=twlscl%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Percentage</b></font></TD>
                                                        <TD><font size="2px"><%=twlmark%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Board</b></font></TD>
                                                        <TD><font size="2px"><%= twlboard%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Medium of Instruction</b></font></TD>
                                                        <TD><font size="2px"><%=twlmed%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Year of Passing</b></font></TD>
                                                        <TD><font size="2px"><%= twlyop%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText">
                                                        <TD colspan="2"><center><font size="2px" ><b>Diploma</b></font></center></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Diploma College</b></font></TD>
                                                        <TD><font size="2px"><%=dipcol%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Percentage</b></font></TD>
                                                        <TD><font size="2px"><%=dipmark%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Board</b></font></TD>
                                                        <TD><font size="2px"><%= dipboard%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Medium of Instruction</b></font></TD>
                                                        <TD><font size="2px"><%=dipmed%></font></TD>
                                                    </TR>

                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Year of Passing</b></font></TD>
                                                        <TD><font size="2px"><%= dipyop%></font></TD>
                                                    </TR>


                                                </TABLE></center></div></div>

                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PASSPORT DETAILS</b></font><br><br><br>
                                            <%
                                                //ResultSet rs8= statement.executeQuery("select * from student_passport_details where rollno="+"'"+username+"'");

                                                String forgn = "", passno = "", doexp = "";

                                                rollno = a1.getId();

                                                doexp = a1.getPassport().getDoe();
                                                forgn = a1.getPassport().getForgn();
                                                passno = a1.getPassport().getPassno();

                                            %>   
                                            <br>
                                            <center> <br>
                                                <TABLE WIDTH=30% align ="center" border="1">
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b> Foreign student</b></font></TD>
                                                        <TD><font size="2px"><%= forgn%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Passport No.</b></font></TD>
                                                        <TD><font size="2px"><%= passno%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Date of Expiry</b></font></TD>
                                                        <TD><font size="2px"><%= doexp%></font></TD>
                                                    </TR>


                                                </TABLE></center></div></div>
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>VISA DETAILS</b></font><br><br><br>
                                            <%
                                                //ResultSet rs6= statement.executeQuery("select * from student_visa_details where rollno="+"'"+username+"'");
                                                String visano = "", typeofvisa = "", doe = "";

                                                rollno = a1.getId();

                                                doe = a1.getVisa().getDoe();
                                                visano = a1.getVisa().getVisano();
                                                typeofvisa = a1.getVisa().getType();

                                            %> <br>
                                            <center><br>		  
                                                <TABLE WIDTH=30% align ="center" border="1">
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>VISA No.</b><font></TD>
                                                        <TD><font size="2px"><%= visano%><font></TD>
                                                    </TR>
                                                    <TR class="defaultText">
                                                        <TD><font size="2px"><b>Type of visa</b><font></TD>
                                                        <TD><font size="2px"><%= typeofvisa%></font></TD>
                                                    </TR>
                                                    <TR class="defaultText odd-row">
                                                        <TD><font size="2px"><b>Date of expiry</b><font></TD>
                                                        <TD><font size="2px"><%= doe%></font></TD>
                                                    </TR>


                                                </TABLE></center><br></div></div>
                                            </div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a><li><a href="#">6</a></li></ul></div>
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
                            ilass("toggled");
                        });
                    </script>


                    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script></body>

                    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:07:32 GMT -->

                    </html>
<%@page import="java.util.List"%>
<%@page import="Actor.Staff"%>
<%@page import="com.action.Find"%>
<%@page import="dbconnection.dbcon"%>
<!DOCTYPE html>

<%@page import="java.sql.*"%>
<html lang="en-US">
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


    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">

                <%        Connection con = new dbcon().getConnection(Find.sdept(username));
                   // Statement stmtd = con.createStatement();
                    Staff s=Staff.getByid(username);
                   //ResultSet rsd = stmtd.executeQuery("select * from staff_general where staffid='" + username + "'");
                 //   if (rsd.next()) {
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
                    <li >
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
                //if (stmtd != null) {
                  //  stmtd.close();
         //       }
                if (con != null) {
                    ;//con.close();
                }
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
                                    <li id="menu-item-764" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Profile</a>
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

                                    <li id="menu-item-777" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Marks</a>
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
           //                             Staff s = new Staff(username);
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


                        <div class="dm3-tabs-testimonials" data-autoscroll="5"><div class="dm3-tabs">
                                <div class="dm3-tab"><div class="dm3-tab-inner"><center><font size="5px"><b>PERSONAL DETAILS</b></font><br><br><br>
                                            <TABLE WIDTH=30% align ="center" border="1">
                                                <%
                                                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                    Connection connection = new dbcon().getConnection(Find.sdept(username));
                                            
                                                    //     Statement statement = connection.createStatement();
                                                 //   ResultSet rs = statement.executeQuery("select * from staff_general where staffid=" + "'" + username + "'");
                                                   // String title = "", name = "", desg = "", doj = "", gender = "", add1 = "", add2 = "", city = "", state = "", pincode = "", padd1 = "", padd2 = "";
                                                    //String pcity = "", pstate = "", ppincode = "", mobile1 = "", mobile2 = "", email = "", ll = "";
                                                    //if (rs.next()) {

                                                    
                                                    String name=s.getName();

                                                    
                                                   String     desg = s.getDesg();
                                                     String   doj = String.valueOf(s.getDoj());
                                                      String  gender = s.getSex();
                                                      String  add1 = s.getAdd1();
                                                     String   add2 = s.getAdd2();
                                                     String   city = s.getCity();
                                                      String  state = s.getState();
                                                      String  pincode = s.getPincode();
                                                       String  padd1 = s.getPadd1();
                                                      String   padd2 = s.getPadd2();
                                                       String  pcity = s.getPcity();
                                                      String  pstate = s.getPstate();
                                                      String    ppincode = s.getPpincode();
                                                      String  mobile1 = s.getMobile1();
                                                      String  mobile2 = s.getMobile2();
                                                      String  email = s.getEmail();
                                                    String    ll = s.getLl();
                                                %> 


                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Name</b></TD>
                                                    <TD><%=name%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>Designation</b></TD>
                                                    <TD><%= desg%></TD>
                                                </TR>

                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Date Of Joining</b></TD>
                                                    <TD><%= doj%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>Gender</b></TD>
                                                    <TD><%= gender%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Address</b></TD>
                                                    <TD><%= add1%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b></b></TD>
                                                    <TD><%= add2%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>City</b></TD>
                                                    <TD><%=city%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>State</b></TD>
                                                    <TD><%= state%></TD>
                                                </TR>

                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Pincode</b></TD>
                                                    <TD><%= pincode%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>Mobile</b></TD>
                                                    <TD><%= mobile1%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b></b></TD>
                                                    <TD><%= mobile2%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>LandLine</b></TD>
                                                    <TD><%= ll%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Email</b></TD>
                                                    <TD><%= email%></TD>
                                                </TR>


                                                <%
                                                    
                                                %>
                                            </TABLE> <br>
                                        </center>
                                    </div>
                                </div>


                                <div class="dm3-tab"><div class="dm3-tab-inner"><center> <font size="5px"><b>Permanent Address</b></font><br><br><br>
                                            <TABLE WIDTH=30% align ="center" border="1"><br>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Address</b></TD>
                                                      <TD><%= padd1%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b></b></TD>
                                                    <TD><%= padd2%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>City</b></TD>
                                                    <TD><%= pcity%></TD>
                                                </TR>
                                                <TR CLASS="defaultText">
                                                    <TD><b>State</b></TD>
                                                    <TD><%= pstate%></TD>
                                                </TR>
                                                <TR CLASS="defaultText odd-row">
                                                    <TD><b>Pincode</b></TD>
                                                    <TD><%= ppincode%></TD>
                                                </TR>


                                            </table><br>


                                        </center></div></div>





                                <%

 //                                   if (statement != null) {
   //                                     statement.close();
     //                               }
       //                             if (connection != null) {
         //                               connection.close();
           //                         }
                                %>
                            </div><ul class="dm3-tabs-nav"><li><a href="#">1</a></li><li><a href="#">2</a></li></ul></div>
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
<%
        } else {
            response.sendRedirect("../index.jsp");
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
</html>
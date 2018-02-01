<%-- 
    Document   : SpecialFee
    Created on : 16 Jan, 2017, 9:53:58 PM
    Author     : Home
--%>
<%@page import="com.action.Find"%>
<%@page import="Fee.BasicFee"%>
<%@page import="General.Batch"%>
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
                if (type.equals("yearincharge")) {


    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../css/main.css">

        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link href="../css/bootstrap.min.css" rel="stylesheet">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <script src="../js/jquery.js"></script>





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
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page"><a href="home.jsp">Home</a></li>







                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Attendance Report</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="attendancereport.jsp">Semester Report</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="DailyReportQuery.jsp">Daily Report</a>
                                        </ul></li>




                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="#">Update Attendance</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="updateattendance.jsp">Mark Absentees</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="editattendance.jsp">Edit</a>
                                        </ul></li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="requests.jsp">Grant OutPass</a>

                                    </li>

                                    <li id="menu-item-769" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777"><a href="sms.jsp">SMS</a>



                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="#">Fee</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="BasicFee.jsp">Basic Fee</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="SpecialFee.jsp">Individual Fee</a>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="Challan.jsp">Challan Entry</a>
                                        </ul></li>

                                    <li id="menu-item-777" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-777 "><a href="#">Student Update</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812  "><a href="sectionUpdate.jsp">Section</a>

                                        </ul></li>

                                </ul>						</nav>
                        </div>
                    </div>
                </div>


            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>
                            <section class="landing">

                                <%          /* out.println(Batch.getByYrIncharge(username).getBatch());
                                for(BasicFee b:BasicFee.getByBatch(Batch.getByYrIncharge(username).getBatch())){
                                out.println(b.getTution()  );
                                }*/
                                %>

                                <form class="sky-form" action="ChallanEntry.jsp" method="post">

                                    <header>Challan Entry</header>

                                    <fieldset>                  




                                        <label class="select">
                                            <label class="select">
                                                <div align="left" size="3px"><b>
                                                        Type: </b></div> 
                                                <select id="type" class="change" name="dept">
                                                    <option value="" >Select</option>
                                                    <%                                                                  for (String ftype : Find.Depts) {
                                                    %>
                                                    <option value="<%=ftype%>"><%=ftype.toUpperCase()%></option>
                                                    <% }
                                                    %>
                                                </select>
                                            </label> </label>
                                        <br>


                                        <input type="submit" class="button" value="Submit"  id="submit" >




                                        </div> 


                                    </fieldset>
                                    <br><br>
                                </form>


                            </section>



                        </div>

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
                                ;//connn.close();
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
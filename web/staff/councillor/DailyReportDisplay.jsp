<%@page import="java.sql.PreparedStatement"%>
<%@page import="Actor.Councillor"%>
<%@page import="Actor.Student"%>
<%@page import="Actor.Staff"%>
<%@page import="General.AcademicYear"%>
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
    <%
                    String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

    %>
    <!-- Mirrored from educator.incrediblebytes.com/ by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 13 Feb 2015 13:04:48 GMT -->
    <!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../../css/main.css">
        <link href="../../css/sky-forms.css" rel="stylesheet">
        <link href="../../css/tabledesign.css" rel="stylesheet">
        <link type="text/css" media="all" href="../../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>

        <!-- Custom CSS -->
        <link href="../../css/simple-sidebar.css" rel="stylesheet">

        <link href="../../css/bootstrap.min.css" rel="stylesheet">
        <script src="../../js/jquery.js"></script>


        <link rel="stylesheet" href="../../css/angular-material.css">

        <link rel="stylesheet" href="https://material.angularjs.org/1.1.1/docs.css">


        <link rel="stylesheet" href="../../css/angulartab.css">

        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-animate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-route.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-aria.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.5.5/angular-messages.min.js"></script>
        <script src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/t-114/svg-assets-cache.js"></script>
        <script src="https://cdn.gitcdn.link/cdn/angular/bower-material/v1.1.1/angular-material.js"></script>

        <script src="../../js/angulartab.js"></script>
    </head>

    <body class="home page page-id-115 page-template-default has-toolbar">
        <div id="wrapper" class="toggled">
            <div id="sidebar-wrapper">

                <% Connection con=new dbcon(clg).getConnection(Find.sdept(username));
    //Statement stmtd=con.createStatement();
    Staff s=Staff.getByid(username,clg);
    //ResultSet rsd=stmtd.executeQuery("select * from staff_general where staffid='"+username+"'");
    if(s!=null)
    {%>
                <ul class="sidebar-nav">
                    <li class="sidebar-brand">
                        <a href="#menu-toggle1" id="menu-toggle1">

                        </a>
                    </li>
                    <center>
                        <img src="../../images/face.jpg" height="95px">





                    </center>
                    <br>
                    <br>

                    <li>

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

            <%}
              //  if (stmtd != null) {
                //    stmtd.close();
          //      }
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
                                    <img src="../../images/sjit.png"  height="70px"></a>
                            </div>
                            <ul id="auth-nav">
                                <li>
                                    <div class="auth-nav-register">
                                        <a class="button" href="#menu-toggle" id="menu-toggle">My Details</a>
                                    </div>
                                </li>
                            </ul>







                            <nav id="main-nav">
                                <ul id="menu-main-menu" class="menu"><li id="menu-item-778" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="home.jsp">Home</a></li>
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




                                </ul>						</nav>
                        </div>
                    </div>
                </div>
            </header>


            <center><section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">
                            <br><br><br><br>

                            <%
            //                    Staff s = new Staff(username);
                                //String dept = request.getParameter("dept");
                                String date = request.getParameter("datepicker");
                                //String sem = request.getParameter("sem");
                                //  String batch=request.getParameter("batch");

                            %>
                            <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
                            <center><h2>Department Of <%=s.getCouncillorDetails().getDept().toUpperCase()%></h2></center>

                            <center><h2 >Daily Attendance Report</h2>
                                <h2>Batch :<%=s.getCouncillorDetails().getBatch()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;</h2>
                                <h2>Semester: <%=Find.getSem(s.getCouncillorDetails().getBatch(), s.getCouncillorDetails().getAcademicyr(), s.getCouncillorDetails().getSemister())%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date: <%=date%></h2></center>


                            <center>  <table class="bordered">
                                    <thead>

                                        <tr>

                                            <th> Sno</th>
                                            <th name="cc">Roll No</th>
                                            <th>Register No</th>
                                            <th>Name</th>
                                            <th>No Of Days Leave</th>
                                            <th>Reason</th>
                                            <th>Father Name<br>(Mobile)</th>
                                            <th>Mother Name<br>(Mobile)</th>

                                        </tr>
                                    </thead>
                                    <%
 Connection conn=null;
        //Statement st=null;
       // Statement st1=null;
        //Statement st2=null;
        
        
	try{
            
       
      
       
        
         conn = new dbcon(clg).getConnection(s.getCouncillorDetails().getDept());
        // st=conn.createStatement();
        // st1=conn.createStatement();
         //st2=conn.createStatement();
         
        int count =0;
        
        String sql="select * from councillor_attendance where date=? and sem='"+Find.getSem(s.getCouncillorDetails().getBatch(), s.getCouncillorDetails().getAcademicyr(), s.getCouncillorDetails().getSemister())+"'";
        PreparedStatement st=conn.prepareStatement(sql);
        st.setString(1, date);
        ResultSet rs=st.executeQuery();
        int sno=1;
        while(rs.next())
        {
           
        String rollno=rs.getString("rollno");
        String reason=rs.getString("reason");
       // String date1=String.valueOf(rs.getDate("date"));
        
        //sql=;
        PreparedStatement st1 =conn.prepareStatement("select * from student_personal where rollno= and batch=? order by name");
        st1.setString(1, rollno);
        st1.setString(2, s.getCouncillorDetails().getBatch());
        ResultSet rs1=st1.executeQuery();
        if(rs1.next())
        {    
            
            
        String name=rs1.getString("name");
        String regno=rs1.getString("regno");
        PreparedStatement st2=conn.prepareStatement("select count(*) as days from councillor_attendance where rollno=? and sem='"+Find.getSem(s.getCouncillorDetails().getBatch(), s.getCouncillorDetails().getAcademicyr(), s.getCouncillorDetails().getSemister())+"");
        st2.setString(1, rollno);
        ResultSet rs2=st2.executeQuery();
        String days="0";
        if(rs2.next())
        days=String.valueOf(rs2.getInt("days")-1);
         //   days=String.valueOf(rs2.getInt("days"));
        
        String fname="",fmobile="",mname="",mmobile="";
         
         PreparedStatement st3=conn.prepareStatement("select f.fathers_name,f.mobile,m.mothers_name,m.mobileno from student_father_details f,student_mother_details m where f.rollno=? and m.rollno=?");
         st3.setString(1, rollno);
         st3.setString(2, rollno);
         rs2=st3.executeQuery();
         if(rs2.next()){
         fname=rs2.getString("fathers_name");
         fmobile=rs2.getString("mobile");
         mname=rs2.getString("mothers_name");
         mmobile=rs2.getString("mobileno");
         }
                                        %>

                                    <tr>
                                        <td><%=sno++%></td>
                                        <td><%=rollno.toUpperCase()%></td>
                                        <td><%=regno%></td>

                                        <td><%=name.toUpperCase()%></td>
                                        <td><%=days%></td>
                                        <td><%=reason%></td>
                                        <td><%=fname.toUpperCase()%><br>(<%=fmobile%>)</td>
                                        <td><%=mname.toUpperCase()%><br>(<%=mmobile%>)</td>         
                                    </tr>

                                    <input type="hidden" name="dept" value="<%= s.getCouncillorDetails().getDept()%>">

                                    <%

count++; 

}
}
//if(st2!=null)
  //  st2.close();
        
        session.setAttribute("count",count);
        session.setAttribute("date",date);
        
}catch(Exception e){
e.printStackTrace();
}finally{
    //                        if(st!=null)
      //                      st.close();
        //                    if(st1!=null)
          //                  st1.close();
        
            //                if(conn!=null)
              //                  conn.close();
}                                           %>



                                </table></center>



                            </section>



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
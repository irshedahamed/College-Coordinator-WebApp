
<%@page import="Actor.Student"%>
<%@page import="Transport.BoardingPoint"%>
<%--
    Document   : profileedit
    Created on : Oct 24, 2016, 10:00:27 AM
    Author     : Lenovo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.action.Find"%>
<%@page import="java.util.List"%>
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
                if (type.equals("admin") || type.equals("dataentry")) {


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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.3/css/select2.min.css" rel="stylesheet" />

        <script type="text/javascript" src="../js/jquery.js"></script>
        <script src="../js/select2.js"></script>
        <script>
            function pageshow()
            {

                var showvalue = document.getElementById("pagetype").value;

                if (showvalue === "Manual Entry")
                {
                    document.getElementById("excel").style.display = 'none';
                    document.getElementById("manual").style.display = 'block';
                }
                if (showvalue === "Excell Upload")
                {
                    document.getElementById("manual").style.display = 'none';
                    document.getElementById("excel").style.display = 'block';
                }
            }

            $(document).ready(function () {
                $('select.boarding').select2();
                $(document).on('change keyup', '#religion', function () {
                    if ($("#religion option:selected").val() === "others") {
                        $("#religion").after('<input type="text" style="background: white" name="religion">');
                        $("#religion").remove();
                    }
                });
                $(document).on('change keyup', '#counormn', function () {

                    $("#adminalot option").remove();
                    console.log($("#counormn option:selected").val());
                    if ($("#counormn option:selected").val() === "Counseling") {
                        $("#adminalot").append(' <option value="OC">OPEN</option>' +
                                ' <option value="BC">BC</option>' +
                                ' <option value="MBC">MBC</option>' +
                                ' <option value="BCM">BCM</option>' +
                                ' <option value="SC">SC</option>' +
                                ' <option value="SCA">SCA</option>' +
                                ' <option value="ST">ST</option>' +
                                ' <option value="SPORTS">SPORTS</option>' +
                                ' <option value="VOCATIONAL">VOCATIONAL</option>   ' +
                                ' <option value="EX-SERVICEMAN">EX-SERVICEMAN</option>' +
                                '<option value="PHYSICALLY HANDICAPPED">PHYSICALLY HANDICAPPED</option>' +
                                '');
                    } else if ($("#counormn option:selected").val() === "Management") {
                        $("#adminalot").append(' <option value="GENERAL">GENERAL</option>' +
                                ' <option value="SPORTS">SPORTS</option>' +
                                ' <option value="CHRISTIAN MINORITY">CHRISTIAN MINORITY</option>   ' +
                                ' <option value="NRICGC">NRICGC</option>' +
                                ' <option value="FOREIGN">FOREIGN</option>' +
                                '<option value="LAPS">LAPS</option>' +
                                '');

                    }
                });
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
                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Academics</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Batch</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="batch.jsp">Update Batch</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="deletebatch.jsp">Delete Batch</a>
                                                </ul>
                                            </li>
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Academic Year</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="InsertYear.jsp">Insert Academic Year</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="CurrentUpd.jsp">Update Current</a>
                                                </ul>
                                            </li>
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

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768 current-menu-item page_item page-item-115 current_page_item menu-item-778"><a href="">Students</a>
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

                                    <li id="menu-item-764" class="menu-item menu-item-type-custom menu-item-object-custom current-menu-ancestor menu-item-has-children menu-item-768"><a href="">Staff</a>
                                        <ul class="sub-menu">
                                            <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="#">Profile</a>
                                                <ul class="sub-menu">
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofileupdate.jsp">Add Profile</a>
                                                    <li id="menu-item-812" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-812"><a href="staffprofiledelete.jsp">Delete Profile</a>
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
            <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                        <div id ="manual"><form method="post" action="profileedit.jsp" >
                                <center> <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="search"></center>
                                <div align="center">
                                    <br><br>
                                    <input type="submit" id="submit" value="Submit" />
                                    <br><br></div></form>
                                    <%
                                        String rollno = request.getParameter("search");
                                        //Connection con = null;
                                        //Statement stmt = null;
                                        //ResultSet rs = null;
                                        //String sql = "select * from student_general where rollno like '" + rollno + "'";
                                        if (request.getParameter("search") != null) {
                                            try {

                                          //      con = new dbcon().getConnection(Find.sdept(rollno));
                                            //    stmt = con.createStatement();


                                    %>
                            <center> <form method="post" name="general" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>General Details</h3></center>
                                        <%    //                           rs = stmt.executeQuery(sql);
                                            //if (rs.next()) {
                                            Student s= Student.getById(rollno);
                                        %>

                                    <table cellspacing="10"><tr><td>

                                                <label> Roll No :</label><input type="text" style="background: white" id="rollno" name="rollno" value="<%=rollno%>" disabled></td>

                                            <td>

                                                <label>Department :</label><input type="text" style="background: white"  value="<%=Find.sdept(rollno)%>" disabled>

                                            <td>
                                                <label> Date of Birth :</label><input type="date" style="background: white" id="dob" name="dob" value="<%=s.getGeneral().getDob()%>"></td>
                                            <td><label>Caste :</label><input type="text" style="background: white" id="caste" name="caste" value="<%=s.getGeneral().getCaste()%>">
                                            </td></tr>
                                        <tr>

                                            <td><label>Community :</label>


                                                <select name="community">
                                                    <option value="<%=s.getGeneral().getCommunity()%>"><%=s.getGeneral().getCommunity()%></option>
                                                    <option value="OC">OC</option>
                                                    <option value="BC">BC</option>
                                                    <option value="MBC">MBC</option>
                                                    <option value="DC">DC</option>
                                                    <option value="SC">SC</option>
                                                    <option value="ST">ST</option>
                                                </select>


                                            </td>
                                            <td>
                                                <label>Parents Annual Income :</label><input type="text" style="background: white" id="pincome" name="pincome" value="<%=s.getGeneral().getParentincome()%>">
                                            </td>

                                            <td>
                                                <label>Religion :</label>
                                                <select name="religion" id="religion">
                                                    <option value="<%=s.getGeneral().getReligion()%>"><%=s.getGeneral().getReligion()%></option>
                                                    <option value="Hindu">Hindu</option>
                                                    <option value="Muslim">Muslim</option>
                                                    <option value="Christian">Christian</option>
                                                    <option value="others">Others</option>

                                                </select>

                                            </td>

                                            <td>
                                                <label> Nationality :</label><input type="text" style="background: white" id="nationality" name="nationality" value="<%=s.getGeneral().getNationality()%>">
                                            </td>

                                        </tr>
                                        <tr>


                                            <td>
                                                <label> Mother Tongue :</label> <input type="text" style="background: white" id="mothertongue" name="mothertongue" value="<%=s.getGeneral().getMothertongue()%>">
                                            </td>
                                            <td>
                                                <label>Club Member :</label><input type="text" style="background: white" id="clubmember" name="clubmember" value="<%=s.getGeneral().getClub()%>">
                                            </td>
                                            <td>
                                                <label>Boarding Point :</label>


                                                <select class="boarding"  id="boarding" name="boardingpt"  >
                                                    <option value="<%=s.getGeneral().getBoarding()%>"><%=s.getGeneral().getBoarding()%></option>
                                                    <%
                                                        List<String> blist = BoardingPoint.getAll();
                                                        for (String s1 : blist) {
                                                    %>
                                                    <option value="<%=s1%>"><%=s1%></option>
                                                    <%
                                                        }
                                                    %>
                                                </select>  </td>
                                        </tr></table>
                                    <input type="hidden" name="formtype" value="general">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">

                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
                                    
                                 //   Statement stmt1 = null;
                                  //  stmt1 = con.createStatement();
                                  //  sql = "select * from student_academic_details where rollno like '" + rollno + "'";
                                    //ResultSet rs1 = stmt1.executeQuery(sql);
                                    //if (rs1.next()) {
                                    
                                %>
                            <center> <form method="post" name="academic" action="${pageContext.request.contextPath}/updateStudent">
                                    <br><center><h3>Academic Details</h3></center>

                                    <table><br><center><h5>10th Details</h5></center>

                                        <tr>
                                            <td>
                                                <label>Name of School :</label><input type="text" style="background: white" id="10school" name="10school" value="<%=s.getAcademic().getTenthschool()%>">
                                            </td>
                                            <td>
                                                <label>Marks Obtained:</label><input type="text" style="background: white" id="10marks" name="10marks" value="<%=s.getAcademic().getTenthmark()%>">
                                            </td>
                                            <td>
                                                <label>Board of Study:</label><input type="text" style="background: white" id="10board" name="10board" value="<%=s.getAcademic().getTenthboard()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Medium of Instruction :</label><input type="text" style="background: white" id="10med" name="10med" value="<%=s.getAcademic().getTenthmark()%>">
                                            </td>
                                            <td>
                                                <label>Year of Passing :</label><input type="text" style="background: white" id="10yop" name="10yop" value="<%=s.getAcademic().getTenthyearofpass()%>">
                                            </td></tr></table>

                                    <table><br><center><h5>12th Details</h5></center>
                                        <tr>
                                            <td>
                                                <label>Name of School :</label><input type="text" style="background: white" id="12school" name="12school" value="<%=s.getAcademic().getTwelfthschool()%>">
                                            </td>
                                            <td>
                                                <label>Marks Obtained:</label><input type="text" style="background: white" id="12marks" name="12marks" value="<%=s.getAcademic().getTwelfthmark()%>">
                                            </td>
                                            <td>
                                                <label>Board of Study:</label><input type="text" style="background: white" id="12board" name="12board" value="<%=s.getAcademic().getTwelfthboard()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Medium of Instruction :</label><input type="text" style="background: white" id="12med" name="12med" value="<%=s.getAcademic().getTwelfthmedium()%>">
                                            </td>
                                            <td>
                                                <label>Year of Passing :</label><input type="text" style="background: white" id="12yop" name="12yop" value="<%=s.getAcademic().getTwelfthyearofpass()%>">
                                            </td></tr></table>
                                    <table><br><center><h5>Diploma Details</h5></center>
                                        <tr>
                                            <td>
                                                <label>Name of College:</label><input type="text" style="background: white" id="dipcoll" name="dipcoll" value="<%=s.getAcademic().getDiplomaclg()%>">
                                            </td>
                                            <td>
                                                <label>Marks Obtained:</label><input type="text" style="background: white" id="dipmark" name="dipmark" value="<%=s.getAcademic().getDiplomamark()%>">
                                            </td>
                                            <td>
                                                <label>Board of Study :</label><input type="text" style="background: white" id="dipboard" name="dipboard" value="<%=s.getAcademic().getDiplomaboard()%>">
                                            </td></tr>
                                        <tr>
                                            <td>
                                                <label> Medium of Instruction :</label><input type="text" style="background: white" id="dipmed" name="dipmed" value="<%=s.getAcademic().getDiplomamedium()%>">
                                            </td>
                                            <td>
                                                <label> Year of Passing :</label><input type="text" style="background: white" id="dipyop" name="dipyop" value="<%=s.getAcademic().getDiplomayearofpass()%>">
                                            </td>
                                        </tr>


                                    </table>

                                                <input type="hidden" name="formtype" value="academic"><input type="hidden" name="rollno" value="<%=s.getId()%>">

                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
                                    
                                    //Statement stmt2 = null;
                                    //stmt2 = con.createStatement();
                                    //sql = "select * from student_admission_details where rollno like '" + rollno + "'";
                                   // ResultSet rs2 = stmt2.executeQuery(sql);
                                    //if (rs2.next()) {

                                %>
                            <center> <form method="post" name="admission" action="${pageContext.request.contextPath}/updateStudent">
                                    <br><center><h3>Admission Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Date of Admission :</label><input type="date"  style="background: white" id="doa" name="doa" value="<%=s.getAdmissionDetails().getDoa()%>">
                                            </td>
                                            <td>
                                                <label>Counseling or Management :</label><select style="background: white" id="counormn" name="counormn" value="<%=s.getAdmissionDetails().getGovt_mang()%>"><option value="Counseling">Counseling</option>
                                                    <option value="Management">Management</option></select>
                                            </td>
                                            <td>
                                                <label>Admin Allotment :</label>
                                                <select name="adminalot" style="background: white" id="adminalot" >
                                                    <option value="<%=s.getAdmissionDetails().getAllotment()%>"><%=s.getAdmissionDetails().getAllotment()%></option>
                                                </select>
                                            </td>

                                            <td>
                                                <label>Overall Rank :</label><input type="text"  style="background: white" id="orank" name="orank" value="<%=s.getAdmissionDetails().getOrank()%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Community Rank :</label><input type="text"  style="background: white" id="crank" name="crank" value="<%=s.getAdmissionDetails().getCrank()%>">
                                            </td>
                                            <td>
                                                <label>Sports Admission :</label><select style="background: white" id="sadmission" name="sadmission" value="<%=s.getAdmissionDetails().getSport()%>"><option value="Yes">Yes</option>
                                                    <option value="No">No</option></select>
                                            </td>
                                            <td>
                                                <label>Game Name :</label><input type="text"  style="background: white" id="gname" name="gname" value="<%=s.getAdmissionDetails().getGname()%>">
                                            </td>
                                            <td>
                                                <label>Medium of Instruction :</label><input type="text"  style="background: white" id="moi" name="moi" value="<%=s.getAdmissionDetails().getMoi()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Scholarship :</label>
                                                <select name="scholarship" id="religion">
                                                    <option value="<%=s.getAdmissionDetails().getScholarship()%>" > <%=s.getAdmissionDetails().getScholarship()%></option>
                                                    <option value="NA">NA</option>
                                                    <option value="First Graduate">First Graduate</option>
                                                    <option value="Fee Waiver">Fee Waiver</option>
                                                    <option value="SC/ST Scholarship">SC/ST Scholarship</option>


                                                </select>

                                            </td>
                                        </tr>
                                    </table>
                                    <input type="hidden" name="formtype" value="admission">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
                                    
                                 //   Statement stmt3 = null;
                                   // stmt3 = con.createStatement();
                                   // sql = "select * from student_contact_details where rollno like '" + rollno + "'";
                                   // ResultSet rs3 = stmt3.executeQuery(sql);
                                   // if (rs3.next()) {
                                %>
                            <center> <form method="post" name="contact" action="${pageContext.request.contextPath}/updateStudent">
                                    <br><center><h3>Contact Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Door No :</label><input type="text"  style="background: white" id="doorno" name="doorno" value="<%=s.getContact().getDoorno()%>">
                                            </td>
                                            <td>
                                                <label>Street :</label><input type="text"  style="background: white" id="street" name="street" value="<%=s.getContact().getStreet()%>">
                                            </td>
                                            <td>
                                                <label>Area :</label><input type="text"  style="background: white" id="area" name="area" value="<%=s.getContact().getArea()%>">
                                            </td>
                                            <td>
                                                <label>City :</label><input type="text"  style="background: white" id="city" name="city" value="<%=s.getContact().getCity()%>">
                                            </td>

                                        </tr>
                                        <tr>
                                            <td>
                                                <label>District :</label><input type="text"  style="background: white" id="district" name="district" value="<%=s.getContact().getDistrict()%>">
                                            </td>
                                            <td>
                                                <label>State :</label><input type="text"  style="background: white" id="state" name="state" value="<%=s.getContact().getState()%>">
                                            </td>
                                            <td>
                                                <label>Country :</label><input type="text"  style="background: white" id="country" name="country" value="<%=s.getContact().getCountry()%>">
                                            </td>
                                            <td>
                                                <label>Pin Code :</label><input type="text"  style="background: white" id="pincode" name="pincode" value="<%=s.getContact().getPincode()%>">
                                            </td>
                                        </tr>
                                    </table>
                                    <input type="hidden" name="formtype" value="contact">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">

                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
                                    
                                    //Statement stmt4 = null;
                                   //  stmt4 = con.createStatement();
                                   //  sql = "select * from student_father_details where rollno like '" + rollno + "'";
                                   //  ResultSet rs4 = stmt4.executeQuery(sql);
                                //    if (rs4.next()) {
                                %>
                            <center> <form method="post" name="father" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>Father Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Father Name :</label><input type="text"  style="background: white" id="fathername" name="fathername" value="<%=s.getFatherDetails().getFathername()%>">
                                            </td>
                                            <td>
                                                <label>Qualification :</label><input type="text"  style="background: white" id="qualification" name="qualification" value="<%=s.getFatherDetails().getQualification()%>">
                                            </td>
                                            <td>
                                                <label>Occupation :</label><input type="text"  style="background: white" id="occupation" name="occupation" value="<%=s.getFatherDetails().getOccupation()%>">
                                            </td>
                                            <td>
                                                <label>Designation :</label><input type="text"  style="background: white" id="designation" name="designation" value="<%=s.getFatherDetails().getDesig()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Address :</label><input type="text"  style="background: white" id="address" name="address" value="<%=s.getFatherDetails().getAddress()%>">
                                            </td>
                                            <td>
                                                <label>Landline :</label><input type="text"  style="background: white" id="landline" name="landline" value="<%=s.getFatherDetails().getLandline()%>">
                                            </td>
                                            <td>
                                                <label>Mobile :</label><input type="text"  style="background: white" id="mobile" name="mobile" value="<%=s.getFatherDetails().getMobile()%>">
                                            </td>
                                            <td>
                                                <label>Mail id :</label><input type="text"  style="background: white" id="mail" name="mail" value="<%=s.getFatherDetails().getMail()%>">
                                            </td>
                                        </tr>
                                        <tr>

                                        </tr>

                                    </table>
                                    <br><br>
                                    <input type="hidden" name="formtype" value="father">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
                                    
                                 //   Statement stmt5 = null;
                                   // stmt5 = con.createStatement();
                                //    sql = "select * from student_mother_details where rollno like '" + rollno + "'";
                                  //  ResultSet rs5 = stmt5.executeQuery(sql);
                                 //   if (rs5.next()) {Mo
                                %>
                            <center> <form method="post" name="mother" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Mother Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Mother Name :</label><input type="text"  style="background: white" id="mothername" name="mothername" value="<%=s.getMotherDetails().getMothername()%>">
                                    </td>
                                    <td>
                                        <label>Qualification :</label><input type="text"  style="background: white" id="qualification" name="mqualification" value="<%=s.getMotherDetails().getQualification()%>">
                                    </td>
                                    <td>
                                        <label>Occupation :</label><input type="text"  style="background: white" id="occupation" name="moccupation" value="<%=s.getMotherDetails().getOccupation()%>">
                                    </td>
                                    <td>
                                        <label>Designation :</label><input type="text"  style="background: white" id="designation" name="mdesignation" value="<%=s.getMotherDetails().getDesig()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Address :</label><input type="text"  style="background: white" id="address" name="maddress" value="<%=s.getMotherDetails().getAddress()%>">
                                    </td>
                                    <td>
                                        <label>Land Line :</label><input type="text"  style="background: white" id="landline" name="mlandline" value="<%=s.getMotherDetails().getLandline()%>">
                                    </td>
                                    <td>
                                        <label>Mobile :</label><input type="text"  style="background: white" id="mobile" name="mmobile"value="<%=s.getMotherDetails().getMobile()%>">
                                    </td>
                                    <td>
                                        <label>Mail id :</label><input type="text"  style="background: white" id="mail" name="mmail" value="<%=s.getMotherDetails().getMail()%>">
                                    </td>
                                </tr>
                                <tr>

                                </tr>

                            </table>
                            <br><br>
<input type="hidden" name="formtype" value="mother">
<input type="hidden" name="rollno" value="<%=s.getId()%>">
                            <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
            <br><br>
                        </form></center>
                            <%
            //                }
              //                 Statement stmt6=null;
                //               stmt6=con.createStatement();
                  //          sql="select * from student_local_guardian where rollno like '"+rollno+"'";
                    //        ResultSet rs6=stmt6.executeQuery(sql);
 //                           if(rs6.next())
//{
                            %>
                        <center> <form method="post" name="localGuardian" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Local Guardian Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Name :</label><input type="text"  style="background: white" id="lgname" name="lgname" value="<%=s.getLocalGuardian().getName()%>">
                                    </td>
                                    <td>
                                        <label>Phone no :</label><input type="text"  style="background: white" id="lgphno" name="lgphno" value="<%=s.getLocalGuardian().getPhonenum()%>">
                                    </td>
                                    <td>
                                        <label>Door no :</label><input type="text"  style="background: white" id="lgdoorno" name="lgdoorno" value="<%=s.getLocalGuardian().getDoorno()%>">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text"  style="background: white" id="lgstreet" name="lgstreet" value="<%=s.getLocalGuardian().getStreet()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Area :</label><input type="text"  style="background: white" id="lgarea" name="lgarea" value="<%=s.getLocalGuardian().getArea()%>">
                                    </td>

                                    <td>
                                        <label>City :</label><input type="text"  style="background: white" id="lgcity" name="lgcity" value="<%=s.getLocalGuardian().getCity()%>">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text"  style="background: white" id="lgpincode" name="lgpincode" value="<%=s.getLocalGuardian().getPincode()%>">
                                    </td>

                                </tr>


                            </table>
                            <br><br>
 <input type="hidden" name="formtype" value="local">
 <input type="hidden" name="rollno" value="<%=s.getId()%>">
   <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
            <br><br>
                        </form></center>                 
 <%
                         //   }
                           //    Statement stmt11=null;
                             //  stmt11=con.createStatement();
                          //  sql="select * from student_local_guardian2 where rollno like '"+rollno+"'";
                           // ResultSet rs11=stmt11.executeQuery(sql);
                           // if(rs11.next())
//{
                            %>
                        <center> <form method="post" name="localGuardian2" action="${pageContext.request.contextPath}/updateStudent">
                            <center><h3>Local Guardian2 Details</h3></center>
                                                        <table>
                                <tr>
                                    <td>
                                        <label>Name :</label><input type="text"  style="background: white" id="lgname2" name="lgname2" value="<%=s.getLocalGuardian2().getName()%>">
                                    </td>
                                    <td>
                                        <label>Phone no :</label><input type="text"  style="background: white" id="lgphno2" name="lgphno2" value="<%=s.getLocalGuardian2().getPhonenum()%>">
                                    </td>
                                    <td>
                                        <label>Door no :</label><input type="text"  style="background: white" id="lgdoorno2" name="lgdoorno2" value="<%=s.getLocalGuardian2().getDoorno()%>">
                                    </td>
                                    <td>
                                        <label>Street :</label><input type="text"  style="background: white" id="lgstreet2" name="lgstreet2" value="<%=s.getLocalGuardian2().getStreet()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <label>Area :</label><input type="text"  style="background: white" id="lgarea2" name="lgarea2" value="<%=s.getLocalGuardian2().getArea()%>">
                                    </td>

                                    <td>
                                        <label>City :</label><input type="text"  style="background: white" id="lgcity2" name="lgcity2" value="<%=s.getLocalGuardian2().getCity()%>">
                                    </td>
                                    <td>
                                        <label>Pin Code :</label><input type="text"  style="background: white" id="lgpincode2" name="lgpincode2" value="<%=s.getLocalGuardian2().getPincode()%>">
                                    </td>

                                </tr>


                            </table>
                            <br><br>
 <input type="hidden" name="formtype" value="local">
 <input type="hidden" name="rollno" value="<%=s.getId()%>">
   <div align="right">
            <input type="submit" id="submit" value="Submit" /></div>
            <br><br>
                        </form></center>




 <%
      //                      }
        //                       Statement stmt7=null;
          //                     stmt7=con.createStatement();
            //                sql="select * from student_other_details where rollno like '"+rollno+"'";
              //              ResultSet rs7=stmt7.executeQuery(sql);
                //            if(rs7.next())
//{
                            %>
                            <center> <form method="post" name="other" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>Other Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Transfer From :</label><input type="text"  style="background: white" id="odtf" name="odtf"  value="<%=s.getOtherDetails().getTransferfrom()%>">
                                            </td>
                                            <td>
                                                <label>Institution Name:</label><input type="text"  style="background: white" id="odin" name="odin" value="<%=s.getOtherDetails().getInstname()%>">
                                            </td>
                                            <td>
                                                <label>Previous Institution Address:</label><input type="text"  style="background: white" id="odprevinst" name="odprevinst" value="<%=s.getOtherDetails().getPrevaddress()%>">
                                            </td>
                                            <td>
                                                <label>Group :</label><input type="text"  style="background: white" id="odgrp" name="odgrp" value="<%=s.getOtherDetails().getGroup()%>">
                                            </td>
                                        </tr><tr>
                                            <td>
                                                <label>Year of Re-admission :</label><input type="text"  style="background: white" id="odyoa" name="odyoa" value="<%=s.getOtherDetails().getYearofadmission()%>">
                                            </td>
                                            <td>
                                                <label>Year of Relieve :</label><input type="text"  style="background: white" id="odyor" name="odyor" value="<%=s.getOtherDetails().getYearrelif()%>">
                                            </td>
                                            <td>
                                                <label>Course Completed in Time(Y/N) :</label><input type="text"  style="background: white" id="odct" name="odct" value="<%=s.getOtherDetails().getCourse_completed_in_time()%>">
                                            </td>
                                            <td>
                                                <label>Board of Study:</label> <input type="text"  style="background: white" id="odboard" name="odboard" value="<%=s.getOtherDetails().getBoard()%>">
                                            </td>

                                        </tr>
                                        <tr>

                                            <td>
                                                <label>Medium of Instruction :</label><input type="text"  style="background: white" id="odmoi" name="odmoi" value="<%=s.getOtherDetails().getMedium()%>">
                                            </td>
                                            <td>
                                                <label>Reason For Discontinuation :</label><input type="text"  style="background: white" id="odrfd" name="odrfd" value="<%=s.getOtherDetails().getReasonfordiscontinue()%>">
                                            </td>

                                        </tr>

                                    </table>
                                    <br><br>
                                    <input type="hidden" name="formtype" value="other">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
          //                          }
            //                        Statement stmt8 = null;
              //                      stmt8 = con.createStatement();
                //                    sql = "select * from student_passport_details where rollno like '" + rollno + "'";
                  //                   ResultSet rs8 = stmt8.executeQuery(sql);
                    //                 if (rs8.next()) {
                      //          %>
                            <center> <form method="post" name="passport" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>Passport Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Date of Expiry :</label><input type="date"  style="background: white" id="pddoe" name="pddoe" value="<%=s.getPassport().getDoe()%>">
                                            </td>
                                            <td>
                                                <label>Foreign Student :</label><input type="text"  style="background: white" id="pdfs" name="pdfs"  value="<%=s.getPassport().getForgn()%>">
                                            </td>
                                            <td>
                                                <label>Passport Number :</label><input type="text"  style="background: white" id="pdpn" name="pdpn" value="<%=s.getPassport().getPassno()%>">
                                            </td>

                                        </tr>
                                        <tr>

                                        </tr>

                                    </table>
                                    <input type="hidden" name="formtype" value="passport">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
            //                        }
              //                      Statement stmt9 = null;
                //                    stmt9 = con.createStatement();
                  //                  sql = "select * from student_visa_details where rollno like '" + rollno + "'";
                    //                ResultSet rs9 = stmt9.executeQuery(sql);
                      //              if (rs9.next()) {
                                %>
                            <center> <form method="post" name="visa" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>Visa Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Date of Expiry :</label><input type="date"  style="background: white" id="vddoe" name="vddoe" value="<%=s.getVisa().getDoe()%>">
                                            </td>
                                            <td>
                                                <label>Visa Number :</label><input type="text"  style="background: white" id="vdvn" name="vdvn" value="<%=s.getVisa().getVisano()%>">
                                            </td>
                                            <td>
                                                <label>Type of Visa :</label><input type="text"  style="background: white" id="vdtype" name="vdtype" value="<%=s.getVisa().getType()%>">
                                            </td>

                                        </tr>
                                        <tr>

                                        </tr>

                                    </table>
                                    <br><br>
                                    <input type="hidden" name="formtype" value="visa">
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>
                                <%
               //                     }
                 //                   Statement stmt10 = null;
                   //                 stmt10 = con.createStatement();
                     //               sql = "select * from student_personal where rollno like '" + rollno + "'";
                       //             ResultSet rs10 = stmt10.executeQuery(sql);
                         //           if (rs10.next()) {
                                %>
                            <center> <form method="post" name="personal" action="${pageContext.request.contextPath}/updateStudent">
                                    <center><h3>Personal Details</h3></center>
                                    <table>
                                        <tr>
                                            <td>
                                                <label>Regno :</label><input type="text"  style="background: white" id="regno" name="regno" value="<%=s.getRegno()%>">
                                            </td>
                                            <td>
                                                <label>Name :</label><input type="text"  style="background: white" id="stuname" name="stuname" value="<%=s.getName()%>">
                                            </td>

                                            <td>
                                                <label>Gender :</label><select name="gender" >
                                                    <option value="<%=s.getSex()%>"><%=s.getSex()%></option>
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select></td>
                                            <td>
                                                <label>Blood Group :</label>
                                                <select style="background: white"  name="bloodgroup">
                                                    <option value="<%=s.getBloodgrp()%>"><%=s.getBloodgrp()%></option>
                                                    <option value="O +ve">O +ve</option>
                                                    <option value="O -ve">O -ve</option>
                                                    <option value="B +ve">B +ve</option>
                                                    <option value="B -ve">B -ve</option>
                                                    <option value="A +ve">A +ve</option>
                                                    <option value="A -">A -ve</option>
                                                    <option value="B1 +ve">B1 +ve</option>
                                                    <option value="A2B +ve">A2B +ve</option>
                                                    <option value="A2B -ve">A2B -ve</option>
                                                    <option value="A2 +ve">A2 +ve</option>
                                                    <option value="A2 -ve">A2 -ve</option>
                                                    <option value="A1B +ve">A1B +ve</option>
                                                    <option value="A1B -ve">A1B -ve</option>
                                                    <option value="A1 +ve">A1 +ve</option>
                                                    <option value="A1 -ve">A1 -ve</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <label>Batch :</label><input type="text"  style="background: white" id="batch" name="batch" value="<%=s.getBatch()%>">
                                            </td>
                                            <td>
                                                <label>Course :</label><select name="course" >
                                                    <option value="<%=s.getCourse()%>"><%=s.getCourse()%></option>
                                                    <option value="be">B.E</option>
                                                    <option value="btech">B.Tech</option>
                                                </select>
                                            </td>
                                            <td>
                                                <label>Section :</label><input type="text"  style="background: white" id="sec" name="sec" value="<%=s.getSec()%>">
                                            </td>
                                            <td>
                                                <label>Mobile no. :</label><input type="text"  style="background: white" id="stumobile" name="stumobile"value="<%=s.getMobile()%>">
                                            </td></tr><tr>
                                            <td>
                                                <label>Mail id :</label><input type="text"  style="background: white" id="stumail" name="stumail" value="<%=s.getMailid()%>">
                                            </td>

                                            <td>
                                                <label>Food :</label><select name="food">
                                                    <option  value="<%=s.getFood()%>"><%=s.getFood()%></option>
                                                    <option value="v">Veg</option>
                                                    <option value="nv">Non Veg</option>1

                                                </select></td>

                                            <td>
                                                <label>Accommodation :</label><select name="acc" >
                                                    <option value="<%=s.getAccomodation()%>"><%=s.getAccomodation()%></option>
                                                    <option value="day">Day Scholar</option>
                                                    <option value="hostel">Hosteler</option>

                                                </select></td></tr><tr>
                                            <td>
                                                <label>Initial :</label><input type="text"  style="background: white" id="initial" name="initial" value="<%=s.getInitial()%>">
                                            </td>
                                            <td>



                                                </select></td>
                                        </tr>
                                        <tr>

                                        </tr>

                                    </table>
                                    <br><br>
                                    <input type="hidden" name="rollno" value="<%=s.getId()%>">
                                    <input type="hidden" name="formtype" value="personal">
                                    <div align="right">
                                        <input type="submit" id="submit" value="Submit" /></div>
                                    <br><br>
                                </form></center>

                            <%
                                        //}

                                        //if (stmt != null) {
                                          //  stmt.close();
                                       // }
                                   //     if (stmt1 != null) {
                                     //       stmt1.close();
                                       // }
                                    //    if (stmt2 != null) {
                                      //      stmt2.close();
                                        //}
                                   //     if (stmt3 != null) {
                                     //       stmt3.close();
                                       // }
                                    //    if (stmt4 != null) {
                                      //      stmt4.close();
                                        //}
                                  //      if (stmt5 != null) {
                                    //        stmt5.close();
                                      //  }
                                      //  if (stmt6 != null) {
                                        //    stmt6.close();
                                       // }

                                       // if (stmt7 != null) {
                                         //   stmt7.close();
                                       // }
                               //         if (stmt8 != null) {
                                 //           stmt8.close();
                                   //     }
                                     //   if (stmt9 != null) {
                                       //     stmt9.close();
                                        //}
                           //             if (stmt10 != null) {
                             //               stmt10.close();
                               //         }
                                //        if (con != null) {
                                  //          ;//con.close();
                                    ///    }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        try {
                                       //     if (con != null) {
                                         //       ;//con.close();
                                           // }
                               //             if (stmt != null) {
                                 //               stmt.close();
                                  //          }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }
                                }
                            %>

                        </div>



                    </div></div></section>

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
            <div class="copy"> © All rights reserved, IncredibleBytes, 2014</div>
            <button type="button" id="back-to-top"><span class="fa fa-angle-up"></span></button>
            <nav id="footer-nav">
                <ul id="menu-footer-menu" class="menu"><li id="menu-item-775" class="menu-item menu-item-type-post_type menu-item-object-page current-menu-item page_item page-item-115 current_page_item menu-item-775"><a href="index.html">Home</a></li>
                    <li id="menu-item-770" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-770"><a href="courses/index.html">Courses</a></li>
                    <li id="menu-item-776" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-776"><a href="blog/index.html">Blog</a></li>
                    <li id="menu-item-788" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-788"><a href="contact-2/index.html">Contact</a></li>
                </ul>                   </nav>
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
<%
            } else {
                response.sendRedirect("../index.jsp");
            }
        } else {
            response.sendRedirect("../index.jsp");
        }

        if (sttt != null) {
            sttt.close();
        }
        if (connn != null) {
            ;//connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("../index.jsp");
    }

%>
</html> 
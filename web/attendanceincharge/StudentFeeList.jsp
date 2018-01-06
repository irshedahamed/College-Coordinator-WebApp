<%-- 
    Document   : StudentFeeList
    Created on : 16 Jan, 2017, 10:02:13 PM
    Author     : Home
--%>

<%@page import="Fee.Fee"%>
<%@page import="Actor.Student.Admission"%>
<%@page import="Fee.SpecialFee"%>
<%@page import="General.AcademicYear"%>
<%@page import="Fee.BasicFee"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
<%-- 
    Document   : SendSMS
    Created on : Jul 21, 2016, 2:52:23 PM
    Author     : Lenovo
--%>
<%-- 
    Document   : editatt
    Created on : Jul 20, 2016, 10:03:39 AM
    Author     : Lenovo
--%>


<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../css/sky-forms.css" rel="stylesheet">
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>


        <title>JSP Page</title>
        <script type="text/javascript" src="../js/jquery.js"></script>


        <script type="text/javascript" src="../js/checkall.js"></script>

        <script>
            $(document).ready(function () {

                $(".amount").on("change keydown", function () {
                    //    console.log($(this).parent().parent().attr("id"));
                    //   console.log($(this).parent().parent().find("#placement").val());
                    $(this).parent().parent().css('background', 'red');

                });

                $(".update").on("click", function () {
                    console.log($(this).parent().parent().attr("id"));
                    var changecolour = $(this);
                    var id = $(this).parent().parent().attr("id");
                    var tution = $(this).parent().parent().find("#tution").val();
                    var transport = $(this).parent().parent().find("#transport").val();

                    var placement = $(this).parent().parent().find("#placement").val();
                    var hostel = $(this).parent().parent().find("#hostel").val();
                    var development = $(this).parent().parent().find("#development").val();

                    $.post('../updateSpecialFee', {
                        id: id,
                        tution: tution,
                        transport: transport,
                        placement: placement,
                        hostel: hostel,
                        development : development
                    }, function (response) {
                        console.log(response);
                        if (response === "success")
                            changecolour.parent().parent().css('background', 'green');

                    });

                });

            });

        </script>
    </head>


    <body>
        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                    <center><h1>Confirm List </h1></center>
                    <center> <form action="SpecialFee.jsp" class="" method="post">
                            <br><br><br>
                            <table class="bordered">
                                <thead>

                                    <tr>
                                        <th>Register Number</th>
                                        <th >Roll No</th>
                                        <th>Name</th>
                                        <th>Tution</th>
                                        <th>Transport</th>
                                        <th>Placement</th>
                                        <th>Hostel</th>
                                        <th>Development</th>
                                        <th>Save</th>
                                    </tr>
                                </thead>
                                <%
                                    String dept = request.getParameter("dept");
                                    String username = session.getAttribute("username").toString();
                                    String batch = Batch.getByYrIncharge(username).getBatch();
                                    List<Student> list = Student.getAll(dept, batch, "_");

                                    for (Student s : list) {
                                        Fee f = Fee.getFeeById(s.getId());
                                %>


                                <tr id="<%=s.getId()%>">
                                    <td><%=s.getRegno()%></td> 
                                    <td><%=s.getId()%></td>
                                    <td><%=s.getName()%></td>
                                    <td><input type="text" class="amount" value="<%=f.getTution()%>" id="tution" style="background:white"></td>
                                    <td><input type="text" class="amount" value="<%=f.getTransport()%>" id="transport" style="background:white"></td>
                                    <td><input type="text" class="amount" value="<%=f.getPlacement()%>" id="placement" style="background:white"></td>
                                    <td><input type="text" class="amount" value="<%=f.getHostel()%>" id="hostel" style="background:white"></td>
                                    <td><input type="text" class="amount" value="<%=f.getDevelopment()%>" id="hostel" style="background:white"></td>
                                    <td><input type="button" value="Update" id="submit" class="update"></td>
                                </tr>      
                                <%

                                    }


                                %>






                            </table>
                            <input type="hidden" name="dept" value="<%=dept%>">
                            <br><br>   
                            <input type="submit" id="submit" value="Back">
                            <br><br> 
                        </form></center>

                </div></div></section>
    </body>

</html>

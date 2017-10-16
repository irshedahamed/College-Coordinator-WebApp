<%-- 
    Document   : notReturnedSMS
    Created on : 19 Feb, 2017, 10:00:17 PM
    Author     : Home
--%>

<%@page import="General.Hostel"%>
<%@page import="com.action.Find"%>
<%@page import="Forms.OutPass"%>
<%@page import="Actor.Student"%>
<%-- 
    Document   : SendGeneralSMS
    Created on : 20 Oct, 2016, 12:40:45 PM
    Author     : Home
--%>

<%-- 
    Document   : SendMarkSMS
    Created on : 19 Oct, 2016, 8:11:20 PM
    Author     : Home
--%>
<%@page import="Actor.Parent"%>
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

        <script type="text/javascript" lang="javascript">
            $(document).ready(function () {

                $("form").submit(function () {

                    var value = $(this).data("newsel");
                    if (value === "yup")
                    {
                        alert("SMS Already Sent Please Wait...");
                        return false;
                    }
                    $(this).data("newsel", "yup");
                    $("#submit").val("Already Submitted");

                    var send = $(".send");


                    $.each(send, function (index, value) {


                        var divisionid = value.id;
                        var str = value.id;
                        str = value.id.substring(0, str.length - 3);
                        console.log(str);
                        var rollno = str;


                        var number = $("#mobile" + rollno).text();
                        ;
                        var message = $("#msg" + rollno).text();
                        ;
                        //    console.log(name);

                        //  console.log($("#selected"+rollno).is(':checked'));

                        if ($("#selected" + rollno).is(':checked'))
                            $.post('${pageContext.request.contextPath}/JsonSMS', {
                                number: number,
                                message: message
                            }
                            , function (response) {

                                //   $.each(response, function(index, value) {
                                console.log(divisionid);
                                $('<h4>' + response + '</h4>').appendTo('#' + divisionid);

                                //});

                            });
                    });

                    return false;
                });

            });

        </script>
        <script type="text/javascript" src="../js/checkall.js"></script>
    </head>


    <body>
        <section class="section-content section-bg" style="background-color:#f5f5f5;"><div class="container clearfix"><div class="entry-content">

                    <center><h1>Confirm List </h1></center>
                    <center> <form action="#" class="" method="post">
                            <br><br><br>
                            <table class="bordered">
                                <thead>


                                    <tr>

                                        <th>Selected<br><input type="checkbox" id="checkall"></th>
                                        <th >Roll No</th>
                                        <th>Name</th>
                                        <th>Mobile No</th>
                                        <th>Message</th>
                                        <th>Delivery</th>
                                    </tr>
                                </thead>
                                <%

                                    String username = session.getAttribute("username").toString();

                                    String message = "";
                                    String department = request.getParameter("dept");
                                    String date = request.getParameter("date");

                                    String sql = "";
                                    String[] depts = new String[15];
                                    if (department.equals("all")) {
                                        depts = Find.Depts;
                                    } else {
                                        depts[0] = new String(department);
                                    }

                                    for (String dept : depts) {
                                        for (String s : General.Entry.getUnreportedList(date)) {
                                            Student stu = Student.getById(s);
                                            String rollno = stu.getId();
                                            String regno = null;
                                            regno = stu.getRegno();

                                            String name = stu.getName();

                                            String phone;
                                            phone = Parent.getNumber(rollno);
                                            OutPass o = OutPass.getbyIdReturnDate(rollno, date);
                                            message = "Your ward " + name + " (" + rollno + ") left our premises on " + Find.getFormattedDate(o.getFrom()) + " and has not reported back to college within the specified time.";

                                            if (Find.sdept(stu.getId()).equals(dept) && Hostel.AuthenticateAccess(username, stu)) {

                                %>

                                <tr>
                                    <td><input type="checkbox" id="selected<%=rollno%>" class="checkme" value="yes" checked></td>
                                        <%

                                        %>
                                    <td id="rollno<%=rollno%>"><%=rollno%></td>


                                    <td id="name<%=rollno%>"><%=name%></td>

                                    <td id="mobile<%=rollno%>"><%=phone%></td>
                                    <td id="msg<%=rollno%>"><%=message%></td>

                                    <td>

                                        <div id="<%=rollno%>sms" class="send"></div>



                                    </td>

                                </tr>      



                                <%
                                            }
                                        }

                                    }


                                %>



                            </table>
                            <br><br>   
                            <input type="submit" id="submit" value="submit">
                            <br><br> 
                        </form></center>

                </div></div></section>
    </body>

</html>

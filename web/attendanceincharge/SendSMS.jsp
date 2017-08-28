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

                        var reason = $("#reason" + rollno).text();
                        var name = $("#name" + rollno).text();
                        //    console.log(name);

                        //  console.log($("#selected"+rollno).is(':checked'));
                        var date = $("#date").val();
                        if ($("#selected" + rollno).is(':checked'))
                            $.get('${pageContext.request.contextPath}/SMSSender', {
                                rollno: rollno,
                                date: date,
                                name: name,
                                reason: reason
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
                                    <%
                                        String date = request.getParameter("datepicker");

                                    %>

                                    <tr>
                                        <th>Selected<br><input type="checkbox" id="checkall"></th>
                                        <th name="cc">Roll No</th>
                                        <th>Name</th>
                                        <th>Reason</th>
                                        <th>Content</th>
                                        <th><%=date%>(Delivery)</th>
                                    </tr>
                                </thead>
                                <%

                                    Connection con = null;
                                    Statement st = null;
                                    Statement st1 = null;

                                    String dept = request.getParameter("dept");

                                    try {

                                        String batch = request.getParameter("batch");
                                        String sem = request.getParameter("sem");

                                        con = new dbcon().getConnection(dept);
                                        st = con.createStatement();
                                        st1 = con.createStatement();
                                        int count = 0;
                                        String sql = "select * from overallattendence where date='" + date + "'";
                                        ResultSet rs = st.executeQuery(sql);

                                        while (rs.next()) {

                                            String rollno = rs.getString("rollno");
                                            String date1 = String.valueOf(rs.getDate("date"));
                                            String reason = rs.getString("reason");

                                            sql = "select name from student_personal where rollno='" + rollno + "' and batch='" + batch + "'";
                                            ResultSet rs1 = st1.executeQuery(sql);
                                            if (rs1.next()) {

                                                String name = rs1.getString("name");
                                                String message = "";
                                                if (reason.equals("AB")) {
                                                    message = "Your ward " + name.toUpperCase() + "(" + rollno.toUpperCase() + ") has taken leave on " + date + ", Kindly contact yearincharge for further details";
                                                } else if (reason.equals("Previous Permission")) {
                                                    message = "Your ward " + name.toUpperCase() + "(" + rollno.toUpperCase() + ") has taken leave on " + date;
                                                } else if (reason.equals("Mediacal Leave")) {
                                                    message = "Your ward " + name.toUpperCase() + "(" + rollno.toUpperCase() + ") has taken leave due to medical reasons on " + date;
                                                } else if (reason.equals("Suspension")) {
                                                    message = "Your ward " + name.toUpperCase() + "(" + rollno.toUpperCase() + ") has taken leave on " + date + ", Please wait for further information";
                                                } else if (reason.equals("OD")) {
                                                    message = "Your ward " + name.toUpperCase() + "(" + rollno.toUpperCase() + ") has taken OD on " + date;
                                                }


                                %>

                                <tr>
                                    <td><input type="checkbox" id="selected<%=rollno%>" class="checkme" value="yes" checked></td>
                                    <td id="rollno<%=rollno%>"><%=rollno%></td>
                                    <td id="name<%=rollno%>"><%=name%></td>
                                    <td id="reason<%=rollno%>"><%=reason%></td>

                                    <td><%=message%></td>

                                    <td>

                                        <div id="<%=rollno%>sms" class="send"></div>



                                    </td>

                                </tr>      



                                <%
                                                count++;
                                            }
                                        }

                                        session.setAttribute("count", count);
                                        session.setAttribute("date", date);

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        if (st != null) {
                                            st.close();
                                        }
                                        if (st1 != null) {
                                            st1.close();
                                        }

                                        if (con != null) {
                                            con.close();
                                        }
                                    }
                                %>



                            </table>
                            <input type="hidden" name="dept" value="<%=dept%>">
                            <input type="hidden" id="date" value="<%=request.getParameter("datepicker")%>">
                            <br><br>   
                            <input type="submit" id="submit" value="submit">
                            <br><br> 
                        </form></center>

                </div></div></section>
    </body>

</html>

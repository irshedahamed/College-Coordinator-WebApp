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
        <%
            String dept = request.getParameter("dept");
            String batch = request.getParameter("batch");

        %>
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
                                <%            Connection con = null;
                                    //Statement st = null;
                                    PreparedStatement st1 = null;

                                    String message = request.getParameter("message");

                                    try {

                                        con = new dbcon().getConnection(dept);
                                        //st = con.createStatement();
                                        
                                        String sql = "";
                                        if (batch.equals("staff")) {
                                            sql = "select staffid as rollno,name as name,mobile1 from staff_general";
                                            st1=con.prepareStatement(sql);
                                        } else {
                                            sql = "select * from student_personal where  batch=? order by CONVERT(regno,UNSIGNED)";
                                            st1=con.prepareStatement(sql);
                                            st1.setString(1, batch);
                                        }
                                        ResultSet rs1 = st1.executeQuery();
                                        while (rs1.next()) {
                                            String rollno = rs1.getString("rollno");
                                            String regno = null;
                                            if (!batch.equals("staff")) {
                                                regno = rs1.getString("regno");
                                            }

                                            String name = rs1.getString("name");

                                            String phone;
                                            if (batch.equals("staff")) {
                                                phone = rs1.getString("mobile1");
                                            } else {
                                                phone = Parent.getNumber(rollno);
                                            }


                                %>

                                <tr>
                                    <td><input type="checkbox" id="selected<%=rollno%>" class="checkme" value="yes" checked></td>
                                        <%
                                            if (!batch.equals("staff")) {
                                        %>
                                    <td id="rollno<%=rollno%>"><%=regno + " (" + rollno + ")"%></td>
                                    <%
                                    } else {
                                    %>
                                    <td id="rollno<%=rollno%>"><%=rollno%></td>

                                    <%}%>
                                    <td id="name<%=rollno%>"><%=name%></td>

                                    <td id="mobile<%=rollno%>"><%=phone%></td>
                                    <td id="msg<%=rollno%>"><%=message.replace("$name$", name).replace("$id$", rollno)%></td>

                                    <td>

                                        <div id="<%=rollno%>sms" class="send"></div>



                                    </td>

                                </tr>      



                                <%

                                        }

                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    } finally {
                                        //if (st != null) {
                                          //  st.close();
                                        //}
                                        if (st1 != null) {
                                            st1.close();
                                        }

                                        if (con != null) {
                                            ;//con.close();
                                        }
                                    }
                                %>



                            </table>
                            <input type="hidden" name="dept" value="<%=dept%>">

                            <br><br>   
                            <input type="submit" id="submit" value="submit">
                            <br><br> 
                        </form></center>

                </div></div></section>
    </body>

</html>

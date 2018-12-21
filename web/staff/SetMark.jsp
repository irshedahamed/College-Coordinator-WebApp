<%-- 
    Document   : SetMark
    Created on : 16 Jul, 2017, 12:19:59 PM
    Author     : Irshed
--%>
<%@page import="Mark.Mark"%>
<%@page import="java.util.List"%>
<%@page import="Actor.Student"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/tabledesign.css" rel="stylesheet">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Set Mark</title>
        <link rel="stylesheet" href="../css/jquery-ui1.css">
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/NumberToWords.js"></script>
        <%
            String dept = request.getParameter("dept");
            String batch = request.getParameter("batch");
            String sec = request.getParameter("section");
            String sem = request.getParameter("sem");
            String exam = request.getParameter("exam");
            String subcode = request.getParameter("subject");
        %>
        <script type="text/javascript">
            $(document).ready(function () {
                var patt = /^[0-9]+$/;
                var result;
                var result1;
                var maxmark = $("#max").val();
                $(".outof").html("/" + $("#max").val());
                $("#max").on('change', function () {
                    maxmark = $(this).val();
                    $(".outof").html("/" + $(this).val());
                });
                $(".marks").on("change", function (e) {
                    //         console.log($(this)[0].id);
                    var id = $(this)[0].id;
                    var words = inWords(parseInt($(this).val()));
                    if ($(this).val() === 'N')
                        $("#words" + id).html("No Exam");
                    else if ($(this).val() === 'A')
                        $("#words" + id).html("Absent");
                    else
                        $("#words" + id).html(words);
                });
                $(".click").click(function () {
                    var but = $(this);
                    var id = $(this).closest('tr').children('td#roll').text();
                    var mark = $(this).closest('tr').children().children('.marks');
                    var flag1 = 0;
                    result = patt.test(mark.val());
                    result1 = (mark.val() === 'A' || mark.val() === 'N');
                    if (mark.val() === '' || (result === false && result1 === false))
                    {
                        mark.focus();
                        mark.css({"border-color": "rgb(193, 82, 82)",
                            "box-shadow": " 0 0 10px #f00"});
                        flag1 = 1;
                    } else {
                        mark.css({"border-color": "", "box-shadow": ""});

                        if (parseInt(mark.val()) > maxmark)
                        {

                            mark.focus();
                            mark.css({"border-color": "rgb(193, 82, 82)",
                                "box-shadow": " 0 0 10px #f00"});
                            flag1 = 1;
                        }
                    }
                    if (flag1 === 0) {
                        if (parseInt(maxmark) === 60) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 2)));
                            }
                        }
                        if (parseInt(maxmark) === 140) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 1.4)));
                            }
                        }
                        if (parseInt(maxmark) === 41) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 0.85)));
                            }
                        }
                        
                        var subcode = $("#code").text();
                        var type = $("#type").val();
                        var dept = $("#dept").val();
                        $.post("../UpdateMarks",
                                {
                                    dept: dept,
                                    exam: type,
                                    subject: subcode,
                                    mark: mark.val(),
                                    rollno: id}
                        , function (data) {
                            but.val(data);
                            but.css("background-color", "#149dd2");
                            but.css("color", "white");
                            but.prop("disabled", true);
                        });
                    }
                });
                $(".UpdateAll").click(function () {
                    var sbut = $(this);
                    sbut.css("background-color", "#149dd2");
                    sbut.css("color", "white");
                    sbut.prop("disabled", true);
                    $(".click").each(function () {
                        var but = $(this);
                        var id = $(this).closest('tr').children('td#roll').text();
                        var mark = $(this).closest('tr').children().children('.marks');
                        var flag2 = 0;
                        result = patt.test(mark.val());
                        result1 = (mark.val() === 'A' || mark.val() === 'N');
                        if (mark.val() === '' || (result === false && result1 === false))
                        {
                            mark.focus();
                            mark.css({"border-color": "rgb(193, 82, 82)",
                                "box-shadow": " 0 0 10px #f00"});
                            flag2 = 1;
                        } else {
                            mark.css({"border-color": "", "box-shadow": ""});

                            if (parseInt(mark.val()) > maxmark)
                            {

                                mark.focus();
                                mark.css({"border-color": "rgb(193, 82, 82)",
                                    "box-shadow": " 0 0 10px #f00"});
                                flag2 = 1;
                            }
                        }
                        if (flag2 !== 1) {
                            if (parseInt(maxmark) === 60) {
                                if (mark.val() !== 'A') {
                                    mark.val(Math.round((parseInt(mark.val()) / 2)));
                                }
                            }
                             if (parseInt(maxmark) === 140) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 1.4)));
                            }
                        }
                            if (parseInt(maxmark) === 41) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 0.85)));
                            }
                        }
                            var subcode = $("#code").text();
                            var type = $("#type").val();
                            var dept = $("#dept").val();
                            $.post("../UpdateMarks",
                                    {
                                        dept: dept,
                                        exam: type,
                                        subject: subcode,
                                        mark: mark.val(),
                                        rollno: id}
                            , function (data) {
                                but.val(data);
                                but.css("background-color", "#149dd2");
                                but.css("color", "white");
                                but.prop("disabled", true);
                            });
                            sbut.val("Updated");
                        }
                    });
                });
                $("#marks").submit(function () {
                    flag = 0;
                    $(".marks").each(function (index, value) {
                        result = patt.test($(this).val());
                        result1 = ($(this).val() === 'A' || $(this).val() === 'N');
                        if ($(this).val() === '' || (result === false && result1 === false))
                        {
                            $(this).focus();
                            $(this).css({"border-color": "rgb(193, 82, 82)",
                                "box-shadow": " 0 0 10px #f00"});
                            flag = 1;
                        } else {
                            $(this).css({"border-color": "", "box-shadow": ""});

                            if (parseInt($(this).val()) > maxmark)
                            {

                                $(this).focus();
                                $(this).css({"border-color": "rgb(193, 82, 82)",
                                    "box-shadow": " 0 0 10px #f00"});
                                flag = 1;
                            }
                        }
                    });
                    if (flag === 1)
                        return false;
                    else
                    {
                        if (parseInt(maxmark) === 60)
                        {
                            $(".marks").each(function (index, value) {
                                if ($(this).val() !== 'A') {
                                    $(this).val(Math.round((parseInt($(this).val()) / 2)));
                                }
                            });
                        }
                            if (parseInt(maxmark) === 140) {
                            if (mark.val() !== 'A') {
                                mark.val(Math.round((parseInt(mark.val()) / 1.4)));
                            }
                        }
                    }
                });
            });
        </script>
    <center style="background-color: #f5f5f5;">
        <img src="../images/logo2.png" height="165px" width="700px" />	</center>
</head>

<body class="home page page-id-115 page-template-default has-toolbar">
<center><h1>Mark Update for <%=dept.toUpperCase()%> Department <%=batch%> batch  <%=sem%>th semester <%=sec%> section</h1></center>

<center><h3 style="color: red;">Note- use "A" for Absentees</h3></center>

<div id="wrapper" class="toggled">
    <style rel="stylesheet">
        .bordered td{
            padding: 0px;
            text-align: center;
        }
        .bordered th{
            text-align: center;
        }
    </style>
    <section class="section-content section-bg" style="background-color:white;"><div class="container clearfix"><div class="entry-content">

                <section class="landing">
                    <form action=""  id="marks" method="post">  
                        <fieldset>
                            <div align="right" style="margin-right: 150px;">
                                <br>
                                Max Marks:
                                <select style=" background: transparent;font-size: 14px;height: 29px;padding: 5px;width:150px;" id="max" >
                                    <%if (exam.contains("model")) {%>
                                    <option selected>100</option>
                                    <option >140</option>
                                    <%} else if (exam.contains("unit")) {%>
                                    <option selected>75</option>
                                    <%} else {%>
                                    <option selected>30</option>
                                    <option >60</option>

                                    <%}%>
                                    <br> 
                                </select>
                            </div>
                            <br>
                            <center>
                                <input type="hidden" value="<%=exam%>" id="type"/>
                                <input type="hidden" value="<%=dept%>" id="dept"/>
                                <table class="bordered">
                                    <thead>
                                        <tr>
                                            <th>Sno</th>
                                            <th name="cc">Roll No</th>
                                            <th>Name</th>
                                            <th>Register No</th>
                                            <th id="code"><%=subcode%></th>
                                            <th>In Words</th>
                                            <th>Update</th>
                                        </tr>
                                    </thead>
                                    <%
                                        List<Student> list = Student.getAll(dept, batch, sec);
                                        int i = 0;
                                        Mark m = new Mark();
                                        m.setSubcode(subcode);
                                        m.setType(exam);
                                        for (Student stu : list) {
                                    %>

                                    <tr>
                                        <td><%=i + 1%></td>
                                        <td id="roll"><%=stu.getId()%></td>        
                                        <td><%=stu.getName().toUpperCase()%></td>
                                        <td><%=stu.getRegno()%></td>
                                        <%
                                            String a1 = stu.getId() + "_" + i;
                                            i++;
                                            m.setRollno(stu.getId());
                                        %>

                                        <td width="150px">
                                            <% if (!Mark.isMarkAvailable(dept, m)) {%>
                                            <input type="text" style="background-color: white; " class="marks" size="3" maxlength="3" id="<%=a1%>">
                                            <% } else {%>
                                            <input type="text" style="background-color: white; " class="marks" size="3" maxlength="3" id="<%=a1%>" value="<%=Mark.getUserMark(dept, m).getMark()%>">
                                            <% }%><span class="outof"></span></td>
                                        <td id="words<%=a1%>"></td>
                                        <td style="padding: 10px;"><input type="button" class="click" id="submit"  value="Update" /></td>
                                    </tr> <% }%>        
                                </table>
                            </center>
                            <br>
                            <center>
                                <input type="button" class="UpdateAll" id="submit" value="Update All" ></center>
                        </fieldset> 
                    </form>  
                </section></div></div></section>
    <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>   
</html>
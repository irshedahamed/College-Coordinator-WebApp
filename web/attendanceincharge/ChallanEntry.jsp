<%-- 
    Document   : ChallanEntry
    Created on : 7 Jan, 2018, 9:55:13 PM
    Author     : irshed
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Fee.TechProcessResponse"%>
<%@page import="Fee.IBResponse"%>
<%@page import="java.util.ArrayList"%>
<%@page import="General.AcademicYear"%>
<%@page import="Fee.MUResponse"%>
<%@page import="Fee.Fee"%>
<%@page import="General.Batch"%>
<%@page import="Actor.Student"%>
<%@page import="java.util.List"%>
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
        <title>Challan Entry</title>
        <link rel="stylesheet" href="../css/jquery-ui1.css">
        <script type = "text/javascript"  src = "${pageContext.request.contextPath}/js/jquery.js"></script>
        <link type="text/css" media="all" href="../wp-content/cache/autoptimize/css/autoptimize_0ec4a90d60c511554f757138ccde0bea.css" rel="stylesheet" /><title>Home</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> 
        <script>
            $(document).ready(function () {
                $(".click").click(function () {
                    var but = $(this);
                    var tr = but.closest('tr');
                    var rollno = $(this).closest('tr').children('td#roll').text();
                    var mup = $(this).closest('tr').children().children('.mup');
                    var mop = $(this).closest('tr').children().children('.mop');
                    var date = $(this).closest('tr').children().children('.date');
                    var flag = 0;
                    if (mup.val() === "") {
                        mup.focus();
                        mup.css({"border-color": "rgb(193, 82, 82)",
                            "box-shadow": " 0 0 10px #f00"});
                        flag = 1;
                    } else {
                        mup.css({"border-color": "", "box-shadow": ""});
                    }
                    if (mop.val() === "") {
                        mop.focus();
                        mop.css({"border-color": "rgb(193, 82, 82)",
                            "box-shadow": " 0 0 10px #f00"});
                        flag = 1;
                    } else {
                        mop.css({"border-color": "", "box-shadow": ""});
                    }
                    if (date.val() === "") {
                        date.focus();
                        date.css({"border-color": "rgb(193, 82, 82)",
                            "box-shadow": " 0 0 10px #f00"});
                        flag = 1;
                    } else {
                        date.css({"border-color": "", "box-shadow": ""});
                    }

                    if (flag === 0) {
                        $.get("../EntryChallan", {
                            rollno: rollno,
                            mop: mop.val(),
                            mup: mup.val(),
                            date: date.val()
                        }
                        , function (data) {
                            but.val(data);
                            var result = $.trim(data);
                            but.css("background-color", "#149dd2");
                            but.css("color", "white");
                            but.prop("disabled", true);
                            if (result === "Paid") {
                                tr.css("background-color", " #45d821");
                            } else {
                                tr.css("background-color", "red");
                            }
                        });
                    }
                });
            });

        </script>
    <center style="background-color: #f5f5f5;">
        <img src="../images/logo2.png" height="165px" width="700px" />	</center>
</head>

<body class="home page page-id-115 page-template-default has-toolbar">

    <div id="wrapper" class="toggled">
        <style rel="stylesheet">
            .bordered td{
                padding: 4px;
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
                                <br>
                                <center>
                                    <table class="bordered">
                                        <thead>
                                            <tr>
                                                <th>Register Number</th>
                                                <th >Roll No</th>
                                                <th>Name</th>
                                                <th>Tuition</th>
                                                <th>Transport</th>
                                                <th>Placement</th>
                                                <th>Develop</th>
                                                <th>Total Amount</th>
                                                <th>Mode of Payment</th>
                                                <th>MUP No</th>
                                                <th>Txn Date</th>
                                                <th>Status</th>
                                            </tr>
                                        </thead>
                                        <%
                                            String dept = request.getParameter("dept");
                                            String username = session.getAttribute("username").toString();
                                            String batch = Batch.getByYrIncharge(username).getBatch();
                                            List<Student> list = Student.getAll(dept, batch, "_");
                                            for (Student s : list) {
                                                Fee f = Fee.getFeeById(s.getId());
                                                int total = Integer.parseInt(f.getTution());
                                                total += Integer.parseInt(f.getTransport());
                                                total += Integer.parseInt(f.getPlacement());
                                                total += Integer.parseInt(f.getDevelopment());
                                                List<MUResponse> li = MUResponse.getPaidMUP(s.getId());
                                                AcademicYear feeyear = AcademicYear.getFeeYear();
                                                if (!li.isEmpty()) {
                                                    for (MUResponse mr : new ArrayList<MUResponse>(li)) {
                                                        if (!(mr.getAcyear().equals(feeyear.getYear()))) {
                                                            li.remove(mr);
                                                        }
                                                    }
                                                }

                                        %>
                                        <tr>
                                            <td><%=s.getRegno()%></td> 
                                            <td id="roll"><%=s.getId()%></td>
                                            <td><%=s.getName()%></td>
                                            <td><%=f.getTution()%></td>
                                            <td><%=f.getTransport()%></td>
                                            <td><%=f.getPlacement()%></td>        
                                            <td><%=f.getDevelopment()%></td>
                                            <td><b><%=total%></b></td>  
                                            <%
                                                if (!li.isEmpty()) {
                                                    MUResponse mr = li.get(0);
                                                    String date;
                                                    IBResponse i = IBResponse.getByMup(mr.getRefno());
                                                    String mop = "Online";
                                                    if (i != null) {
                                                        String[] da = i.getTxndate().split(" ");
                                                        date = da[0];
                                                        if (i.getJournalno().equals("challan")) {
                                                            mop = "Challan";
                                                        }

                                                    } else {
                                                        TechProcessResponse t = TechProcessResponse.getByMup(mr.getRefno());
                                                        String[] da = t.getTime().split(" ");
                                                        date = new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("dd-MM-yyyy").parse(da[0]));

                                                    }
                                            %>     
                                            <td><b><%=mop%></b></td>
                                            <td><b><%=mr.getRefno()%></b></td>
                                            <td><b><%=date%></b></td>
                                            <td><b>Paid</b></td>

                                            <%    } else {
                                            %>
                                            <td><select class="mop" >
                                                    <option value="" selected>Select</option>
                                                    <option value="challan">Challan</option>
                                                </select></td>
                                            <td><input type="text" style="background-color: white; "  class="mup" ></td>
                                            <td><input type="date" id="datepicker" class="date"  /></td>
                                            <td style="padding: 10px;"><input type="button" class="click" id="submit"  value="Pay" /></td>
                                                <% }%>
                                        </tr>  
                                        <%                                            }
                                        %>
                                    </table>
                                </center>
                                <br>
                            </fieldset> 
                        </form>  
                    </section></div></div></section>
        <script type="text/javascript" defer src="../wp-content/cache/autoptimize/js/autoptimize_b9dd1eab85c72cde0d539343c70a43c2.js"></script>
</body>   
</html>
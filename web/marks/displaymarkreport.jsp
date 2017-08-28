<%-- 
    Document   : newjsp2
    Created on : Aug 16, 2015, 9:58:36 AM
    Author     : vijayashree
--%>


<%@page import="java.io.File"%>
<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>

        <title>Report generation</title>
        <style>
            /*
   To change this license header, choose License Headers in Project Properties.
   To change this template file, choose Tools | Templates
   and open the template in the editor.
            */
            /* 
                Created on : 26 May, 2015, 3:36:50 PM
                Author     : aravind
            */



            table {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;

                overflow-x : auto; 
            }


            .bordered {
                border: solid #ccc 1px;
                -moz-border-radius: 6px;
                -webkit-border-radius: 6px;
                border-radius: 6px;
                -webkit-box-shadow: 0 1px 1px #ccc; 
                -moz-box-shadow: 0 1px 1px #ccc; 
                box-shadow: 0 1px 1px #ccc;         
            }

            .bordered tr:hover {
                background: #fbf8e9;
                -o-transition: all 0.1s ease-in-out;
                -webkit-transition: all 0.1s ease-in-out;
                -moz-transition: all 0.1s ease-in-out;
                -ms-transition: all 0.1s ease-in-out;
                transition: all 0.1s ease-in-out;     
            }    

            .bordered td, .bordered th {
                border-left: 1px solid #ccc;
                border-top: 1px solid #ccc;
                padding: 4px;
                text-align: left;    
            }

            .bordered th {
                background-color: #dce9f9;
                background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
                background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
                background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
                -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
                -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
                box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
                border-top: none;
                text-shadow: 0 1px 0 rgba(255,255,255,.5); 
            }

            .bordered td:first-child, .bordered th:first-child {
                border-left: none;
            }

            .bordered th:first-child {
                -moz-border-radius: 6px 0 0 0;
                -webkit-border-radius: 6px 0 0 0;
                border-radius: 6px 0 0 0;
            }

            .bordered th:last-child {
                -moz-border-radius: 0 6px 0 0;
                -webkit-border-radius: 0 6px 0 0;
                border-radius: 0 6px 0 0;
            }

            .bordered th:only-child{
                -moz-border-radius: 6px 6px 0 0;
                -webkit-border-radius: 6px 6px 0 0;
                border-radius: 6px 6px 0 0;
            }

            .bordered tr:last-child td:first-child {
                -moz-border-radius: 0 0 0 6px;
                -webkit-border-radius: 0 0 0 6px;
                border-radius: 0 0 0 6px;
            }

            .bordered tr:last-child td:last-child {
                -moz-border-radius: 0 0 6px 0;
                -webkit-border-radius: 0 0 6px 0;
                border-radius: 0 0 6px 0;
            }

            h2{
                font-size: 18px;
                margin: 0px;
                padding: 0px;
            }
            thead {display: table-header-group;}
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">



        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.3.js"></script>
        <script type="text/javascript" src="../js/jspdf.js"></script>
        <script type="text/javascript" src="../js/from_html.js"></script>
        <script type="text/javascript" src="../js/split_text_to_size.js"></script>
        <script type="text/javascript" src="../js/standard_fonts_metrics.js"></script>
        <script type="text/javascript" src="../js/cell.js"></script>
        <script type="text/javascript" src="../js/FileSaver.js"></script>


        <script type="text/javascript">
            $(document).ready(function () {

                $("#exportpdf").click(function () {
                    var pdf = new jsPDF('l', 'pt', 'a4');
                    // source can be HTML-formatted string, or a reference
                    // to an actual DOM element from which the text will be scraped.
                    pdf.setFont('Times', 'bold');

                    pdf.text(300, 30, 'St.Josephs Institute of Technology');
                    pdf.text(300, 30, 'MARK SHEET');

                    pdf.setFont('Times', 'normal');
                    source = $('#yourTableIdName1')[0];
                    source1 = $('#yourTableIdName') [0];

                    // we support special element handlers. Register them with jQuery-style 
                    // ID selector for either ID or node name. ("#iAmID", "div", "span" etc.)
                    // There is no support for any other type of selectors 
                    // (class, of compound) at this time.
                    specialElementHandlers = {
                        // element with id of "bypass" - jQuery style selector
                        '#bypassme': function (element, renderer) {
                            // true = "handled elsewhere, bypass text extraction"
                            return true
                        }
                    };
                    margins = {
                        top: 50,
                        bottom: 60,
                        left: 60,
                        width: 1000,
                    };
                    margins1 = {
                        top: 50,
                        bottom: 60,
                        left: 60,
                        width: 1000,
                    };
                    // all coords and widths are in jsPDF instance's declared units
                    // 'inches' in this case
                    pdf.fromHTML(source1, // HTML string or DOM elem ref.
                            margins.left, // x coord
                            margins.top, {// y coord
                                'width': margins.width, // max width of content on PDF
                                'elementHandlers': specialElementHandlers
                            },
                            function (dispose) {
                                // dispose: object with X, Y of the last line add to the PDF 
                                //          this allow the insertion of new lines after html
                                pdf.save('stjosephsportal.pdf');
                            }, margins);
                });

            });
        </script>
    </head>

    <body>

        <%
            String a = request.getParameter("word");
            if (a != null) {
                if (a.equals("yes")) {
                    String formName = "";
                    formName = "test.doc";
                    File filepath = new File(formName);
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=" + filepath);
                }
            }
            String aa1 = request.getParameter("flag");
            if (aa1 != null) {
                if (aa1.equals("one")) {
                    String formName = "";
                    formName = "test.doc";
                    File filepath = new File(formName);
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=" + filepath);
                }
            }
            String dept = request.getParameter("dept");
            if (dept == null) {
                dept = session.getAttribute("deptname").toString();
            }
            String batch = request.getParameter("batch");
            String sec = request.getParameter("section");
            Connection con = new dbcon().getConnection("sjitportal");

            String sem = request.getParameter("sem");
            String exam = request.getParameter("exam");
            String ayear = request.getParameter("ayear");

            String examm1 = exam.toUpperCase();

            String regulation = null;
            String subcode, rollno, name;

            Statement st = con.createStatement();
            String sql = "select * from regulations where batch='" + batch + "'";
            ResultSet rs = st.executeQuery(sql);
            while (rs.next()) {
                regulation = rs.getString("regulation");
            }
            session.setAttribute("regulation", regulation);
            session.setAttribute("sem", sem);
            session.setAttribute("batch", batch);
            session.setAttribute("sec", sec);
            session.setAttribute("dept", dept);
            session.setAttribute("exam", exam);
            rs.close();
            st.close();
            con.close();
            int count = 0;
        %>
    <body>
        <div id="yourTableIdName1">
            <center><h1><u>St.Joseph's Institute of Technology</u></h1></center>
            <center><h1><u>DEPARTMENT OF <%=dept.toUpperCase()%></u></h1></center>
            <center><h1><u>BATCH:</u> <%=batch%>      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                      <u> SEM:</u> <%=sem%></h1></center>
            <center><h1><%=examm1%> EXAM MARK LIST</h1></center>
        </div>
        <div id="yourTableIdName">
            <center>   <table style="width: 1020px;font-size: 20px;" border="3" class="bordered">
                    <thead>

                        <tr>
                            <th name="cc">Roll No</th>
                            <th>Register No</th>
                            <th>Name</th>
                                <%
                                    con = new dbcon().getConnection(dept);
                                    st = con.createStatement();

                                    String sql1 = "select * from subject_sem_table where regulation='" + regulation + "' and sem='" + sem + "' and (ayear like '%elective%" + ayear + "%' or ayear like 'all')  and subtype='theory' order by subcode";
                                    rs = st.executeQuery(sql1);

                                    while (rs.next()) {

                                        subcode = rs.getString("subcode");
                                        count++;


                                %>



                            <th><%=subcode%></th>

                            <% }
                                rs.close();
                            %>
                        </tr>
                    </thead>

                    <%
                        String sql2 = "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='" + batch + "' and sec='" + sec + "' order by sno,name";
                        rs = st.executeQuery(sql2);
                        while (rs.next()) {
                            rollno = rs.getString("rollno").toUpperCase();
                            String regno = rs.getString("regno");
                            name = rs.getString("name").toUpperCase();
                    %>
                    <tr>
                        <td><%=rollno%></td>        
                        <td><%=regno%></td>        

                        <td><%=name%></td>
                        <%

                            String sql5 = "select * from subject_sem_table where regulation='" + regulation + "' and sem='" + sem + "' and (ayear like '%elective%" + ayear + "%' or ayear like 'all')  and subtype='theory' order by subcode";
                            Statement st1 = con.createStatement();
                            ResultSet rs1 = st1.executeQuery(sql5);
                            int m = 0, c = 0;
                            float m3 = 0;
                            float sum = 0;

                            while (rs1.next()) {

                                subcode = rs1.getString("subcode");
                                String sql6 = "select * from marks_table where rollno='" + rollno + "' and subcode='" + subcode + "'";
                                Statement st2 = con.createStatement();
                                ResultSet rs2 = st2.executeQuery(sql6);

                                if (rs2.next()) {

                                    String m1 = rs2.getString("model" + exam.substring(exam.length() - 1, exam.length()));
                                    String c1 = rs2.getString("cycle" + exam.substring(exam.length() - 1, exam.length()));
                                    if (m1 == null || c1 == null) {
                                        m1 = "0";
                                        c1 = "0";
                                    }
                                    if (m1.equals("A")) {
                                        m1 = "0";
                                    }
                                    if (c1.equals("A")) {
                                        c1 = "0";
                                    }

                                    boolean noexam = false;

                                    if (c1 != null) {
                                        if (c1.equals("N")) {
                                            noexam = true;
                                        }
                                    }

                                    if (noexam) {
                                        m3 = sum = Integer.parseInt(m1);
                                    } else {
                                        m = Integer.parseInt(m1);
                                        c = Integer.parseInt(c1);

                                        sum = m + c;
                                        sum = sum / 130;
                                        m3 = sum * 100;
                                    }
                                    int aa = Math.round(m3);


                        %>


                        <td><%=aa%></td>

                        <%

                        } else {
                        %>
                        <td>   
                            <%
                                        }

                                        rs2.close();
                                    }
                                    rs1.close();
                                }
                                rs.close();

                                if (st != null) {
                                    st.close();
                                }
                                if (con != null) {
                                    con.close();
                                }
                            %>
                    </tr>
                </table></center></div>

    <center> <a href ="displaymarkreport.jsp?word=yes&batch=<%=batch%>&sem=<%=sem%>&section=<%=sec%>&exam=<%=exam%>" >Export to word</a></center>
    <br><br>


</body>

</html>
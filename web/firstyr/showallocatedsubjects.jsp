<%-- 
    Document   : showallocatedsubjects
    Created on : 29 May, 2015, 12:18:33 AM
    Author     : aravind
--%>

<%@page import="com.action.Find"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dbconnection.dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        try {
            String username = session.getAttribute("username").toString();
            String password = session.getAttribute("password").toString();

            Connection connn = new dbcon().getConnection("login");
            Statement sttt = connn.createStatement();
            String type1 = "";
            ResultSet rsss = sttt.executeQuery("select * from other_login_details where id='" + username + "' and password='" + password + "'");
            if (rsss.isBeforeFirst()) {
                while (rsss.next()) {
                    type1 = rsss.getString("type");
                }
                if (type1.equals("first")) {
    %>

    <head>
        <style>
            .omega
            {
                mso-page-orientation:landscape;
            }
        </style>
        <style>
            table.bordered {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;
                width:70%;
                overflow-x : auto; 
                background: #ffffff
            }


            table { page-break-inside:auto }
            tr    { page-break-inside:avoid; page-break-after:auto }
            td    { page-break-inside:avoid; page-break-after:auto }

            table.bordered1 {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;
                width: 100%; 
                height: 170px;
                overflow-x : auto; 
                background: #ffffff
            }
            .bordered1 td, .bordered1 th {


                text-align: left;    
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

                padding: 10px;
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
        </style>
    <div class='omega'>
        <center> <h1>St.Joseph's Institute of Technology</h1></center>
    </head>
    <body><center>
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
            int totalhrs = 0;
            String id = request.getParameter("staff");
            String acyear = request.getParameter("acyear");
            if (id != null) {
                if (id.equals("all")) {


        %>
        <center><h2 style="font-size: 28px;">Department of  Science & Humanities</h2></center>
        <br>

        <center><h3 style="font-size: 22px;">Subject Allotment 20<%=acyear%>-<%=(Integer.parseInt(acyear) + 1)%></h3></center>
        <br>
        <table class="bordered" name='suballoc'>
            <tr>
                <th>S No</th>
                <th>NAME OF THE STAFF</th>
                <th> THEORY </th>
                <th>SEM </th>
                <th>DEPT</th>
                <th>SEC</th>
                <th>THEORY HRS</th>
                <th>LAB </th>
                <th>SEM </th>
                <th>DEPT</th>
                <th>SEC</th>
                <th>LAB HRS</th>
                <th>TOTAL HRS</th>
                <th>In Charge</th>
            </tr>



            <%
                Connection con = new dbcon().getConnection("first");
                Connection consub = new dbcon().getConnection("sjitportal");
                String sql;
                if (username.contains("mat")) {
                    sql = "select staffid,staffname from staff_table where staffid like '%ma%' or staffid like '%MA%' or staffid like '%EN%' or staffid like '%en%'";
                } else {
                    sql = "select staffid,staffname from staff_table where staffid like '%PY%' or staffid like '%py%' or staffid like '%sc%' or staffid like '%SC%'";
                }

                Statement st = con.createStatement();
                ResultSet rs1 = st.executeQuery(sql);
                Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
                Statement stsubj = consub.createStatement();
                int sno = 0;
                while (rs1.next()) {
                    int wflag = 0;
                    int count1 = 0, count2 = 0, sp = 0;
                    String staffid = rs1.getString("staffid").toString();
                    String staffname = rs1.getString("staffname").toString();

                    if (request.getParameter("sem").equals("Even")) {
                        sql = "select SUM(CONVERT(no_of_hours,UNSIGNED INT)) as value1 from subject_allocation where staffid='" + staffid + "' and acyear='" + acyear + "' and (sem like '02' or sem like '04' or sem like '06' or sem like '08')  ";
                    } else {
                        sql = "select SUM(CONVERT(no_of_hours,UNSIGNED INT)) as value1 from subject_allocation where staffid='" + staffid + "' and acyear='" + acyear + "' and (sem like '01' or sem like '03' or sem like '05' or sem like '07')  ";
                    }
                    Statement sthrs = con.createStatement();
                    ResultSet rshrs = sthrs.executeQuery(sql);
                    String totalnohrs = "---";
                    if (rshrs.next()) {
                        totalnohrs = String.valueOf(rshrs.getInt("value1"));
                    }
                    rshrs.close();
                    if (sthrs != null) {
                        sthrs.close();
                    }

                    if (request.getParameter("sem").equals("Even")) {
                        sql = "select * from subject_allocation where staffid='" + staffid + "' and subtype='theory' and acyear='" + acyear + "' and (sem like '02' or sem like '04' or sem like '06' or sem like '08')";
                    } else {
                        sql = "select * from subject_allocation where staffid='" + staffid + "' and subtype='theory' and acyear='" + acyear + "' and (sem like '01' or sem like '03' or sem like '05' or sem like '07')";
                    }

                    ResultSet rs2 = st1.executeQuery(sql);
                    while (rs2.next()) {
                        count1++;
                    }

                    if (request.getParameter("sem").equals("Even")) {
                        sql = "select * from subject_allocation where staffid='" + staffid + "' and subtype='lab' and acyear='" + acyear + "' and (sem like '02' or sem like '04' or sem like '06' or sem like '08')";
                    } else {
                        sql = "select * from subject_allocation where staffid='" + staffid + "' and subtype='lab' and acyear='" + acyear + "' and (sem like '01' or sem like '03' or sem like '05' or sem like '07')";
                    }

                    String work = "", wsql;

                    wsql = "select a.works as other from other_incharge a where a.staffid='" + staffid + "' and a.acyear='" + acyear + "' and a.semister='" + request.getParameter("sem") + "'";
                    Statement wstmt = con.createStatement();
                    ResultSet wrs = wstmt.executeQuery(wsql);
                    if (wrs.next()) {
                        work += wrs.getString("other");
                    }

                    wsql = "select * from councillor where staffid='" + staffid + "' and academicyr='" + acyear + "' and semister='" + request.getParameter("sem") + "'";
                    wrs = wstmt.executeQuery(wsql);

                    if (wrs.next()) {
                        if (!work.endsWith(",")) {
                            work += ",";
                        }

                        work += "Councillor(" + wrs.getString("batch") + "-" + wrs.getString("dept").toUpperCase() + "-" + wrs.getString("sec").toUpperCase() + ")";
                    } else if (work.endsWith(",")) {
                        work = work.substring(0, work.length() - 1);
                    }

                    if (work == "") {
                        work = "---";
                    }

                    ResultSet rs3 = st2.executeQuery(sql);
                    while (rs3.next()) {
                        count2++;
                    }
                    if (count1 >= count2) {
                        sp = count1;
                    } else {
                        sp = count2;
                    }
                    rs2.beforeFirst();
                    rs3.beforeFirst();
                    totalhrs = 0;
                    sno++;
            %>
            <tr>
                <td rowspan="<%=sp%>">
                    <%=sno%>
                <td rowspan="<%=sp%>">
                    <%=staffname%>
                </td>





                <%
                    int i = 0;
                    String subcode, dept, sec, sem, hrs = "", subcode1 = "", dept1 = "", sec1 = "", sem1 = "", hrs1 = "";
                    if (sp == 0) {
                %>
                <td>---</td><td>----</td>
                <td>---</td><td>----</td>
                <td>---</td><td>---</td>
                <td>---</td><td>---</td>
                <td>---</td><td>---</td>

                <%if (wflag == 0) {%>
                <td rowspan="<%=sp%>">---</td>
                <td rowspan="<%=sp%>"><%=work%></td>
                <%wflag = 1;
                                  }%>

                <%
                    }
                    while (i < sp) {
                        if (rs2.next()) {

                            subcode = rs2.getString("subcode");
                            dept = rs2.getString("dept");
                            sec = rs2.getString("sec").toUpperCase();
                            sem = rs2.getString("sem");
                            hrs = rs2.getString("no_of_hours");
                            if (hrs == null || hrs.equals("")) {
                                hrs = "0";
                            }
                            totalhrs = totalhrs + Integer.parseInt(hrs);
                        } else {
                            subcode = " ";
                            dept = " ";
                            sec = " ";
                            sem = " ";
                            hrs = " ";

                        }

                        if (rs3.next()) {

                            subcode1 = rs3.getString("subcode");
                            dept1 = rs3.getString("dept");
                            sec1 = rs3.getString("sec").toUpperCase();
                            sem1 = rs3.getString("sem");
                            hrs1 = rs3.getString("no_of_hours");
                            if (hrs1 == null) {
                                hrs1 = "0";
                            }
                            totalhrs = totalhrs + Integer.parseInt(hrs1);
                        } else {
                            subcode1 = " ";
                            dept1 = " ";
                            sec1 = " ";
                            sem1 = " ";
                            hrs1 = " ";
                        }

                %>

                <%
                %>


                <% if (!subcode.equals(" ")) {

                        ResultSet rssub = stsubj.executeQuery("select subname from subject_table where subcode='" + subcode + "'");

                        String subjname = "";
                        if (rssub.next()) {
                            subjname = rssub.getString("subname");
                        }

                %>
                <td><%=subcode.toUpperCase()%>-<%=subjname%></td><td> <%=sem%> </td><td><%=dept.toUpperCase()%></td><td><%=sec%></td>
                <td><%=hrs%></td>
                <% } else {
                %>
                <td>---</td><td>----</td><td>----</td><td>----</td><td>----</td>
                <%}

                %>
                <% if (!subcode1.equals(" ")) {
                        ResultSet rssub = stsubj.executeQuery("select subname from subject_table where subcode='" + subcode1 + "'");

                        String subjname = "";
                        if (rssub.next()) {
                            subjname = rssub.getString("subname");
                        }
                %>
                <td><%=subcode1.toUpperCase()%>-<%=subjname%> </td><td><%=sem1%></td><td><%=dept1.toUpperCase()%></td><td><%=sec1%></td>
                <td><%=hrs1%></td>


                <%if (wflag == 0) {%>
                <td rowspan="<%=sp%>"><%=totalnohrs%></td>
                <td rowspan="<%=sp%>"><%=work%></td>
                <%wflag = 1;
                                  }%>
            </tr>
            <% } else {%>
            <td>----</td><td>----</td><td>----</td><td>----</td><td>----</td><%}%>
            <%if (wflag == 0) {%>
            <td rowspan="<%=sp%>"><%=totalhrs%></td> 
            <td rowspan="<%=sp%>"><%=work%></td>
            <%wflag = 1;
                                  }%>

            </tr>
            <%
                    i++;
                }

            %>





            <%
            %>







            <%                     }

            %>
        </table>
        <%                    if (stsubj != null) {
                stsubj.close();
            }
            if (consub != null) {
                consub.close();
            }
        } else {


        %>
        <table class="bordered">
            <tr>
                <th><center>BATCH</center></th>
            <th><center>SEM</center></th>
            <th><center>DEPARTMENT</center></th>
            <th><center>SECTION</center></th>
            <th><center>SUBJECT CODE</center></th>
            <th><center>SUBJECT NAME</center></th>
            <th><center>In Charge</center></th>  
            </tr>

            <%                Connection con = new dbcon().getConnection("first");
                Connection con1 = new dbcon().getConnection("sjitportal");
                Statement st = con.createStatement();
                Statement st1 = con1.createStatement();
                String sql;
                if (request.getParameter("sem").equals("Even")) {
                    sql = "select * from subject_allocation where staffid='" + id + "'  and acyear='" + acyear + "' and (sem like '02' or sem like '04' or sem like '06' or sem like '08')";
                } else {
                    sql = "select * from subject_allocation where staffid='" + id + "'  and acyear='" + acyear + "' and (sem like '01' or sem like '03' or sem like '05' or sem like '07')";
                }

                ResultSet rs1 = st.executeQuery(sql);

                ResultSet rs2;
                String batch, subcode, subname = null, dept, sec, sem;
                int wflag = 0;
                String work = "", wsql;

                wsql = "select a.works as other from other_incharge a where a.staffid='" + id + "' and a.acyear='" + acyear + "' and a.semister='" + request.getParameter("sem") + "'";
                Statement wstmt = con.createStatement();
                ResultSet wrs = wstmt.executeQuery(wsql);
                if (wrs.next()) {
                    work += wrs.getString("other");
                }

                wsql = "select * from councillor where staffid='" + id + "' and academicyr='" + acyear + "' and semister='" + request.getParameter("sem") + "'";
                wrs = wstmt.executeQuery(wsql);

                if (wrs.next()) {
                    if (!work.endsWith(",")) {
                        work += ",";
                    }

                    work += "Councillor(" + wrs.getString("batch") + "-" + wrs.getString("dept").toUpperCase() + "-" + wrs.getString("sec").toUpperCase() + ")";

                } else if (work.endsWith(",")) {
                    work = work.substring(0, work.length() - 1);
                }

                while (rs1.next()) {
                    batch = rs1.getString("batch");
                    sem = rs1.getString("sem");
                    dept = rs1.getString("dept");
                    subcode = rs1.getString("subcode");
                    sec = rs1.getString("sec").toUpperCase();
                    rs2 = st1.executeQuery("select subname from subject_table where subcode='" + subcode + "'");
                    while (rs2.next()) {
                        subname = rs2.getString("subname");
                    }

            %>
            <tr>
                <td><%=batch%></td>
                <td><%=sem%></td>
                <td><%=dept%></td>
                <td><%=sec%></td>
                <td><%=subcode%></td>
                <td><%=subname%></td>
                <%if (wflag == 0) {%>
                <td ><%=work%></td>
                <%wflag = 1;
                              } else {%>
                <td></td>
                <%}%>
            </tr>
            <%
                }

                if (st != null) {
                    sttt.close();
                }
                if (con != null) {
                    con.close();
                }

                if (st1 != null) {
                    st1.close();
                }
                if (con1 != null) {
                    con1.close();
                }
            %>
        </table>
    </center>
    <% }
                }%>



    <br>
    <br>
    <br>
    <%
        if (id.equals("all")) {

    %>
    <center> <h1>St.Joseph's Institute of Technology</h1></center>
    <center><h2 style="font-size: 28px;">Department of Science&Humanities</h2></center>
    <br>

    <center><h3 style="font-size: 22px;">Subject Allotment 20<%=acyear%>-<%=(Integer.parseInt(acyear) + 1)%></h3></center>
    <br>
    <table class="bordered" name='suballoc'>
        <thead>
            <tr>
                <th>S no</th>
                <th>Name of the Staff</th>
                <th>In-Charge of other activities </th>
                <th>Theory Hrs</th>
                <th>Lab Hrs</th>
                <th>Total No. of Hours</th>
                <th>Signature</th>
            </tr>
        </thead>

        <%
            Connection conn = new dbcon().getConnection("first");
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery("select a.staffid,a.staffname,b.tittle from staff_table a,staff_general b where a.staffid=b.staffid order by b.desg desc,b.staffid asc");

            int sno = 0;
            while (rs.next()) {

                String staffid = rs.getString("staffid");
                String staffname = rs.getString("tittle") + rs.getString("staffname");

                String work = "", wsql;

                wsql = "select a.works as other from other_incharge a where a.staffid='" + staffid + "' and a.acyear='" + acyear + "' and a.semister='" + request.getParameter("sem") + "'";
                Statement wstmt = conn.createStatement();
                ResultSet wrs = wstmt.executeQuery(wsql);
                if (wrs.next()) {
                    work += wrs.getString("other");
                }

                wsql = "select * from councillor where staffid='" + staffid + "' and academicyr='" + acyear + "' and semister='" + request.getParameter("sem") + "'";
                wrs = wstmt.executeQuery(wsql);

                if (wrs.next()) {
                    if (!work.endsWith(",")) {
                        work += ",";
                    }

                    work += "Councillor(" + wrs.getString("batch") + "-" + wrs.getString("dept").toUpperCase() + "-" + wrs.getString("sec").toUpperCase() + ")";

                } else if (work.endsWith(",")) {
                    work = work.substring(0, work.length() - 1);
                }

                if (wstmt != null) {
                    wstmt.close();
                }

                Statement sum = conn.createStatement();
                String sql;

                if (request.getParameter("sem").equals("Even")) {
                    sql = "select subtype,SUM(CONVERT(no_of_hours,UNSIGNED INT)) as value1 from subject_allocation where staffid='" + staffid + "' and acyear='" + acyear + "' and (sem like '02' or sem like '04' or sem like '06' or sem like '08') group by subtype ";
                } else {
                    sql = "select subtype,SUM(CONVERT(no_of_hours,UNSIGNED INT)) as value1 from subject_allocation where staffid='" + staffid + "' and acyear='" + acyear + "' and (sem like '01' or sem like '03' or sem like '05' or sem like '07') group by subtype ";
                }

                ResultSet rsum = sum.executeQuery(sql);
                int theory = 0, lab = 0;
                while (rsum.next()) {
                    String abc = rsum.getString("subtype");
                    if (abc.equals("theory")) {
                        theory = rsum.getInt("value1");
                    } else if (abc.equals("lab")) {
                        lab = rsum.getInt("value1");
                    }
                }

                if (work.equals("")) {
                    work = "---";
                }

                sno++;
        %>
        <td><%=sno%></td>
        <td><%=staffname%>
        <td><%=work%></td>
        <td><%=theory%></td>
        <td><%=lab%></td>
        <td><%=lab + theory%></td>
        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>

        <%
            }

        %>

    </table>
    <br>
    <br>

    <%                }
    %>
    <a href ="showallocatedsubjects.jsp?word=yes&staff=<%=id%>&acyear=<%=acyear%>" >Export to word</a>
</body>
</div>
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
            connn.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
        //response.sendRedirect("../index.jsp?a=123");
    }

%>
</html>

<%-- 
    Document   : reportgenerationpage
    Created on : 27-May-2015, 16:42:38
    Author     : Aravind Tyson
--%>

<%@page import="java.util.List"%>
<%@page import="Mark.Mark"%>
<%@page import="Actor.Student"%>
<%@page import="com.action.Find"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style rel="stylesheet" type="text/css">

            table {
                *border-collapse: collapse; /* IE7 and lower */
                border-spacing: 0;
                font-size: 13px;
                width: 90%;  
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
                text-align: center;    
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

        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <script src="../js/jquery.js"></script>
        <script>
            $(document).ready(function () {
                var fail = $("#failcount").val();
                var total = $("#tstrength").val();
                var pass = total - fail;
                var per = ((total - fail) / total) * 100;
                //console.log(per);
                $("#overallpass").html("<h2 style='margin-top:5px;margin-bottom:10px;'>OVER ALL PASS:" + pass + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n\
                                                    % of Pass :" + Math.round(per * 100) / 100 + "</h2>");
                var anchor = $("#exportword")[0].getAttribute("href");
                anchor = anchor + "&pass=" + pass + "&passper=" + Math.round(per * 100) / 100;
                $("#exportword")[0].setAttribute("href", anchor);
                console.log(anchor);
            });


        </script>
    </head>

    <body>

        <%
            String a1 = request.getParameter("word");
            Set<String> fail = new HashSet<String>();
            if (a1 != null) {
                if (a1.equals("yes")) {
                    String formName = "";
                    formName = "MarkStaff.doc";
                    File filepath = new File(formName);
                    response.setContentType("application/vnd.ms-word");
                    response.setHeader("Content-Disposition", "inline; filename=" + filepath);
                }
            }
            String dept = "", sec = "", batch = "", sem = "", exam = "";
            try {
                dept = request.getParameter("dept");
                sec = request.getParameter("section");
                batch = request.getParameter("batch");
                sem = request.getParameter("sem");
                exam = request.getParameter("exam");

        %>

        <%                Connection con = new dbcon().getConnection(dept);
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
        %>
    <center><h2>St. Joseph's Institute of Technology, Chennai-119</h2></center>
    <center><h2>Department of <%=dept.toUpperCase()%></h2></center>
    <center><h2>Internal Assessment Examination-<%=exam.substring(exam.length()-1) %></h2></center>

    <h2 style="margin-left: 10px;">BRANCH: <%=dept.toUpperCase()%></h2>
    <h2 style="margin-left: 10px;">BATCH: <%=batch%></h2>
    <h2 style="margin-left: 10px;">SEM: <%=sem%></h2>
    <h2 style="margin-left: 10px;">SEC: <%=sec%></h2>

    <%
        String sql = "select count(*) from student_personal where batch='" + batch + "' and sec='" + sec + "' and model_type like '" + "%" + "'";
        ResultSet strength = st.executeQuery(sql);
        strength.next();
        String tstrength = strength.getString(1);
    %>

    <h2 style="margin-left: 10px;">TOTAL STRENGTH: <%=tstrength%></h2>
    <div id="load_values"></div>
    <div id="overallpass" style="margin-left: 10px;">
        <%
            if (a1 != null) {
                if (a1.equals("yes")) {
                    out.write("<h2 style='margin-top:5px;'>OVER ALL PASS:" + request.getParameter("pass") + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            + " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
                            + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "% of Pass :" + request.getParameter("passper") + "</h2>");
                }
            }
        %>
    </div>
    <input type="hidden" id="tstrength" value="<%=tstrength%>"> 


    <table class="bordered" border="3" style="margin-left: 10px;margin-top: -10px;">
        <col width="100">
        <col width="300">
        <col width="300">


        <thead>

            <tr>
                <th name="cc">SUB CODE</th>
                <th>THEORY SUBJECT</th>
                <th>STAFF NAME</th>
                <th>TOTAL PRESENT</th>
                <th>FAIL</th>
                <th>ABSENT</th>
                <th>PASS%</th>
                <th>HIGHEST MARK</th>
                <th>CLASS AVERAGE</th>
            </tr>
        </thead>
        <%
            String[] depts = new String[7];
            for (int i = 0; i < 6; i++) {
                depts[i] = Find.Depts[i];
            }
            depts[6] = "first";

            for (int i = 0; i < 7; i++) {

                String sql1 = "select staff_general.tittle,subject_sem_table.subcode,subject_sem_table.subname,staff_table.staffname from " + depts[i] + ".staff_general,subject_sem_table," + depts[i] + ".subject_allocation," + depts[i] + ".staff_table where subject_allocation.batch='" + batch + "' "
                        + "and subject_allocation.sem='" + sem + "' and subject_allocation.dept='" + dept + "' and subject_allocation.sec='" + sec + "' and subject_sem_table.subtype='theory' "
                        + "and subject_sem_table.subcode=subject_allocation.subcode and subject_allocation.staffid=staff_table.staffid and staff_general.staffid=staff_table.staffid and (subject_allocation.sbatch like '0' or subject_allocation.sbatch like '1' or subject_allocation.sbatch like '')";

                String sql11 = "select staff_general.tittle,subject_sem_table.subcode,subject_sem_table.subname,staff_table.staffname from " + depts[i] + ".staff_general,subject_sem_table," + depts[i] + ".subject_allocation," + depts[i] + ".staff_table where subject_allocation.batch='" + batch + "' "
                        + "and subject_allocation.sem='" + sem + "' and subject_allocation.dept='" + dept + "' and subject_allocation.sec='" + sec + "' and subject_sem_table.subtype='theory' "
                        + "and subject_sem_table.subcode=subject_allocation.subcode and subject_allocation.staffid=staff_table.staffid and staff_table.staffid=staff_general.staffid;";

                ResultSet rs = st.executeQuery(sql1);
                ResultSet rs1 = null;

                while (rs.next()) {

                    String sc = rs.getString("subject_sem_table.subcode");
                    String sn = rs.getString("subject_sem_table.subname");
                    String staffname = rs.getString("tittle") + rs.getString("staff_table.staffname").toUpperCase();

                    int max = 0, f = 0, p = 0, a = 0, gtotal = 0;
                    float pp = 0, classavg = 0;
                     for (Student stu : Student.getAll(dept, batch, sec)) {
                        Mark m = new Mark();
                        m.setRollno(stu.getId());
                        m.setSubcode(sc);
                        m.setType(exam);
                        Mark.getUserMark(dept, m);
                        String mark = null;
                        mark = m.getMark();
                        int total = 0;
                        if(mark!=null && !mark.equals("A") && !mark.equals("N") ){
                        total = Integer.parseInt(mark);
                        }
                        if (mark == null || mark.equals("A")) {
                            a++;
                        } else {
                            p++;
                        }
                        if(exam.contains("unit")){
                            float mk = (float)(((float)total/75.0)*100.0);
                            total = (int)mk;
                        }
                        gtotal += total;
                        if (max < total) {
                            max = (int) total;
                        }
                        if (total < 45) {
                            f++;
                            fail.add(stu.getId());

                        }

                    }
                        f-=a;

                    pp = (float) (p + a - f) / (float) (p + a) * 100;
                    classavg = gtotal / (float) p;

                    /*str1[count]=rollno;
        str2[count]=name;
        session.setAttribute("rollno",str1[count]);
        session.setAttribute("name",str2[count]);*/

        %>

        <tr>


            <td style="text-align: left;"><%=sc.toUpperCase()%></td>
            <td style="text-align: left;"><%=sn%></td>
            <td style="text-align: left;"><%=staffname%></td>
            <td><%=p%></td>
            <td><%=f%></td>
            <td><%=a%></td>
            <td><%=(float) ((int) (pp * 100)) / 100%></td>
            <td><%=max%></td>
            <td><%=(float) ((int) (classavg * 100)) / 100%></td>

        </tr>      



        <% }

                    if (rs1 != null) {
                        rs1.close();
                    }
                    if (rs != null) {
                        rs.close();
                    }
                }

                if (st != null) {
                    st.close();
                }
                if (con != null) {
                    ;//con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>



    </table>
    <input type="hidden" id="failcount" value="<%=fail.size()%>">

    <br>
    <div align="left" style="margin-right: 100px;">
        <h7 style="font-size: 12px;">
            NOTE :<br/>
            1.This form should be submitted within 7 days of the last examination - with the consolidated mark list.(after conformation the mark with the students)<br/>
            2.And also send the marks to the parents within 7 days of last examination<br/>
        </h7>

    </div>

    <div align="right" style="margin-top: -10px; margin-right: 100px;">
        <h3>H.O.D</h3>

    </div>

    <center><a id="exportword" href ="reportgenerationpage.jsp?word=yes&dept=<%=dept%>&section=<%=sec%>&batch=<%=batch%>&sem=<%=sem%>&exam=<%=exam%>" >Export to word</a>
    </center>

</body>
</html>

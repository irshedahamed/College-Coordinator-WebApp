<%-- 
    Document   : UpdatedAttendance Edited from Staff
    Created on : Jul 15, 2015, 9:19:26 PM
    Edited on  : May 13, 2016, 7:11:65 PM
    Author     : Ullas Edited by Arun
--%>

<%@page import="java.sql.*"%>
<%@page import="dbconnection.dbcon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            try {
                String dept = session.getAttribute("dept").toString();
                String sec = session.getAttribute("sec").toString();
                String batch = session.getAttribute("batch").toString();
                String hour = session.getAttribute("hour").toString();
                String n = session.getAttribute("count").toString();
                String subject = session.getAttribute("subject").toString();
                String sem = session.getAttribute("sem").toString();
                char ch = hour.charAt(0);
                Integer count = Integer.parseInt(n);
        %>
        <%
            String subcode, check, str;
            for (int i = 1; i <= count; i++) {
                str = i + hour;
                check = request.getParameter(str);
                if (check.equals("Absent")) {
        %>
        <br>

        <%
            Connection con = new dbcon().getConnection(dept);
            Statement st = con.createStatement();
            Statement st1 = con.createStatement();
            Statement st2 = con.createStatement();
            String sql1 = "select * from hourattendence";
            ResultSet rs1 = st1.executeQuery(sql1);

            int flag = 0;
            String sql;
            String str1 = "str1" + i;
            String rollno = session.getAttribute(str1).toString();
            String date = session.getAttribute("date").toString();
            while (rs1.next()) {
                if ((rs1.getString("rollno").equals(rollno)) && rs1.getString("date").equals(date)) {
                    flag = 1;
                }
            }

            switch (ch) {
                case '0':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,zero) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                        st2.executeUpdate("insert into overallattendence(rollno,date,sem) values('" + rollno + "','" + date + "','" + sem + "')");

                    } else {
                        sql = "update hourattendence set zero='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";

                        st.executeUpdate(sql);
                    }
                    break;

                case '1':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,one) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set one='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '2':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,two) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set two='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '3':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,three) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set three='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '4':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,four) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set four='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '5':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,five) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set five='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '6':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,six) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set six='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '7':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,seven) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set seven='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '8':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,eight) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set eight='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;

                case '9':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,nine) values('" + rollno + "','" + date + "','" + sem + "','" + subject + "')";
                        st.executeUpdate(sql);
                    } else {
                        sql = "update hourattendence set nine='" + subject + "' where rollno='" + rollno + "' and date='" + date + "'";
                        st.executeUpdate(sql);
                    }
                    break;
            }
        %>

        <%
                        if (st != null) {
                            st.close();
                        }
                        if (st1 != null) {
                            st1.close();
                        }
                        if (st2 != null) {
                            st2.close();
                        }
                        if (con != null) {
                            ;//con.close();
                        }
                    }

                }
                /* Connection con = new dbcon().getConnection(dept);
        Statement st=con.createStatement();
        
        String sql1="select subcode from subject_allocation where batch='"+batch+"' and dept='"+dept+"' and sec='"+sec+"' and ";
        ResultSet rs=st.executeQuery(sql1);
        while(rs.next())
        {
            subcode=rs.getString("subcode");
        } */
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    <center><h1> Attendance successfully Updated</h1></center>
</body>
</html>

<%-- 
    Document   : UpdatedAttendance Edited From Staff login 
    Created on : Jul 15, 2015, 9:19:26 PM
    Author     : Ullas Edited By Arun
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
                       String clg = (String)session.getAttribute("clg");
        String username = (String)session.getAttribute("username");

            Connection con = new dbcon(clg).getConnection(dept);
          //  Statement st = con.createStatement();
            //Statement st1 = con.createStatement();
         //   Statement st2 = con.createStatement();
            String sql1 = "select * from hourattendence";
           PreparedStatement st1=con.prepareStatement(sql1);
            ResultSet rs1 = st1.executeQuery();

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
                        sql = "insert into hourattendence(rollno,date,sem,zero) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate();
                        PreparedStatement st2=con.prepareStatement("insert into overallattendence(rollno,date,sem) values(?,?,?)");
                        st2.setString(1, rollno);
                        st2.setString(2, date);
                        st2.setString(3, sem);
                        st2.executeUpdate();

                    } else {
                        sql = "update hourattendence set zero=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;

                case '1':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,one) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate();
                    } else {
                    sql = "update hourattendence set one=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;

                case '2':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,two) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate();
                    } else {
                        sql = "update hourattendence set two=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();}
                    break;

                case '3':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,three) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                         st.executeUpdate();
                    } else {
                        sql = "update hourattendence set three=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();}
                    break;

                case '4':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,four) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate();
                    } else {
                        sql = "update hourattendence set four=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();}
                    
                     break;

                 case '5':
                    if (flag == 0) {
                   
                        sql = "insert into hourattendence(rollno,date,sem,five) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate(); } else {
                      
                        sql = "update hourattendence set five=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();}
                    break;

                case '6':
                    if (flag == 0) {
                   
                        sql = "insert into hourattendence(rollno,date,sem,six) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate(); 
                    } else {
                        sql = "update hourattendence set six=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;

                case '7':
                    if (flag == 0) {
                   
                        sql = "insert into hourattendence(rollno,date,sem,seven) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate(); 
                    } else {
                        sql = "update hourattendence set seven=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;

                case '8':
                    if (flag == 0) {
                   
                        sql = "insert into hourattendence(rollno,date,sem,eight) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate(); 
                    } else {
                        sql = "update hourattendence set eight=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;

                case '9':
                    if (flag == 0) {
                        sql = "insert into hourattendence(rollno,date,sem,nine) values(?,?,?,?)";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, rollno);
                        st.setString(2, date);
                        st.setString(3, sem);
                        st.setString(4, subject);
                        st.executeUpdate(); 
                    } else {
                        sql = "update hourattendence set nine=? where rollno=? and date=?";
                        PreparedStatement st=con.prepareStatement(sql);
                        st.setString(1, subject);
                        st.setString(2, rollno);
                        st.setString(3, date);
                        st.executeUpdate();
                    }
                    break;
            }
        %>

        <%
         //               if (st != null) {
           //                 st.close();
             //           }
               //         if (st1 != null) {
                 //           st1.close();
                   //     }
                     //   if (st2 != null) {
                       //     st2.close();
                        //}
                //        if (con != null) {
                  //          ;//con.close();
                    //    }
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

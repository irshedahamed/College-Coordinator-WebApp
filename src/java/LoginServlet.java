/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dbconnection.dbcon;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

       
        
        String regno = request.getParameter("uname");
        String dob = request.getParameter("pass");
        String s3 = "student";
        response.setContentType("text/html");
        Boolean flag = false;
        Connection con = null;
        PreparedStatement statement = null;
        try {
            String sql = "select * from student_login_details where rollno=? and password=?";
            dbcon d = new dbcon();
            con = d.getConnection("login");
            statement = con.prepareStatement(sql);
            statement.setString(1, regno);
            statement.setString(2, dob);
            ResultSet rs = statement.executeQuery();
            if (!rs.isBeforeFirst()) {
                sql = "select * from staff_login_details where staffid=? and password=?";
                statement = con.prepareStatement(sql);
                statement.setString(1, regno);
                statement.setString(2, dob);
                rs = statement.executeQuery();
                if (!rs.isBeforeFirst()) {
                    sql = "select * from other_login_details where id=? and password=?";
                    statement = con.prepareStatement(sql);
                    statement.setString(1, regno);
                    statement.setString(2, dob);
                    rs = statement.executeQuery();
                    flag = true;
                } else {
                    s3 = "staff";
                }
            }
            if (rs.isBeforeFirst()) {
                while (rs.next()) {
                    String s1 = rs.getString(1);
                    String s2 = rs.getString(2);
                    if (flag == true) {
                        s3 = rs.getString("type");
                        System.out.println(s3);
                    }



                    HttpSession session = request.getSession(true);
                    if (s1.equalsIgnoreCase(regno) && s2.equalsIgnoreCase(dob)) {
                        session.setAttribute("username", s1);
                        session.setAttribute("password", s2);
                        request.setAttribute("tt", "new");

                        if (s3.equals("student")) {
                            response.sendRedirect("student/home.jsp?user=" + s1);
                        } else if (s3.equals("staff")) {
                            response.sendRedirect("staff/home.jsp?user=" + s1);
                        } else if (s3.equals("first")) {
                            response.sendRedirect("firstyr/home.jsp?user=" + s1);
                        } else if (s3.equals("admin") || s3.equals("dataentry")) {
                            response.sendRedirect("admin/home.jsp?user=" + s1);
                        } else if (s3.equals("reception")) {
                            response.sendRedirect("reception/home.jsp?user=" + s1);
                        } else if (s3.equals("dept")) {
                            response.sendRedirect("dept/home.jsp?user=" + s1);
                        } else if (s3.equals("exam")) {
                            response.sendRedirect("exam/home.jsp?user=" + s1);
                        } else if (s3.equals("yearincharge")) {
                            response.sendRedirect("attendanceincharge/home.jsp?user=" + s1);
                        } else if (s3.equals("hostel")) {
                            response.sendRedirect("hostel/home.jsp?user=" + s1);
                        } else if (s3.equals("staffincharge")) {
                            response.sendRedirect("staffincharge/home.jsp?user=" + s1);
                        } else if (s3.equals("account")) {
                            response.sendRedirect("account/home.jsp?user=" + s1);
                        } else if (s3.equals("placement")) {
                            response.sendRedirect("placement/home.jsp?user=" + s1);
                        } else if (s3.equals("transport")) {
                            response.sendRedirect("transport/home.jsp?user=" + s1);
                        } else if (s3.equals("principal")) {
                            response.sendRedirect("principal/home.jsp?user=" + s1);
                        } else if (s3.equals("idcard")) {
                            response.sendRedirect("idcard/home.jsp?user=" + s1);
                        } else {

                            response.sendRedirect("index.jsp?user=" + s1);
                        }

                    } else {

                        response.sendRedirect("index.jsp?user=" + s1);
                    }

                }
            } else {
                response.sendRedirect("index.jsp");
            }

        } catch (Exception ex) {
            response.sendRedirect("index.jsp");
            PrintWriter out = response.getWriter();
            out.println(ex);
        } finally {
            try {
                if (statement != null) {
                    statement.close();
                }
                if (con != null)
                            ;//con.close();
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author irshed
 */
public class EntryChallan extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html");
           PrintWriter out = response.getWriter();
        int i=0;  
        try {
            // processRequest(request, response);
            String rollno = request.getParameter("rollno");
            String mop = request.getParameter("mop");
            String mup = request.getParameter("mup");
            String d = request.getParameter("date");
            String da = new SimpleDateFormat("dd/MM/yyyy").format(new SimpleDateFormat("yyyy-MM-dd").parse(d));
            String date = da + " " + "00:00:00";
            Connection con = new dbconnection.dbcon().getConnection("sjitportal");
            String sql = "insert into ibresponse values(?,?,?,?,'Y')";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, rollno);
            st.setString(2, mup);
            st.setString(3, mop);
            st.setString(4, date);
            i = st.executeUpdate();
         
        } catch (SQLException ex) {
            Logger.getLogger(EntryChallan.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ParseException ex) {
            Logger.getLogger(EntryChallan.class.getName()).log(Level.SEVERE, null, ex);
        }
         if (i == 1) {
                out.println("Paid");
            } else {
                out.println("NotPaid");
            }

    }
}

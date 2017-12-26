/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import General.AcademicYear;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
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
public class BatchAssign extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
 String clg = (String)request.getSession().getAttribute("clg");
     
            AcademicYear a = new AcademicYear(clg);
            String Year = request.getParameter("Year");
            String Current = request.getParameter("current");
            boolean batchAssign = a.batchAssign(Current,Year);
             if(batchAssign)
              response.sendRedirect("admin/CurrentUpdate.jsp?msg= Successsfully Updated!!");
             else
              response.sendRedirect("admin/CurrentUpdate.jsp?msg= Some Error Occured!!Try Again");

         
        } catch (SQLException ex) {
            Logger.getLogger(BatchAssign.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
}
}

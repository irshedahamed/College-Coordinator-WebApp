/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author Sangeetha
 */
public class Room_Change extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Room_Change</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Room_Change at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
             try
        {
            
       String academicyear=request.getParameter("academics");
      
       String batch=request.getParameter("batch");
       String dept=request.getParameter("dept");
      
       String rollno=request.getParameter("rollno");
       String name=request.getParameter("name");
       String roomno=request.getParameter("roomno");
       

      //Class.forName("com.mysql.jdbc.Driver").newInstance();
      java.sql.Connection con = new dbcon().getConnection("sjitportal");
        Statement st = con.createStatement();
        //TO_DO insert or Update
        String data = "insert into room_change values('"+academicyear+"','"+batch+"','"+dept+"','"+rollno+"','"+name+"','"+roomno+"')";
           st.executeUpdate(data);
            //response.sendRedirect("admin/batch.jsp");
            response.getWriter().write("Successfully updated!");
            
        } catch (SQLException ex) {
            Logger.getLogger(Room_Change.class.getName()).log(Level.SEVERE, null, ex);
        response.getWriter().write(ex.toString());
        }
             
        
    }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

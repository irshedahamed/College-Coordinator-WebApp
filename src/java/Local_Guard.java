/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.action.Find;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class Local_Guard extends HttpServlet {

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
            out.println("<title>Servlet Local_Guard</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Local_Guard at " + request.getContextPath() + "</h1>");
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
           
            
       String rollno=request.getParameter("rollno");
      
       String name=request.getParameter("name");
       String phoneno=request.getParameter("phoneno");
      
       String doorno=request.getParameter("doorno");
       String street=request.getParameter("street");
       String area=request.getParameter("area");
       String city=request.getParameter("city");
       String pincode=request.getParameter("pincode");
       

      //Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection con = new dbcon().getConnection(Find.sdept(rollno));
        //Statement st = con.createStatement();
            PreparedStatement st=con.prepareStatement("insert into student_local_guardian2 values(?,?,?,?,?,?,?,?)");
            st.setString(1,rollno);
            st.setString(2, name);
            st.setString(3,phoneno);
            st.setString(4, doorno);
            st.setString(5, street);
            st.setString(6, area);
            st.setString(7, city);
            st.setString(8, pincode);
        st.executeUpdate();
            //response.sendRedirect("admin/batch.jsp");
            response.getWriter().write("Successfully updated!");
            
        } catch (SQLException ex) {
            Logger.getLogger(Local_Guard.class.getName()).log(Level.SEVERE, null, ex);
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
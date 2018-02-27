/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import General.Batch;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Aravind Tyson
 */
public class batchStauts extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            out.println("<title>Servlet batchdelete</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet batchdelete at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        try
        {
    for(Batch batch:Batch.getAll())
    {
            String value = request.getParameter("status_"+batch.getBatch());
    
        
        Connection con= new dbconnection.dbcon().getConnection("sjitportal");
        //Statement st = con.createStatement();
        PreparedStatement  st=null;
        if(value.equals("Delete")){
       st=con.prepareStatement("delete from regulations where batch=?");
        st.setString(1, batch.getBatch());
            st.executeUpdate();           
    }else{
            st=con.prepareStatement("update  regulations set status=? where batch=?");
            st.setString(1,value);
            st.setString(2, batch.getBatch());
       st.executeUpdate();
        }
     
          if(st!=null)
                            st.close();
                              if(con!=null)
                                ;//con.close();
    }
    }catch(Exception e)
    {
        e.printStackTrace();
    }
          response.sendRedirect("admin/deletebatch.jsp");
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

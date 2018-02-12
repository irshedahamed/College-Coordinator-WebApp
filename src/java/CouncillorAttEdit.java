/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Actor.Staff;
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
 * @author narun
 */
public class CouncillorAttEdit extends HttpServlet {

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
            out.println("<title>Servlet CouncillorAttEdit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CouncillorAttEdit at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
               Connection conn=null;
       // Statement stmt=null;
        String user= request.getSession().getAttribute("username").toString();
        Staff s=new Staff(user);
        try{
        int count=Integer.parseInt(request.getSession().getAttribute("count").toString());
       // System.out.println(count);
        String date=request.getSession().getAttribute("date").toString();
        //response.getWriter().print(request.getSession().getAttribute("count").toString());
        String rollno=null;
        int edit=0;
        
       // String dept=request.getParameter("dept");
        try{
            conn=new dbcon().getConnection(s.getCouncillorDetails().getDept());
         //   stmt=conn.createStatement();
            for(int i=0;i<count;i++)
        {
        rollno=request.getParameter("val"+i);
        if(rollno!=null)
        {
         String sql="delete from councillor_attendance where rollno=? and date=?";   
            PreparedStatement stmt=conn.prepareStatement(sql);
            stmt.setString(1, rollno);
            stmt.setString(2, date);
         edit+=stmt.executeUpdate();
         response.getWriter().println(rollno+date);
        
        }
        }
            
        if(edit>0)
        response.getWriter().println("Successfully Updated!!!");
        
       }catch(Exception e){
           e.printStackTrace();
       }finally{
//            try {
//                if(stmt!=null)
//                    stmt.close();
//                if(conn!=null)
//                    ;//conn.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(attinchargeedit.class.getName()).log(Level.SEVERE, null, ex);
//            }
       }
        
        }catch(Exception e){
        e.printStackTrace();
        
        }finally{
        
//            try {
//                if(stmt!=null)
//                    stmt.close();
//                if(conn!=null)
//                    ;//conn.close();
//            } catch (SQLException ex) {
//                Logger.getLogger(attinchargeedit.class.getName()).log(Level.SEVERE, null, ex);
//            }
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

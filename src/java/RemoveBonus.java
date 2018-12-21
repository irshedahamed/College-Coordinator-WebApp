/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
 * @author Lenovo
 */
public class RemoveBonus extends HttpServlet {

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
            out.println("<title>Servlet RemoveBonus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RemoveBonus at " + request.getContextPath() + "</h1>");
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        
          String sem=request.getParameter("sem");
        String sec=request.getParameter("section");
        String batch=request.getParameter("batch");
        String exam=request.getParameter("exam");
                  
          //   Statement stmt=null;
         //    Statement stmt1=null;
            Connection conn = null;
            try{
                String dept;
                
                if(request.getParameter("dept")!=null)
                dept=request.getParameter("dept");    
                else
                dept=(String)request.getSession().getAttribute("dept");
                
            conn=new dbcon().getConnection(dept);
           // stmt=conn.createStatement();
          //  stmt1=conn.createStatement();
            
            String sql= "select * from student_personal where batch=? and sec=? order by rollno";
                PreparedStatement stmt=conn.prepareStatement(sql);
                stmt.setString(1, batch);
                stmt.setString(2, sec);
            ResultSet rs=stmt.executeQuery();
     while(rs.next())
     {
         
      String rollno=rs.getString("rollno");
        
        if(request.getParameter(rollno)!=null)
        {
           // response.getWriter().println(request.getParameter(rollno));
        
            if(request.getParameter(rollno).equals("add"))
        {
        sql="insert into bonuscut values(?,?,?)";
        PreparedStatement stmt1=conn.prepareStatement(sql);
        stmt1.setString(1, rollno);
        stmt1.setString(2,sem);
        stmt1.setString(3, exam);
        stmt1.executeUpdate();
        response.getWriter().println("Bonus Removed for"+rollno);
        }
        else if(request.getParameter(rollno).equals("delete")){
            sql="delete from bonuscut where rollno=? and sem =?";
        PreparedStatement stmt1=conn.prepareStatement(sql);
        stmt1.setString(1, rollno);
        stmt1.setString(2, sem);
            stmt1.executeUpdate();
            response.getWriter().println("Bonus Added for"+rollno);
        

        }
     }
     }
            }catch(Exception e){
                e.printStackTrace();
            }finally{
//                try {
//                    if(stmt!=null)
//                        stmt.close();
//                       if(stmt1!=null)
//                        stmt1.close();
//                
//                    if(conn!=null)
//                        ;//conn.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(RemoveBonus.class.getName()).log(Level.SEVERE, null, ex);
//                }
            }
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
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

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Divya Sri
 */
public class regupdate extends HttpServlet {

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
            out.println("<title>Servlet markupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet markupdate at " + request.getContextPath() + "</h1>");
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
        
        try {
            PrintWriter out=response.getWriter();
            HttpSession session = request.getSession();
            
            String batch = session.getAttribute("batch").toString();
            String sec = session.getAttribute("sec").toString();
            String dept = session.getAttribute("dept").toString();
           
            
            Connection  con = new dbcon().getConnection(dept);
            String subcode = null,rollno,mark;
            int count=0;
           // Statement st3=null,st4=null;
            ResultSet rs3=null,rs4=null;
            
            //st3 = con.createStatement();
            //st4 = con.createStatement();
            
            
                String sql3 = "select * from student_personal where batch=? and sec=?";
              PreparedStatement st3=con.prepareStatement(sql3);
              st3.setString(1, batch);
              st3.setString(2, sec);
                rs3 = st3.executeQuery();
                 int j = 1;
                while(rs3.next())
                {
                    
                    rollno = rs3.getString("rollno");
                   
                    String str="reg"+rollno;
                    String regno = request.getParameter(str);
                    String name=request.getParameter("name"+rollno);
                    String sql5="update student_personal set regno=?,name=? where rollno=?";
                    PreparedStatement st4=null;
                    
                    if(regno!=null)
                    if(regno.trim()!="")
                    st4=con.prepareStatement(sql5);
                    st4.setString(1,regno);
                    st4.setString(2,name);
                    st4.setString(3, rollno);
                        st4.executeUpdate();
                    j++; 
                   
                } 
            
            response.getWriter().printf("Updated Successfully !!");
       
                              if(st3!=null)
                                st3.close();
                          //      if(st4!=null)
                           // st4.close();
                              if(con!=null)
                                ;//con.close();
        } catch (Exception ex) {
            response.getWriter().print(ex);
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

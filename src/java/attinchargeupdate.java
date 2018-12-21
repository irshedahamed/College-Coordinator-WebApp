/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aravind-pt844
 */
public class attinchargeupdate extends HttpServlet {

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
            out.println("<title>Servlet attinchargeupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet attinchargeupdate at " + request.getContextPath() + "</h1>");
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
     * @param request servlet r
     * quest
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       // processRequest(request, response);
        try
        {
            
        
      HttpSession session = request.getSession();
      String sem = session.getAttribute("sem").toString();
      String date = session.getAttribute("date").toString();
      String batch = session.getAttribute("batch").toString();
      String dept = session.getAttribute("dept").toString();
      Connection con = new dbconnection.dbcon().getConnection(dept);
     // Statement st = con.createStatement();
      //Statement st1 = con.createStatement();
      String sql="select * from student_personal where batch=?";
             PreparedStatement st=con.prepareStatement(sql) ;
            st.setString(1, batch);
             
      ResultSet rs = st.executeQuery();
      
              while(rs.next())
              {
                  String rollno =rs.getString("rollno");
                  String value = request.getParameter(rollno+"val");
                  String reason=request.getParameter(rollno+"reason");
                  if(value!=null)
                      if(value.equals("Absent")){
                 PreparedStatement st1=con.prepareStatement("insert into overallattendence values(?,?,?,?)");
                 st1.setString(1, rollno);
                 st1.setString(2, date);
                 st1.setString(3,sem);
                 st1.setString(4, reason);
                          st1.executeUpdate();
                      }  }
              
              response.getWriter().println("Successfully updated");
                if(st!=null)
                            st.close();
           //     if(st1!=null)
             //       st1.close();
                              if(con!=null)
                                ;//con.close();
        }catch(Exception e)
        {
            e.printStackTrace();
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

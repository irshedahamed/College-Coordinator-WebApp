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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Chikita
 */
public class SectionUpdate extends HttpServlet {

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
            out.println("<title>Servlet SectionUpdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SectionUpdate at " + request.getContextPath() + "</h1>");
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
        //response.getWriter().println("Hi");
        //processRequest(request, response);
        int count=0;
         String dept=request.getParameter("dept");
                        String batch=request.getParameter("batch");
                             
                  
                  
                        Connection con = null; 
                //    Statement stmt = null;
                  //  Statement stmt1 = null;
        try
        {
           
            con= new dbcon().getConnection(dept);
           // response.getWriter().println(dept);
          //  stmt = con.createStatement();
            //stmt1=con.createStatement();
            PreparedStatement stmt=con.prepareStatement("select rollno from student_personal where batch like ?");
            stmt.setString(1, batch);
            ResultSet rs=stmt.executeQuery();
                   // rs.beforeFirst();
                    while(rs.next())
                    { 
                        String rollno=rs.getString("rollno");
                        String section=request.getParameter("section"+rollno);
                            
                    
                        if(!section.equalsIgnoreCase("No Change"))   {                         
                             PreparedStatement stmt1=con.prepareStatement("update student_personal set sec=? where rollno like ?");
                            stmt1.setString(1, section);
                            stmt1.setString(2, rollno);
                             count+=stmt1.executeUpdate();
                        }
                           
                        
                    }
                   // response.sendRedirect("attendanceincharge/sectionResult.jsp?count="+count);
       response.getWriter().println("Successfully updated " +count+ " records");
        }
        catch(Exception e){
        e.printStackTrace();    
        }
        


finally{
//try{
//if(stmt!=null)
//    stmt.close();
//if(stmt1!=null)
//    stmt1.close();
//
//if(con!=null)
//    ;//con.close();
//}
//        catch(Exception e)
//        {
//        e.printStackTrace();
//        }
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

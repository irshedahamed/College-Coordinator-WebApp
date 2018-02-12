/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.action.Find;
import dbconnection.dbcon;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
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
 * @author Home
 */
public class StaffFileDownload extends HttpServlet {

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
            out.println("<title>Servlet StaffFileDownload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffFileDownload at " + request.getContextPath() + "</h1>");
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
       // processRequest(request, response);
        response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
  //  String sz=request.getSession().getAttribute("size").toString();
    String str=request.getParameter("ext");
    
      
   
    
    response.setContentType("APPLICATION/OCTET-STREAM");   
    response.setHeader("Content-Disposition","attachment; filename=\"" +request.getParameter("option").substring(0,request.getParameter("option").length()-2) +str + "\"");   
      Connection con=null;
     // Statement stmt=null;
    InputStream inputstream = null;  
     
      try{
      con = new dbcon().getConnection(Find.sdept(request.getParameter("staffid")));
      //stmt=con.createStatement();
      String staffid=request.getParameter("staffid");
          PreparedStatement stmt=con.prepareStatement("select * from staff_files where staffid=?");
          stmt.setString(1, staffid);
      ResultSet rs= stmt.executeQuery();
      if(rs.next())
      {
      inputstream=rs.getBinaryStream(request.getParameter("option"));
      }
      }catch(Exception e)
      {e.printStackTrace();}
      finally{
          try{
   //   if(stmt!=null)
     //                       stmt.close();
                              if(con!=null)
                                ;//con.close();
          }catch(Exception e)
          {e.printStackTrace();
          
          }
          }
               
    int i;   
    while ((i=inputstream.read()) != -1) {  
    out.write(i);   
    }   
    inputstream.close();   
    out.close();   
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
        processRequest(request, response);
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

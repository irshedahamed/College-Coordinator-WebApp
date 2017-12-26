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
import java.sql.Statement;
import java.util.Arrays;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Divya Sri
 */
public class deletesub extends HttpServlet {

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
            out.println("<title>Servlet deletesub</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet deletesub at " + request.getContextPath() + "</h1>");
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
            Class.forName("com.mysql.jdbc.Driver").newInstance();
           
            String[] n=request.getParameterValues("delete");
            PrintWriter out=response.getWriter();
            String incharge=request.getParameter("incharge");
            if(n!=null)
            for(int i=0;i<n.length;i++)
            {
                String[] parts  = n[i].split("_");
               
String acyear = parts[0]; // 004
String staffid = parts[1];
String batch = parts[2]; // 004
String sem = parts[3];
String dept = parts[4]; // 004
String subcode = parts[5];

String sec = parts[6]; // 004
  String clg = (String)request.getSession().getAttribute("clg");
     
                  Connection connection1 = new dbcon(clg).getConnection(Find.sdept(staffid));
            Statement statement1 = connection1.createStatement();
        String sql = "delete from subject_allocation where acyear='"+acyear+"' and staffid='"+staffid+"'and sem='"+sem+"' and dept='"+dept+"' and subcode='"+subcode+"' and sec='"+sec+"'";
        
         statement1.executeUpdate(sql);
         
       
            
              if(statement1!=null)
                            statement1.close();
                              if(connection1!=null)
                                connection1.close();
            }
            
            if(incharge!=null)
              if(incharge.equals("yes")){
                  String acyear=request.getParameter("acyear");
                  String staffid=request.getParameter("staffid");
                  String sem=request.getParameter("semister");
                  String clg = (String)request.getSession().getAttribute("clg");
     
                  Connection connection1 = new dbcon(clg).getConnection(Find.sdept(staffid));
            Statement statement1 = connection1.createStatement();
        String sql = "delete from other_incharge where acyear='"+acyear+"' and staffid='"+staffid+"'and semister='"+sem+"' ";
        
         statement1.executeUpdate(sql);
         
       sql = "delete from councillor where academicyr='"+acyear+"' and staffid='"+staffid+"'and semister='"+sem+"' ";
        
         statement1.executeUpdate(sql);
            
              if(statement1!=null)
                            statement1.close();
                              if(connection1!=null)
                                connection1.close();
                  
         }
         response.getWriter().print("Deleted Successfully!!");
         
        }
        catch (Exception ex) {
               PrintWriter out = response.getWriter();
            out.println(ex);
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

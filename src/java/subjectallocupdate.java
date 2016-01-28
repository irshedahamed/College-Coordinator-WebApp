/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * @author aravind
 */
public class subjectallocupdate extends HttpServlet {

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
            out.println("<title>Servlet subjectallocupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet subjectallocupdate at " + request.getContextPath() + "</h1>");
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
            Connection connection1 = new dbcon().getConnection("cse");
            Statement statement1 = connection1.createStatement();
            

            String staffid=request.getParameter("staff");
            String num = request.getParameter("numbersub");
            Integer n = Integer.parseInt(num);
            String num1 = request.getParameter("numberlab");
            String acyear = request.getParameter("acyear");
            
            Integer m = Integer.parseInt(num1);
            
            for(int i =1; i<=n; i++)
            {
            String batch = request.getParameter("batch"+i);
            String sem=request.getParameter("sem"+i);
            
            String dept=request.getParameter("dept"+i);
            String subcode=request.getParameter("subject"+i);
            String []parts = subcode.split("-");
            subcode = parts[0];
            String sec= request.getParameter("sec"+i);
            String hour = request.getParameter("nh"+i);
                                    
           
            statement1.executeUpdate("insert into subject_allocation values('"+batch+"','"+staffid+"','"+sem+"','"+dept+"','"+subcode+"','"+sec+"','theory','"+acyear+"','"+hour+"')");
            
            }
             for(int i =1; i<=m; i++)
            {
            String lbatch = request.getParameter("lbatch"+i);
            String lsem=request.getParameter("lsem"+i);
            String ldept=request.getParameter("ldept"+i);
            String lsubcode=request.getParameter("lsubject"+i);
            String []parts = lsubcode.split("-");
            lsubcode = parts[0];
            String lsec= request.getParameter("lsec"+i);
            String lhour = request.getParameter("lnh"+i);
                                    
           
            statement1.executeUpdate("insert into subject_allocation values('"+lbatch+"','"+staffid+"','"+lsem+"','"+ldept+"','"+lsubcode+"','"+lsec+"','lab','"+acyear+"','"+lhour+"')");
            
            }
             PrintWriter out = response.getWriter();
             out.println("Successfully Updated");
             
        } catch (Exception ex) {
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

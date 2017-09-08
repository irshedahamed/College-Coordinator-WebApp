/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class SubjectAdd extends HttpServlet {

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
            out.println("<title>Servlet SubjectAdd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SubjectAdd at " + request.getContextPath() + "</h1>");
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
       
       int flag=0;
       String dept=request.getParameter("dept");
       String regulation=request.getParameter("regulation");
       String subcode=request.getParameter("subcode");
       String subname=request.getParameter("subname");
       String type=request.getParameter("subtype");
       String sem=request.getParameter("sem");
       
       String abbr=request.getParameter("abbreviation");
       String l=request.getParameter("l");
       String t=request.getParameter("t");
       String p=request.getParameter("p");
       String c=request.getParameter("c");
       String category=request.getParameter("category");
       
       
       String ayear;
       if(type.equals("etheory"))
       {ayear="elective";type=type.substring(1);}
       else
           ayear="all";
       
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            Connection conn=new dbcon().getConnection("sjitportal");
            Statement stmt=conn.createStatement();
            ResultSet rs=stmt.executeQuery("select subcode from subject_table where subcode like '"+subcode+"'");
             if(!rs.next())
            stmt.execute("insert into subject_table values('"+regulation+"','"+subcode+"','"+subname+"','"+
                    type+"')");
        
            if(stmt!=null)
                stmt.close();
        if(conn!=null)
            conn.close();
            
             conn=new dbcon().getConnection(dept);
             stmt=conn.createStatement();
             flag=stmt.executeUpdate("insert into subject_sem_table values('"+subcode+"','"+regulation+"','"+subname+"','"+
                    sem+"','"+type+"','"+ayear+"')");
             
            if(stmt!=null)
                stmt.close();
        if(conn!=null)
            conn.close();
        
        } catch (Exception ex) {
        ex.printStackTrace();
        }
       if(flag==0)
       response.sendRedirect("admin/SubAdded.jsp?msg=Some Error Occured!!Try Again");
       else
       response.sendRedirect("admin/SubAdded.jsp?msg=Subject Added Successsfully!!");
           
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

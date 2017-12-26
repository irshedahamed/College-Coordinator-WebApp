/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import com.google.gson.Gson;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class PersonList extends HttpServlet {

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
            out.println("<title>Servlet PersonList</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PersonList at " + request.getContextPath() + "</h1>");
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
       String meet=request.getParameter("meet");
       String dept=request.getParameter("dept");
       String batch=request.getParameter("batch");
       
              Connection conn=null;
                Statement stmt=null;
                
                String regulation=request.getParameter("regulation");
                List<String> list = new ArrayList<String>();
                try{
                   String clg = (String)request.getSession().getAttribute("clg");
      
                    conn=new dbcon(clg).getConnection(dept);
                stmt=conn.createStatement();
                String sql=null;
                if(meet.equals("Student"))
                    sql="select rollno as id,name from student_personal where batch like '"+batch+"'";
                else if(meet.equals("Staff"))
                    sql="select staffid as id,name from staff_general";
                ResultSet rs=stmt.executeQuery(sql);
                while(rs.next())
                {
                String a=rs.getString("id");
                String b = rs.getString("name");
                        
                            list.add(a+"-"+b);
                }
                String json;
                json=new Gson().toJson(list);
                response.setContentType("application/json");
                response.getWriter().print(json);
                }
                catch(Exception e){
                    e.printStackTrace();
                }
                finally{
                    try {
                        if(stmt!=null)
                            stmt.close();
                        if(conn!=null)
                            ;//conn.close();
                    } catch (SQLException ex) {
                  ex.printStackTrace();
                    }
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

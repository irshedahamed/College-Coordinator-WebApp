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
 * @author Home
 */
public class JsonSMS extends HttpServlet {

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
            out.println("<title>Servlet JsonSMS</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet JsonSMS at " + request.getContextPath() + "</h1>");
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
       
       
        String number=request.getParameter("number");
        String message=request.getParameter("message");
        String json=null;
        
        boolean proceed=false;
        if(request.getParameter("auth").equals("fluffy"))
        proceed=true;
        
        
        
        
            json = new Gson().toJson("Authentication Error !!!");
        if(proceed){ 
          String res=SMSTemplate.sendwithID(number, message,request.getParameter("senderid"));
            if(!res.equals(""))
                        json = new Gson().toJson("Sent"+res);
                        else
                        json = new Gson().toJson("Error: "+number+" "+message);    
          
                        response.setContentType("application/json");
        }                response.getWriter().write(json);
    
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
        
        String number=request.getParameter("number");
        String message=request.getParameter("message");
        String json=null;
        
        Connection conn=null;
       // Statement stmt=null;
        boolean proceed=false;
        try{
        conn=new dbcon().getConnection("login");
        String username=   request.getSession().getAttribute("username").toString();
        String password=request.getSession().getAttribute("password").toString();
        PreparedStatement stmt=conn.prepareStatement("select * from other_login_details where id=? and password=?");
        stmt.setString(1, username);
        stmt.setString(2, password);
        ResultSet rs=stmt.executeQuery();
        if(rs.next())
            proceed=true;
        
        }catch(Exception e){e.printStackTrace();}finally{
//            try {
//                if(stmt!=null)
//                    stmt.close();
//                if(conn!=null)
//                    ;//conn.close();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        
        }
        
        
            json = new Gson().toJson("Authentication Error !!!");
        if(proceed){ 
         String res=SMSTemplate.send(number, message);
            if(!res.equals(""))
                        json = new Gson().toJson("Sent"+res);
                        else
                        json = new Gson().toJson("Error: "+number+" "+message);    
          
                        response.setContentType("application/json");
                        response.getWriter().write(json);
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

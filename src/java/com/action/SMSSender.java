/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.action;

import Actor.Parent;
import com.google.gson.Gson;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

/**
 *
 * @author Lenovo
 */
public class SMSSender extends HttpServlet {

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
            out.println("<title>Servlet SMSSender</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SMSSender at " + request.getContextPath() + "</h1>");
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
       
       String json=null;
       String rollno=request.getParameter("rollno");
       String date=request.getParameter("date");
       String name=request.getParameter("name");
       String reason=request.getParameter("reason");
       Connection conn=null;
       Statement stmt=null;
       String number="";
       number=Parent.getNumber(rollno);
                        String message="";
                        
                        if(reason.equals("AB"))
                            message="Your ward "+name.toUpperCase()+"("+rollno.toUpperCase()+") has taken leave on "+date+", Kindly contact year incharge for further details";
                        else if(reason.equals("Previous Permission"))
                            message="Your ward "+name.toUpperCase()+"("+rollno.toUpperCase()+") has taken leave on "+date;
                        else if(reason.equals("Mediacal Leave"))
                            message="Your ward "+name.toUpperCase()+"("+rollno.toUpperCase()+") has taken leave due to medical reasons on "+date;
                        else if(reason.equals("Suspension"))
                            message="Your ward "+name.toUpperCase()+"("+rollno.toUpperCase()+") has taken leave on "+date+", Please wait for further information";
                        else if(reason.equals("OD"))
                            message="Your ward "+name.toUpperCase()+"("+rollno.toUpperCase()+") has taken OD on "+date;
                            
                        
                        if(!SMSTemplate.send(number, message).equals(""))
                        json = new Gson().toJson("Sent");
                        else
                        json = new Gson().toJson("Error: "+number+message);    
                        response.setContentType("application/json");
                        response.getWriter().write(json);
    
    
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

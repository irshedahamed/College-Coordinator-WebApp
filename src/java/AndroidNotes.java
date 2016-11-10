/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Lenovo
 */
public class AndroidNotes extends HttpServlet {

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
            out.println("<title>Servlet AndroidNotes</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AndroidNotes at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
        
        String path=request.getParameter("path");
        String rollno=request.getParameter("rollno");
        String filename=request.getParameter("filename");
        
        //rollno="12cs1203";
        
        path=path+filename;
        FileInputStream input=new FileInputStream(path);
        String rootpath=getServletContext().getRealPath("")+ File.separator+"Android"+File.separator ;
        
        File dir=new File(rootpath+File.separator+rollno);
        if(dir.exists())
            FileUtils.deleteDirectory(dir);
        
        
        dir.mkdir();
        FileOutputStream output=new FileOutputStream(rootpath+File.separator+rollno+File.separator+filename);
        
        byte[] b=new byte[64];
        int nofbyte;
        while((nofbyte=input.read(b))!=-1)
        output.write(b);
        
        
           input.close();
           output.close();
            
        
          response.getWriter().write("Completed");
          
        //response.sendRedirect("Android/se.doc");
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

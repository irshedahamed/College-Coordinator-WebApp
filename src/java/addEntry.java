/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import General.Entry;
import Actor.Parent;
import com.action.Find;
import com.action.SMSTemplate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class addEntry extends HttpServlet {

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
            out.println("<title>Servlet addEntry</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addEntry at " + request.getContextPath() + "</h1>");
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
       
       Entry e=new Entry();
       boolean act=false;
       e.setRollno(request.getParameter("rollno"));
       e.setBy(request.getParameter("by"));
       String action=request.getParameter("entry");
        response.setContentType("text/html;charset=UTF-8");
         response.getWriter().println("<link href='css/bootstrap.min.css' rel='stylesheet'><br><br><br>");
       
         if(action.equals("IN"))
             act=e.insertin();
         else if(action.equals("OUT"))
             act=e.insertout();
             
         if(Character.isDigit(e.getRollno().charAt(0))){
             String message;
             message=e.getSMSContent(action);
        
             
             
             
             SMSTemplate.send(Parent.getNumber(e.getRollno()),message);
         }
        
         if(act)
           response.getWriter().println("<center><h1>Entry added Successfully!!!</h1>");
       else
           response.getWriter().println("<center><h1>Entry Failed</h1>");
       if(Find.category(e.getRollno())==null)
       response.getWriter().println("<br><br><a href='reception/entry.jsp'><input type='button' id='sumbit' value='back'></a></center>");
       else
       response.getWriter().println("<br><br><a href='reception/guest.jsp'><input type='button' id='sumbit' value='back'></a></center>");
           
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

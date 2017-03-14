/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Fee.IBResponse;
import Fee.MUResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Irshed
 */
public class PaymentDetails extends HttpServlet {

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
            out.println("<title>Servlet PaymentDetails</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PaymentDetails at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {
            out.close();
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
  
        String Type = request.getParameter("banktype");
        String Batch = request.getParameter("Batch");
        String Dept = request.getParameter("dept");
        String Acyear = request.getParameter("Year");
        if(Dept.equals("all"))
        {
            Dept="%";
        }
      if(Type.equals("ibank"))
      {
          request.setAttribute("Batch", Batch);
          request.setAttribute("Dept", Dept);
          request.setAttribute("Acyear",Acyear);
          
          RequestDispatcher rd=request.getRequestDispatcher("account/ibpay.jsp");
          rd.forward(request, response);
      } 
        if(Type.equals("otherbank"))
      {
          request.setAttribute("Batch", Batch);
          request.setAttribute("Dept", Dept);
          request.setAttribute("Acyear",Acyear);
          
          RequestDispatcher rd=request.getRequestDispatcher("account/Techprocess.jsp");
          rd.forward(request, response);
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

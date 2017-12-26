/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import General.AcademicYear;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class receiveMUResponse extends HttpServlet {

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
            out.println("<title>Servlet receiveMUResponse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receiveMUResponse at " + request.getContextPath() + "</h1>");
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
      String clg = (String)request.getSession().getAttribute("clg");
       MUResponse mu=new MUResponse(clg);
       if(request.getSession().getAttribute("username")!=null)
       mu.setRollno(request.getSession().getAttribute("username").toString());
       mu.setAcyear(AcademicYear.getFeeYear(clg).getYear());
       mu.setBankchrge(request.getParameter("bankChrge"));
       mu.setHandleID(request.getParameter("HandleID"));
       mu.setMerchantrefno(request.getParameter("MerchantRefNo"));
       mu.setMsg(request.getParameter("Msg"));
       mu.setRefdate(request.getParameter("RefDate"));
       mu.setRefno(request.getParameter("RefNo"));
       mu.setStatus(request.getParameter("status"));
       mu.setTotalamt(request.getParameter("TotalAmt"));
       mu.setUtilitycode(request.getParameter("UtilityCode"));
  
       if(mu.getMsg().equals("O.K"))
       {    if(mu.insert()){
                request.getSession().setAttribute("MUResponse", mu);
               request.getRequestDispatcher("/student/paynow.jsp").forward(request, response);
       }else{
               response.getWriter().print("Error Occured on Server Contact Admin");
       
       }
       }else{
               response.getWriter().print("Error Occured  Contact Admin");
       
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

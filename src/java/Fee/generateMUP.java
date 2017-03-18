/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

import Actor.Student;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class generateMUP extends HttpServlet {

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
            out.println("<title>Servlet generateMUP</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet generateMUP at " + request.getContextPath() + "</h1>");
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
       String url="https://www.indianbank.net.in/servlet/ibs.servlets.IBSMultiUtilityServlet?";
        String params="";
        int sum=0;
        Student s=Student.getById(request.getSession().getAttribute("username").toString());
        
        Fee f=Fee.getFeeById(s.getId());
        params += "HandleID=" + "H_MULTHIRD";
        int i=1;
        for(String type:Fee.getsubCategory()){
        params += ("&Amt"+i+"=" + f.getByType(type));
        
            sum+=Integer.valueOf(f.getByType(type));
        }
        
        params += "&UtilityCode=" + Find.getUtilityCode(String.valueOf(sum));
        
        params += ("&TotalAmt=" + sum);
        params += ("&AddDet1=" + s.getName());
        params += ("&AddDet2=" + s.getId());
        params += ("&AddDet3=" + s.getDept());
        params+="&ReturnURL=https://" + request.getServerName()+"/receiveMUResponse";
        RequestDispatcher rd=request.getRequestDispatcher("/sendPost.jsp?RUrl="+(url+params).replace("&", "%26").replace(" ", "%20"));
        rd.forward(request, response);
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

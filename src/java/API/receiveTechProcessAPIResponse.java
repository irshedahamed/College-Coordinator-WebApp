/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import Fee.MUResponse;
import Fee.TechProcessResponse;
import com.google.gson.Gson;
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
public class receiveTechProcessAPIResponse extends HttpServlet {

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
            out.println("<title>Servlet receiveTechProcessAPIResponse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receiveTechProcessAPIResponse at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        
        String msg=request.getParameter("msg");
       String mercode=request.getParameter("tpsl_mrct_cd");
       
     
       Fee.TechProcess tp=(Fee.TechProcess) request.getSession().getAttribute("TPRequest");
       String resMsg=tp.getTransactionStatus(msg);
      String clg = (String)request.getSession().getAttribute("clg");
      
       TechProcessResponse tpr=new TechProcessResponse(clg);
       if(resMsg.equals("failed T")){
       tpr.setRollno(tp.getCustID());
       tpr.setRefno(tp.getRefno());
       tpr.setStatus("failed");
       tpr.setMsg(resMsg);
       response.sendRedirect(tp.getAPIReturnURL()+"?msg=Transaction Failed");
       }else{
       tpr.setFromResMsg(resMsg, tp);
       boolean flag=tpr.insert();
       if(flag && tpr.getMsg().equals("SUCCESS")){
    String  json = new Gson().toJson(tpr);
                        response.sendRedirect(tp.getAPIReturnURL()+"?msg="+json);
       
       }else{
           response.sendRedirect(tp.getAPIReturnURL()+"?msg=ERROR: Transaction Failed  Contact Server Admin");
       }
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

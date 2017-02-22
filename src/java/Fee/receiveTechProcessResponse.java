/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Fee;

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
public class receiveTechProcessResponse extends HttpServlet {

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
            out.println("<title>Servlet receiveTechProcessResponse</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet receiveTechProcessResponse at " + request.getContextPath() + "</h1>");
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
       
       
       String msg=request.getParameter("msg");
       String mercode=request.getParameter("tpsl_mrct_cd");
       MUResponse mu=(MUResponse) request.getSession().getAttribute("MUResponse");
     
       TechProcess tp=(TechProcess) request.getSession().getAttribute("TPRequest");
       String resMsg=tp.getTransactionStatus(msg);
       TechProcessResponse tpr=new TechProcessResponse();
       if(resMsg.equals("failed T")){
       tpr.setRollno(tp.getCustID());
       tpr.setRefno(tp.getRefno());
       tpr.setStatus("failed");
       tpr.setMsg(resMsg);
        response.getWriter().print("Transaction Failed Contact Server Admin");
       }else{
       String[] splitres=resMsg.split("\\|");
       tpr.setRollno(tp.getCustID());
       tpr.setRefno(tp.getRefno());
       tpr.setStatus(splitres[0].split("=")[1]);
       tpr.setMsg(splitres[1].split("=")[1]);
       tpr.setErr_msg(splitres[2].split("=")[1]);
       tpr.setClnt_txn_ref(splitres[3].split("=")[1]);
       tpr.setTpsl_bank_cd(splitres[4].split("=")[1]);
       tpr.setTpsl_txn_id(splitres[5].split("=")[1]);
       tpr.setAmount(splitres[6].split("=")[1]);
       tpr.setTime(splitres[7].split("=")[1]);
       tpr.setBal_amount(splitres[9].split("=")[1]);
       tpr.setRqst_token(splitres[11].split("=")[1]);
       boolean flag=tpr.insert();
       if(flag && tpr.getMsg().equals("SUCCESS")){
           request.setAttribute("paid", "Y");
        request.getRequestDispatcher("/student/Challan.jsp").forward(request, response);
       }else{
               response.getWriter().print("Transaction Failed");
        }
       }
       /*txn_status=0300|
    txn_msg=SUCCESS|
            txn_err_msg=Normal SUCCESS Transaction|
            clnt_txn_ref=TPSL209177648|
                    tpsl_bank_cd=9980|
                    tpsl_txn_id=228587|
                    txn_amt=1.00|
                    tpsl_txn_time=14-11-2014 10:03:25|
            tpsl_rfnd_id=NA|
                    bal_amt=NA|
                    rqst_token=a4e3e263-bea5-4f63-ac04-e7a6822e03cb*/
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

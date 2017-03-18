/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import API.Authenticate;
import Actor.Parent;
import Actor.Staff;
import Actor.Student;
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
public class SendPasswordSMS extends HttpServlet {

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
            out.println("<title>Servlet SendPasswordSMS</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SendPasswordSMS at " + request.getContextPath() + "</h1>");
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
      String user=request.getParameter("user");
                 String number=null;
                 Student s=Student.getById(user);
                 if(s!=null)
                 number=Parent.getNumber(s.getId());
                 else{
                 Staff st=Staff.getByid(user);
                 if(st!=null)
                     number=st.getMobile();
               
                 else{
                    response.sendRedirect("index.jsp");
                 }
                 }
                 
                   if(number!=null){
                
                     if(number.equals(request.getParameter("mobile"))){
                     //send sms
                     Authenticate a=new Authenticate();
                     a.setUsername(user);
                         SMSTemplate.send(number,"Your password is : "+a.findPassword());
                    response.sendRedirect("index.jsp?msg=Your password has been sent to "+number);
                     }else{
                    response.sendRedirect("index.jsp?msg=Number does not match");
                     
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

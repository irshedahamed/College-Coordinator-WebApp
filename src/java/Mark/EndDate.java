/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Mark;

import com.action.Find;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author santhosh
 */
public class EndDate extends HttpServlet {

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
            out.println("<title>Servlet EndDate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EndDate at " + request.getContextPath() + "</h1>");
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
        String dept=request.getParameter("dept");
        String batch=request.getParameter("batch");
        String sem=request.getParameter("sem");
        String exam=request.getParameter("exam");
        Connection conn=new dbcon().getConnection("sjitportal");;
        String end=null;
        try {
            
            PreparedStatement stt=conn.prepareStatement("select * from exam_date where dept=? and batch=? and sem=? and type=?");
            stt.setString(1, dept);
            stt.setString(2, batch);
            stt.setString(3, sem);
            stt.setString(4, exam);
            ResultSet rs = stt.executeQuery();
            if(rs.next()){
            end=rs.getString("enddate");
              
            }
            System.out.println(end);
        } catch (SQLException ex) {
            Logger.getLogger(EndDate.class.getName()).log(Level.SEVERE, null, ex);
        }
          response.getWriter().print(end);
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
        try {
            PrintWriter out =response.getWriter();
            String dept=request.getParameter("dept");
            String batch=request.getParameter("batch");
            String sem= request.getParameter("sem");
            String exam=request.getParameter("exam");
            String enddt=request.getParameter("end").toString();
            String[] blist=Find.Depts;
            
            
            
            if(!dept.equals("all")){
            EnddateCheck a=new EnddateCheck();
            a.setDept(dept);
            a.setBatch(batch);
            a.setSem(sem);
            a.setType(exam);
            a.setEnddate(enddt);
            EnddateCheck a1=new EnddateCheck();
            String result = a1.insertOrUpdateDate(dept, a);
            if (result.equals("Updated")) {
                out.println(dept.toUpperCase()+" "+"Updated");
            } else {
                out.println("NotUpdated");
            }
            }
            else{
                for(int i=0;i<blist.length;i++){
                 EnddateCheck a=new EnddateCheck();
            a.setDept(blist[i]);
            a.setBatch(batch);
            a.setSem(sem);
            a.setType(exam);
            a.setEnddate(enddt);
            EnddateCheck a1=new EnddateCheck();
            String result = a1.insertOrUpdateDate(blist[i], a);
            if (result.equals("Updated")) {
                out.println(blist[i].toUpperCase()+" "+"Updated");
            } else {
                out.println("NotUpdated");
            }
               
                }
            }
        }catch (SQLException ex) {
            Logger.getLogger(EndDate.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.action.Find;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class StudentDelProfile extends HttpServlet {

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
            out.println("<title>Servlet StudentDelProfile</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudentDelProfile at " + request.getContextPath() + "</h1>");
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
        String rollno=request.getParameter("rollno");
       String pass=request.getParameter("password");
       
       Connection con=null,con1=null;
       Statement del=null,stmt1=null;
       String sql;
       
       try{
 String clg = (String)request.getSession().getAttribute("clg");
     
           con=new dbcon(clg).getConnection(Find.sdept(rollno));
                del=con.createStatement();
                con1=new dbcon(clg).getConnection("login");
                stmt1=con1.createStatement();
                sql = "select * from student_login_details  where rollno='" + rollno + "' and password='"+pass+"'";
                 ResultSet rs=stmt1.executeQuery(sql);
                if(rs.next()){
                
                sql="delete from student_general where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_academic_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_admission_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_contact_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_father_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_mother_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_local_guardian where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_local_guardian2 where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_other_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_passport_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_visa_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_personal where rollno='"+rollno+"'";
                del.executeUpdate(sql);
             
                 response.sendRedirect("admin/studentDeleted.jsp?msg=Student Deleted Successsfully!!");
                }else{
                response.sendRedirect("admin/studentDeleted.jsp?msg=Some Error Occured!!Student Not Found");
                }
              
       }catch(Exception e)
       {
           e.printStackTrace();
       }finally{
       try{
            if(del!=null)
                del.close();
            if(con!=null)
                ;//con.close();
            if(stmt1!=null)
                stmt1.close();
            if(con1!=null)
                ;//con1.close();
            
                }catch(Exception e){
                e.printStackTrace();
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

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
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Lenovo
 */
public class StaffProfileEdit extends HttpServlet {

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
            out.println("<title>Servlet StaffProfileEdit</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StaffProfileEdit at " + request.getContextPath() + "</h1>");
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
       int update=0;
       String id=request.getParameter("rollno");
       String title=request.getParameter("title");
       String name=request.getParameter("name");
       String desg=request.getParameter("desg");
       String doj=request.getParameter("doj");
       String gender=request.getParameter("gender");
       String add1=request.getParameter("add1");
       String add2=request.getParameter("add2");
       String city=request.getParameter("city");
       String state=request.getParameter("state");
       String pincode=request.getParameter("pincode");
       String padd1=request.getParameter("padd1");
       String padd2=request.getParameter("padd2");
       String pcity=request.getParameter("pcity");
       String pstate=request.getParameter("pstate");
       String ppincode=request.getParameter("ppincode");
       String mobile1=request.getParameter("mobile1");
       String mobile2=request.getParameter("mobile2");
       String email=request.getParameter("email");
       String ll=request.getParameter("ll");
       Connection con=null;
       Statement stmt=null;
       try
       {
            con=new dbcon().getConnection(Find.sdept(id));
            stmt=con.createStatement();
       String sql="update staff_general set tittle='"+title+"', name='"+name+"', desg='"+desg+"', doj='"+doj+"',"
               + "gender='"+gender+"', add1='"+add1+"', add2='"+add2+"', city='"+city+"', state='"+state+"', "
               + "pincode='"+pincode+"', padd1='"+padd1+"', padd2='"+padd2+"', pcity='"+pcity+"', pstate='"+pstate+"',"
               + "ppincode='"+ppincode+"', mobile1='"+mobile1+"', mobile2='"+mobile2+"', email='"+email+"', ll='"+ll+"'";
       update=stmt.executeUpdate(sql);
       response.getWriter().println("Successfully updated!!!");
       
       
       }
       catch(Exception e)
       {
       e.printStackTrace();
       }
       finally
       {
       try
       {
       if(con!=null)
           con.close();
       if(stmt!=null)
           stmt.close();
       }
       catch(Exception e)
       {
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

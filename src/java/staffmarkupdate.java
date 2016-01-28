/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Aravind Tyson
 */
public class staffmarkupdate extends HttpServlet {

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
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
            out.println("<title>Servlet staffmarkupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet staffmarkupdate at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try
        {
      HttpSession session = request.getSession();
            String batch = session.getAttribute("batch").toString();
            String sem = session.getAttribute("sem").toString();
            String subcode = session.getAttribute("subject").toString();
            String sec = session.getAttribute("sec").toString();
            String dept = session.getAttribute("dept").toString();
            String exam = session.getAttribute("exam").toString();
            String rollno=null,mark=null;
             Connection  con = new dbcon().getConnection(dept);
             Statement st= con.createStatement();
             ResultSet rs2;
             Statement st1=con.createStatement();
             Statement st2=con.createStatement();
             int count=0;
             ResultSet rs1 = st.executeQuery("select * from student_personal where batch='"+batch+"' and sec='"+sec+"' and rollno like '__c%' order by name");
             
             
            while(rs1.next())
            {
               
                
               
               
                     rollno=rs1.getString("rollno");
                    String a1=rollno+"_"+count;
                     response.getWriter().println(a1);
                    mark = request.getParameter(a1);
                    String sql3 = "select * from marks_table where rollno='"+rollno+"' and subcode='"+subcode+"'";
                    
                    rs2 = st1.executeQuery(sql3);
                    if(!rs2.isBeforeFirst())
                    {
                        String sql4="insert into marks_table(rollno,sem,subcode,"+exam+") values('"+rollno+"','"+sem+"','"+subcode+"','"+mark+"')";
                        st2.executeUpdate(sql4);
                    }
                    else
                    {
                        rs2.next();
                        String m = rs2.getString(exam);
                        if(m!=null)
                        {
                            response.getWriter().println("ALREADY UPDATED");
                            break;
                        }
                        String sql5="update marks_table set "+exam+"='"+mark+"' where rollno='"+rollno+"' and subcode='"+subcode+"'";
                        st2.executeUpdate(sql5);
                    }
                    count++;
                    rs2.close();
                    
                }
            ResultSet rs3 = st.executeQuery("select * from student_personal where batch='"+batch+"' and sec='"+sec+"' and rollno like '__l%' order by name");
             
             
            while(rs3.next())
            {
               
                
               
               
                     rollno=rs3.getString("rollno");
                    String a1=rollno+"_"+count;
                     response.getWriter().println(a1);
                    mark = request.getParameter(a1);
                    String sql3 = "select * from marks_table where rollno='"+rollno+"' and subcode='"+subcode+"'";
                    
                    rs2 = st1.executeQuery(sql3);
                    if(!rs2.isBeforeFirst())
                    {
                        String sql4="insert into marks_table(rollno,sem,subcode,"+exam+") values('"+rollno+"','"+sem+"','"+subcode+"','"+mark+"')";
                        st2.executeUpdate(sql4);
                    }
                    else
                    {
                        rs2.next();
                        String m = rs2.getString(exam);
                        if(m!=null)
                        {
                            response.getWriter().println("ALREADY UPDATED");
                            break;
                        }
                        String sql5="update marks_table set "+exam+"='"+mark+"' where rollno='"+rollno+"' and subcode='"+subcode+"'";
                        st2.executeUpdate(sql5);
                    }
                    count++;
                    rs2.close();
                    
                }
            }
        
        catch(Exception e){
            e.printStackTrace();
        }
            response.getWriter().printf("updated");
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

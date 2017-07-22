/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author aravind
 */
public class markupdate extends HttpServlet {

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
            out.println("<title>Servlet markupdate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet markupdate at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        try {
            HttpSession session = request.getSession();
            String regulation = session.getAttribute("regulation").toString();
            String sem = session.getAttribute("sem").toString();
            String batch = session.getAttribute("batch").toString();
            String sec = session.getAttribute("sec").toString();
            String dept = session.getAttribute("dept").toString();
            String exam = session.getAttribute("exam").toString();
            String ayear = session.getAttribute("ayear").toString();
            
            Connection  con = new dbcon().getConnection(dept);
            String subcode = null,rollno,mark;
            int count=0;
            Statement st1=null,st2=null,st3=null,st4=null;
            ResultSet rs1=null,rs2=null,rs3=null,rs4=null;
            st1 = con.createStatement();
            st2 = con.createStatement();
            st3 = con.createStatement();
            st4 = con.createStatement();
            
            
            String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and subtype='theory' order by subcode" ;
            // String sql1 = "select * from subject_sem_table where regulation='"+regulation+"' and sem='"+sem+"' and (ayear like '%elective%"+ayear+"%' or ayear like 'all')  and subtype='theory' order by subcode" ;
             //String sql2= "select * from student_personal where batch='"+batch+"' and sec='"+sec+"' order by rollno";
                  String sql2= "select *,CONVERT(regno,UNSIGNED INT) as sno from student_personal where batch='"+batch+"' and sec='"+sec+"' order by sno,name";
  
            rs1=st1.executeQuery(sql1);
            
           
            while(rs1.next())
            {
               
                subcode=rs1.getString("subcode");
                 //response.getWriter().println(subcode);
                rs2=st2.executeQuery(sql2);
                while(rs2.next())
                {
                    rollno=rs2.getString("rollno");
                    String a1=rollno+"_"+count;
                   //  response.getWriter().println(a1);
                    mark = request.getParameter(a1);
                    if(mark==null)
                        continue;
                    String sql3 = "select * from marks_table where rollno='"+rollno+"' and subcode='"+subcode+"'";
                    
                    rs3 = st3.executeQuery(sql3);
                    if(!rs3.isBeforeFirst())
                    {
                        String sql4="insert into marks_table(rollno,sem,subcode,"+exam+") values('"+rollno+"','"+sem+"','"+subcode+"','"+mark+"')";
                        st4.executeUpdate(sql4);
                    }
                    else
                    {
                        String sql5="update marks_table set "+exam+"='"+mark+"' where rollno='"+rollno+"' and subcode='"+subcode+"'";
                        st4.executeUpdate(sql5);
                    }
                    
                    rs3.close();
                    
                }
                count++;
            }
            response.getWriter().println("<center><h1>UPDATED SUCCESSFULLY</h1></center>");
              if(st1!=null)
                            st1.close();
                if(st2!=null)
                            st2.close();
                              if(st3!=null)
                                st3.close();
                                if(st4!=null)
                            st4.close();
                              if(con!=null)
                                con.close();
        } catch (Exception ex) {
            response.getWriter().print(ex);
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

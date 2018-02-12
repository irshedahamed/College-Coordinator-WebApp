/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dbconnection.dbcon;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Lenovo
 */
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
  

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
       
                String regno=request.getParameter("uname");
		String dob=request.getParameter("pass");
               // System.err.println(dob+regno);
               // System.out.println(dob+regno);
                String s3="student";
		response.setContentType("text/html");
                Boolean flag=false;
		Connection con=null;
                //Statement   statement=null;
		try{    
			Class.forName("com.mysql.jdbc.Driver");  
                       PrintWriter out = response.getWriter();
                      
                        //response.sendRedirect("index1.html");
                    
                     
                    //response.sendRedirect("index1.html");
                    
                    String sql = "select * from student_login_details where rollno=? and password=? " ;  
                    
                    
                   
                  dbcon d = new dbcon();
               con = d.getConnection("login");
                  //statement = con.createStatement();
                    PreparedStatement statement=con.prepareStatement(sql);
                    statement.setString(1, regno);
                    statement.setString(2, dob);
                  ResultSet rs = statement.executeQuery();
                    if(!rs.isBeforeFirst())
                    {
                        sql = "select * from staff_login_details where staffid=? and password=?";
                       PreparedStatement st=con.prepareStatement(sql);
                       st.setString(1, regno);
                       st.setString(2, dob);
                        rs = st.executeQuery();
                        if(!rs.isBeforeFirst())
                        {
                            sql = "select * from other_login_details where id=? and password=?";
                           PreparedStatement stt=con.prepareStatement(sql);
                       stt.setString(1, regno);
                       stt.setString(2, dob);
                        
                            rs= stt.executeQuery();
                          flag = true;
                        }
                        else
                        {
                        s3="staff";
                        }
                    }
                   
             
            //rs.getString("regno");
                    if(rs.isBeforeFirst())
                    {
            while(rs.next())
            {  String s1=rs.getString(1);
               String s2=rs.getString(2);
               if(flag==true)
               {
                  s3=rs.getString("type");
                   System.out.println(s3);
               }
              
              HttpSession session = request.getSession(true);
               //  RequestDispatcher rd=request.getRequestDispatcher("index1.html");
               //  rd.forward(request, response);
               if(s1.equalsIgnoreCase(regno) && s2.equalsIgnoreCase(dob))
               {   session.setAttribute("username", s1);
                   session.setAttribute("password",s2);
                   //session.setAttribute("deptname", "cse");
                   request.setAttribute("tt","new");
                   
                  if(s3.equals("student"))
                   response.sendRedirect("student/home.jsp?user="+s1);
                  else if(s3.equals("staff"))
                    
                   response.sendRedirect("staff/home.jsp?user="+s1);  
                    else if(s3.equals("first"))
                  
                      response.sendRedirect("firstyr/home.jsp?user="+s1); 
                  else if(s3.equals("admin")||s3.equals("dataentry"))
                  
                      response.sendRedirect("admin/home.jsp?user="+s1); 
                    else if(s3.equals("reception"))
                  
                      response.sendRedirect("reception/home.jsp?user="+s1); 
                  else if(s3.equals("dept"))
                  
                      response.sendRedirect("dept/home.jsp?user="+s1);  
                  else if(s3.equals("exam"))
                      response.sendRedirect("exam/home.jsp?user="+s1);
                  else if(s3.equals("yearincharge"))
                      response.sendRedirect("attendanceincharge/home.jsp?user="+s1);
                  else if(s3.equals("hostel"))
                      response.sendRedirect("hostel/home.jsp?user="+s1);
                  else if(s3.equals("staffincharge"))
                      response.sendRedirect("staffincharge/home.jsp?user="+s1);
                  else if(s3.equals("account"))
                      response.sendRedirect("account/home.jsp?user="+s1);
                  else if(s3.equals("placement"))
                      response.sendRedirect("placement/home.jsp?user="+s1);
                  else if(s3.equals("transport"))
                      response.sendRedirect("transport/home.jsp?user="+s1);

                  else if(s3.equals("principal"))
                      response.sendRedirect("principal/home.jsp?user="+s1);
                  else if(s3.equals("idcard"))
                      response.sendRedirect("idcard/home.jsp?user="+s1);
                else
                  {
                      
                      response.sendRedirect("index.jsp?user="+s1);
                  }
                
                  // response.sendRedirect("index.jsp");                 
               }
               else
               {
                   
                    response.sendRedirect("index.jsp?user="+s1);
               }
               //else
               //{
                 // response.sendRedirect("index.html");
               
                   /*out.println("<html>");
                   out.println("<font color='white'><h2>Login Successful</h2>");
                   out.println("</font>");
                   out.println("<body bgcolor='black'>");
                   out.println("</body>");
                   out.println("</html>");
                   */
               
              // }    
            }  
            
		//close connection
            ;//con.close();
                    }
                    else
                    {
                        response.sendRedirect("index.jsp");
                    }
		
		    }catch(Exception ex){
                         response.sendRedirect("index.jsp");
		      PrintWriter out = response.getWriter();
                      out.println(ex);
		    }finally{
//                    try {
//                        if(statement!=null)
//                            statement.close();
//                        if(con!=null)
//                            ;//con.close();
//                    } catch (SQLException ex) {
//                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
//                    }
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

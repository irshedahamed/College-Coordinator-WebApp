/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package API;

import Actor.Student;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class Authenticate extends HttpServlet {

    private String Username;
    private String Password;
    private String type;
    private String photo;
    

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }
    
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
            out.println("<title>Servlet Authenticate</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Authenticate at " + request.getContextPath() + "</h1>");
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
        
        Authenticate a=new Authenticate();
        a.setUsername(request.getParameter("user"));
        a.setPassword(request.getParameter("pass"));
     
     if(a.isAuthenticated())
         response.getWriter().print(a.getType());
     else
         response.getWriter().print("Authentication Error!!!");
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

    /**
     * Verifies the username and password is authenticated and sets the authentication type of the user
     * 
     * @return  true if user exists
     */
    public boolean isAuthenticated(){
    
        boolean flag=false;
        Connection conn=null;
        PreparedStatement stmt=null;
        try{
           conn=new dbcon().getConnection("login");
           String sql="select * from student_login_details where rollno like ? and password like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           stmt.setString(2, Password);
           ResultSet rs=stmt.executeQuery();
           if(rs.next()){
               type="student";
               photo="${pageContext.request.contextPath}/StudentPhotos/Batch"+Student.getById(Username).getBatch()+"/"+Username.toUpperCase()+".JPG";
               flag=true;
           }else{
           rs.close();
           sql="select * from staff_login_details where staffid like ? and password like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           stmt.setString(2, Password);
           rs= stmt.executeQuery();
           if(rs.next()){
               type="staff";
               photo="${pageContext.request.contextPath}/StaffPhotos/"+Username.toUpperCase()+".JPG";
               flag=true;
           }else{
           sql="select * from other_login_details where id like ? and password like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           stmt.setString(2, Password);
           rs=stmt.executeQuery();
           if(rs.next()){
               type=rs.getString("type");
               flag=true;
           }
           }
           }
     
       
       }catch(Exception e){
       e.printStackTrace();
       }finally{
           try {
               if(stmt!=null)
                   stmt.close();
               if(conn!=null)
                   ;//conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
    return flag;
    }
    
    public String findPassword(){
        String pwd=null;
        Connection conn=null;
        PreparedStatement stmt=null;
        try{
           conn=new dbcon().getConnection("login");
           String sql="select * from student_login_details where rollno like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           ResultSet rs = stmt.executeQuery();
           if(rs.next()){
               type="student";
               pwd=rs.getString("password");
           }else{
           rs.close();
           sql="select * from staff_login_details where staffid like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           rs = stmt.executeQuery();
           if(rs.next()){
               type="staff";
               pwd=rs.getString("password");
           }else{
           sql="select * from other_login_details where id like ? ";
           stmt=conn.prepareStatement(sql);
           stmt.setString(1, Username);
           rs = stmt.executeQuery();
           if(rs.next()){
                    type=rs.getString("type");
               pwd=rs.getString("password");
          
           }
           }
           }
     
       
       }catch(Exception e){
       e.printStackTrace();
       }finally{
           try {
               if(stmt!=null)
                   stmt.close();
               if(conn!=null)
                   ;//conn.close();
           } catch (SQLException ex) {
               ex.printStackTrace();
           }
       
       }
    return pwd;
    
    }
    
    public static boolean validateAPI(String API){
    
    return true;
    }
}

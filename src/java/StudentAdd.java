/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.action.GeneratePassword;
import dbconnection.dbcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class StudentAdd extends HttpServlet {

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
            out.println("<title>Servlet StudentAdd</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet StudentAdd at " + request.getContextPath() + "</h1>");
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
      //  processRequest(request, response);
      
      int update;
      
      String rollno=request.getParameter("rollno");
      
      String dob=request.getParameter("dob").replace("'", "''");
      String caste=request.getParameter("caste").replace("'", "''");
      String community=request.getParameter("community").replace("'", "''");
      String pincome=request.getParameter("pincome").replace("'", "''");
      String religion=request.getParameter("religion").replace("'", "''");
      String nationality=request.getParameter("nationality").replace("'", "''");
      String mothertounge=request.getParameter("mothertongue").replace("'", "''");
      String clubmember=request.getParameter("clubmember").replace("'", "''");
      String boardingpt=request.getParameter("boardingpt").replace("'", "''");  
      
      String school10=request.getParameter("10school").replace("'", "''");
      String marks10=request.getParameter("10marks").replace("'", "''");
      String board10=request.getParameter("10board").replace("'", "''");
      String med10=request.getParameter("10med").replace("'", "''");
      String yop10=request.getParameter("10yop").replace("'", "''");
      String school12=request.getParameter("12school").replace("'", "''");
      String marks12=request.getParameter("12marks").replace("'", "''");
      String board12=request.getParameter("12board").replace("'", "''");
      String med12=request.getParameter("12med").replace("'", "''");
      String yop12=request.getParameter("12yop").replace("'", "''");
      String dipcoll=request.getParameter("dipcoll").replace("'", "''");
      String dipmark=request.getParameter("dipmark").replace("'", "''");
      String dipboard=request.getParameter("dipboard").replace("'", "''");
      String dipmed=request.getParameter("dipmed").replace("'", "''");
      String dipyop=request.getParameter("dipyop").replace("'", "''");
            
      String doa=request.getParameter("doa").replace("'", "''");
      String adminalot=request.getParameter("adminalot").replace("'", "''");
      String counormn=request.getParameter("counormn").replace("'", "''");
      String orank=request.getParameter("orank").replace("'", "''");
      String crank=request.getParameter("crank").replace("'", "''");
      String sadmission=request.getParameter("sadmission").replace("'", "''");
      String gname=request.getParameter("gname").replace("'", "''");
      String moi=request.getParameter("moi").replace("'", "''");
      String scholarship=request.getParameter("scholarship").replace("'", "''");
      
      String doorno=request.getParameter("doorno").replace("'", "''");
      String street=request.getParameter("street").replace("'", "''");
      String area=request.getParameter("area").replace("'", "''");
      String city=request.getParameter("city").replace("'", "''");
      String district=request.getParameter("district").replace("'", "''");
      String state=request.getParameter("state").replace("'", "''");
      String country=request.getParameter("country").replace("'", "''");
      String pincode=request.getParameter("pincode").replace("'", "''");
      
      String fathername=request.getParameter("fathername").replace("'", "''");
      String qualification=request.getParameter("qualification").replace("'", "''");
      String occupation=request.getParameter("occupation").replace("'", "''");
      String designation=request.getParameter("designation").replace("'", "''");
      String address=request.getParameter("address").replace("'", "''");
      String landline=request.getParameter("landline").replace("'", "''");
      String mobile=request.getParameter("mobile").replace("'", "''");
      String mail=request.getParameter("mail").replace("'", "''");
      
      String mothername=request.getParameter("mothername").replace("'", "''");
      String mqualification=request.getParameter("mqualification").replace("'", "''");
      String moccupation=request.getParameter("moccupation").replace("'", "''");
      String mdesignation=request.getParameter("mdesignation").replace("'", "''");
      String maddress=request.getParameter("maddress").replace("'", "''");
      String mlandline=request.getParameter("mlandline").replace("'", "''");
      String mmobile=request.getParameter("mmobile").replace("'", "''");
      String mmail=request.getParameter("mmail").replace("'", "''");
      
      String localname=request.getParameter("lgname").replace("'", "''");
      String lgphno=request.getParameter("lgphno").replace("'", "''");
      String lgdoorno=request.getParameter("lgdoorno").replace("'", "''");
      String lgstreet=request.getParameter("lgstreet").replace("'", "''");
      String lgarea=request.getParameter("lgarea").replace("'", "''");
      String lgcity=request.getParameter("lgcity").replace("'", "''");
      String lgpincode=request.getParameter("pincode").replace("'", "''");
      
      String odtf=request.getParameter("odtf").replace("'", "''");
      String odin=request.getParameter("odin").replace("'", "''");
      String odprevinst=request.getParameter("odprevinst").replace("'", "''");
      String odgrp=request.getParameter("odgrp").replace("'", "''");
      String odyoa=request.getParameter("odyoa").replace("'", "''");
      String odyor=request.getParameter("odyor").replace("'", "''");
      String odct=request.getParameter("odct").replace("'", "''");
      String odboard=request.getParameter("odboard").replace("'", "''");
      String odmoi=request.getParameter("odmoi").replace("'", "''");
      String odreason=request.getParameter("odrfd").replace("'", "''");
      
      String pddoe=request.getParameter("pddoe").replace("'", "''");
      String pdfs=request.getParameter("pdfs").replace("'", "''");
      String pdpn=request.getParameter("pdpn").replace("'", "''");
      
      String vddoe=request.getParameter("vddoe").replace("'", "''");
      String vdtype=request.getParameter("vdtype").replace("'", "''");
      String vdvn=request.getParameter("vdvn").replace("'", "''");
      
      String regno=request.getParameter("regno").replace("'", "''");
      String stuname=request.getParameter("stuname").replace("'", "''");
      String gender=request.getParameter("gender").replace("'", "''");
      String bloodgroup=request.getParameter("bloodgroup").replace("'", "''");
      String batch=request.getParameter("batch").replace("'", "''");
      String course=request.getParameter("course").replace("'", "''");
      String dept=request.getParameter("dept").replace("'", "''");
      String sec=request.getParameter("sec").replace("'", "''");
      String stumobile=request.getParameter("stumobile").replace("'", "''");
      String stumail=request.getParameter("stumail").replace("'", "''");
      String food=request.getParameter("food").replace("'", "''");
      String acc=request.getParameter("acc").replace("'", "''");
      String initial=request.getParameter("initial").replace("'", "''");
      String modeltype=request.getParameter("modeltype").replace("'", "''");
    
      
       Statement stmt;
      try{
      Class.forName("com.mysql.jdbc.Driver").newInstance();
      Connection conn=new dbcon().getConnection("login");   
      stmt=conn.createStatement();
      String sql="delete from student_login_details  where rollno='"+rollno+"'";
      stmt.execute(sql);
       sql="insert into student_login_details values('"+rollno+"','"+GeneratePassword.next()+"')";
      stmt.execute(sql);
      stmt.close();
      conn.close();
      conn=new dbcon().getConnection(dept);   
      stmt=conn.createStatement();
  if(dob.equals("")){
          
          dob=null;
          }
  if(doa.equals("")){
          
          doa=null;
          }   
   if(pddoe.equals("")){
          
          pddoe=null;
          }   
    if(vddoe.equals("")){
          
          vddoe=null;
          }   
    
    
      String sql1="insert into student_general values('"+rollno+"',"+"?"+",'"+caste+"','"+community
              +"','"+pincome+"','"+religion+"','"+nationality+"','"+mothertounge+"','"+clubmember
              +"','"+boardingpt+"')";
      
      String sql2="insert into student_academic_details values('"+rollno+"','"+school10+"','"+marks10+"','"+board10
              +"','"+med10+"','"+yop10+"','"+school12+"','"+marks12+"','"+board12
              +"','"+med12+"','"+yop12+"','"+dipcoll+"','"+dipmark+"','"+dipboard+"','"+dipmed+"','"+dipyop
              +"')";
      
      String sql3="insert into student_admission_details values('"+rollno+"',"+"?"+",'"+adminalot
              +"','"+counormn+"','"+orank+"','"+crank+"','"+sadmission+"','"+gname+"','"+moi+"','"+scholarship
              +"')";
      
      String sql4="insert into student_contact_details values('"+rollno+"','"+doorno+"','"+street+"','"+area+"','"
              +city+"','"+district+"','"+state+"','"+country+"','"+pincode
              +"')";
      
      String sql5="insert into student_father_details values('"+rollno+"','"+fathername+"','"+qualification
              +"','"+occupation+"','"+designation+"','"+address+"','"+landline+"','"+mobile+"','"+mail
              +"')";
      
      String sql6="insert into student_mother_details values('"+rollno+"','"+mothername+"','"+mqualification
              +"','"+moccupation+"','"+mdesignation+"','"+maddress+"','"+mlandline+"','"+mmobile+"','"+mmail
              +"')";
      
      String sql7="insert into student_local_guardian values('"+rollno+"','"+localname+"','"+lgphno+"','"+lgdoorno
              +"','"+lgstreet+"','"+lgarea+"','"
              +lgcity+"','"+lgpincode
              +"')";
      
      String sql8="insert into student_other_details values('"+rollno+"','"+odtf+"','"+odin+"','"+odprevinst
              +"','"+odgrp+"','"+odyoa+"','"+odyor+"','"+odct+"','"+odboard+"','"+odmoi+"','"+odreason
              +"')";
      
      String sql9="insert into student_passport_details values('"+rollno+"',"+"?"+",'"+pdfs+"','"+pdpn
              +"')";
      
      String sql10="insert into student_visa_details values('"+rollno+"',"+"?"+",'"+vdvn+"','"+vdtype
              +"')";

      String sql11="insert into student_personal values('"+rollno+"','"+regno+"','"+stuname+"','"+gender+"','"+bloodgroup
              +"','"+batch+"','"+course+"','"+dept+"','"+sec+"','"+stumobile+"','"+stumail+"','"+food
              +"','"+acc+"','"+initial+"','"+modeltype
              +"')";
      
      update=0;
      PreparedStatement pstmt;
      pstmt=conn.prepareStatement(sql1);
      //update+=stmt.executeUpdate(sql1);
       if(dob!=null)
         pstmt.setDate(1,Date.valueOf(dob));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
      
       update+=pstmt.executeUpdate();
      update+=stmt.executeUpdate(sql2);
          pstmt=conn.prepareStatement(sql3);
     
          if(doa!=null)
      {pstmt.setDate(1,Date.valueOf(doa));}
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
       
      update+=stmt.executeUpdate(sql4);
      update+=stmt.executeUpdate(sql5);
      update+=stmt.executeUpdate(sql6);
      update+=stmt.executeUpdate(sql7);
      update+=stmt.executeUpdate(sql8);
      
      pstmt=conn.prepareStatement(sql9);
                    if(pddoe!=null && pddoe!="")
                        pstmt.setDate(1,Date.valueOf(pddoe));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
                    
     // update+=stmt.executeUpdate(sql10);
     pstmt=conn.prepareStatement(sql10);
      if(vddoe!=null && vddoe!="")
                       pstmt.setDate(1,Date.valueOf(vddoe));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
     
      update+=stmt.executeUpdate(sql11);
      
      if(update==11)
          
                response.getWriter().print("Successfully Added!!");
        if(stmt!=null)
                            stmt.close();
                              if(conn!=null)
                                conn.close();
      
      }catch(Exception e){
          try {
              e.printStackTrace();
              e.printStackTrace(response.getWriter());
                Connection con1=new dbcon().getConnection(dept);
                Statement del=con1.createStatement();
                String sql="delete from student_general where rollno='"+rollno+"'";
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
                sql="delete from student_other_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_passport_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_visa_details where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_personal where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                
                response.getWriter().print("Some Error Occured!!");
                
                if(del!=null)
                            del.close();
                              if(con1!=null)
                                con1.close();
              
              
          } catch (Exception ex) {
          ex.printStackTrace();
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

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Actor.Student;
import com.action.Find;
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
      if(Student.getById(rollno)!=null){
      response.getWriter().print("Student already exist.Contact admin if it is a new entry.!!");
      return;
      }
          
      String dob=request.getParameter("dob");
      String caste=request.getParameter("caste");
      String community=request.getParameter("community");
      String pincome=request.getParameter("pincome");
      String religion=request.getParameter("religion");
      String nationality=request.getParameter("nationality");
      String mothertounge=request.getParameter("mothertongue");
      String clubmember=request.getParameter("clubmember");
      String boardingpt=request.getParameter("boarding");  
      
      String school10=request.getParameter("10school");
      String marks10=request.getParameter("10marks");
      String board10=request.getParameter("10board");
      String med10=request.getParameter("10med");
      String yop10=request.getParameter("10yop");
      String school12=request.getParameter("12school");
      String marks12=request.getParameter("12marks");
      String board12=request.getParameter("12board");
      String med12=request.getParameter("12med");
      String yop12=request.getParameter("12yop");
      String dipcoll=request.getParameter("dipcoll");
      String dipmark=request.getParameter("dipmark");
      String dipboard=request.getParameter("dipboard");
      String dipmed=request.getParameter("dipmed");
      String dipyop=request.getParameter("dipyop");
            
      String doa=request.getParameter("doa");
      String adminalot=request.getParameter("adminalot");
      String counormn=request.getParameter("counormn");
      String orank=request.getParameter("orank");
      String crank=request.getParameter("crank");
      String sadmission=request.getParameter("sadmission");
      String gname=request.getParameter("gname");
      String moi=request.getParameter("moi");
      String scholarship=request.getParameter("scholarship");
      
      String doorno=request.getParameter("doorno");
      String street=request.getParameter("street");
      String area=request.getParameter("area");
      String city=request.getParameter("city");
      String district=request.getParameter("district");
      String state=request.getParameter("state");
      String country=request.getParameter("country");
      String pincode=request.getParameter("pincode");
      
      String fathername=request.getParameter("fathername");
      String qualification=request.getParameter("qualification");
      String occupation=request.getParameter("occupation");
      String designation=request.getParameter("designation");
      String address=request.getParameter("address");
      String landline=request.getParameter("landline");
      String mobile=request.getParameter("mobile");
      String mail=request.getParameter("mail");
      
      String mothername=request.getParameter("mothername");
      String mqualification=request.getParameter("mqualification");
      String moccupation=request.getParameter("moccupation");
      String mdesignation=request.getParameter("mdesignation");
      String maddress=request.getParameter("maddress");
      String mlandline=request.getParameter("mlandline");
      String mmobile=request.getParameter("mmobile");
      String mmail=request.getParameter("mmail");
      
      String lgname=request.getParameter("lgname");
      String lgphno=request.getParameter("lgphno");
      String lgdoorno=request.getParameter("lgdoorno");
      String lgstreet=request.getParameter("lgstreet");
      String lgarea=request.getParameter("lgarea");
      String lgcity=request.getParameter("lgcity");
      String lgpincode=request.getParameter("lgpincode");
      
      String lgname2=request.getParameter("lgname2");
      String lgphno2=request.getParameter("lgphno2");
      String lgdoorno2=request.getParameter("lgdoorno2");
      String lgstreet2=request.getParameter("lgstreet2");
      String lgarea2=request.getParameter("lgarea2");
      String lgcity2=request.getParameter("lgcity2");
      String lgpincode2=request.getParameter("lgpincode2");
      
      
      
      
      String odtf=request.getParameter("odtf");
      String odin=request.getParameter("odin");
      String odprevinst=request.getParameter("odprevinst");
      String odgrp=request.getParameter("odgrp");
      String odyoa=request.getParameter("odyoa");
      String odyor=request.getParameter("odyor");
      String odct=request.getParameter("odct");
      String odboard=request.getParameter("odboard");
      String odmoi=request.getParameter("odmoi");
      String odreason=request.getParameter("odrfd");
      
      String pddoe=request.getParameter("pddoe");
      String pdfs=request.getParameter("pdfs");
      String pdpn=request.getParameter("pdpn");
      
      String vddoe=request.getParameter("vddoe");
      String vdtype=request.getParameter("vdtype");
      String vdvn=request.getParameter("vdvn");
      
      String regno=request.getParameter("regno");
      String stuname=request.getParameter("stuname");
      String gender=request.getParameter("gender");
      String bloodgroup=request.getParameter("bloodgroup");
      String batch=request.getParameter("batch");
      String course=request.getParameter("course");
      String dept=Find.sdept(rollno);
      String sec=request.getParameter("sec");
      String stumobile=request.getParameter("stumobile");
      String stumail=request.getParameter("stumail");
      String food=request.getParameter("food");
      String acc=request.getParameter("acc");
      String initial=request.getParameter("initial");
      String modeltype=request.getParameter("modeltype");
    
      
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
      ;//conn.close();
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
      
      String sql7="insert into student_local_guardian values('"+rollno+"','"+lgname+"','"+lgphno+"','"+lgdoorno
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
      
      String sql12="insert into student_local_guardian2 values('"+rollno+"','"+lgname2+"','"+lgphno2+"','"+lgdoorno2
              +"','"+lgstreet2+"','"+lgarea2+"','"
              +lgcity2+"','"+lgpincode2
              +"')";
         
      String sql13="insert into student_time_update values('"+rollno+"',now())";      
      
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
      
      update+=stmt.executeUpdate(sql12);
      update+=stmt.executeUpdate(sql13);
      
      
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
      
      if(update==13)
      {
          response.sendRedirect("admin/studentSuccessForm.jsp?rollno="+rollno);
              //  response.getWriter().print("Successfully Added!!");
      } if(stmt!=null)
                            stmt.close();
                              if(conn!=null)
                                ;//conn.close();
      
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
                sql="delete from student_local_guardian2 where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                sql="delete from student_time_update where rollno='"+rollno+"'";
                del.executeUpdate(sql);
                
                response.getWriter().print("Some Error Occured!!");
                
                if(del!=null)
                            del.close();
                              if(con1!=null)
                                ;//con1.close();
              
              
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

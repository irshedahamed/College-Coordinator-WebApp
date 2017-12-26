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
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Home
 */
public class updateStudent extends HttpServlet {

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
            out.println("<title>Servlet updateStudent</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet updateStudent at " + request.getContextPath() + "</h1>");
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
       
      
     //   String dept=request.getParameter("dept");
      String rollno=request.getParameter("rollno");
      
      String dob=request.getParameter("dob");
      String caste=request.getParameter("caste");
      String community=request.getParameter("community");
      String pincome=request.getParameter("pincome");
      String religion=request.getParameter("religion");
      String nationality=request.getParameter("nationality");
      String mothertongue=request.getParameter("mothertongue");
      String clubmember=request.getParameter("clubmember");
      String boardingpt=request.getParameter("boardingpt");  
      
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
      String lgpincode=request.getParameter("pincode");
      
      String odtf=request.getParameter("odtf");
      String odin=request.getParameter("odin");
      String odprevinst=request.getParameter("odprevinst");
      String odgrp=request.getParameter("odgrp");
      String odyoa=request.getParameter("odyoa");
      String odyor=request.getParameter("odyor");
      String odct=request.getParameter("odct");
      String odboard=request.getParameter("odboard");
      String odmoi=request.getParameter("odmoi");
      String odreason=request.getParameter("odreason");
      
      String pddoe=request.getParameter("pddoe");
      String pdfs=request.getParameter("pdfs");
      String pdpn=request.getParameter("pdpn");
      
      String vddoe=request.getParameter("vddoe");
      String vdtype=request.getParameter("vdtype");
      String vdvn=request.getParameter("vdvn");
      
      String regno=request.getParameter("regno");
      String stuname=request.getParameter("stuname");
      String gender=request.getParameter("gender");
      String bloodgrp=request.getParameter("bloodgroup");
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
      Connection conn;
      Statement stmt;
      PreparedStatement pstmt;
      String sql1="update student_general set dob="+"?"+", caste='"+caste+"', community='"+community+"', parents_annual_income='"+pincome+"', religion='"+religion+"', nationality='"+nationality+"', mother_tongue='"+mothertongue+"', club_member='"+clubmember+"', boardingpt='"+boardingpt+"' where rollno like '"+rollno+"'";
      String sql2="update student_academic_details set tenscl='"+school10+"', tenmrks='"+marks10+"', tenboard='"+board10+"', tenmed='"+med10+"', tenyop='"+yop10+"', twlscl='"+school12+"', twlmrks='"+marks12+"', twlboard='"+board12+"', twlmed='"+med12+"', twlyop='"+yop12+"', dipcoll='"+dipcoll+"', dipmrks='"+dipmark+"', dipboard='"+dipboard+"', dipmed='"+dipmed+"', dipyop='"+dipyop+"' where rollno like '"+rollno+"'";
      String sql3="update student_admission_details set doa="+"?"+", adminallotment='"+adminalot+"', govt_mang='"+counormn+"', overallrank='"+orank+"', community_rank='"+crank+"', sports_admin='"+sadmission+"', gamename='"+gname+"', MOI='"+moi+"',scholarship='"+scholarship+"' where rollno like '"+rollno+"'";
      String sql4="update student_contact_details set Doorno='"+doorno+"', street='"+street+"', area='"+area+"', city='"+city+"',district='"+district+"', state='"+state+"', country='"+country+"', pincode='"+pincode+"' where rollno like '"+rollno+"'";
      String sql5="update student_father_details set fathers_name='"+fathername+"', qualification='"+qualification+"', occupation='"+occupation+"', designation='"+designation+"', address='"+address+"', landline='"+landline+"', mobile='"+mobile+"', mailid='"+mail+"' where rollno like '"+rollno+"'";
      String sql6="update student_mother_details set mothers_name='"+mothername+"', qualification='"+mqualification+"', occupation='"+moccupation+"', designation='"+mdesignation+"', address='"+maddress+"', landline='"+mlandline+"', mobileno='"+mmobile+"', mailid='"+mmail+"' where rollno like '"+rollno+"'";
      String sql7="update student_local_guardian set name='"+lgname+"', phno='"+lgphno+"', Doorno='"+lgdoorno+"', streetname='"+lgstreet+"', area='"+lgarea+"', city='"+lgcity+"', pincode='"+lgpincode+"' where rollno like '"+rollno+"'";
      String sql8="update student_other_details set transfer_from_other_inst='"+odtf+"', instname='"+odin+"', prev_addr='"+odprevinst+"', `group`='"+odgrp+"', yearadm='"+odyoa+"', yearrelif='"+odyor+"',course_completed_in_time='"+odct+"',boardofstudy='"+odboard+"',medium='"+odmoi+"',reason_for_discontinuation='"+odreason+"' where rollno like '"+rollno+"'";
      String sql9="update student_passport_details set doe="+"?"+",forgn='"+pdfs+"',passno='"+pdpn+"' where rollno like '"+rollno+"'";      
      String sql10="update student_visa_details set doe="+"?"+",visano='"+vdvn+"',typeofvisa='"+vdtype+"' where rollno like '"+rollno+"'";
      String sql11="update student_personal set regno='"+regno+"', name='"+stuname+"',gender='"+gender+"', bloodgrp='"+bloodgrp+"', batch='"+batch+"',course='"+course+"',dept='"+dept+"',sec='"+sec+"',mobileno='"+stumobile+"',mailid='"+stumail+"',food='"+food+"',accomodation='"+acc+"',initial='"+initial+"',model_type='"+modeltype+"' where rollno like '"+rollno+"'";
      
      String formname=request.getParameter("formtype");
       int update=0;
       
      try
      {
           String clg = (String)request.getSession().getAttribute("clg");
      
          conn=new dbcon(clg).getConnection(dept);   
      stmt=conn.createStatement();
      if(formname.equals("general"))
      {
     pstmt=conn.prepareStatement(sql1);
       if(dob!=null)
         pstmt.setDate(1,Date.valueOf(dob));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
      
       update+=pstmt.executeUpdate();
   
    
      }
      if(formname.equals("academic"))
      {
     update+=stmt.executeUpdate(sql2);
           }
      if(formname.equals("admission"))
      {
      pstmt=conn.prepareStatement(sql3);
     
          if(doa!=null)
      {pstmt.setDate(1,Date.valueOf(doa));}
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
     
      }
      if(formname.equals("contact"))
      {
     update+=stmt.executeUpdate(sql4);
      }
      if(formname.equals("father"))
      {
     update+=stmt.executeUpdate(sql5);
      }
      if(formname.equals("mother"))
      {
    update+= stmt.executeUpdate(sql6);
      }
      if(formname.equals("local"))
      {
   update+=  stmt.executeUpdate(sql7);
      }
      if(formname.equals("other"))
      {
  update+=   stmt.executeUpdate(sql8);
      }
      if(formname.equals("passport"))
      {
  pstmt=conn.prepareStatement(sql9);
                    if(pddoe!=null && pddoe!="")
                        pstmt.setDate(1,Date.valueOf(pddoe));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
      }
      if(formname.equals("visa"))
      {
    pstmt=conn.prepareStatement(sql10);
      if(vddoe!=null && vddoe!="")
                       pstmt.setDate(1,Date.valueOf(vddoe));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
       update+=pstmt.executeUpdate();
      }
      if(formname.equals("personal"))
      {
    update+=stmt.executeUpdate(sql11);
      }
      if(update!=0)
          response.getWriter().println("Successfully updated!");
      else
          response.getWriter().println("Error updating data!");
      }
      catch(Exception e)
      {
          response.getWriter().println("Error updating data!"+e);
      e.printStackTrace();
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

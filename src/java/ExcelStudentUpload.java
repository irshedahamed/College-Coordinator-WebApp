/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.action.Base;
import com.action.GeneratePassword;
import dbconnection.dbcon;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 *
 * @author Home
 */
public class ExcelStudentUpload extends HttpServlet {

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
            out.println("<title>Servlet ExcelStudentUpload</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ExcelStudentUpload at " + request.getContextPath() + "</h1>");
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
        int update;
        String rollno = new String();
        String dept = new String();
        String dob = new String();
        String caste = new String();
        String community = new String();
        String pincome = new String();
        String religion = new String();
        String nationality = new String();
        String mothertounge = new String();
        String clubmember = new String();
        String school10 = new String();
        String school12 = new String();
        String marks10 = new String();
        String marks12 = new String();
        String dipcoll = new String();
        String dipmarks = new String();
        String ugcollege = new String();
        String ugmarks = new String();
        String pgcollege = new String();
        String pgmarks = new String();
        String doa = new String();
        String adminalot = new String();
        String counormn = new String();
        String orank = new String();
        String crank = new String();
        String sadmission = new String();
        String gname = new String();
        String moi = new String();
        String doorno = new String();
        String street = new String();
        String area = new String();
        String city = new String();
        String district = new String();
        String state = new String();
        String country = new String();
        String pincode = new String();
        String fathername = new String();
        String qualification = new String();
        String occupation = new String();
        String designation = new String();
        String address = new String();
        String landline = new String();
        String mobile = new String();
        String mail = new String();
        String mothername = new String();
        String mqualification = new String();
        String moccupation = new String();
        String mdesignation = new String();
        String maddress = new String();
        String mlandline = new String();
        String mmobile = new String();
        String mmail = new String();
        String localname = new String();
        String lgphno = new String();
        String lgdoorno = new String();
        String lgstreet = new String();
        String lgarea = new String();
        String lgcity = new String();
        String lgdistrict = new String();
        String lgstate = new String();
        String lgcountry = new String();
        String lgpincode = new String();
        String odtf = new String();
        String odin = new String();
        String odaddr = new String();
        String odgroup = new String();
        String odyearadm = new String();
        String odyearrelif = new String();
        String odct = new String();
        String odboard = new String();
        String odmedium = new String();
        String odrfd = new String();
        String pdfs = new String();
        String pdpn = new String();
        String pddoe = new String();
        String vdtype = new String();
        String vdvn = new String();
        String vddoe = new String();
        String stuname = new String();
        String regno = new String();
        String gender = new String();
        String bloodgroup = new String();
        String batch = new String();
        String sec = new String();
        String stumobile = new String();
        String stumail = new String();
        String food = new String();
        String acc = new String();
        String initial = new String();
        String modeltype = new String();
        String tenscl= new String();
        String tenmark= new String();
        String tenboard= new String();
        String tenmed= new String();
        String tenyop= new String();
        String twlscl= new String();
        String twlmark= new String();
        String twlboard= new String();
        String twlmed= new String();
        String twlyop= new String();
        String dipcol= new String();
        String dipmark= new String();
        String dipboard= new String();
        String dipmed= new String();
        String dipyop= new String();
        String boardingpt= new String();

        String UPLOAD_DIRECTORY = "hello";
        String name = "";
         

        if (ServletFileUpload.isMultipartContent(request)) {
            try {

                List<FileItem> multiparts = new ServletFileUpload(
                        new DiskFileItemFactory()).parseRequest(request);

                for (FileItem item : multiparts) {

                    if (!item.isFormField()) {
                        UPLOAD_DIRECTORY = Base.path+"/temp/";
                        File file = new File(UPLOAD_DIRECTORY);
                        Boolean a = file.mkdirs();

                        name = new File(item.getName()).getName();

                        item.write(new File(UPLOAD_DIRECTORY  + name));
                    }

                }
                 //response.getWriter().println("fileuploaded   "+name);
                InputStream ExcelFileToRead = new FileInputStream(UPLOAD_DIRECTORY +name);
                //response.getWriter().print("file ");
                XSSFWorkbook wb = new XSSFWorkbook(ExcelFileToRead);
                //response.getWriter().print("accepted");
                Iterator sheets = wb.sheetIterator();
                XSSFSheet sheet = (XSSFSheet) sheets.next();
                Iterator rows = sheet.rowIterator();
                XSSFRow row;
                //response.getWriter().print("before"+rows.hasNext());
                Statement stmt,stmt1;
                PreparedStatement pstmt;
      
                 Class.forName("com.mysql.jdbc.Driver").newInstance();
                
                rows.next();
                 while (rows.hasNext()) {
 String clg = (String)request.getSession().getAttribute("clg");
     
                     Connection conn=new dbcon(clg).getConnection(sheet.getSheetName());
                 Connection conn1=new dbcon(clg).getConnection("login");
                 stmt=conn.createStatement();
                 stmt1=conn1.createStatement();
                 
                   // response.getWriter().print("iterating");
                    row = (XSSFRow) rows.next();
                    
                    String data[]=new String[93]; 
   if(row.getCell(0)!=null)
    rollno = row.getCell(0).getStringCellValue();
   else
       rollno ="";
                    if(rollno=="" || rollno==null)
                    break;
                    
                    //response.getWriter().println(rollno);
                    for(int i=1;i<92;i++){
                        if(row.getCell(i)==null)
                        {data[i]="";continue;}
                        if(row.getCell(i).getCellType()==Cell.CELL_TYPE_STRING)
                            data[i]=row.getCell(i).getStringCellValue();
                        else if(row.getCell(i).getCellType()==Cell.CELL_TYPE_BLANK)
                            data[i]="";
                        else if(row.getCell(i).getCellType()==Cell.CELL_TYPE_NUMERIC)
                       data[i]=String.valueOf(row.getCell(i).getNumericCellValue());
                        else
                        response.getWriter().println(i+" Error: "+row.getCell(i).getCellType());
                          
                       // response.getWriter().println(i+" "+data[i]);
                            
                    }
                    
                    //response.getWriter().println("Dob: "+data[2]);
                    dept =data[1];
                    dob =data[2];
                    caste =data[3];
                    community =data[4];
                    pincome =data[5];
                    religion =data[6];
                    nationality =data[7];
                    mothertounge =data[8];
                    clubmember =data[9];
                    doa =data[10];
                    adminalot =data[11];
                    counormn =data[12];
                    orank =data[13];
                    crank =data[14];
                    sadmission =data[15];
                    gname =data[16];
                    moi =data[17];
                    doorno =data[18];
                    street =data[19];
                    area =data[20];
                    city =data[21];
                    district =data[22];
                    state =data[23];
                    country =data[24];
                    pincode =data[25];
                    fathername =data[26];
                    qualification =data[27];
                    occupation =data[28];
                    designation =data[29];
                    address =data[30];
                    landline =data[31];
                    mobile =data[32];
                    mail =data[33];
                    mothername =data[34];
                    mqualification =data[35];
                    moccupation =data[36];
                    mdesignation =data[37];
                    maddress =data[38];
                    mlandline =data[39];
                    mmobile =data[40];
                    mmail =data[41];
                    localname =data[42];
                    lgphno =data[43];
                    lgdoorno =data[44];
                    lgstreet =data[45];
                    lgarea =data[46];
                    lgcity =data[47];
                    lgpincode =data[48];
                    odtf =data[49];
                    odin =data[50];
                    odaddr =data[51];
                    odgroup =data[52];
                    odyearadm =data[53];
                    odyearrelif =data[54];
                    odct =data[55];
                    odboard =data[56];
                    odmedium =data[57];
                    odrfd =data[58];
                    pdfs =data[59];
                    pdpn =data[60];
                    pddoe =data[61];
                    vdtype =data[62];
                    vdvn =data[63];
                    vddoe =data[64];
                    stuname =data[65];
                    regno =data[66];
                    gender =data[67];
                    bloodgroup =data[68];
                    batch =data[69];
                    sec =data[70];
                    stumobile =data[71];
                    stumail =data[72];
                    food =data[73];
                    acc =data[74];
                    initial =data[75];
                    modeltype = "gen";
                    tenscl=data[76];
                     tenmark=data[77];
                    tenboard=data[78];
                    tenmed=data[79];
                    tenyop=data[80];
                    twlscl=data[81];
                    twlmark=data[82];
         twlboard=data[83];
        twlmed=data[84];
         twlyop=data[85];
         dipcol=data[86];
         dipmark=data[87];
         dipboard=data[88];
         dipmed=data[89];
         dipyop=data[90];
         boardingpt=data[91];

                 response.getWriter().println(rollno);
                    //response.getWriter().println(dob);
                  
                    
                    
                   
                    
                    
                    try{
      String sql="delete from student_login_details  where rollno='"+rollno+"'";
      stmt1.execute(sql);
       sql="insert into student_login_details values('"+rollno+"','"+GeneratePassword.next()+"')";
      stmt1.execute(sql);
      
      String sql1="insert into student_general values('"+rollno+"',"+"?"+",'"+caste+"','"+community
              +"','"+pincome+"','"+religion+"','"+nationality+"','"+mothertounge+"','"+clubmember+"','"+boardingpt
              +"')";
      
      String sql2="insert into student_academic_details values('"+rollno+"','"+tenscl+"','"+tenmark+"','"+tenboard
              +"','"+tenmed+"','"+tenyop+"','"+twlscl+"','"+twlmark+"','"+twlboard+"','"+twlmed+"','"+twlyop
              +"','"+dipcol+"','"+dipmark+"','"+dipboard+"','"+dipmed+"','"+dipyop
              +"')";
      
      String sql3="insert into student_admission_details values('"+rollno+"',"+"?"+",'"+adminalot
              +"','"+counormn+"','"+orank+"','"+crank+"','"+sadmission+"','"+gname+"','"+moi
              +"','NA')";
      
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
      
      String sql8="insert into student_other_details values('"+rollno+"','"+odtf+"','"+odin+"','"+odaddr
              +"','"+odgroup+"','"+odyearadm+"','"+odyearrelif+"','"+odct+"','"+odboard+"','"+odmedium+"','"+odrfd
              +"')";
      
      String sql9="insert into student_passport_details values('"+rollno+"',"+"?"+",'"+pdfs+"','"+pdpn
              +"')";
      
      String sql10="insert into student_visa_details values('"+rollno+"',"+"?"+",'"+vdvn+"','"+vdtype
              +"')";

      String sql11="insert into student_personal values('"+rollno+"','"+regno.trim()+"','"+stuname+"','"+gender+"','"+bloodgroup
              +"','"+batch+"','"+"B.E"+"','"+dept+"','"+sec+"','"+stumobile+"','"+stumail+"','"+food
              +"','"+acc+"','"+initial+"','"+modeltype
              +"')";
      
      update=0;
      pstmt=conn.prepareStatement(sql1);
      //update+=stmt.executeUpdate(sql1);
       if(dob!=null)
         pstmt.setDate(1,Date.valueOf(dob));
       else
           pstmt.setNull(1, java.sql.Types.DATE);
      
       update+=pstmt.executeUpdate();
       
      update+=stmt.executeUpdate(sql2);
      
      //update+=stmt.executeUpdate(sql3);
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
      //update+=stmt.executeUpdate(sql9);
      
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
          
                response.getWriter().println("Successfully Added!!"+rollno);
      
      if(stmt!=null)
                            stmt.close();
                              if(conn!=null)
                                ;//conn.close();
                                if(stmt1!=null)
                            stmt1.close();
                              if(conn1!=null)
                                conn1.close();
      
      }catch(Exception e){
          try {
                e.printStackTrace();
                Connection con1=new dbcon(clg).getConnection(sheet.getSheetName());
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
                
                response.getWriter().print("Some Error Occured!!:  "+e);
                        if(del!=null)
                            del.close();
                        if(con1!=null)
                            ;//con1.close();
                        if(stmt!=null)
                            stmt.close();
                              if(conn!=null)
                                ;//conn.close();
                                if(stmt1!=null)
                            stmt1.close();
                              if(conn1!=null)
                                conn1.close();
                               
              
              
          } catch (Exception ex) {
          ex.printStackTrace();
          }
      }

                }

            } catch (Exception e) {
                   
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

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
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


/**
 *
 * @author aravind
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)      // 100 MB
public class excelprofileupdate extends HttpServlet {

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
            out.println("<title>Servlet subjectallocupdate</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet subjectallocupdate at " + request.getContextPath() + "</h1>");
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
    private static final long serialVersionUID = 205242440643911308L;

    /**
     * Directory where uploaded files will be saved, its relative to the web
     * application directory.
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
        String ayear ="";
        String course ="";
        String dept = "";
        String batch = "";
        String sem = "";
        String subject = "";
        String subcode = "";
       
        String notes = "";
        String formtype="";
        String desc="";
        String id="";
       
        int update;
        XSSFSheet sheet=null;
String name="";
String UPLOAD_DIRECTORY="hello";
        
       if(ServletFileUpload.isMultipartContent(request)){
            try {
                
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                    
                    if(!item.isFormField()){
                                  UPLOAD_DIRECTORY = Base.path+"/temp/";
    File file = new File(UPLOAD_DIRECTORY);
 Boolean a = file.mkdirs();
            
                        name = new File(item.getName()).getName();
                        
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                    }
                    
                    
                }
           
               //File uploaded successfully
               
    
        InputStream ExcelFileToRead = new FileInputStream(UPLOAD_DIRECTORY+name);
		XSSFWorkbook  wb = new XSSFWorkbook(ExcelFileToRead);
		
		XSSFWorkbook test = new XSSFWorkbook(); 
		Iterator sheets = wb.sheetIterator();
                while(sheets.hasNext())
                {
                   
                  
		sheet = (XSSFSheet) sheets.next();
                String name1=sheet.getSheetName();
                Connection con = new dbconnection.dbcon().getConnection(name1);  
                Statement st = con.createStatement();
                Statement stmt1;
                Connection conn1=new dbcon().getConnection("login");
                 stmt1=conn1.createStatement();
                
		XSSFRow row; 
		XSSFCell cell;

		Iterator rows = sheet.rowIterator();
                
rows.next();
		while (rows.hasNext())
		{
			row=(XSSFRow) rows.next();
                        
			Iterator cells = row.cellIterator();
                        
                       id = row.getCell(0).getStringCellValue();
                        
                        response.getWriter().println(id);
                        
                           String sql1="insert into staff_personal_details(rollno,name,dept,addr,mobileno,eid) values('"+id+"','"+row.getCell(1).getStringCellValue()+"','"+row.getCell(2).getStringCellValue()+"','"+row.getCell(3).getStringCellValue()+"','"+row.getCell(4).getStringCellValue()+"','"+row.getCell(23).getStringCellValue()+"')";
                           String sql2="insert into staff_ug_details(rollno,dr,yr,course,cgpa,clg,university) values('"+id+"','"+row.getCell(5).getStringCellValue()+"','"+row.getCell(6).getStringCellValue()+"','"+row.getCell(7).getStringCellValue()+"','"+row.getCell(8).getStringCellValue()+"','"+row.getCell(9).getStringCellValue()+"','"+row.getCell(10).getStringCellValue()+"')";
                           String sql3="insert into staff_pg_details(rollno,dr1,yr1,course1,cgpa1,clg1,university1) values('"+id+"','"+row.getCell(11).getStringCellValue()+"','"+row.getCell(12).getStringCellValue()+"','"+row.getCell(13).getStringCellValue()+"','"+row.getCell(14).getStringCellValue()+"','"+row.getCell(15).getStringCellValue()+"','"+row.getCell(16).getStringCellValue()+"')";
                           String sql4="insert into staff_phd_details(rollno,dr2,yr2,university,tt) values('"+id+"','"+row.getCell(17).getStringCellValue()+"','"+row.getCell(18).getStringCellValue()+"','"+row.getCell(19).getStringCellValue()+"','"+row.getCell(20).getStringCellValue()+"')";
                    //       String sql5="insert into staff_journals_details(rollno,noc,yop) values('"+id+"','"+row.getCell(21).getStringCellValue()+"','"+row.getCell(22).getStringCellValue()+"')";
                           String sql6="insert into staff_table values('"+row.getCell(1)+"','"+id+"')";
                           //String sql7="insert into staff_experience_details values('"+id+"','"+row.getCell(24).getStringCellValue()+"','"+row.getCell(25).getStringCellValue()+"','"+row.getCell(26).getStringCellValue()+"','"+row.getCell(27).getStringCellValue()+"','"+row.getCell(28).getStringCellValue()+"')";
                           //String sql8="insert into staff_conference_details values('"+id+"','"+row.getCell(29).getStringCellValue()+"','"+row.getCell(30).getStringCellValue()+"','"+row.getCell(31).getStringCellValue()+"')";
                                   
                           response.getWriter().println(sql2);
                           response.getWriter().println(sql3);
                           response.getWriter().println(sql4);
                      //   response.getWriter().println(sql5);
                           response.getWriter().println(sql6);
                      //     response.getWriter().println(sql7);
                           //response.getWriter().print(sql8);
                           
                           
                           update=0;
                           
                     String sqllogin = "delete from staff_login_details  where staffid='" + id + "'";
                    stmt1.execute(sqllogin);
                    sqllogin = "insert into staff_login_details values('" + id + "','" + GeneratePassword.next() + "')";
                    stmt1.execute(sqllogin);
                     try{
                           update+=st.executeUpdate(sql1);
                           update+=st.executeUpdate(sql2);
                           update+=st.executeUpdate(sql3);
                           update+=st.executeUpdate(sql4);
                        //   update+=st.executeUpdate(sql5);
                           update+=st.executeUpdate(sql6);
                        //   update+=st.executeUpdate(sql7);
                          // update+=st.executeUpdate(sql8);
                           if(update==5)
          
                response.getWriter().println("Successfully Added!!"+id);
                         
                              if(stmt1!=null)
                            stmt1.close();
                                if(st!=null)
                            st.close();
                              if(conn1!=null)
                                conn1.close();
                              if(con!=null)
                                con.close();
                     }catch(Exception e)
                     {
                                response.getWriter().println("exceptionthrown");
                         e.printStackTrace();
                         try{
                         Connection con1=new dbcon().getConnection(sheet.getSheetName());
                    Statement del=con1.createStatement();
                    String sql="delete from staff_personal_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_ug_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_pg_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_phd_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_journals_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_table where staffid='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_experience_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    sql="delete from staff_conference_details where rollno='"+id+"'";
                    del.executeUpdate(sql);
                    
                    
                } catch (SQLException ex) {
                   ex.printStackTrace();
                }
                     }
                }         
                
                }
        
        

    }catch(Exception e)
    {
                
                    e.printStackTrace();
                    
    }
       }
    }

    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    
}

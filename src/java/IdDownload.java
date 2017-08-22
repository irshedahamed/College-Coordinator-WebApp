

import Actor.Student;
import com.action.Base;
import com.action.Find;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import static org.apache.tomcat.jni.Time.sec;

/**
 *
 * @author fedexfan
 */
public class IdDownload extends HttpServlet {

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
            out.println("<title>Servlet IdDownload</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Sucess</h1>");
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
        ServletContext con=getServletContext();
       String s1= con.getRealPath("/store/");
        System.out.println(s1);
         String fromD = request.getParameter("from");
          SimpleDateFormat fromDate = new SimpleDateFormat("dd-mm-yyyy");
          Date from = new Date();
        try {
            from = fromDate.parse(fromD);
        } catch (ParseException ex) {
           ex.printStackTrace();
        }
        String toD = request.getParameter("to");
          SimpleDateFormat toDate = new SimpleDateFormat("dd-mm-yyyy");
          Date to = new Date();
        try {
            to = fromDate.parse(toD);
        } catch (ParseException ex) {
            ex.printStackTrace();
        }
        String[] department=new String[25];
            department = Find.Depts;
               String batch=request.getParameter("batch");
                 PrintWriter out = response.getWriter();
                 String fName = "Id_Data.xls";
//                 String filepath = "/home/fedexfan/tomcat/files/"; 
String filepath = s1;  
HSSFWorkbook hwb=new HSSFWorkbook();
HSSFSheet sheet =  hwb.createSheet("new sheet");
HSSFRow rowhead=   sheet.createRow((short)0);
rowhead.createCell((short) 0).setCellValue("Roll No");
rowhead.createCell((short) 1).setCellValue("Name");
rowhead.createCell((short) 2).setCellValue("Course");
rowhead.createCell((short) 3).setCellValue("Boarding Point");
rowhead.createCell((short) 4).setCellValue("BG");
rowhead.createCell((short) 5).setCellValue("DOB");
rowhead.createCell((short) 6).setCellValue("Father's Phone");
rowhead.createCell((short) 7).setCellValue("Address 1");
rowhead.createCell((short) 8).setCellValue("Address 2");
rowhead.createCell((short) 9).setCellValue("District");
rowhead.createCell((short) 10).setCellValue("Pin");
String sec = "%";
 int j = 1;
for(String dept:department){
             for (Student s : Student.getAll(dept,batch,sec)) {
                
                 String dD = s.getAdmissionDetails().getDoa();
                 SimpleDateFormat daDate = new SimpleDateFormat("dd-mm-yyyy");
                 Date dao = new Date();
                 if(dD!=null){
                     try {
                         dao = daDate.parse(dD);
                     } catch (ParseException ex) {
                         ex.printStackTrace();
                     }
                     
                     if((from.compareTo(dao)>=0)&&to.compareTo(dao)<=0){
                         String d;
                         String e = Find.sdept(s.getId());
                         if(Find.sdept(s.getId()).equals("it")){
                             d = "BTech - "+e;
                         }
                         else {
                             d = "B.E "+e;
                         }
                         HSSFRow row = sheet.createRow((short)j);
                         row.createCell((short) 0).setCellValue(s.getId().toUpperCase());
                         row.createCell((short) 1).setCellValue(s.getName());
                         row.createCell((short) 2).setCellValue(d);
                         row.createCell((short) 3).setCellValue(s.getGeneral().getBoarding());
                         row.createCell((short) 4).setCellValue(s.getBloodgrp());
                         row.createCell((short) 5).setCellValue(Find.getFormattedDate(s.getGeneral().getDob()).replace("-","."));
                         row.createCell((short) 6).setCellValue(s.getFatherDetails().getMobile());
                         row.createCell((short) 7).setCellValue(s.getContact().getDoorno()+","+s.getContact().getStreet());
                         row.createCell((short) 8).setCellValue(s.getContact().getArea());
                         row.createCell((short) 9).setCellValue(s.getContact().getDistrict());
                         row.createCell((short) 10).setCellValue(s.getContact().getPincode());
                         j++;       }}
             }
}
FileOutputStream fileOut =  new FileOutputStream(filepath+fName);
hwb.write(fileOut);
fileOut.close(); 
response.setContentType("APPLICATION/OCTET-STREAM");   
    response.setHeader("Content-Disposition","attachment; filename=\"" + fName + "\"");   
      
    FileInputStream fileInputStream = new FileInputStream(filepath + fName);  
                
    int i;   
    while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
    }   
    fileInputStream.close();   
    out.close();   
   
    
out.println("Your excel file has been generated!");
        //processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *ee
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

  

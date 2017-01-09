/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Actor.Guest;
import General.BarCode;
import General.Entry;
import com.action.Base;
import com.action.Find;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.BarcodeEAN;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

/**
 *
 * @author Home
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 10, // 10 MB
        maxFileSize = 1024 * 1024 * 50, // 50 MB
        maxRequestSize = 1024 * 1024 * 100)      // 100 MB
public class GuestEntry extends HttpServlet {

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
            out.println("<title>Servlet GuestEntry</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet GuestEntry at " + request.getContextPath() + "</h1>");
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
        String  UPLOAD_DIRECTORY = Base.path+"/"+request.getSession().getAttribute("username").toString()+"/";
        if(ServletFileUpload.isMultipartContent(request)){
            try {
                
                List<FileItem> multiparts = new ServletFileUpload(
                                         new DiskFileItemFactory()).parseRequest(request);
              
                for(FileItem item : multiparts){
                  
                      if(!item.isFormField()){
                          
                    
                     File file = new File(UPLOAD_DIRECTORY);
    
            file.mkdirs(); 
          String  name = new File(item.getName()).getName();
                        
                        item.write( new File(UPLOAD_DIRECTORY + File.separator + name));
                      }
                    
                
                        
                }
            }catch(Exception e){
                e.printStackTrace();
            }
            
            response.getWriter().print("Written");
        }else{
       
        Guest g=new Guest();
        String action=request.getParameter("entry");
       String category=request.getParameter("category");
       g.setSex(request.getParameter("sex"));
        g.setMail(request.getParameter("mail"));
        g.setReason(request.getParameter("reason"));
        g.setMeet(request.getParameter("hperson"));
        g.setMobile(request.getParameter("mobile"));
        g.setCity(request.getParameter("city"));
        g.setAddress(request.getParameter("address"));
       g.setName(request.getParameter("gname"));
       g.setNumpeople(request.getParameter("numpeople"));
       g.insert(category, UPLOAD_DIRECTORY+"photo.jpg");
       
      Entry e=new Entry();
       boolean act=false;
       e.setRollno(g.getId());
       
        if(action.equals("IN"))
             act=e.insertin();
         else if(action.equals("OUT"))
             act=e.insertout();
       
            if(act)
            {
            File file = new File(UPLOAD_DIRECTORY + File.separator +"photo.jpg");
            file.renameTo(new File(UPLOAD_DIRECTORY + File.separator +g.getId()+".jpg"));
                  BarCode.generate(g.getId(),getServletContext().getRealPath("")+File.separator+request.getSession().getAttribute("username").toString()+"/");
         response.setContentType("text/html;charset=UTF-8");
       
         response.getWriter().write("<div style=\"width:300px\n" +
"              ;border:black 1px solid;\">\n" +
"  <div style=\"background-color:grey;height:50px;margin-top:-21px;\">\n" +
"    \n" +
"");
          response.getWriter().write("<center>    <h1 style=\"color:white;padding: 5px;\">"+Find.category(g.getId()).toUpperCase()+"</h1><br></center></div>");
          
                    FileInputStream input=new FileInputStream(new File(Base.path+"/reception/"+g.getId()+".jpg"));
                    File op=new File("./guest.jpg");
                    //op.createNewFile();
                    FileOutputStream output=new FileOutputStream(new File(getServletContext().getRealPath("")+"/guest.jpg"));
                    int b ;
                    while((b=input.read())!=-1)
                    output.write(b);
                    
                    response.getWriter().print("   <img src=\"guest.jpg\" height=\"95px\" width='50%' onerror=\"this.onerror=null;this.src='images/face.jpg';\" />");
                    
                  
         response.getWriter().write("<div style=\"float:right;width:50%;overflow-wrap: break-word;\">");
            response.getWriter().write("Name: "+g.getName()+"<br>");
            
        
          response.getWriter().write("Meet: "+g.getMeet()+"<br>");
           response.getWriter().write("Reason: "+g.getReason()+"<br>");
            response.getWriter().write("Time : "+new Date());
        response.getWriter().write("</div>");
        
     //   response.getWriter().write("<br><br><center><img src='/"+request.getSession().getAttribute("username").toString()+"/"+g.getId()+"/"+g.getId()+".png'  /><br><br>");
      response.getWriter().write("<center><br>");
           
      response.getWriter().write(g.getId()+"</center><br>");
       response.getWriter().write("</div>");
            }
       else
           response.getWriter().println("<center><h1>Entry Failed</h1>");
        
        
        
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

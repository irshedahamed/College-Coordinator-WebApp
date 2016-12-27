/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import Actor.Guest;
import General.BarCode;
import General.Entry;
import com.action.Base;
import com.lowagie.text.Image;
import com.lowagie.text.pdf.BarcodeEAN;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
                        
                        item.write( new File(UPLOAD_DIRECTORY + name));
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
                  BarCode.generate(g.getId(),getServletContext().getRealPath("")+File.separator+request.getSession().getAttribute("username").toString()+"/");
         response.setContentType("text/html;charset=UTF-8");
          response.getWriter().write("<h1>"+category+"</h1><br>");
        response.getWriter().write("<img src='/"+request.getSession().getAttribute("username").toString()+"/"+g.getId()+"/"+g.getId()+".png'  />");
      
            }
       else
           response.getWriter().println("<center><h1>Entry Failed</h1>");
        
        
        /*  //For Delete 
        String path=getServletContext().getRealPath("")+"/"+request.getSession().getAttribute("username").toString()+"/"+id+File.separator;
      
      File dir=new File(path);
        if(dir.exists())
           FileUtils.deleteDirectory(dir);
        */
        
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

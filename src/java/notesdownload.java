    import java.io.*;  
    import javax.servlet.ServletException;  
    import javax.servlet.http.*;  
      
    public class notesdownload extends HttpServlet {  
      
    public void doGet(HttpServletRequest request, HttpServletResponse response)  
                throws ServletException, IOException {  
      
    response.setContentType("text/html");  
    PrintWriter out = response.getWriter();  
  //  String sz=request.getSession().getAttribute("size").toString();
    String str=request.getParameter("ind1");
    
      
    String filepath = request.getSession().getAttribute("path").toString();
   
    
    response.setContentType("APPLICATION/OCTET-STREAM");   
    response.setHeader("Content-Disposition","attachment; filename=\"" + str + "\"");   
      
    FileInputStream fileInputStream = new FileInputStream(filepath + str);  
                
    int i;   
    while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
    }   
    fileInputStream.close();   
    out.close();   
   
    }
      
    }  